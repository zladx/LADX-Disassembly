; Unknow map-loading related code in bank A1

Func_01A_7111::
    ; hl = de
    ld   h, d                                     ; $7111: $62
    ld   l, e                                     ; $7112: $6B

    ; If on GBC…
    ldh  a, [hIsGBC]                              ; $7113: $F0 $FE
    and  a                                        ; $7115: $A7
    jr   z, .gbcEnd                               ; $7116: $28 $3A

    push bc                                       ; $7118: $C5
    push hl                                       ; $7119: $E5
    ld   a, [hl]                                  ; $711A: $7E
    dec  a                                        ; $711B: $3D
    ld   e, a                                     ; $711C: $5F
    sla  a                                        ; $711D: $CB $27
    sla  a                                        ; $711F: $CB $27
    sla  a                                        ; $7121: $CB $27
    add  e                                        ; $7123: $83
    add  e                                        ; $7124: $83
    ld   e, a                                     ; $7125: $5F
    ld   d, $00                                   ; $7126: $16 $00
    ld   hl, $7049                                ; $7128: $21 $49 $70
    ldh  a, [hFFE8]                               ; $712B: $F0 $E8
    and  $01                                      ; $712D: $E6 $01
    jr   z, .jr_01A_7134                          ; $712F: $28 $03

    ld   hl, $70AD                                ; $7131: $21 $AD $70

.jr_01A_7134
    add  hl, de                                   ; $7134: $19
    ld   d, h                                     ; $7135: $54
    ld   e, l                                     ; $7136: $5D
    ld   c, $0A                                   ; $7137: $0E $0A
    ld   hl, $DC91                                ; $7139: $21 $91 $DC
    ld   a, [$DC90]                               ; $713C: $FA $90 $DC
    ldh  a, [$FFCF]                               ; $713F: $F0 $CF
    ld   [hl+], a                                 ; $7141: $22
    ldh  a, [$FFD0]                               ; $7142: $F0 $D0
    ld   [hl+], a                                 ; $7144: $22
    ld   a, $09                                   ; $7145: $3E $09
    ld   [hl+], a                                 ; $7147: $22

.loop
    ld   a, [de]                                  ; $7148: $1A
    ld   [hl+], a                                 ; $7149: $22
    inc  de                                       ; $714A: $13
    dec  c                                        ; $714B: $0D
    jr   nz, .loop                                ; $714C: $20 $FA

    xor  a                                        ; $714E: $AF
    ld   [hl], a                                  ; $714F: $77
    pop  hl                                       ; $7150: $E1
    pop  bc                                       ; $7151: $C1
.gbcEnd

    ld   a, [hl]                                  ; $7152: $7E
    dec  a                                        ; $7153: $3D
    ld   e, a                                     ; $7154: $5F
    sla  a                                        ; $7155: $CB $27
    sla  a                                        ; $7157: $CB $27
    sla  a                                        ; $7159: $CB $27
    add  e                                        ; $715B: $83
    add  e                                        ; $715C: $83
    ld   e, a                                     ; $715D: $5F
    ld   d, b                                     ; $715E: $50
    ld   hl, $6FE5                                ; $715F: $21 $E5 $6F
    ldh  a, [hFFE8]                               ; $7162: $F0 $E8
    and  $01                                      ; $7164: $E6 $01
    jr   nz, .jr_01A_7173                         ; $7166: $20 $0B

    ld   hl, $6F1D                                ; $7168: $21 $1D $6F
    ldh  a, [hIsGBC]                              ; $716B: $F0 $FE
    and  a                                        ; $716D: $A7
    jr   z, .jr_01A_7173                          ; $716E: $28 $03

    ld   hl, $6F81                                ; $7170: $21 $81 $6F

.jr_01A_7173
    add  hl, de                                   ; $7173: $19
    push hl                                       ; $7174: $E5
    ld   a, [wRequests]                           ; $7175: $FA $00 $D6
    ld   e, a                                     ; $7178: $5F
    ld   d, b                                     ; $7179: $50
    add  $0D                                      ; $717A: $C6 $0D
    ld   [wRequests], a                           ; $717C: $EA $00 $D6
    ld   hl, wRequestDestinationHigh              ; $717F: $21 $01 $D6
    add  hl, de                                   ; $7182: $19
    ldh  a, [$FFCF]                               ; $7183: $F0 $CF
    ld   [hl+], a                                 ; $7185: $22
    ldh  a, [$FFD0]                               ; $7186: $F0 $D0
    ld   [hl+], a                                 ; $7188: $22
    ld   a, $09                                   ; $7189: $3E $09
    ld   [hl+], a                                 ; $718B: $22
    pop  de                                       ; $718C: $D1
    push bc                                       ; $718D: $C5
    ld   c, $0A                                   ; $718E: $0E $0A

.copyLoop
    ld   a, [de]                                  ; $7190: $1A
    inc  de                                       ; $7191: $13
    ld   [hl+], a                                 ; $7192: $22
    dec  c                                        ; $7193: $0D
    jr   nz, .copyLoop                            ; $7194: $20 $FA

    ld   [hl], b                                  ; $7196: $70
    pop  bc                                       ; $7197: $C1
    ret                                           ; $7198: $C9
