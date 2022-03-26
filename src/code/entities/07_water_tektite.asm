; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
WaterTektiteSpriteVariants::
.variant0
    db $70, $00
    db $70, $20
.variant1
    db $72, $00
    db $72, $20

WaterTektiteEntityHandler::
    ld   de, WaterTektiteSpriteVariants           ; $7535: $11 $2D $75
    call RenderActiveEntitySpritesPair            ; $7538: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $753B: $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ; $753E: $CD $C3 $7D
    ldh  a, [hFrameCounter]                       ; $7541: $F0 $E7
    rra                                           ; $7543: $1F
    rra                                           ; $7544: $1F
    rra                                           ; $7545: $1F
    rra                                           ; $7546: $1F

.jr_7547
    and  $01                                      ; $7547: $E6 $01
    call SetEntitySpriteVariant                   ; $7549: $CD $0C $3B
    call UpdateEntityPosWithSpeed_07              ; $754C: $CD $0A $7E
    call label_3B23                               ; $754F: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $7552: $21 $A0 $C2
    add  hl, bc                                   ; $7555: $09
    ld   a, [hl]                                  ; $7556: $7E
    and  $0F                                      ; $7557: $E6 $0F
    jr   z, .jr_756A                              ; $7559: $28 $0F

    call GetEntityTransitionCountdown             ; $755B: $CD $05 $0C
    ld   [hl], $10                                ; $755E: $36 $10
    call ClearEntitySpeed                         ; $7560: $CD $7F $3D
    call IncrementEntityState                     ; $7563: $CD $12 $3B
    xor  a                                        ; $7566: $AF
    ld   [hl], a                                  ; $7567: $77
    ldh  [hActiveEntityState], a                  ; $7568: $E0 $F0

.jr_756A
    call label_3B39                               ; $756A: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $756D: $F0 $F0
    JP_TABLE                                      ; $756F
._00 dw func_007_7576                             ; $7570
._01 dw func_007_7597                             ; $7572
._02 dw func_007_75B7                             ; $7574

func_007_7576::
    call GetEntityTransitionCountdown             ; $7576: $CD $05 $0C
    jr   nz, .ret_7596                            ; $7579: $20 $1B

    ld   [hl], $20                                ; $757B: $36 $20
    call IncrementEntityState                     ; $757D: $CD $12 $3B
    call GetRandomByte                            ; $7580: $CD $0D $28
    and  $02                                      ; $7583: $E6 $02
    dec  a                                        ; $7585: $3D
    ld   hl, wEntitiesPrivateState1Table          ; $7586: $21 $B0 $C2
    add  hl, bc                                   ; $7589: $09
    ld   [hl], a                                  ; $758A: $77
    call GetRandomByte                            ; $758B: $CD $0D $28
    and  $02                                      ; $758E: $E6 $02
    dec  a                                        ; $7590: $3D
    ld   hl, wEntitiesPrivateState2Table          ; $7591: $21 $C0 $C2
    add  hl, bc                                   ; $7594: $09
    ld   [hl], a                                  ; $7595: $77

.ret_7596
    ret                                           ; $7596: $C9

func_007_7597::
    call GetEntityTransitionCountdown             ; $7597: $CD $05 $0C
    jp   z, IncrementEntityState                  ; $759A: $CA $12 $3B

    and  $01                                      ; $759D: $E6 $01
    jr   nz, ret_007_75B6                         ; $759F: $20 $15

    ld   hl, wEntitiesPrivateState1Table          ; $75A1: $21 $B0 $C2

.jr_75A4
    add  hl, bc                                   ; $75A4: $09
    ld   a, [hl]                                  ; $75A5: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $75A6: $21 $40 $C2
    add  hl, bc                                   ; $75A9: $09
    add  [hl]                                     ; $75AA: $86
    ld   [hl], a                                  ; $75AB: $77
    ld   hl, wEntitiesPrivateState2Table          ; $75AC: $21 $C0 $C2
    add  hl, bc                                   ; $75AF: $09
    ld   a, [hl]                                  ; $75B0: $7E
    call GetEntitySpeedYAddress                   ; $75B1: $CD $05 $40
    add  [hl]                                     ; $75B4: $86
    ld   [hl], a                                  ; $75B5: $77

ret_007_75B6:
    ret                                           ; $75B6: $C9

func_007_75B7::
    ldh  a, [hFrameCounter]                       ; $75B7: $F0 $E7
    and  $01                                      ; $75B9: $E6 $01
    jr   nz, ret_007_75DD                         ; $75BB: $20 $20

    ld   hl, wEntitiesSpeedXTable                 ; $75BD: $21 $40 $C2
    add  hl, bc                                   ; $75C0: $09
    ld   a, [hl]                                  ; $75C1: $7E
    and  a                                        ; $75C2: $A7
    jr   nz, .jr_75CF                             ; $75C3: $20 $0A

    call IncrementEntityState                     ; $75C5: $CD $12 $3B
    ld   [hl], b                                  ; $75C8: $70
    call GetEntityTransitionCountdown             ; $75C9: $CD $05 $0C
    ld   [hl], $10                                ; $75CC: $36 $10
    ret                                           ; $75CE: $C9

.jr_75CF
    call func_007_75D6                            ; $75CF: $CD $D6 $75
    call GetEntitySpeedYAddress                   ; $75D2: $CD $05 $40
    ld   a, [hl]                                  ; $75D5: $7E

func_007_75D6::
    bit  7, a                                     ; $75D6: $CB $7F
    jr   z, .jr_75DC                              ; $75D8: $28 $02

    inc  [hl]                                     ; $75DA: $34
    inc  [hl]                                     ; $75DB: $34

.jr_75DC
    dec  [hl]                                     ; $75DC: $35

ret_007_75DD:
    ret                                           ; $75DD: $C9
