BouldersEntityHandler::
    ldh  a, [hActiveEntityState]                  ; $4365: $F0 $F0
    and  a                                        ; $4367: $A7
    jp   nz, label_015_43CA                       ; $4368: $C2 $CA $43

    call ReturnIfNonInteractive_15                ; $436B: $CD $0D $7B
    call GetEntityTransitionCountdown             ; $436E: $CD $05 $0C
    jr   nz, .ret_43AD                            ; $4371: $20 $3A

    call GetRandomByte                            ; $4373: $CD $0D $28
    and  $3F                                      ; $4376: $E6 $3F
    add  $30                                      ; $4378: $C6 $30
    ld   [hl], a                                  ; $437A: $77
    ldh  a, [hLinkPositionY]                      ; $437B: $F0 $99
    cp   $18                                      ; $437D: $FE $18
    ret  c                                        ; $437F: $D8

    ld   a, ENTITY_BOULDERS                       ; $4380: $3E $45
    call SpawnNewEntity_trampoline                ; $4382: $CD $86 $3B
    ret  c                                        ; $4385: $D8

    call GetRandomByte                            ; $4386: $CD $0D $28
    rla                                           ; $4389: $17
    rla                                           ; $438A: $17
    rla                                           ; $438B: $17
    rla                                           ; $438C: $17
    and  $70                                      ; $438D: $E6 $70
    add  $18                                      ; $438F: $C6 $18
    ld   hl, wEntitiesPosXTable                   ; $4391: $21 $00 $C2
    add  hl, de                                   ; $4394: $19
    ld   [hl], a                                  ; $4395: $77
    ld   hl, wEntitiesPosYTable                   ; $4396: $21 $10 $C2
    add  hl, de                                   ; $4399: $19
    ld   [hl], $10                                ; $439A: $36 $10
    ld   hl, wEntitiesPhysicsFlagsTable           ; $439C: $21 $40 $C3
    add  hl, de                                   ; $439F: $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ; $43A0: $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ; $43A2: $21 $50 $C3
    add  hl, de                                   ; $43A5: $19
    set  7, [hl]                                  ; $43A6: $CB $FE
    ld   hl, wEntitiesStateTable                  ; $43A8: $21 $90 $C2
    add  hl, de                                   ; $43AB: $19
    inc  [hl]                                     ; $43AC: $34

.ret_43AD
    ret                                           ; $43AD: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown043SpriteVariants:: ; $43AE
.variant0
    db $5C, $00
    db $5E, $00
.variant1
    db $5E, $20
    db $5C, $20
.variant2
    db $5E, $60
    db $5C, $60
.variant3
    db $5C, $40
    db $5E, $40

Data_015_43BE::
    db   $0C, $F4, $05, $FB

Data_015_43C2::
    db   $08, $0A, $06, $0C

Data_015_43C6::
    db   $18, $20, $1C, $28

label_015_43CA:
    ld   de, Unknown043SpriteVariants             ; $43CA: $11 $AE $43
    call RenderActiveEntitySpritesPair            ; $43CD: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $43D0: $CD $0D $7B
    call DecrementEntityIgnoreHitsCountdown       ; $43D3: $CD $56 $0C
    call label_3B39                               ; $43D6: $CD $39 $3B
    ldh  a, [hFrameCounter]                       ; $43D9: $F0 $E7
    rra                                           ; $43DB: $1F

.jr_43DC
    rra                                           ; $43DC: $1F
    rra                                           ; $43DD: $1F
    and  $03                                      ; $43DE: $E6 $03
    call SetEntitySpriteVariant                   ; $43E0: $CD $0C $3B
    call UpdateEntityPosWithSpeed_15              ; $43E3: $CD $88 $7B
    call AddEntityZSpeedToPos_15                  ; $43E6: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $43E9: $21 $20 $C3
    add  hl, bc                                   ; $43EC: $09
    dec  [hl]                                     ; $43ED: $35
    dec  [hl]                                     ; $43EE: $35
    ld   hl, wEntitiesPosZTable                   ; $43EF: $21 $10 $C3
    add  hl, bc                                   ; $43F2: $09
    ld   a, [hl]                                  ; $43F3: $7E
    and  $80                                      ; $43F4: $E6 $80
    jr   z, jr_015_4430                           ; $43F6: $28 $38

    ld   [hl], b                                  ; $43F8: $70
    call GetRandomByte                            ; $43F9: $CD $0D $28
    and  $03                                      ; $43FC: $E6 $03
    ld   e, a                                     ; $43FE: $5F
    ld   d, b                                     ; $43FF: $50
    ld   hl, Data_015_43BE                        ; $4400: $21 $BE $43
    add  hl, de                                   ; $4403: $19
    ld   a, [hl]                                  ; $4404: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $4405: $21 $40 $C2
    add  hl, bc                                   ; $4408: $09
    ld   [hl], a                                  ; $4409: $77
    call GetRandomByte                            ; $440A: $CD $0D $28
    and  $03                                      ; $440D: $E6 $03
    ld   e, a                                     ; $440F: $5F
    ld   d, b                                     ; $4410: $50

.jr_4411
    ld   hl, Data_015_43C2                        ; $4411: $21 $C2 $43
    add  hl, de                                   ; $4414: $19

.jr_4415
    ld   a, [hl]                                  ; $4415: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $4416: $21 $50 $C2
    add  hl, bc                                   ; $4419: $09
    ld   [hl], a                                  ; $441A: $77
    call GetRandomByte                            ; $441B: $CD $0D $28
    and  $03                                      ; $441E: $E6 $03
    ld   e, a                                     ; $4420: $5F
    ld   d, b                                     ; $4421: $50
    ld   hl, Data_015_43C6                        ; $4422: $21 $C6 $43
    add  hl, de                                   ; $4425: $19
    ld   a, [hl]                                  ; $4426: $7E
    ld   hl, wEntitiesSpeedZTable                 ; $4427: $21 $20 $C3
    add  hl, bc                                   ; $442A: $09
    ld   [hl], a                                  ; $442B: $77
    ld   a, JINGLE_BOUNCE                         ; $442C: $3E $20
    ldh  [hJingle], a                             ; $442E: $E0 $F2

jr_015_4430:
    ldh  a, [hActiveEntityPosX]                   ; $4430: $F0 $EE
    cp   $A8                                      ; $4432: $FE $A8
    jp   nc, ClearEntityStatus_15                 ; $4434: $D2 $31 $7C

    ldh  a, [hActiveEntityVisualPosY]             ; $4437: $F0 $EC
    cp   $84                                      ; $4439: $FE $84
    jp   nc, ClearEntityStatus_15                 ; $443B: $D2 $31 $7C

    ret                                           ; $443E: $C9
