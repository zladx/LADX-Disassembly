Data_005_4780::
.variant1
    db   $00, $00, $60, $01
    db   $00, $08, $62, $01
    db   $10, $00, $64, $02
    db   $10, $08, $66, $02
.variant2
    db   $00, $00, $68, $01
    db   $00, $08, $6A, $01
    db   $10, $00, $6C, $02
    db   $10, $08, $6E, $02
.variant3
    db   $00, $00, $62, $21
    db   $00, $08, $60, $21
    db   $10, $00, $66, $22
    db   $10, $08, $64, $22
.variant4
    db   $00, $00, $68, $01
    db   $00, $08, $6A, $01
    db   $10, $00, $6C, $02
    db   $10, $08, $6E, $02

func_005_47C0::
    ldh  a, [hActiveEntitySpriteVariant]          ; $47C0: $F0 $F1
    rla                                           ; $47C2: $17
    rla                                           ; $47C3: $17
    rla                                           ; $47C4: $17
    rla                                           ; $47C5: $17
    and  $F0                                      ; $47C6: $E6 $F0
    ld   e, a                                     ; $47C8: $5F
    ld   d, b                                     ; $47C9: $50
    ld   hl, Data_005_4780                        ; $47CA: $21 $80 $47
    add  hl, de                                   ; $47CD: $19
    ld   c, $04                                   ; $47CE: $0E $04
    call   RenderActiveEntitySpritesRect           ; $47D0: $C3 $E6 $3C
    ret

WitchEntityHandler::
    call func_005_47C0                            ; $47ED: $CD $C0 $47
    ld   hl, wEntitiesUnknowTableY                ; $47F0: $21 $D0 $C3
    add  hl, bc                                   ; $47F3: $09
    inc  [hl]                                     ; $47F4: $34
    ld   a, [hl]                                  ; $47F5: $7E
    rra                                           ; $47F6: $1F
    rra                                           ; $47F7: $1F
    rra                                           ; $47F8: $1F
    rra                                           ; $47F9: $1F
    and  $03                                      ; $47FA: $E6 $03
    call SetEntitySpriteVariant                   ; $47FC: $CD $0C $3B
    call func_005_54C3                            ; $47FF: $CD $C3 $54
    ldh  a, [hActiveEntityState]                  ; $4802: $F0 $F0
    JP_TABLE                                      ; $4804
; ._00 dw func_005_4815                             ; $4805
; ._01 dw func_005_485F                             ; $4807
; ._02 dw func_005_487D                             ; $4809
._03 dw func_005_4896                             ; $480B
._04 dw func_005_48CF                             ; $480D
._05 dw func_005_48F7                             ; $480F
._06 dw func_005_4909                             ; $4811
._07 dw func_005_4911                             ; $4813

func_005_4815::
    ld   a, [wDialogState]
    and  a                                        ; $4818: $A7
    jr nz, jr_005_4844                                       ; $4819: $C0

    ld   a, [wHasToadstool]                       ; $481A: $FA $4B $DB
    and  a                                        ; $481D: $A7
    jr   z, jr_005_484A                           ; $481E: $28 $2A

    call func_005_5506                            ; $4820: $CD $06 $55
    ld   a, e                                     ; $4823: $7B
    and  a                                        ; $4824: $A7
    jr z, jr_005_4844

    ld   hl, wBButtonSlot                         ; $4826: $21 $00 $DB
    ld   a, [hl]                                  ; $4829: $7E
    cp   $0C                                      ; $482A: $FE $0C
    jr   nz, jr_005_483C                          ; $482C: $20 $0E

    ldh  a, [hJoypadState]                        ; $482E: $F0 $CC
    and  $20                                      ; $4830: $E6 $20
    jr z, jr_005_4844

    xor  a                                        ; $4833: $AF
    ld   [wDialogGotItem], a                      ; $4834: $EA $A9 $C1
    ld   [$C1A8], a                               ; $4837: $EA $A8 $C1
    jr   jr_005_4847                              ; $483A: $18 $0B

jr_005_483C:
    inc  hl                                       ; $483C: $23
    ld   a, [hl]                                  ; $483D: $7E
    cp   $0C                                      ; $483E: $FE $0C
    jr   nz, jr_005_484A                          ; $4840: $20 $08

    ldh  a, [hJoypadState]                        ; $4842: $F0 $CC
    and  $10                                      ; $4844: $E6 $10
    ret  z                                        ; $4846: $C8

jr_005_4847:
    ld   [hl], b                                  ; $4847: $70
    jr   jr_005_4853                              ; $4848: $18 $09

jr_005_484A:
    call func_005_5506                            ; $484A: $CD $06 $55
    ret  nc                                       ; $484D: $D0

    call_open_dialog $00C                           ; $484E
jr_005_4844:
    ret

jr_005_4853:
    xor  a                                        ; $4853: $AF
    ld   [wHasToadstool], a                       ; $4854: $EA $4B $DB
    call GetEntityTransitionCountdown             ; $4857: $CD $05 $0C
    ld   [hl], $04                                ; $485A: $36 $08
    jp   IncrementEntityState                     ; $485C: $C3 $12 $3B

unkfunc:
    call GetEntityTransitionCountdown
    ret nz
    call_open_dialog $009
    call GetEntityTransitionCountdown
    ld   [hl], $C0
    call   IncrementEntityState
    ret

func_005_485F::
func_005_487D::

func_005_4896::
    ld   a, [wDialogState]                        ; $4896: $FA $9F $C1
    and  a                                        ; $4899: $A7
    jr nz, jr_005_4897

    ld   a, [wMusicTrackTiming]                   ; $489B: $FA $0B $C1
    and  a                                        ; $489E: $A7
    jr   nz, jr_005_48AE                          ; $489F: $20 $0D

    ldh  a, [hDefaultMusicTrack]                  ; $48A1: $F0 $B0
    ld   [wMusicTrackToPlay], a                   ; $48A3: $EA $68 $D3
    ld   a, $01                                   ; $48A6: $3E $01
    ld   [wMusicTrackTiming], a                   ; $48A8: $EA $0B $C1

jr_005_48AE:
    ldh  [hLinkInteractiveMotionBlocked], a       ; $48AE: $E0 $A1
    ld   hl, wEntitiesUnknowTableY                ; $48B0: $21 $D0 $C3
    add  hl, bc                                   ; $48B3: $09
    inc  [hl]                                     ; $48B4: $34
    inc  [hl]                                     ; $48B5: $34
    inc  [hl]                                     ; $48B6: $34
    inc  [hl]                                     ; $48B7: $34
    call GetEntityTransitionCountdown             ; $48B8: $CD $05 $0C
    ret  nz                                       ; $48BB: $C0

    ld   [wMusicTrackTiming], a                   ; $48BC: $EA $0B $C1
    ldh  a, [hDefaultMusicTrack]                  ; $48C2: $F0 $B0
    ld   [wMusicTrackToPlay], a                   ; $48C4: $EA $68 $D3
    call_open_dialog $0FE                         ; $48C7
    call   IncrementEntityState                     ; $48CC: $C3 $12 $3B
jr_005_4897:
    ret

func_005_48CF::
    ld   a, [wDialogState]                        ; $48CF: $FA $9F $C1
    and  a                                        ; $48D2: $A7
    ret  nz                                       ; $48D3: $C0

    ld   a, $2A                                   ; $48D4: $3E $2A
    ld   [wDialogGotItemCountdown], a             ; $48D6: $EA $AA $C1
    ld   a, $03                                   ; $48D9: $3E $03
    ld   [wDialogGotItem], a                      ; $48DB: $EA $A9 $C1
    ld   d, $0C                                   ; $48DE: $16 $0C
    call AssignItemToSlot                         ; $48E0: $CD $21 $53
    ld   a, [wMagicPowderCount]                   ; $48E3: $FA $4C $DB
    add  $20                                      ; $48E6: $C6 $20
    daa                                           ; $48E8: $27
    ld   [wMagicPowderCount], a                   ; $48E9: $EA $4C $DB
    ld   a, $0B                                   ; $48EC: $3E $0B
    ldh  [hFFA5], a                               ; $48EE: $E0 $A5
    ld   a, JINGLE_TREASURE_FOUND                 ; $48F0: $3E $01
    ldh  [hJingle], a                             ; $48F2: $E0 $F2
    call IncrementEntityState                     ; $48F4: $CD $12 $3B

func_005_48F7::

func_005_4909::

func_005_4911::
    ret                                           ; $4911: $C9
