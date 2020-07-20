Data_006_4F2C::
    db   $44, $01, $44, $21, $46, $01, $46, $21

Data_006_4F34::
    db   $64, $01, $64, $21, $66, $01, $66, $21

HardHatBeetleEntityHandler::
    ld   de, Data_006_4F2C                        ; $4F3C: $11 $2C $4F
    ldh  a, [hMapId]                              ; $4F3F: $F0 $F7
    cp   $0A                                      ; $4F41: $FE $0A
    jr   nz, jr_006_4F48                          ; $4F43: $20 $03

    ld   de, Data_006_4F34                        ; $4F45: $11 $34 $4F

jr_006_4F48:
    call RenderActiveEntitySpritesPair            ; $4F48: $CD $C0 $3B
    call func_006_64C6                            ; $4F4B: $CD $C6 $64
    call func_006_64F7                            ; $4F4E: $CD $F7 $64
    call label_3B39                               ; $4F51: $CD $39 $3B
    call UpdateEntityPosWithSpeed_06              ; $4F54: $CD $41 $65
    call label_3B23                               ; $4F57: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $4F5A: $F0 $E7
    rra                                           ; $4F5C: $1F
    rra                                           ; $4F5D: $1F
    rra                                           ; $4F5E: $1F
    and  $01                                      ; $4F5F: $E6 $01
    call SetEntitySpriteVariant                   ; $4F61: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $4F64: $F0 $E7
    xor  c                                        ; $4F66: $A9
    and  $03                                      ; $4F67: $E6 $03
    jr   nz, jr_006_4FAF                          ; $4F69: $20 $44

    call GetRandomByte                            ; $4F6B: $CD $0D $28
    xor  c                                        ; $4F6E: $A9
    and  $07                                      ; $4F6F: $E6 $07
    add  $04                                      ; $4F71: $C6 $04
    call GetVectorTowardsLink_trampoline          ; $4F73: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $4F76: $F0 $D7
    ld   hl, wEntitiesSpeedYTable                 ; $4F78: $21 $50 $C2
    call func_006_4FA3                            ; $4F7B: $CD $A3 $4F
    ld   hl, wEntitiesCollisionsTable             ; $4F7E: $21 $A0 $C2
    add  hl, bc                                   ; $4F81: $09
    ld   a, [hl]                                  ; $4F82: $7E
    and  $0C                                      ; $4F83: $E6 $0C
    jr   z, jr_006_4F8C                           ; $4F85: $28 $05

    ld   hl, wEntitiesSpeedYTable                 ; $4F87: $21 $50 $C2
    add  hl, bc                                   ; $4F8A: $09
    ld   [hl], b                                  ; $4F8B: $70

jr_006_4F8C:
    ldh  a, [hScratch1]                           ; $4F8C: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ; $4F8E: $21 $40 $C2
    call func_006_4FA3                            ; $4F91: $CD $A3 $4F
    ld   hl, wEntitiesCollisionsTable             ; $4F94: $21 $A0 $C2
    add  hl, bc                                   ; $4F97: $09
    ld   a, [hl]                                  ; $4F98: $7E
    and  $03                                      ; $4F99: $E6 $03
    jr   z, jr_006_4FA2                           ; $4F9B: $28 $05

    ld   hl, wEntitiesSpeedXTable                 ; $4F9D: $21 $40 $C2
    add  hl, bc                                   ; $4FA0: $09
    ld   [hl], b                                  ; $4FA1: $70

jr_006_4FA2:
    ret                                           ; $4FA2: $C9

func_006_4FA3::
    add  hl, bc                                   ; $4FA3: $09
    sub  [hl]                                     ; $4FA4: $96
    jr   z, jr_006_4FAF                           ; $4FA5: $28 $08

    bit  7, a                                     ; $4FA7: $CB $7F
    jr   z, jr_006_4FAE                           ; $4FA9: $28 $03

    dec  [hl]                                     ; $4FAB: $35
    jr   jr_006_4FAF                              ; $4FAC: $18 $01

jr_006_4FAE:
    inc  [hl]                                     ; $4FAE: $34

jr_006_4FAF:
    ret                                           ; $4FAF: $C9
