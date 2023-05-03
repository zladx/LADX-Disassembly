; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
FishSpriteVariants::
.variant0
    db $FF, $00
    db $FF, $00
.variant1
    db $54, $00
    db $56, $00
.variant2
    db $58, $00
    db $5A, $00
.variant3
    db $56, $20
    db $54, $20
.variant4
    db $5A, $20
    db $58, $20

Data_015_44B3::
    db   $5C, $00, $5C, $20, $5E, $00, $5E, $00

FishEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ; $44BB: $F0 $F1
    cp   $FF                                      ; $44BD: $FE $FF
    jr   z, jr_015_44D7                           ; $44BF: $28 $16

    cp   $05                                      ; $44C1: $FE $05
    jr   c, .jr_44D1                              ; $44C3: $38 $0C

    sub  $05                                      ; $44C5: $D6 $05
    ldh  [hActiveEntitySpriteVariant], a          ; $44C7: $E0 $F1
    ld   de, Data_015_44B3                        ; $44C9: $11 $B3 $44
    call RenderActiveEntitySprite                 ; $44CC: $CD $77 $3C
    jr   jr_015_44D7                              ; $44CF: $18 $06

.jr_44D1
    ld   de, FishSpriteVariants                   ; $44D1: $11 $9F $44
    call RenderActiveEntitySpritesPair            ; $44D4: $CD $C0 $3B

jr_015_44D7:
    call ReturnIfNonInteractive_15                ; $44D7: $CD $0D $7B
    call ApplyRecoilIfNeeded_15                   ; $44DA: $CD $3E $7B
    call UpdateEntityPosWithSpeed_15              ; $44DD: $CD $88 $7B
    call label_3B23                               ; $44E0: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $44E3: $F0 $F0
    JP_TABLE                                      ; $44E5
._00 dw func_015_44EC                             ; $44E6
._01 dw func_015_4500                             ; $44E8
._02 dw func_015_4553                             ; $44EA

func_015_44EC::
    ld   hl, wEntitiesSpeedXTable                 ; $44EC: $21 $40 $C2
    add  hl, bc                                   ; $44EF: $09
    ld   [hl], $08                                ; $44F0: $36 $08
    call GetEntityTransitionCountdown             ; $44F2: $CD $05 $0C
    call GetRandomByte                            ; $44F5: $CD $0D $28
    and  $7F                                      ; $44F8: $E6 $7F
    add  $40                                      ; $44FA: $C6 $40
    ld   [hl], a                                  ; $44FC: $77
    jp   IncrementEntityState                     ; $44FD: $C3 $12 $3B

func_015_4500::
    call label_3B44                               ; $4500: $CD $44 $3B
    call GetEntityTransitionCountdown             ; $4503: $CD $05 $0C
    jr   nz, jr_015_4530                          ; $4506: $20 $28

    ld   hl, wEntitiesPhysicsFlagsTable           ; $4508: $21 $40 $C3
    add  hl, bc                                   ; $450B: $09
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ; $450C: $36 $12
    ld   hl, wEntitiesSpeedZTable                 ; $450E: $21 $20 $C3
    add  hl, bc                                   ; $4511: $09
    ld   [hl], $18                                ; $4512: $36 $18
    call IncrementEntityState                     ; $4514: $CD $12 $3B
    ld   hl, wEntitiesSpeedXTable                 ; $4517: $21 $40 $C2
    add  hl, bc                                   ; $451A: $09
    sla  [hl]                                     ; $451B: $CB $26

func_015_451D::
    ld   a, JINGLE_WATER_SPLASH                   ; $451D: $3E $0E
    ldh  [hJingle], a                             ; $451F: $E0 $F2
    ldh  a, [hActiveEntityPosX]                   ; $4521: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $4523: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $4525: $F0 $EC
    add  $00                                      ; $4527: $C6 $00
    ldh  [hMultiPurpose1], a                      ; $4529: $E0 $D8
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ; $452B: $3E $01
    jp   AddTranscientVfx                         ; $452D: $C3 $C7 $0C

jr_015_4530:
    ld   hl, wEntitiesCollisionsTable             ; $4530: $21 $A0 $C2
    add  hl, bc                                   ; $4533: $09
    ld   a, [hl]                                  ; $4534: $7E
    and  $03                                      ; $4535: $E6 $03
    jr   z, .jr_4541                              ; $4537: $28 $08

    ld   hl, wEntitiesSpeedXTable                 ; $4539: $21 $40 $C2
    add  hl, bc                                   ; $453C: $09
    ld   a, [hl]                                  ; $453D: $7E
    cpl                                           ; $453E: $2F
    inc  a                                        ; $453F: $3C
    ld   [hl], a                                  ; $4540: $77

.jr_4541
    ld   hl, wEntitiesSpeedXTable                 ; $4541: $21 $40 $C2
    add  hl, bc                                   ; $4544: $09
    ld   e, $06                                   ; $4545: $1E $06
    ld   a, [hl]                                  ; $4547: $7E
    and  $80                                      ; $4548: $E6 $80
    jr   z, .jr_454E                              ; $454A: $28 $02

    ld   e, $05                                   ; $454C: $1E $05

.jr_454E
    ld   a, e                                     ; $454E: $7B
    jp   SetEntitySpriteVariant                   ; $454F: $C3 $0C $3B

    ret                                           ; $4552: $C9

func_015_4553::
    call label_3B39                               ; $4553: $CD $39 $3B
    call AddEntityZSpeedToPos_15                  ; $4556: $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ; $4559: $21 $20 $C3
    add  hl, bc                                   ; $455C: $09
    dec  [hl]                                     ; $455D: $35
    ld   hl, wEntitiesPosZTable                   ; $455E: $21 $10 $C3
    add  hl, bc                                   ; $4561: $09
    ld   a, [hl]                                  ; $4562: $7E
    and  $80                                      ; $4563: $E6 $80
    jr   z, .jr_4588                              ; $4565: $28 $21

    ld   [hl], b                                  ; $4567: $70
    call func_015_451D                            ; $4568: $CD $1D $45
    call GetEntityTransitionCountdown             ; $456B: $CD $05 $0C
    call GetRandomByte                            ; $456E: $CD $0D $28
    and  $7F                                      ; $4571: $E6 $7F
    add  $50                                      ; $4573: $C6 $50
    ld   [hl], a                                  ; $4575: $77
    ld   hl, wEntitiesSpeedXTable                 ; $4576: $21 $40 $C2
    add  hl, bc                                   ; $4579: $09
    sra  [hl]                                     ; $457A: $CB $2E
    ld   hl, wEntitiesPhysicsFlagsTable           ; $457C: $21 $40 $C3
    add  hl, bc                                   ; $457F: $09
    ld   [hl], 2 | ENTITY_PHYSICS_PROJECTILE_NOCLIP | ENTITY_PHYSICS_SHADOW ; $4580: $36 $52
    call IncrementEntityState                     ; $4582: $CD $12 $3B
    ld   [hl], $01                                ; $4585: $36 $01
    ret                                           ; $4587: $C9

.jr_4588
    ld   e, $01                                   ; $4588: $1E $01
    ld   hl, wEntitiesSpeedXTable                 ; $458A: $21 $40 $C2
    add  hl, bc                                   ; $458D: $09
    ld   a, [hl]                                  ; $458E: $7E
    and  $80                                      ; $458F: $E6 $80
    jr   nz, .jr_4595                             ; $4591: $20 $02

    ld   e, $03                                   ; $4593: $1E $03

.jr_4595
    ld   hl, wEntitiesSpeedZTable                 ; $4595: $21 $20 $C3
    add  hl, bc                                   ; $4598: $09
    ld   a, [hl]                                  ; $4599: $7E
    and  $80                                      ; $459A: $E6 $80
    jr   z, .jr_459F                              ; $459C: $28 $01

    inc  e                                        ; $459E: $1C

.jr_459F
    ld   a, e                                     ; $459F: $7B
    jp   SetEntitySpriteVariant                   ; $45A0: $C3 $0C $3B
