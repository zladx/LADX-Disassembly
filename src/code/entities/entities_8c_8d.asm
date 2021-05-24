Data_006_4E9D::
    db   $F8, $10, $FA, $10

Entity8CHandler::
    ldh  a, [hActiveEntityState]                  ; $4EA1: $F0 $F0
    and  a                                        ; $4EA3: $A7
    jr   nz, label_006_4EB7                       ; $4EA4: $20 $11

    ld   hl, wEntitiesPosXTable                   ; $4EA6: $21 $00 $C2
    add  hl, bc                                   ; $4EA9: $09
    ld   a, [hl]                                  ; $4EAA: $7E
    add  $08                                      ; $4EAB: $C6 $08
    ld   [hl], a                                  ; $4EAD: $77
    ld   hl, wEntitiesPosZTable                   ; $4EAE: $21 $10 $C3
    add  hl, bc                                   ; $4EB1: $09
    ld   [hl], $10                                ; $4EB2: $36 $10
    jp   IncrementEntityState                     ; $4EB4: $C3 $12 $3B

label_006_4EB7:
    ld   de, Data_006_4E9D                        ; $4EB7: $11 $9D $4E
    call RenderActiveEntitySpritesPair            ; $4EBA: $CD $C0 $3B
    call func_006_64C6                            ; $4EBD: $CD $C6 $64
    ldh  a, [hFFBA]                               ; $4EC0: $F0 $BA
    cp   $02                                      ; $4EC2: $FE $02
    jr   z, jr_006_4EF2                           ; $4EC4: $28 $2C

    and  a                                        ; $4EC6: $A7
    jr   z, jr_006_4EE3                           ; $4EC7: $28 $1A

    ld   hl, wEntitiesUnknowTableY                ; $4EC9: $21 $D0 $C3
    add  hl, bc                                   ; $4ECC: $09
    inc  [hl]                                     ; $4ECD: $34
    ld   a, [hl]                                  ; $4ECE: $7E
    cp   $0A                                      ; $4ECF: $FE $0A
    jr   nz, jr_006_4EE2                          ; $4ED1: $20 $0F

    ld   [hl], b                                  ; $4ED3: $70
    ld   a, $11                                   ; $4ED4: $3E $11
    ldh  [hNoiseSfx], a                           ; $4ED6: $E0 $F4
    ld   hl, wEntitiesPosZTable                   ; $4ED8: $21 $10 $C3
    add  hl, bc                                   ; $4EDB: $09
    ld   a, [hl]                                  ; $4EDC: $7E
    cp   $20                                      ; $4EDD: $FE $20
    jr   nc, jr_006_4EE2                          ; $4EDF: $30 $01

    inc  [hl]                                     ; $4EE1: $34

jr_006_4EE2:
    ret                                           ; $4EE2: $C9

jr_006_4EE3:
    ld   hl, wEntitiesPosZTable                   ; $4EE3: $21 $10 $C3
    add  hl, bc                                   ; $4EE6: $09
    ld   a, [hl]                                  ; $4EE7: $7E
    and  a                                        ; $4EE8: $A7
    jr   z, jr_006_4F0E                           ; $4EE9: $28 $23

jr_006_4EEB:
    ldh  a, [hFrameCounter]                       ; $4EEB: $F0 $E7

jr_006_4EED:
    and  $0F                                      ; $4EED: $E6 $0F
    jr   nz, jr_006_4EF2                          ; $4EEF: $20 $01

    dec  [hl]                                     ; $4EF1: $35

jr_006_4EF2:
    ld   a, [hl]                                  ; $4EF2: $7E
    cp   $04                                      ; $4EF3: $FE $04
    jr   nc, jr_006_4F0D                          ; $4EF5: $30 $16

    call CheckLinkCollisionWithEnemy_trampoline   ; $4EF7: $CD $5A $3B
    ret  nc                                       ; $4EFA: $D0

    ld   a, $08                                   ; $4EFB: $3E $08
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $4EFD: $EA $3E $C1
    ld   a, $10                                   ; $4F00: $3E $10
    call GetVectorTowardsLink_trampoline          ; $4F02: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $4F05: $F0 $D7
    ldh  [hLinkSpeedY], a                         ; $4F07: $E0 $9B
    ldh  a, [hMultiPurpose1]                      ; $4F09: $F0 $D8
    ldh  [hLinkSpeedX], a                         ; $4F0B: $E0 $9A

jr_006_4F0D:
    ret                                           ; $4F0D: $C9

jr_006_4F0E:
    call CheckLinkCollisionWithEnemy_trampoline   ; $4F0E: $CD $5A $3B
    ret  nc                                       ; $4F11: $D0

    jp   label_006_641F                           ; $4F12: $C3 $1F $64

Entity8DHandler::
    ldh  a, [hActiveEntityState]                  ; $4F15: $F0 $F0
    and  a                                        ; $4F17: $A7
    jp   nz, label_006_4EB7                       ; $4F18: $C2 $B7 $4E

    ld   hl, wEntitiesPosYTable                   ; $4F1B: $21 $10 $C2
    add  hl, bc                                   ; $4F1E: $09
    ld   a, [hl]                                  ; $4F1F: $7E
    add  $08                                      ; $4F20: $C6 $08
    ld   [hl], a                                  ; $4F22: $77
    ld   hl, wEntitiesPosZTable                   ; $4F23: $21 $10 $C3
    add  hl, bc                                   ; $4F26: $09
    ld   [hl], $10                                ; $4F27: $36 $10
    jp   IncrementEntityState                     ; $4F29: $C3 $12 $3B
