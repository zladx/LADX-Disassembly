DreamShrineBedEntityHandler::
    ldh  a, [hActiveEntityState]                  ; $7CF8: $F0 $F0
    JP_TABLE                                      ; $7CFA
._00 dw func_015_7D01                             ; $7CFB
._01 dw func_015_7D78                             ; $7CFD
._02 dw func_015_7E31                             ; $7CFF

; Dream Shrine transition sequence?
func_015_7D01::
    call func_015_7BDB                            ; $7D02: $DB
    add  $0E                                      ; $7D04: $C6 $0E
    cp   $1C                                      ; $7D06: $FE $1C
    jr   nc, .ret_7D4F                            ; $7D08: $30 $45

    call func_015_7BEB                            ; $7D0A: $CD $EB $7B
    add  $0C                                      ; $7D0D: $C6 $0C
    cp   $18                                      ; $7D0F: $FE $18
    jr   nc, .ret_7D4F                            ; $7D11: $30 $3C

    ldh  a, [hLinkDirection]                      ; $7D13: $F0 $9E
    and  a                                        ; $7D15: $A7
    jr   nz, .ret_7D4F                            ; $7D16: $20 $37

    ld   a, [wCollisionType]                      ; $7D18: $FA $33 $C1
    and  a                                        ; $7D1B: $A7
    jr   z, .ret_7D4F                             ; $7D1C: $28 $31

    call IncrementEntityState                     ; $7D1E: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $7D21: $CD $05 $0C
    ld   [hl], $A0                                ; $7D24: $36 $A0
    ld   a, $01                                   ; $7D26: $3E $01
    ldh  [hLinkPositionZ], a                      ; $7D28: $E0 $A2
    ld   a, $02                                   ; $7D2A: $3E $02
    ld   [wIsLinkInTheAir], a                     ; $7D2C: $EA $46 $C1
    ld   a, $12                                   ; $7D2F: $3E $12
    ldh  [hLinkVelocityZ], a                      ; $7D31: $E0 $A3
    ld   a, $0C                                   ; $7D33: $3E $0C
    ldh  [hLinkSpeedX], a                         ; $7D35: $E0 $9A
    xor  a                                        ; $7D37: $AF
    ldh  [hLinkSpeedY], a                         ; $7D38: $E0 $9B
    ld   a, $00                                   ; $7D3A: $3E $00
    ldh  [hLinkDirection], a                      ; $7D3C: $E0 $9E
    ld   a, $01                                   ; $7D3E: $3E $01
    ld   [wC10A], a                               ; $7D40: $EA $0A $C1
    ld   a, MUSIC_DREAM_SHRINE_SLEEP              ; $7D43: $3E $1E
    ld   [wMusicTrackToPlay], a                   ; $7D45: $EA $68 $D3
    xor  a                                        ; $7D48: $AF
    ld   [wTransitionSequenceCounter], a          ; $7D49: $EA $6B $C1
    ld   [wC16C], a                               ; $7D4C: $EA $6C $C1

.ret_7D4F
    ret                                           ; $7D4F: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown061SpriteVariants::
.variant0
    db $50, $07
    db $52, $07
.variant1
    db $54, $00
    db $56, $00

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown059SpriteVariants::
.variant0
    db $50, $07
    db $52, $07
.variant1
    db $54, $02
    db $56, $02

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown060SpriteVariants::
.variant0
    db $50, $07
    db $52, $07
.variant1
    db $54, $03
    db $56, $03

Data_015_7D68::
    db   $00, $00, $5E, $06, $00, $08, $5E, $26

Data_015_7D70::
    db   $98, $42, $98, $50, $99, $90, $99, $82

func_015_7D78::
    ld   a, [wIsLinkInTheAir]                     ; $7D78: $FA $46 $C1
    and  a                                        ; $7D7B: $A7
    ret  nz                                       ; $7D7C: $C0

    call GetEntityTransitionCountdown             ; $7D7D: $CD $05 $0C
    jr   nz, .jr_7D94                             ; $7D80: $20 $12

    ld   a, $01                                   ; $7D82: $3E $01
    ld   [wTransitionGfx], a                      ; $7D84: $EA $7F $C1
    xor  a                                        ; $7D87: $AF
    ld   [wTransitionGfxFrameCount], a            ; $7D88: $EA $80 $C1
    ld   a, $08                                   ; $7D8B: $3E $08
    ld   [wC3CA], a                               ; $7D8D: $EA $CA $C3
    call IncrementEntityState                     ; $7D90: $CD $12 $3B
    xor  a                                        ; $7D93: $AF

.jr_7D94
    push af                                       ; $7D94: $F5
    cp   $80                                      ; $7D95: $FE $80
    jr   nc, jr_015_7DEC                          ; $7D97: $30 $53

    push af                                       ; $7D99: $F5
    and  $1F                                      ; $7D9A: $E6 $1F
    jr   nz, .jr_7DAF                             ; $7D9C: $20 $11

    ld   a, [wTransitionSequenceCounter]          ; $7D9E: $FA $6B $C1
    cp   $02                                      ; $7DA1: $FE $02
    jr   z, .jr_7DAF                              ; $7DA3: $28 $0A

    ld   a, $03                                   ; $7DA5: $3E $03
    ld   [wC16C], a                               ; $7DA7: $EA $6C $C1
    push bc                                       ; $7DAA: $C5
    call func_1A22                                ; $7DAB: $CD $22 $1A
    pop  bc                                       ; $7DAE: $C1

.jr_7DAF
    pop  af                                       ; $7DAF: $F1
    and  $0F                                      ; $7DB0: $E6 $0F
    jr   nz, jr_015_7DEC                          ; $7DB2: $20 $38

    ld   hl, wEntitiesPrivateState2Table          ; $7DB4: $21 $C0 $C2
    add  hl, bc                                   ; $7DB7: $09
    ld   a, [hl]                                  ; $7DB8: $7E
    cp   $04                                      ; $7DB9: $FE $04
    jr   z, jr_015_7DEC                           ; $7DBB: $28 $2F

    ld   a, [wDrawCommandsSize]                   ; $7DBD: $FA $00 $D6
    ld   e, a                                     ; $7DC0: $5F
    ld   d, b                                     ; $7DC1: $50
    add  $05                                      ; $7DC2: $C6 $05
    ld   [wDrawCommandsSize], a                   ; $7DC4: $EA $00 $D6
    ld   hl, wDrawCommand                         ; $7DC7: $21 $01 $D6
    add  hl, de                                   ; $7DCA: $19
    push hl                                       ; $7DCB: $E5
    ld   hl, wEntitiesPrivateState2Table          ; $7DCC: $21 $C0 $C2
    add  hl, bc                                   ; $7DCF: $09
    ld   a, [hl]                                  ; $7DD0: $7E
    inc  [hl]                                     ; $7DD1: $34
    sla  a                                        ; $7DD2: $CB $27
    ld   e, a                                     ; $7DD4: $5F
    ld   d, b                                     ; $7DD5: $50
    ld   hl, Data_015_7D70                        ; $7DD6: $21 $70 $7D
    add  hl, de                                   ; $7DD9: $19
    ld   e, l                                     ; $7DDA: $5D
    ld   d, h                                     ; $7DDB: $54
    pop  hl                                       ; $7DDC: $E1
    ld   a, [de]                                  ; $7DDD: $1A
    inc  de                                       ; $7DDE: $13
    ld   [hl+], a                                 ; $7DDF: $22
    ld   a, [de]                                  ; $7DE0: $1A
    ld   [hl+], a                                 ; $7DE1: $22
    ld   a, $01                                   ; $7DE2: $3E $01
    ld   [hl+], a                                 ; $7DE4: $22
    ld   a, $64                                   ; $7DE5: $3E $64
    ld   [hl+], a                                 ; $7DE7: $22
    ld   a, $65                                   ; $7DE8: $3E $65
    ld   [hl+], a                                 ; $7DEA: $22
    ld   [hl], b                                  ; $7DEB: $70

jr_015_7DEC:
    pop  af                                       ; $7DEC: $F1
    ld   e, $00                                   ; $7DED: $1E $00
    cp   $80                                      ; $7DEF: $FE $80
    jr   c, .jr_7DF4                              ; $7DF1: $38 $01

    inc  e                                        ; $7DF3: $1C

.jr_7DF4
    ld   a, e                                     ; $7DF4: $7B

func_015_7DF5::
    ldh  [hActiveEntitySpriteVariant], a          ; $7DF5: $E0 $F1
    ld   a, $58                                   ; $7DF7: $3E $58
    ldh  [hActiveEntityPosX], a                   ; $7DF9: $E0 $EE
    ldh  [hLinkPositionX], a                      ; $7DFB: $E0 $98
    ld   a, $44                                   ; $7DFD: $3E $44
    ldh  [hActiveEntityVisualPosY], a             ; $7DFF: $E0 $EC
    ldh  [hLinkPositionY], a                      ; $7E01: $E0 $99
    ld   a, $02                                   ; $7E03: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7E05: $E0 $A1
    ld   a, LINK_ANIMATION_STATE_NO_UPDATE        ; $7E07: $3E $FF
    ldh  [hLinkAnimationState], a                 ; $7E09: $E0 $9D
    ld   de, Unknown061SpriteVariants             ; $7E0B: $11 $50 $7D
    ld   a, [wTunicType]                          ; $7E0E: $FA $0F $DC
    and  a                                        ; $7E11: $A7
    jr   z, .render                               ; $7E12: $28 $0A

    ld   de, Unknown059SpriteVariants             ; $7E14: $11 $58 $7D
    cp   $01                                      ; $7E17: $FE $01
    jr   z, .render                               ; $7E19: $28 $03

    ld   de, Unknown060SpriteVariants             ; $7E1B: $11 $60 $7D

.render:
    call RenderActiveEntitySpritesPair            ; $7E1E: $CD $C0 $3B
    ldh  a, [hIsGBC]                              ; $7E21: $F0 $FE
    and  a                                        ; $7E23: $A7
    jr   z, .jr_7E2E                              ; $7E24: $28 $08

    ld   hl, Data_015_7D68                        ; $7E26: $21 $68 $7D
    ld   c, $02                                   ; $7E29: $0E $02
    call RenderActiveEntitySpritesRect            ; $7E2B: $CD $E6 $3C

.jr_7E2E
    jp   CopyEntityPositionToActivePosition       ; $7E2E: $C3 $8A $3D

func_015_7E31::
    xor  a                                        ; $7E31: $AF
    call func_015_7DF5                            ; $7E32: $CD $F5 $7D
    ld   a, [wTransitionGfx]                      ; $7E35: $FA $7F $C1
    and  a                                        ; $7E38: $A7
    ret  nz                                       ; $7E39: $C0

    xor  a                                        ; $7E3A: $AF
    ldh  [hLinkAnimationState], a                 ; $7E3B: $E0 $9D
    ld   hl, wWarpStructs                         ; $7E3D: $21 $01 $D4
    ld   a, $01                                   ; $7E40: $3E $01
    ld   [hl+], a                                 ; $7E42: $22
    ldh  a, [hMapId]                              ; $7E43: $F0 $F7
    ld   [hl+], a                                 ; $7E45: $22
    ld   a, $CE                                   ; $7E46: $3E $CE
    ld   [hl+], a                                 ; $7E48: $22
    ld   a, $50                                   ; $7E49: $3E $50
    ld   [hl+], a                                 ; $7E4B: $22
    ld   a, $7C                                   ; $7E4C: $3E $7C
    ld   [hl], a                                  ; $7E4E: $77
    call ClearEntityStatus_15                     ; $7E4F: $CD $31 $7C
    jp   disableMovementInTransition              ; $7E52: $C3 $9E $0C
