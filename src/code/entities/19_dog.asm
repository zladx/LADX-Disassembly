; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
DogSpriteVariants::
.variant0
    db $58, $01
    db $5A, $01
.variant1
    db $58, $01
    db $5C, $01
.variant2
    db $5A, $21
    db $58, $21
.variant3
    db $5C, $21
    db $58, $21

DogEntityHandler::
    ld   hl, wEntitiesHealthTable                 ; $48DA: $21 $60 $C3
    add  hl, bc                                   ; $48DD: $09
    ld   [hl], $4C                                ; $48DE: $36 $4C
    ld   hl, wEntitiesDirectionTable              ; $48E0: $21 $80 $C3
    add  hl, bc                                   ; $48E3: $09
    ld   a, [hl]                                  ; $48E4: $7E
    and  a                                        ; $48E5: $A7
    jr   nz, .jr_48EE                             ; $48E6: $20 $06

    ldh  a, [hActiveEntitySpriteVariant]          ; $48E8: $F0 $F1
    add  $02                                      ; $48EA: $C6 $02
    ldh  [hActiveEntitySpriteVariant], a          ; $48EC: $E0 $F1

.jr_48EE
    ld   de, DogSpriteVariants                    ; $48EE: $11 $CA $48
    call RenderActiveEntitySpritesPair            ; $48F1: $CD $C0 $3B
    call ReturnIfNonInteractive_19                ; $48F4: $CD $3D $7D
    call DecrementEntityIgnoreHitsCountdown       ; $48F7: $CD $56 $0C
    call AddEntityZSpeedToPos_19                  ; $48FA: $CD $F1 $7D
    ld   hl, wEntitiesSpeedZTable                 ; $48FD: $21 $20 $C3
    add  hl, bc                                   ; $4900: $09
    dec  [hl]                                     ; $4901: $35
    dec  [hl]                                     ; $4902: $35
    ld   hl, wEntitiesPosZTable                   ; $4903: $21 $10 $C3
    add  hl, bc                                   ; $4906: $09
    ld   a, [hl]                                  ; $4907: $7E
    and  $80                                      ; $4908: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $490A: $E0 $E8
    jr   z, .jr_4914                              ; $490C: $28 $06

    ld   [hl], b                                  ; $490E: $70
    ld   hl, wEntitiesSpeedZTable                 ; $490F: $21 $20 $C3
    add  hl, bc                                   ; $4912: $09
    ld   [hl], b                                  ; $4913: $70

.jr_4914
    ld   a, [wIsMarinSinging]                     ; $4914: $FA $C8 $C3
    and  a                                        ; $4917: $A7
    jr   z, jr_019_4947                           ; $4918: $28 $2D

    ld   hl, wEntitiesPhysicsFlagsTable           ; $491A: $21 $40 $C3
    add  hl, bc                                   ; $491D: $09
    set  ENTITY_PHYSICS_B_PROJECTILE_NOCLIP, [hl] ; $491E: $CB $F6
    ld   a, [wMarinEntityIndex]                   ; $4920: $FA $0F $C5
    ld   e, a                                     ; $4923: $5F
    ld   d, b                                     ; $4924: $50
    ld   hl, wEntitiesPosXTable                   ; $4925: $21 $00 $C2
    add  hl, de                                   ; $4928: $19
    ldh  a, [hActiveEntityPosX]                   ; $4929: $F0 $EE
    ld   e, $00                                   ; $492B: $1E $00
    cp   [hl]                                     ; $492D: $BE
    jr   c, .jr_4931                              ; $492E: $38 $01

    inc  e                                        ; $4930: $1C

.jr_4931
    ld   hl, wEntitiesDirectionTable              ; $4931: $21 $80 $C3
    add  hl, bc                                   ; $4934: $09
    ld   [hl], e                                  ; $4935: $73
    ldh  a, [hFrameCounter]                       ; $4936: $F0 $E7
    and  $3F                                      ; $4938: $E6 $3F
    jr   nz, .jr_4942                             ; $493A: $20 $06

    ld   hl, wEntitiesSpeedZTable                 ; $493C: $21 $20 $C3
    add  hl, bc                                   ; $493F: $09
    ld   [hl], $0C                                ; $4940: $36 $0C

.jr_4942
    call func_019_49FD                            ; $4942: $CD $FD $49
    jr   jr_019_494A                              ; $4945: $18 $03

jr_019_4947:
    call label_3B70                               ; $4947: $CD $70 $3B

jr_019_494A:
    ld   hl, wEntitiesFlashCountdownTable         ; $494A: $21 $20 $C4
    add  hl, bc                                   ; $494D: $09
    ld   a, [hl]                                  ; $494E: $7E
    and  a                                        ; $494F: $A7
    jr   z, .jr_4963                              ; $4950: $28 $11

    cp   $08                                      ; $4952: $FE $08
    jr   nz, .jr_4963                             ; $4954: $20 $0D

    call IncrementEntityState                     ; $4956: $CD $12 $3B
    ld   a, $02                                   ; $4959: $3E $02
    ld   [hl], a                                  ; $495B: $77
    ldh  [hActiveEntityState], a                  ; $495C: $E0 $F0
    call GetEntityTransitionCountdown             ; $495E: $CD $05 $0C
    ld   [hl], $10                                ; $4961: $36 $10

.jr_4963
    ldh  a, [hActiveEntityState]                  ; $4963: $F0 $F0
    cp   $02                                      ; $4965: $FE $02
    jr   nc, jr_019_4980                          ; $4967: $30 $17

    call func_019_7CF0                            ; $4969: $CD $F0 $7C
    jr   nc, jr_019_4980                          ; $496C: $30 $12

    ld   a, [wIsMarinSinging]                     ; $496E: $FA $C8 $C3
    and  a                                        ; $4971: $A7
    ld_dialog_low a, Dialog020 ; "GRRRR"          ; $4972: $3E $20
    jr   z, .jr_497D                              ; $4974: $28 $07

    call_open_dialog Dialog196                    ; $4976
    jr   jr_019_4980                              ; $497B: $18 $03

.jr_497D
    call OpenDialogInTable0                       ; $497D: $CD $85 $23

jr_019_4980:
    ld   a, [wIsMarinSinging]                     ; $4980: $FA $C8 $C3
    and  a                                        ; $4983: $A7
    ret  nz                                       ; $4984: $C0

    ldh  a, [hActiveEntityState]                  ; $4985: $F0 $F0
    JP_TABLE
._00 dw DogState0Handler
._01 dw DogState1Handler
._02 dw DogState2Handler
._03 dw DogState3Handler

Data_019_4990::
    db   $02, $08, $0C, $08, $FE, $F8, $F4, $F8

DogState0Handler::
    xor  a                                        ; $4998: $AF
    call SetEntitySpriteVariant                   ; $4999: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $499C: $CD $05 $0C
    jr   nz, .jr_49D8                             ; $499F: $20 $37

    call GetRandomByte                            ; $49A1: $CD $0D $28
    and  $07                                      ; $49A4: $E6 $07
    ld   e, a                                     ; $49A6: $5F
    ld   d, b                                     ; $49A7: $50
    ld   hl, Data_019_4990                        ; $49A8: $21 $90 $49
    add  hl, de                                   ; $49AB: $19
    ld   a, [hl]                                  ; $49AC: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $49AD: $21 $40 $C2
    add  hl, bc                                   ; $49B0: $09
    ld   [hl], a                                  ; $49B1: $77
    ld   a, e                                     ; $49B2: $7B
    and  $04                                      ; $49B3: $E6 $04
    ld   hl, wEntitiesDirectionTable              ; $49B5: $21 $80 $C3
    add  hl, bc                                   ; $49B8: $09
    ld   [hl], a                                  ; $49B9: $77
    call GetRandomByte                            ; $49BA: $CD $0D $28
    and  $07                                      ; $49BD: $E6 $07
    ld   e, a                                     ; $49BF: $5F
    ld   hl, Data_019_4990                        ; $49C0: $21 $90 $49
    add  hl, de                                   ; $49C3: $19
    ld   a, [hl]                                  ; $49C4: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $49C5: $21 $50 $C2
    add  hl, bc                                   ; $49C8: $09
    ld   [hl], a                                  ; $49C9: $77
    call GetEntityTransitionCountdown             ; $49CA: $CD $05 $0C
    call GetRandomByte                            ; $49CD: $CD $0D $28
    and  $1F                                      ; $49D0: $E6 $1F
    add  $30                                      ; $49D2: $C6 $30
    ld   [hl], a                                  ; $49D4: $77
    call IncrementEntityState                     ; $49D5: $CD $12 $3B

.jr_49D8
    jp   func_019_49FD                            ; $49D8: $C3 $FD $49

DogState1Handler::
    call UpdateEntityPosWithSpeed_19              ; $49DB: $CD $B8 $7D
    call label_3B23                               ; $49DE: $CD $23 $3B
    ldh  a, [hMultiPurposeG]                      ; $49E1: $F0 $E8
    and  a                                        ; $49E3: $A7
    jr   z, func_019_49FD                         ; $49E4: $28 $17

    call GetEntityTransitionCountdown             ; $49E6: $CD $05 $0C
    jr   nz, .jr_49F2                             ; $49E9: $20 $07

    ld   [hl], $30                                ; $49EB: $36 $30
    call IncrementEntityState                     ; $49ED: $CD $12 $3B
    ld   [hl], b                                  ; $49F0: $70
    ret                                           ; $49F1: $C9

.jr_49F2
    ld   hl, wEntitiesSpeedZTable                 ; $49F2: $21 $20 $C3
    add  hl, bc                                   ; $49F5: $09
    ld   [hl], $08                                ; $49F6: $36 $08
    ld   hl, wEntitiesPosZTable                   ; $49F8: $21 $10 $C3
    add  hl, bc                                   ; $49FB: $09
    inc  [hl]                                     ; $49FC: $34

func_019_49FD::
    ldh  a, [hFrameCounter]                       ; $49FD: $F0 $E7
    rra                                           ; $49FF: $1F
    rra                                           ; $4A00: $1F
    rra                                           ; $4A01: $1F
    and  $01                                      ; $4A02: $E6 $01
    jp   SetEntitySpriteVariant                   ; $4A04: $C3 $0C $3B

DogState2Handler::
    call GetEntityTransitionCountdown             ; $4A07: $CD $05 $0C
    jr   nz, .jr_4A23                             ; $4A0A: $20 $17

    call IncrementEntityState                     ; $4A0C: $CD $12 $3B
    ld   a, $24                                   ; $4A0F: $3E $24
    call ApplyVectorTowardsLink_trampoline        ; $4A11: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $4A14: $21 $20 $C3
    add  hl, bc                                   ; $4A17: $09
    ld   [hl], $18                                ; $4A18: $36 $18
    call EntityLinkPositionXDifference_19         ; $4A1A: $CD $0B $7E
    ld   hl, wEntitiesDirectionTable              ; $4A1D: $21 $80 $C3
    add  hl, bc                                   ; $4A20: $09
    ld   a, e                                     ; $4A21: $7B
    ld   [hl], a                                  ; $4A22: $77

.jr_4A23
    ldh  a, [hFrameCounter]                       ; $4A23: $F0 $E7
    rra                                           ; $4A25: $1F
    rra                                           ; $4A26: $1F
    and  $01                                      ; $4A27: $E6 $01
    jp   SetEntitySpriteVariant                   ; $4A29: $C3 $0C $3B

DogState3Handler::
    call UpdateEntityPosWithSpeed_19              ; $4A2C: $CD $B8 $7D
    call label_3B23                               ; $4A2F: $CD $23 $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4A32: $21 $40 $C3
    add  hl, bc                                   ; $4A35: $09
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $4A36: $36 $52
    call label_3B44                               ; $4A38: $CD $44 $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4A3B: $21 $40 $C3
    add  hl, bc                                   ; $4A3E: $09
    ld   [hl], 2 | ENTITY_PHYSICS_SHADOW | ENTITY_PHYSICS_HARMLESS ; $4A3F: $36 $92
    ldh  a, [hMultiPurposeG]                      ; $4A41: $F0 $E8
    and  a                                        ; $4A43: $A7
    jr   z, .ret_4A4F                             ; $4A44: $28 $09

    call IncrementEntityState                     ; $4A46: $CD $12 $3B
    ld   [hl], b                                  ; $4A49: $70
    call GetEntityTransitionCountdown             ; $4A4A: $CD $05 $0C
    ld   [hl], $20                                ; $4A4D: $36 $20

.ret_4A4F
    ret                                           ; $4A4F: $C9
