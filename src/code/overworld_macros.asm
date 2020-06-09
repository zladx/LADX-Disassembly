ApplyOverworldObjectMacro::
    push de                                      ; $7578: $D5
    ld   a, d                                    ; $7579: $7A
    sub  $F5                                     ; $757A: $D6 $F5
    sla  a                                       ; $757C: $CB $27
    ld   d, $00                                  ; $757E: $16 $00
    ld   e, a                                    ; $7580: $5F
    ld   hl, OverworldMacrosHandlers             ; $7581: $21 $8B $75
    add  hl, de                                  ; $7584: $19
    ldi  a, [hl]                                 ; $7585: $2A
    ld   h, [hl]                                 ; $7586: $66
    ld   l, a                                    ; $7587: $6F
    pop  de                                      ; $7588: $D1
    ld   a, e                                    ; $7589: $7B
    jp   hl                                      ; $758A: $E9

OverworldMacrosHandlers::                        ; $758B
