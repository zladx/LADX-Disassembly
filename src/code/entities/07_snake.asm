; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SnakeSpriteVariants::
.variant0
    db $44, $03
    db $46, $03
.variant1
    db $44, $03
    db $48, $03
.variant2
    db $46, $23
    db $44, $23
.variant3
    db $48, $23
    db $44, $23

SnakeEntityHandler::
    ld   hl, wEntitiesDirectionTable              ; $684E: $21 $80 $C3
    add  hl, bc                                   ; $6851: $09
    ldh  a, [hActiveEntitySpriteVariant]          ; $6852: $F0 $F1
    add  [hl]                                     ; $6854: $86
    ldh  [hActiveEntitySpriteVariant], a          ; $6855: $E0 $F1
    ld   de, SnakeSpriteVariants                  ; $6857: $11 $3E $68
    call RenderActiveEntitySpritesPair            ; $685A: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $685D: $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ; $6860: $CD $C3 $7D
    call label_3B39                               ; $6863: $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ; $6866: $CD $0A $7E
    call label_3B23                               ; $6869: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $686C: $21 $A0 $C2
    add  hl, bc                                   ; $686F: $09
    ld   a, [hl]                                  ; $6870: $7E
    and  a                                        ; $6871: $A7
    jr   z, .jr_6882                              ; $6872: $28 $0E

    call IncrementEntityState                     ; $6874: $CD $12 $3B
    ld   [hl], b                                  ; $6877: $70
    call GetEntityTransitionCountdown             ; $6878: $CD $05 $0C
    ld   [hl], $08                                ; $687B: $36 $08
    call GetEntityPrivateCountdown1               ; $687D: $CD $00 $0C
    ld   [hl], $20                                ; $6880: $36 $20

.jr_6882
    ldh  a, [hActiveEntityState]                  ; $6882: $F0 $F0
    JP_TABLE                                      ; $6884
._00 dw func_007_6897                             ; $6885
._01 dw func_007_68D8                             ; $6887
._02 dw func_007_6929                             ; $6889

Data_007_688B::
    db   $08, $F8, $00, $00

Data_007_688F::
    db   $00, $00, $F8, $08

Data_007_6893::
    db   $02, $00, $FF, $FF

func_007_6897::
    call GetEntityTransitionCountdown             ; $6897: $CD $05 $0C
    jr   nz, jr_007_68D0                          ; $689A: $20 $34

    call IncrementEntityState                     ; $689C: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $689F: $CD $05 $0C
    call GetRandomByte                            ; $68A2: $CD $0D $28
    and  $1F                                      ; $68A5: $E6 $1F
    add  $30                                      ; $68A7: $C6 $30
    ld   [hl], a                                  ; $68A9: $77
    and  $03                                      ; $68AA: $E6 $03
    ld   e, a                                     ; $68AC: $5F

func_007_68AD::
    ld   d, b                                     ; $68AD: $50
    ld   hl, Data_007_688B                        ; $68AE: $21 $8B $68
    add  hl, de                                   ; $68B1: $19
    ld   a, [hl]                                  ; $68B2: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $68B3: $21 $40 $C2
    add  hl, bc                                   ; $68B6: $09
    ld   [hl], a                                  ; $68B7: $77
    ld   hl, Data_007_688F                        ; $68B8: $21 $8F $68
    add  hl, de                                   ; $68BB: $19
    ld   a, [hl]                                  ; $68BC: $7E
    call GetEntitySpeedYAddress                   ; $68BD: $CD $05 $40
    ld   [hl], a                                  ; $68C0: $77
    ld   hl, Data_007_6893                        ; $68C1: $21 $93 $68
    add  hl, de                                   ; $68C4: $19
    ld   a, [hl]                                  ; $68C5: $7E
    cp   $FF                                      ; $68C6: $FE $FF
    jr   z, .ret_68CF                             ; $68C8: $28 $05

    ld   hl, wEntitiesDirectionTable              ; $68CA: $21 $80 $C3
    add  hl, bc                                   ; $68CD: $09
    ld   [hl], a                                  ; $68CE: $77

.ret_68CF
    ret                                           ; $68CF: $C9

jr_007_68D0:
    call ClearEntitySpeed                         ; $68D0: $CD $7F $3D
    call func_007_68F0                            ; $68D3: $CD $F0 $68
    jr   jr_007_68E6                              ; $68D6: $18 $0E

func_007_68D8::
    call GetEntityTransitionCountdown             ; $68D8: $CD $05 $0C
    jr   nz, .jr_68E3                             ; $68DB: $20 $06

    ld   [hl], $18                                ; $68DD: $36 $18
    call IncrementEntityState                     ; $68DF: $CD $12 $3B
    ld   [hl], b                                  ; $68E2: $70

.jr_68E3
    call func_007_68F0                            ; $68E3: $CD $F0 $68

jr_007_68E6:
    ldh  a, [hFrameCounter]                       ; $68E6: $F0 $E7
    rra                                           ; $68E8: $1F
    rra                                           ; $68E9: $1F
    rra                                           ; $68EA: $1F
    and  $01                                      ; $68EB: $E6 $01
    jp   SetEntitySpriteVariant                   ; $68ED: $C3 $0C $3B

func_007_68F0::
    call GetEntityPrivateCountdown1               ; $68F0: $CD $00 $0C
    jr   nz, ret_007_6919                         ; $68F3: $20 $24

    call EntityLinkPositionXDifference_07         ; $68F5: $CD $5D $7E
    add  $08                                      ; $68F8: $C6 $08
    cp   $10                                      ; $68FA: $FE $10
    jr   nc, jr_007_691A                          ; $68FC: $30 $1C

    call EntityLinkPositionYDifference_07         ; $68FE: $CD $6D $7E

jr_007_6901:
    call func_007_68AD                            ; $6901: $CD $AD $68
    ld   hl, wEntitiesSpeedXTable                 ; $6904: $21 $40 $C2
    add  hl, bc                                   ; $6907: $09
    sla  [hl]                                     ; $6908: $CB $26
    call GetEntitySpeedYAddress                   ; $690A: $CD $05 $40
    sla  [hl]                                     ; $690D: $CB $26
    call IncrementEntityState                     ; $690F: $CD $12 $3B
    ld   [hl], $02                                ; $6912: $36 $02
    call GetEntityTransitionCountdown             ; $6914: $CD $05 $0C
    ld   [hl], $30                                ; $6917: $36 $30

ret_007_6919:
    ret                                           ; $6919: $C9

jr_007_691A:
    call EntityLinkPositionYDifference_07         ; $691A: $CD $6D $7E
    add  $08                                      ; $691D: $C6 $08
    cp   $10                                      ; $691F: $FE $10
    jr   nc, .ret_6928                            ; $6921: $30 $05

    call EntityLinkPositionXDifference_07         ; $6923: $CD $5D $7E
    jr   jr_007_6901                              ; $6926: $18 $D9

.ret_6928
    ret                                           ; $6928: $C9

func_007_6929::
    call GetEntityTransitionCountdown             ; $6929: $CD $05 $0C
    jr   nz, .jr_6939                             ; $692C: $20 $0B

    ld   [hl], $20                                ; $692E: $36 $20
    call IncrementEntityState                     ; $6930: $CD $12 $3B
    ld   [hl], b                                  ; $6933: $70
    call GetEntityPrivateCountdown1               ; $6934: $CD $00 $0C
    ld   [hl], $40                                ; $6937: $36 $40

.jr_6939
    ldh  a, [hFrameCounter]                       ; $6939: $F0 $E7
    rra                                           ; $693B: $1F
    rra                                           ; $693C: $1F
    and  $01                                      ; $693D: $E6 $01
    jp   SetEntitySpriteVariant                   ; $693F: $C3 $0C $3B
