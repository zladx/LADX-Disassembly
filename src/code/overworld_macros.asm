ApplyOverworldObjectMacro::
    push de                                       ; $7578: $D5
    ld   a, d                                     ; $7579: $7A
    sub  $F5                                      ; $757A: $D6 $F5
    sla  a                                        ; $757C: $CB $27
    ld   d, $00                                   ; $757E: $16 $00
    ld   e, a                                     ; $7580: $5F
    ld   hl, OverworldMacrosHandlers              ; $7581: $21 $8B $75
    add  hl, de                                   ; $7584: $19
    ldi  a, [hl]                                  ; $7585: $2A
    ld   h, [hl]                                  ; $7586: $66
    ld   l, a                                     ; $7587: $6F
    pop  de                                       ; $7588: $D1
    ld   a, e                                     ; $7589: $7B
    jp   hl                                       ; $758A: $E9

OverworldMacrosHandlers::                        ; $758B
._00 dw TreeMacroHandler
._01 dw TwoDoorsHouseMacroHandler
._02 dw LargeHouseMacroHandler
._03 dw CatfishMawMacroHandler
._04 dw PalaceDoorMacroHandler
._05 dw StonePigHeadMacroHandler
._06 dw PalmTreeMacroHandler
._07 dw func_024_76EA
._08 dw SmallHouseMacroHandler

TreeMacroHandler::
    dec  bc                                       ; $759D: $0B
    add  $11                                      ; $759E: $C6 $11
    ld   e, a                                     ; $75A0: $5F
    and  $0F                                      ; $75A1: $E6 $0F
    jr   nz, .jr_75A9                             ; $75A3: $20 $04

    ld   a, e                                     ; $75A5: $7B
    sub  $10                                      ; $75A6: $D6 $10
    ld   e, a                                     ; $75A8: $5F

.jr_75A9
    ld   d, $00                                   ; $75A9: $16 $00
    ld   hl, wRoomObjectsArea                     ; $75AB: $21 $00 $D7
    add  hl, de                                   ; $75AE: $19
    ldh  a, [hMultiPurpose0]                      ; $75AF: $F0 $D7
    and  a                                        ; $75B1: $A7
    jr   z, jr_024_75CD                           ; $75B2: $28 $19

    and  $0F                                      ; $75B4: $E6 $0F
    ld   e, a                                     ; $75B6: $5F

jr_024_75B7:
    call func_024_75CD                            ; $75B7: $CD $CD $75
    dec  bc                                       ; $75BA: $0B
    ldh  a, [hMultiPurpose0]                      ; $75BB: $F0 $D7
    and  $40                                      ; $75BD: $E6 $40
    ld   d, $F1                                   ; $75BF: $16 $F1
    jr   z, .jr_75C5                              ; $75C1: $28 $02

    ld   d, $0F                                   ; $75C3: $16 $0F

.jr_75C5
    ld   a, l                                     ; $75C5: $7D
    add  d                                        ; $75C6: $82
    ld   l, a                                     ; $75C7: $6F
    dec  e                                        ; $75C8: $1D
    jr   nz, jr_024_75B7                          ; $75C9: $20 $EC

    inc  bc                                       ; $75CB: $03
    ret                                           ; $75CC: $C9

func_024_75CD::
jr_024_75CD:
    ld   a, [hl]                                  ; $75CD: $7E
    cp   $10                                      ; $75CE: $FE $10
    ld   a, $25                                   ; $75D0: $3E $25
    jr   c, .jr_75D6                              ; $75D2: $38 $02

    add  $04                                      ; $75D4: $C6 $04

.jr_75D6
    ld   [hl+], a                                 ; $75D6: $22
    ld   a, [hl]                                  ; $75D7: $7E
    cp   $10                                      ; $75D8: $FE $10
    ld   a, $26                                   ; $75DA: $3E $26
    jr   c, .jr_75E0                              ; $75DC: $38 $02

    add  $04                                      ; $75DE: $C6 $04

.jr_75E0
    ld   [hl-], a                                 ; $75E0: $32
    ld   a, l                                     ; $75E1: $7D
    add  $10                                      ; $75E2: $C6 $10
    ld   l, a                                     ; $75E4: $6F
    ld   a, [hl]                                  ; $75E5: $7E
    cp   $8A                                      ; $75E6: $FE $8A
    jr   nc, .jr_75F4                             ; $75E8: $30 $0A

    cp   $10                                      ; $75EA: $FE $10
    ld   a, $27                                   ; $75EC: $3E $27
    jr   c, jr_024_75F6                           ; $75EE: $38 $06

    ld   a, $2A                                   ; $75F0: $3E $2A
    jr   jr_024_75F6                              ; $75F2: $18 $02

.jr_75F4
    ld   a, $82                                   ; $75F4: $3E $82

jr_024_75F6:
    ld   [hl+], a                                 ; $75F6: $22
    ld   a, [hl]                                  ; $75F7: $7E
    cp   $8A                                      ; $75F8: $FE $8A
    jr   nc, .jr_7606                             ; $75FA: $30 $0A

    cp   $10                                      ; $75FC: $FE $10
    ld   a, $28                                   ; $75FE: $3E $28
    jr   c, jr_024_7608                           ; $7600: $38 $06

    ld   a, $29                                   ; $7602: $3E $29
    jr   jr_024_7608                              ; $7604: $18 $02

.jr_7606
    ld   a, $83                                   ; $7606: $3E $83

jr_024_7608:
    ld   [hl], a                                  ; $7608: $77

.jr_7609
    inc  bc                                       ; $7609: $03
    ret                                           ; $760A

Data_024_760B::
    db $00, $01, $02, $10, $11, $12, $FF

Data_024_7612::
    db $B6, $B7, $66, $67, $E3, $68

CatfishMawMacroHandler::
    push bc                                       ; $7618: $C5
    call func_024_7625                            ; $7619: $CD $25 $76
    ld   bc, Data_024_760B                        ; $761C: $01 $0B $76
    ld   de, Data_024_7612                        ; $761F: $11 $12 $76
    jp   Func_358B                                ; $7622: $C3 $8B $35

func_024_7625::
    dec  bc                                       ; $7625: $0B
    ld   e, a                                     ; $7626: $5F
    ld   d, $00                                   ; $7627: $16 $00
    ld   hl, wRoomObjects                         ; $7629: $21 $11 $D7
    add  hl, de                                   ; $762C: $19
    ret                                           ; $762D: $C9

Data_024_762E::
    db $00, $01, $02, $03, $04, $10, $11, $12
    db $13, $14, $20, $21, $22, $23, $24, $FF

Data_024_763E::
    db $55, $5A, $5A, $5A, $56, $57, $59, $59
    db $59, $58, $5B, $E2, $5B, $E2, $5B

TwoDoorsHouseMacroHandler::
    push bc                                       ; $764D: $C5
    call func_024_7625                            ; $764E: $CD $25 $76
    ld   bc, Data_024_762E                        ; $7651: $01 $2E $76
    ld   de, Data_024_763E                        ; $7654: $11 $3E $76
    jp   Func_358B                                ; $7657: $C3 $8B $35

Data_024_765A::
    db $00, $01, $02, $10, $11, $12, $20, $21, $22, $FF

Data_024_7664::
    db $55, $5A, $56, $57, $59, $58, $5B, $E2, $5B

LargeHouseMacroHandler::
    push bc                                       ; $766D: $C5
    call func_024_7625                            ; $766E: $CD $25 $76
    ld   bc, Data_024_765A                        ; $7671: $01 $5A $76
    ld   de, Data_024_7664                        ; $7674: $11 $64 $76
    jp   Func_358B                                ; $7677: $C3 $8B $35

Data_024_767A::
    db $00, $01, $02, $10, $11, $12, $FF

Data_024_7681::
    db $A4, $A5, $A6, $A7, $E3, $A8

PalaceDoorMacroHandler::
    push bc                                       ; $7687: $C5
    call func_024_7625                            ; $7688: $CD $25 $76
    ld   bc, Data_024_767A                        ; $768B: $01 $7A $76
    ld   de, Data_024_7681                        ; $768E: $11 $81 $76
    jp   Func_358B                                ; $7691: $C3 $8B $35

Data_024_7694::
    db   $00, $01, $10, $11, $FF

Data_024_7699::
    db   $BB, $BC, $BD, $BE

Data_024_769D::
    db   $09, $09, $09, $09

StonePigHeadMacroHandler::
    push bc                                       ; $76A1: $C5
    call func_024_7625                            ; $76A2: $CD $25 $76
    ld   bc, Data_024_7694                        ; $76A5: $01 $94 $76
    ld   de, Data_024_7699                        ; $76A8: $11 $99 $76
    ldh  a, [hRoomStatus]                         ; $76AB: $F0 $F8
    and  ROOM_STATUS_DOOR_OPEN_UP                 ; $76AD: $E6 $04
    jr   z, .jr_76B4                              ; $76AF: $28 $03

    ld   de, Data_024_769D                        ; $76B1: $11 $9D $76

.jr_76B4
    jp   Func_358B                                ; $76B4: $C3 $8B $35

Data_024_76B7::
    db $00, $01, $10, $11, $FF

Data_024_76BC::
    db $B6, $B7, $CD, $CE

PalmTreeMacroHandler::
    push bc                                       ; $76C0: $C5
    call func_024_7625                            ; $76C1: $CD $25 $76
    ld   bc, Data_024_76B7                        ; $76C4: $01 $B7 $76
    ld   de, Data_024_76BC                        ; $76C7: $11 $BC $76
    jp   Func_358B                                ; $76CA: $C3 $8B $35

Data_024_76CD::
    db $00, $01, $02, $10, $11, $12, $1F, $20
    db $21, $22, $23, $30, $31, $32, $FF

Data_024_76DC::
    db $2B, $2C, $2D, $37, $E8, $38, $0A, $33
    db $2F, $34, $0A, $0A, $0A, $0A

func_024_76EA::
    push bc                                       ; $76EA: $C5
    call func_024_7625                            ; $76EB: $CD $25 $76
    ld   bc, Data_024_76CD                        ; $76EE: $01 $CD $76
    ld   de, Data_024_76DC                        ; $76F1: $11 $DC $76
    jp   Func_358B                                ; $76F4: $C3 $8B $35

Data_024_76F7::
    db $00, $01, $02, $10, $11, $12, $FF

Data_024_76FE::
    db $52, $52, $52, $5B, $E2, $5B

SmallHouseMacroHandler::
    push bc                                       ; $7704: $C5
    call func_024_7625                            ; $7705: $CD $25 $76
    ld   bc, Data_024_76F7                        ; $7708: $01 $F7 $76
    ld   de, Data_024_76FE                        ; $770B: $11 $FE $76
    jp   Func_358B                                ; $770E: $C3 $8B $35
