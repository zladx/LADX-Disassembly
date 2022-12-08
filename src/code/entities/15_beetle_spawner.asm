BeetleSpawnerEntityHandler::
    ld   hl, wEntitiesPrivateState3Table          ; $750D: $21 $D0 $C2
    add  hl, bc                                   ; $7510: $09
    ld   a, [hl]                                  ; $7511: $7E
    and  a                                        ; $7512: $A7
    jp   nz, label_015_757F                       ; $7513: $C2 $7F $75

    call ReturnIfNonInteractive_15                ; $7516: $CD $0D $7B
    call func_015_7BDB                            ; $7519: $CD $DB $7B
    add  $20                                      ; $751C: $C6 $20
    cp   $40                                      ; $751E: $FE $40
    jr   nc, .ret_756E                            ; $7520: $30 $4C

    call func_015_7BEB                            ; $7522: $CD $EB $7B
    add  $20                                      ; $7525: $C6 $20
    cp   $40                                      ; $7527: $FE $40
    jr   nc, .ret_756E                            ; $7529: $30 $43

    ld   hl, wEntitiesInertiaTable                ; $752B: $21 $D0 $C3
    add  hl, bc                                   ; $752E: $09
    ld   a, [hl]                                  ; $752F: $7E
    inc  a                                        ; $7530: $3C
    ld   [hl], a                                  ; $7531: $77
    and  $3F                                      ; $7532: $E6 $3F
    jr   nz, .ret_756E                            ; $7534: $20 $38

    ld   a, ENTITY_BEETLE_SPAWNER                 ; $7536: $3E $B2
    ld   e, $04                                   ; $7538: $1E $04
    call SpawnNewEntityInRange_trampoline         ; $753A: $CD $98 $3B
    jr   c, .ret_756E                             ; $753D: $38 $2F

    ldh  a, [hMultiPurpose0]                      ; $753F: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7541: $21 $00 $C2
    add  hl, de                                   ; $7544: $19
    ld   [hl], a                                  ; $7545: $77
    ldh  a, [hMultiPurpose1]                      ; $7546: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7548: $21 $10 $C2
    add  hl, de                                   ; $754B: $19
    ld   [hl], a                                  ; $754C: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $754D: $21 $40 $C3
    add  hl, de                                   ; $7550: $19
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW          ; $7551: $36 $12
    ld   hl, wEntitiesPrivateState3Table          ; $7553: $21 $D0 $C2
    add  hl, de                                   ; $7556: $19
    ld   [hl], $01                                ; $7557: $36 $01
    ld   hl, wEntitiesTransitionCountdownTable    ; $7559: $21 $E0 $C2
    add  hl, de                                   ; $755C: $19
    ld   [hl], $18                                ; $755D: $36 $18
    ld   hl, wEntitiesPrivateCountdown1Table      ; $755F: $21 $F0 $C2
    add  hl, de                                   ; $7562: $19
    ld   [hl], $20                                ; $7563: $36 $20
    push bc                                       ; $7565: $C5
    ld   c, e                                     ; $7566: $4B
    ld   b, d                                     ; $7567: $42
    ld   a, $08                                   ; $7568: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $756A: $CD $AA $3B
    pop  bc                                       ; $756D: $C1

.ret_756E
    ret                                           ; $756E: $C9

Data_015_756F::
    db   $08, $F8, $00, $00

Data_015_7573::
    db   $00, $00, $F8, $08

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown058SpriteVariants::
.variant0
    db $70, $00
    db $72, $00
.variant1
    db $72, $20
    db $70, $20

label_015_757F:
    ld   de, Unknown058SpriteVariants             ; $757F: $11 $77 $75
    call RenderActiveEntitySpritesPair            ; $7582: $CD $C0 $3B
    call ReturnIfNonInteractive_15                ; $7585: $CD $0D $7B
    call ApplyRecoilIfNeeded_15                   ; $7588: $CD $3E $7B
    ldh  a, [hFrameCounter]                       ; $758B: $F0 $E7
    rra                                           ; $758D: $1F
    rra                                           ; $758E: $1F
    rra                                           ; $758F: $1F
    and  $01                                      ; $7590: $E6 $01
    call SetEntitySpriteVariant                   ; $7592: $CD $0C $3B
    call UpdateEntityPosWithSpeed_15              ; $7595: $CD $88 $7B
    call GetEntityPrivateCountdown1               ; $7598: $CD $00 $0C
    jr   nz, .jr_75A0                             ; $759B: $20 $03

    call label_3B23                               ; $759D: $CD $23 $3B

.jr_75A0
    call label_3B39                               ; $75A0: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $75A3: $CD $05 $0C
    jr   nz, .jr_75CB                             ; $75A6: $20 $23

    call GetRandomByte                            ; $75A8: $CD $0D $28
    and  $1F                                      ; $75AB: $E6 $1F
    add  $20                                      ; $75AD: $C6 $20
    ld   [hl], a                                  ; $75AF: $77
    call GetRandomByte                            ; $75B0: $CD $0D $28
    and  $03                                      ; $75B3: $E6 $03
    ld   e, a                                     ; $75B5: $5F
    ld   d, b                                     ; $75B6: $50
    ld   hl, Data_015_756F                        ; $75B7: $21 $6F $75
    add  hl, de                                   ; $75BA: $19
    ld   a, [hl]                                  ; $75BB: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $75BC: $21 $40 $C2
    add  hl, bc                                   ; $75BF: $09
    ld   [hl], a                                  ; $75C0: $77
    ld   hl, Data_015_7573                        ; $75C1: $21 $73 $75
    add  hl, de                                   ; $75C4: $19
    ld   a, [hl]                                  ; $75C5: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $75C6: $21 $50 $C2
    add  hl, bc                                   ; $75C9: $09
    ld   [hl], a                                  ; $75CA: $77

.jr_75CB
    ret                                           ; $75CB: $C9

    ld   a, $01                                   ; $75CC: $3E $01
