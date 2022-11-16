; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BunnyCallingMarinSpriteVariants::
.variant0
    db $5A, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $58, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $5E, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db $5C, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $58, OAM_GBC_PAL_1 | OAMF_PAL0
    db $5A, OAM_GBC_PAL_1 | OAMF_PAL0
.variant3
    db $5C, OAM_GBC_PAL_1 | OAMF_PAL0
    db $5E, OAM_GBC_PAL_1 | OAMF_PAL0

BunnyCallingMarinEntityHandler::
    ld   de, BunnyCallingMarinSpriteVariants      ; $52A6: $11 $96 $52
    call RenderActiveEntitySpritesPair            ; $52A9: $CD $C0 $3B
    ldh  a, [hFrameCounter]                       ; $52AC: $F0 $E7
    rra                                           ; $52AE: $1F
    rra                                           ; $52AF: $1F
    rra                                           ; $52B0: $1F
    and  $01                                      ; $52B1: $E6 $01
    call SetEntitySpriteVariant                   ; $52B3: $CD $0C $3B
    ld   a, $02                                   ; $52B6: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $52B8: $E0 $A1
    ld   [wC167], a                               ; $52BA: $EA $67 $C1
    call AddEntityZSpeedToPos_18                  ; $52BD: $CD $98 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $52C0: $21 $20 $C3
    add  hl, bc                                   ; $52C3: $09
    dec  [hl]                                     ; $52C4: $35
    dec  [hl]                                     ; $52C5: $35
    ld   hl, wEntitiesPosZTable                   ; $52C6: $21 $10 $C3
    add  hl, bc                                   ; $52C9: $09
    ld   a, [hl]                                  ; $52CA: $7E
    and  $80                                      ; $52CB: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $52CD: $E0 $E8
    jr   z, .jr_52D7                              ; $52CF: $28 $06

    ld   [hl], b                                  ; $52D1: $70
    ld   hl, wEntitiesSpeedZTable                 ; $52D2: $21 $20 $C3
    add  hl, bc                                   ; $52D5: $09
    ld   [hl], b                                  ; $52D6: $70

.jr_52D7
    ldh  a, [hActiveEntityState]                  ; $52D7: $F0 $F0
    JP_TABLE                                      ; $52D9
._00 dw BunnyCallingMarinState0Handler
._01 dw BunnyCallingMarinState1Handler
._02 dw BunnyCallingMarinState2Handler
._03 dw BunnyCallingMarinState3Handler

BunnyCallingMarinState0Handler::
    call GetEntityTransitionCountdown             ; $52E2: $CD $05 $0C
    ret  nz                                       ; $52E5: $C0

    ld   hl, wEntitiesSpeedXTable                 ; $52E6: $21 $40 $C2
    add  hl, bc                                   ; $52E9: $09
    ld   [hl], $0C                                ; $52EA: $36 $0C
    call AddEntitySpeedToPos_18                   ; $52EC: $CD $6C $7E
    ldh  a, [hActiveEntityPosX]                   ; $52EF: $F0 $EE
    cp   $20                                      ; $52F1: $FE $20
    jr   nz, .jr_5304                             ; $52F3: $20 $0F

    ld   a, $01                                   ; $52F5: $3E $01
    call func_018_59AE                            ; $52F7: $CD $AE $59
    ld   a, $01                                   ; $52FA: $3E $01
    ldh  [hLinkDirection], a                      ; $52FC: $E0 $9E
    push bc                                       ; $52FE: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $52FF: $CD $F0 $0B
    pop  bc                                       ; $5302: $C1
    ret                                           ; $5303: $C9

.jr_5304
    cp   $48                                      ; $5304: $FE $48
    ret  nz                                       ; $5306: $C0

    call GetEntityTransitionCountdown             ; $5307: $CD $05 $0C
    ld   [hl], $40                                ; $530A: $36 $40
    jp   IncrementEntityState                     ; $530C: $C3 $12 $3B

BunnyCallingMarinState1Handler::
    call GetEntityTransitionCountdown             ; $530F: $CD $05 $0C
    jr   nz, func_018_5321                        ; $5312: $20 $0D

    call_open_dialog Dialog1E3                    ; $5314
    call GetEntityTransitionCountdown             ; $5319: $CD $05 $0C
    ld   [hl], $10                                ; $531C: $36 $10
    call IncrementEntityState                     ; $531E: $CD $12 $3B

func_018_5321::
    ldh  a, [hMultiPurposeG]                      ; $5321: $F0 $E8
    and  a                                        ; $5323: $A7
    jr   z, .ret_5337                             ; $5324: $28 $11

    ld   hl, wEntitiesPrivateState4Table          ; $5326: $21 $40 $C4
    add  hl, bc                                   ; $5329: $09
    ld   a, [hl]                                  ; $532A: $7E
    dec  [hl]                                     ; $532B: $35
    and  a                                        ; $532C: $A7
    jr   nz, .ret_5337                            ; $532D: $20 $08

    ld   [hl], $08                                ; $532F: $36 $08
    ld   hl, wEntitiesSpeedZTable                 ; $5331: $21 $20 $C3
    add  hl, bc                                   ; $5334: $09
    ld   [hl], $12                                ; $5335: $36 $12

.ret_5337
    ret                                           ; $5337: $C9

BunnyCallingMarinState2Handler::
    call func_018_5321                            ; $5338: $CD $21 $53
    ld   a, [wDialogState]                        ; $533B: $FA $9F $C1
    and  a                                        ; $533E: $A7
    ret  nz                                       ; $533F: $C0

    call GetEntityTransitionCountdown             ; $5340: $CD $05 $0C
    jr   nz, .jr_534F                             ; $5343: $20 $0A

    ld   [hl], $10                                ; $5345: $36 $10
    call_open_dialog Dialog1E5                    ; $5347
    jp   IncrementEntityState                     ; $534C: $C3 $12 $3B

.jr_534F
    ld   e, $02                                   ; $534F: $1E $02
    cp   $08                                      ; $5351: $FE $08
    jr   nc, .jr_5357                             ; $5353: $30 $02

    ld   e, $00                                   ; $5355: $1E $00

.jr_5357
    ld   a, e                                     ; $5357: $7B
    jp   func_018_59AE                            ; $5358: $C3 $AE $59

BunnyCallingMarinState3Handler::
    call func_018_5321                            ; $535B: $CD $21 $53
    ld   a, [wDialogState]                        ; $535E: $FA $9F $C1
    and  a                                        ; $5361: $A7
    jr   nz, ret_018_53CD                         ; $5362: $20 $69

    call GetEntityTransitionCountdown             ; $5364: $CD $05 $0C
    jr   z, jr_018_5375                           ; $5367: $28 $0C

    ld   e, $01                                   ; $5369: $1E $01
    cp   $08                                      ; $536B: $FE $08
    jr   c, .jr_5371                              ; $536D: $38 $02

    ld   e, $02                                   ; $536F: $1E $02

.jr_5371
    ld   a, e                                     ; $5371: $7B
    jp   func_018_59AE                            ; $5372: $C3 $AE $59

jr_018_5375:
    ldh  a, [hFrameCounter]                       ; $5375: $F0 $E7
    rra                                           ; $5377: $1F
    rra                                           ; $5378: $1F
    rra                                           ; $5379: $1F
    and  $01                                      ; $537A: $E6 $01
    add  $02                                      ; $537C: $C6 $02
    call SetEntitySpriteVariant                   ; $537E: $CD $0C $3B
    ld   hl, wIsMarinInAnimalVillage              ; $5381: $21 $74 $DB
    ld   [hl], $01                                ; $5384: $36 $01
    ldh  a, [hActiveEntityPosX]                   ; $5386: $F0 $EE
    and  $FC                                      ; $5388: $E6 $FC
    cp   $E0                                      ; $538A: $FE $E0
    jr   z, .jr_5397                              ; $538C: $28 $09

    ld   hl, wEntitiesSpeedXTable                 ; $538E: $21 $40 $C2
    add  hl, bc                                   ; $5391: $09
    ld   [hl], $EC                                ; $5392: $36 $EC
    call AddEntitySpeedToPos_18                   ; $5394: $CD $6C $7E

.jr_5397
    ld   a, [wMarinEntityIndex]                   ; $5397: $FA $0F $C5
    ld   e, a                                     ; $539A: $5F
    ld   d, b                                     ; $539B: $50
    ld   hl, wEntitiesSpeedXTable                 ; $539C: $21 $40 $C2
    add  hl, de                                   ; $539F: $19
    ld   [hl], $F4                                ; $53A0: $36 $F4
    ldh  a, [hFrameCounter]                       ; $53A2: $F0 $E7
    rra                                           ; $53A4: $1F
    rra                                           ; $53A5: $1F
    rra                                           ; $53A6: $1F
    and  $01                                      ; $53A7: $E6 $01
    add  $04                                      ; $53A9: $C6 $04
    ld   hl, wEntitiesSpriteVariantTable          ; $53AB: $21 $B0 $C3
    add  hl, de                                   ; $53AE: $19
    ld   [hl], a                                  ; $53AF: $77
    push de                                       ; $53B0: $D5
    push bc                                       ; $53B1: $C5
    ld   c, e                                     ; $53B2: $4B
    ld   b, d                                     ; $53B3: $42
    call AddEntitySpeedToPos_18                   ; $53B4: $CD $6C $7E
    pop  bc                                       ; $53B7: $C1
    pop  de                                       ; $53B8: $D1
    ld   hl, wEntitiesPosXTable                   ; $53B9: $21 $00 $C2
    add  hl, de                                   ; $53BC: $19
    ld   a, [hl]                                  ; $53BD: $7E
    cp   $F0                                      ; $53BE: $FE $F0
    jr   nz, ret_018_53CD                         ; $53C0: $20 $0B

    call ClearEntityStatusBank18                  ; $53C2: $CD $08 $7F
    xor  a                                        ; $53C5: $AF
    ld   [wIsMarinFollowingLink], a               ; $53C6: $EA $73 $DB
    xor  a                                        ; $53C9: $AF
    ld   [wC167], a                               ; $53CA: $EA $67 $C1

ret_018_53CD:
    ret                                           ; $53CD: $C9
