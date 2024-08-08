func_01F_7F80::
    ldh  a, [hMusicFadeOutTimer]                  ;; 1F:7F80 $F0 $A8
    and  a                                        ;; 1F:7F82 $A7
    jr   z, jr_01F_7F9E                           ;; 1F:7F83 $28 $19

    sub  $01                                      ;; 1F:7F85 $D6 $01
    ldh  [hMusicFadeOutTimer], a                  ;; 1F:7F87 $E0 $A8
    and  $03                                      ;; 1F:7F89 $E6 $03
    jr   nz, jr_01F_7F9E                          ;; 1F:7F8B $20 $11

    ldh  a, [hVolumeRight]                        ;; 1F:7F8D $F0 $A9
    and  a                                        ;; 1F:7F8F $A7
    jr   z, .jr_7F95                              ;; 1F:7F90 $28 $03

    dec  a                                        ;; 1F:7F92 $3D
    ldh  [hVolumeRight], a                        ;; 1F:7F93 $E0 $A9

.jr_7F95
    ldh  a, [hVolumeLeft]                         ;; 1F:7F95 $F0 $AA
    and  a                                        ;; 1F:7F97 $A7
    jr   z, jr_01F_7F9E                           ;; 1F:7F98 $28 $04

    sub  $10                                      ;; 1F:7F9A $D6 $10
    ldh  [hVolumeLeft], a                         ;; 1F:7F9C $E0 $AA

jr_01F_7F9E:
    ldh  a, [hMusicFadeInTimer]                   ;; 1F:7F9E $F0 $AB
    and  a                                        ;; 1F:7FA0 $A7
    jr   z, jr_01F_7FBE                           ;; 1F:7FA1 $28 $1B

    sub  $01                                      ;; 1F:7FA3 $D6 $01
    ldh  [hMusicFadeInTimer], a                   ;; 1F:7FA5 $E0 $AB
    and  $01                                      ;; 1F:7FA7 $E6 $01
    jr   nz, jr_01F_7FBE                          ;; 1F:7FA9 $20 $13

    ldh  a, [hVolumeRight]                        ;; 1F:7FAB $F0 $A9
    cp   $07                                      ;; 1F:7FAD $FE $07
    jr   nc, .jr_7FB4                             ;; 1F:7FAF $30 $03

    inc  a                                        ;; 1F:7FB1 $3C
    ldh  [hVolumeRight], a                        ;; 1F:7FB2 $E0 $A9

.jr_7FB4
    ldh  a, [hVolumeLeft]                         ;; 1F:7FB4 $F0 $AA
    cp   $70                                      ;; 1F:7FB6 $FE $70
    jr   nc, jr_01F_7FBE                          ;; 1F:7FB8 $30 $04

    add  $10                                      ;; 1F:7FBA $C6 $10
    ldh  [hVolumeLeft], a                         ;; 1F:7FBC $E0 $AA

jr_01F_7FBE:
    ld   hl, hVolumeRight                         ;; 1F:7FBE $21 $A9 $FF
    ldh  a, [rNR50]                               ;; 1F:7FC1 $F0 $24
    and  $F8                                      ;; 1F:7FC3 $E6 $F8
    or   [hl]                                     ;; 1F:7FC5 $B6
    inc  hl                                       ;; 1F:7FC6 $23
    and  $8F                                      ;; 1F:7FC7 $E6 $8F
    or   [hl]                                     ;; 1F:7FC9 $B6
    ldh  [rNR50], a                               ;; 1F:7FCA $E0 $24
    ldh  a, [hJingle]                             ;; 1F:7FCC $F0 $F2
    and  a                                        ;; 1F:7FCE $A7
    jr   z, .jr_7FD7                              ;; 1F:7FCF $28 $06

    ld   [wActiveJingle], a                       ;; 1F:7FD1 $EA $60 $D3
    xor  a                                        ;; 1F:7FD4 $AF
    ldh  [hJingle], a                             ;; 1F:7FD5 $E0 $F2

.jr_7FD7
    ldh  a, [hWaveSfx]                            ;; 1F:7FD7 $F0 $F3
    and  a                                        ;; 1F:7FD9 $A7
    jr   z, .jr_7FE2                              ;; 1F:7FDA $28 $06

    ld   [wActiveWaveSfx], a                      ;; 1F:7FDC $EA $70 $D3
    xor  a                                        ;; 1F:7FDF $AF
    ldh  [hWaveSfx], a                            ;; 1F:7FE0 $E0 $F3

.jr_7FE2
    ldh  a, [hNoiseSfx]                           ;; 1F:7FE2 $F0 $F4
    and  a                                        ;; 1F:7FE4 $A7
    jr   z, .ret_7FED                             ;; 1F:7FE5 $28 $06

    ld   [wActiveNoiseSfx], a                     ;; 1F:7FE7 $EA $78 $D3
    xor  a                                        ;; 1F:7FEA $AF
    ldh  [hNoiseSfx], a                           ;; 1F:7FEB $E0 $F4

.ret_7FED
    ret                                           ;; 1F:7FED $C9
