;
; Fragment of entity code in bank 05.
;
; Seems buggy and unused. Probably dead code.
;

Data_005_59DE::
    db   $07, $00, $0F, $07, $1E, $0F, $3F, $18, $3F, $10, $3F, $14, $3F, $10, $27, $1B

Data_005_59EE::
    db   $E0, $00, $F0, $E0, $18, $F0, $8C, $78, $8C, $70, $3F, $C0, $FF, $3E, $EF, $F1

Data_005_59FE::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $00, $07, $03

Data_005_5A0E::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $3F, $00, $FF, $3E, $EF, $F1

func_005_5A1E:
    ld   hl, wEntitiesUnknowTableH                ; $5A1E: $21 $30 $C4
    add  hl, bc                                   ; $5A21: $09
    ld   a, [hl]                                  ; $5A22: $7E
    and  $7F                                      ; $5A23: $E6 $7F
    ld   [hl], a                                  ; $5A25: $77
    ld   e, $0F                                   ; $5A26: $1E $0F
    ld   d, b                                     ; $5A28: $50

jr_005_5A29:
    ld   hl, wEntitiesStatusTable                 ; $5A29: $21 $80 $C2
    add  hl, de                                   ; $5A2C: $19
    ld   [hl], b                                  ; $5A2D: $70
    dec  e                                        ; $5A2E: $1D
    ld   a, e                                     ; $5A2F: $7B
    cp   $01                                      ; $5A30: $FE $01
    jr   nz, jr_005_5A29                          ; $5A32: $20 $F5

    ld   a, [$D478]                               ; $5A34: $FA $78 $D4
    and  a                                        ; $5A37: $A7
    jr   z, jr_005_5A5D                           ; $5A38: $28 $23

    ld   a, $05                                   ; $5A3A: $3E $05
    call SwitchBank                               ; $5A3C: $CD $0C $08
    call func_005_5B03                            ; $5A3F: $CD $03 $5B
    ld   hl, wEntitiesStateTable                  ; $5A42: $21 $90 $C2
    add  hl, de                                   ; $5A45: $19
    ld   [hl], $07                                ; $5A46: $36 $07
    ld   hl, wEntitiesTransitionCountdownTable    ; $5A48: $21 $E0 $C2
    add  hl, de                                   ; $5A4B: $19
    ld   [hl], $60                                ; $5A4C: $36 $60
    ld   a, $01                                   ; $5A4E: $3E $01
    ldh  [hFFA5], a                               ; $5A50: $E0 $A5
    call IncrementEntityState                     ; $5A52: $CD $12 $3B
    ld   [hl], $04                                ; $5A55: $36 $04
    ld   a, $C0                                   ; $5A57: $3E $C0
    ld   [wEntitiesPosYTable], a                  ; $5A59: $EA $10 $C2
    ret                                           ; $5A5C: $C9

jr_005_5A5D:
    ld   a, $02                                   ; $5A5D: $3E $02
    ldh  [hFFA5], a                               ; $5A5F: $E0 $A5
    ld   [$D478], a                               ; $5A61: $EA $78 $D4
    call GetEntityTransitionCountdown             ; $5A64: $CD $05 $0C
    ld   [hl], $80                                ; $5A67: $36 $80
    ld   e, $0C                                   ; $5A69: $1E $0C
    xor  a                                        ; $5A6B: $AF
    ld   hl, $D790                                ; $5A6C: $21 $90 $D7

.loop
    ld   [hl+], a                                 ; $5A6F: $22
    dec  e                                        ; $5A70: $1D
    jr   nz, .loop                                ; $5A71: $20 $FC

    ld   a, $02                                   ; $5A73: $3E $02
    ld   [$D205], a                               ; $5A75: $EA $05 $D2
    ld   a, $5C                                   ; $5A78: $3E $5C
    ld   [wActiveMusicTrack], a                   ; $5A7A: $EA $68 $D3
