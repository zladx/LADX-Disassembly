; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Tarin1SpriteVariants::
.variant0
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $7C, OAM_GBC_PAL_2 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_2 | OAMF_PAL0
.variant3
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0
.variant4
    db $70, OAM_GBC_PAL_2 | OAMF_PAL0
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0
.variant5
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0
.variant6
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant7
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $70, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Tarin3SpriteVariants::
.variant0
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $58, OAM_GBC_PAL_2 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_2 | OAMF_PAL0
.variant2
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0
.variant3
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Tarin4SpriteVariants::
.variant0
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Tarin2SpriteVariants::
.variant0
    db $7A, OAM_GBC_PAL_7 | OAMF_PAL0
    db $7C, OAM_GBC_PAL_7 | OAMF_PAL0

; define sprites and their OAM Attributes in a list
Tarin1SpriteList::
    ;  x    y    n°   OAM
    db $00, $00, $20, OAM_GBC_PAL_2 | OAMF_PAL0
    db $00, $08, $22, OAM_GBC_PAL_2 | OAMF_PAL0
    db $00, $00, $20, OAM_GBC_PAL_2 | OAMF_PAL0
    db $00, $08, $22, OAM_GBC_PAL_2 | OAMF_PAL0

; define sprites and their OAM Attributes in a list
Tarin2SpriteList::
    ;  x    y    n°   OAM
    db $F1, $FA, $2A, OAM_GBC_PAL_2 | OAMF_PAL0
    db $F1, $02, $2A, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $00, $00, $24, OAM_GBC_PAL_2 | OAMF_PAL0
    db $00, $08, $28, OAM_GBC_PAL_2 | OAMF_PAL0

; Entity handler for:
;  - All appearances of Tarin (except when with the bees)
;  - Mysterious wood racoon
TarinEntityHandler::
    ld   a, [wGameplayType]                       ; $496A: $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ; $496D: $FE $01
    jr   nz, jr_005_4995                          ; $496F: $20 $24

    ; Handle Tarin's appearance in the credits
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4971: $21 $40 $C3
    add  hl, bc                                   ; $4974: $09
    ld   [hl], 4 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $4975: $36 $C4
    ld   hl, wEntitiesInertiaTable                ; $4977: $21 $D0 $C3
    add  hl, bc                                   ; $497A: $09
    ld   a, [hl]                                  ; $497B: $7E
    ld   hl, Tarin1SpriteList                     ; $497C: $21 $4A $49
    cp   $70                                      ; $497F: $FE $70
    jr   nz, .jr_4986                             ; $4981: $20 $03

    ld   hl, Tarin2SpriteList                     ; $4983: $21 $5A $49

.jr_4986
    ld   c, $04                                   ; $4986: $0E $04
    call RenderActiveEntitySpritesRect            ; $4988: $CD $E6 $3C
    ld   hl, wEntitiesInertiaTable                ; $498B: $21 $D0 $C3
    add  hl, bc                                   ; $498E: $09
    ld   a, [hl]                                  ; $498F: $7E
    cp   $70                                      ; $4990: $FE $70
    ret  z                                        ; $4992: $C8

    inc  [hl]                                     ; $4993: $34
    ret                                           ; $4994: $C9

jr_005_4995:
    ld   a, [wIsIndoor]                           ; $4995: $FA $A5 $DB
    and  a                                        ; $4998: $A7
    jp   nz, TarinIndoorsHandler                  ; $4999: $C2 $C1 $4B

    ; Handle Tarin's outdoor appearances
    ldh  a, [hRoomStatus]                         ; $499C: $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ; $499E: $E6 $10
    jp   nz, ClearEntityStatus_05                 ; $49A0: $C2 $4B $7B

    ldh  a, [hActiveEntityState]                  ; $49A3: $F0 $F0
    and  a                                        ; $49A5: $A7
    jr   nz, jr_005_49D1                          ; $49A6: $20 $29

    ldh  a, [hFrameCounter]                       ; $49A8: $F0 $E7
    rra                                           ; $49AA: $1F
    rra                                           ; $49AB: $1F
    rra                                           ; $49AC: $1F
    rra                                           ; $49AD: $1F
    and  $01                                      ; $49AE: $E6 $01
    call SetEntitySpriteVariant                   ; $49B0: $CD $0C $3B
    ldh  a, [hLinkPositionY]                      ; $49B3: $F0 $99
    cp   $30                                      ; $49B5: $FE $30
    jr   nc, .jr_49CC                             ; $49B7: $30 $13

    ld   a, $01                                   ; $49B9: $3E $01
    ld   [wShouldGetLostInMysteriousWoods], a     ; $49BB: $EA $0C $C1
    ldh  a, [hFrameCounter]                       ; $49BE: $F0 $E7
    rra                                           ; $49C0: $1F
    rra                                           ; $49C1: $1F
    rra                                           ; $49C2: $1F
    and  $01                                      ; $49C3: $E6 $01
    add  $02                                      ; $49C5: $C6 $02
    call SetEntitySpriteVariant                   ; $49C7: $CD $0C $3B
    jr   jr_005_49D1                              ; $49CA: $18 $05

.jr_49CC
    ld   hl, wEntitiesPrivateState4Table          ; $49CC: $21 $40 $C4
    add  hl, bc                                   ; $49CF: $09
    ld   [hl], b                                  ; $49D0: $70

jr_005_49D1:
    ld   de, Tarin1SpriteVariants                 ; $49D1: $11 $12 $49
    call RenderActiveEntitySpritesPair            ; $49D4: $CD $C0 $3B
    call ReturnIfNonInteractive_05                ; $49D7: $CD $3A $7A
    ldh  a, [hActiveEntityState]                  ; $49DA: $F0 $F0
    JP_TABLE                                      ; $49DC
._00 dw func_005_49E5                             ; $49DD
._01 dw func_005_4A17                             ; $49DF
._02 dw func_005_4B41                             ; $49E1
._03 dw func_005_4B89                             ; $49E3

func_005_49E5::
    call PushLinkOutOfEntity_05                   ; $49E5: $CD $C3 $54
    ldh  a, [hLinkPositionY]                      ; $49E8: $F0 $99
    cp   $20                                      ; $49EA: $FE $20
    jr   nc, .jr_49FD                             ; $49EC: $30 $0F

    ld   hl, wEntitiesPrivateState4Table          ; $49EE: $21 $40 $C4
    add  hl, bc                                   ; $49F1: $09
    ld   a, [hl]                                  ; $49F2: $7E
    and  a                                        ; $49F3: $A7
    jr   nz, .jr_49FD                             ; $49F4: $20 $07

    ld   [hl], $01                                ; $49F6: $36 $01
    jp_open_dialog Dialog021                      ; $49F8

.jr_49FD
    call ShouldLinkTalkToEntity_05                ; $49FD: $CD $06 $55
    jr   nc, .jr_4A0C                             ; $4A00: $30 $0A

    ld   a, [wLinkAttackStepAnimationCountdown]   ; $4A02: $FA $9B $C1
    and  a                                        ; $4A05: $A7
    ret  nz                                       ; $4A06: $C0

    jp_open_dialog Dialog00D                      ; $4A07

.jr_4A0C
    ld   hl, wItemUsageContext                    ; $4A0C: $21 $AD $C1
    ld   [hl], b                                  ; $4A0F: $70
    ret                                           ; $4A10: $C9

Data_005_4A11::
    db   $00, $04, $05, $06, $07, $01

func_005_4A17::
    ld   a, $02                                   ; $4A17: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4A19: $E0 $A1

    xor  a                                        ; $4A1B: $AF
    ld   [wLinkAttackStepAnimationCountdown], a   ; $4A1C: $EA $9B $C1

    call func_005_7B24                            ; $4A1F: $CD $24 $7B
    ld   a, e                                     ; $4A22: $7B
    xor  $01                                      ; $4A23: $EE $01
    ldh  [hLinkDirection], a                      ; $4A25: $E0 $9E
    push bc                                       ; $4A27: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $4A28: $CD $F0 $0B
    pop  bc                                       ; $4A2B: $C1
    ld   hl, wEntitiesPrivateState3Table          ; $4A2C: $21 $D0 $C2
    add  hl, bc                                   ; $4A2F: $09
    ld   e, [hl]                                  ; $4A30: $5E
    ld   hl, wEntitiesPrivateState2Table          ; $4A31: $21 $C0 $C2
    add  hl, bc                                   ; $4A34: $09
    ld   a, [hl]                                  ; $4A35: $7E
    add  e                                        ; $4A36: $83
    ld   [hl], a                                  ; $4A37: $77
    jr   nc, jr_005_4A46                          ; $4A38: $30 $0C

    ld   hl, wEntitiesPrivateState5Table          ; $4A3A: $21 $90 $C3
    add  hl, bc                                   ; $4A3D: $09
    ld   a, [hl]                                  ; $4A3E: $7E
    inc  a                                        ; $4A3F: $3C
    cp   $06                                      ; $4A40: $FE $06
    jr   nz, .jr_4A45                             ; $4A42: $20 $01

    xor  a                                        ; $4A44: $AF

.jr_4A45
    ld   [hl], a                                  ; $4A45: $77

jr_005_4A46:
    ld   hl, wEntitiesPrivateState5Table          ; $4A46: $21 $90 $C3
    add  hl, bc                                   ; $4A49: $09
    ld   e, [hl]                                  ; $4A4A: $5E
    ld   d, b                                     ; $4A4B: $50
    ld   hl, Data_005_4A11                        ; $4A4C: $21 $11 $4A
    add  hl, de                                   ; $4A4F: $19
    ld   a, [hl]                                  ; $4A50: $7E
    call SetEntitySpriteVariant                   ; $4A51: $CD $0C $3B
    call GetEntityDropTimer                       ; $4A54: $CD $FB $0B
    jr   nz, .jr_4A9E                             ; $4A57: $20 $45

    ld   a, ENTITY_BOMB                           ; $4A59: $3E $02
    call SpawnNewEntity_trampoline                ; $4A5B: $CD $86 $3B

    ldh  a, [hMultiPurpose0]                      ; $4A5E: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $4A60: $21 $00 $C2
    add  hl, de                                   ; $4A63: $19
    ld   [hl], a                                  ; $4A64: $77
    ldh  a, [hMultiPurpose1]                      ; $4A65: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $4A67: $21 $10 $C2
    add  hl, de                                   ; $4A6A: $19
    ld   [hl], a                                  ; $4A6B: $77
    ldh  a, [hMultiPurpose3]                      ; $4A6C: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $4A6E: $21 $10 $C3
    add  hl, de                                   ; $4A71: $19
    ld   [hl], a                                  ; $4A72: $77
    ld   hl, wEntitiesPrivateState4Table          ; $4A73: $21 $40 $C4
    add  hl, de                                   ; $4A76: $19
    ld   [hl], $4C                                ; $4A77: $36 $4C
    ld   hl, wEntitiesTransitionCountdownTable    ; $4A79: $21 $E0 $C2
    add  hl, de                                   ; $4A7C: $19
    ld   [hl], $20                                ; $4A7D: $36 $20
    ld   a, $09                                   ; $4A7F: $3E $09
    call SetEntitySpriteVariant                   ; $4A81: $CD $0C $3B
    ld   hl, wEntitiesSpeedZTable                 ; $4A84: $21 $20 $C3
    add  hl, bc                                   ; $4A87: $09
    ld   [hl], b                                  ; $4A88: $70
    call IncrementEntityState                     ; $4A89: $CD $12 $3B
    ldh  a, [hMapRoom]                            ; $4A8C: $F0 $F6
    ld   e, a                                     ; $4A8E: $5F
    ld   d, b                                     ; $4A8F: $50
    ld   hl, wOverworldRoomStatus                 ; $4A90: $21 $00 $D8
    add  hl, de                                   ; $4A93: $19
    ld   a, [hl]                                  ; $4A94: $7E
    or   OW_ROOM_STATUS_CHANGED                   ; $4A95: $F6 $10
    ld   [hl], a                                  ; $4A97: $77
    ld   a, $01                                   ; $4A98: $3E $01
    ld   [wDB48], a                               ; $4A9A: $EA $48 $DB
    ret                                           ; $4A9D: $C9

.jr_4A9E
    ld   hl, wEntitiesPrivateState3Table          ; $4A9E: $21 $D0 $C2
    add  hl, bc                                   ; $4AA1: $09
    ldh  a, [hFrameCounter]                       ; $4AA2: $F0 $E7
    and  $01                                      ; $4AA4: $E6 $01
    jr   nz, .jr_4AAE                             ; $4AA6: $20 $06

    ld   a, [hl]                                  ; $4AA8: $7E
    cp   $F0                                      ; $4AA9: $FE $F0
    jr   nc, .jr_4AAE                             ; $4AAB: $30 $01

    inc  [hl]                                     ; $4AAD: $34

.jr_4AAE
    call UpdateEntityPosWithSpeed_05              ; $4AAE: $CD $B1 $7A
    call label_3B23                               ; $4AB1: $CD $23 $3B
    call GetEntityDropTimer                       ; $4AB4: $CD $FB $0B
    cp   $06                                      ; $4AB7: $FE $06
    jr   nc, jr_005_4AEC                          ; $4AB9: $30 $31

    ldh  a, [hActiveEntityPosY]                   ; $4ABB: $F0 $EF
    cp   $30                                      ; $4ABD: $FE $30
    jr   nc, .jr_4AC5                             ; $4ABF: $30 $04

    ld   [hl], $08                                ; $4AC1: $36 $08
    jr   jr_005_4AEC                              ; $4AC3: $18 $27

.jr_4AC5
    ld   hl, wEntitiesSpeedZTable                 ; $4AC5: $21 $20 $C3
    add  hl, bc                                   ; $4AC8: $09
    inc  [hl]                                     ; $4AC9: $34
    nop                                           ; $4ACA: $00
    ld   hl, wEntitiesSpeedXTable                 ; $4ACB: $21 $40 $C2
    add  hl, bc                                   ; $4ACE: $09
    ld   a, [hl]                                  ; $4ACF: $7E
    and  a                                        ; $4AD0: $A7
    jr   z, jr_005_4ADA                           ; $4AD1: $28 $07

    and  $80                                      ; $4AD3: $E6 $80
    jr   z, .jr_4AD9                              ; $4AD5: $28 $02

    inc  [hl]                                     ; $4AD7: $34
    inc  [hl]                                     ; $4AD8: $34

.jr_4AD9
    dec  [hl]                                     ; $4AD9: $35

jr_005_4ADA:
    ld   hl, wEntitiesSpeedYTable                 ; $4ADA: $21 $50 $C2
    add  hl, bc                                   ; $4ADD: $09
    ld   a, [hl]                                  ; $4ADE: $7E
    and  a                                        ; $4ADF: $A7
    jr   z, jr_005_4AE9                           ; $4AE0: $28 $07

    and  $80                                      ; $4AE2: $E6 $80
    jr   z, .jr_4AE8                              ; $4AE4: $28 $02

    inc  [hl]                                     ; $4AE6: $34
    inc  [hl]                                     ; $4AE7: $34

.jr_4AE8
    dec  [hl]                                     ; $4AE8: $35

jr_005_4AE9:
    jp   AddEntityZSpeedToPos_05                  ; $4AE9: $C3 $EA $7A

jr_005_4AEC:
    ld   hl, wEntitiesCollisionsTable             ; $4AEC: $21 $A0 $C2
    add  hl, bc                                   ; $4AEF: $09
    ld   a, [hl]                                  ; $4AF0: $7E
    and  $03                                      ; $4AF1: $E6 $03
    jr   z, .jr_4B01                              ; $4AF3: $28 $0C

    ld   hl, wEntitiesSpeedXTable                 ; $4AF5: $21 $40 $C2
    add  hl, bc                                   ; $4AF8: $09
    ld   a, [hl]                                  ; $4AF9: $7E
    cpl                                           ; $4AFA: $2F
    inc  a                                        ; $4AFB: $3C
    ld   [hl], a                                  ; $4AFC: $77
    ld   a, JINGLE_BUMP                           ; $4AFD: $3E $09
    ldh  [hJingle], a                             ; $4AFF: $E0 $F2

.jr_4B01
    ld   hl, wEntitiesCollisionsTable             ; $4B01: $21 $A0 $C2
    add  hl, bc                                   ; $4B04: $09
    ld   a, [hl]                                  ; $4B05: $7E
    and  $0C                                      ; $4B06: $E6 $0C
    jr   z, .jr_4B16                              ; $4B08: $28 $0C

    ld   hl, wEntitiesSpeedYTable                 ; $4B0A: $21 $50 $C2
    add  hl, bc                                   ; $4B0D: $09
    ld   a, [hl]                                  ; $4B0E: $7E
    cpl                                           ; $4B0F: $2F
    inc  a                                        ; $4B10: $3C
    ld   [hl], a                                  ; $4B11: $77
    ld   a, JINGLE_BUMP                           ; $4B12: $3E $09
    ldh  [hJingle], a                             ; $4B14: $E0 $F2

.jr_4B16
    call GetEntityDropTimer                       ; $4B16: $CD $FB $0B
    cp   $60                                      ; $4B19: $FE $60
    jr   nc, ret_005_4B40                         ; $4B1B: $30 $23

    ldh  a, [hFrameCounter]                       ; $4B1D: $F0 $E7
    and  $03                                      ; $4B1F: $E6 $03
    jr   nz, ret_005_4B40                         ; $4B21: $20 $1D

    ld   hl, wEntitiesSpeedXTable                 ; $4B23: $21 $40 $C2
    call func_005_4B2C                            ; $4B26: $CD $2C $4B
    ld   hl, wEntitiesSpeedYTable                 ; $4B29: $21 $50 $C2

func_005_4B2C::
    add  hl, bc                                   ; $4B2C: $09
    ld   a, [hl]                                  ; $4B2D: $7E
    cp   $30                                      ; $4B2E: $FE $30
    jr   z, ret_005_4B40                          ; $4B30: $28 $0E

    cp   $D0                                      ; $4B32: $FE $D0
    jr   z, ret_005_4B40                          ; $4B34: $28 $0A

    ld   e, $01                                   ; $4B36: $1E $01
    bit  7, a                                     ; $4B38: $CB $7F
    jr   z, .jr_4B3E                              ; $4B3A: $28 $02

    ld   e, $FF                                   ; $4B3C: $1E $FF

.jr_4B3E
    add  e                                        ; $4B3E: $83
    ld   [hl], a                                  ; $4B3F: $77

ret_005_4B40:
    ret                                           ; $4B40: $C9

func_005_4B41::
    ld   a, $02                                   ; $4B41: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4B43: $E0 $A1
    call AddEntityZSpeedToPos_05                  ; $4B45: $CD $EA $7A
    ld   hl, wEntitiesSpeedZTable                 ; $4B48: $21 $20 $C3
    add  hl, bc                                   ; $4B4B: $09
    dec  [hl]                                     ; $4B4C: $35
    ld   hl, wEntitiesPosZTable                   ; $4B4D: $21 $10 $C3
    add  hl, bc                                   ; $4B50: $09
    ld   a, [hl]                                  ; $4B51: $7E
    and  $80                                      ; $4B52: $E6 $80
    ret  z                                        ; $4B54: $C8

    ld   [hl], b                                  ; $4B55: $70
    xor  a                                        ; $4B56: $AF
    ld   [wC167], a                               ; $4B57: $EA $67 $C1
    ld   a, JINGLE_DUNGEON_OPENED                 ; $4B5A: $3E $23
    ldh  [hJingle], a                             ; $4B5C: $E0 $F2
    call label_27DD                               ; $4B5E: $CD $DD $27
    call GetEntityTransitionCountdown             ; $4B61: $CD $05 $0C
    ld   [hl], $40                                ; $4B64: $36 $40
    call func_005_7B24                            ; $4B66: $CD $24 $7B
    add  $08                                      ; $4B69: $C6 $08
    call SetEntitySpriteVariant                   ; $4B6B: $CD $0C $3B
    call func_005_7B04                            ; $4B6E: $CD $04 $7B
    add  $12                                      ; $4B71: $C6 $12
    cp   $24                                      ; $4B73: $FE $24
    jr   nc, .jr_4B86                             ; $4B75: $30 $0F

    call func_005_7B14                            ; $4B77: $CD $14 $7B
    add  $12                                      ; $4B7A: $C6 $12
    cp   $24                                      ; $4B7C: $FE $24
    jr   nc, .jr_4B86                             ; $4B7E: $30 $06

    ld   hl, wEntitiesPrivateState1Table          ; $4B80: $21 $B0 $C2
    add  hl, bc                                   ; $4B83: $09
    ld   [hl], $80                                ; $4B84: $36 $80

.jr_4B86
    jp   IncrementEntityState                     ; $4B86: $C3 $12 $3B

func_005_4B89::
    call GetEntityTransitionCountdown             ; $4B89: $CD $05 $0C
    cp   $01                                      ; $4B8C: $FE $01
    jr   nz, .jr_4B95                             ; $4B8E: $20 $05

    jp_open_dialog Dialog00A                      ; $4B90

.jr_4B95
    and  a                                        ; $4B95: $A7
    jr   z, .jr_4B9D                              ; $4B96: $28 $05

    ld   a, $02                                   ; $4B98: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4B9A: $E0 $A1
    ret                                           ; $4B9C: $C9

.jr_4B9D
    ldh  a, [hFrameCounter]                       ; $4B9D: $F0 $E7
    and  $1F                                      ; $4B9F: $E6 $1F
    jr   nz, .jr_4BAB                             ; $4BA1: $20 $08

    call func_005_7B24                            ; $4BA3: $CD $24 $7B
    add  $08                                      ; $4BA6: $C6 $08
    call SetEntitySpriteVariant                   ; $4BA8: $CD $0C $3B

.jr_4BAB
    ld   hl, wEntitiesPrivateState1Table          ; $4BAB: $21 $B0 $C2
    add  hl, bc                                   ; $4BAE: $09
    ld   a, [hl]                                  ; $4BAF: $7E
    and  a                                        ; $4BB0: $A7
    jr   nz, .jr_4BB6                             ; $4BB1: $20 $03

    call PushLinkOutOfEntity_05                   ; $4BB3: $CD $C3 $54

.jr_4BB6
    call ShouldLinkTalkToEntity_05                ; $4BB6: $CD $06 $55
    ret  nc                                       ; $4BB9: $D0

    jp_open_dialog Dialog00B                      ; $4BBA

Data_005_4BBF::
    db   $78, $00

TarinIndoorsHandler:
    ld   hl, wEntitiesPrivateState2Table          ; $4BC1: $21 $C0 $C2
    add  hl, bc                                   ; $4BC4: $09
    ld   a, [hl]                                  ; $4BC5: $7E
    and  a                                        ; $4BC6: $A7
    jr   z, jr_005_4BF1                           ; $4BC7: $28 $28

    ld   de, Data_005_4BBF                        ; $4BC9: $11 $BF $4B
    call RenderActiveEntitySprite                 ; $4BCC: $CD $77 $3C
    call ReturnIfNonInteractive_05                ; $4BCF: $CD $3A $7A
    call UpdateEntityPosWithSpeed_05              ; $4BD2: $CD $B1 $7A
    call GetEntityTransitionCountdown             ; $4BD5: $CD $05 $0C
    jp   z, ClearEntityStatus_05                  ; $4BD8: $CA $4B $7B

    and  $10                                      ; $4BDB: $E6 $10
    ld   e, $01                                   ; $4BDD: $1E $01
    jr   z, .jr_4BE3                              ; $4BDF: $28 $02

    ld   e, $FF                                   ; $4BE1: $1E $FF

.jr_4BE3
    ldh  a, [hFrameCounter]                       ; $4BE3: $F0 $E7
    and  $01                                      ; $4BE5: $E6 $01
    jr   nz, .ret_4BF0                            ; $4BE7: $20 $07

    ld   hl, wEntitiesSpeedXTable                 ; $4BE9: $21 $40 $C2
    add  hl, bc                                   ; $4BEC: $09
    ld   a, [hl]                                  ; $4BED: $7E
    add  e                                        ; $4BEE: $83
    ld   [hl], a                                  ; $4BEF: $77

.ret_4BF0
    ret                                           ; $4BF0: $C9

jr_005_4BF1:
    ld   a, [wIsMarinFollowingLink]               ; $4BF1: $FA $73 $DB
    and  a                                        ; $4BF4: $A7
    jr   nz, .jr_4C07                             ; $4BF5: $20 $10

    ld   a, [wHasInstrument3]                     ; $4BF7: $FA $67 $DB
    and  $02                                      ; $4BFA: $E6 $02
    jp   nz, ClearEntityStatus_05                 ; $4BFC: $C2 $4B $7B

    ld   a, [wTradeSequenceItem]                  ; $4BFF: $FA $0E $DB
    cp   $04                                      ; $4C02: $FE $04
    jp   nc, ClearEntityStatus_05                 ; $4C04: $D2 $4B $7B

.jr_4C07
    ld   a, [wDB48]                               ; $4C07: $FA $48 $DB
    and  a                                        ; $4C0A: $A7
    jr   nz, .jr_4C14                             ; $4C0B: $20 $07

    ld   a, [wSwordLevel]                         ; $4C0D: $FA $4E $DB
    and  a                                        ; $4C10: $A7
    jp   nz, ClearEntityStatus_05                 ; $4C11: $C2 $4B $7B

.jr_4C14
    ld   a, [wIsMarinFollowingLink]               ; $4C14: $FA $73 $DB
    and  a                                        ; $4C17: $A7
    jr   nz, .jr_4C24                             ; $4C18: $20 $0A

    ld   a, [wDB48]                               ; $4C1A: $FA $48 $DB
    and  a                                        ; $4C1D: $A7
    jr   z, jr_005_4C43                           ; $4C1E: $28 $23

    cp   $01                                      ; $4C20: $FE $01
    jr   nz, jr_005_4C43                          ; $4C22: $20 $1F

.jr_4C24
    ld   hl, wEntitiesPosXTable                   ; $4C24: $21 $00 $C2
    add  hl, bc                                   ; $4C27: $09
    ld   [hl], $18                                ; $4C28: $36 $18
    ld   hl, wEntitiesPosYTable                   ; $4C2A: $21 $10 $C2
    add  hl, bc                                   ; $4C2D: $09
    ld   [hl], $34                                ; $4C2E: $36 $34
    call CopyEntityPositionToActivePosition       ; $4C30: $CD $8A $3D
    ldh  a, [hIsGBC]                              ; $4C33: $F0 $FE
    and  a                                        ; $4C35: $A7
    jr   z, .jr_4C3E                              ; $4C36: $28 $06

    ld   de, Tarin2SpriteVariants                 ; $4C38: $11 $46 $49
    call RenderActiveEntitySpritesPair            ; $4C3B: $CD $C0 $3B

.jr_4C3E
    ld   de, Tarin4SpriteVariants                 ; $4C3E: $11 $42 $49
    jr   jr_005_4C57                              ; $4C41: $18 $14

jr_005_4C43:
    call func_005_4DCF                            ; $4C43: $CD $CF $4D
    ldh  a, [hFrameCounter]                       ; $4C46: $F0 $E7
    and  $1F                                      ; $4C48: $E6 $1F
    jr   nz, .jr_4C54                             ; $4C4A: $20 $08

    call func_005_7B24                            ; $4C4C: $CD $24 $7B
    ld   hl, wEntitiesSpriteVariantTable          ; $4C4F: $21 $B0 $C3
    add  hl, bc                                   ; $4C52: $09
    ld   [hl], e                                  ; $4C53: $73

.jr_4C54
    ld   de, Tarin3SpriteVariants                 ; $4C54: $11 $32 $49

jr_005_4C57:
    call RenderActiveEntitySpritesPair            ; $4C57: $CD $C0 $3B
    call ReturnIfNonInteractive_05                ; $4C5A: $CD $3A $7A
    call PushLinkOutOfEntity_05                   ; $4C5D: $CD $C3 $54

    ; Jump table excuted when Tarin is giving the shield
    ldh  a, [hActiveEntityState]                  ; $4C60: $F0 $F0
    JP_TABLE                                      ; $4C62: $C7
._00 dw TarinShield0Handler
._01 dw TarinShield1Handler
._02 dw TarinShield2Handler
._03 dw TarinShield3Handler
._04 dw TarinShield4Handler

TarinShield0Handler::
    ld   a, [wShieldLevel]                        ; $4C6D: $FA $44 $DB
    and  a                                        ; $4C70: $A7
    jr   z, .noShield                             ; $4C71: $28 $06

    call IncrementEntityState                     ; $4C73: $CD $12 $3B
    ld   [hl], $03                                ; $4C76: $36 $03
    ret                                           ; $4C78: $C9

.noShield
    ; If Link is nearing the door…
    ldh  a, [hLinkPositionY]                      ; $4C79: $F0 $99
    cp   $7B                                      ; $4C7B: $FE $7B
    jr   c, .whoahWaitEnd                         ; $4C7D: $38 $09
    ; … move Link slighly backwards…
    sub  $02                                      ; $4C7F: $D6 $02
    ldh  [hLinkPositionY], a                      ; $4C81: $E0 $99
    ; … and open the "Woah, wait" dialog.
    jp_open_dialog Dialog000                      ; $4C83
.whoahWaitEnd


    call ShouldLinkTalkToEntity_05                ; $4C88: $CD $06 $55
    ret  nc                                       ; $4C8B: $D0

    ; Open the "There's your shield" dialog
    call_open_dialog Dialog054                    ; $4C8C
    jp   IncrementEntityState                     ; $4C91: $C3 $12 $3B

; This data is pushed into wObjPal8
data_005_4C94::
    db   $FF, $47, $31, $52, $C5, $28, $00, $00

TarinShield1Handler::
    ld   a, [wDialogState]                        ; $4C9C: $FA $9F $C1
    and  a                                        ; $4C9F: $A7
    ret  nz                                       ; $4CA0: $C0

    call GetEntityTransitionCountdown             ; $4CA1: $CD $05 $0C
    ld   [hl], $80                                ; $4CA4: $36 $80
    ld   a, MUSIC_OBTAIN_ITEM                     ; $4CA6: $3E $10
    ld   [wMusicTrackToPlay], a                   ; $4CA8: $EA $68 $D3
    ldh  a, [hIsGBC]                              ; $4CAB: $F0 $FE
    and  a                                        ; $4CAD: $A7
    jr   z, jr_005_4CC3                           ; $4CAE: $28 $13

    ld   hl, wObjPal8                             ; $4CB0: $21 $88 $DC
    ld   de, data_005_4C94                        ; $4CB3: $11 $94 $4C

.loop_4CB6
    ld   a, [de]                                  ; $4CB6: $1A
    ld   [hl+], a                                 ; $4CB7: $22
    inc  de                                       ; $4CB8: $13
    ld   a, l                                     ; $4CB9: $7D
    and  $07                                      ; $4CBA: $E6 $07
    jr   nz, .loop_4CB6                           ; $4CBC: $20 $F8

    ld   a, $02                                   ; $4CBE: $3E $02
    ld   [wPaletteDataFlags], a                   ; $4CC0: $EA $D1 $DD

jr_005_4CC3:
    jp   IncrementEntityState                     ; $4CC3: $C3 $12 $3B

; Shield sprite attributes when getting from Tarin
; Edit this to change sprite
data_005_4cc6::
    db   $86, $17

; Link lifts the shield
TarinShield2Handler::
    ; Wait a number of frames to actually add the shield to the inventory
    call GetEntityTransitionCountdown             ; $4CC8: $CD $05 $0C
    jr   nz, .jr_4CE6                             ; $4CCB: $20 $19

    ld   [wC167], a                               ; $4CCD: $EA $67 $C1
    ; Add the shield to the inventory
    ld   d, INVENTORY_SHIELD                      ; $4CD0: $16 $04
    call AssignItemToSlot                         ; $4CD2: $CD $21 $53

    ld   a, $01                                   ; $4CD5: $3E $01
    ld   [wShieldLevel], a                        ; $4CD7: $EA $44 $DB
    ld   a, LINK_ANIMATION_STATE_STANDING_SHIELD_DOWN ; $4CDA: $3E $22
    ldh  [hLinkAnimationState], a                 ; $4CDC: $E0 $9D
    call_open_dialog Dialog091                    ; $4CDE
    jp   IncrementEntityState                     ; $4CE3: $C3 $12 $3B

.jr_4CE6
    ldh  a, [hLinkPositionX]                      ; $4CE6: $F0 $98
    ldh  [hActiveEntityPosX], a                   ; $4CE8: $E0 $EE
    ldh  a, [hLinkPositionY]                      ; $4CEA: $F0 $99
    sub  $0C                                      ; $4CEC: $D6 $0C
    ldh  [hActiveEntityVisualPosY], a             ; $4CEE: $E0 $EC
    xor  a                                        ; $4CF0: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $4CF1: $E0 $F1
    ld   de, data_005_4cc6                        ; $4CF3: $11 $C6 $4C
    call RenderActiveEntitySprite                 ; $4CF6: $CD $77 $3C
    call CopyEntityPositionToActivePosition       ; $4CF9: $CD $8A $3D
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM         ; $4CFC: $3E $6C
    ldh  [hLinkAnimationState], a                 ; $4CFE: $E0 $9D
    ld   a, $02                                   ; $4D00: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4D02: $E0 $A1
    ld   a, $03                                   ; $4D04: $3E $03
    ldh  [hLinkDirection], a                      ; $4D06: $E0 $9E
    ret                                           ; $4D08: $C9

TarinShield3Handler::
    ld   a, [wDB48]                               ; $4D09: $FA $48 $DB
    and  a                                        ; $4D0C: $A7
    jr   z, jr_005_4D4D                           ; $4D0D: $28 $3E

    cp   $01                                      ; $4D0F: $FE $01
    jr   z, jr_005_4D38                           ; $4D11: $28 $25

    call ShouldLinkTalkToEntity_05                ; $4D13: $CD $06 $55
    jr   nc, .jr_4D2C                             ; $4D16: $30 $14

    ld   a, [wIsMarinFollowingLink]               ; $4D18: $FA $73 $DB
    and  a                                        ; $4D1B: $A7
    ld_dialog_low a, Dialog1DD ; "I lost my taste for honey" ; $4D1C: $3E $DD
    jr   nz, jr_005_4D35                          ; $4D1E: $20 $15

    ld   a, [wTradeSequenceItem]                  ; $4D20: $FA $0E $DB
    cp   $03                                      ; $4D23: $FE $03
    jr   nz, jr_005_4D33                          ; $4D25: $20 $0C

    call_open_dialog Dialog1C5                    ; $4D27

.jr_4D2C
    ld   a, [wIsMarinFollowingLink]               ; $4D2C: $FA $73 $DB
    and  a                                        ; $4D2F: $A7
    jr   nz, jr_005_4D5D                          ; $4D30: $20 $2B

    ret                                           ; $4D32: $C9

jr_005_4D33:
    ld_dialog_low a, Dialog1C5 ; "Got bananas on the beach" ; $4D33: $3E $C5

jr_005_4D35:
    jp   OpenDialogInTable1                       ; $4D35: $C3 $73 $23

jr_005_4D38:
    call ShouldLinkTalkToEntity_05                ; $4D38: $CD $06 $55
    jr   nc, jr_005_4D4B                          ; $4D3B: $30 $0E

    ld   a, [wHasInstrument1]                     ; $4D3D: $FA $65 $DB
    bit  1, a                                     ; $4D40: $CB $4F
    ld_dialog_low a, Dialog011 ; "I'm tired…"     ; $4D42: $3E $11
    jr   z, .jr_4D48                              ; $4D44: $28 $02

    ld_dialog_low a, Dialog010 ; "Snore…"         ; $4D46: $3E $10

.jr_4D48
    call OpenDialogInTable0                       ; $4D48: $CD $85 $23

jr_005_4D4B:
    jr   jr_005_4D56                              ; $4D4B: $18 $09

jr_005_4D4D:
    call ShouldLinkTalkToEntity_05                ; $4D4D: $CD $06 $55
    ret  nc                                       ; $4D50: $D0

    jp_open_dialog Dialog055                      ; $4D51

jr_005_4D56:
    ld   a, [wDB48]                               ; $4D56: $FA $48 $DB
    cp   $01                                      ; $4D59: $FE $01
    jr   nz, ret_005_4DA2                         ; $4D5B: $20 $45

jr_005_4D5D:
    ld   hl, wEntitiesInertiaTable                ; $4D5D: $21 $D0 $C3
    add  hl, bc                                   ; $4D60: $09
    ld   a, [hl]                                  ; $4D61: $7E
    add  $07                                      ; $4D62: $C6 $07
    ld   [hl], a                                  ; $4D64: $77
    jr   nc, ret_005_4DA2                         ; $4D65: $30 $3B

    ld   a, ENTITY_TARIN                          ; $4D67: $3E $3F
    call SpawnNewEntity_trampoline                ; $4D69: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $4D6C: $F0 $D7
    add  $06                                      ; $4D6E: $C6 $06
    ld   hl, wEntitiesPosXTable                   ; $4D70: $21 $00 $C2
    add  hl, de                                   ; $4D73: $19
    ld   [hl], a                                  ; $4D74: $77
    ldh  a, [hMultiPurpose1]                      ; $4D75: $F0 $D8
    sub  $03                                      ; $4D77: $D6 $03
    ld   hl, wEntitiesPosYTable                   ; $4D79: $21 $10 $C2
    add  hl, de                                   ; $4D7C: $19
    ld   [hl], a                                  ; $4D7D: $77
    ld   hl, wEntitiesPrivateState2Table          ; $4D7E: $21 $C0 $C2
    add  hl, de                                   ; $4D81: $19
    ld   [hl], $01                                ; $4D82: $36 $01
    ld   hl, wEntitiesSpeedXTable                 ; $4D84: $21 $40 $C2
    add  hl, de                                   ; $4D87: $19
    ld   [hl], $FF                                ; $4D88: $36 $FF
    ld   hl, wEntitiesSpeedYTable                 ; $4D8A: $21 $50 $C2
    add  hl, de                                   ; $4D8D: $19
    ld   [hl], $FD                                ; $4D8E: $36 $FD
    ld   hl, wEntitiesTransitionCountdownTable    ; $4D90: $21 $E0 $C2
    add  hl, de                                   ; $4D93: $19
    ld   [hl], $30                                ; $4D94: $36 $30
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4D96: $21 $40 $C3
    add  hl, de                                   ; $4D99: $19
    ld   [hl], 1 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $4D9A: $36 $C1
    ld   hl, wEntitiesHitboxFlagsTable            ; $4D9C: $21 $50 $C3
    add  hl, de                                   ; $4D9F: $19
    ld   [hl], $00                                ; $4DA0: $36 $00

ret_005_4DA2:
    ret                                           ; $4DA2: $C9

TarinShield4Handler::
    ld   a, [wDialogState]                        ; $4DA3: $FA $9F $C1
    and  a                                        ; $4DA6: $A7
    jr   nz, ret_005_4DC6                         ; $4DA7: $20 $1D

    ld   a, [wDialogAskSelectionIndex]            ; $4DA9: $FA $77 $C1
    and  a                                        ; $4DAC: $A7
    jr   nz, .jr_4DBD                             ; $4DAD: $20 $0E

    ld   a, TRADING_ITEM_BANANAS                  ; $4DAF: $3E $04
    ld   [wTradeSequenceItem], a                  ; $4DB1: $EA $0E $DB
    ld   a, REPLACE_TILES_TRADING_ITEM            ; $4DB4: $3E $0D
    ldh  [hReplaceTiles], a                       ; $4DB6: $E0 $A5
    call CreateTradingItemEntity                  ; $4DB8: $CD $0C $0C
    jr   jr_005_4DC2                              ; $4DBB: $18 $05

.jr_4DBD
    call_open_dialog Dialog1C9                    ; $4DBD

jr_005_4DC2:
    call IncrementEntityState                     ; $4DC2: $CD $12 $3B
    ld   [hl], b                                  ; $4DC5: $70

ret_005_4DC6:
    ret                                           ; $4DC6: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Tarin6SpriteVariants::
.variant0
    db $74, OAM_GBC_PAL_7 | OAMF_PAL0
    db $76, OAM_GBC_PAL_7 | OAMF_PAL0

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Tarin5SpriteVariants::
.variant0
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0

func_005_4DCF::
    ld   a, [wDB48]                               ; $4DCF: $FA $48 $DB
    cp   $02                                      ; $4DD2: $FE $02
    ret  nz                                       ; $4DD4: $C0

    ld   a, [wTradeSequenceItem]                  ; $4DD5: $FA $0E $DB
    cp   $04                                      ; $4DD8: $FE $04
    jr   nc, .jr_4DE3                             ; $4DDA: $30 $07

    ld   a, $78                                   ; $4DDC: $3E $78
    ld   de, Tarin6SpriteVariants                 ; $4DDE: $11 $C7 $4D
    jr   jr_005_4DF3                              ; $4DE1: $18 $10

.jr_4DE3
    ldh  a, [hRoomStatus]                         ; $4DE3: $F0 $F8
    and  ROOM_STATUS_EVENT_2                      ; $4DE5: $E6 $20
    ret  z                                        ; $4DE7: $C8

    ld   hl, wEntitiesPosYTable                   ; $4DE8: $21 $10 $C2
    add  hl, bc                                   ; $4DEB: $09
    ld   [hl], $4B                                ; $4DEC: $36 $4B
    ld   de, Tarin5SpriteVariants                 ; $4DEE: $11 $CB $4D
    ld   a, $7C                                   ; $4DF1: $3E $7C

jr_005_4DF3:
    ldh  [hActiveEntityPosX], a                   ; $4DF3: $E0 $EE
    ld   a, $5C                                   ; $4DF5: $3E $5C
    ldh  [hActiveEntityVisualPosY], a             ; $4DF7: $E0 $EC
    xor  a                                        ; $4DF9: $AF
    ldh  [hActiveEntitySpriteVariant], a          ; $4DFA: $E0 $F1
    call RenderActiveEntitySpritesPair            ; $4DFC: $CD $C0 $3B
    call CopyEntityPositionToActivePosition       ; $4DFF: $CD $8A $3D
    ld   hl, wEntitiesSpriteVariantTable          ; $4E02: $21 $B0 $C3
    add  hl, bc                                   ; $4E05: $09
    ld   a, [hl]                                  ; $4E06: $7E
    ldh  [hActiveEntitySpriteVariant], a          ; $4E07: $E0 $F1
    ret                                           ; $4E09: $C9
