; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
WitchRatSpriteVariants::
.variant0
    db $50, $03
    db $52, $03
.variant1
    db $54, $03
    db $56, $03
.variant2
    db $52, $23
    db $50, $23
.variant3
    db $56, $23
    db $54, $23

WitchRatEntityHandler::
    ld   hl, wEntitiesDirectionTable              ;; 15:789D $21 $80 $C3
    add  hl, bc                                   ;; 15:78A0 $09
    ld   a, [hl]                                  ;; 15:78A1 $7E
    and  a                                        ;; 15:78A2 $A7
    jr   nz, .jr_78AB                             ;; 15:78A3 $20 $06

    ldh  a, [hActiveEntitySpriteVariant]          ;; 15:78A5 $F0 $F1
    add  $02                                      ;; 15:78A7 $C6 $02
    ldh  [hActiveEntitySpriteVariant], a          ;; 15:78A9 $E0 $F1

.jr_78AB
    ld   de, WitchRatSpriteVariants               ;; 15:78AB $11 $8D $78
    call RenderActiveEntitySpritesPair            ;; 15:78AE $CD $C0 $3B
    call ReturnIfNonInteractive_15                ;; 15:78B1 $CD $0D $7B
    call AddEntityZSpeedToPos_15                  ;; 15:78B4 $CD $C1 $7B
    ld   hl, wEntitiesSpeedZTable                 ;; 15:78B7 $21 $20 $C3
    add  hl, bc                                   ;; 15:78BA $09
    dec  [hl]                                     ;; 15:78BB $35
    dec  [hl]                                     ;; 15:78BC $35
    ld   hl, wEntitiesPosZTable                   ;; 15:78BD $21 $10 $C3
    add  hl, bc                                   ;; 15:78C0 $09
    ld   a, [hl]                                  ;; 15:78C1 $7E
    and  $80                                      ;; 15:78C2 $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 15:78C4 $E0 $E8
    jr   z, .jr_78CF                              ;; 15:78C6 $28 $07

    xor  a                                        ;; 15:78C8 $AF
    ld   [hl], a                                  ;; 15:78C9 $77
    ld   hl, wEntitiesSpeedZTable                 ;; 15:78CA $21 $20 $C3
    add  hl, bc                                   ;; 15:78CD $09
    ld   [hl], a                                  ;; 15:78CE $77

.jr_78CF
    ldh  a, [hActiveEntityState]                  ;; 15:78CF $F0 $F0
    JP_TABLE                                      ;; 15:78D1
._00 dw func_015_78DE                             ;; 15:78D2
._01 dw func_015_792E                             ;; 15:78D4

Data_015_78D6::
    db   $02, $08, $0C, $08, $FE, $F8, $F4, $F8

func_015_78DE::
    call GetEntityTransitionCountdown             ;; 15:78DE $CD $05 $0C
    jr   nz, .jr_791A                             ;; 15:78E1 $20 $37

    call GetRandomByte                            ;; 15:78E3 $CD $0D $28
    and  $07                                      ;; 15:78E6 $E6 $07
    ld   e, a                                     ;; 15:78E8 $5F
    ld   d, b                                     ;; 15:78E9 $50
    ld   hl, Data_015_78D6                        ;; 15:78EA $21 $D6 $78
    add  hl, de                                   ;; 15:78ED $19
    ld   a, [hl]                                  ;; 15:78EE $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 15:78EF $21 $40 $C2
    add  hl, bc                                   ;; 15:78F2 $09
    ld   [hl], a                                  ;; 15:78F3 $77
    ld   a, e                                     ;; 15:78F4 $7B
    and  $04                                      ;; 15:78F5 $E6 $04
    ld   hl, wEntitiesDirectionTable              ;; 15:78F7 $21 $80 $C3
    add  hl, bc                                   ;; 15:78FA $09
    ld   [hl], a                                  ;; 15:78FB $77
    call GetRandomByte                            ;; 15:78FC $CD $0D $28
    and  $07                                      ;; 15:78FF $E6 $07
    ld   e, a                                     ;; 15:7901 $5F
    ld   hl, Data_015_78D6                        ;; 15:7902 $21 $D6 $78
    add  hl, de                                   ;; 15:7905 $19
    ld   a, [hl]                                  ;; 15:7906 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 15:7907 $21 $50 $C2
    add  hl, bc                                   ;; 15:790A $09
    ld   [hl], a                                  ;; 15:790B $77
    call GetEntityTransitionCountdown             ;; 15:790C $CD $05 $0C
    call GetRandomByte                            ;; 15:790F $CD $0D $28
    and  $1F                                      ;; 15:7912 $E6 $1F
    add  $30                                      ;; 15:7914 $C6 $30
    ld   [hl], a                                  ;; 15:7916 $77
    jp   IncrementEntityState                     ;; 15:7917 $C3 $12 $3B

.jr_791A
    ld   a, $01                                   ;; 15:791A $3E $01
    call SetEntitySpriteVariant                   ;; 15:791C $CD $0C $3B
    ldh  a, [hFrameCounter]                       ;; 15:791F $F0 $E7
    and  $1F                                      ;; 15:7921 $E6 $1F
    jr   nz, .ret_792D                            ;; 15:7923 $20 $08

    ld   hl, wEntitiesDirectionTable              ;; 15:7925 $21 $80 $C3
    add  hl, bc                                   ;; 15:7928 $09
    ld   a, [hl]                                  ;; 15:7929 $7E
    xor  $04                                      ;; 15:792A $EE $04
    ld   [hl], a                                  ;; 15:792C $77

.ret_792D
    ret                                           ;; 15:792D $C9

func_015_792E::
    call UpdateEntityPosWithSpeed_15              ;; 15:792E $CD $88 $7B
    call ApplyEntityInteractionWithBackground_trampoline ;; 15:7931 $CD $23 $3B
    ldh  a, [hMultiPurposeG]                      ;; 15:7934 $F0 $E8
    and  a                                        ;; 15:7936 $A7
    jr   z, jr_015_7950                           ;; 15:7937 $28 $17

    call GetEntityTransitionCountdown             ;; 15:7939 $CD $05 $0C
    jr   nz, .jr_7945                             ;; 15:793C $20 $07

    ld   [hl], $48                                ;; 15:793E $36 $48
    call IncrementEntityState                     ;; 15:7940 $CD $12 $3B
    ld   [hl], b                                  ;; 15:7943 $70
    ret                                           ;; 15:7944 $C9

.jr_7945
    ld   hl, wEntitiesSpeedZTable                 ;; 15:7945 $21 $20 $C3
    add  hl, bc                                   ;; 15:7948 $09
    ld   [hl], $08                                ;; 15:7949 $36 $08
    ld   hl, wEntitiesPosZTable                   ;; 15:794B $21 $10 $C3
    add  hl, bc                                   ;; 15:794E $09
    inc  [hl]                                     ;; 15:794F $34

jr_015_7950:
    ld   a, $00                                   ;; 15:7950 $3E $00
    jp   SetEntitySpriteVariant                   ;; 15:7952 $C3 $0C $3B
