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
    ld   hl, wD45E                                ; $6824: $21 $5E $D4
    inc  [hl]                                     ; $6827: $34
    ld   de, TractorDevice1SpriteVariants         ; $6828: $11 $14 $68
    ldh  a, [hMapId]                              ; $682B: $F0 $F7
    cp   MAP_BOTTLE_GROTTO                        ; $682D: $FE $01
    jr   nz, .jr_6834                             ; $682F: $20 $03

    ld   de, TractorDevice2SpriteVariants         ; $6831: $11 $1C $68

.jr_6834
    call RenderActiveEntitySpritesPair            ; $6834: $CD $C0 $3B
    call ReturnIfNonInteractive_04                ; $6837: $CD $A3 $7F
    call label_3B70                               ; $683A: $CD $70 $3B
    ldh  a, [hActiveEntityState]                  ; $683D: $F0 $F0
    JP_TABLE                                      ; $683F
._00 dw func_004_6848                             ; $6840
._01 dw func_004_68FD                             ; $6842

Data_004_6844::
    db   $00, $03, $01, $02

func_004_6848::
    call GetEntityDropTimer                       ; $6848: $CD $FB $0B
    jr   nz, .jr_6852                             ; $684B: $20 $05

    ld   [hl], $10                                ; $684D: $36 $10
    jp   IncrementEntityState                     ; $684F: $C3 $12 $3B

.jr_6852
    ld   a, [wLinkMotionState]                    ; $6852: $FA $1C $C1
    cp   LINK_MOTION_DEFAULT                      ; $6855: $FE $00
    jp   nz, label_004_68E4                       ; $6857: $C2 $E4 $68

    ldh  a, [hLinkSpeedX]                         ; $685A: $F0 $9A
    push af                                       ; $685C: $F5
    ldh  a, [hLinkSpeedY]                         ; $685D: $F0 $9B
    push af                                       ; $685F: $F5
    ld   e, $00                                   ; $6860: $1E $00
    ldh  a, [hActiveEntityType]                   ; $6862: $F0 $EB
    cp   ENTITY_TRACTOR_DEVICE                    ; $6864: $FE $52
    ld   a, $14                                   ; $6866: $3E $14
    jr   nz, .jr_686D                             ; $6868: $20 $03

    inc  e                                        ; $686A: $1C
    ld   a, $08                                   ; $686B: $3E $08

.jr_686D
    push de                                       ; $686D: $D5
    call GetVectorTowardsLink_trampoline          ; $686E: $CD $B5 $3B
    pop  de                                       ; $6871: $D1
    ldh  a, [hMultiPurpose0]                      ; $6872: $F0 $D7
    bit  0, e                                     ; $6874: $CB $43
    jr   z, .jr_687A                              ; $6876: $28 $02

    cpl                                           ; $6878: $2F
    inc  a                                        ; $6879: $3C

.jr_687A
    ldh  [hLinkSpeedY], a                         ; $687A: $E0 $9B
    ldh  a, [hMultiPurpose1]                      ; $687C: $F0 $D8
    bit  0, e                                     ; $687E: $CB $43
    jr   z, .jr_6884                              ; $6880: $28 $02

    cpl                                           ; $6882: $2F
    inc  a                                        ; $6883: $3C

.jr_6884
    ldh  [hLinkSpeedX], a                         ; $6884: $E0 $9A
    push bc                                       ; $6886: $C5
    call UpdateFinalLinkPosition                  ; $6887: $CD $A8 $21
    call label_3E19                               ; $688A: $CD $19 $3E
    pop  bc                                       ; $688D: $C1
    pop  af                                       ; $688E: $F1
    ldh  [hLinkSpeedY], a                         ; $688F: $E0 $9B
    pop  af                                       ; $6891: $F1
    ldh  [hLinkSpeedX], a                         ; $6892: $E0 $9A
    xor  a                                        ; $6894: $AF
    ld   [wIsLinkPushing], a                      ; $6895: $EA $44 $C1
    ldh  a, [hActiveEntityType]                   ; $6898: $F0 $EB
    cp   ENTITY_TRACTOR_DEVICE                    ; $689A: $FE $52
    jp   nz, label_004_68E4                       ; $689C: $C2 $E4 $68

    ld   a, [wIsLinkInTheAir]                     ; $689F: $FA $46 $C1
    and  a                                        ; $68A2: $A7
    jr   nz, .jr_68D4                             ; $68A3: $20 $2F

    call func_004_6E35                            ; $68A5: $CD $35 $6E
    add  $04                                      ; $68A8: $C6 $04
    cp   $08                                      ; $68AA: $FE $08
    jr   nc, .jr_68D4                             ; $68AC: $30 $26

    call func_004_6E45                            ; $68AE: $CD $45 $6E
    add  $04                                      ; $68B1: $C6 $04
    cp   $08                                      ; $68B3: $FE $08
    jr   nc, .jr_68D4                             ; $68B5: $30 $1D

    ldh  a, [hActiveEntityPosX]                   ; $68B7: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $68B9: $E0 $98
    ldh  a, [hActiveEntityVisualPosY]             ; $68BB: $F0 $EC
    ldh  [hLinkPositionY], a                      ; $68BD: $E0 $99
    ld   a, LINK_MOTION_FALLING_DOWN              ; $68BF: $3E $06
    ld   [wLinkMotionState], a                    ; $68C1: $EA $1C $C1
    call ResetSpinAttack                          ; $68C4: $CD $AF $0C
    ld   [wC198], a                               ; $68C7: $EA $98 $C1
    ld   a, $FF                                   ; $68CA: $3E $FF
    ld   [wDBCB], a                               ; $68CC: $EA $CB $DB
    ld   a, WAVE_SFX_LINK_FALL                    ; $68CF: $3E $0C
    ldh  [hWaveSfx], a                            ; $68D1: $E0 $F3
    ret                                           ; $68D3: $C9

.jr_68D4
    ldh  a, [hFrameCounter]                       ; $68D4: $F0 $E7
    rra                                           ; $68D6: $1F
    rra                                           ; $68D7: $1F
    rra                                           ; $68D8: $1F
    and  $03                                      ; $68D9: $E6 $03
    ld   e, a                                     ; $68DB: $5F
    ld   d, b                                     ; $68DC: $50
    ld   hl, Data_004_6844                        ; $68DD: $21 $44 $68
    add  hl, de                                   ; $68E0: $19
    ld   a, [hl]                                  ; $68E1: $7E
    ldh  [hLinkDirection], a                      ; $68E2: $E0 $9E

label_004_68E4:
    call func_004_690D                            ; $68E4: $CD $0D $69
    ldh  a, [hFrameCounter]                       ; $68E7: $F0 $E7
    rra                                           ; $68E9: $1F
    rra                                           ; $68EA: $1F
    rra                                           ; $68EB: $1F
    rra                                           ; $68EC: $1F
    and  $01                                      ; $68ED: $E6 $01
    call SetEntitySpriteVariant                   ; $68EF: $CD $0C $3B
    ldh  a, [hFrameCounter]                       ; $68F2: $F0 $E7
    and  $1F                                      ; $68F4: $E6 $1F
    jr   nz, .ret_68FC                            ; $68F6: $20 $04

    ld   a, NOISE_SFX_BLACK_HOLE_ACTIVE           ; $68F8: $3E $1F
    ldh  [hNoiseSfx], a                           ; $68FA: $E0 $F4

.ret_68FC
    ret                                           ; $68FC: $C9

func_004_68FD::
    call GetEntityDropTimer                       ; $68FD: $CD $FB $0B
    jr   nz, .jr_6908                             ; $6900: $20 $06

    ld   [hl], $40                                ; $6902: $36 $40
    call IncrementEntityState                     ; $6904: $CD $12 $3B
    ld   [hl], b                                  ; $6907: $70

.jr_6908
    ld   a, $00                                   ; $6908: $3E $00
    jp   SetEntitySpriteVariant                   ; $690A: $C3 $0C $3B

func_004_690D::
    ld   e, $0F                                   ; $690D: $1E $0F
    ld   d, b                                     ; $690F: $50

label_004_6910:
    push de                                       ; $6910: $D5
    ld   a, e                                     ; $6911: $7B
    cp   c                                        ; $6912: $B9
    jp   z, label_004_69A5                        ; $6913: $CA $A5 $69

    ld   hl, wEntitiesStatusTable                 ; $6916: $21 $80 $C2
    add  hl, de                                   ; $6919: $19
    ld   a, [hl]                                  ; $691A: $7E
    and  a                                        ; $691B: $A7
    jp   z, label_004_69A5                        ; $691C: $CA $A5 $69

    call CopyEntityPositionToActivePosition       ; $691F: $CD $8A $3D
    push bc                                       ; $6922: $C5
    ld   c, e                                     ; $6923: $4B
    ld   b, d                                     ; $6924: $42
    ldh  a, [hFrameCounter]                       ; $6925: $F0 $E7
    xor  c                                        ; $6927: $A9
    and  $01                                      ; $6928: $E6 $01
    jr   nz, jr_004_69A4                          ; $692A: $20 $78

    ldh  a, [hLinkPositionX]                      ; $692C: $F0 $98
    push af                                       ; $692E: $F5
    ldh  a, [hLinkPositionY]                      ; $692F: $F0 $99
    push af                                       ; $6931: $F5
    ldh  a, [hActiveEntityPosX]                   ; $6932: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $6934: $E0 $98
    ldh  a, [hActiveEntityPosY]                   ; $6936: $F0 $EF
    ldh  [hLinkPositionY], a                      ; $6938: $E0 $99
    ld   hl, wEntitiesSpeedXTable                 ; $693A: $21 $40 $C2
    add  hl, bc                                   ; $693D: $09
    ld   a, [hl]                                  ; $693E: $7E
    push af                                       ; $693F: $F5
    ld   hl, wEntitiesSpeedYTable                 ; $6940: $21 $50 $C2
    add  hl, bc                                   ; $6943: $09
    ld   a, [hl]                                  ; $6944: $7E
    push af                                       ; $6945: $F5
    ld   a, $10                                   ; $6946: $3E $10
    call GetVectorTowardsLink_trampoline          ; $6948: $CD $B5 $3B
    ld   e, $00                                   ; $694B: $1E $00
    ldh  a, [hActiveEntityType]                   ; $694D: $F0 $EB
    cp   ENTITY_TRACTOR_DEVICE                    ; $694F: $FE $52
    jr   nz, .jr_6954                             ; $6951: $20 $01

    inc  e                                        ; $6953: $1C

.jr_6954
    ldh  a, [hMultiPurpose0]                      ; $6954: $F0 $D7
    bit  0, e                                     ; $6956: $CB $43
    jr   nz, .jr_695C                             ; $6958: $20 $02

    cpl                                           ; $695A: $2F
    inc  a                                        ; $695B: $3C

.jr_695C
    ld   hl, wEntitiesSpeedYTable                 ; $695C: $21 $50 $C2
    add  hl, bc                                   ; $695F: $09
    ld   [hl], a                                  ; $6960: $77
    ldh  a, [hMultiPurpose1]                      ; $6961: $F0 $D8
    bit  0, e                                     ; $6963: $CB $43
    jr   nz, .jr_6969                             ; $6965: $20 $02

    cpl                                           ; $6967: $2F
    inc  a                                        ; $6968: $3C

.jr_6969
    ld   hl, wEntitiesSpeedXTable                 ; $6969: $21 $40 $C2
    add  hl, bc                                   ; $696C: $09
    ld   [hl], a                                  ; $696D: $77
    call CopyEntityPositionToActivePosition       ; $696E: $CD $8A $3D
    call UpdateEntityPosWithSpeed_04              ; $6971: $CD $CA $6D
    call label_3B23                               ; $6974: $CD $23 $3B
    ldh  a, [hActiveEntityPosX]                   ; $6977: $F0 $EE
    ld   hl, hLinkPositionX                       ; $6979: $21 $98 $FF
    sub  [hl]                                     ; $697C: $96
    add  $02                                      ; $697D: $C6 $02
    cp   $04                                      ; $697F: $FE $04
    jr   nc, .jr_6992                             ; $6981: $30 $0F

    ldh  a, [hActiveEntityVisualPosY]             ; $6983: $F0 $EC
    ld   hl, hLinkPositionY                       ; $6985: $21 $99 $FF
    sub  [hl]                                     ; $6988: $96
    add  $02                                      ; $6989: $C6 $02
    cp   $04                                      ; $698B: $FE $04
    jr   nc, .jr_6992                             ; $698D: $30 $03

    call ClearEntityStatusBank04                  ; $698F: $CD $7A $6D

.jr_6992
    pop  af                                       ; $6992: $F1
    ld   hl, wEntitiesSpeedYTable                 ; $6993: $21 $50 $C2
    add  hl, bc                                   ; $6996: $09
    ld   [hl], a                                  ; $6997: $77
    pop  af                                       ; $6998: $F1
    ld   hl, wEntitiesSpeedXTable                 ; $6999: $21 $40 $C2
    add  hl, bc                                   ; $699C: $09
    ld   [hl], a                                  ; $699D: $77
    pop  af                                       ; $699E: $F1
    ldh  [hLinkPositionY], a                      ; $699F: $E0 $99
    pop  af                                       ; $69A1: $F1
    ldh  [hLinkPositionX], a                      ; $69A2: $E0 $98

jr_004_69A4:
    pop  bc                                       ; $69A4: $C1

label_004_69A5:
    pop  de                                       ; $69A5: $D1
    dec  e                                        ; $69A6: $1D
    ld   a, e                                     ; $69A7: $7B
    cp   $FF                                      ; $69A8: $FE $FF
    jp   nz, label_004_6910                       ; $69AA: $C2 $10 $69

    ret                                           ; $69AD: $C9
