data_003_6157::
    db $20, $21, $20, $01

DroppableFairyEntityHandler::
    call func_003_61DE                            ; $615B: $CD $DE $61
    call func_003_608C                            ; $615E: $CD $8C $60
    ld   de, data_003_6157                        ; $6161: $11 $57 $61
    call RenderActiveEntitySprite                 ; $6164: $CD $77 $3C
    call func_003_7F78                            ; $6167: $CD $78 $7F
    call func_003_62AF                            ; $616A: $CD $AF $62
    call func_003_62EB                            ; $616D: $CD $EB $62
    ld   hl, wEntitiesSpeedXTable                       ; $6170: $21 $40 $C2
    add  hl, bc                                   ; $6173: $09
    ld   a, [hl]                                  ; $6174: $7E
    rlca                                          ; $6175: $07
    and  $01                                      ; $6176: $E6 $01
    call SetEntitySpriteVariant                   ; $6178: $CD $0C $3B
    call func_003_7F25                            ; $617B: $CD $25 $7F
    call func_003_61C0                            ; $617E: $CD $C0 $61
    call func_003_7893                            ; $6181: $CD $93 $78
    call func_003_7ED9                            ; $6184: $CD $D9 $7E
    ld   a, d                                     ; $6187: $7A
    bit  7, a                                     ; $6188: $CB $7F
    jr   z, jr_003_618C                           ; $618A: $28 $00

jr_003_618C:
    cp   $20                                      ; $618C: $FE $20
    jr   c, jr_003_619C                           ; $618E: $38 $0C

    call func_003_7EE9                            ; $6190: $CD $E9 $7E
    ld   a, d                                     ; $6193: $7A
    bit  7, a                                     ; $6194: $CB $7F
    jr   z, jr_003_6198                           ; $6196: $28 $00

jr_003_6198:
    cp   $20                                      ; $6198: $FE $20
    jr   nc, jr_003_61BB                          ; $619A: $30 $1F

jr_003_619C:
    call GetEntityTransitionCountdown                 ; $619C: $CD $05 $0C
    ret  nz                                       ; $619F: $C0

    ld   [hl], $30                                ; $61A0: $36 $30
    call GetRandomByte                            ; $61A2: $CD $0D $28
    and  $0F                                      ; $61A5: $E6 $0F
    sub  $08                                      ; $61A7: $D6 $08
    ld   hl, wEntitiesSpeedXTable                       ; $61A9: $21 $40 $C2
    add  hl, bc                                   ; $61AC: $09
    ld   [hl], a                                  ; $61AD: $77
    call GetRandomByte                            ; $61AE: $CD $0D $28
    and  $0F                                      ; $61B1: $E6 $0F
    sub  $08                                      ; $61B3: $D6 $08
    ld   hl, wEntitiesSpeedYTable                       ; $61B5: $21 $50 $C2
    add  hl, bc                                   ; $61B8: $09
    ld   [hl], a                                  ; $61B9: $77
    ret                                           ; $61BA: $C9

jr_003_61BB:
    ld   a, $09                                   ; $61BB: $3E $09
    jp   ApplyVectorTowardsLinkAndReturn          ; $61BD: $C3 $C7 $7E
