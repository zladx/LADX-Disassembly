
Data_019_4838::
    db   $02, $11, $C0, $30, $14

Data_019_483D::
    db   $02, $11, $C1, $50, $14

Data_019_4842::
    db   $02, $0F, $F5, $94, $52

DivableWaterEntityHandler::
    call ReturnIfNonInteractive_19                ; $4847: $CD $3D $7D
    call GetEntityTransitionCountdown             ; $484A: $CD $05 $0C
    jr   z, jr_019_4869                           ; $484D: $28 $1A

    cp   $01                                      ; $484F: $FE $01
    jr   nz, .jr_485C                             ; $4851: $20 $09

    ld   a, [wLinkMotionState]                    ; $4853: $FA $1C $C1
    ld   [wD463], a                               ; $4856: $EA $63 $D4
    call func_019_4891                            ; $4859: $CD $91 $48

.jr_485C
    ld   a, $02                                   ; $485C: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $485E: $E0 $A1
    ld   [wC167], a                               ; $4860: $EA $67 $C1
    ld   a, $04                                   ; $4863: $3E $04
    ld   [wC13B], a                               ; $4865: $EA $3B $C1
    ret                                           ; $4868: $C9

jr_019_4869:
    ld   a, [wLinkMotionState]                    ; $4869: $FA $1C $C1
    cp   LINK_MOTION_SWIMMING                     ; $486C: $FE $01
    jr   nz, .ret_4890                            ; $486E: $20 $20

    ldh  a, [hLinkPhysicsModifier]                ; $4870: $F0 $9C
    and  a                                        ; $4872: $A7
    jr   z, .ret_4890                             ; $4873: $28 $1B

    call EntityLinkPositionXDifference_19         ; $4875: $CD $0B $7E
    add  $0C                                      ; $4878: $C6 $0C
    cp   $18                                      ; $487A: $FE $18
    jr   nc, .ret_4890                            ; $487C: $30 $12

    call EntityLinkPositionYDifference_19         ; $487E: $CD $1B $7E
    add  $0C                                      ; $4881: $C6 $0C
    cp   $18                                      ; $4883: $FE $18
    jr   nc, .ret_4890                            ; $4885: $30 $09

    xor  a                                        ; $4887: $AF
    ld   [wLinkPlayingOcarinaCountdown], a        ; $4888: $EA $66 $C1
    call GetEntityTransitionCountdown             ; $488B: $CD $05 $0C
    ld   [hl], $10                                ; $488E: $36 $10

.ret_4890
    ret                                           ; $4890: $C9

func_019_4891::
    ld   de, Data_019_4842                        ; $4891: $11 $42 $48
    ldh  a, [hMapRoom]                            ; $4894: $F0 $F6
    cp   UNKNOWN_ROOM_EA                          ; $4896: $FE $EA
    jr   z, .jr_48A6                              ; $4898: $28 $0C

    ld   de, Data_019_4838                        ; $489A: $11 $38 $48
    ldh  a, [hLinkPositionX]                      ; $489D: $F0 $98
    cp   $30                                      ; $489F: $FE $30
    jr   c, .jr_48A6                              ; $48A1: $38 $03

    ld   de, Data_019_483D                        ; $48A3: $11 $3D $48

.jr_48A6
    ld   hl, wWarpStructs                         ; $48A6: $21 $01 $D4
    push bc                                       ; $48A9: $C5
    ld   c, $05                                   ; $48AA: $0E $05

.loop_48AC
    ld   a, [de]                                  ; $48AC: $1A
    inc  de                                       ; $48AD: $13
    ld   [hl+], a                                 ; $48AE: $22
    dec  c                                        ; $48AF: $0D
    jr   nz, .loop_48AC                           ; $48B0: $20 $FA

    pop  bc                                       ; $48B2: $C1
    call ClearEntityStatus_19                     ; $48B3: $CD $61 $7E
    ldh  a, [hLinkPositionX]                      ; $48B6: $F0 $98
    swap a                                        ; $48B8: $CB $37
    and  $0F                                      ; $48BA: $E6 $0F
    ld   e, a                                     ; $48BC: $5F
    ldh  a, [hLinkPositionY]                      ; $48BD: $F0 $99
    sub  $08                                      ; $48BF: $D6 $08
    and  $F0                                      ; $48C1: $E6 $F0
    or   e                                        ; $48C3: $B3
    ld   [wWarp0PositionTileIndex], a             ; $48C4: $EA $16 $D4
    jp   ApplyMapFadeOutTransition                ; $48C7: $C3 $83 $0C
