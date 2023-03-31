; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BoomerangSpriteVariants:: ; $4451
.variant0
    db $38, OAM_GBC_PAL_4 | OAMF_PAL1
    db $38, OAM_GBC_PAL_4 | OAMF_PAL1 | OAMF_XFLIP
.variant1
    db $A4, OAM_GBC_PAL_4 | OAMF_PAL1
    db $FF, OAM_GBC_PAL_7 | OAMF_PAL1 | OAMF_BANK1 | OAMF_YFLIP | OAMF_XFLIP | OAMF_PRI
.variant2
    db $38, OAM_GBC_PAL_4 | OAMF_PAL1 | OAMF_YFLIP
    db $38, OAM_GBC_PAL_4 | OAMF_PAL1 | OAMF_YFLIP | OAMF_XFLIP
.variant3
    db $FF, OAM_GBC_PAL_7 | OAMF_PAL1 | OAMF_BANK1 | OAMF_YFLIP | OAMF_XFLIP | OAMF_PRI
    db $A4, OAM_GBC_PAL_4 | OAMF_PAL1 | OAMF_XFLIP

BoomerangEntityHandler::
    ; wActiveProjectileCount = 1
    ld   a, $01                                   ; $4461: $3E $01
    ld   [wActiveProjectileCount], a              ; $4463: $EA $4D $C1

    ld   de, BoomerangSpriteVariants              ; $4466: $11 $51 $44
    call RenderActiveEntitySpritesPair            ; $4469: $CD $C0 $3B
    call ReturnIfNonInteractive_19                ; $446C: $CD $3D $7D
    call PlayBoomerangSfx_trampoline              ; $446F: $CD $F8 $29
    ldh  a, [hFrameCounter]                       ; $4472: $F0 $E7
    and  $03                                      ; $4474: $E6 $03
    jr   nz, .jr_4481                             ; $4476: $20 $09

    ld   hl, wEntitiesSpriteVariantTable          ; $4478: $21 $B0 $C3
    add  hl, bc                                   ; $447B: $09
    ld   a, [hl]                                  ; $447C: $7E
    inc  a                                        ; $447D: $3C
    and  $03                                      ; $447E: $E6 $03
    ld   [hl], a                                  ; $4480: $77

.jr_4481
    ld   a, $08                                   ; $4481: $3E $08
    ld   [wC19E], a                               ; $4483: $EA $9E $C1
    call label_3B7B                               ; $4486: $CD $7B $3B

.jr_4489
    call UpdateEntityPosWithSpeed_19              ; $4489: $CD $B8 $7D
    call label_3B2E                               ; $448C: $CD $2E $3B
    call func_019_44CC                            ; $448F: $CD $CC $44
    ldh  a, [hActiveEntityState]                  ; $4492: $F0 $F0
    JP_TABLE                                      ; $4494
._00 dw func_019_4499                             ; $4495
._01 dw func_019_44BA                             ; $4497

func_019_4499::
    call GetEntityTransitionCountdown             ; $4499: $CD $05 $0C
    jr   nz, .jr_44A6                             ; $449C: $20 $08

    ld   a, $08                                   ; $449E: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $44A0: $CD $AA $3B
    jp   IncrementEntityState                     ; $44A3: $C3 $12 $3B

.jr_44A6
    ld   hl, wEntitiesCollisionsTable             ; $44A6: $21 $A0 $C2
    add  hl, bc                                   ; $44A9: $09
    ld   a, [hl]                                  ; $44AA: $7E
    and  a                                        ; $44AB: $A7
    jr   z, .ret_44B9                             ; $44AC: $28 $0B

    call GetEntityTransitionCountdown             ; $44AE: $CD $05 $0C
    ld   [hl], b                                  ; $44B1: $70
    call func_019_45A3                            ; $44B2: $CD $A3 $45
    ld   a, JINGLE_SWORD_POKING                   ; $44B5: $3E $07
    ldh  [hJingle], a                             ; $44B7: $E0 $F2

.ret_44B9
    ret                                           ; $44B9: $C9

func_019_44BA::
    ldh  a, [hFrameCounter]                       ; $44BA: $F0 $E7
    and  $03                                      ; $44BC: $E6 $03
    jr   nz, .jr_44C5                             ; $44BE: $20 $05

    ld   a, $20                                   ; $44C0: $3E $20
    call ApplyVectorTowardsLink_trampoline        ; $44C2: $CD $AA $3B

.jr_44C5
    call label_3B44                               ; $44C5: $CD $44 $3B
    ret  nc                                       ; $44C8: $D0

    jp   ClearEntityStatus_19                     ; $44C9: $C3 $61 $7E

func_019_44CC::
    ld   a, [wIsIndoor]                           ; $44CC: $FA $A5 $DB
    and  a                                        ; $44CF: $A7
    ret  nz                                       ; $44D0: $C0

.jr_44D1
    ldh  a, [hObjectUnderEntity]                  ; $44D1: $F0 $AF
    cp   $D3                                      ; $44D3: $FE $D3
    jr   z, .jr_44DA                              ; $44D5: $28 $03

    cp   $5C                                      ; $44D7: $FE $5C
    ret  nz                                       ; $44D9: $C0

.jr_44DA
    ld   hl, wEntitiesCollisionsTable             ; $44DA: $21 $A0 $C2
    add  hl, bc                                   ; $44DD: $09
    ld   [hl], b                                  ; $44DE: $70
    ldh  a, [hDungeonFloorTile]                   ; $44DF: $F0 $E9
    ld   e, a                                     ; $44E1: $5F
    ld   d, b                                     ; $44E2: $50
    call func_014_5526_trampoline                 ; $44E3: $CD $78 $21
    ldh  a, [hIntersectedObjectLeft]              ; $44E6: $F0 $CE
    add  $08                                      ; $44E8: $C6 $08
    ldh  [hMultiPurpose0], a                      ; $44EA: $E0 $D7
    ldh  a, [hIntersectedObjectTop]               ; $44EC: $F0 $CD
    add  $10                                      ; $44EE: $C6 $10
    ldh  [hMultiPurpose1], a                      ; $44F0: $E0 $D8
    ld   a, TRANSCIENT_VFX_SMOKE                  ; $44F2: $3E $08
    call AddTranscientVfx                         ; $44F4: $CD $C7 $0C
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ; $44F7: $3E $13
    ldh  [hNoiseSfx], a                           ; $44F9: $E0 $F4
    ret                                           ; $44FB: $C9
