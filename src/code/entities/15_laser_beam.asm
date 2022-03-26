Data_015_75CE::
    db   $F8, $08, $00, $00

Data_015_75D2::
    db   $00, $00, $08, $F8

LaserBeamEntityHandler::
    call ReturnIfNonInteractive_15                ; $75D6: $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ; $75D9: $F0 $F0
    and  a                                        ; $75DB: $A7
    jr   nz, .jr_75E1                             ; $75DC: $20 $03

    call CheckLinkCollisionWithProjectile_trampoline ; $75DE: $CD $4F $3B

.jr_75E1
    call UpdateEntityPosWithSpeed_15              ; $75E1: $CD $88 $7B
    call label_3B2E                               ; $75E4: $CD $2E $3B
    ld   hl, wEntitiesCollisionsTable             ; $75E7: $21 $A0 $C2
    add  hl, bc                                   ; $75EA: $09
    ld   a, [hl]                                  ; $75EB: $7E
    and  a                                        ; $75EC: $A7
    jr   z, jr_015_7639                           ; $75ED: $28 $4A

    push hl                                       ; $75EF: $E5
    ldh  a, [hActiveEntityPosX]                   ; $75F0: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $75F2: $E0 $D7
    ldh  a, [hActiveEntityPosY]                   ; $75F4: $F0 $EF
    ldh  [hMultiPurpose1], a                      ; $75F6: $E0 $D8
    ld   a, TRANSCIENT_VFX_SWORD_POKE             ; $75F8: $3E $05
    call AddTranscientVfx                         ; $75FA: $CD $C7 $0C
    pop  hl                                       ; $75FD: $E1
    ld   a, [hl]                                  ; $75FE: $7E
    cp   $02                                      ; $75FF: $FE $02
    jp   nz, ClearEntityStatus_15                 ; $7601: $C2 $31 $7C

    ld   [hl], $00                                ; $7604: $36 $00
    ld   hl, wEntitiesStateTable                  ; $7606: $21 $90 $C2
    add  hl, bc                                   ; $7609: $09
    ld   [hl], a                                  ; $760A: $77
    ldh  a, [hLinkDirection]                      ; $760B: $F0 $9E
    and  $02                                      ; $760D: $E6 $02
    jr   nz, .jr_7616                             ; $760F: $20 $05

    ld   hl, wEntitiesSpeedXTable                 ; $7611: $21 $40 $C2
    jr   jr_015_7619                              ; $7614: $18 $03

.jr_7616
    ld   hl, wEntitiesSpeedYTable                 ; $7616: $21 $50 $C2

jr_015_7619:
    add  hl, bc                                   ; $7619: $09
    ld   a, [hl]                                  ; $761A: $7E
    cpl                                           ; $761B: $2F
    inc  a                                        ; $761C: $3C
    ld   [hl], a                                  ; $761D: $77
    call ResetSpinAttack                          ; $761E: $CD $AF $0C
    ld   a, $10                                   ; $7621: $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $7623: $EA $3E $C1
    ldh  a, [hLinkDirection]                      ; $7626: $F0 $9E
    ld   e, a                                     ; $7628: $5F
    ld   d, b                                     ; $7629: $50
    ld   hl, Data_015_75CE                        ; $762A: $21 $CE $75
    add  hl, de                                   ; $762D: $19
    ld   a, [hl]                                  ; $762E: $7E
    ldh  [hLinkSpeedX], a                         ; $762F: $E0 $9A
    ld   hl, Data_015_75D2                        ; $7631: $21 $D2 $75
    add  hl, de                                   ; $7634: $19
    ld   a, [hl]                                  ; $7635: $7E
    ldh  [hLinkSpeedY], a                         ; $7636: $E0 $9B
    ret                                           ; $7638: $C9

jr_015_7639:
    ldh  a, [hActiveEntityPosX]                   ; $7639: $F0 $EE
    add  $04                                      ; $763B: $C6 $04
    ldh  [hMultiPurpose0], a                      ; $763D: $E0 $D7
    ldh  a, [hActiveEntityPosY]                   ; $763F: $F0 $EF
    ldh  [hMultiPurpose1], a                      ; $7641: $E0 $D8
    ld   a, TRANSCIENT_VFX_LASER_BEAM             ; $7643: $3E $06
    call AddTranscientVfx                         ; $7645: $CD $C7 $0C
    ld   [hl], $10                                ; $7648: $36 $10
    ret                                           ; $764A: $C9
