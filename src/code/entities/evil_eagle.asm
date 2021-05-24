Data_005_59DE:
IF __PATCH_0__
incbin "gfx/characters/evil_eagle/oam_rider_v1.2bpp"
ELSE
incbin "gfx/characters/evil_eagle/oam_rider_v0.2bpp"
ENDC

Data_005_59FE::
incbin "gfx/characters/evil_eagle/oam_rider_hidden.2bpp"

; Note: this entity, unlike most others, use all 4 spriteslots available.
;
; Normally only 2 spriteslots can be loaded on a map transition, but this
; boss is behind a warp. And warps will load all 4 tileslots at once.
EntityInitEvilEagle::
    ld   hl, wEntitiesOptions1Table               ; $5A1E: $21 $30 $C4
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

    ld   a, [wD478]                               ; $5A34: $FA $78 $D4
    and  a                                        ; $5A37: $A7
    jr   z, jr_005_5A5D                           ; $5A38: $28 $23

    ld   a, $05                                   ; $5A3A: $3E $05
    call SwitchBank                               ; $5A3C: $CD $0C $08
IF __PATCH_0__
    call func_005_5B09
ELSE
    call func_005_5B03                            ; $5A3F: $CD $03 $5B
ENDC
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
    ld   [wD478], a                               ; $5A61: $EA $78 $D4
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
    ld   a, MUSIC_GRIM_CREEPER_DIALOG             ; $5A78: $3E $5C
    ld   [wMusicTrackToPlay], a                   ; $5A7A: $EA $68 $D3

Data_005_5A7D::
    db   $C9, $10, $F0

EvilEagleEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $5A80: $21 $B0 $C2
    add  hl, bc                                   ; $5A83: $09
    ld   a, [hl]                                  ; $5A84: $7E
    JP_TABLE                                      ; $5A85
._00 dw func_005_5A8E                             ; $5A86
._01 dw func_005_5B6B                             ; $5A88
._02 dw func_005_6256                             ; $5A8A
._03 dw func_005_62C8                             ; $5A8C

func_005_5A8E::
    ldh  a, [hActiveEntityState]                  ; $5A8E: $F0 $F0
    JP_TABLE                                      ; $5A90
._00 dw func_005_5A9C                             ; $5A91
._01 dw func_005_5ADB                             ; $5A93
._02 dw func_005_5B38                             ; $5A95
._03 dw func_005_5B3B                             ; $5A97
._04 dw func_005_5B4B                             ; $5A99

jr_005_5A9B:
    ret                                           ; $5A9B: $C9

func_005_5A9C::
    call func_005_5B5A                            ; $5A9C: $CD $5A $5B
    ldh  a, [hActiveEntityStatus]                 ; $5A9F: $F0 $EA
    cp   $05                                      ; $5AA1: $FE $05
    jr   nz, jr_005_5A9B                          ; $5AA3: $20 $F6

    ld   a, $02                                   ; $5AA5: $3E $02

jr_005_5AA7:
    ldh  [hMultiPurposeG], a                               ; $5AA7: $E0 $E8
    ld   a, ENTITY_EVIL_EAGLE                     ; $5AA9: $3E $63
    call SpawnNewEntity_trampoline                ; $5AAB: $CD $86 $3B
    push bc                                       ; $5AAE: $C5
    ldh  a, [hMultiPurposeG]                               ; $5AAF: $F0 $E8
    ld   c, a                                     ; $5AB1: $4F
    ld   hl, Data_005_5A7D                        ; $5AB2: $21 $7D $5A
    add  hl, bc                                   ; $5AB5: $09
    ldh  a, [hMultiPurpose0]                      ; $5AB6: $F0 $D7
    add  [hl]                                     ; $5AB8: $86
    ld   hl, wEntitiesPosXTable                   ; $5AB9: $21 $00 $C2
    add  hl, de                                   ; $5ABC: $19
    ld   [hl], a                                  ; $5ABD: $77
    ldh  a, [hMultiPurpose1]                      ; $5ABE: $F0 $D8
    sub  $10                                      ; $5AC0: $D6 $10
    ld   hl, wEntitiesPosYTable                   ; $5AC2: $21 $10 $C2
    add  hl, de                                   ; $5AC5: $19
    ld   [hl], a                                  ; $5AC6: $77
    pop  bc                                       ; $5AC7: $C1
    ld   hl, wEntitiesPrivateState1Table          ; $5AC8: $21 $B0 $C2
    add  hl, de                                   ; $5ACB: $19
    ld   [hl], $02                                ; $5ACC: $36 $02
    ldh  a, [hMultiPurposeG]                               ; $5ACE: $F0 $E8
    dec  a                                        ; $5AD0: $3D
    jr   nz, jr_005_5AA7                          ; $5AD1: $20 $D4

    call GetEntityTransitionCountdown             ; $5AD3: $CD $05 $0C
    ld   [hl], $43                                ; $5AD6: $36 $43
    jp   IncrementEntityState                     ; $5AD8: $C3 $12 $3B

func_005_5ADB::
    call func_005_5B5A                            ; $5ADB: $CD $5A $5B
    call func_005_7A3A                            ; $5ADE: $CD $3A $7A
    ld   a, $02                                   ; $5AE1: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5AE3: $E0 $A1
IF __PATCH_0__
    ld   [wC167], a
ENDC
    call GetEntityTransitionCountdown             ; $5AE5: $CD $05 $0C
    and  a                                        ; $5AE8: $A7
    jr   z, jr_005_5AFE                           ; $5AE9: $28 $13

    cp   $20                                      ; $5AEB: $FE $20
    ret  nz                                       ; $5AED: $C0

    ldh  a, [hLinkPositionY]                      ; $5AEE: $F0 $99
    push af                                       ; $5AF0: $F5
    ld   a, $10                                   ; $5AF1: $3E $10
    ldh  [hLinkPositionY], a                      ; $5AF3: $E0 $99
    call_open_dialog $0BA                         ; $5AF5
    pop  af                                       ; $5AFA: $F1
    ldh  [hLinkPositionY], a                      ; $5AFB: $E0 $99
    ret                                           ; $5AFD: $C9

jr_005_5AFE:
IF __PATCH_0__
    xor  a
    ld   [$de0b], a
ENDC
    ld   a, MUSIC_EAGLES_TOWER_BOSS_CUTSCENE      ; $5AFE: $3E $54
IF __PATCH_0__
    jr   jr_005_5b15
ENDC

func_005_5B09:
IF __PATCH_0__
    ld   a, [$de0b]
    and  a
    jr   z, func_005_5B03
    xor  a
    ld   [$de0b], a
    ld   a, MUSIC_BOSS_BATTLE
ENDC

jr_005_5b15:
    ld   [wMusicTrackToPlay], a                   ; $5B00: $EA $68 $D3

func_005_5B03::
    ld   a, ENTITY_EVIL_EAGLE                     ; $5B03: $3E $63
    call SpawnNewEntity_trampoline                ; $5B05: $CD $86 $3B
    ld   hl, wEntitiesHealthTable                 ; $5B08: $21 $60 $C3
    add  hl, de                                   ; $5B0B: $19
    ld   [hl], $0C                                ; $5B0C: $36 $0C
    ld   hl, wEntitiesPosXTable                   ; $5B0E: $21 $00 $C2
    add  hl, de                                   ; $5B11: $19
    ld   [hl], $D0                                ; $5B12: $36 $D0
    ld   hl, wEntitiesPosYTable                   ; $5B14: $21 $10 $C2
    add  hl, de                                   ; $5B17: $19
    ld   [hl], $18                                ; $5B18: $36 $18
    ld   hl, wEntitiesPrivateState1Table          ; $5B1A: $21 $B0 $C2
    add  hl, de                                   ; $5B1D: $19
    ld   [hl], $01                                ; $5B1E: $36 $01
    ld   hl, wEntitiesSpeedXTable                 ; $5B20: $21 $40 $C2
    add  hl, de                                   ; $5B23: $19
    ld   [hl], $E0                                ; $5B24: $36 $E0
    ld   hl, wEntitiesDirectionTable              ; $5B26: $21 $80 $C3
    add  hl, de                                   ; $5B29: $19
    ld   [hl], $00                                ; $5B2A: $36 $00
    ld   hl, wEntitiesTransitionCountdownTable    ; $5B2C: $21 $E0 $C2
    add  hl, de                                   ; $5B2F: $19
    ld   [hl], $80                                ; $5B30: $36 $80
    call func_005_5C20                            ; $5B32: $CD $20 $5C
    jp   IncrementEntityState                     ; $5B35: $C3 $12 $3B

func_005_5B38::
    jp   func_005_5B5A                            ; $5B38: $C3 $5A $5B

func_005_5B3B::
    call func_005_5B5A                            ; $5B3B: $CD $5A $5B
    call func_005_7A3A                            ; $5B3E: $CD $3A $7A
    call UpdateEntityPosWithSpeed_05              ; $5B41: $CD $B1 $7A
    ld   hl, wEntitiesSpeedYTable                 ; $5B44: $21 $50 $C2
    add  hl, bc                                   ; $5B47: $09
    inc  [hl]                                     ; $5B48: $34
    inc  [hl]                                     ; $5B49: $34
    ret                                           ; $5B4A: $C9

func_005_5B4B::
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5B4B: $21 $40 $C3
    add  hl, bc                                   ; $5B4E: $09
    ld   [hl], $C2                                ; $5B4F: $36 $C2

IF __PATCH_0__
    xor  a
    ld   [wC167], a
ENDC

    ret                                           ; $5B51: $C9

Data_005_5B52::
    db   $7E, $02, $7E, $22, $7E, $42, $7E, $62

func_005_5B5A::
    ld   de, Data_005_5B52                        ; $5B5A: $11 $52 $5B
    jp   RenderActiveEntitySpritesPair                ; $5B5D: $C3 $C0 $3B

Data_005_5B60::
    db   $02, $02, $02, $00, $01, $00, $01, $04, $04, $04, $04

func_005_5B6B::
    call func_005_61F2                            ; $5B6B: $CD $F2 $61
    ldh  a, [hActiveEntityStatus]                 ; $5B6E: $F0 $EA
    cp   $05                                      ; $5B70: $FE $05
    jp   nz, label_005_7E6C                       ; $5B72: $C2 $6C $7E

    call func_005_7A3A                            ; $5B75: $CD $3A $7A
    call DecrementEntityIgnoreHitsCountdown       ; $5B78: $CD $56 $0C
    ldh  a, [hActiveEntityState]                  ; $5B7B: $F0 $F0
    cp   $0E                                      ; $5B7D: $FE $0E
    jr   z, jr_005_5BB7                           ; $5B7F: $28 $36

    ld   hl, wEntitiesFlashCountdownTable         ; $5B81: $21 $20 $C4
    add  hl, bc                                   ; $5B84: $09
    ld   a, [hl]                                  ; $5B85: $7E
    and  a                                        ; $5B86: $A7
    jr   z, jr_005_5BB7                           ; $5B87: $28 $2E

    ld   hl, wEntitiesFlashCountdownTable         ; $5B89: $21 $20 $C4
    add  hl, bc                                   ; $5B8C: $09
    ld   [hl], $50                                ; $5B8D: $36 $50
    call ClearEntitySpeed                         ; $5B8F: $CD $7F $3D
    call IncrementEntityState                     ; $5B92: $CD $12 $3B
    ld   [hl], $0E                                ; $5B95: $36 $0E
    ld   a, $31                                   ; $5B97: $3E $31
    ldh  [hNoiseSfx], a                           ; $5B99: $E0 $F4
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5B9B: $21 $40 $C3
    add  hl, bc                                   ; $5B9E: $09
    ld   [hl], $42                                ; $5B9F: $36 $42
    ld   hl, wEntitiesUnknownTableD               ; $5BA1: $21 $D0 $C2
    add  hl, bc                                   ; $5BA4: $09
    inc  [hl]                                     ; $5BA5: $34
    ld   a, [hl]                                  ; $5BA6: $7E
    cp   $08                                      ; $5BA7: $FE $08
    jr   nz, jr_005_5BAC                          ; $5BA9: $20 $01

    dec  [hl]                                     ; $5BAB: $35

jr_005_5BAC:
    ld   e, a                                     ; $5BAC: $5F
    ld   d, b                                     ; $5BAD: $50
    ld   hl, Data_005_5B60                        ; $5BAE: $21 $60 $5B
    add  hl, de                                   ; $5BB1: $19
    ld   a, [hl]                                  ; $5BB2: $7E
    ld   [$D205], a                               ; $5BB3: $EA $05 $D2
    ret                                           ; $5BB6: $C9

jr_005_5BB7:
    ldh  a, [hActiveEntityState]                  ; $5BB7: $F0 $F0
    JP_TABLE                                      ; $5BB9
._00 dw func_005_5BD8                             ; $5BBA
._01 dw func_005_5BEC                             ; $5BBC
._02 dw func_005_5C32                             ; $5BBE
._03 dw func_005_5C5B                             ; $5BC0
._04 dw func_005_5C8B                             ; $5BC2
._05 dw func_005_5CAD                             ; $5BC4
._06 dw func_005_5CCF                             ; $5BC6
._07 dw func_005_5D14                             ; $5BC8
._08 dw func_005_5DEC                             ; $5BCA
._09 dw func_005_5E3D                             ; $5BCC
._0A dw func_005_5F3B                             ; $5BCE
._0B dw func_005_5F93                             ; $5BD0
._0C dw func_005_5FA8                             ; $5BD2
._0D dw func_005_6017                             ; $5BD4
._0E dw func_005_6028                             ; $5BD6

func_005_5BD8::
    call UpdateEntityPosWithSpeed_05              ; $5BD8: $CD $B1 $7A
    call GetEntityTransitionCountdown             ; $5BDB: $CD $05 $0C
    ret  nz                                       ; $5BDE: $C0

    call IncrementEntityState                     ; $5BDF: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $5BE2: $CD $05 $0C
    ld   [hl], $20                                ; $5BE5: $36 $20
    ld   a, $FF                                   ; $5BE7: $3E $FF
    jp   SetEntitySpriteVariant                   ; $5BE9: $C3 $0C $3B

func_005_5BEC::
    call GetEntityTransitionCountdown             ; $5BEC: $CD $05 $0C
    jr   nz, jr_005_5C24                          ; $5BEF: $20 $33

    xor  a                                        ; $5BF1: $AF
    call SetEntitySpriteVariant                   ; $5BF2: $CD $0C $3B
    ld   hl, wEntitiesPosYTable                   ; $5BF5: $21 $10 $C2
    add  hl, bc                                   ; $5BF8: $09
    ld   a, [hl]                                  ; $5BF9: $7E
    add  $14                                      ; $5BFA: $C6 $14
    ld   [hl], a                                  ; $5BFC: $77
    ld   hl, wEntitiesSpeedXTable                 ; $5BFD: $21 $40 $C2
    add  hl, bc                                   ; $5C00: $09
    ld   a, [hl]                                  ; $5C01: $7E
    cpl                                           ; $5C02: $2F
    inc  a                                        ; $5C03: $3C
    ld   [hl], a                                  ; $5C04: $77
    ld   hl, wEntitiesDirectionTable              ; $5C05: $21 $80 $C3
    add  hl, bc                                   ; $5C08: $09
    ld   a, [hl]                                  ; $5C09: $7E
    xor  $04                                      ; $5C0A: $EE $04
    ld   [hl], a                                  ; $5C0C: $77
    ld   hl, wEntitiesPrivateState2Table          ; $5C0D: $21 $C0 $C2
    add  hl, bc                                   ; $5C10: $09
    inc  [hl]                                     ; $5C11: $34
    ld   a, [hl]                                  ; $5C12: $7E
    cp   $02                                      ; $5C13: $FE $02
    jr   z, jr_005_5C25                           ; $5C15: $28 $0E

    call IncrementEntityState                     ; $5C17: $CD $12 $3B
    ld   [hl], b                                  ; $5C1A: $70
    call GetEntityTransitionCountdown             ; $5C1B: $CD $05 $0C
    ld   [hl], $80                                ; $5C1E: $36 $80

func_005_5C20::
    ld   a, $22                                   ; $5C20: $3E $22
    ldh  [hNoiseSfx], a                           ; $5C22: $E0 $F4

jr_005_5C24:
    ret                                           ; $5C24: $C9

jr_005_5C25:
    call IncrementEntityState                     ; $5C25: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $5C28: $CD $05 $0C
    ld   [hl], $30                                ; $5C2B: $36 $30
    ld   a, $30                                   ; $5C2D: $3E $30
    ldh  [hNoiseSfx], a                           ; $5C2F: $E0 $F4
    ret                                           ; $5C31: $C9

func_005_5C32::
    call UpdateEntityPosWithSpeed_05              ; $5C32: $CD $B1 $7A
    call GetEntityTransitionCountdown             ; $5C35: $CD $05 $0C

jr_005_5C38:
    cp   $01                                      ; $5C38: $FE $01
    jr   nz, jr_005_5C41                          ; $5C3A: $20 $05

    ld   hl, hJingle                              ; $5C3C: $21 $F2 $FF
    ld   [hl], JINGLE_EVIL_EAGLE                  ; $5C3F: $36 $30

jr_005_5C41:
    and  a                                        ; $5C41: $A7
    ret  nz                                       ; $5C42: $C0

    ld   hl, wEntitiesSpeedXTable                 ; $5C43: $21 $40 $C2
    add  hl, bc                                   ; $5C46: $09
    inc  [hl]                                     ; $5C47: $34
    jr   nz, jr_005_5C58                          ; $5C48: $20 $0E

    call IncrementEntityState                     ; $5C4A: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $5C4D: $CD $05 $0C
    ld   [hl], $40                                ; $5C50: $36 $40
    ld   hl, wEntitiesStateTable+14                                ; $5C52: $21 $9E $C2
    inc  [hl]                                     ; $5C55: $34
    inc  hl                                       ; $5C56: $23
    inc  [hl]                                     ; $5C57: $34

jr_005_5C58:
    jp   jr_005_5C7B                              ; $5C58: $C3 $7B $5C

func_005_5C5B::
    ld   a, $02                                   ; $5C5B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5C5D: $E0 $A1
    call GetEntityTransitionCountdown             ; $5C5F: $CD $05 $0C
    jr   nz, jr_005_5C7B                          ; $5C62: $20 $17

    ld   [hl], $28                                ; $5C64: $36 $28
    ld   a, $D0                                   ; $5C66: $3E $D0
    ld   [wEntitiesSpeedYTable], a                ; $5C68: $EA $50 $C2
    ld   a, JINGLE_JUMP                           ; $5C6B: $3E $24
    ldh  [hJingle], a                             ; $5C6D: $E0 $F2
    ld   a, $12                                   ; $5C6F: $3E $12
    ld   [wEntitiesSpeedXTable], a                ; $5C71: $EA $40 $C2
    ld   hl, wEntitiesStateTable                  ; $5C74: $21 $90 $C2
    inc  [hl]                                     ; $5C77: $34
    call IncrementEntityState                     ; $5C78: $CD $12 $3B

jr_005_5C7B:
    ld   hl, wEntitiesUnknowTableY                ; $5C7B: $21 $D0 $C3
    add  hl, bc                                   ; $5C7E: $09
    inc  [hl]                                     ; $5C7F: $34
    ld   a, [hl]                                  ; $5C80: $7E
    and  $04                                      ; $5C81: $E6 $04
    ld   a, $01                                   ; $5C83: $3E $01
    jr   z, jr_005_5C88                           ; $5C85: $28 $01

    inc  a                                        ; $5C87: $3C

jr_005_5C88:
    jp   SetEntitySpriteVariant                   ; $5C88: $C3 $0C $3B

func_005_5C8B::
    ld   a, $02                                   ; $5C8B: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5C8D: $E0 $A1
    call GetEntityTransitionCountdown             ; $5C8F: $CD $05 $0C
    jr   nz, jr_005_5CA6                          ; $5C92: $20 $12

    ld   a, $01                                   ; $5C94: $3E $01
    ldh  [hFFA5], a                               ; $5C96: $E0 $A5
    ld   [hl], $20                                ; $5C98: $36 $20
    call IncrementEntityState                     ; $5C9A: $CD $12 $3B
    ld   hl, wEntitiesStateTable                  ; $5C9D: $21 $90 $C2
    inc  [hl]                                     ; $5CA0: $34
    ld   a, $C0                                   ; $5CA1: $3E $C0
    ld   [wEntitiesPosYTable], a                  ; $5CA3: $EA $10 $C2

jr_005_5CA6:
    jp   jr_005_5C7B                              ; $5CA6: $C3 $7B $5C

Data_005_5CA9::
    db   $01, $02, $03, $02

func_005_5CAD::
    ld   a, $02                                   ; $5CAD: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $5CAF: $E0 $A1
    call GetEntityTransitionCountdown             ; $5CB1: $CD $05 $0C
    jr   nz, func_005_5CB9                        ; $5CB4: $20 $03

    call IncrementEntityState                     ; $5CB6: $CD $12 $3B

func_005_5CB9::
    ld   hl, wEntitiesUnknowTableY                ; $5CB9: $21 $D0 $C3
    add  hl, bc                                   ; $5CBC: $09
    inc  [hl]                                     ; $5CBD: $34
    ld   a, [hl]                                  ; $5CBE: $7E
    rra                                           ; $5CBF: $1F
    rra                                           ; $5CC0: $1F
    rra                                           ; $5CC1: $1F
    nop                                           ; $5CC2: $00
    and  $03                                      ; $5CC3: $E6 $03
    ld   e, a                                     ; $5CC5: $5F
    ld   d, b                                     ; $5CC6: $50
    ld   hl, Data_005_5CA9                        ; $5CC7: $21 $A9 $5C
    add  hl, de                                   ; $5CCA: $19
    ld   a, [hl]                                  ; $5CCB: $7E
    jp   SetEntitySpriteVariant                   ; $5CCC: $C3 $0C $3B

func_005_5CCF::
    call UpdateEntityPosWithSpeed_05              ; $5CCF: $CD $B1 $7A
    ld   hl, wEntitiesSpeedXTable                 ; $5CD2: $21 $40 $C2
    add  hl, bc                                   ; $5CD5: $09
    ld   a, [hl]                                  ; $5CD6: $7E
    cp   $D4                                      ; $5CD7: $FE $D4
    jr   nz, jr_005_5CFB                          ; $5CD9: $20 $20

    ldh  a, [hActiveEntityPosX]                   ; $5CDB: $F0 $EE
    and  $F8                                      ; $5CDD: $E6 $F8
    cp   $C0                                      ; $5CDF: $FE $C0
    jr   nz, jr_005_5CEC                          ; $5CE1: $20 $09

    call IncrementEntityState                     ; $5CE3: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $5CE6: $CD $05 $0C
    ld   [hl], $80                                ; $5CE9: $36 $80
    ret                                           ; $5CEB: $C9

jr_005_5CEC:
    ldh  a, [hFrameCounter]                       ; $5CEC: $F0 $E7
    and  $00                                      ; $5CEE: $E6 $00
    jr   nz, jr_005_5CF7                          ; $5CF0: $20 $05

jr_005_5CF2:
    ld   hl, wEntitiesSpeedYTable                 ; $5CF2: $21 $50 $C2
    add  hl, bc                                   ; $5CF5: $09
    dec  [hl]                                     ; $5CF6: $35

jr_005_5CF7:
    xor  a                                        ; $5CF7: $AF
    jp   SetEntitySpriteVariant                   ; $5CF8: $C3 $0C $3B

jr_005_5CFB:
    dec  [hl]                                     ; $5CFB: $35
    dec  [hl]                                     ; $5CFC: $35
    call func_005_5CB9                            ; $5CFD: $CD $B9 $5C
    call func_005_5CB9                            ; $5D00: $CD $B9 $5C
    jp   func_005_5CB9                            ; $5D03: $C3 $B9 $5C

Data_005_5D06::
    db   $F8, $A8

Data_005_5D08::
    db   $30, $D0

Data_005_5D0A::
    db   $30, $70

Data_005_5D0C::
    db   $DC, $24

Data_005_5D0E::
    db   $F8, $A8

Data_005_5D10::
    db   $20, $E0

Data_005_5D12::
    db   $04, $00

func_005_5D14::
    call GetEntityTransitionCountdown             ; $5D14: $CD $05 $0C
    jr   nz, jr_005_5D68                          ; $5D17: $20 $4F

    ld   a, [$D205]                               ; $5D19: $FA $05 $D2
    JP_TABLE                                      ; $5D1C
._00 dw func_005_5D27                             ; $5D1D
._01 dw func_005_5D69                             ; $5D1F
._02 dw func_005_5DA3                             ; $5D21
._03 dw func_005_5DA3                             ; $5D23
._04 dw func_005_5D69                             ; $5D25

func_005_5D27::
    call GetRandomByte                            ; $5D27: $CD $0D $28
    and  $03                                      ; $5D2A: $E6 $03
    ld   [$D205], a                               ; $5D2C: $EA $05 $D2
    ld   e, $00                                   ; $5D2F: $1E $00
    ldh  a, [hLinkPositionX]                      ; $5D31: $F0 $98
    cp   $50                                      ; $5D33: $FE $50
    jr   nc, jr_005_5D38                          ; $5D35: $30 $01

    inc  e                                        ; $5D37: $1C

jr_005_5D38:
    ld   d, b                                     ; $5D38: $50
    ld   hl, Data_005_5D06                        ; $5D39: $21 $06 $5D
    add  hl, de                                   ; $5D3C: $19
    ld   a, [hl]                                  ; $5D3D: $7E
    ld   hl, wEntitiesPosXTable                   ; $5D3E: $21 $00 $C2
    add  hl, bc                                   ; $5D41: $09
    ld   [hl], a                                  ; $5D42: $77
    ld   hl, Data_005_5D08                        ; $5D43: $21 $08 $5D
    add  hl, de                                   ; $5D46: $19
    ld   a, [hl]                                  ; $5D47: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5D48: $21 $40 $C2
    add  hl, bc                                   ; $5D4B: $09
    ld   [hl], a                                  ; $5D4C: $77
    ld   hl, Data_005_5D12                        ; $5D4D: $21 $12 $5D
    add  hl, de                                   ; $5D50: $19
    ld   a, [hl]                                  ; $5D51: $7E
    ld   hl, wEntitiesDirectionTable              ; $5D52: $21 $80 $C3
    add  hl, bc                                   ; $5D55: $09
    ld   [hl], a                                  ; $5D56: $77
    ld   hl, wEntitiesPosYTable                   ; $5D57: $21 $10 $C2
    add  hl, bc                                   ; $5D5A: $09
    ld   [hl], $00                                ; $5D5B: $36 $00
    ld   hl, wEntitiesSpeedYTable                 ; $5D5D: $21 $50 $C2
    add  hl, bc                                   ; $5D60: $09
    ld   [hl], $20                                ; $5D61: $36 $20
    call IncrementEntityState                     ; $5D63: $CD $12 $3B
    ld   [hl], $08                                ; $5D66: $36 $08

jr_005_5D68:
    ret                                           ; $5D68: $C9

func_005_5D69::
    ld   e, $00                                   ; $5D69: $1E $00
    ldh  a, [hLinkPositionX]                      ; $5D6B: $F0 $98
    cp   $50                                      ; $5D6D: $FE $50
    jr   nc, jr_005_5D72                          ; $5D6F: $30 $01

    inc  e                                        ; $5D71: $1C

jr_005_5D72:
    ld   d, b                                     ; $5D72: $50
    ld   hl, Data_005_5D0A                        ; $5D73: $21 $0A $5D
    add  hl, de                                   ; $5D76: $19
    ld   a, [hl]                                  ; $5D77: $7E
    ld   hl, wEntitiesPosXTable                   ; $5D78: $21 $00 $C2
    add  hl, bc                                   ; $5D7B: $09

jr_005_5D7C:
    ld   [hl], a                                  ; $5D7C: $77
    ld   hl, wEntitiesSpeedXTable                 ; $5D7D: $21 $40 $C2
    add  hl, bc                                   ; $5D80: $09
    ld   [hl], b                                  ; $5D81: $70
    ld   hl, Data_005_5D12                        ; $5D82: $21 $12 $5D
    add  hl, de                                   ; $5D85: $19
    ld   a, [hl]                                  ; $5D86: $7E
    ld   hl, wEntitiesDirectionTable              ; $5D87: $21 $80 $C3
    add  hl, bc                                   ; $5D8A: $09
    ld   [hl], a                                  ; $5D8B: $77
    ld   hl, wEntitiesPosYTable                   ; $5D8C: $21 $10 $C2
    add  hl, bc                                   ; $5D8F: $09
    ld   [hl], $F0                                ; $5D90: $36 $F0
    ld   hl, wEntitiesSpeedYTable                 ; $5D92: $21 $50 $C2
    add  hl, bc                                   ; $5D95: $09
    ld   [hl], $10                                ; $5D96: $36 $10
    call IncrementEntityState                     ; $5D98: $CD $12 $3B
    ld   [hl], $0B                                ; $5D9B: $36 $0B
    call GetEntityTransitionCountdown             ; $5D9D: $CD $05 $0C
    ld   [hl], $30                                ; $5DA0: $36 $30
    ret                                           ; $5DA2: $C9

func_005_5DA3::
    call GetRandomByte                            ; $5DA3: $CD $0D $28
    and  $01                                      ; $5DA6: $E6 $01
    ld   e, a                                     ; $5DA8: $5F
    ld   d, b                                     ; $5DA9: $50
    ld   hl, Data_005_5D0E                        ; $5DAA: $21 $0E $5D
    add  hl, de                                   ; $5DAD: $19
    ld   a, [hl]                                  ; $5DAE: $7E
    ld   hl, wEntitiesPosXTable                   ; $5DAF: $21 $00 $C2
    add  hl, bc                                   ; $5DB2: $09
    ld   [hl], a                                  ; $5DB3: $77
    ld   hl, Data_005_5D10                        ; $5DB4: $21 $10 $5D
    add  hl, de                                   ; $5DB7: $19
    ld   a, [hl]                                  ; $5DB8: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5DB9: $21 $40 $C2
    add  hl, bc                                   ; $5DBC: $09
    ld   [hl], a                                  ; $5DBD: $77
    ld   hl, wEntitiesSpeedYTable                 ; $5DBE: $21 $50 $C2
    add  hl, bc                                   ; $5DC1: $09
    ld   [hl], b                                  ; $5DC2: $70
    ld   hl, Data_005_5D12                        ; $5DC3: $21 $12 $5D
    add  hl, de                                   ; $5DC6: $19
    ld   a, [hl]                                  ; $5DC7: $7E
    ld   hl, wEntitiesDirectionTable              ; $5DC8: $21 $80 $C3
    add  hl, bc                                   ; $5DCB: $09
    ld   [hl], a                                  ; $5DCC: $77
    call GetRandomByte                            ; $5DCD: $CD $0D $28
    and  $3F                                      ; $5DD0: $E6 $3F
    add  $18                                      ; $5DD2: $C6 $18
    ld   hl, wEntitiesPosYTable                   ; $5DD4: $21 $10 $C2
    add  hl, bc                                   ; $5DD7: $09
    ld   [hl], a                                  ; $5DD8: $77
    ldh  a, [hFF9C]                               ; $5DD9: $F0 $9C
    and  a                                        ; $5DDB: $A7
    jr   z, jr_005_5DE1                           ; $5DDC: $28 $03

    ldh  a, [hLinkPositionY]                      ; $5DDE: $F0 $99
    ld   [hl], a                                  ; $5DE0: $77

jr_005_5DE1:
    call IncrementEntityState                     ; $5DE1: $CD $12 $3B
    ld   [hl], $0D                                ; $5DE4: $36 $0D
    call GetEntityTransitionCountdown             ; $5DE6: $CD $05 $0C
    ld   [hl], $70                                ; $5DE9: $36 $70
    ret                                           ; $5DEB: $C9

func_005_5DEC::
    ld   a, $01                                   ; $5DEC: $3E $01
    call SetEntitySpriteVariant                   ; $5DEE: $CD $0C $3B
    call UpdateEntityPosWithSpeed_05              ; $5DF1: $CD $B1 $7A
    ld   hl, wEntitiesSpeedYTable                 ; $5DF4: $21 $50 $C2
    call func_005_5E01                            ; $5DF7: $CD $01 $5E
    ld   a, [hl]                                  ; $5DFA: $7E
    and  a                                        ; $5DFB: $A7
    jr   z, jr_005_5E0E                           ; $5DFC: $28 $10

    ld   hl, wEntitiesSpeedXTable                 ; $5DFE: $21 $40 $C2

func_005_5E01::
    add  hl, bc                                   ; $5E01: $09
    ld   a, [hl]                                  ; $5E02: $7E
    and  a                                        ; $5E03: $A7
    jr   z, jr_005_5E0D                           ; $5E04: $28 $07

    and  $80                                      ; $5E06: $E6 $80
    jr   nz, jr_005_5E0C                          ; $5E08: $20 $02

    dec  [hl]                                     ; $5E0A: $35
    dec  [hl]                                     ; $5E0B: $35

jr_005_5E0C:
    inc  [hl]                                     ; $5E0C: $34

jr_005_5E0D:
    ret                                           ; $5E0D: $C9

jr_005_5E0E:
    call IncrementEntityState                     ; $5E0E: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $5E11: $CD $05 $0C
    ld   [hl], $FF                                ; $5E14: $36 $FF
    ret                                           ; $5E16: $C9

Data_005_5E17::
    db   $EE, $12

Data_005_5E19::
    db   $D0, $30

Data_005_5E1B::
    db   $10, $F0

Data_005_5E1D::
    db   $D8, $D4, $D0, $CC, $C8, $C4, $C0, $BC, $28, $2C, $30, $34, $38, $3C, $40, $44

Data_005_5E2D::
    db   $30, $2E, $2C, $2A, $28, $26, $24, $22, $30, $2E, $2C, $2A, $28, $26, $24, $22

func_005_5E3D::
    call GetEntityTransitionCountdown             ; $5E3D: $CD $05 $0C
    jp   z, label_005_5F30                        ; $5E40: $CA $30 $5F

    ld   hl, wEntitiesPosYTable                   ; $5E43: $21 $10 $C2
    add  hl, bc                                   ; $5E46: $09
    ldh  a, [hFrameCounter]                       ; $5E47: $F0 $E7
    and  $03                                      ; $5E49: $E6 $03
    jr   nz, jr_005_5E56                          ; $5E4B: $20 $09

    ldh  a, [hFrameCounter]                       ; $5E4D: $F0 $E7
    and  $20                                      ; $5E4F: $E6 $20
    jr   z, jr_005_5E55                           ; $5E51: $28 $02

jr_005_5E53:
    inc  [hl]                                     ; $5E53: $34
    inc  [hl]                                     ; $5E54: $34

jr_005_5E55:
    dec  [hl]                                     ; $5E55: $35

jr_005_5E56:
    call func_005_5CB9                            ; $5E56: $CD $B9 $5C

jr_005_5E59:
    call func_005_5CB9                            ; $5E59: $CD $B9 $5C
    ldh  a, [hFF9C]                               ; $5E5C: $F0 $9C
    and  a                                        ; $5E5E: $A7
    jr   nz, jr_005_5E8A                          ; $5E5F: $20 $29

jr_005_5E61:
    ld   a, [wIsLinkInTheAir]                     ; $5E61: $FA $46 $C1
    and  a                                        ; $5E64: $A7

jr_005_5E65:
    jr   z, jr_005_5E8A                           ; $5E65: $28 $23

jr_005_5E67:
    ld   hl, wEntitiesDirectionTable              ; $5E67: $21 $80 $C3
    add  hl, bc                                   ; $5E6A: $09
    ld   a, [hl]                                  ; $5E6B: $7E
    rra                                           ; $5E6C: $1F
    rra                                           ; $5E6D: $1F
    and  $01                                      ; $5E6E: $E6 $01
    ld   e, a                                     ; $5E70: $5F
    ld   d, b                                     ; $5E71: $50
    ld   hl, Data_005_5E19                        ; $5E72: $21 $19 $5E
    add  hl, de                                   ; $5E75: $19
    ld   a, [hl]                                  ; $5E76: $7E
    ld   hl, hLinkSpeedX                          ; $5E77: $21 $9A $FF
    sub  [hl]                                     ; $5E7A: $96
    and  a                                        ; $5E7B: $A7
    jr   z, jr_005_5EA3                           ; $5E7C: $28 $25

    and  $80                                      ; $5E7E: $E6 $80
    jr   nz, jr_005_5E86                          ; $5E80: $20 $04

    inc  [hl]                                     ; $5E82: $34
    inc  [hl]                                     ; $5E83: $34
    inc  [hl]                                     ; $5E84: $34
    inc  [hl]                                     ; $5E85: $34

jr_005_5E86:
    dec  [hl]                                     ; $5E86: $35
    dec  [hl]                                     ; $5E87: $35
    jr   jr_005_5EA3                              ; $5E88: $18 $19

jr_005_5E8A:
    ld   hl, wEntitiesDirectionTable              ; $5E8A: $21 $80 $C3
    add  hl, bc                                   ; $5E8D: $09
    ld   e, [hl]                                  ; $5E8E: $5E
    srl  e                                        ; $5E8F: $CB $3B
    srl  e                                        ; $5E91: $CB $3B
    ld   d, b                                     ; $5E93: $50
    ld   hl, Data_005_5E17                        ; $5E94: $21 $17 $5E
    add  hl, de                                   ; $5E97: $19
    ld   a, [hl]                                  ; $5E98: $7E
    ldh  [hLinkSpeedX], a                         ; $5E99: $E0 $9A
    push bc                                       ; $5E9B: $C5
    call UpdateFinalLinkPosition.horizontal       ; $5E9C: $CD $B2 $21
    call label_3E19                               ; $5E9F: $CD $19 $3E
    pop  bc                                       ; $5EA2: $C1

jr_005_5EA3:
    ld   a, [$D210]                               ; $5EA3: $FA $10 $D2
    inc  a                                        ; $5EA6: $3C
    cp   $22                                      ; $5EA7: $FE $22
    jr   c, jr_005_5EB0                           ; $5EA9: $38 $05

    ld   a, $32                                   ; $5EAB: $3E $32
    ldh  [hNoiseSfx], a                           ; $5EAD: $E0 $F4
    xor  a                                        ; $5EAF: $AF

jr_005_5EB0:
    ld   [$D210], a                               ; $5EB0: $EA $10 $D2
    call GetEntityTransitionCountdown             ; $5EB3: $CD $05 $0C
    cp   $C0                                      ; $5EB6: $FE $C0
    jr   nc, jr_005_5F2F                          ; $5EB8: $30 $75

    ldh  a, [hFrameCounter]                       ; $5EBA: $F0 $E7
    and  $0F                                      ; $5EBC: $E6 $0F
    jr   nz, jr_005_5F2F                          ; $5EBE: $20 $6F

    ld   a, ENTITY_EVIL_EAGLE                     ; $5EC0: $3E $63
    ld   e, $03                                   ; $5EC2: $1E $03
    call SpawnNewEntityInRange_trampoline         ; $5EC4: $CD $98 $3B
    jr   c, jr_005_5F2F                           ; $5EC7: $38 $66

    ld   hl, wEntitiesPrivateState1Table          ; $5EC9: $21 $B0 $C2
    add  hl, de                                   ; $5ECC: $19
    ld   [hl], $03                                ; $5ECD: $36 $03
    push bc                                       ; $5ECF: $C5
    ld   hl, wEntitiesDirectionTable              ; $5ED0: $21 $80 $C3
    add  hl, bc                                   ; $5ED3: $09
    ld   c, [hl]                                  ; $5ED4: $4E
    srl  c                                        ; $5ED5: $CB $39
    srl  c                                        ; $5ED7: $CB $39
    ld   hl, Data_005_5E1B                        ; $5ED9: $21 $1B $5E
    add  hl, bc                                   ; $5EDC: $09
    ldh  a, [hMultiPurpose0]                      ; $5EDD: $F0 $D7
    add  [hl]                                     ; $5EDF: $86
    ld   hl, wEntitiesPosXTable                   ; $5EE0: $21 $00 $C2
    add  hl, de                                   ; $5EE3: $19
    ld   [hl], a                                  ; $5EE4: $77
    ldh  a, [hMultiPurpose1]                      ; $5EE5: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $5EE7: $21 $10 $C2
    add  hl, de                                   ; $5EEA: $19
    add  $0C                                      ; $5EEB: $C6 $0C
    ld   [hl], a                                  ; $5EED: $77
    ld   hl, wEntitiesSpriteVariantTable          ; $5EEE: $21 $B0 $C3
    add  hl, de                                   ; $5EF1: $19
    ld   a, c                                     ; $5EF2: $79
    xor  $01                                      ; $5EF3: $EE $01
    ld   [hl], a                                  ; $5EF5: $77
    ld   hl, wEntitiesDirectionTable              ; $5EF6: $21 $80 $C3
    add  hl, de                                   ; $5EF9: $19
    ld   [hl], a                                  ; $5EFA: $77
    sla  c                                        ; $5EFB: $CB $21
    sla  c                                        ; $5EFD: $CB $21
    sla  c                                        ; $5EFF: $CB $21
    call GetRandomByte                            ; $5F01: $CD $0D $28
    and  $07                                      ; $5F04: $E6 $07
    add  c                                        ; $5F06: $81
    ld   c, a                                     ; $5F07: $4F
    ld   hl, Data_005_5E2D                        ; $5F08: $21 $2D $5E
    add  hl, bc                                   ; $5F0B: $09
    ld   a, [hl]                                  ; $5F0C: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $5F0D: $21 $50 $C2
    add  hl, de                                   ; $5F10: $19
    ld   [hl], a                                  ; $5F11: $77
    ld   hl, Data_005_5E1D                        ; $5F12: $21 $1D $5E
    add  hl, bc                                   ; $5F15: $09
    ld   a, [hl]                                  ; $5F16: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5F17: $21 $40 $C2
    add  hl, de                                   ; $5F1A: $19
    ld   [hl], a                                  ; $5F1B: $77
    pop  bc                                       ; $5F1C: $C1
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5F1D: $21 $40 $C3
    add  hl, de                                   ; $5F20: $19
    ld   [hl], $02                                ; $5F21: $36 $02
    ld   hl, wEntitiesOptions1Table               ; $5F23: $21 $30 $C4
    add  hl, de                                   ; $5F26: $19
    ld   [hl], ENTITY_OPT1_NONE                   ; $5F27: $36 $00
    ld   hl, wEntitiesHealthGroup                 ; $5F29: $21 $D0 $C4
    add  hl, de                                   ; $5F2C: $19
    ld   [hl], $02                                ; $5F2D: $36 $02

jr_005_5F2F:
    ret                                           ; $5F2F: $C9

label_005_5F30:
    call IncrementEntityState                     ; $5F30: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $5F33: $CD $05 $0C
    ld   [hl], $50                                ; $5F36: $36 $50
    ret                                           ; $5F38: $C9

Data_005_5F39::
    db   $E0, $20

func_005_5F3B::
    call UpdateEntityPosWithSpeed_05              ; $5F3B: $CD $B1 $7A
    call GetEntityTransitionCountdown             ; $5F3E: $CD $05 $0C
    jr   z, label_005_5F78                        ; $5F41: $28 $35

    ld   hl, wEntitiesDirectionTable              ; $5F43: $21 $80 $C3
    add  hl, bc                                   ; $5F46: $09
    ld   a, [hl]                                  ; $5F47: $7E
    rra                                           ; $5F48: $1F
    rra                                           ; $5F49: $1F
    and  $01                                      ; $5F4A: $E6 $01
    ld   e, a                                     ; $5F4C: $5F
    ld   d, b                                     ; $5F4D: $50
    ld   hl, Data_005_5F39                        ; $5F4E: $21 $39 $5F
    add  hl, de                                   ; $5F51: $19
    ld   a, [hl]                                  ; $5F52: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5F53: $21 $40 $C2
    add  hl, bc                                   ; $5F56: $09
    sub  [hl]                                     ; $5F57: $96
    and  a                                        ; $5F58: $A7
    jr   z, jr_005_5F68                           ; $5F59: $28 $0D

    and  $80                                      ; $5F5B: $E6 $80
    jr   nz, jr_005_5F61                          ; $5F5D: $20 $02

    inc  [hl]                                     ; $5F5F: $34
    inc  [hl]                                     ; $5F60: $34

jr_005_5F61:
    dec  [hl]                                     ; $5F61: $35
    call func_005_5CB9                            ; $5F62: $CD $B9 $5C
    jp   func_005_5CB9                            ; $5F65: $C3 $B9 $5C

jr_005_5F68:
    xor  a                                        ; $5F68: $AF
    call SetEntitySpriteVariant                   ; $5F69: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $5F6C: $F0 $E7
    and  $01                                      ; $5F6E: $E6 $01
    jr   nz, jr_005_5F77                          ; $5F70: $20 $05

    ld   hl, wEntitiesSpeedYTable                 ; $5F72: $21 $50 $C2
    add  hl, bc                                   ; $5F75: $09
    dec  [hl]                                     ; $5F76: $35

jr_005_5F77:
    ret                                           ; $5F77: $C9

label_005_5F78:
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5F78: $21 $40 $C3
    add  hl, bc                                   ; $5F7B: $09
    ld   [hl], $02                                ; $5F7C: $36 $02
    call IncrementEntityState                     ; $5F7E: $CD $12 $3B
    ld   [hl], $07                                ; $5F81: $36 $07
    call GetEntityTransitionCountdown             ; $5F83: $CD $05 $0C
    ld   a, [$D205]                               ; $5F86: $FA $05 $D2
    cp   $04                                      ; $5F89: $FE $04
    jr   nz, jr_005_5F90                          ; $5F8B: $20 $03

    ld   [hl], $10                                ; $5F8D: $36 $10
    ret                                           ; $5F8F: $C9

jr_005_5F90:
    ld   [hl], $80                                ; $5F90: $36 $80
    ret                                           ; $5F92: $C9

func_005_5F93::
    call UpdateEntityPosWithSpeed_05              ; $5F93: $CD $B1 $7A
    call GetEntityTransitionCountdown             ; $5F96: $CD $05 $0C
    jr   nz, jr_005_5FA3                          ; $5F99: $20 $08

    ld   [hl], $30                                ; $5F9B: $36 $30
    call IncrementEntityState                     ; $5F9D: $CD $12 $3B
    call ClearEntitySpeed                         ; $5FA0: $CD $7F $3D

jr_005_5FA3:
    jp   func_005_5CB9                            ; $5FA3: $C3 $B9 $5C

Data_005_5FA6::
    db   $E0, $20

func_005_5FA8::
    call UpdateEntityPosWithSpeed_05              ; $5FA8: $CD $B1 $7A
    call GetEntityTransitionCountdown             ; $5FAB: $CD $05 $0C
    jr   nz, jr_005_5FEA                          ; $5FAE: $20 $3A

    ldh  a, [hActiveEntityVisualPosY]             ; $5FB0: $F0 $EC
    cp   $B0                                      ; $5FB2: $FE $B0
    jp   nc, label_005_5F78                       ; $5FB4: $D2 $78 $5F

    ld   a, $01                                   ; $5FB7: $3E $01
    call SetEntitySpriteVariant                   ; $5FB9: $CD $0C $3B
    ld   a, [wIgnoreLinkCollisionsCountdown]      ; $5FBC: $FA $3E $C1
    and  a                                        ; $5FBF: $A7
    jr   nz, jr_005_5FE9                          ; $5FC0: $20 $27

    call label_3B39                               ; $5FC2: $CD $39 $3B
    ld   a, [wIgnoreLinkCollisionsCountdown]      ; $5FC5: $FA $3E $C1
    and  a                                        ; $5FC8: $A7
    jr   z, jr_005_5FE9                           ; $5FC9: $28 $1E

    ld   a, $10                                   ; $5FCB: $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $5FCD: $EA $3E $C1
    ld   hl, wEntitiesDirectionTable              ; $5FD0: $21 $80 $C3
    add  hl, bc                                   ; $5FD3: $09
    ld   e, [hl]                                  ; $5FD4: $5E
    srl  e                                        ; $5FD5: $CB $3B
    srl  e                                        ; $5FD7: $CB $3B
    ld   d, b                                     ; $5FD9: $50
    ld   hl, Data_005_5FA6                        ; $5FDA: $21 $A6 $5F
    add  hl, de                                   ; $5FDD: $19
    ld   a, [hl]                                  ; $5FDE: $7E
    ldh  [hLinkSpeedX], a                         ; $5FDF: $E0 $9A
    ld   a, $F0                                   ; $5FE1: $3E $F0
    ldh  [hLinkSpeedY], a                         ; $5FE3: $E0 $9B
    ld   hl, hLinkPositionY                       ; $5FE5: $21 $99 $FF
    dec  [hl]                                     ; $5FE8: $35

jr_005_5FE9:
    ret                                           ; $5FE9: $C9

jr_005_5FEA:
    cp   $01                                      ; $5FEA: $FE $01
    jr   nz, jr_005_6008                          ; $5FEC: $20 $1A

    ld   hl, wEntitiesDirectionTable              ; $5FEE: $21 $80 $C3
    add  hl, bc                                   ; $5FF1: $09
    ld   e, [hl]                                  ; $5FF2: $5E
    srl  e                                        ; $5FF3: $CB $3B
    srl  e                                        ; $5FF5: $CB $3B
    ld   d, b                                     ; $5FF7: $50
    ld   hl, Data_005_5D0C                        ; $5FF8: $21 $0C $5D
    add  hl, de                                   ; $5FFB: $19
    ld   a, [hl]                                  ; $5FFC: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5FFD: $21 $40 $C2
    add  hl, bc                                   ; $6000: $09
    ld   [hl], a                                  ; $6001: $77
    ld   hl, wEntitiesSpeedYTable                 ; $6002: $21 $50 $C2
    add  hl, bc                                   ; $6005: $09
    ld   [hl], $34                                ; $6006: $36 $34

jr_005_6008:
    call func_005_5CB9                            ; $6008: $CD $B9 $5C
    call GetEntityTransitionCountdown             ; $600B: $CD $05 $0C
    cp   $40                                      ; $600E: $FE $40
    ret  nc                                       ; $6010: $D0

    call func_005_5CB9                            ; $6011: $CD $B9 $5C
    jp   func_005_5CB9                            ; $6014: $C3 $B9 $5C

func_005_6017::
    xor  a                                        ; $6017: $AF
    call SetEntitySpriteVariant                   ; $6018: $CD $0C $3B
    call UpdateEntityPosWithSpeed_05              ; $601B: $CD $B1 $7A
    call label_3B39                               ; $601E: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $6021: $CD $05 $0C
    jp   z, label_005_5F78                        ; $6024: $CA $78 $5F

    ret                                           ; $6027: $C9

func_005_6028::
    ld   hl, wEntitiesFlashCountdownTable         ; $6028: $21 $20 $C4
    add  hl, bc                                   ; $602B: $09
    ld   a, [hl]                                  ; $602C: $7E
    and  a                                        ; $602D: $A7
    jr   z, jr_005_6040                           ; $602E: $28 $10

    cp   $30                                      ; $6030: $FE $30
    ret  nc                                       ; $6032: $D0

    dec  a                                        ; $6033: $3D
    jr   nz, jr_005_603A                          ; $6034: $20 $04

    ld   a, $31                                   ; $6036: $3E $31
    ldh  [hNoiseSfx], a                           ; $6038: $E0 $F4

jr_005_603A:
    call func_005_5CB9                            ; $603A: $CD $B9 $5C
    jp   func_005_5CB9                            ; $603D: $C3 $B9 $5C

jr_005_6040:
    call func_005_5CB9                            ; $6040: $CD $B9 $5C
    call func_005_5CB9                            ; $6043: $CD $B9 $5C
    call func_005_5CB9                            ; $6046: $CD $B9 $5C
    ld   hl, wEntitiesSpeedYTable                 ; $6049: $21 $50 $C2
    add  hl, bc                                   ; $604C: $09
    ld   a, [hl]                                  ; $604D: $7E
    cp   $D0                                      ; $604E: $FE $D0
    jr   z, jr_005_6053                           ; $6050: $28 $01

    dec  [hl]                                     ; $6052: $35

jr_005_6053:
    call UpdateEntityPosWithSpeed_05              ; $6053: $CD $B1 $7A
    ldh  a, [hActiveEntityVisualPosY]             ; $6056: $F0 $EC
    and  $F0                                      ; $6058: $E6 $F0
    cp   $C0                                      ; $605A: $FE $C0
    jr   nz, jr_005_6061                          ; $605C: $20 $03

    jp   label_005_5F78                           ; $605E: $C3 $78 $5F

jr_005_6061:
    ret                                           ; $6061: $C9

; Evil Eagle display list
Data_005_6062::
    db   $00, $00, $40, $01
    db   $00, $08, $42, $01
    db   $00, $10, $44, $02
    db   $F8, $18, $46, $02
    db   $F8, $20, $48, $02
    db   $F8, $28, $4A, $02
    db   $08, $18, $4C, $02
    db   $08, $20, $4E, $02
    db   $08, $28, $50, $02
    db   $00, $30, $52, $02
    db   $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF
    db   $00, $00, $40, $01
    db   $00, $08, $42, $01
    db   $00, $10, $5A, $02
    db   $00, $18, $5C, $02
    db   $00, $20, $5E, $02
    db   $10, $08, $60, $02
    db   $10, $10, $62, $02
    db   $10, $18, $64, $02
    db   $10, $20, $66, $02
    db   $F0, $18, $54, $02
    db   $F0, $20, $56, $02
    db   $F0, $28, $58, $02
    db   $00, $00, $40, $01
    db   $00, $08, $42, $01
    db   $00, $10, $5A, $02
    db   $00, $18, $68, $02
    db   $00, $20, $6A, $02
    db   $10, $08, $60, $02
    db   $10, $10, $62, $02
    db   $10, $18, $64, $02
    db   $10, $20, $66, $02
    db   $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF
    db   $00, $00, $40, $01
    db   $00, $08, $42, $01
    db   $00, $10, $6C, $02
    db   $00, $18, $6E, $02
    db   $00, $20, $70, $02
    db   $10, $08, $60, $02
    db   $10, $10, $72, $02
    db   $10, $18, $74, $02
    db   $10, $20, $76, $02
    db   $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF

; Alternate Evil Eagle display list
Data_005_6122::
    db   $00, $08, $40, $21
    db   $00, $00, $42, $21
    db   $00, $F8, $44, $22
    db   $F8, $F0, $46, $22
    db   $F8, $E8, $48, $22
    db   $F8, $E0, $4A, $22
    db   $08, $F0, $4C, $22
    db   $08, $E8, $4E, $22
    db   $08, $E0, $50, $22
    db   $00, $D8, $52, $22
    db   $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF
    db   $00, $08, $40, $21
    db   $00, $00, $42, $21
    db   $00, $F8, $5A, $22
    db   $00, $F0, $5C, $22
    db   $00, $E8, $5E, $22
    db   $10, $00, $60, $22
    db   $10, $F8, $62, $22
    db   $10, $F0, $64, $22
    db   $10, $E8, $66, $22
    db   $F0, $F0, $54, $22
    db   $F0, $E8, $56, $22
    db   $F0, $E0, $58, $22
    db   $00, $08, $40, $21
    db   $00, $00, $42, $21
    db   $00, $F8, $5A, $22
    db   $00, $F0, $68, $22
    db   $00, $E8, $6A, $22
    db   $10, $00, $60, $22
    db   $10, $F8, $62, $22
    db   $10, $F0, $64, $22
    db   $10, $E8, $66, $22
    db   $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF
    db   $00, $08, $40, $21
    db   $00, $00, $42, $21
    db   $00, $F8, $6C, $22
    db   $00, $F0, $6E, $22
    db   $00, $E8, $70, $22
    db   $10, $00, $60, $22
    db   $10, $F8, $72, $22
    db   $10, $F0, $74, $22
    db   $10, $E8, $76, $22
    db   $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF
    db   $FF, $FF, $FF, $FF

Data_005_61E2::
    db   $1C, $1C, $08, $0C, $14, $10, $10, $10, $F4, $1C, $08, $0C, $FC, $10, $10, $10

func_005_61F2::
    ld   hl, wEntitiesDirectionTable              ; $61F2: $21 $80 $C3
    add  hl, bc                                   ; $61F5: $09
    ldh  a, [hActiveEntitySpriteVariant]          ; $61F6: $F0 $F1
    add  [hl]                                     ; $61F8: $86
    ld   hl, Data_005_6062                        ; $61F9: $21 $62 $60
    cp   $04                                      ; $61FC: $FE $04
    jr   c, jr_005_6205                           ; $61FE: $38 $05

    sub  $04                                      ; $6200: $D6 $04
    ld   hl, Data_005_6122                        ; $6202: $21 $22 $61

jr_005_6205:
    ld   e, a                                     ; $6205: $5F
    ld   d, b                                     ; $6206: $50
    sla  e                                        ; $6207: $CB $23
    sla  e                                        ; $6209: $CB $23
    sla  e                                        ; $620B: $CB $23
    sla  e                                        ; $620D: $CB $23
    ld   a, e                                     ; $620F: $7B
    sla  e                                        ; $6210: $CB $23
    add  e                                        ; $6212: $83
    ld   e, a                                     ; $6213: $5F
    add  hl, de                                   ; $6214: $19
    ld   c, $0C                                   ; $6215: $0E $0C
    call RenderActiveEntitySpritesRect            ; $6217: $CD $E6 $3C
    ld   a, $0A                                   ; $621A: $3E $0A
    call label_3DA0                               ; $621C: $CD $A0 $3D
    ld   e, $00                                   ; $621F: $1E $00
    ldh  a, [hActiveEntitySpriteVariant]          ; $6221: $F0 $F1
    and  a                                        ; $6223: $A7
    jr   z, jr_005_6228                           ; $6224: $28 $02

    ld   e, $04                                   ; $6226: $1E $04

jr_005_6228:
    ld   hl, wEntitiesDirectionTable              ; $6228: $21 $80 $C3
    add  hl, bc                                   ; $622B: $09
    ld   a, [hl]                                  ; $622C: $7E
    and  a                                        ; $622D: $A7
    jr   z, jr_005_6234                           ; $622E: $28 $04

    ld   a, e                                     ; $6230: $7B
    add  $08                                      ; $6231: $C6 $08
    ld   e, a                                     ; $6233: $5F

jr_005_6234:
    ld   d, b                                     ; $6234: $50
    ld   hl, Data_005_61E2                        ; $6235: $21 $E2 $61
    add  hl, de                                   ; $6238: $19
    ld   e, l                                     ; $6239: $5D
    ld   d, h                                     ; $623A: $54
    push bc                                       ; $623B: $C5
    sla  c                                        ; $623C: $CB $21
    sla  c                                        ; $623E: $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ; $6240: $21 $80 $D5
    add  hl, bc                                   ; $6243: $09
    ld   c, $04                                   ; $6244: $0E $04

jr_005_6246:
    ld   a, [de]                                  ; $6246: $1A
    inc  de                                       ; $6247: $13
    ld   [hl+], a                                 ; $6248: $22
    dec  c                                        ; $6249: $0D
    jr   nz, jr_005_6246                          ; $624A: $20 $FA

    pop  bc                                       ; $624C: $C1
    ret                                           ; $624D: $C9

Data_005_624E::
    db   $7C, $00, $7C, $20, $7C, $40, $7C, $60

func_005_6256::
    ld   a, $02                                   ; $6256: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6258: $E0 $A1
    ld   de, Data_005_624E                        ; $625A: $11 $4E $62
    call RenderActiveEntitySpritesPair            ; $625D: $CD $C0 $3B
    call func_005_7A3A                            ; $6260: $CD $3A $7A
    ldh  a, [hFrameCounter]                       ; $6263: $F0 $E7
    rra                                           ; $6265: $1F
    rra                                           ; $6266: $1F
    rra                                           ; $6267: $1F
    and  $01                                      ; $6268: $E6 $01
    call SetEntitySpriteVariant                   ; $626A: $CD $0C $3B
    ldh  a, [hActiveEntityState]                  ; $626D: $F0 $F0
    JP_TABLE                                      ; $626F
._00 dw func_005_6274                             ; $6270
._01 dw func_005_6299                             ; $6272

func_005_6274::
    ld   hl, wEntitiesPosYTable                   ; $6274: $21 $10 $C2
    add  hl, bc                                   ; $6277: $09
    ld   e, $07                                   ; $6278: $1E $07
    call func_005_6283                            ; $627A: $CD $83 $62
    ld   hl, wEntitiesPosXTable                   ; $627D: $21 $00 $C2
    add  hl, bc                                   ; $6280: $09
    ld   e, $00                                   ; $6281: $1E $00

func_005_6283::
    ldh  a, [hFrameCounter]                       ; $6283: $F0 $E7
    add  e                                        ; $6285: $83
    ld   d, a                                     ; $6286: $57
    and  $03                                      ; $6287: $E6 $03
    jr   nz, jr_005_6298                          ; $6289: $20 $0D

    ld   a, d                                     ; $628B: $7A
    rra                                           ; $628C: $1F
    rra                                           ; $628D: $1F
    rra                                           ; $628E: $1F
    rra                                           ; $628F: $1F
    xor  c                                        ; $6290: $A9
    and  $01                                      ; $6291: $E6 $01
    jr   z, jr_005_6297                           ; $6293: $28 $02

    inc  [hl]                                     ; $6295: $34
    inc  [hl]                                     ; $6296: $34

jr_005_6297:
    dec  [hl]                                     ; $6297: $35

jr_005_6298:
    ret                                           ; $6298: $C9

func_005_6299::
    call UpdateEntityPosWithSpeed_05              ; $6299: $CD $B1 $7A
    ld   hl, wEntitiesSpeedXTable                 ; $629C: $21 $40 $C2
    add  hl, bc                                   ; $629F: $09
    ld   a, [hl]                                  ; $62A0: $7E
    cp   $C0                                      ; $62A1: $FE $C0
    jr   z, jr_005_62A6                           ; $62A3: $28 $01

    dec  [hl]                                     ; $62A5: $35

jr_005_62A6:
    ld   hl, wEntitiesSpeedYTable                 ; $62A6: $21 $50 $C2
    add  hl, bc                                   ; $62A9: $09
    ld   a, [hl]                                  ; $62AA: $7E
    cp   $F0                                      ; $62AB: $FE $F0
    jr   z, jr_005_62B0                           ; $62AD: $28 $01

    dec  [hl]                                     ; $62AF: $35

jr_005_62B0:
    ldh  a, [hActiveEntityPosX]                   ; $62B0: $F0 $EE
    cp   $E0                                      ; $62B2: $FE $E0
    jp   nc, ClearEntityStatus_05                 ; $62B4: $D2 $4B $7B

    ret                                           ; $62B7: $C9

Data_005_62B8::
    db   $7A, $22, $78, $22, $78, $02, $7A, $02, $7A, $62, $78, $62, $78, $42, $7A, $42

func_005_62C8::
    ld   de, Data_005_62B8                        ; $62C8: $11 $B8 $62
    call RenderActiveEntitySpritesPair            ; $62CB: $CD $C0 $3B
    call func_005_7A3A                            ; $62CE: $CD $3A $7A
    call UpdateEntityPosWithSpeed_05              ; $62D1: $CD $B1 $7A
    ldh  a, [hActiveEntityState]                  ; $62D4: $F0 $F0
    JP_TABLE                                      ; $62D6
._00 dw func_005_62DB                             ; $62D7
._01 dw func_005_62FA                             ; $62D9

func_005_62DB::
    call CheckLinkCollisionWithProjectile_trampoline
    ld   hl, wEntitiesCollisionsTable             ; $62DE: $21 $A0 $C2
    add  hl, bc                                   ; $62E1: $09
    ld   a, [hl]                                  ; $62E2: $7E
    and  a                                        ; $62E3: $A7
    jr   z, jr_005_62F5                           ; $62E4: $28 $0F

    call IncrementEntityState                     ; $62E6: $CD $12 $3B
    ld   hl, wEntitiesSpeedYTable                 ; $62E9: $21 $50 $C2
    add  hl, bc                                   ; $62EC: $09
    ld   [hl], $E0                                ; $62ED: $36 $E0
    ld   hl, wEntitiesSpriteVariantTable          ; $62EF: $21 $B0 $C3
    add  hl, bc                                   ; $62F2: $09
    inc  [hl]                                     ; $62F3: $34
    inc  [hl]                                     ; $62F4: $34

jr_005_62F5:
    ld   hl, wEntitiesSpeedYTable                 ; $62F5: $21 $50 $C2
    add  hl, bc                                   ; $62F8: $09
    dec  [hl]                                     ; $62F9: $35

func_005_62FA::
    ldh  a, [hActiveEntityPosX]                   ; $62FA: $F0 $EE
    cp   $A8                                      ; $62FC: $FE $A8
    jp   nc, ClearEntityStatus_05                 ; $62FE: $D2 $4B $7B

    ret                                           ; $6301: $C9
                                          ; $6313: $C9
