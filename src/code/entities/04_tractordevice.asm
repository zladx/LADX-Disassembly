; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
; one reversed and one normal ???
TractorDevice1SpriteVariants::
.variant0
    db $4C, OAM_GBC_PAL_7 | OAMF_PAL0
    db $4C, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $4E, OAM_GBC_PAL_4 | OAMF_PAL0
    db $4E, OAM_GBC_PAL_4 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
; one reversed and one normal ???
TractorDevice2SpriteVariants::
.variant0
    db $7C, OAM_GBC_PAL_7 | OAMF_PAL0
    db $7C, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $7E, OAM_GBC_PAL_4 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_4 | OAMF_PAL0 | OAMF_XFLIP

TractorDeviceEntityHandler::
ReversedTractorDeviceEntityHandler::
    ld   hl, wD45E                                ; $04:6824: $21 $5E $D4
    inc  [hl]                                     ; $04:6827: $34
    ld   de, TractorDevice1SpriteVariants         ; $04:6828: $11 $14 $68
    ldh  a, [hMapId]                              ; $04:682B: $F0 $F7
    cp   MAP_BOTTLE_GROTTO                        ; $04:682D: $FE $01
    jr   nz, .jr_6834                             ; $04:682F: $20 $03

    ld   de, TractorDevice2SpriteVariants         ; $04:6831: $11 $1C $68

.jr_6834
    call RenderActiveEntitySpritesPair            ; $04:6834: $CD $C0 $3B
    call ReturnIfNonInteractive_04                ; $04:6837: $CD $A3 $7F
    call label_3B70                               ; $04:683A: $CD $70 $3B
    ldh  a, [hActiveEntityState]                  ; $04:683D: $F0 $F0
    JP_TABLE                                      ; $04:683F
._00 dw func_004_6848                             ; $04:6840
._01 dw func_004_68FD                             ; $04:6842

Data_004_6844::
    db   $00, $03, $01, $02

func_004_6848::
    call GetEntityDropTimer                       ; $04:6848: $CD $FB $0B
    jr   nz, .jr_6852                             ; $04:684B: $20 $05

    ld   [hl], $10                                ; $04:684D: $36 $10
    jp   IncrementEntityState                     ; $04:684F: $C3 $12 $3B

.jr_6852
    ld   a, [wLinkMotionState]                    ; $04:6852: $FA $1C $C1
    cp   LINK_MOTION_DEFAULT                      ; $04:6855: $FE $00
    jp   nz, label_004_68E4                       ; $04:6857: $C2 $E4 $68

    ldh  a, [hLinkSpeedX]                         ; $04:685A: $F0 $9A
    push af                                       ; $04:685C: $F5
    ldh  a, [hLinkSpeedY]                         ; $04:685D: $F0 $9B
    push af                                       ; $04:685F: $F5
    ld   e, $00                                   ; $04:6860: $1E $00
    ldh  a, [hActiveEntityType]                   ; $04:6862: $F0 $EB
    cp   ENTITY_TRACTOR_DEVICE                    ; $04:6864: $FE $52
    ld   a, $14                                   ; $04:6866: $3E $14
    jr   nz, .jr_686D                             ; $04:6868: $20 $03

    inc  e                                        ; $04:686A: $1C
    ld   a, $08                                   ; $04:686B: $3E $08

.jr_686D
    push de                                       ; $04:686D: $D5
    call GetVectorTowardsLink_trampoline          ; $04:686E: $CD $B5 $3B
    pop  de                                       ; $04:6871: $D1
    ldh  a, [hMultiPurpose0]                      ; $04:6872: $F0 $D7
    bit  0, e                                     ; $04:6874: $CB $43
    jr   z, .jr_687A                              ; $04:6876: $28 $02

    cpl                                           ; $04:6878: $2F
    inc  a                                        ; $04:6879: $3C

.jr_687A
    ldh  [hLinkSpeedY], a                         ; $04:687A: $E0 $9B
    ldh  a, [hMultiPurpose1]                      ; $04:687C: $F0 $D8
    bit  0, e                                     ; $04:687E: $CB $43
    jr   z, .jr_6884                              ; $04:6880: $28 $02

    cpl                                           ; $04:6882: $2F
    inc  a                                        ; $04:6883: $3C

.jr_6884
    ldh  [hLinkSpeedX], a                         ; $04:6884: $E0 $9A
    push bc                                       ; $04:6886: $C5
    call UpdateFinalLinkPosition                  ; $04:6887: $CD $A8 $21
    call label_3E19                               ; $04:688A: $CD $19 $3E
    pop  bc                                       ; $04:688D: $C1
    pop  af                                       ; $04:688E: $F1
    ldh  [hLinkSpeedY], a                         ; $04:688F: $E0 $9B
    pop  af                                       ; $04:6891: $F1
    ldh  [hLinkSpeedX], a                         ; $04:6892: $E0 $9A
    xor  a                                        ; $04:6894: $AF
    ld   [wIsLinkPushing], a                      ; $04:6895: $EA $44 $C1
    ldh  a, [hActiveEntityType]                   ; $04:6898: $F0 $EB
    cp   ENTITY_TRACTOR_DEVICE                    ; $04:689A: $FE $52
    jp   nz, label_004_68E4                       ; $04:689C: $C2 $E4 $68

    ld   a, [wIsLinkInTheAir]                     ; $04:689F: $FA $46 $C1
    and  a                                        ; $04:68A2: $A7
    jr   nz, .jr_68D4                             ; $04:68A3: $20 $2F

    call func_004_6E35                            ; $04:68A5: $CD $35 $6E
    add  $04                                      ; $04:68A8: $C6 $04
    cp   $08                                      ; $04:68AA: $FE $08
    jr   nc, .jr_68D4                             ; $04:68AC: $30 $26

    call func_004_6E45                            ; $04:68AE: $CD $45 $6E
    add  $04                                      ; $04:68B1: $C6 $04
    cp   $08                                      ; $04:68B3: $FE $08
    jr   nc, .jr_68D4                             ; $04:68B5: $30 $1D

    ldh  a, [hActiveEntityPosX]                   ; $04:68B7: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $04:68B9: $E0 $98
    ldh  a, [hActiveEntityVisualPosY]             ; $04:68BB: $F0 $EC
    ldh  [hLinkPositionY], a                      ; $04:68BD: $E0 $99
    ld   a, LINK_MOTION_FALLING_DOWN              ; $04:68BF: $3E $06
    ld   [wLinkMotionState], a                    ; $04:68C1: $EA $1C $C1
    call ResetSpinAttack                          ; $04:68C4: $CD $AF $0C
    ld   [wC198], a                               ; $04:68C7: $EA $98 $C1
    ld   a, $FF                                   ; $04:68CA: $3E $FF
    ld   [wDBCB], a                               ; $04:68CC: $EA $CB $DB
    ld   a, WAVE_SFX_LINK_FALL                    ; $04:68CF: $3E $0C
    ldh  [hWaveSfx], a                            ; $04:68D1: $E0 $F3
    ret                                           ; $04:68D3: $C9

.jr_68D4
    ldh  a, [hFrameCounter]                       ; $04:68D4: $F0 $E7
    rra                                           ; $04:68D6: $1F
    rra                                           ; $04:68D7: $1F
    rra                                           ; $04:68D8: $1F
    and  $03                                      ; $04:68D9: $E6 $03
    ld   e, a                                     ; $04:68DB: $5F
    ld   d, b                                     ; $04:68DC: $50
    ld   hl, Data_004_6844                        ; $04:68DD: $21 $44 $68
    add  hl, de                                   ; $04:68E0: $19
    ld   a, [hl]                                  ; $04:68E1: $7E
    ldh  [hLinkDirection], a                      ; $04:68E2: $E0 $9E

label_004_68E4:
    call func_004_690D                            ; $04:68E4: $CD $0D $69
    ldh  a, [hFrameCounter]                       ; $04:68E7: $F0 $E7
    rra                                           ; $04:68E9: $1F
    rra                                           ; $04:68EA: $1F
    rra                                           ; $04:68EB: $1F
    rra                                           ; $04:68EC: $1F
    and  $01                                      ; $04:68ED: $E6 $01
    call SetEntitySpriteVariant                   ; $04:68EF: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $04:68F2: $F0 $E7
    and  $1F                                      ; $04:68F4: $E6 $1F
    jr   nz, .ret_68FC                            ; $04:68F6: $20 $04

    ld   a, NOISE_SFX_BLACK_HOLE_ACTIVE           ; $04:68F8: $3E $1F
    ldh  [hNoiseSfx], a                           ; $04:68FA: $E0 $F4

.ret_68FC
    ret                                           ; $04:68FC: $C9

func_004_68FD::
    call GetEntityDropTimer                       ; $04:68FD: $CD $FB $0B
    jr   nz, .jr_6908                             ; $04:6900: $20 $06

    ld   [hl], $40                                ; $04:6902: $36 $40
    call IncrementEntityState                     ; $04:6904: $CD $12 $3B
    ld   [hl], b                                  ; $04:6907: $70

.jr_6908
    ld   a, $00                                   ; $04:6908: $3E $00
    jp   SetEntitySpriteVariant                   ; $04:690A: $C3 $0C $3B

func_004_690D::
    ld   e, $0F                                   ; $04:690D: $1E $0F
    ld   d, b                                     ; $04:690F: $50

label_004_6910:
    push de                                       ; $04:6910: $D5
    ld   a, e                                     ; $04:6911: $7B
    cp   c                                        ; $04:6912: $B9
    jp   z, label_004_69A5                        ; $04:6913: $CA $A5 $69

    ld   hl, wEntitiesStatusTable                 ; $04:6916: $21 $80 $C2
    add  hl, de                                   ; $04:6919: $19
    ld   a, [hl]                                  ; $04:691A: $7E
    and  a                                        ; $04:691B: $A7
    jp   z, label_004_69A5                        ; $04:691C: $CA $A5 $69

    call CopyEntityPositionToActivePosition       ; $04:691F: $CD $8A $3D
    push bc                                       ; $04:6922: $C5
    ld   c, e                                     ; $04:6923: $4B
    ld   b, d                                     ; $04:6924: $42
    ldh  a, [hFrameCounter]                       ; $04:6925: $F0 $E7
    xor  c                                        ; $04:6927: $A9
    and  $01                                      ; $04:6928: $E6 $01
    jr   nz, jr_004_69A4                          ; $04:692A: $20 $78

    ldh  a, [hLinkPositionX]                      ; $04:692C: $F0 $98
    push af                                       ; $04:692E: $F5
    ldh  a, [hLinkPositionY]                      ; $04:692F: $F0 $99
    push af                                       ; $04:6931: $F5
    ldh  a, [hActiveEntityPosX]                   ; $04:6932: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $04:6934: $E0 $98
    ldh  a, [hActiveEntityPosY]                   ; $04:6936: $F0 $EF
    ldh  [hLinkPositionY], a                      ; $04:6938: $E0 $99
    ld   hl, wEntitiesSpeedXTable                 ; $04:693A: $21 $40 $C2
    add  hl, bc                                   ; $04:693D: $09
    ld   a, [hl]                                  ; $04:693E: $7E
    push af                                       ; $04:693F: $F5
    ld   hl, wEntitiesSpeedYTable                 ; $04:6940: $21 $50 $C2
    add  hl, bc                                   ; $04:6943: $09
    ld   a, [hl]                                  ; $04:6944: $7E
    push af                                       ; $04:6945: $F5
    ld   a, $10                                   ; $04:6946: $3E $10
    call GetVectorTowardsLink_trampoline          ; $04:6948: $CD $B5 $3B
    ld   e, $00                                   ; $04:694B: $1E $00
    ldh  a, [hActiveEntityType]                   ; $04:694D: $F0 $EB
    cp   ENTITY_TRACTOR_DEVICE                    ; $04:694F: $FE $52
    jr   nz, .jr_6954                             ; $04:6951: $20 $01

    inc  e                                        ; $04:6953: $1C

.jr_6954
    ldh  a, [hMultiPurpose0]                      ; $04:6954: $F0 $D7
    bit  0, e                                     ; $04:6956: $CB $43
    jr   nz, .jr_695C                             ; $04:6958: $20 $02

    cpl                                           ; $04:695A: $2F
    inc  a                                        ; $04:695B: $3C

.jr_695C
    ld   hl, wEntitiesSpeedYTable                 ; $04:695C: $21 $50 $C2
    add  hl, bc                                   ; $04:695F: $09
    ld   [hl], a                                  ; $04:6960: $77
    ldh  a, [hMultiPurpose1]                      ; $04:6961: $F0 $D8
    bit  0, e                                     ; $04:6963: $CB $43
    jr   nz, .jr_6969                             ; $04:6965: $20 $02

    cpl                                           ; $04:6967: $2F
    inc  a                                        ; $04:6968: $3C

.jr_6969
    ld   hl, wEntitiesSpeedXTable                 ; $04:6969: $21 $40 $C2
    add  hl, bc                                   ; $04:696C: $09
    ld   [hl], a                                  ; $04:696D: $77
    call CopyEntityPositionToActivePosition       ; $04:696E: $CD $8A $3D
    call UpdateEntityPosWithSpeed_04              ; $04:6971: $CD $CA $6D
    call DefaultEntityPhysics_trampoline          ; $04:6974: $CD $23 $3B
    ldh  a, [hActiveEntityPosX]                   ; $04:6977: $F0 $EE
    ld   hl, hLinkPositionX                       ; $04:6979: $21 $98 $FF
    sub  [hl]                                     ; $04:697C: $96
    add  $02                                      ; $04:697D: $C6 $02
    cp   $04                                      ; $04:697F: $FE $04
    jr   nc, .jr_6992                             ; $04:6981: $30 $0F

    ldh  a, [hActiveEntityVisualPosY]             ; $04:6983: $F0 $EC
    ld   hl, hLinkPositionY                       ; $04:6985: $21 $99 $FF
    sub  [hl]                                     ; $04:6988: $96
    add  $02                                      ; $04:6989: $C6 $02
    cp   $04                                      ; $04:698B: $FE $04
    jr   nc, .jr_6992                             ; $04:698D: $30 $03

    call ClearEntityStatusBank04                  ; $04:698F: $CD $7A $6D

.jr_6992
    pop  af                                       ; $04:6992: $F1
    ld   hl, wEntitiesSpeedYTable                 ; $04:6993: $21 $50 $C2
    add  hl, bc                                   ; $04:6996: $09
    ld   [hl], a                                  ; $04:6997: $77
    pop  af                                       ; $04:6998: $F1
    ld   hl, wEntitiesSpeedXTable                 ; $04:6999: $21 $40 $C2
    add  hl, bc                                   ; $04:699C: $09
    ld   [hl], a                                  ; $04:699D: $77
    pop  af                                       ; $04:699E: $F1
    ldh  [hLinkPositionY], a                      ; $04:699F: $E0 $99
    pop  af                                       ; $04:69A1: $F1
    ldh  [hLinkPositionX], a                      ; $04:69A2: $E0 $98

jr_004_69A4:
    pop  bc                                       ; $04:69A4: $C1

label_004_69A5:
    pop  de                                       ; $04:69A5: $D1
    dec  e                                        ; $04:69A6: $1D
    ld   a, e                                     ; $04:69A7: $7B
    cp   $FF                                      ; $04:69A8: $FE $FF
    jp   nz, label_004_6910                       ; $04:69AA: $C2 $10 $69

    ret                                           ; $04:69AD: $C9
