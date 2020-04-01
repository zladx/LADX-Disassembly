; Entry point for the Sfx sound system
SoundSystemInit::
    jp   label_01F_4009                           ; $4000: $C3 $09 $40

func_01F_4003::
    jp   func_01F_7B5C                            ; $4003: $C3 $5C $7B

PlaySfx::
    jp   label_01F_401E                           ; $4006: $C3 $1E $40

label_01F_4009:
    ld   hl, $D300                                ; $4009: $21 $00 $D3

jr_01F_400C:
    ld   [hl], $00                                ; $400C: $36 $00
    inc  l                                        ; $400E: $2C
    jr   nz, jr_01F_400C                          ; $400F: $20 $FB

    ld   a, $80                                   ; $4011: $3E $80
    ldh  [rNR52], a                               ; $4013: $E0 $26
    ld   a, $77                                   ; $4015: $3E $77
    ldh  [rNR50], a                               ; $4017: $E0 $24
    ld   a, $FF                                   ; $4019: $3E $FF
    ldh  [rNR51], a                               ; $401B: $E0 $25
    ret                                           ; $401D: $C9

label_01F_401E:
    call PlayActiveJingle                         ; $401E: $CD $04 $42
    call PlayActiveWaveSfx                        ; $4021: $CD $ED $53
    call PlayActiveNoiseSfx                       ; $4024: $CD $EC $64
    xor  a                                        ; $4027: $AF
    ld   [wActiveJingle], a                       ; $4028: $EA $60 $D3
    ld   [wActiveWaveSfx], a                      ; $402B: $EA $70 $D3
    ld   [wActiveNoiseSfx], a                     ; $402E: $EA $78 $D3
    ret                                           ; $4031: $C9
