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
    jp   RenderActiveEntitySpritesRect            ; $47D0: $C3 $E6 $3C

WitchEntityHandler::
    push bc                                       ; $47D3: $C5
    sla  c                                        ; $47D4: $CB $21
    sla  c                                        ; $47D6: $CB $21
    ld   a, $0C                                   ; $47D8: $3E $0C
    ld   hl, wEntitiesHitboxPositionTable         ; $47DA: $21 $80 $D5
    add  hl, bc                                   ; $47DD: $09
    inc  hl                                       ; $47DE: $23
    inc  hl                                       ; $47DF: $23
    ld   [hl], a                                  ; $47E0: $77
    ld   a, $0E                                   ; $47E1: $3E $0E
    inc  hl                                       ; $47E3: $23
    ld   [hl], a                                  ; $47E4: $77
    pop  bc                                       ; $47E5: $C1
    ld   hl, wEntitiesPosYTable                   ; $47E6: $21 $10 $C2
    add  hl, bc                                   ; $47E9: $09
    ld   a, $40                                   ; $47EA: $3E $40
    ld   [hl], a                                  ; $47EC: $77
    call func_005_47C0                            ; $47ED: $CD $C0 $47
    ld   hl, wEntitiesInertiaTable                ; $47F0: $21 $D0 $C3
    add  hl, bc                                   ; $47F3: $09
    inc  [hl]                                     ; $47F4: $34
    ld   a, [hl]                                  ; $47F5: $7E
    rra                                           ; $47F6: $1F
    rra                                           ; $47F7: $1F
    rra                                           ; $47F8: $1F
    rra                                           ; $47F9: $1F
    and  $03                                      ; $47FA: $E6 $03
    call SetEntitySpriteVariant                   ; $47FC: $CD $0C $3B
    call PushLinkOutOfEntity_05                   ; $47FF: $CD $C3 $54
    ldh  a, [hActiveEntityState]                  ; $4802: $F0 $F0
    JP_TABLE                                      ; $4804
._00 dw func_005_4815                             ; $4805
._01 dw func_005_485F                             ; $4807
._02 dw func_005_487D                             ; $4809
._03 dw func_005_4896                             ; $480B
._04 dw func_005_48CF                             ; $480D
._05 dw func_005_48F7                             ; $480F
._06 dw func_005_4909                             ; $4811
._07 dw func_005_4911                             ; $4813

func_005_4815::
    ld   a, [wDialogState]
    and  a                                        ; $4818: $A7
    ret  nz                                       ; $4819: $C0

    ld   a, [wHasToadstool]                       ; $481A: $FA $4B $DB
    and  a                                        ; $481D: $A7
    jr   z, jr_005_484A                           ; $481E: $28 $2A

    call ShouldLinkTalkToEntity_05                ; $4820: $CD $06 $55
    ld   a, e                                     ; $4823: $7B
    and  a                                        ; $4824: $A7
    ret  z                                        ; $4825: $C8

    ld   hl, wInventoryItems.BButtonSlot          ; $4826: $21 $00 $DB
    ld   a, [hl]                                  ; $4829: $7E
    cp   INVENTORY_MAGIC_POWDER                   ; $482A: $FE $0C
    jr   nz, .checkASlot                          ; $482C: $20 $0E

    ldh  a, [hJoypadState]                        ; $482E: $F0 $CC
    and  J_B                                      ; $4830: $E6 $20
    ret  z                                        ; $4832: $C8

    xor  a                                        ; $4833: $AF
    ld   [wDialogGotItem], a                      ; $4834: $EA $A9 $C1
    ld   [wC1A8], a                               ; $4837: $EA $A8 $C1
    jr   jr_005_4847                              ; $483A: $18 $0B

.checkASlot:
    ; check A slot
    ; improvement: could be done in one command
    inc  hl                                       ; $483C: $23
    ld   a, [hl]                                  ; $483D: $7E
    cp   INVENTORY_MAGIC_POWDER                   ; $483E: $FE $0C
    jr   nz, jr_005_484A                          ; $4840: $20 $08

    ldh  a, [hJoypadState]                        ; $4842: $F0 $CC
    and  J_A                                      ; $4844: $E6 $10
    ret  z                                        ; $4846: $C8

jr_005_4847:
    ld   [hl], b                                  ; $4847: $70
    jr   jr_005_4853                              ; $4848: $18 $09

jr_005_484A:
    call ShouldLinkTalkToEntity_05                ; $484A: $CD $06 $55
    ret  nc                                       ; $484D: $D0

    jp_open_dialog Dialog00C                      ; $484E

jr_005_4853:
    xor  a                                        ; $4853: $AF
    ld   [wHasToadstool], a                       ; $4854: $EA $4B $DB
    call GetEntityTransitionCountdown             ; $4857: $CD $05 $0C
    ld   [hl], $08                                ; $485A: $36 $08
    jp   IncrementEntityState                     ; $485C: $C3 $12 $3B

func_005_485F::
    ld   a, [wGameplayType]                       ; $485F: $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ; $4862: $FE $0B
    ret  nz                                       ; $4864: $C0

    ld   a, [wTransitionSequenceCounter]          ; $4865: $FA $6B $C1
    cp   $04                                      ; $4868: $FE $04
    ret  nz                                       ; $486A: $C0

    ld   a, $02                                   ; $486B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $486D: $E0 $A1
    ld   [wC167], a                               ; $486F: $EA $67 $C1
    call GetEntityTransitionCountdown             ; $4872: $CD $05 $0C
    ret  nz                                       ; $4875: $C0

    xor  a                                        ; $4876: $AF
    ld   [wC167], a                               ; $4877: $EA $67 $C1
    jp   IncrementEntityState                     ; $487A: $C3 $12 $3B

func_005_487D::
    ld   a, [wGameplayType]                       ; $487D: $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ; $4880: $FE $0B
    ret  nz                                       ; $4882: $C0

    ld   a, [wTransitionSequenceCounter]          ; $4883: $FA $6B $C1
    cp   $04                                      ; $4886: $FE $04
    ret  nz                                       ; $4888: $C0

    call_open_dialog Dialog009                    ; $4889
    call GetEntityTransitionCountdown             ; $488E: $CD $05 $0C
    ld   [hl], $C0                                ; $4891: $36 $C0
    jp   IncrementEntityState                     ; $4893: $C3 $12 $3B

func_005_4896::
    ld   a, [wDialogState]                        ; $4896: $FA $9F $C1
    and  a                                        ; $4899: $A7
    ret  nz                                       ; $489A: $C0

    ld   a, [wMusicTrackTiming]                   ; $489B: $FA $0B $C1
    and  a                                        ; $489E: $A7
    jr   nz, .jr_48AE                             ; $489F: $20 $0D

    ldh  a, [hDefaultMusicTrack]                  ; $48A1: $F0 $B0
    ld   [wMusicTrackToPlay], a                   ; $48A3: $EA $68 $D3
    ld   a, $01                                   ; $48A6: $3E $01
    ld   [wMusicTrackTiming], a                   ; $48A8: $EA $0B $C1
    ld   [wC167], a                               ; $48AB: $EA $67 $C1

.jr_48AE
    ldh  [hLinkInteractiveMotionBlocked], a       ; $48AE: $E0 $A1
    ld   hl, wEntitiesInertiaTable                ; $48B0: $21 $D0 $C3
    add  hl, bc                                   ; $48B3: $09
    inc  [hl]                                     ; $48B4: $34
    inc  [hl]                                     ; $48B5: $34
    inc  [hl]                                     ; $48B6: $34
    inc  [hl]                                     ; $48B7: $34
    call GetEntityTransitionCountdown             ; $48B8: $CD $05 $0C
    ret  nz                                       ; $48BB: $C0

    ld   [wMusicTrackTiming], a                   ; $48BC: $EA $0B $C1
    ld   [wC167], a                               ; $48BF: $EA $67 $C1
    ldh  a, [hDefaultMusicTrack]                  ; $48C2: $F0 $B0
    ld   [wMusicTrackToPlay], a                   ; $48C4: $EA $68 $D3
    call_open_dialog Dialog0FE                    ; $48C7
    jp   IncrementEntityState                     ; $48CC: $C3 $12 $3B

func_005_48CF::
    ld   a, [wDialogState]                        ; $48CF: $FA $9F $C1
    and  a                                        ; $48D2: $A7
    ret  nz                                       ; $48D3: $C0

    ld   a, $2A                                   ; $48D4: $3E $2A
    ld   [wDialogGotItemCountdown], a             ; $48D6: $EA $AA $C1
    ld   a, DIALOG_GOT_MAGIC_POWDER               ; $48D9: $3E $03
    ld   [wDialogGotItem], a                      ; $48DB: $EA $A9 $C1
    ld   d, $0C                                   ; $48DE: $16 $0C
    call AssignItemToSlot                         ; $48E0: $CD $21 $53
    ld   a, [wMagicPowderCount]                   ; $48E3: $FA $4C $DB
    add  $20                                      ; $48E6: $C6 $20
    daa                                           ; $48E8: $27
    ld   [wMagicPowderCount], a                   ; $48E9: $EA $4C $DB
    ld   a, REPLACE_TILES_MAGIC_POWDER            ; $48EC: $3E $0B
    ldh  [hReplaceTiles], a                       ; $48EE: $E0 $A5
    ld   a, JINGLE_TREASURE_FOUND                 ; $48F0: $3E $01
    ldh  [hJingle], a                             ; $48F2: $E0 $F2
    call IncrementEntityState                     ; $48F4: $CD $12 $3B

func_005_48F7::
    ld   a, [wC1A2]                               ; $48F7: $FA $A2 $C1
    and  a                                        ; $48FA: $A7
    ret  z                                        ; $48FB: $C8

    ld   a, [wBGPaletteEffectAddress]             ; $48FC: $FA $CC $C3
    and  a                                        ; $48FF: $A7
    ret  nz                                       ; $4900: $C0

    ld   a, [wPaletteDataFlags]                   ; $4901: $FA $D1 $DD
    and  a                                        ; $4904: $A7
    ret  nz                                       ; $4905: $C0

    jp   IncrementEntityState                     ; $4906: $C3 $12 $3B

func_005_4909::
    call_open_dialog Dialog17E ; "Good job!"      ; $4909: $3E $7E $CD $73 $23
    jp   IncrementEntityState                     ; $490E: $C3 $12 $3B

func_005_4911::
    ret                                           ; $4911: $C9
