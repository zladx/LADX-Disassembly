; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
RichardFrogSpriteVariants:: ;; 19:5BA0
.variant0
    db $64, $00
    db $64, $20
.variant1
    db $66, $00
    db $66, $20
.variant2
    db $60, $00
    db $60, $20
.variant3
    db $62, $00
    db $62, $20
.variant4
    db $68, $00
    db $6A, $00
.variant5
    db $6C, $00
    db $6E, $00
.variant6
    db $6A, $20
    db $68, $20
.variant7
    db $6E, $20
    db $6C, $20

RichardFrogEntityHandler::
    ld   de, RichardFrogSpriteVariants
    call RenderActiveEntitySpritesPair            ;; 19:5BC3 $CD $C0 $3B
    call ReturnIfNonInteractive_19                ;; 19:5BC6 $CD $3D $7D
    call UpdateEntityPosWithSpeed_19              ;; 19:5BC9 $CD $B8 $7D
    call AddEntityZSpeedToPos_19                  ;; 19:5BCC $CD $F1 $7D
    call ApplyEntityInteractionWithBackground_trampoline ;; 19:5BCF $CD $23 $3B

.jr_5BD2
    ld   hl, wEntitiesSpeedZTable                 ;; 19:5BD2 $21 $20 $C3
    add  hl, bc                                   ;; 19:5BD5 $09
    dec  [hl]                                     ;; 19:5BD6 $35
    dec  [hl]                                     ;; 19:5BD7 $35
    ld   hl, wEntitiesPosZTable                   ;; 19:5BD8 $21 $10 $C3
    add  hl, bc                                   ;; 19:5BDB $09
    ld   a, [hl]                                  ;; 19:5BDC $7E
    and  $80                                      ;; 19:5BDD $E6 $80
    ldh  [hMultiPurposeG], a                      ;; 19:5BDF $E0 $E8
    jr   z, .jr_5BE9                              ;; 19:5BE1 $28 $06

    ld   [hl], b                                  ;; 19:5BE3 $70
    ld   hl, wEntitiesSpeedZTable                 ;; 19:5BE4 $21 $20 $C3
    add  hl, bc                                   ;; 19:5BE7 $09
    ld   [hl], b                                  ;; 19:5BE8 $70

.jr_5BE9
    ldh  a, [hActiveEntityState]                  ;; 19:5BE9 $F0 $F0
    JP_TABLE                                      ;; 19:5BEB
._00 dw RichardFrogState0Handler                             ;; 19:5BEC
._01 dw RichardFrogState1Handler                             ;; 19:5BEE

Data_019_5BF0::
    db   $00, $10, $00, $F0, $0C, $0C, $F4, $F4

Data_019_5BF8::
    db   $F0, $00, $10, $00, $F4, $0C, $0C, $F4

Data_019_5C00::
    db   $00, $06, $02, $04, $00, $06, $02, $04

RichardFrogState0Handler::
    call GetEntityTransitionCountdown             ;; 19:5C08 $CD $05 $0C

.jr_5C0B
    jr   nz, jr_019_5C41                          ;; 19:5C0B $20 $34

    call IncrementEntityState                     ;; 19:5C0D $CD $12 $3B
    call GetRandomByte                            ;; 19:5C10 $CD $0D $28
    and  $1F                                      ;; 19:5C13 $E6 $1F
    or   $10                                      ;; 19:5C15 $F6 $10
    ld   hl, wEntitiesSpeedZTable                 ;; 19:5C17 $21 $20 $C3
    add  hl, bc                                   ;; 19:5C1A $09
    ld   [hl], a                                  ;; 19:5C1B $77
    call GetRandomByte                            ;; 19:5C1C $CD $0D $28
    and  $07                                      ;; 19:5C1F $E6 $07
    ld   e, a                                     ;; 19:5C21 $5F
    ld   d, b                                     ;; 19:5C22 $50

.jr_5C23
    ld   hl, Data_019_5BF0                        ;; 19:5C23 $21 $F0 $5B
    add  hl, de                                   ;; 19:5C26 $19
    ld   a, [hl]                                  ;; 19:5C27 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 19:5C28 $21 $40 $C2

.jr_5C2B
    add  hl, bc                                   ;; 19:5C2B $09
    ld   [hl], a                                  ;; 19:5C2C $77
    ld   hl, Data_019_5BF8                        ;; 19:5C2D $21 $F8 $5B
    add  hl, de                                   ;; 19:5C30 $19
    ld   a, [hl]                                  ;; 19:5C31 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 19:5C32 $21 $50 $C2
    add  hl, bc                                   ;; 19:5C35 $09
    ld   [hl], a                                  ;; 19:5C36 $77
    ld   hl, Data_019_5C00                        ;; 19:5C37 $21 $00 $5C
    add  hl, de                                   ;; 19:5C3A $19
    ld   a, [hl]                                  ;; 19:5C3B $7E
    ld   hl, wEntitiesDirectionTable              ;; 19:5C3C $21 $80 $C3
    add  hl, bc                                   ;; 19:5C3F $09
    ld   [hl], a                                  ;; 19:5C40 $77

jr_019_5C41:
    ld   hl, wEntitiesDirectionTable              ;; 19:5C41 $21 $80 $C3
    add  hl, bc                                   ;; 19:5C44 $09
    ld   a, [hl]                                  ;; 19:5C45 $7E
    jp   SetEntitySpriteVariant                   ;; 19:5C46 $C3 $0C $3B

RichardFrogState1Handler::
    ldh  a, [hMultiPurposeG]                      ;; 19:5C49 $F0 $E8
    and  a                                        ;; 19:5C4B $A7
    jr   z, .jr_5C61                              ;; 19:5C4C $28 $13

    call GetEntityTransitionCountdown             ;; 19:5C4E $CD $05 $0C
    call GetRandomByte                            ;; 19:5C51 $CD $0D $28
    and  $1F                                      ;; 19:5C54 $E6 $1F
    add  $10                                      ;; 19:5C56 $C6 $10
    ld   [hl], a                                  ;; 19:5C58 $77
    call ClearEntitySpeed                         ;; 19:5C59 $CD $7F $3D
    call IncrementEntityState                     ;; 19:5C5C $CD $12 $3B
    ld   [hl], b                                  ;; 19:5C5F $70
    ret                                           ;; 19:5C60 $C9

.jr_5C61
    ld   hl, wEntitiesDirectionTable              ;; 19:5C61 $21 $80 $C3
    add  hl, bc                                   ;; 19:5C64 $09
    ld   a, [hl]                                  ;; 19:5C65 $7E
    inc  a                                        ;; 19:5C66 $3C
    jp   SetEntitySpriteVariant                   ;; 19:5C67 $C3 $0C $3B
