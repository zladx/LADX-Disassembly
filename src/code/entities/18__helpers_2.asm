;
; Helpers for the Vire entity
;

Data_018_7B5D::
    db   $00, $00, $01, $01, $01, $02, $02, $02, $00, $00, $0F, $0F, $0F, $0E, $0E, $0E
    db   $08, $08, $07, $07, $07, $06, $06, $06, $08, $08, $09, $09, $09, $0A, $0A, $0A

Data_018_7B7D::
    db   $04, $04, $03, $03, $03, $02, $02, $02, $0C, $0C, $0D, $0D, $0D, $0E, $0E, $0E
    db   $04, $04, $05, $05, $05, $06, $06, $06, $0C, $0C, $0B, $0B, $0B, $0A, $0A, $0A

func_018_7B9D::
    ldh  a, [hMultiPurpose0]                      ; $7B9D: $F0 $D7
    rlca                                          ; $7B9F: $07
    and  $01                                      ; $7BA0: $E6 $01
    ld   e, a                                     ; $7BA2: $5F
    ldh  a, [hMultiPurpose1]                      ; $7BA3: $F0 $D8
    rlca                                          ; $7BA5: $07
    rla                                           ; $7BA6: $17
    and  $02                                      ; $7BA7: $E6 $02
    or   e                                        ; $7BA9: $B3
    rla                                           ; $7BAA: $17
    rla                                           ; $7BAB: $17
    rla                                           ; $7BAC: $17
    and  $18                                      ; $7BAD: $E6 $18
    ld   h, a                                     ; $7BAF: $67
    ldh  a, [hMultiPurpose1]                      ; $7BB0: $F0 $D8
    bit  7, a                                     ; $7BB2: $CB $7F
    jr   z, .jr_7BB8                              ; $7BB4: $28 $02

    cpl                                           ; $7BB6: $2F
    inc  a                                        ; $7BB7: $3C

.jr_7BB8
    ld   d, a                                     ; $7BB8: $57
    ldh  a, [hMultiPurpose0]                      ; $7BB9: $F0 $D7
    bit  7, a                                     ; $7BBB: $CB $7F
    jr   z, .jr_7BC1                              ; $7BBD: $28 $02

    cpl                                           ; $7BBF: $2F
    inc  a                                        ; $7BC0: $3C

.jr_7BC1
    cp   d                                        ; $7BC1: $BA
    jr   nc, .jr_7BD1                             ; $7BC2: $30 $0D

    sra  a                                        ; $7BC4: $CB $2F
    sra  a                                        ; $7BC6: $CB $2F
    add  h                                        ; $7BC8: $84
    ld   e, a                                     ; $7BC9: $5F
    ld   d, b                                     ; $7BCA: $50
    ld   hl, Data_018_7B5D                        ; $7BCB: $21 $5D $7B
    add  hl, de                                   ; $7BCE: $19
    ld   a, [hl]                                  ; $7BCF: $7E
    ret                                           ; $7BD0: $C9

.jr_7BD1
    ld   a, d                                     ; $7BD1: $7A
    sra  a                                        ; $7BD2: $CB $2F
    sra  a                                        ; $7BD4: $CB $2F
    add  h                                        ; $7BD6: $84
    ld   e, a                                     ; $7BD7: $5F
    ld   d, b                                     ; $7BD8: $50
    ld   hl, Data_018_7B7D                        ; $7BD9: $21 $7D $7B
    add  hl, de                                   ; $7BDC: $19
    ld   a, [hl]                                  ; $7BDD: $7E
    ret                                           ; $7BDE: $C9
