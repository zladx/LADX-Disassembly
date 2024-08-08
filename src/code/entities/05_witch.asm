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
    ldh  a, [hActiveEntitySpriteVariant]          ;; 05:47C0 $F0 $F1
    rla                                           ;; 05:47C2 $17
    rla                                           ;; 05:47C3 $17
    rla                                           ;; 05:47C4 $17
    rla                                           ;; 05:47C5 $17
    and  $F0                                      ;; 05:47C6 $E6 $F0
    ld   e, a                                     ;; 05:47C8 $5F
    ld   d, b                                     ;; 05:47C9 $50
    ld   hl, Data_005_4780                        ;; 05:47CA $21 $80 $47
    add  hl, de                                   ;; 05:47CD $19
    ld   c, $04                                   ;; 05:47CE $0E $04
    jp   RenderActiveEntitySpritesRect            ;; 05:47D0 $C3 $E6 $3C

WitchEntityHandler::
    push bc                                       ;; 05:47D3 $C5
    sla  c                                        ;; 05:47D4 $CB $21
    sla  c                                        ;; 05:47D6 $CB $21
    ld   a, $0C                                   ;; 05:47D8 $3E $0C
    ld   hl, wEntitiesHitboxPositionTable         ;; 05:47DA $21 $80 $D5
    add  hl, bc                                   ;; 05:47DD $09
    inc  hl                                       ;; 05:47DE $23
    inc  hl                                       ;; 05:47DF $23
    ld   [hl], a                                  ;; 05:47E0 $77
    ld   a, $0E                                   ;; 05:47E1 $3E $0E
    inc  hl                                       ;; 05:47E3 $23
    ld   [hl], a                                  ;; 05:47E4 $77
    pop  bc                                       ;; 05:47E5 $C1
    ld   hl, wEntitiesPosYTable                   ;; 05:47E6 $21 $10 $C2
    add  hl, bc                                   ;; 05:47E9 $09
    ld   a, $40                                   ;; 05:47EA $3E $40
    ld   [hl], a                                  ;; 05:47EC $77
    call func_005_47C0                            ;; 05:47ED $CD $C0 $47
    ld   hl, wEntitiesInertiaTable                ;; 05:47F0 $21 $D0 $C3
    add  hl, bc                                   ;; 05:47F3 $09
    inc  [hl]                                     ;; 05:47F4 $34
    ld   a, [hl]                                  ;; 05:47F5 $7E
    rra                                           ;; 05:47F6 $1F
    rra                                           ;; 05:47F7 $1F
    rra                                           ;; 05:47F8 $1F
    rra                                           ;; 05:47F9 $1F
    and  $03                                      ;; 05:47FA $E6 $03
    call SetEntitySpriteVariant                   ;; 05:47FC $CD $0C $3B
    call PushLinkOutOfEntity_05                   ;; 05:47FF $CD $C3 $54
    ldh  a, [hActiveEntityState]                  ;; 05:4802 $F0 $F0
    JP_TABLE                                      ;; 05:4804
._00 dw func_005_4815                             ;; 05:4805
._01 dw func_005_485F                             ;; 05:4807
._02 dw func_005_487D                             ;; 05:4809
._03 dw func_005_4896                             ;; 05:480B
._04 dw func_005_48CF                             ;; 05:480D
._05 dw func_005_48F7                             ;; 05:480F
._06 dw func_005_4909                             ;; 05:4811
._07 dw func_005_4911                             ;; 05:4813

func_005_4815::
    ld   a, [wDialogState]
    and  a                                        ;; 05:4818 $A7
    ret  nz                                       ;; 05:4819 $C0

    ld   a, [wHasToadstool]                       ;; 05:481A $FA $4B $DB
    and  a                                        ;; 05:481D $A7
    jr   z, jr_005_484A                           ;; 05:481E $28 $2A

    call ShouldLinkTalkToEntity_05                ;; 05:4820 $CD $06 $55
    ld   a, e                                     ;; 05:4823 $7B
    and  a                                        ;; 05:4824 $A7
    ret  z                                        ;; 05:4825 $C8

    ld   hl, wInventoryItems.BButtonSlot          ;; 05:4826 $21 $00 $DB
    ld   a, [hl]                                  ;; 05:4829 $7E
    cp   INVENTORY_MAGIC_POWDER                   ;; 05:482A $FE $0C
    jr   nz, .checkAButtonSlot                    ;; 05:482C $20 $0E

    ldh  a, [hJoypadState]                        ;; 05:482E $F0 $CC
    and  J_B                                      ;; 05:4830 $E6 $20
    ret  z                                        ;; 05:4832 $C8

    xor  a                                        ;; 05:4833 $AF
    ld   [wDialogGotItem], a                      ;; 05:4834 $EA $A9 $C1
    ld   [wC1A8], a                               ;; 05:4837 $EA $A8 $C1
    jr   jr_005_4847                              ;; 05:483A $18 $0B

.checkAButtonSlot:
    ; check A Button slot
    ; improvement: could be done in one command
    inc  hl                                       ;; 05:483C $23
    ld   a, [hl]                                  ;; 05:483D $7E
    cp   INVENTORY_MAGIC_POWDER                   ;; 05:483E $FE $0C
    jr   nz, jr_005_484A                          ;; 05:4840 $20 $08

    ldh  a, [hJoypadState]                        ;; 05:4842 $F0 $CC
    and  J_A                                      ;; 05:4844 $E6 $10
    ret  z                                        ;; 05:4846 $C8

jr_005_4847:
    ld   [hl], b                                  ;; 05:4847 $70
    jr   jr_005_4853                              ;; 05:4848 $18 $09

jr_005_484A:
    call ShouldLinkTalkToEntity_05                ;; 05:484A $CD $06 $55
    ret  nc                                       ;; 05:484D $D0

    jp_open_dialog Dialog00C                      ;; 05:484E

jr_005_4853:
    xor  a                                        ;; 05:4853 $AF
    ld   [wHasToadstool], a                       ;; 05:4854 $EA $4B $DB
    call GetEntityTransitionCountdown             ;; 05:4857 $CD $05 $0C
    ld   [hl], $08                                ;; 05:485A $36 $08
    jp   IncrementEntityState                     ;; 05:485C $C3 $12 $3B

func_005_485F::
    ld   a, [wGameplayType]                       ;; 05:485F $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 05:4862 $FE $0B
    ret  nz                                       ;; 05:4864 $C0

    ld   a, [wTransitionSequenceCounter]          ;; 05:4865 $FA $6B $C1
    cp   $04                                      ;; 05:4868 $FE $04
    ret  nz                                       ;; 05:486A $C0

    ld   a, $02                                   ;; 05:486B $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 05:486D $E0 $A1
    ld   [wC167], a                               ;; 05:486F $EA $67 $C1
    call GetEntityTransitionCountdown             ;; 05:4872 $CD $05 $0C
    ret  nz                                       ;; 05:4875 $C0

    xor  a                                        ;; 05:4876 $AF
    ld   [wC167], a                               ;; 05:4877 $EA $67 $C1
    jp   IncrementEntityState                     ;; 05:487A $C3 $12 $3B

func_005_487D::
    ld   a, [wGameplayType]                       ;; 05:487D $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 05:4880 $FE $0B
    ret  nz                                       ;; 05:4882 $C0

    ld   a, [wTransitionSequenceCounter]          ;; 05:4883 $FA $6B $C1
    cp   $04                                      ;; 05:4886 $FE $04
    ret  nz                                       ;; 05:4888 $C0

    call_open_dialog Dialog009                    ;; 05:4889
    call GetEntityTransitionCountdown             ;; 05:488E $CD $05 $0C
    ld   [hl], $C0                                ;; 05:4891 $36 $C0
    jp   IncrementEntityState                     ;; 05:4893 $C3 $12 $3B

func_005_4896::
    ld   a, [wDialogState]                        ;; 05:4896 $FA $9F $C1
    and  a                                        ;; 05:4899 $A7
    ret  nz                                       ;; 05:489A $C0

    ld   a, [wMusicTrackTiming]                   ;; 05:489B $FA $0B $C1
    and  a                                        ;; 05:489E $A7
    jr   nz, .jr_48AE                             ;; 05:489F $20 $0D

    ldh  a, [hDefaultMusicTrack]                  ;; 05:48A1 $F0 $B0
    ld   [wMusicTrackToPlay], a                   ;; 05:48A3 $EA $68 $D3
    ld   a, $01                                   ;; 05:48A6 $3E $01
    ld   [wMusicTrackTiming], a                   ;; 05:48A8 $EA $0B $C1
    ld   [wC167], a                               ;; 05:48AB $EA $67 $C1

.jr_48AE
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 05:48AE $E0 $A1
    ld   hl, wEntitiesInertiaTable                ;; 05:48B0 $21 $D0 $C3
    add  hl, bc                                   ;; 05:48B3 $09
    inc  [hl]                                     ;; 05:48B4 $34
    inc  [hl]                                     ;; 05:48B5 $34
    inc  [hl]                                     ;; 05:48B6 $34
    inc  [hl]                                     ;; 05:48B7 $34
    call GetEntityTransitionCountdown             ;; 05:48B8 $CD $05 $0C
    ret  nz                                       ;; 05:48BB $C0

    ld   [wMusicTrackTiming], a                   ;; 05:48BC $EA $0B $C1
    ld   [wC167], a                               ;; 05:48BF $EA $67 $C1
    ldh  a, [hDefaultMusicTrack]                  ;; 05:48C2 $F0 $B0
    ld   [wMusicTrackToPlay], a                   ;; 05:48C4 $EA $68 $D3
    call_open_dialog Dialog0FE                    ;; 05:48C7
    jp   IncrementEntityState                     ;; 05:48CC $C3 $12 $3B

func_005_48CF::
    ld   a, [wDialogState]                        ;; 05:48CF $FA $9F $C1
    and  a                                        ;; 05:48D2 $A7
    ret  nz                                       ;; 05:48D3 $C0

    ld   a, $2A                                   ;; 05:48D4 $3E $2A
    ld   [wDialogGotItemCountdown], a             ;; 05:48D6 $EA $AA $C1
    ld   a, DIALOG_GOT_MAGIC_POWDER               ;; 05:48D9 $3E $03
    ld   [wDialogGotItem], a                      ;; 05:48DB $EA $A9 $C1
    ld   d, $0C                                   ;; 05:48DE $16 $0C
    call AssignItemToSlot                         ;; 05:48E0 $CD $21 $53
    ld   a, [wMagicPowderCount]                   ;; 05:48E3 $FA $4C $DB
    add  $20                                      ;; 05:48E6 $C6 $20
    daa                                           ;; 05:48E8 $27
    ld   [wMagicPowderCount], a                   ;; 05:48E9 $EA $4C $DB
    ld   a, REPLACE_TILES_MAGIC_POWDER            ;; 05:48EC $3E $0B
    ldh  [hReplaceTiles], a                       ;; 05:48EE $E0 $A5
    ld   a, JINGLE_TREASURE_FOUND                 ;; 05:48F0 $3E $01
    ldh  [hJingle], a                             ;; 05:48F2 $E0 $F2
    call IncrementEntityState                     ;; 05:48F4 $CD $12 $3B

func_005_48F7::
    ld   a, [wC1A2]                               ;; 05:48F7 $FA $A2 $C1
    and  a                                        ;; 05:48FA $A7
    ret  z                                        ;; 05:48FB $C8

    ld   a, [wBGPaletteEffectAddress]             ;; 05:48FC $FA $CC $C3
    and  a                                        ;; 05:48FF $A7
    ret  nz                                       ;; 05:4900 $C0

    ld   a, [wPaletteDataFlags]                   ;; 05:4901 $FA $D1 $DD
    and  a                                        ;; 05:4904 $A7
    ret  nz                                       ;; 05:4905 $C0

    jp   IncrementEntityState                     ;; 05:4906 $C3 $12 $3B

func_005_4909::
    call_open_dialog Dialog17E ; "Good job!"      ;; 05:4909 $3E $7E $CD $73 $23
    jp   IncrementEntityState                     ;; 05:490E $C3 $12 $3B

func_005_4911::
    ret                                           ;; 05:4911 $C9
