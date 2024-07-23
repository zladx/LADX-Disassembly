WreckingBallSprite::
    db $4E, OAM_GBC_PAL_0 | OAMF_PAL0
    db $4E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

WreckingBallEntityHandler::
IF __PATCH_0__
    ldh  a, [hMapId]
    cp   MAP_EAGLES_TOWER
    jr   nz, .default

    push bc
    sla  c
    sla  c
    ld   hl, wEntitiesHitboxPositionTable
    add  hl, bc
    inc  hl
    ld   a, $08
    ld   [hl+], a
    inc  hl
    ld   [hl], a
    pop  bc
ENDC

.default
    ldh  a, [hActiveEntityStatus]                 ; $6007: $F0 $EA
    cp   ENTITY_STATUS_LIFTED                     ; $6009: $FE $07
    jr   nz, notLifted                            ; $600B: $20 $1D

    ld   a, [wLinkMotionState]                    ; $600D: $FA $1C $C1
    cp   LINK_MOTION_REVOLVING_DOOR               ; $6010: $FE $05
    jr   nz, .jr_6019                             ; $6012: $20 $05

    ld   a, $10                                   ; $6014: $3E $10
    ld   [wC5AE], a                               ; $6016: $EA $AE $C5

.jr_6019
    ldh  a, [hMapRoom]                            ; $6019: $F0 $F6
    ld   hl, wEntitiesRoomTable                   ; $601B: $21 $E0 $C3
    add  hl, bc                                   ; $601E: $09
    ld   [hl], a                                  ; $601F: $77
    ld   hl, wEntitiesPosXSignTable               ; $6020: $21 $20 $C2
    add  hl, bc                                   ; $6023: $09
    ld   [hl], b                                  ; $6024: $70
    ld   hl, wEntitiesPosYSignTable               ; $6025: $21 $30 $C2
    add  hl, bc                                   ; $6028: $09
    ld   [hl], b                                  ; $6029: $70

notLifted:
    ld   de, WreckingBallSprite                        ; $602A: $11 $03 $60
    call RenderActiveEntitySpritesPair            ; $602D: $CD $C0 $3B
    ld   a, [wRoomTransitionState]                ; $6030: $FA $24 $C1
    and  a                                        ; $6033: $A7
    ret  nz                                       ; $6034: $C0

    ldh  a, [hMapRoom]                            ; $6035: $F0 $F6
    ld   [wWreckingBallRoom], a                   ; $6037: $EA $6F $DB
    ldh  a, [hActiveEntityPosX]                   ; $603A: $F0 $EE
    ld   [wWreckingBallPosX], a                   ; $603C: $EA $70 $DB
    ldh  a, [hActiveEntityPosY]                   ; $603F: $F0 $EF
    ld   [wWreckingBallPosY], a                   ; $6041: $EA $71 $DB
    ld   a, [wDialogState]                        ; $6044: $FA $9F $C1
    and  a                                        ; $6047: $A7
    ret  nz                                       ; $6048: $C0

    ldh  a, [hActiveEntityStatus]                 ; $6049: $F0 $EA
    cp   ENTITY_STATUS_FALLING                    ; $604B: $FE $02
    ret  z                                        ; $604D: $C8

    call DecrementEntityIgnoreHitsCountdown       ; $604E: $CD $56 $0C
    call label_3B70                               ; $6051: $CD $70 $3B
    call UpdateEntityPosWithSpeed_07              ; $6054: $CD $0A $7E
    call AddEntityZSpeedToPos_07                  ; $6057: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $605A: $21 $20 $C3
    add  hl, bc                                   ; $605D: $09
    dec  [hl]                                     ; $605E: $35
    dec  [hl]                                     ; $605F: $35
    ld   hl, wEntitiesPosZTable                   ; $6060: $21 $10 $C3
    add  hl, bc                                   ; $6063: $09
    ld   a, [hl]                                  ; $6064: $7E
    ldh  [hDungeonFloorTile], a                   ; $6065: $E0 $E9
    and  $80                                      ; $6067: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $6069: $E0 $E8
    jr   z, .hitGroundEnd                         ; $606B: $28 $22

    ld   [hl], b                                  ; $606D: $70
    ld   hl, wEntitiesSpeedZTable                 ; $606E: $21 $20 $C3
    add  hl, bc                                   ; $6071: $09
    ld   a, [hl]                                  ; $6072: $7E
    sra  a                                        ; $6073: $CB $2F
    cpl                                           ; $6075: $2F
    cp   $07                                      ; $6076: $FE $07
    jr   c, .stopBouncing                         ; $6078: $38 $08

    push af                                       ; $607A: $F5
    ld   a, NOISE_SFX_CLINK                       ; $607B: $3E $17
    ldh  [hNoiseSfx], a                           ; $607D: $E0 $F4
    pop  af                                       ; $607F: $F1
    jr   .stopBouncingEnd                         ; $6080: $18 $01

.stopBouncing
    xor  a                                        ; $6082: $AF

.stopBouncingEnd
    ld   [hl], a                                  ; $6083: $77
    ld   hl, wEntitiesSpeedXTable                 ; $6084: $21 $40 $C2
    add  hl, bc                                   ; $6087: $09
    sra  [hl]                                     ; $6088: $CB $2E
    call GetEntitySpeedYAddress                   ; $608A: $CD $05 $40
    sra  [hl]                                     ; $608D: $CB $2E

.hitGroundEnd
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $608F: $21 $10 $C4
    add  hl, bc                                   ; $6092: $09
    ld   [hl], $03                                ; $6093: $36 $03
    ld   e, $03                                   ; $6095: $1E $03
    ld   a, e                                     ; $6097: $7B
    ldh  [hActiveEntityFlipAttribute], a          ; $6098: $E0 $ED
    ld   hl, wEntitiesPosYTable                   ; $609A: $21 $10 $C2
    add  hl, bc                                   ; $609D: $09
    ld   a, [hl]                                  ; $609E: $7E
    add  e                                        ; $609F: $83
    ld   [hl], a                                  ; $60A0: $77
    ldh  a, [hActiveEntityPosY]                   ; $60A1: $F0 $EF
    add  e                                        ; $60A3: $83
    ldh  [hActiveEntityPosY], a                   ; $60A4: $E0 $EF
    call DefaultEntityPhysics_trampoline          ; $60A6: $CD $23 $3B
    ldh  a, [hActiveEntityFlipAttribute]          ; $60A9: $F0 $ED
    ld   e, a                                     ; $60AB: $5F
    ld   hl, wEntitiesPosYTable                   ; $60AC: $21 $10 $C2
    add  hl, bc                                   ; $60AF: $09
    ld   a, [hl]                                  ; $60B0: $7E
    sub  e                                        ; $60B1: $93
    ld   [hl], a                                  ; $60B2: $77
    ldh  a, [hActiveEntityPosY]                   ; $60B3: $F0 $EF
    sub  e                                        ; $60B5: $93
    ldh  [hActiveEntityPosY], a                   ; $60B6: $E0 $EF
    ldh  a, [hActiveEntityState]                  ; $60B8: $F0 $F0
    JP_TABLE                                      ; $60BA
._00 dw WreckingBallState0Handler                 ; $60BB
._01 dw WreckingBallState1Handler                 ; $60BD
._02 dw WreckingBallState2Handler                 ; $60BF

; Idle
WreckingBallState0Handler::
    ldh  a, [hDungeonFloorTile]                   ; $60C1: $F0 $E9
    dec  a                                        ; $60C3: $3D
    and  $80                                      ; $60C4: $E6 $80
    jr   z, .notTouchingGround                    ; $60C6: $28 $15

    ld   hl, wEntitiesSpeedYTable                 ; $60C8: $21 $50 $C2
    call .updateSpeed                             ; $60CB: $CD $D1 $60
    ld   hl, wEntitiesSpeedXTable                 ; $60CE: $21 $40 $C2

.updateSpeed
    add  hl, bc                                   ; $60D1: $09
    ld   a, [hl]                                  ; $60D2: $7E
    and  a                                        ; $60D3: $A7
    jr   z, .notTouchingGround                    ; $60D4: $28 $07

    and  $80                                      ; $60D6: $E6 $80
    jr   z, .positiveSpeed                        ; $60D8: $28 $02

    inc  [hl]                                     ; $60DA: $34
    inc  [hl]                                     ; $60DB: $34

.positiveSpeed
    dec  [hl]                                     ; $60DC: $35

.notTouchingGround
    call CheckLinkCollisionWithEnemy_trampoline   ; $60DD: $CD $5A $3B
    jr   nc, .return                              ; $60E0: $30 $51

    ld   a, [wLinkAttackStepAnimationCountdown]   ; $60E2: $FA $9B $C1
    and  a                                        ; $60E5: $A7
    jr   nz, .return                              ; $60E6: $20 $4B

    ld   a, [wInventoryItems.BButtonSlot]         ; $60E8: $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $60EB: $FE $03
    jr   nz, .checkAButtonSlot                    ; $60ED: $20 $08

    ldh  a, [hJoypadState]                        ; $60EF: $F0 $CC
    and  J_B                                      ; $60F1: $E6 $20
    jr   nz, .notGrabbing                         ; $60F3: $20 $0F

    jr   .return                                  ; $60F5: $18 $3C

.checkAButtonSlot
    ld   a, [wInventoryItems.AButtonSlot]         ; $60F7: $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $60FA: $FE $03
    jr   nz, .return                              ; $60FC: $20 $35

    ldh  a, [hJoypadState]                        ; $60FE: $F0 $CC
    and  J_A                                      ; $6100: $E6 $10
    jr   z, .return                               ; $6102: $28 $2F

.notGrabbing
    ld   a, [wC3CF]                               ; $6104: $FA $CF $C3
    and  a                                        ; $6107: $A7
    jr   nz, .return                              ; $6108: $20 $29

IF __PATCH_0__
    ldh  a, [hMovingBlockMoverState]
    and  a
    jr   nz, .return
ENDC

    inc  a                                        ; $610A: $3C
    ld   [wC3CF], a                               ; $610B: $EA $CF $C3
    ldh  a, [hActiveEntityStatus]                 ; $610E: $F0 $EA
    cp   ENTITY_STATUS_LIFTED                     ; $6110: $FE $07
    jr   z, .return                               ; $6112: $28 $1F

    call IncrementEntityState                     ; $6114: $CD $12 $3B
    ld   [hl], $02                                ; $6117: $36 $02
    ld   hl, wEntitiesStatusTable                 ; $6119: $21 $80 $C2
    add  hl, bc                                   ; $611C: $09
    ld   [hl], ENTITY_STATUS_LIFTED               ; $611D: $36 $07
    ld   hl, wEntitiesLiftedTable                 ; $611F: $21 $90 $C4
    add  hl, bc                                   ; $6122: $09
    ld   [hl], b                                  ; $6123: $70
    ldh  a, [hLinkDirection]                      ; $6124: $F0 $9E
    ld   [wC15D], a                               ; $6126: $EA $5D $C1
    call GetEntityTransitionCountdown             ; $6129: $CD $05 $0C
    ld   [hl], $02                                ; $612C: $36 $02
    ld   hl, hWaveSfx                             ; $612E: $21 $F3 $FF
    ld   [hl], WAVE_SFX_LIFT_UP                   ; $6131: $36 $02

.return
    ret                                           ; $6133: $C9

; Lifted
WreckingBallState1Handler::
    ret                                           ; $6134: $C9

; Thrown
WreckingBallState2Handler::
    ldh  a, [hMultiPurposeG]                      ; $6135: $F0 $E8
    and  a                                        ; $6137: $A7
    jr   nz, .touchingGround                          ; $6138: $20 $1F

    ld   hl, wEntitiesCollisionsTable             ; $613A: $21 $A0 $C2
    add  hl, bc                                   ; $613D: $09
    ld   a, [hl]                                  ; $613E: $7E
    and  a                                        ; $613F: $A7
    jr   z, .noCollision                          ; $6140: $28 $22

.collided
    ld   a, JINGLE_SWORD_POKING                   ; $6142: $3E $07
    ldh  [hJingle], a                             ; $6144: $E0 $F2
    ld   hl, wEntitiesSpeedXTable                 ; $6146: $21 $40 $C2
    add  hl, bc                                   ; $6149: $09
    ld   a, [hl]                                  ; $614A: $7E
    cpl                                           ; $614B: $2F
    inc  a                                        ; $614C: $3C
    sra  a                                        ; $614D: $CB $2F
    ld   [hl], a                                  ; $614F: $77
    call GetEntitySpeedYAddress                   ; $6150: $CD $05 $40
    ld   a, [hl]                                  ; $6153: $7E
    cpl                                           ; $6154: $2F
    inc  a                                        ; $6155: $3C
    sra  a                                        ; $6156: $CB $2F
    ld   [hl], a                                  ; $6158: $77

; negative z position
.touchingGround
    ld   hl, wC5D0                                ; $6159: $21 $D0 $C5
    add  hl, bc                                   ; $615C: $09
    ld   [hl], $FF                                ; $615D: $36 $FF
    call IncrementEntityState                     ; $615F: $CD $12 $3B
    ld   [hl], b                                  ; $6162: $70
    ret                                           ; $6163: $C9

; no collision
.noCollision
    call ReturnIfNonInteractive_07                ; $6164: $CD $96 $7D
    ld   a, $0B                                   ; $6167: $3E $0B
    ld   [wC19E], a                               ; $6169: $EA $9E $C1
    call label_3B7B                               ; $616C: $CD $7B $3B
    ld   e, $0F                                   ; $616F: $1E $0F
    ld   d, b                                     ; $6171: $50

.loop
    ld   hl, wEntitiesStatusTable                 ; $6172: $21 $80 $C2
    add  hl, de                                   ; $6175: $19
    ld   a, [hl]                                  ; $6176: $7E
    and  a                                        ; $6177: $A7
    jr   z, .hitPillarEnd                         ; $6178: $28 $0E

    ld   hl, wEntitiesTypeTable                   ; $617A: $21 $A0 $C3
    add  hl, de                                   ; $617D: $19
    ld   a, [hl]                                  ; $617E: $7E
    cp   ENTITY_SMASHABLE_PILLAR                  ; $617F: $FE $A7
    jr   nz, .hitPillarEnd                        ; $6181: $20 $05

    push de                                       ; $6183: $D5
    call WreckingBallHandlePillarCollision        ; $6184: $CD $8F $61
    pop  de                                       ; $6187: $D1

.hitPillarEnd
    dec  e                                        ; $6188: $1D
    ld   a, e                                     ; $6189: $7B
    cp   $FF                                      ; $618A: $FE $FF
    jr   nz, .loop                                ; $618C: $20 $E4

    ret                                           ; $618E: $C9

WreckingBallHandlePillarCollision::
    call GetEntityTransitionCountdown             ; $618F: $CD $05 $0C
    jr   nz, .return                              ; $6192: $20 $39

    ld   hl, wEntitiesPosXTable                   ; $6194: $21 $00 $C2
    add  hl, de                                   ; $6197: $19
    ldh  a, [hActiveEntityPosX]                   ; $6198: $F0 $EE
    sub  [hl]                                     ; $619A: $96
    add  $10                                      ; $619B: $C6 $10
    cp   $20                                      ; $619D: $FE $20
    jr   nc, .return                              ; $619F: $30 $2C

    ld   hl, wEntitiesPosYTable                   ; $61A1: $21 $10 $C2
    add  hl, de                                   ; $61A4: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $61A5: $F0 $EC
    sub  [hl]                                     ; $61A7: $96
    add  $18                                      ; $61A8: $C6 $18
    cp   $28                                      ; $61AA: $FE $28
    jr   nc, .return                              ; $61AC: $30 $1F

    call WreckingBallState2Handler.collided       ; $61AE: $CD $42 $61
    ld   a, NOISE_SFX_D7_PILLAR_COLLAPSE          ; $61B1: $3E $25
    ldh  [hNoiseSfx], a                           ; $61B3: $E0 $F4
    ld   a, JINGLE_STRONG_BUMP                    ; $61B5: $3E $0B
    ldh  [hJingle], a                             ; $61B7: $E0 $F2
    call GetEntityTransitionCountdown             ; $61B9: $CD $05 $0C
    ld   [hl], $10                                ; $61BC: $36 $10
    ld   hl, wEntitiesStateTable                  ; $61BE: $21 $90 $C2
    add  hl, de                                   ; $61C1: $19
    ld   a, [hl]                                  ; $61C2: $7E
    and  a                                        ; $61C3: $A7
    jr   nz, .return                              ; $61C4: $20 $07

    inc  [hl]                                     ; $61C6: $34
    ld   hl, wEntitiesTransitionCountdownTable    ; $61C7: $21 $E0 $C2
    add  hl, de                                   ; $61CA: $19
    ld   [hl], $50                                ; $61CB: $36 $50

.return
    ret                                           ; $61CD: $C9
