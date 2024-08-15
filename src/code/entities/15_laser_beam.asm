Data_015_75CE::
    db   $F8, $08, $00, $00

Data_015_75D2::
    db   $00, $00, $08, $F8

LaserBeamEntityHandler::
    call ReturnIfNonInteractive_15                ;; 15:75D6 $CD $0D $7B
    ldh  a, [hActiveEntityState]                  ;; 15:75D9 $F0 $F0
    and  a                                        ;; 15:75DB $A7
    jr   nz, .jr_75E1                             ;; 15:75DC $20 $03

    call CheckLinkCollisionWithProjectile_trampoline ;; 15:75DE $CD $4F $3B

.jr_75E1
    call UpdateEntityPosWithSpeed_15              ;; 15:75E1 $CD $88 $7B
    call label_3B2E                               ;; 15:75E4 $CD $2E $3B
    ld   hl, wEntitiesCollisionsTable             ;; 15:75E7 $21 $A0 $C2
    add  hl, bc                                   ;; 15:75EA $09
    ld   a, [hl]                                  ;; 15:75EB $7E
    and  a                                        ;; 15:75EC $A7
    jr   z, jr_015_7639                           ;; 15:75ED $28 $4A

    push hl                                       ;; 15:75EF $E5
    ldh  a, [hActiveEntityPosX]                   ;; 15:75F0 $F0 $EE
    ldh  [hMultiPurpose0], a                      ;; 15:75F2 $E0 $D7
    ldh  a, [hActiveEntityPosY]                   ;; 15:75F4 $F0 $EF
    ldh  [hMultiPurpose1], a                      ;; 15:75F6 $E0 $D8
    ld   a, TRANSCIENT_VFX_SWORD_POKE             ;; 15:75F8 $3E $05
    call AddTranscientVfx                         ;; 15:75FA $CD $C7 $0C
    pop  hl                                       ;; 15:75FD $E1
    ld   a, [hl]                                  ;; 15:75FE $7E
    cp   $02                                      ;; 15:75FF $FE $02
    jp   nz, ClearEntityStatus_15                 ;; 15:7601 $C2 $31 $7C

    ld   [hl], $00                                ;; 15:7604 $36 $00
    ld   hl, wEntitiesStateTable                  ;; 15:7606 $21 $90 $C2
    add  hl, bc                                   ;; 15:7609 $09
    ld   [hl], a                                  ;; 15:760A $77
    ldh  a, [hLinkDirection]                      ;; 15:760B $F0 $9E
    and  $02                                      ;; 15:760D $E6 $02
    jr   nz, .jr_7616                             ;; 15:760F $20 $05

    ld   hl, wEntitiesSpeedXTable                 ;; 15:7611 $21 $40 $C2
    jr   jr_015_7619                              ;; 15:7614 $18 $03

.jr_7616
    ld   hl, wEntitiesSpeedYTable                 ;; 15:7616 $21 $50 $C2

jr_015_7619:
    add  hl, bc                                   ;; 15:7619 $09
    ld   a, [hl]                                  ;; 15:761A $7E
    cpl                                           ;; 15:761B $2F
    inc  a                                        ;; 15:761C $3C
    ld   [hl], a                                  ;; 15:761D $77
    call ResetSpinAttack                          ;; 15:761E $CD $AF $0C
    ld   a, $10                                   ;; 15:7621 $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 15:7623 $EA $3E $C1
    ldh  a, [hLinkDirection]                      ;; 15:7626 $F0 $9E
    ld   e, a                                     ;; 15:7628 $5F
    ld   d, b                                     ;; 15:7629 $50
    ld   hl, Data_015_75CE                        ;; 15:762A $21 $CE $75
    add  hl, de                                   ;; 15:762D $19
    ld   a, [hl]                                  ;; 15:762E $7E
    ldh  [hLinkSpeedX], a                         ;; 15:762F $E0 $9A
    ld   hl, Data_015_75D2                        ;; 15:7631 $21 $D2 $75
    add  hl, de                                   ;; 15:7634 $19
    ld   a, [hl]                                  ;; 15:7635 $7E
    ldh  [hLinkSpeedY], a                         ;; 15:7636 $E0 $9B
    ret                                           ;; 15:7638 $C9

jr_015_7639:
    ldh  a, [hActiveEntityPosX]                   ;; 15:7639 $F0 $EE
    add  $04                                      ;; 15:763B $C6 $04
    ldh  [hMultiPurpose0], a                      ;; 15:763D $E0 $D7
    ldh  a, [hActiveEntityPosY]                   ;; 15:763F $F0 $EF
    ldh  [hMultiPurpose1], a                      ;; 15:7641 $E0 $D8
    ld   a, TRANSCIENT_VFX_LASER_BEAM             ;; 15:7643 $3E $06
    call AddTranscientVfx                         ;; 15:7645 $CD $C7 $0C
    ld   [hl], $10                                ;; 15:7648 $36 $10
    ret                                           ;; 15:764A $C9
