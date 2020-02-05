; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

include "code/entities/richard.asm"
include "code/entities/mad_bomber.asm"
include "code/entities/anti_kirby.asm"
include "code/entities/smasher.asm"
include "code/entities/three_of_a_kind.asm"
include "code/entities/stalfos_aggressive.asm"
include "code/entities/cue_ball.asm"
include "code/entities/entities_8c_8d.asm"
include "code/entities/hard_hat_beetle.asm"
include "code/entities/hinox.asm"
include "code/entities/armos_knight.asm"
include "code/entities/desert_lanmola.asm"
include "code/entities/yip_yip.asm"
include "code/entities/madam_meow_meow.asm"
include "code/entities/grandpa_ulrira.asm"
include "code/entities/crow.asm"
include "code/entities/crazy_tracy.asm"
include "code/entities/kid_71_72.asm"
include "code/entities/kid_70_73.asm"
include "code/entities/giant_goponga_flower.asm"
include "code/entities/goponga_projectile.asm"
include "code/entities/goponga_flower.asm"

;
; Entity helpers
;

func_006_641A::
    call CheckLinkCollisionWithEnemy_trampoline   ; $641A: $CD $5A $3B
    jr   nc, jr_006_643C                          ; $641D: $30 $1D

label_006_641F:
    call CopyLinkFinalPositionToPosition          ; $641F: $CD $BE $0C
    call ResetPegasusBoots                        ; $6422: $CD $B6 $0C
    ld   a, [$C1A6]                               ; $6425: $FA $A6 $C1
    and  a                                        ; $6428: $A7
    jr   z, jr_006_643C                           ; $6429: $28 $11

    ld   e, a                                     ; $642B: $5F
    ld   d, b                                     ; $642C: $50
    ld   hl, $C39F                                ; $642D: $21 $9F $C3
    add  hl, de                                   ; $6430: $19
    ld   a, [hl]                                  ; $6431: $7E
    cp   $03                                      ; $6432: $FE $03
    jr   nz, jr_006_643C                          ; $6434: $20 $06

    ld   hl, wEntitiesStatusTable + $0F                        ; $6436: $21 $8F $C2
    add  hl, de                                   ; $6439: $19
    ld   [hl], $00                                ; $643A: $36 $00

jr_006_643C:
    ret                                           ; $643C: $C9

; Array indexed by direction
Data_006_643D::
    db   $06, $04, $02, $00

; Set sprite variant for entity direction.
;
; Inputs:
;   bc   entity index
SetEntitySpriteVariantForDirection::
    ld   hl, wEntitiesDirectionTable              ; $6441: $21 $80 $C3
    add  hl, bc                                   ; $6444: $09
    ld   e, [hl]                                  ; $6445: $5E
    ld   d, b                                     ; $6446: $50
    ld   hl, Data_006_643D                        ; $6447: $21 $3D $64
    add  hl, de                                   ; $644A: $19
    push hl                                       ; $644B: $E5
    ld   hl, wEntitiesUnknowTableY                ; $644C: $21 $D0 $C3
    add  hl, bc                                   ; $644F: $09
    inc  [hl]                                     ; $6450: $34
    ld   a, [hl]                                  ; $6451: $7E
    rra                                           ; $6452: $1F
    rra                                           ; $6453: $1F
    rra                                           ; $6454: $1F
    rra                                           ; $6455: $1F
    pop  hl                                       ; $6456: $E1
    and  $01                                      ; $6457: $E6 $01
    or   [hl]                                     ; $6459: $B6
    jp   SetEntitySpriteVariant                   ; $645A: $C3 $0C $3B

; Should Link talk to Entity
func_006_645D::
    ld   e, b                                     ; $645D: $58
    ldh  a, [hActiveEntityType]                   ; $645E: $F0 $EB
    cp   ENTITY_GRANDPA_ULRIRA                    ; $6460: $FE $77
    jr   z, .jr_006_6468                          ; $6462: $28 $04

    cp   ENTITY_CRAZY_TRACY                       ; $6464: $FE $7B
    jr   nz, .jr_006_6474                          ; $6466: $20 $0C

.jr_006_6468
    ldh  a, [hLinkPositionY]                      ; $6468: $F0 $99
    ld   hl, hActiveEntityPosY                                ; $646A: $21 $EF $FF
    sub  [hl]                                     ; $646D: $96
    add  $14                                      ; $646E: $C6 $14
    cp   $2C                                      ; $6470: $FE $2C
    jr   .label_006_647E                          ; $6472: $18 $0A

.jr_006_6474
    ldh  a, [hLinkPositionY]                      ; $6474: $F0 $99
    ld   hl, hActiveEntityPosY                                ; $6476: $21 $EF $FF
    sub  [hl]                                     ; $6479: $96
    add  $14                                      ; $647A: $C6 $14
    cp   $28                                      ; $647C: $FE $28

.label_006_647E
    jr   nc, .return                              ; $647E: $30 $44

    ldh  a, [hLinkPositionX]                      ; $6480: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $6482: $21 $EE $FF
    sub  [hl]                                     ; $6485: $96
    add  $10                                      ; $6486: $C6 $10
    cp   $20                                      ; $6488: $FE $20
    jr   nc, .return                              ; $648A: $30 $38

    inc  e                                        ; $648C: $1C
    ldh  a, [hActiveEntityType]                   ; $648D: $F0 $EB
    cp   ENTITY_YIP_YIP                           ; $648F: $FE $78
    jr   z, .jr_006_649F                          ; $6491: $28 $0C

    push de                                       ; $6493: $D5
    call func_006_65B4                            ; $6494: $CD $B4 $65
    ldh  a, [hLinkDirection]                      ; $6497: $F0 $9E
    xor  $01                                      ; $6499: $EE $01
    cp   e                                        ; $649B: $BB
    pop  de                                       ; $649C: $D1
    jr   nz, .return                              ; $649D: $20 $25

.jr_006_649F
    ld   hl, $C1AD                                ; $649F: $21 $AD $C1
    ld   [hl], $01                                ; $64A2: $36 $01
    ld   a, [wDialogState]                        ; $64A4: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $64A7: $21 $4F $C1
    or   [hl]                                     ; $64AA: $B6
    ld   hl, $C146                                ; $64AB: $21 $46 $C1
    or   [hl]                                     ; $64AE: $B6
    ld   hl, $C134                                ; $64AF: $21 $34 $C1
    or   [hl]                                     ; $64B2: $B6
    jr   nz, .return                              ; $64B3: $20 $0F

    ld   a, [wWindowY]                            ; $64B5: $FA $9A $DB
    cp   $80                                      ; $64B8: $FE $80
    jr   nz, .return                              ; $64BA: $20 $08

    ldh  a, [hJoypadState]                        ; $64BC: $F0 $CC
    and  $10                                      ; $64BE: $E6 $10
    jr   z, .return                               ; $64C0: $28 $02

    scf                                           ; $64C2: $37
    ret                                           ; $64C3: $C9

.return
    and  a                                        ; $64C4: $A7
    ret                                           ; $64C5: $C9

func_006_64C6::
    ldh  a, [hActiveEntityStatus]                 ; $64C6: $F0 $EA
    cp   $05                                      ; $64C8: $FE $05
    jr   nz, jr_006_64F5                          ; $64CA: $20 $29

func_006_64CC::
    ld   a, [wGameplayType]                       ; $64CC: $FA $95 $DB
    cp   $07                                      ; $64CF: $FE $07
    jr   z, jr_006_64F5                           ; $64D1: $28 $22

    cp   $01                                      ; $64D3: $FE $01
    jr   z, jr_006_64E2                           ; $64D5: $28 $0B

    cp   $0B                                      ; $64D7: $FE $0B
    jr   nz, jr_006_64F5                          ; $64D9: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $64DB: $FA $6B $C1
    cp   $04                                      ; $64DE: $FE $04
    jr   nz, jr_006_64F5                          ; $64E0: $20 $13

jr_006_64E2:
    ld   hl, $C1A8                                ; $64E2: $21 $A8 $C1
    ld   a, [wDialogState]                        ; $64E5: $FA $9F $C1
    or   [hl]                                     ; $64E8: $B6
    ld   hl, wInventoryAppearing                  ; $64E9: $21 $4F $C1
    or   [hl]                                     ; $64EC: $B6
    jr   nz, jr_006_64F5                          ; $64ED: $20 $06

    ld   a, [wRoomTransitionState]                ; $64EF: $FA $24 $C1
    and  a                                        ; $64F2: $A7
    jr   z, jr_006_64F6                           ; $64F3: $28 $01

jr_006_64F5:
    pop  af                                       ; $64F5: $F1

jr_006_64F6:
    ret                                           ; $64F6: $C9

func_006_64F7::
    ld   hl, wEntitiesUnknowTableT                ; $64F7: $21 $10 $C4
    add  hl, bc                                   ; $64FA: $09
    ld   a, [hl]                                  ; $64FB: $7E
    and  a                                        ; $64FC: $A7
    jr   z, jr_006_6540                           ; $64FD: $28 $41

    dec  a                                        ; $64FF: $3D
    ld   [hl], a                                  ; $6500: $77
    call label_3E8E                               ; $6501: $CD $8E $3E
    ld   hl, wEntitiesSpeedXTable                 ; $6504: $21 $40 $C2
    add  hl, bc                                   ; $6507: $09
    ld   a, [hl]                                  ; $6508: $7E
    push af                                       ; $6509: $F5
    ld   hl, wEntitiesSpeedYTable                 ; $650A: $21 $50 $C2
    add  hl, bc                                   ; $650D: $09
    ld   a, [hl]                                  ; $650E: $7E
    push af                                       ; $650F: $F5
    ld   hl, $C3F0                                ; $6510: $21 $F0 $C3
    add  hl, bc                                   ; $6513: $09
    ld   a, [hl]                                  ; $6514: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $6515: $21 $40 $C2
    add  hl, bc                                   ; $6518: $09
    ld   [hl], a                                  ; $6519: $77
    ld   hl, wEntitiesUnknowTableS                ; $651A: $21 $00 $C4
    add  hl, bc                                   ; $651D: $09
    ld   a, [hl]                                  ; $651E: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $651F: $21 $50 $C2
    add  hl, bc                                   ; $6522: $09
    ld   [hl], a                                  ; $6523: $77
    call func_006_6541                            ; $6524: $CD $41 $65
    ld   hl, wEntitiesUnknowTableH                ; $6527: $21 $30 $C4
    add  hl, bc                                   ; $652A: $09
    ld   a, [hl]                                  ; $652B: $7E
    and  $20                                      ; $652C: $E6 $20
    jr   nz, jr_006_6533                          ; $652E: $20 $03

    call label_3B23                               ; $6530: $CD $23 $3B

jr_006_6533:
    ld   hl, wEntitiesSpeedYTable                 ; $6533: $21 $50 $C2
    add  hl, bc                                   ; $6536: $09
    pop  af                                       ; $6537: $F1
    ld   [hl], a                                  ; $6538: $77
    ld   hl, wEntitiesSpeedXTable                 ; $6539: $21 $40 $C2
    add  hl, bc                                   ; $653C: $09
    pop  af                                       ; $653D: $F1
    ld   [hl], a                                  ; $653E: $77
    pop  af                                       ; $653F: $F1

jr_006_6540:
    ret                                           ; $6540: $C9

func_006_6541::
    call func_006_654E                            ; $6541: $CD $4E $65
    push bc                                       ; $6544: $C5
    ld   a, c                                     ; $6545: $79
    add  $10                                      ; $6546: $C6 $10
    ld   c, a                                     ; $6548: $4F
    call func_006_654E                            ; $6549: $CD $4E $65
    pop  bc                                       ; $654C: $C1
    ret                                           ; $654D: $C9

func_006_654E::
    ld   hl, wEntitiesSpeedXTable                 ; $654E: $21 $40 $C2
    add  hl, bc                                   ; $6551: $09
    ld   a, [hl]                                  ; $6552: $7E
    and  a                                        ; $6553: $A7
    jr   z, jr_006_6579                           ; $6554: $28 $23

    push af                                       ; $6556: $F5
    swap a                                        ; $6557: $CB $37
    and  $F0                                      ; $6559: $E6 $F0
    ld   hl, wEntitiesUnknowTableN                ; $655B: $21 $60 $C2
    add  hl, bc                                   ; $655E: $09
    add  [hl]                                     ; $655F: $86
    ld   [hl], a                                  ; $6560: $77
    rl   d                                        ; $6561: $CB $12
    ld   hl, wEntitiesPosXTable                   ; $6563: $21 $00 $C2

jr_006_6566:
    add  hl, bc                                   ; $6566: $09
    pop  af                                       ; $6567: $F1
    ld   e, $00                                   ; $6568: $1E $00
    bit  7, a                                     ; $656A: $CB $7F
    jr   z, jr_006_6570                           ; $656C: $28 $02

    ld   e, $F0                                   ; $656E: $1E $F0

jr_006_6570:
    swap a                                        ; $6570: $CB $37
    and  $0F                                      ; $6572: $E6 $0F
    or   e                                        ; $6574: $B3
    rr   d                                        ; $6575: $CB $1A
    adc  [hl]                                     ; $6577: $8E
    ld   [hl], a                                  ; $6578: $77

jr_006_6579:
    ret                                           ; $6579: $C9

func_006_657A::
    ld   hl, wEntitiesSpeedZTable                 ; $657A: $21 $20 $C3
    add  hl, bc                                   ; $657D: $09
    ld   a, [hl]                                  ; $657E: $7E
    and  a                                        ; $657F: $A7
    jr   z, jr_006_6579                           ; $6580: $28 $F7

    push af                                       ; $6582: $F5
    swap a                                        ; $6583: $CB $37
    and  $F0                                      ; $6585: $E6 $F0
    ld   hl, wEntitiesUnknowTableK                ; $6587: $21 $30 $C3
    add  hl, bc                                   ; $658A: $09
    add  [hl]                                     ; $658B: $86
    ld   [hl], a                                  ; $658C: $77
    rl   d                                        ; $658D: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $658F: $21 $10 $C3
    jr   jr_006_6566                              ; $6592: $18 $D2

func_006_6594::
    ld   e, $00                                   ; $6594: $1E $00
    ldh  a, [hLinkPositionX]                      ; $6596: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $6598: $21 $00 $C2
    add  hl, bc                                   ; $659B: $09
    sub  [hl]                                     ; $659C: $96
    bit  7, a                                     ; $659D: $CB $7F
    jr   z, jr_006_65A2                           ; $659F: $28 $01

    inc  e                                        ; $65A1: $1C

jr_006_65A2:
    ld   d, a                                     ; $65A2: $57
    ret                                           ; $65A3: $C9

func_006_65A4::
    ld   e, $02                                   ; $65A4: $1E $02
    ldh  a, [hLinkPositionY]                      ; $65A6: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $65A8: $21 $10 $C2
    add  hl, bc                                   ; $65AB: $09
    sub  [hl]                                     ; $65AC: $96
    bit  7, a                                     ; $65AD: $CB $7F
    jr   nz, jr_006_65B2                          ; $65AF: $20 $01

    inc  e                                        ; $65B1: $1C

jr_006_65B2:
    ld   d, a                                     ; $65B2: $57
    ret                                           ; $65B3: $C9

func_006_65B4::
    call func_006_6594                            ; $65B4: $CD $94 $65
    ld   a, e                                     ; $65B7: $7B
    ldh  [hScratch0], a                           ; $65B8: $E0 $D7
    ld   a, d                                     ; $65BA: $7A
    bit  7, a                                     ; $65BB: $CB $7F
    jr   z, jr_006_65C1                           ; $65BD: $28 $02

    cpl                                           ; $65BF: $2F
    inc  a                                        ; $65C0: $3C

jr_006_65C1:
    push af                                       ; $65C1: $F5
    call func_006_65A4                            ; $65C2: $CD $A4 $65
    ld   a, e                                     ; $65C5: $7B
    ldh  [hScratch1], a                           ; $65C6: $E0 $D8
    ld   a, d                                     ; $65C8: $7A
    bit  7, a                                     ; $65C9: $CB $7F
    jr   z, jr_006_65CF                           ; $65CB: $28 $02

    cpl                                           ; $65CD: $2F
    inc  a                                        ; $65CE: $3C

jr_006_65CF:
    pop  de                                       ; $65CF: $D1
    cp   d                                        ; $65D0: $BA
    jr   nc, jr_006_65D7                          ; $65D1: $30 $04

    ldh  a, [hScratch0]                           ; $65D3: $F0 $D7
    jr   jr_006_65D9                              ; $65D5: $18 $02

jr_006_65D7:
    ldh  a, [hScratch1]                           ; $65D7: $F0 $D8

jr_006_65D9:
    ld   e, a                                     ; $65D9: $5F
    ret                                           ; $65DA: $C9

func_006_65DB::
    ld   hl, wEntitiesStatusTable                 ; $65DB: $21 $80 $C2
    add  hl, bc                                   ; $65DE: $09
    ld   [hl], b                                  ; $65DF: $70
    ret                                           ; $65E0: $C9

Data_006_65E1::
    db   $6A, $23, $68, $23, $68, $03, $6A, $03, $6C, $43, $6C, $63, $6C, $03, $6C, $23

WizrobeProjectileEntityHandler::
    ldh  a, [hFrameCounter]                       ; $65F1: $F0 $E7
    rla                                           ; $65F3: $17
    rla                                           ; $65F4: $17
    and  $10                                      ; $65F5: $E6 $10
    ldh  [$FFED], a                               ; $65F7: $E0 $ED
    ld   de, Data_006_65E1                        ; $65F9: $11 $E1 $65
    call RenderAnimatedActiveEntity               ; $65FC: $CD $C0 $3B
    call func_006_64C6                            ; $65FF: $CD $C6 $64
    call CheckLinkCollisionWithProjectile_trampoline; $6602: $CD $4F $3B
    call func_006_6541                            ; $6605: $CD $41 $65
    call label_3B2E                               ; $6608: $CD $2E $3B
    ld   hl, wEntitiesCollisionsTable             ; $660B: $21 $A0 $C2
    add  hl, bc                                   ; $660E: $09
    ld   a, [hl]                                  ; $660F: $7E
    and  a                                        ; $6610: $A7
    ret  z                                        ; $6611: $C8

    jp   func_006_65DB                            ; $6612: $C3 $DB $65

Data_006_6615::
    db   $5C, $00, $5C, $20, $5C, $14, $5C, $34

Data_006_661D::
    db   $00, $10, $00, $F0, $00, $F0, $00, $10

Data_006_6625::
    db   $10, $00, $F0, $00, $10, $00, $F0, $00

Data_006_662D::
    db   $01, $08, $02, $04, $01, $04, $02, $08

SparkClockwiseEntityHandler::
SparkCounterClockwiseEntityHandler::
    ld   a, $01                                   ; $6635: $3E $01
    ldh  [$FFBE], a                               ; $6637: $E0 $BE
    ldh  a, [hFrameCounter]                       ; $6639: $F0 $E7
    rra                                           ; $663B: $1F
    and  $01                                      ; $663C: $E6 $01
    ldh  [hActiveEntitySpriteVariant], a          ; $663E: $E0 $F1
    ld   de, Data_006_6615                        ; $6640: $11 $15 $66
    call RenderAnimatedActiveEntity               ; $6643: $CD $C0 $3B
    call func_006_64C6                            ; $6646: $CD $C6 $64
    call func_006_64F7                            ; $6649: $CD $F7 $64
    call label_3B44                               ; $664C: $CD $44 $3B
    call func_006_6541                            ; $664F: $CD $41 $65
    call func_006_66CC                            ; $6652: $CD $CC $66
    ld   hl, wEntitiesPrivateState1Table          ; $6655: $21 $B0 $C2
    add  hl, bc                                   ; $6658: $09
    ld   a, [hl]                                  ; $6659: $7E
    ld   e, a                                     ; $665A: $5F
    ld   d, b                                     ; $665B: $50
    ld   hl, wEntitiesPrivateState2Table          ; $665C: $21 $C0 $C2
    add  hl, bc                                   ; $665F: $09
    add  [hl]                                     ; $6660: $86
    ld   e, a                                     ; $6661: $5F
    ld   hl, Data_006_662D                        ; $6662: $21 $2D $66
    add  hl, de                                   ; $6665: $19
    push hl                                       ; $6666: $E5
    ld   hl, wEntitiesCollisionsTable             ; $6667: $21 $A0 $C2
    add  hl, bc                                   ; $666A: $09
    ld   a, [hl]                                  ; $666B: $7E
    pop  hl                                       ; $666C: $E1
    and  [hl]                                     ; $666D: $A6
    jr   nz, jr_006_6685                          ; $666E: $20 $15

    call GetEntityTransitionCountdown             ; $6670: $CD $05 $0C
    jr   nz, jr_006_6690                          ; $6673: $20 $1B

    ld   hl, wEntitiesCollisionsTable             ; $6675: $21 $A0 $C2
    add  hl, bc                                   ; $6678: $09
    ld   a, [hl]                                  ; $6679: $7E
    and  $0F                                      ; $667A: $E6 $0F
    jr   nz, jr_006_669D                          ; $667C: $20 $1F

    call GetEntityTransitionCountdown             ; $667E: $CD $05 $0C
    ld   [hl], $09                                ; $6681: $36 $09
    jr   jr_006_669D                              ; $6683: $18 $18

jr_006_6685:
    ld   hl, wEntitiesPrivateState1Table          ; $6685: $21 $B0 $C2
    add  hl, bc                                   ; $6688: $09
    inc  [hl]                                     ; $6689: $34
    ld   a, [hl]                                  ; $668A: $7E
    and  $03                                      ; $668B: $E6 $03
    ld   [hl], a                                  ; $668D: $77
    jr   jr_006_669D                              ; $668E: $18 $0D

jr_006_6690:
    cp   $06                                      ; $6690: $FE $06
    jr   nz, jr_006_669D                          ; $6692: $20 $09

    ld   hl, wEntitiesPrivateState1Table          ; $6694: $21 $B0 $C2
    add  hl, bc                                   ; $6697: $09
    dec  [hl]                                     ; $6698: $35
    ld   a, [hl]                                  ; $6699: $7E
    and  $03                                      ; $669A: $E6 $03
    ld   [hl], a                                  ; $669C: $77

jr_006_669D:
    ld   hl, wEntitiesPrivateState1Table          ; $669D: $21 $B0 $C2
    add  hl, bc                                   ; $66A0: $09
    ld   a, [hl]                                  ; $66A1: $7E
    ld   e, a                                     ; $66A2: $5F
    ld   d, b                                     ; $66A3: $50
    ld   hl, wEntitiesPrivateState2Table          ; $66A4: $21 $C0 $C2
    add  hl, bc                                   ; $66A7: $09
    add  [hl]                                     ; $66A8: $86
    ld   e, a                                     ; $66A9: $5F
    ld   hl, Data_006_661D                        ; $66AA: $21 $1D $66
    add  hl, de                                   ; $66AD: $19
    ld   a, [hl]                                  ; $66AE: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $66AF: $21 $50 $C2
    add  hl, bc                                   ; $66B2: $09
    ld   [hl], a                                  ; $66B3: $77
    ld   hl, wEntitiesPrivateState1Table          ; $66B4: $21 $B0 $C2
    add  hl, bc                                   ; $66B7: $09
    ld   a, [hl]                                  ; $66B8: $7E
    ld   e, a                                     ; $66B9: $5F
    ld   d, b                                     ; $66BA: $50
    ld   hl, wEntitiesPrivateState2Table          ; $66BB: $21 $C0 $C2
    add  hl, bc                                   ; $66BE: $09
    add  [hl]                                     ; $66BF: $86
    ld   e, a                                     ; $66C0: $5F
    ld   hl, Data_006_6625                        ; $66C1: $21 $25 $66
    add  hl, de                                   ; $66C4: $19
    ld   a, [hl]                                  ; $66C5: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $66C6: $21 $40 $C2
    add  hl, bc                                   ; $66C9: $09
    ld   [hl], a                                  ; $66CA: $77
    ret                                           ; $66CB: $C9

func_006_66CC::
    ld   hl, wEntitiesSpeedXTable                 ; $66CC: $21 $40 $C2
    add  hl, bc                                   ; $66CF: $09
    ld   a, [hl]                                  ; $66D0: $7E
    push af                                       ; $66D1: $F5
    ld   [hl], $01                                ; $66D2: $36 $01
    ld   hl, wEntitiesSpeedYTable                 ; $66D4: $21 $50 $C2
    add  hl, bc                                   ; $66D7: $09
    ld   a, [hl]                                  ; $66D8: $7E
    push af                                       ; $66D9: $F5
    ld   [hl], $01                                ; $66DA: $36 $01
    call label_3B23                               ; $66DC: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $66DF: $21 $A0 $C2
    add  hl, bc                                   ; $66E2: $09
    ld   a, [hl]                                  ; $66E3: $7E
    push af                                       ; $66E4: $F5
    ld   hl, wEntitiesSpeedXTable                 ; $66E5: $21 $40 $C2
    add  hl, bc                                   ; $66E8: $09
    ld   [hl], $FF                                ; $66E9: $36 $FF
    ld   hl, wEntitiesSpeedYTable                 ; $66EB: $21 $50 $C2
    add  hl, bc                                   ; $66EE: $09
    ld   [hl], $FF                                ; $66EF: $36 $FF
    call label_3B23                               ; $66F1: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $66F4: $21 $A0 $C2
    add  hl, bc                                   ; $66F7: $09
    pop  af                                       ; $66F8: $F1
    or   [hl]                                     ; $66F9: $B6
    ld   [hl], a                                  ; $66FA: $77
    pop  af                                       ; $66FB: $F1
    ld   hl, wEntitiesSpeedYTable                 ; $66FC: $21 $50 $C2
    add  hl, bc                                   ; $66FF: $09
    ld   [hl], a                                  ; $6700: $77
    pop  af                                       ; $6701: $F1
    ld   hl, wEntitiesSpeedXTable                 ; $6702: $21 $40 $C2
    add  hl, bc                                   ; $6705: $09
    ld   [hl], a                                  ; $6706: $77
    ret                                           ; $6707: $C9

Data_006_6708::
    db   $42, $00, $42, $20, $40, $00, $40, $20   ; $6708

Data_006_6710::
    db   $62, $00, $62, $20, $60, $00, $60, $20

Data_006_6718::
    db   $00, $05, $0A, $0D

Data_006_671C::
    db   $0E, $0D, $0A, $05, $00, $FB, $F6, $F3, $F2, $F3, $F6, $FB, $00, $05, $0A, $0D

Data_006_672C::
    db   $0C, $04, $08, $00

KeeseEntityHandler::
    ld   de, Data_006_6708                        ; $6730: $11 $08 $67
    ldh  a, [hMapId]                              ; $6733: $F0 $F7
    cp   $0A                                      ; $6735: $FE $0A
    jr   nz, jr_006_673C                          ; $6737: $20 $03

    ld   de, Data_006_6710                        ; $6739: $11 $10 $67

jr_006_673C:
    call RenderAnimatedActiveEntity               ; $673C: $CD $C0 $3B
    call func_006_64C6                            ; $673F: $CD $C6 $64
    call func_006_64F7                            ; $6742: $CD $F7 $64
    call label_3B39                               ; $6745: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $6748: $F0 $F0
    JP_TABLE                                      ; $674A
._00 dw KeeseRestingHandler
._01 dw KeeseFlyingHandler

KeeseRestingHandler::
    call GetEntityTransitionCountdown             ; $674F: $CD $05 $0C
    jp   nz, label_006_67E6                       ; $6752: $C2 $E6 $67

    call func_006_6594                            ; $6755: $CD $94 $65
    add  $20                                      ; $6758: $C6 $20
    cp   $40                                      ; $675A: $FE $40
    jp   nc, label_006_67E6                       ; $675C: $D2 $E6 $67

    call func_006_65A4                            ; $675F: $CD $A4 $65
    add  $20                                      ; $6762: $C6 $20
    cp   $40                                      ; $6764: $FE $40
    jp   nc, label_006_67E6                       ; $6766: $D2 $E6 $67

    call func_006_65B4                            ; $6769: $CD $B4 $65
    ld   d, $00                                   ; $676C: $16 $00
    ld   hl, Data_006_672C                        ; $676E: $21 $2C $67
    add  hl, de                                   ; $6771: $19
    ld   a, [hl]                                  ; $6772: $7E

jr_006_6773:
    ld   hl, wEntitiesPrivateState1Table          ; $6773: $21 $B0 $C2
    add  hl, bc                                   ; $6776: $09
    ld   [hl], a                                  ; $6777: $77
    call GetEntityTransitionCountdown             ; $6778: $CD $05 $0C
    call GetRandomByte                            ; $677B: $CD $0D $28
    and  $3F                                      ; $677E: $E6 $3F
    add  $50                                      ; $6780: $C6 $50
    ld   [hl], a                                  ; $6782: $77
    ld   hl, wEntitiesPrivateState2Table          ; $6783: $21 $C0 $C2
    add  hl, bc                                   ; $6786: $09
    ld   [hl], $01                                ; $6787: $36 $01
    call IncrementEntityState                     ; $6789: $CD $12 $3B
    jp   label_006_67E6                           ; $678C: $C3 $E6 $67

KeeseFlyingHandler::
    call func_006_6541                            ; $678F: $CD $41 $65
    call label_3B23                               ; $6792: $CD $23 $3B
    call GetEntityTransitionCountdown             ; $6795: $CD $05 $0C
    jr   nz, jr_006_67A2                          ; $6798: $20 $08

    ld   [hl], $20                                ; $679A: $36 $20
    call IncrementEntityState                     ; $679C: $CD $12 $3B
    ld   [hl], b                                  ; $679F: $70
    jr   label_006_67E6                           ; $67A0: $18 $44

jr_006_67A2:
    ld   hl, wEntitiesUnknownTableD               ; $67A2: $21 $D0 $C2
    add  hl, bc                                   ; $67A5: $09
    inc  [hl]                                     ; $67A6: $34
    ld   a, [hl]                                  ; $67A7: $7E
    cp   $0A                                      ; $67A8: $FE $0A
    jr   c, label_006_67E6                        ; $67AA: $38 $3A

    ld   [hl], b                                  ; $67AC: $70
    ld   hl, wEntitiesPrivateState2Table          ; $67AD: $21 $C0 $C2
    add  hl, bc                                   ; $67B0: $09
    ld   a, [hl]                                  ; $67B1: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $67B2: $21 $B0 $C2
    add  hl, bc                                   ; $67B5: $09
    add  [hl]                                     ; $67B6: $86
    and  $0F                                      ; $67B7: $E6 $0F
    ld   [hl], a                                  ; $67B9: $77
    ld   hl, wEntitiesPrivateState1Table          ; $67BA: $21 $B0 $C2
    add  hl, bc                                   ; $67BD: $09
    ld   e, [hl]                                  ; $67BE: $5E
    ld   d, b                                     ; $67BF: $50
    ld   hl, Data_006_6718                        ; $67C0: $21 $18 $67
    add  hl, de                                   ; $67C3: $19
    ld   a, [hl]                                  ; $67C4: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $67C5: $21 $50 $C2
    add  hl, bc                                   ; $67C8: $09
    ld   [hl], a                                  ; $67C9: $77
    ld   hl, Data_006_671C                        ; $67CA: $21 $1C $67
    add  hl, de                                   ; $67CD: $19
    ld   a, [hl]                                  ; $67CE: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $67CF: $21 $40 $C2
    add  hl, bc                                   ; $67D2: $09
    ld   [hl], a                                  ; $67D3: $77
    call GetRandomByte                            ; $67D4: $CD $0D $28
    and  $1F                                      ; $67D7: $E6 $1F
    jr   nz, label_006_67E6                       ; $67D9: $20 $0B

    call GetRandomByte                            ; $67DB: $CD $0D $28
    and  $02                                      ; $67DE: $E6 $02
    dec  a                                        ; $67E0: $3D
    ld   hl, wEntitiesPrivateState2Table          ; $67E1: $21 $C0 $C2
    add  hl, bc                                   ; $67E4: $09
    ld   [hl], a                                  ; $67E5: $77

label_006_67E6:
    ldh  a, [hActiveEntityState]                  ; $67E6: $F0 $F0
    and  a                                        ; $67E8: $A7
    jr   z, jr_006_67F2                           ; $67E9: $28 $07

    ldh  a, [hFrameCounter]                       ; $67EB: $F0 $E7
    rra                                           ; $67ED: $1F
    rra                                           ; $67EE: $1F
    rra                                           ; $67EF: $1F
    and  $01                                      ; $67F0: $E6 $01

jr_006_67F2:
    jp   SetEntitySpriteVariant                   ; $67F2: $C3 $0C $3B

OwlEventEntityHandler::
    ld   a, c                                     ; $67F5: $79
    ld   [$C501], a                               ; $67F6: $EA $01 $C5
    ldh  a, [hMapRoom]                            ; $67F9: $F0 $F6
    cp   $64                                      ; $67FB: $FE $64
    jr   nz, jr_006_680D                          ; $67FD: $20 $0E

    ld   a, [$D9E3]                               ; $67FF: $FA $E3 $D9
    and  $40                                      ; $6802: $E6 $40
    ret  z                                        ; $6804: $C8

    ld   a, [wHasInstrument5]                     ; $6805: $FA $69 $DB
    and  $02                                      ; $6808: $E6 $02
    jp   nz, func_006_65DB                        ; $680A: $C2 $DB $65

jr_006_680D:
    ldh  a, [hMapRoom]                            ; $680D: $F0 $F6
    cp   $AC                                      ; $680F: $FE $AC
    jr   nz, jr_006_681A                          ; $6811: $20 $07

    ldh  a, [hRoomStatus]                         ; $6813: $F0 $F8
    and  $10                                      ; $6815: $E6 $10
    jp   z, func_006_65DB                         ; $6817: $CA $DB $65

jr_006_681A:
    ldh  a, [hMapRoom]                            ; $681A: $F0 $F6
    cp   $41                                      ; $681C: $FE $41
    jr   nz, jr_006_6829                          ; $681E: $20 $09

    ld   a, [wHasTailKey]                         ; $6820: $FA $11 $DB
    and  a                                        ; $6823: $A7
    ret  z                                        ; $6824: $C8

    call IsEntityUnknownFZero                     ; $6825: $CD $00 $0C
    ret  nz                                       ; $6828: $C0

jr_006_6829:
    ldh  a, [hMapRoom]                            ; $6829: $F0 $F6
    cp   $EE                                      ; $682B: $FE $EE
    jr   nz, jr_006_6835                          ; $682D: $20 $06

    ld   a, [wHasAnglerKey]                       ; $682F: $FA $12 $DB
    and  a                                        ; $6832: $A7
    jr   jr_006_689D                              ; $6833: $18 $68

jr_006_6835:
    ldh  a, [hMapRoom]                            ; $6835: $F0 $F6
    cp   $D2                                      ; $6837: $FE $D2
    jr   z, jr_006_684E                           ; $6839: $28 $13

    cp   $36                                      ; $683B: $FE $36
    jr   nz, jr_006_6853                          ; $683D: $20 $14

    ld   a, [wHasInstrument2]                     ; $683F: $FA $66 $DB
    and  a                                        ; $6842: $A7
    jp   nz, func_006_65DB                        ; $6843: $C2 $DB $65

    ld   a, [wIsBowWowFollowingLink]              ; $6846: $FA $56 $DB
    cp   $01                                      ; $6849: $FE $01
    jp   nz, func_006_65DB                        ; $684B: $C2 $DB $65

jr_006_684E:
    ld   a, [wHasInstrument1]                     ; $684E: $FA $65 $DB
    jr   jr_006_689B                              ; $6851: $18 $48

jr_006_6853:
    ldh  a, [hMapRoom]                            ; $6853: $F0 $F6
    cp   $08                                      ; $6855: $FE $08
    jr   nz, jr_006_6869                          ; $6857: $20 $10

    ld   a, [wHasInstrument8]                     ; $6859: $FA $6C $DB
    and  $02                                      ; $685C: $E6 $02
    jp   nz, func_006_65DB                        ; $685E: $C2 $DB $65

    ld   a, [$D808]                               ; $6861: $FA $08 $D8
    and  $10                                      ; $6864: $E6 $10
    ret  z                                        ; $6866: $C8

    jr   jr_006_68A0                              ; $6867: $18 $37

jr_006_6869:
    cp   $9D                                      ; $6869: $FE $9D
    jr   nz, jr_006_6872                          ; $686B: $20 $05

    ld   a, [wHasInstrument5]                     ; $686D: $FA $69 $DB
    jr   jr_006_689B                              ; $6870: $18 $29

jr_006_6872:
    cp   $06                                      ; $6872: $FE $06
    jr   nz, jr_006_687E                          ; $6874: $20 $08

    ld   a, [$D806]                               ; $6876: $FA $06 $D8
    and  $10                                      ; $6879: $E6 $10
    ret  z                                        ; $687B: $C8

    jr   jr_006_68A0                              ; $687C: $18 $22

jr_006_687E:
    cp   $B6                                      ; $687E: $FE $B6
    jr   nz, jr_006_6887                          ; $6880: $20 $05

    ld   a, [wHasInstrument3]                     ; $6882: $FA $67 $DB
    jr   jr_006_689B                              ; $6885: $18 $14

jr_006_6887:
    cp   $17                                      ; $6887: $FE $17
    jr   z, jr_006_688F                           ; $6889: $28 $04

    cp   $9C                                      ; $688B: $FE $9C
    jr   nz, jr_006_6894                          ; $688D: $20 $05

jr_006_688F:
    ld   a, [wHasInstrument6]                     ; $688F: $FA $6A $DB
    jr   jr_006_689B                              ; $6892: $18 $07

jr_006_6894:
    cp   $16                                      ; $6894: $FE $16
    jr   nz, jr_006_68A0                          ; $6896: $20 $08

    ld   a, [wHasInstrument2]                     ; $6898: $FA $66 $DB

jr_006_689B:
    and  $02                                      ; $689B: $E6 $02

jr_006_689D:
    jp   z, func_006_65DB                         ; $689D: $CA $DB $65

jr_006_68A0:
    ldh  a, [hMapRoom]                            ; $68A0: $F0 $F6
    cp   $D2                                      ; $68A2: $FE $D2
    jr   z, jr_006_68B4                           ; $68A4: $28 $0E

    cp   $16                                      ; $68A6: $FE $16
    jr   z, jr_006_68B4                           ; $68A8: $28 $0A

    cp   $36                                      ; $68AA: $FE $36
    jr   z, jr_006_68B4                           ; $68AC: $28 $06

    ldh  a, [hActiveEntityState]                  ; $68AE: $F0 $F0
    cp   $00                                      ; $68B0: $FE $00
    jr   z, jr_006_68B7                           ; $68B2: $28 $03

jr_006_68B4:
    call func_006_6A4F                            ; $68B4: $CD $4F $6A

jr_006_68B7:
    ldh  a, [hFrameCounter]                       ; $68B7: $F0 $E7
    and  $B0                                      ; $68B9: $E6 $B0
    ld   a, $00                                   ; $68BB: $3E $00
    jr   nz, jr_006_68C0                          ; $68BD: $20 $01

    inc  a                                        ; $68BF: $3C

jr_006_68C0:
    call SetEntitySpriteVariant                   ; $68C0: $CD $0C $3B
    ld   a, [wRoomTransitionState]                ; $68C3: $FA $24 $C1
    and  a                                        ; $68C6: $A7
    ret  nz                                       ; $68C7: $C0

    ldh  a, [hActiveEntityState]                  ; $68C8: $F0 $F0
    JP_TABLE                                      ; $68CA
._00 dw OwlState0Handler
._01 dw OwlState1Handler
._02 dw OwlState2Handler
._03 dw OwlState3Handler
._04 dw OwlState4Handler

OwlState0Handler::
    ldh  a, [hMapRoom]
    cp   $F2
    jr   nz, jr_006_68EF                          ; $68D9: $20 $14

    ld   a, $1D                                   ; $68DB: $3E $1D
    ldh  [hMusicTrack], a                         ; $68DD: $E0 $B0
    ldh  a, [hLinkPositionY]                      ; $68DF: $F0 $99
    cp   $44                                      ; $68E1: $FE $44
    ret  c                                        ; $68E3: $D8

    ldh  a, [hLinkPositionX]                      ; $68E4: $F0 $98
    sub  $58                                      ; $68E6: $D6 $58
    add  $18                                      ; $68E8: $C6 $18
    cp   $30                                      ; $68EA: $FE $30
    ret  nc                                       ; $68EC: $D0

    jr   jr_006_68F6                              ; $68ED: $18 $07

jr_006_68EF:
    ld   a, [wSwordLevel]                         ; $68EF: $FA $4E $DB
    and  a                                        ; $68F2: $A7
    jp   z, func_006_65DB                         ; $68F3: $CA $DB $65

jr_006_68F6:
    ldh  a, [hMusicTrack]                         ; $68F6: $F0 $B0
    ld   hl, wEntitiesPrivateState1Table          ; $68F8: $21 $B0 $C2
    add  hl, bc                                   ; $68FB: $09
    ld   [hl], a                                  ; $68FC: $77
    ld   a, $22                                   ; $68FD: $3E $22
    ld   [wActiveMusicTrack], a                   ; $68FF: $EA $68 $D3
    ldh  [hMusicTrack], a                         ; $6902: $E0 $B0
    ldh  [$FFBD], a                               ; $6904: $E0 $BD
    ldh  a, [hMapRoom]                            ; $6906: $F0 $F6
    cp   $16                                      ; $6908: $FE $16
    jr   z, jr_006_6914                           ; $690A: $28 $08

    cp   $36                                      ; $690C: $FE $36
    jr   z, jr_006_6914                           ; $690E: $28 $04

    cp   $D2                                      ; $6910: $FE $D2
    jr   nz, jr_006_691A                          ; $6912: $20 $06

jr_006_6914:
    call IncrementEntityState                     ; $6914: $CD $12 $3B
    ld   [hl], $02                                ; $6917: $36 $02
    ret                                           ; $6919: $C9

jr_006_691A:
    ld   hl, wEntitiesPosZTable                   ; $691A: $21 $10 $C3
    add  hl, bc                                   ; $691D: $09
    ld   [hl], $20                                ; $691E: $36 $20
    ld   hl, wEntitiesSpeedXTable                 ; $6920: $21 $40 $C2
    add  hl, bc                                   ; $6923: $09
    ld   [hl], $18                                ; $6924: $36 $18
    ld   hl, wEntitiesSpeedYTable                 ; $6926: $21 $50 $C2
    add  hl, bc                                   ; $6929: $09
    ld   [hl], $10                                ; $692A: $36 $10
    jp   IncrementEntityState                     ; $692C: $C3 $12 $3B

OwlState1Handler::
    call func_006_65B4                            ; $692F: $CD $B4 $65
    ld   a, e                                     ; $6932: $7B
    xor  $01                                      ; $6933: $EE $01
    ldh  [hLinkDirection], a                      ; $6935: $E0 $9E
    ld   a, $02                                   ; $6937: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $6939: $E0 $A1
    ld   a, $05                                   ; $693B: $3E $05
    ld   [wC111], a                               ; $693D: $EA $11 $C1
    call func_006_69BD                            ; $6940: $CD $BD $69
    call func_006_6541                            ; $6943: $CD $41 $65
    ld   hl, wEntitiesPosZTable                   ; $6946: $21 $10 $C3
    add  hl, bc                                   ; $6949: $09
    ld   a, [hl]                                  ; $694A: $7E
    and  a                                        ; $694B: $A7
    jr   nz, jr_006_6951                          ; $694C: $20 $03

    jp   IncrementEntityState                     ; $694E: $C3 $12 $3B

jr_006_6951:
    ld   hl, wEntitiesSpeedZTable                 ; $6951: $21 $20 $C3
    add  hl, bc                                   ; $6954: $09
    ld   [hl], $FC                                ; $6955: $36 $FC
    call func_006_657A                            ; $6957: $CD $7A $65
    call PlayBoomerangSfx_trampoline              ; $695A: $CD $F8 $29
    ldh  a, [hFrameCounter]                       ; $695D: $F0 $E7
    and  $03                                      ; $695F: $E6 $03
    ret  nz                                       ; $6961: $C0

    ld   a, $00                                   ; $6962: $3E $00
    ld   hl, wEntitiesSpeedYTable                 ; $6964: $21 $50 $C2
    call func_006_6A2B                            ; $6967: $CD $2B $6A
    ld   a, $00                                   ; $696A: $3E $00
    ld   hl, wEntitiesSpeedXTable                 ; $696C: $21 $40 $C2
    jp   func_006_6A2B                            ; $696F: $C3 $2B $6A

OwlState2Handler::
    call func_006_64C6                            ; $6972: $CD $C6 $64
    call func_006_641A                            ; $6975: $CD $1A $64
    ld   a, [wTransitionSequenceCounter]          ; $6978: $FA $6B $C1
    cp   $04                                      ; $697B: $FE $04
    ret  nz                                       ; $697D: $C0

    ld   a, [wFreeMovementMode]                   ; $697E: $FA $7B $C1
    and  a                                        ; $6981: $A7
    ret  nz                                       ; $6982: $C0

    ldh  a, [hMapRoom]                            ; $6983: $F0 $F6
    cp   $06                                      ; $6985: $FE $06
    jr   nz, jr_006_6990                          ; $6987: $20 $07

    call_open_dialog $0CD                         ; $6989
    jr   jr_006_6993                              ; $698E: $18 $03

jr_006_6990:
    call label_2A07                               ; $6990: $CD $07 $2A

jr_006_6993:
    ld   a, $19                                   ; $6993: $3E $19
    ld   [wDialogSFX], a                          ; $6995: $EA $AB $C5
    call IncrementEntityState                     ; $6998: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $699B: $CD $05 $0C
    ld   [hl], $10                                ; $699E: $36 $10
    ret                                           ; $69A0: $C9

OwlState3Handler::
    call func_006_64C6                            ; $69A1: $CD $C6 $64
    ldh  a, [hMapRoom]                            ; $69A4: $F0 $F6
    cp   $06                                      ; $69A6: $FE $06
    jr   z, jr_006_69B2                           ; $69A8: $28 $08

    call GetEntityTransitionCountdown             ; $69AA: $CD $05 $0C
    jr   nz, func_006_69BD                        ; $69AD: $20 $0E

    call IncrementEntityState                     ; $69AF: $CD $12 $3B

jr_006_69B2:
    ldh  a, [hMapRoom]                            ; $69B2: $F0 $F6
    ld   e, a                                     ; $69B4: $5F
    ld   d, b                                     ; $69B5: $50
    ld   hl, wOverworldRoomStatus                 ; $69B6: $21 $00 $D8
    add  hl, de                                   ; $69B9: $19
    set  5, [hl]                                  ; $69BA: $CB $EE
    ret                                           ; $69BC: $C9

func_006_69BD::
    ld   a, $02                                   ; $69BD: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $69BF: $E0 $A1
    ldh  a, [hFrameCounter]                       ; $69C1: $F0 $E7
    rra                                           ; $69C3: $1F
    rra                                           ; $69C4: $1F
    and  $02                                      ; $69C5: $E6 $02
    jp   SetEntitySpriteVariant                   ; $69C7: $C3 $0C $3B

OwlState4Handler::
    call func_006_64C6                            ; $69CA: $CD $C6 $64
    call func_006_69BD                            ; $69CD: $CD $BD $69
    call func_006_6541                            ; $69D0: $CD $41 $65
    call func_006_5E54                            ; $69D3: $CD $54 $5E
    ld   hl, wEntitiesSpeedZTable                 ; $69D6: $21 $20 $C3
    add  hl, bc                                   ; $69D9: $09
    ld   [hl], $04                                ; $69DA: $36 $04
    call func_006_657A                            ; $69DC: $CD $7A $65
    ld   hl, wEntitiesStatusTable                 ; $69DF: $21 $80 $C2
    add  hl, bc                                   ; $69E2: $09
    ld   a, [hl]                                  ; $69E3: $7E
    and  a                                        ; $69E4: $A7
    jr   nz, jr_006_6A05                          ; $69E5: $20 $1E

    ld   hl, wEntitiesPrivateState1Table          ; $69E7: $21 $B0 $C2
    add  hl, bc                                   ; $69EA: $09
    ld   a, [hl]                                  ; $69EB: $7E
    ld   [wActiveMusicTrack], a                   ; $69EC: $EA $68 $D3
    ldh  [hMusicTrack], a                         ; $69EF: $E0 $B0
    ld   a, [wActivePowerUp]                      ; $69F1: $FA $7C $D4
    and  a                                        ; $69F4: $A7
    jr   z, jr_006_6A04                           ; $69F5: $28 $0D

    ld   a, [wTunicType]                          ; $69F7: $FA $0F $DC
    and  a                                        ; $69FA: $A7
    jr   nz, jr_006_6A04                          ; $69FB: $20 $07

    ld   a, $49                                   ; $69FD: $3E $49
    ld   [wActiveMusicTrack], a                   ; $69FF: $EA $68 $D3
    ldh  [$FFBD], a                               ; $6A02: $E0 $BD

jr_006_6A04:
    ret                                           ; $6A04: $C9

jr_006_6A05:
    ldh  a, [hFrameCounter]                       ; $6A05: $F0 $E7
    and  $07                                      ; $6A07: $E6 $07
    jr   nz, jr_006_6A0F                          ; $6A09: $20 $04

    ld   a, $05                                   ; $6A0B: $3E $05
    ldh  [hNoiseSfx], a                           ; $6A0D: $E0 $F4

jr_006_6A0F:
    ldh  a, [hFrameCounter]                       ; $6A0F: $F0 $E7
    and  $01                                      ; $6A11: $E6 $01
    jr   nz, jr_006_6A36                          ; $6A13: $20 $21

    ld   a, $20                                   ; $6A15: $3E $20
    call GetVectorTowardsLink_trampoline          ; $6A17: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $6A1A: $F0 $D7
    cpl                                           ; $6A1C: $2F
    inc  a                                        ; $6A1D: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $6A1E: $21 $50 $C2
    call func_006_6A2B                            ; $6A21: $CD $2B $6A
    ldh  a, [hScratch1]                           ; $6A24: $F0 $D8
    cpl                                           ; $6A26: $2F
    inc  a                                        ; $6A27: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $6A28: $21 $40 $C2

func_006_6A2B::
    add  hl, bc                                   ; $6A2B: $09
    sub  [hl]                                     ; $6A2C: $96
    jr   z, jr_006_6A36                           ; $6A2D: $28 $07

    bit  7, a                                     ; $6A2F: $CB $7F
    jr   z, jr_006_6A35                           ; $6A31: $28 $02

    dec  [hl]                                     ; $6A33: $35
    dec  [hl]                                     ; $6A34: $35

jr_006_6A35:
    inc  [hl]                                     ; $6A35: $34

jr_006_6A36:
    ret                                           ; $6A36: $C9

Data_006_6A37::
    db   $78, $01, $78, $21, $7A, $01, $7A, $21

Data_006_6A3F::
    nop                                           ; $6A3F: $00
    ld   hl, sp+$7C                               ; $6A40: $F8 $7C
    ld   bc, $00                                  ; $6A42: $01 $00 $00
    ld   a, [hl]                                  ; $6A45: $7E
    ld   bc, $800                                 ; $6A46: $01 $00 $08
    ld   a, [hl]                                  ; $6A49: $7E
    ld   hl, label_1000                           ; $6A4A: $21 $00 $10
    ld   a, h                                     ; $6A4D: $7C
    db   $21                                      ; $6A4E: $21

func_006_6A4F::
    db   $F0, $F1                                 ; $6A4F: $F0 F1
    cp   $02                                      ; $6A51: $FE $02
    jr   nc, jr_006_6A5B                          ; $6A53: $30 $06

func_006_6A55::
    ld   de, Data_006_6A37                        ; $6A55: $11 $37 $6A
    jp   RenderAnimatedActiveEntity               ; $6A58: $C3 $C0 $3B

jr_006_6A5B:
    ld   hl, Data_006_6A3F                        ; $6A5B: $21 $3F $6A
    ld   c, $04                                   ; $6A5E: $0E $04
    call func_3CE6                                ; $6A60: $CD $E6 $3C
    ld   a, $04                                   ; $6A63: $3E $04
    call label_3DA0                               ; $6A65: $CD $A0 $3D
    ldh  a, [hMapRoom]                            ; $6A68: $F0 $F6
    cp   $08                                      ; $6A6A: $FE $08
    jr   z, jr_006_6A71                           ; $6A6C: $28 $03
    jp   label_3CD9                               ; $6A6E: $C3 $D9 $3C

jr_006_6A71:
    ld   hl, wEntitiesPhysicsFlagsTable                ; $6A71: $21 $40 $C3
    add  hl, bc                                   ; $6A74: $09
    res  4, [hl]                                  ; $6A75: $CB $A6
    ret                                           ; $6A77: $C9

Data_006_6A78::
    db   $50, $02, $52, $02

TelephoneEntityHandler::
    ldh  a, [$FFEC]                               ; $6A7C: $F0 $EC
    sub  $05                                      ; $6A7E: $D6 $05
    ldh  [$FFEC], a                               ; $6A80: $E0 $EC
    ld   de, Data_006_6A78                        ; $6A82: $11 $78 $6A
    call RenderAnimatedActiveEntity               ; $6A85: $CD $C0 $3B
    call func_006_64C6                            ; $6A88: $CD $C6 $64
    call func_006_645D                            ; $6A8B: $CD $5D $64
    ret  nc                                       ; $6A8E: $D0

    ld   e, $FD                                   ; $6A8F: $1E $FD
    ldh  a, [hMapRoom]                            ; $6A91: $F0 $F6
    cp   $A9                                      ; $6A93: $FE $A9
    jp   z, label_006_6BAD                        ; $6A95: $CA $AD $6B

    ld   e, $6E                                   ; $6A98: $1E $6E
    ld   a, [wTradeSequenceItem]                  ; $6A9A: $FA $0E $DB
    cp   $0A                                      ; $6A9D: $FE $0A
    jr   nz, jr_006_6AA9                          ; $6A9F: $20 $08

    ld   a, [wHasInstrument5]                     ; $6AA1: $FA $69 $DB
    and  $02                                      ; $6AA4: $E6 $02
    jp   nz, label_006_6BAD                       ; $6AA6: $C2 $AD $6B

jr_006_6AA9:
    ld   e, $41                                   ; $6AA9: $1E $41
    ld   a, [$DAA9]                               ; $6AAB: $FA $A9 $DA
    and  $20                                      ; $6AAE: $E6 $20
    jp   z, label_006_6BAD                        ; $6AB0: $CA $AD $6B

    ld   e, $46                                   ; $6AB3: $1E $46
    ld   a, [wHasInstrument1]                     ; $6AB5: $FA $65 $DB
    and  $02                                      ; $6AB8: $E6 $02
    jp   z, label_006_6BAD                        ; $6ABA: $CA $AD $6B

    ld   e, $42                                   ; $6ABD: $1E $42
    ld   a, [wIsBowWowFollowingLink]              ; $6ABF: $FA $56 $DB
    cp   $80                                      ; $6AC2: $FE $80
    jp   z, label_006_6BAD                        ; $6AC4: $CA $AD $6B

    ld   e, $43                                   ; $6AC7: $1E $43
    ld   a, [wHasInstrument2]                     ; $6AC9: $FA $66 $DB
    and  $02                                      ; $6ACC: $E6 $02
    jp   z, label_006_6BAD                        ; $6ACE: $CA $AD $6B

    ld   e, $44                                   ; $6AD1: $1E $44
    ld   a, [wIsBowWowFollowingLink]              ; $6AD3: $FA $56 $DB
    cp   $01                                      ; $6AD6: $FE $01
    jp   z, label_006_6BB3                        ; $6AD8: $CA $B3 $6B

    ld   e, $44                                   ; $6ADB: $1E $44
    ld   a, [wDB55]                               ; $6ADD: $FA $55 $DB
    cp   $02                                      ; $6AE0: $FE $02
    jp   nz, label_006_6BAD                       ; $6AE2: $C2 $AD $6B

    ld   e, $45                                   ; $6AE5: $1E $45
    ld   a, [wTradeSequenceItem]                  ; $6AE7: $FA $0E $DB
    cp   $05                                      ; $6AEA: $FE $05
    jp   c, label_006_6BAD                        ; $6AEC: $DA $AD $6B

    ld   a, [wGoldenLeavesCount]                  ; $6AEF: $FA $15 $DB
    cp   $05                                      ; $6AF2: $FE $05
    jr   nc, jr_006_6B09                          ; $6AF4: $30 $13

    ld   hl, wEntitiesPrivateState1Table          ; $6AF6: $21 $B0 $C2
    add  hl, bc                                   ; $6AF9: $09
    inc  [hl]                                     ; $6AFA: $34
    ld   a, [hl]                                  ; $6AFB: $7E
    cp   $03                                      ; $6AFC: $FE $03
    jr   nz, jr_006_6B02                          ; $6AFE: $20 $02

    xor  a                                        ; $6B00: $AF
    ld   [hl], a                                  ; $6B01: $77

jr_006_6B02:
    ld   e, $28                                   ; $6B02: $1E $28
    add  e                                        ; $6B04: $83
    ld   e, a                                     ; $6B05: $5F
    jp   label_006_6BB3                           ; $6B06: $C3 $B3 $6B

jr_006_6B09:
    ld   e, $48                                   ; $6B09: $1E $48
    jp   z, label_006_6BAD                        ; $6B0B: $CA $AD $6B

    cp   $06                                      ; $6B0E: $FE $06
    jp   nz, label_006_6BAD                       ; $6B10: $C2 $AD $6B

    ld   e, $49                                   ; $6B13: $1E $49
    ld   a, [wHasInstrument3]                     ; $6B15: $FA $67 $DB
    and  $02                                      ; $6B18: $E6 $02
    jp   z, label_006_6BAD                        ; $6B1A: $CA $AD $6B

    ld   e, $4A                                   ; $6B1D: $1E $4A
    ld   a, [wHasAnglerKey]                       ; $6B1F: $FA $12 $DB
    and  a                                        ; $6B22: $A7
    jp   z, label_006_6BAD                        ; $6B23: $CA $AD $6B

    ld   e, $40                                   ; $6B26: $1E $40
    ld   a, [wHasInstrument4]                     ; $6B28: $FA $68 $DB
    and  $02                                      ; $6B2B: $E6 $02
    jp   z, label_006_6BB3                        ; $6B2D: $CA $B3 $6B

    ld   a, [wIsGhostFollowingLink]               ; $6B30: $FA $79 $DB
    and  a                                        ; $6B33: $A7
    jr   z, jr_006_6B3F                           ; $6B34: $28 $09

    ld   e, $4B                                   ; $6B36: $1E $4B
    ld   a, [$D9E3]                               ; $6B38: $FA $E3 $D9
    and  $40                                      ; $6B3B: $E6 $40
    jr   z, label_006_6BAD                        ; $6B3D: $28 $6E

jr_006_6B3F:
    ld   e, $4C                                   ; $6B3F: $1E $4C
    ld   a, [wHasInstrument5]                     ; $6B41: $FA $69 $DB
    and  $02                                      ; $6B44: $E6 $02
    jr   z, label_006_6BAD                        ; $6B46: $28 $65

    ld   e, $45                                   ; $6B48: $1E $45
    ld   a, [wOcarinaSongFlags]                   ; $6B4A: $FA $49 $DB
    and  $01                                      ; $6B4D: $E6 $01
    jp   z, label_006_6BB3                        ; $6B4F: $CA $B3 $6B

    ld   e, $4D                                   ; $6B52: $1E $4D
    ld   a, [wHasInstrument6]                     ; $6B54: $FA $6A $DB
    and  $02                                      ; $6B57: $E6 $02
    jr   z, label_006_6BAD                        ; $6B59: $28 $52

    ld   e, $4E                                   ; $6B5B: $1E $4E
    ld   a, [wIsRoosterFollowingLink]             ; $6B5D: $FA $7B $DB
    and  a                                        ; $6B60: $A7
    jr   z, jr_006_6B6E                           ; $6B61: $28 $0B

    ld   e, $46                                   ; $6B63: $1E $46
    ld   a, [wHasBirdKey]                         ; $6B65: $FA $14 $DB
    and  a                                        ; $6B68: $A7
    jp   z, label_006_6BB3                        ; $6B69: $CA $B3 $6B

    ld   e, $41                                   ; $6B6C: $1E $41

jr_006_6B6E:
    ld   a, [wHasInstrument7]                     ; $6B6E: $FA $6B $DB
    and  $02                                      ; $6B71: $E6 $02
    jr   nz, jr_006_6B7C                          ; $6B73: $20 $07

    ld   a, e                                     ; $6B75: $7B
    cp   $4E                                      ; $6B76: $FE $4E
    jr   z, label_006_6BAD                        ; $6B78: $28 $33

    jr   label_006_6BB3                           ; $6B7A: $18 $37

jr_006_6B7C:
    ld   e, $4F                                   ; $6B7C: $1E $4F
    ld   a, [$D810]                               ; $6B7E: $FA $10 $D8
    and  $30                                      ; $6B81: $E6 $30
    jr   z, label_006_6BAD                        ; $6B83: $28 $28

    ld   e, $48                                   ; $6B85: $1E $48
    ld   a, [wHasInstrument8]                     ; $6B87: $FA $6C $DB
    and  $02                                      ; $6B8A: $E6 $02
    jr   z, label_006_6BB3                        ; $6B8C: $28 $25

    ld   e, $42                                   ; $6B8E: $1E $42
    ld   a, [$D806]                               ; $6B90: $FA $06 $D8
    and  $30                                      ; $6B93: $E6 $30
    jr   z, label_006_6BB3                        ; $6B95: $28 $1C

    ld   e, $43                                   ; $6B97: $1E $43
    ld   a, [$DA74]                               ; $6B99: $FA $74 $DA
    and  $40                                      ; $6B9C: $E6 $40
    jr   z, label_006_6BB3                        ; $6B9E: $28 $13

    ld   e, $47                                   ; $6BA0: $1E $47
    ld   a, [wSwordLevel]                         ; $6BA2: $FA $4E $DB
    cp   $02                                      ; $6BA5: $FE $02
    jr   c, label_006_6BB3                        ; $6BA7: $38 $0A

    ld   e, $48                                   ; $6BA9: $1E $48
    jr   label_006_6BB3                           ; $6BAB: $18 $06

label_006_6BAD:
    ld   a, e                                     ; $6BAD: $7B
    call OpenDialogInTable1                       ; $6BAE: $CD $73 $23
    jr   jr_006_6BB7                              ; $6BB1: $18 $04

label_006_6BB3:
    ld   a, e                                     ; $6BB3: $7B
    call OpenDialogInTable2                       ; $6BB4: $CD $7C $23

jr_006_6BB7:
    ld   hl, $DAA9                                ; $6BB7: $21 $A9 $DA
    set  5, [hl]                                  ; $6BBA: $CB $EE
    ret                                           ; $6BBC: $C9

; Array, indexed by hActiveEntitySpriteVariant
;  byte 0: tile n°
;  byte 1: OAM attribute (palette index and flags)
ButterflyOAMData::
._00 db $5E, %001
._01 db $5E, %001 | OAMF_YFLIP

; Randomly-selected X or Y speed
ButterflyPossibleSpeeds::
    db $04, -$04, $03, -$03, $02, -$02, $05, -$06

ButterflyEntityHandler::
    ; If the butterfly wings are downwards…
    ldh  a, [hActiveEntitySpriteVariant]          ; $6BC9
    cp   $01                                      ; $6BCB: $FE $01
    jr   nz, .downwardsEnd                        ; $6BCD: $20 $06
    ; … $FFEC = $FFEC - 0 (unused?)
    ldh  a, [$FFEC]                               ; $6BCF: $F0 $EC
    sub  $00                                      ; $6BD1: $D6 $00
    ldh  [$FFEC], a                               ; $6BD3: $E0 $EC
.downwardsEnd

    ld   de, ButterflyOAMData                     ; $6BD5: $11 $BD $6B
    call RenderSimpleEntityWithSpriteVariantToOAM ; $6BD8: $CD $77 $3C
    call func_006_64C6                            ; $6BDB: $CD $C6 $64

    ;
    ; Flip the wings every $1F frames
    ;

    ; [hActiveEntityState] = [hFrameCounter] + (c * 8)
    ld   a, c                                     ; $6BDE: $79
    sla  a                                        ; $6BDF: $CB $27
    sla  a                                        ; $6BE1: $CB $27
    sla  a                                        ; $6BE3: $CB $27
    ld   hl, hFrameCounter                        ; $6BE5: $21 $E7 $FF
    add  [hl]                                     ; $6BE8: $86
    ldh  [hActiveEntityState], a                  ; $6BE9: $E0 $F0

    rra                                           ; $6BEB: $1F
    rra                                           ; $6BEC: $1F
    rra                                           ; $6BED: $1F
    and  $01                                      ; $6BEE: $E6 $01
    call SetEntitySpriteVariant                   ; $6BF0: $CD $0C $3B
    call func_006_6541                            ; $6BF3: $CD $41 $65

    ; If [hActiveEntityState] & $1F == 0…
    ldh  a, [hActiveEntityState]                  ; $6BF6: $F0 $F0
    and  $1F                                      ; $6BF8: $E6 $1F
    jr   nz, .speedXEnd                           ; $6BFA: $20 $16
    ; Set a random horizontal speed
    call GetRandomByte                            ; $6BFC: $CD $0D $28
    and  $07                                      ; $6BFF: $E6 $07
    ld   e, a                                     ; $6C01: $5F
    ld   d, b                                     ; $6C02: $50
    ld   hl, ButterflyPossibleSpeeds                        ; $6C03: $21 $C1 $6B
    add  hl, de                                   ; $6C06: $19
    ld   a, [hl]                                  ; $6C07: $7E
    ld   hl, wEntitiesPrivateState1Table          ; $6C08: $21 $B0 $C2
    add  hl, bc                                   ; $6C0B: $09
    add  [hl]                                     ; $6C0C: $86
    ld   hl, wEntitiesSpeedXTable                       ; $6C0D: $21 $40 $C2
    add  hl, bc                                   ; $6C10: $09
    ld   [hl], a                                  ; $6C11: $77
.speedXEnd

    ; If [hActiveEntityState] + $10 & $1F == 0…
    ldh  a, [hActiveEntityState]                  ; $6C12: $F0 $F0
    add  $10                                      ; $6C14: $C6 $10
    and  $1F                                      ; $6C16: $E6 $1F
    jr   nz, .speedYEnd                           ; $6C18: $20 $16
    ; Set a random vertical speed
    call GetRandomByte                            ; $6C1A: $CD $0D $28
    and  $07                                      ; $6C1D: $E6 $07
    ld   e, a                                     ; $6C1F: $5F
    ld   d, b                                     ; $6C20: $50
    ld   hl, ButterflyPossibleSpeeds                        ; $6C21: $21 $C1 $6B
    add  hl, de                                   ; $6C24: $19
    ld   a, [hl]                                  ; $6C25: $7E
    ld   hl, wEntitiesPrivateState2Table          ; $6C26: $21 $C0 $C2
    add  hl, bc                                   ; $6C29: $09
    add  [hl]                                     ; $6C2A: $86
    ld   hl, wEntitiesSpeedYTable                       ; $6C2B: $21 $50 $C2
    add  hl, bc                                   ; $6C2E: $09
    ld   [hl], a                                  ; $6C2F: $77
.speedYEnd

    ;
    ; Move closer to Link every $3F frame
    ;

    ; If [hActiveEntityState] & $3F == 0…
    ldh  a, [hActiveEntityState]                  ; $6C30: $F0 $F0
    and  $3F                                      ; $6C32: $E6 $3F
    jr   nz, .moveCloserToLinkEnd                 ; $6C34: $20 $36

    ldh  a, [hLinkPositionX]                      ; $6C36: $F0 $98
    push af                                       ; $6C38: $F5
    ldh  a, [hLinkPositionY]                      ; $6C39: $F0 $99
    push af                                       ; $6C3B: $F5
    ld   a, [$C50F]                               ; $6C3C: $FA $0F $C5
    cp   $FF                                      ; $6C3F: $FE $FF
    jr   z, .C50FEnd                              ; $6C41: $28 $10

    ld   e, a                                     ; $6C43: $5F
    ld   d, b                                     ; $6C44: $50
    ld   hl, wEntitiesPosXTable                   ; $6C45: $21 $00 $C2
    add  hl, de                                   ; $6C48: $19
    ld   a, [hl]                                  ; $6C49: $7E
    ldh  [hLinkPositionX], a                      ; $6C4A: $E0 $98
    ld   hl, wEntitiesPosYTable                   ; $6C4C: $21 $10 $C2
    add  hl, de                                   ; $6C4F: $19
    ld   a, [hl]                                  ; $6C50: $7E
    ldh  [hLinkPositionY], a                      ; $6C51: $E0 $99
.C50FEnd

    ; Move closer to Link by $02 pixels
    ld   a, $02                                   ; $6C53: $3E $02
    call GetVectorTowardsLink_trampoline          ; $6C55: $CD $B5 $3B
    pop  af                                       ; $6C58: $F1
    ldh  [hLinkPositionY], a                      ; $6C59: $E0 $99
    pop  af                                       ; $6C5B: $F1
    ldh  [hLinkPositionX], a                      ; $6C5C: $E0 $98
    ; wEntitiesPrivateState2Table[c] = [hScratch0]
    ldh  a, [hScratch0]                           ; $6C5E: $F0 $D7
    ld   hl, wEntitiesPrivateState2Table          ; $6C60: $21 $C0 $C2
    add  hl, bc                                   ; $6C63: $09
    ld   [hl], a                                  ; $6C64: $77
    ; wEntitiesPrivateState1Table[c] = [hScratch1]
    ldh  a, [hScratch1]                           ; $6C65: $F0 $D8
    ld   hl, wEntitiesPrivateState1Table          ; $6C67: $21 $B0 $C2
    add  hl, bc                                   ; $6C6A: $09
    ld   [hl], a                                  ; $6C6B: $77
.moveCloserToLinkEnd
    ret                                           ; $6C6C: $C9

RollingBonesEntityHandler::
    ld   a, c                                     ; $6C6D: $79
    ld   [$D202], a                               ; $6C6E: $EA $02 $D2
    ldh  a, [hMapId]                              ; $6C71: $F0 $F7
    cp   $07                                      ; $6C73: $FE $07
    jr   nz, jr_006_6C7B                          ; $6C75: $20 $04

    ld   a, $10                                   ; $6C77: $3E $10
    ldh  [hActiveEntityTilesOffset], a            ; $6C79: $E0 $F5

jr_006_6C7B:
    call func_006_6E7E                            ; $6C7B: $CD $7E $6E
    call label_3EE8                               ; $6C7E: $CD $E8 $3E
    call label_394D                               ; $6C81: $CD $4D $39
    ldh  a, [hActiveEntityStatus]                 ; $6C84: $F0 $EA
    cp   $05                                      ; $6C86: $FE $05
    jr   z, jr_006_6CE8                           ; $6C88: $28 $5E

    ld   hl, wEntitiesUnknowTableH                ; $6C8A: $21 $30 $C4
    add  hl, bc                                   ; $6C8D: $09
    ld   [hl], $80                                ; $6C8E: $36 $80
    ld   hl, wEntitiesPrivateState1Table          ; $6C90: $21 $B0 $C2
    add  hl, bc                                   ; $6C93: $09
    ld   a, [hl]                                  ; $6C94: $7E
    JP_TABLE                                      ; $6C95
._00 dw func_006_6C9A                             ; $6C96
._01 dw func_006_6CAB                             ; $6C98

func_006_6C9A::
    call GetEntityTransitionCountdown             ; $6C9A: $CD $05 $0C
    ld   [hl], $FF                                ; $6C9D: $36 $FF
    ld   hl, wEntitiesFlashCountdownTable         ; $6C9F: $21 $20 $C4
    add  hl, bc                                   ; $6CA2: $09
    ld   [hl], $FF                                ; $6CA3: $36 $FF
    ld   hl, wEntitiesPrivateState1Table          ; $6CA5: $21 $B0 $C2
    add  hl, bc                                   ; $6CA8: $09
    inc  [hl]                                     ; $6CA9: $34
    ret                                           ; $6CAA: $C9

func_006_6CAB::
    call GetEntityTransitionCountdown             ; $6CAB: $CD $05 $0C
    jp   z, label_006_6CBE                        ; $6CAE: $CA $BE $6C

    ld   hl, wEntitiesFlashCountdownTable         ; $6CB1: $21 $20 $C4
    add  hl, bc                                   ; $6CB4: $09
    ld   [hl], a                                  ; $6CB5: $77
    cp   $80                                      ; $6CB6: $FE $80
    jr   nc, jr_006_6CBD                          ; $6CB8: $30 $03

    call func_006_700A                            ; $6CBA: $CD $0A $70

jr_006_6CBD:
    ret                                           ; $6CBD: $C9

label_006_6CBE:
    call label_27DD                               ; $6CBE: $CD $DD $27
    call DidKillEnemy                             ; $6CC1: $CD $50 $3F
    ldh  a, [hMapId]                              ; $6CC4: $F0 $F7
    cp   $07                                      ; $6CC6: $FE $07
    ret  z                                        ; $6CC8: $C8

label_006_6CC9:
    ld   hl, wIndoorARoomStatus                   ; $6CC9: $21 $00 $D9
    ldh  a, [hMapRoom]                            ; $6CCC: $F0 $F6
    ld   e, a                                     ; $6CCE: $5F
    ld   d, b                                     ; $6CCF: $50
    ldh  a, [hMapId]                              ; $6CD0: $F0 $F7
    cp   $FF                                      ; $6CD2: $FE $FF
    jr   nz, jr_006_6CDB                          ; $6CD4: $20 $05

    ld   hl, wColorDungeonRoomStatus              ; $6CD6: $21 $E0 $DD
    jr   jr_006_6CE4                              ; $6CD9: $18 $09

jr_006_6CDB:
    cp   $1A                                      ; $6CDB: $FE $1A
    jr   nc, jr_006_6CE4                          ; $6CDD: $30 $05

    cp   $06                                      ; $6CDF: $FE $06
    jr   c, jr_006_6CE4                           ; $6CE1: $38 $01

    inc  d                                        ; $6CE3: $14

jr_006_6CE4:
    add  hl, de                                   ; $6CE4: $19
    set  5, [hl]                                  ; $6CE5: $CB $EE
    ret                                           ; $6CE7: $C9

jr_006_6CE8:
    call func_006_64C6                            ; $6CE8: $CD $C6 $64
    call func_006_64F7                            ; $6CEB: $CD $F7 $64
    call label_3B39                               ; $6CEE: $CD $39 $3B
    ld   hl, wEntitiesHealthTable                 ; $6CF1: $21 $60 $C3
    add  hl, bc                                   ; $6CF4: $09
    ld   a, [hl]                                  ; $6CF5: $7E
    ldh  [hIndexOfObjectBelowLink], a             ; $6CF6: $E0 $E9
    ld   hl, wEntitiesSpeedXTable                       ; $6CF8: $21 $40 $C2
    add  hl, bc                                   ; $6CFB: $09
    ld   a, [hl]                                  ; $6CFC: $7E
    and  a                                        ; $6CFD: $A7
    jr   z, jr_006_6D0D                           ; $6CFE: $28 $0D

    ld   e, $00                                   ; $6D00: $1E $00
    and  $80                                      ; $6D02: $E6 $80
    jr   nz, jr_006_6D08                          ; $6D04: $20 $02

    ld   e, $03                                   ; $6D06: $1E $03

jr_006_6D08:
    ld   hl, wEntitiesDirectionTable              ; $6D08: $21 $80 $C3
    add  hl, bc                                   ; $6D0B: $09
    ld   [hl], e                                  ; $6D0C: $73

jr_006_6D0D:
    call func_006_657A                            ; $6D0D: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $6D10: $21 $20 $C3
    add  hl, bc                                   ; $6D13: $09
    dec  [hl]                                     ; $6D14: $35
    dec  [hl]                                     ; $6D15: $35
    nop                                           ; $6D16: $00
    nop                                           ; $6D17: $00
    ld   hl, wEntitiesPosZTable                   ; $6D18: $21 $10 $C3
    add  hl, bc                                   ; $6D1B: $09
    ld   a, [hl]                                  ; $6D1C: $7E
    and  $80                                      ; $6D1D: $E6 $80
    ldh  [hFFE8], a                               ; $6D1F: $E0 $E8
    jr   z, jr_006_6D32                           ; $6D21: $28 $0F

    ld   [hl], b                                  ; $6D23: $70
    ld   hl, wEntitiesSpeedZTable                 ; $6D24: $21 $20 $C3
    add  hl, bc                                   ; $6D27: $09
    ld   a, [hl]                                  ; $6D28: $7E
    ld   [hl], b                                  ; $6D29: $70
    cp   $F2                                      ; $6D2A: $FE $F2
    jr   nc, jr_006_6D32                          ; $6D2C: $30 $04

    ld   a, $20                                   ; $6D2E: $3E $20
    ldh  [hJingle], a                             ; $6D30: $E0 $F2

jr_006_6D32:
    ldh  a, [hActiveEntityState]                  ; $6D32: $F0 $F0
    JP_TABLE                                      ; $6D34
._00 dw RollingBonesState0Handler
._01 dw RollingBonesState1Handler
._02 dw RollingBonesState2Handler
._03 dw RollingBonesState3Handler

RollingBonesState0Handler::
    call GetEntityTransitionCountdown             ; $6D3D: $CD $05 $0C
    ret  nz                                       ; $6D40: $C0

    ld   a, [$D201]                               ; $6D41: $FA $01 $D2
    ld   e, a                                     ; $6D44: $5F
    ld   d, b                                     ; $6D45: $50
    ld   hl, wEntitiesPosXTable                   ; $6D46: $21 $00 $C2
    add  hl, de                                   ; $6D49: $19
    ldh  a, [hActiveEntityPosX]                   ; $6D4A: $F0 $EE
    sub  [hl]                                     ; $6D4C: $96
    ld   e, $08                                   ; $6D4D: $1E $08
    bit  7, a                                     ; $6D4F: $CB $7F
    jr   nz, jr_006_6D55                          ; $6D51: $20 $02

    ld   e, $F8                                   ; $6D53: $1E $F8

jr_006_6D55:
    ld   hl, wEntitiesSpeedXTable                 ; $6D55: $21 $40 $C2
    add  hl, bc                                   ; $6D58: $09
    ld   [hl], e                                  ; $6D59: $73
    add  $10                                      ; $6D5A: $C6 $10
    cp   $20                                      ; $6D5C: $FE $20
    jr   nc, jr_006_6D68                          ; $6D5E: $30 $08

    call GetEntityTransitionCountdown             ; $6D60: $CD $05 $0C
    ld   [hl], $18                                ; $6D63: $36 $18
    jp   IncrementEntityState                     ; $6D65: $C3 $12 $3B

jr_006_6D68:
    call func_006_654E                            ; $6D68: $CD $4E $65
    ldh  a, [hFFE8]                               ; $6D6B: $F0 $E8
    and  a                                        ; $6D6D: $A7
    jr   z, jr_006_6D76                           ; $6D6E: $28 $06

    ld   hl, wEntitiesSpeedZTable                 ; $6D70: $21 $20 $C3
    add  hl, bc                                   ; $6D73: $09
    ld   [hl], $0C                                ; $6D74: $36 $0C

jr_006_6D76:
    ld   a, $01                                   ; $6D76: $3E $01
    jp   SetEntitySpriteVariant                   ; $6D78: $C3 $0C $3B

RollingBonesState1Handler::
    call GetEntityTransitionCountdown             ; $6D7B: $CD $05 $0C
    ret  nz                                       ; $6D7E: $C0

    ld   hl, wEntitiesDirectionTable              ; $6D7F: $21 $80 $C3
    add  hl, bc                                   ; $6D82: $09
    ld   a, [hl]                                  ; $6D83: $7E
    and  a                                        ; $6D84: $A7
    ld   a, $10                                   ; $6D85: $3E $10
    jr   nz, jr_006_6D8B                          ; $6D87: $20 $02

    ld   a, $F0                                   ; $6D89: $3E $F0

jr_006_6D8B:
    push af                                       ; $6D8B: $F5
    ld   a, [$D201]                               ; $6D8C: $FA $01 $D2
    ld   e, a                                     ; $6D8F: $5F
    ld   d, b                                     ; $6D90: $50
    ld   hl, wEntitiesSpeedXTable                 ; $6D91: $21 $40 $C2
    add  hl, de                                   ; $6D94: $19
    pop  af                                       ; $6D95: $F1
    ld   [hl], a                                  ; $6D96: $77
    ld   hl, wEntitiesStateTable                  ; $6D97: $21 $90 $C2
    add  hl, de                                   ; $6D9A: $19
    ld   [hl], $01                                ; $6D9B: $36 $01
    call GetEntityTransitionCountdown             ; $6D9D: $CD $05 $0C
    ld   [hl], $20                                ; $6DA0: $36 $20
    call IncrementEntityState                     ; $6DA2: $CD $12 $3B
    xor  a                                        ; $6DA5: $AF
    jp   SetEntitySpriteVariant                   ; $6DA6: $C3 $0C $3B

RollingBonesState2Handler::
    call GetEntityTransitionCountdown             ; $6DA9: $CD $05 $0C
    ret  nz                                       ; $6DAC: $C0

    jp   IncrementEntityState                     ; $6DAD: $C3 $12 $3B

RollingBonesState3Handler::
    ld   hl, wEntitiesPosZTable                   ; $6DB0: $21 $10 $C3
    add  hl, bc                                   ; $6DB3: $09
    ld   a, [hl]                                  ; $6DB4: $7E
    cp   $08                                      ; $6DB5: $FE $08
    ld   a, $01                                   ; $6DB7: $3E $01
    jr   c, jr_006_6DBC                           ; $6DB9: $38 $01

    inc  a                                        ; $6DBB: $3C

jr_006_6DBC:
    call SetEntitySpriteVariant                   ; $6DBC: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $6DBF: $CD $05 $0C
    cp   $01                                      ; $6DC2: $FE $01
    jr   z, jr_006_6DD4                           ; $6DC4: $28 $0E

    cp   $00                                      ; $6DC6: $FE $00
    ret  nz                                       ; $6DC8: $C0

    ldh  a, [hFFE8]                               ; $6DC9: $F0 $E8
    and  a                                        ; $6DCB: $A7
    jr   z, jr_006_6E04                           ; $6DCC: $28 $36

    call GetEntityTransitionCountdown             ; $6DCE: $CD $05 $0C
    ld   [hl], $10                                ; $6DD1: $36 $10
    ret                                           ; $6DD3: $C9

jr_006_6DD4:
    ld   e, $10                                   ; $6DD4: $1E $10
    ld   hl, wEntitiesSpeedZTable                 ; $6DD6: $21 $20 $C3
    add  hl, bc                                   ; $6DD9: $09
    ld   [hl], $19                                ; $6DDA: $36 $19
    ldh  a, [hIndexOfObjectBelowLink]             ; $6DDC: $F0 $E9
    cp   $05                                      ; $6DDE: $FE $05
    jr   nc, jr_006_6DE6                          ; $6DE0: $30 $04

    ld   e, $14                                   ; $6DE2: $1E $14
    ld   [hl], $16                                ; $6DE4: $36 $16

jr_006_6DE6:
    ld   hl, wEntitiesDirectionTable              ; $6DE6: $21 $80 $C3
    add  hl, bc                                   ; $6DE9: $09
    ld   a, [hl]                                  ; $6DEA: $7E
    and  a                                        ; $6DEB: $A7
    ld   a, e                                     ; $6DEC: $7B
    jr   nz, jr_006_6DF1                          ; $6DED: $20 $02

    cpl                                           ; $6DEF: $2F
    inc  a                                        ; $6DF0: $3C

jr_006_6DF1:
    ld   hl, wEntitiesSpeedXTable                 ; $6DF1: $21 $40 $C2
    add  hl, bc                                   ; $6DF4: $09
    ld   [hl], a                                  ; $6DF5: $77
    ldh  a, [$FFEC]                               ; $6DF6: $F0 $EC
    cp   $50                                      ; $6DF8: $FE $50
    ld   a, e                                     ; $6DFA: $7B
    jr   c, jr_006_6DFF                           ; $6DFB: $38 $02

    cpl                                           ; $6DFD: $2F
    inc  a                                        ; $6DFE: $3C

jr_006_6DFF:
    ld   hl, wEntitiesSpeedYTable                 ; $6DFF: $21 $50 $C2
    add  hl, bc                                   ; $6E02: $09
    ld   [hl], a                                  ; $6E03: $77

jr_006_6E04:
    call func_006_6541                            ; $6E04: $CD $41 $65
    call label_3B23                               ; $6E07: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $6E0A: $21 $A0 $C2
    add  hl, bc                                   ; $6E0D: $09
    ld   a, [hl]                                  ; $6E0E: $7E
    and  $03                                      ; $6E0F: $E6 $03
    ret  z                                        ; $6E11: $C8

    call IncrementEntityState                     ; $6E12: $CD $12 $3B
    ld   [hl], b                                  ; $6E15: $70
    call GetEntityTransitionCountdown             ; $6E16: $CD $05 $0C
    ld   [hl], $08                                ; $6E19: $36 $08
    jp   ClearEntitySpeed                         ; $6E1B: $C3 $7F $3D

Data_006_6E1E::
    db   $00, $F8, $60, $06, $00, $00, $62, $06, $00, $08, $64, $06, $F0, $00, $6E, $26
    db   $00, $F8, $66, $06, $00, $00, $68, $06, $00, $08, $6A, $06, $F0, $00, $6E, $06
    db   $00, $F8, $66, $06, $00, $00, $68, $06, $00, $08, $6A, $06, $F0, $06, $6E, $26
    db   $00, $00, $64, $26, $00, $08, $62, $26, $00, $10, $60, $26, $F0, $08, $6E, $06
    db   $00, $00, $6A, $26, $00, $08, $68, $26, $00, $10, $66, $26, $F0, $08, $6E, $26
    db   $00, $00, $6A, $26, $00, $08, $68, $26, $00, $10, $66, $26, $F0, $02, $6E, $06

func_006_6E7E::
    ld   hl, wEntitiesDirectionTable
    add  hl, bc
    ldh  a, [hActiveEntitySpriteVariant]
    add  [hl]                                     ; $6E84: $86
    rla                                           ; $6E85: $17
    rla                                           ; $6E86: $17
    rla                                           ; $6E87: $17
    rla                                           ; $6E88: $17
    and  $F0                                      ; $6E89: $E6 $F0
    ld   e, a                                     ; $6E8B: $5F
    ld   d, b                                     ; $6E8C: $50
    ld   hl, Data_006_6E1E                        ; $6E8D: $21 $1E $6E
    add  hl, de                                   ; $6E90: $19
    ld   c, $04                                   ; $6E91: $0E $04
    call func_3CE6                                ; $6E93: $CD $E6 $3C
    ld   a, $04                                   ; $6E96: $3E $04
    call label_3DA0                               ; $6E98: $CD $A0 $3D
    ld   hl, wEntitiesPosZTable                   ; $6E9B: $21 $10 $C3
    add  hl, bc                                   ; $6E9E: $09
    ld   a, [hl]                                  ; $6E9F: $7E
    and  a                                        ; $6EA0: $A7
    ret  z                                        ; $6EA1: $C8

    ldh  a, [hFrameCounter]                       ; $6EA2: $F0 $E7
    and  $01                                      ; $6EA4: $E6 $01
    ret  nz                                       ; $6EA6: $C0

    ld   a, [$C3C0]                               ; $6EA7: $FA $C0 $C3
    ld   e, a                                     ; $6EAA: $5F
    ld   d, b                                     ; $6EAB: $50
    ld   hl, wDynamicOAMBuffer                    ; $6EAC: $21 $30 $C0
    add  hl, de                                   ; $6EAF: $19
    ldh  a, [hActiveEntityPosY]                   ; $6EB0: $F0 $EF
    add  $0C                                      ; $6EB2: $C6 $0C
    ld   [hl+], a                                 ; $6EB4: $22
    ldh  a, [hActiveEntityPosX]                   ; $6EB5: $F0 $EE
    add  $02                                      ; $6EB7: $C6 $02
    ld   [hl+], a                                 ; $6EB9: $22
    ld   a, $26                                   ; $6EBA: $3E $26
    ld   [hl+], a                                 ; $6EBC: $22
    ld   a, $00                                   ; $6EBD: $3E $00
    ld   [hl+], a                                 ; $6EBF: $22
    ldh  a, [hActiveEntityPosY]                   ; $6EC0: $F0 $EF
    add  $0C                                      ; $6EC2: $C6 $0C
    ld   [hl+], a                                 ; $6EC4: $22
    ldh  a, [hActiveEntityPosX]                   ; $6EC5: $F0 $EE
    add  $04                                      ; $6EC7: $C6 $04
    ld   [hl+], a                                 ; $6EC9: $22
    ld   a, $26                                   ; $6ECA: $3E $26
    ld   [hl+], a                                 ; $6ECC: $22
    ld   a, $00                                   ; $6ECD: $3E $00
    ld   [hl+], a                                 ; $6ECF: $22
    ld   a, $02                                   ; $6ED0: $3E $02
    jp   label_3DA0                               ; $6ED2: $C3 $A0 $3D

Data_006_6ED5::
    db   $6C, $07, $6C, $27, $6C, $47, $6C, $67

Data_006_6EDD::
    db   $70, $60, $50, $40, $30, $20

RollingBonesBarEntityHandler::
    ldh  a, [hMapId]                              ; $6EE3: $F0 $F7
    cp   $07                                      ; $6EE5: $FE $07
    jr   nz, jr_006_6EED                          ; $6EE7: $20 $04

    ld   a, $10                                   ; $6EE9: $3E $10
    ldh  [hActiveEntityTilesOffset], a            ; $6EEB: $E0 $F5

jr_006_6EED:
    ldh  a, [hRoomStatus]                         ; $6EED: $F0 $F8
    and  $20                                      ; $6EEF: $E6 $20
    jp   nz, func_006_65DB                        ; $6EF1: $C2 $DB $65

    ld   a, c                                     ; $6EF4: $79
    ld   [$D201], a                               ; $6EF5: $EA $01 $D2
    call func_006_6FEA                            ; $6EF8: $CD $EA $6F
    call func_006_64C6                            ; $6EFB: $CD $C6 $64
    ld   a, [$D202]                               ; $6EFE: $FA $02 $D2
    ld   e, a                                     ; $6F01: $5F
    ld   d, b                                     ; $6F02: $50

jr_006_6F03:
    ld   hl, wEntitiesStatusTable                 ; $6F03: $21 $80 $C2
    add  hl, de                                   ; $6F06: $19
    ld   a, [hl]                                  ; $6F07: $7E
    cp   $01                                      ; $6F08: $FE $01
    ret  z                                        ; $6F0A: $C8

    and  a                                        ; $6F0B: $A7
    jr   nz, jr_006_6F48                          ; $6F0C: $20 $3A

    call GetEntityTransitionCountdown             ; $6F0E: $CD $05 $0C
    jr   nz, jr_006_6F47                          ; $6F11: $20 $34

    ld   [hl], $03                                ; $6F13: $36 $03
    ld   hl, wEntitiesPrivateState1Table          ; $6F15: $21 $B0 $C2
    add  hl, bc                                   ; $6F18: $09
    ldh  a, [hActiveEntityPosX]                   ; $6F19: $F0 $EE
    ldh  [hScratch0], a                           ; $6F1B: $E0 $D7
    ld   e, [hl]                                  ; $6F1D: $5E
    inc  [hl]                                     ; $6F1E: $34
    ld   a, [hl]                                  ; $6F1F: $7E
    cp   $06                                      ; $6F20: $FE $06
    jr   nz, jr_006_6F3C                          ; $6F22: $20 $18

    call func_006_65DB                            ; $6F24: $CD $DB $65
    ld   hl, wEntitiesLoadOrderTable              ; $6F27: $21 $60 $C4
    add  hl, bc                                   ; $6F2A: $09
    ld   e, [hl]                                  ; $6F2B: $5E
    ld   d, b                                     ; $6F2C: $50
    ld   hl, data_3F48                            ; $6F2D: $21 $48 $3F
    add  hl, de                                   ; $6F30: $19
    ldh  a, [hMapRoom]                            ; $6F31: $F0 $F6
    ld   e, a                                     ; $6F33: $5F
    ld   d, b                                     ; $6F34: $50
    ld   a, [hl]                                  ; $6F35: $7E
    ld   hl, wEntitiesClearedRooms                ; $6F36: $21 $00 $CF
    add  hl, de                                   ; $6F39: $19
    or   [hl]                                     ; $6F3A: $B6
    ld   [hl], a                                  ; $6F3B: $77

jr_006_6F3C:
    ld   d, b                                     ; $6F3C: $50
    ld   hl, Data_006_6EDD                        ; $6F3D: $21 $DD $6E
    add  hl, de                                   ; $6F40: $19
    ld   a, [hl]                                  ; $6F41: $7E
    ldh  [hScratch1], a                           ; $6F42: $E0 $D8
    jp   label_006_7035                           ; $6F44: $C3 $35 $70

jr_006_6F47:
    ret                                           ; $6F47: $C9

jr_006_6F48:
    call func_C56                                 ; $6F48: $CD $56 $0C
    ldh  a, [hLinkPositionZ]                      ; $6F4B: $F0 $A2
    and  a                                        ; $6F4D: $A7
    jr   nz, jr_006_6F53                          ; $6F4E: $20 $03

    call label_3B39                               ; $6F50: $CD $39 $3B

jr_006_6F53:
    call func_006_654E                            ; $6F53: $CD $4E $65
    call label_3B23                               ; $6F56: $CD $23 $3B
    ld   hl, wEntitiesSpeedXTable                 ; $6F59: $21 $40 $C2
    add  hl, bc                                   ; $6F5C: $09
    ld   a, [hl]                                  ; $6F5D: $7E
    and  a                                        ; $6F5E: $A7
    jr   z, jr_006_6F86                           ; $6F5F: $28 $25

    bit  7, a                                     ; $6F61: $CB $7F
    jr   z, jr_006_6F67                           ; $6F63: $28 $02

    cpl                                           ; $6F65: $2F
    inc  a                                        ; $6F66: $3C

jr_006_6F67:
    ld   e, $04                                   ; $6F67: $1E $04
    cp   $08                                      ; $6F69: $FE $08
    jr   nc, jr_006_6F6F                          ; $6F6B: $30 $02

    ld   e, $08                                   ; $6F6D: $1E $08

jr_006_6F6F:
    cp   $04                                      ; $6F6F: $FE $04
    jr   nc, jr_006_6F75                          ; $6F71: $30 $02

    ld   e, $10                                   ; $6F73: $1E $10

jr_006_6F75:
    cp   $02                                      ; $6F75: $FE $02
    jr   nc, jr_006_6F7B                          ; $6F77: $30 $02

    ld   e, $20                                   ; $6F79: $1E $20

jr_006_6F7B:
    ld   d, b                                     ; $6F7B: $50
    ldh  a, [hFrameCounter]                       ; $6F7C: $F0 $E7
    and  e                                        ; $6F7E: $A3
    jr   z, jr_006_6F82                           ; $6F7F: $28 $01

    inc  d                                        ; $6F81: $14

jr_006_6F82:
    ld   a, d                                     ; $6F82: $7A
    call SetEntitySpriteVariant                   ; $6F83: $CD $0C $3B

jr_006_6F86:
    ldh  a, [hActiveEntityState]                  ; $6F86: $F0 $F0
    JP_TABLE                                      ; $6F88
._00 dw RollingBonesBarRestingHandler
._01 dw RollingBonesBarRollingHandler
._02 dw RollingBonesBarDeceleratingHandler

RollingBonesBarRestingHandler::
    ret

RollingBonesBarRollingHandler::
    ld   hl, wEntitiesCollisionsTable             ; $6F90: $21 $A0 $C2
    add  hl, bc                                   ; $6F93: $09
    ld   a, [hl]                                  ; $6F94: $7E
    and  $03                                      ; $6F95: $E6 $03
    jr   z, jr_006_6FB3                           ; $6F97: $28 $1A

    ld   hl, wEntitiesSpeedXTable                 ; $6F99: $21 $40 $C2
    add  hl, bc                                   ; $6F9C: $09
    ld   a, [hl]                                  ; $6F9D: $7E
    sra  a                                        ; $6F9E: $CB $2F
    cpl                                           ; $6FA0: $2F
    inc  a                                        ; $6FA1: $3C
    ld   [hl], a                                  ; $6FA2: $77
    ld   a, $20                                   ; $6FA3: $3E $20
    ld   [$C157], a                               ; $6FA5: $EA $57 $C1
    xor  a                                        ; $6FA8: $AF
    ld   [$C158], a                               ; $6FA9: $EA $58 $C1
    ld   a, $0B                                   ; $6FAC: $3E $0B
    ldh  [hJingle], a                             ; $6FAE: $E0 $F2
    call IncrementEntityState                     ; $6FB0: $CD $12 $3B

jr_006_6FB3:
    ld   a, [$D210]                               ; $6FB3: $FA $10 $D2
    inc  a                                        ; $6FB6: $3C
    cp   $09                                      ; $6FB7: $FE $09
    jr   c, jr_006_6FC0                           ; $6FB9: $38 $05

    ld   a, $1A                                   ; $6FBB: $3E $1A
    ldh  [hWaveSfx], a                            ; $6FBD: $E0 $F3
    xor  a                                        ; $6FBF: $AF

jr_006_6FC0:
    ld   [$D210], a                               ; $6FC0: $EA $10 $D2
    ret                                           ; $6FC3: $C9

RollingBonesBarDeceleratingHandler::
    ldh  a, [hFrameCounter]                       ; $6FC4: $F0 $E7
    and  $07                                      ; $6FC6: $E6 $07
    jr   nz, jr_006_6FD9                          ; $6FC8: $20 $0F

    ld   hl, wEntitiesSpeedXTable                 ; $6FCA: $21 $40 $C2

jr_006_6FCD:
    add  hl, bc                                   ; $6FCD: $09
    ld   a, [hl]                                  ; $6FCE: $7E
    and  a                                        ; $6FCF: $A7
    jr   z, jr_006_6FDA                           ; $6FD0: $28 $08

    and  $80                                      ; $6FD2: $E6 $80
    jr   z, jr_006_6FD8                           ; $6FD4: $28 $02

    inc  [hl]                                     ; $6FD6: $34
    inc  [hl]                                     ; $6FD7: $34

jr_006_6FD8:
    dec  [hl]                                     ; $6FD8: $35

jr_006_6FD9:
    ret                                           ; $6FD9: $C9

jr_006_6FDA:
    call IncrementEntityState                     ; $6FDA: $CD $12 $3B
    ld   [hl], b                                  ; $6FDD: $70
    call GetEntityTransitionCountdown             ; $6FDE: $CD $05 $0C
    ld   [hl], $50                                ; $6FE1: $36 $50
    ret                                           ; $6FE3: $C9

Data_006_6FE4::
    db    $80, $70, $60, $50, $40, $30

func_006_6FEA::
    ld   a, $20
    ldh  [$FFEC], a

.loop
    ld   de, Data_006_6ED5                        ; $6FEE: $11 $D5 $6E
    call RenderAnimatedActiveEntity               ; $6FF1: $CD $C0 $3B
    ldh  a, [$FFEC]                               ; $6FF4: $F0 $EC
    add  $10                                      ; $6FF6: $C6 $10
    ldh  [$FFEC], a                               ; $6FF8: $E0 $EC
    ld   hl, wEntitiesPrivateState1Table          ; $6FFA: $21 $B0 $C2
    add  hl, bc                                   ; $6FFD: $09
    ld   e, [hl]                                  ; $6FFE: $5E
    ld   d, b                                     ; $6FFF: $50
    ld   hl, Data_006_6FE4                        ; $7000: $21 $E4 $6F
    add  hl, de                                   ; $7003: $19
    cp   [hl]                                     ; $7004: $BE
    jr   nz, .loop                                ; $7005: $20 $E7

    jp   CopyEntityPositionToActivePosition       ; $7007: $C3 $8A $3D

func_006_700A::
    and  $07                                      ; $700A: $E6 $07
    ret  nz                                       ; $700C: $C0

    call GetRandomByte                            ; $700D: $CD $0D $28
    and  $1F                                      ; $7010: $E6 $1F
    sub  $10                                      ; $7012: $D6 $10
    ld   e, a                                     ; $7014: $5F
    ld   hl, hActiveEntityPosX                    ; $7015: $21 $EE $FF
    add  [hl]                                     ; $7018: $86
    ld   [hl], a                                  ; $7019: $77
    call GetRandomByte                            ; $701A: $CD $0D $28
    and  $1F                                      ; $701D: $E6 $1F
    sub  $14                                      ; $701F: $D6 $14
    ld   e, a                                     ; $7021: $5F
    ld   hl, $FFEC                    ; $7022: $21 $EC $FF
    add  [hl]                                     ; $7025: $86
    ld   [hl], a                                  ; $7026: $77
    jp   label_006_702A                           ; $7027: $C3 $2A $70

label_006_702A:
    call func_006_64CC                            ; $702A: $CD $CC $64
    ldh  a, [hActiveEntityPosX]                   ; $702D: $F0 $EE
    ldh  [hScratch0], a                           ; $702F: $E0 $D7
    ldh  a, [$FFEC]                               ; $7031: $F0 $EC
    ldh  [hScratch1], a                           ; $7033: $E0 $D8

label_006_7035:
    ld   a, TRANSCIENT_VFX_POOF                   ; $7035: $3E $02
    call AddTranscientVfx                         ; $7037: $CD $C7 $0C
    ld   a, $13                                   ; $703A: $3E $13
    ldh  [hNoiseSfx], a                           ; $703C: $E0 $F4
    ret                                           ; $703E: $C9

    ld   a, $36                                   ; $703F: $3E $36
    call SpawnNewEntity_trampoline                ; $7041: $CD $86 $3B
    ldh  a, [hScratch0]                           ; $7044: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7046: $21 $00 $C2
    add  hl, de                                   ; $7049: $19
    ld   [hl], a                                  ; $704A: $77
    ldh  a, [hScratch1]                           ; $704B: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $704D: $21 $10 $C2
    add  hl, de                                   ; $7050: $19
    ld   [hl], a                                  ; $7051: $77
    ldh  a, [hIsSideScrolling]                    ; $7052: $F0 $F9
    and  a                                        ; $7054: $A7
    jr   z, jr_006_705F                           ; $7055: $28 $08

    ld   hl, wEntitiesSpeedYTable                 ; $7057: $21 $50 $C2
    add  hl, bc                                   ; $705A: $09
    ld   [hl], $F0                                ; $705B: $36 $F0
    jr   jr_006_706B                              ; $705D: $18 $0C

jr_006_705F:
    ld   hl, wEntitiesSpeedZTable                 ; $705F: $21 $20 $C3
    add  hl, de                                   ; $7062: $19
    ld   [hl], $10                                ; $7063: $36 $10
    ld   hl, wEntitiesPosZTable                   ; $7065: $21 $10 $C3
    add  hl, de                                   ; $7068: $19
    ld   [hl], $08                                ; $7069: $36 $08

jr_006_706B:
    call func_006_65DB                            ; $706B: $CD $DB $65
    jp   PlayBombExplosionSfx                     ; $706E: $C3 $4B $0C

Data_006_7071::
    db   $F0, $FC, $50, $01, $F0, $04, $52, $01, $F0, $0C, $54, $01, $00, $FC, $56, $01
    db   $00, $04, $58, $01, $00, $0C, $5A, $01

Data_006_7089::
    db   $F0, $FC, $50, $01, $F0, $04, $52, $01, $F0, $0C, $54, $01, $00, $FC, $5C, $01
    db   $00, $04, $58, $01, $00, $0C, $5E, $01

Data_006_70A1::
    db   $A8, $14

Data_006_70A3::
    db   $01, $FF

Data_006_70A5::
    db   $18, $E8

BigFairyEntityHandler::
    ld   a, [wIsIndoor]                           ; $70A7: $FA $A5 $DB
    and  a                                        ; $70AA: $A7
    jr   z, jr_006_70B8                           ; $70AB: $28 $0B

    ldh  a, [hMapId]                              ; $70AD: $F0 $F7
    cp   $FF                                      ; $70AF: $FE $FF
    jr   nz, jr_006_70B8                          ; $70B1: $20 $05

    ld   a, $06                                   ; $70B3: $3E $06
    jp   func_036_505F_trampoline                 ; $70B5: $C3 $47 $0A

jr_006_70B8:
    ld   hl, wEntitiesUnknownTableD               ; $70B8: $21 $D0 $C2
    add  hl, bc                                   ; $70BB: $09
    ld   a, [hl]                                  ; $70BC: $7E
    and  a                                        ; $70BD: $A7
    jp   z, label_006_7123                        ; $70BE: $CA $23 $71

    ld   hl, wEntitiesStatusTable                 ; $70C1: $21 $80 $C2
    ld   a, [$D201]                               ; $70C4: $FA $01 $D2
    ld   e, a                                     ; $70C7: $5F
    ld   d, b                                     ; $70C8: $50
    add  hl, de                                   ; $70C9: $19
    ld   a, [hl]                                  ; $70CA: $7E
    and  a                                        ; $70CB: $A7
    jp   z, func_006_65DB                         ; $70CC: $CA $DB $65

    ld   a, [$D202]                               ; $70CF: $FA $02 $D2
    ldh  [hActiveEntitySpriteVariant], a          ; $70D2: $E0 $F1
    ld   de, Data_006_70A1                        ; $70D4: $11 $A1 $70
    call RenderSimpleEntityWithSpriteVariantToOAM ; $70D7: $CD $77 $3C
    ldh  a, [hFrameCounter]                       ; $70DA: $F0 $E7
    and  $01                                      ; $70DC: $E6 $01
    jr   nz, jr_006_7120                          ; $70DE: $20 $40

    ld   hl, wEntitiesPrivateState1Table          ; $70E0: $21 $B0 $C2
    add  hl, bc                                   ; $70E3: $09
    ld   e, [hl]                                  ; $70E4: $5E
    ld   d, b                                     ; $70E5: $50
    ld   hl, Data_006_70A3                        ; $70E6: $21 $A3 $70
    add  hl, de                                   ; $70E9: $19
    ld   a, [hl]                                  ; $70EA: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $70EB: $21 $40 $C2
    add  hl, bc                                   ; $70EE: $09
    add  [hl]                                     ; $70EF: $86
    ld   [hl], a                                  ; $70F0: $77
    ld   hl, Data_006_70A5                        ; $70F1: $21 $A5 $70
    add  hl, de                                   ; $70F4: $19
    cp   [hl]                                     ; $70F5: $BE
    jr   nz, jr_006_7100                          ; $70F6: $20 $08

    ld   hl, wEntitiesPrivateState1Table          ; $70F8: $21 $B0 $C2
    add  hl, bc                                   ; $70FB: $09
    ld   a, [hl]                                  ; $70FC: $7E
    xor  $01                                      ; $70FD: $EE $01
    ld   [hl], a                                  ; $70FF: $77

jr_006_7100:
    ld   hl, wEntitiesPrivateState2Table          ; $7100: $21 $C0 $C2
    add  hl, bc                                   ; $7103: $09
    ld   e, [hl]                                  ; $7104: $5E
    ld   d, b                                     ; $7105: $50
    ld   hl, Data_006_70A3                        ; $7106: $21 $A3 $70
    add  hl, de                                   ; $7109: $19
    ld   a, [hl]                                  ; $710A: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $710B: $21 $50 $C2
    add  hl, bc                                   ; $710E: $09
    add  [hl]                                     ; $710F: $86
    ld   [hl], a                                  ; $7110: $77
    ld   hl, Data_006_70A5                        ; $7111: $21 $A5 $70
    add  hl, de                                   ; $7114: $19
    cp   [hl]                                     ; $7115: $BE
    jr   nz, jr_006_7120                          ; $7116: $20 $08

    ld   hl, wEntitiesPrivateState2Table          ; $7118: $21 $C0 $C2
    add  hl, bc                                   ; $711B: $09
    ld   a, [hl]                                  ; $711C: $7E
    xor  $01                                      ; $711D: $EE $01
    ld   [hl], a                                  ; $711F: $77

jr_006_7120:
    jp   func_006_6541                            ; $7120: $C3 $41 $65

label_006_7123:
    ld   hl, Data_006_7071                        ; $7123: $21 $71 $70
    ldh  a, [hFrameCounter]                       ; $7126: $F0 $E7
    and  $08                                      ; $7128: $E6 $08
    jr   z, jr_006_712F                           ; $712A: $28 $03

    ld   hl, Data_006_7089                        ; $712C: $21 $89 $70

jr_006_712F:
    ld   c, $06                                   ; $712F: $0E $06
    call func_3CE6                                ; $7131: $CD $E6 $3C
    ld   a, $06                                   ; $7134: $3E $06
    call label_3DA0                               ; $7136: $CD $A0 $3D
    call label_3CD9                               ; $7139: $CD $D9 $3C
    ld   e, $FE                                   ; $713C: $1E $FE
    ld   hl, wEntitiesUnknowTableY                ; $713E: $21 $D0 $C3
    add  hl, bc                                   ; $7141: $09
    inc  [hl]                                     ; $7142: $34
    ld   a, [hl]                                  ; $7143: $7E
    and  $40                                      ; $7144: $E6 $40
    jr   z, jr_006_714A                           ; $7146: $28 $02

    ld   e, $02                                   ; $7148: $1E $02

jr_006_714A:
    ld   hl, wEntitiesSpeedZTable                 ; $714A: $21 $20 $C3
    add  hl, bc                                   ; $714D: $09
    ld   [hl], e                                  ; $714E: $73
    call func_006_657A                            ; $714F: $CD $7A $65
    call func_006_64C6                            ; $7152: $CD $C6 $64
    ldh  a, [hActiveEntityState]                  ; $7155: $F0 $F0
    JP_TABLE                                      ; $7157
._00 dw BigFairyWaitingHandler
._01 dw BigFairyHealingHandler
._02 dw BigFairyDisappearingHandler

BigFairyWaitingHandler::
    xor  a                                        ; $715E: $AF
    ld   [$D202], a                               ; $715F: $EA $02 $D2
    ld   a, c                                     ; $7162: $79
    ld   [$D201], a                               ; $7163: $EA $01 $D2
    ldh  a, [hLinkPositionX]                      ; $7166: $F0 $98
    sub  $50                                      ; $7168: $D6 $50
    add  $08                                      ; $716A: $C6 $08
    cp   $10                                      ; $716C: $FE $10
    ret  nc                                       ; $716E: $D0

    ldh  a, [hLinkPositionY]                      ; $716F: $F0 $99
    sub  $58                                      ; $7171: $D6 $58
    add  $08                                      ; $7173: $C6 $08
    cp   $10                                      ; $7175: $FE $10
    ret  nc                                       ; $7177: $D0

    call IncrementEntityState                     ; $7178: $CD $12 $3B
    call IsEntityDropTimerZero                    ; $717B: $CD $FB $0B
    ld   [hl], $48                                ; $717E: $36 $48
    jp_open_dialog $024                           ; $7180

BigFairyHealingHandler::
    call IsEntityDropTimerZero                    ; $7185: $CD $FB $0B
    jr   nz, jr_006_7197                          ; $7188: $20 $0D

    call GetEntityTransitionCountdown             ; $718A: $CD $05 $0C
    ld   [hl], $48                                ; $718D: $36 $48
    call IncrementEntityState                     ; $718F: $CD $12 $3B
    ld   a, $26                                   ; $7192: $3E $26
    ldh  [hJingle], a                             ; $7194: $E0 $F2
    ret                                           ; $7196: $C9

jr_006_7197:
    ld   a, $02                                   ; $7197: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7199: $E0 $A1
    ld   a, $1A                                   ; $719B: $3E $1A
    ldh  [hJingle], a                             ; $719D: $E0 $F2
    call func_006_64C6                            ; $719F: $CD $C6 $64
    ld   hl, wEntitiesUnknowTableG                ; $71A2: $21 $00 $C3
    add  hl, bc                                   ; $71A5: $09
    ld   a, [hl]                                  ; $71A6: $7E
    and  a                                        ; $71A7: $A7
    jr   nz, jr_006_71BA                          ; $71A8: $20 $10

    ld   [hl], $01                                ; $71AA: $36 $01
    ld   hl, wEntitiesPrivateState1Table          ; $71AC: $21 $B0 $C2
    add  hl, bc                                   ; $71AF: $09
    ld   a, [hl]                                  ; $71B0: $7E
    cp   $04                                      ; $71B1: $FE $04
    jr   c, jr_006_71BA                           ; $71B3: $38 $05

    ld   a, $04                                   ; $71B5: $3E $04
    ld   [wSubstractRupeeBufferLow], a            ; $71B7: $EA $93 $DB

jr_006_71BA:
    call IsEntityUnknownFZero                     ; $71BA: $CD $00 $0C
    jr   nz, jr_006_71F0                          ; $71BD: $20 $31

    ld   [hl], $13                                ; $71BF: $36 $13
    ld   hl, wEntitiesPrivateState1Table          ; $71C1: $21 $B0 $C2
    add  hl, bc                                   ; $71C4: $09
    ld   a, [hl]                                  ; $71C5: $7E
    cp   $0A                                      ; $71C6: $FE $0A
    jr   z, jr_006_71F0                           ; $71C8: $28 $26

    inc  [hl]                                     ; $71CA: $34
    ld   a, $84                                   ; $71CB: $3E $84
    call SpawnNewEntity_trampoline                ; $71CD: $CD $86 $3B
    jr   c, jr_006_71F0                           ; $71D0: $38 $1E

    ld   hl, wEntitiesUnknownTableD               ; $71D2: $21 $D0 $C2
    add  hl, de                                   ; $71D5: $19
    ld   [hl], $01                                ; $71D6: $36 $01
    ldh  a, [hScratch0]                           ; $71D8: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $71DA: $21 $00 $C2
    add  hl, de                                   ; $71DD: $19
    add  $00                                      ; $71DE: $C6 $00
    ld   [hl], a                                  ; $71E0: $77
    ldh  a, [hScratch1]                           ; $71E1: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $71E3: $21 $10 $C2
    add  hl, de                                   ; $71E6: $19
    sub  $0E                                      ; $71E7: $D6 $0E
    ld   [hl], a                                  ; $71E9: $77
    ld   hl, wEntitiesSpeedXTable                 ; $71EA: $21 $40 $C2
    add  hl, de                                   ; $71ED: $19
    ld   [hl], $E8                                ; $71EE: $36 $E8

jr_006_71F0:
    ret                                           ; $71F0: $C9

BigFairyDisappearingHandler::
    call GetEntityTransitionCountdown             ; $71F1: $CD $05 $0C
    jp   z, func_006_65DB                         ; $71F4: $CA $DB $65

    ldh  a, [hFrameCounter]                       ; $71F7: $F0 $E7
    and  $02                                      ; $71F9: $E6 $02
    ld   a, $00                                   ; $71FB: $3E $00
    jr   z, jr_006_7201                           ; $71FD: $28 $02

    ld   a, $FF                                   ; $71FF: $3E $FF

jr_006_7201:
    ld   [$D202], a                               ; $7201: $EA $02 $D2
    call SetEntitySpriteVariant                   ; $7204: $CD $0C $3B
    ld   a, $02                                   ; $7207: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7209: $E0 $A1
    ret                                           ; $720B: $C9

Data_006_720C::
    db   $68, $01, $6A, $01, $64, $01, $66, $01, $6C, $01, $6E, $01, $6A, $21, $68, $21
    db   $66, $21, $64, $21, $6E, $21, $6C, $21

Data_006_7224::
    db   $68, $00, $6A, $00, $64, $00, $66, $00, $6C, $00, $6E, $00, $6A, $20, $68, $20
    db   $66, $20, $64, $20, $6E, $20, $6C, $20

MrWriteBirdEntityHandler::
    ld   hl, wEntitiesDirectionTable              ; $723C: $21 $80 $C3
    add  hl, bc                                   ; $723F: $09
    ldh  a, [hActiveEntitySpriteVariant]          ; $7240: $F0 $F1
    add  [hl]                                     ; $7242: $86
    ldh  [hActiveEntitySpriteVariant], a          ; $7243: $E0 $F1
    ld   hl, wEntitiesSpeedXTable                 ; $7245: $21 $40 $C2
    add  hl, bc                                   ; $7248: $09
    ld   a, [hl]                                  ; $7249: $7E
    and  a                                        ; $724A: $A7
    jr   z, jr_006_725A                           ; $724B: $28 $0D

    and  $80                                      ; $724D: $E6 $80
    ld   a, $00                                   ; $724F: $3E $00
    jr   nz, jr_006_7255                          ; $7251: $20 $02

    ld   a, $03                                   ; $7253: $3E $03

jr_006_7255:
    ld   hl, wEntitiesDirectionTable              ; $7255: $21 $80 $C3
    add  hl, bc                                   ; $7258: $09
    ld   [hl], a                                  ; $7259: $77

jr_006_725A:
    ld   de, Data_006_720C                        ; $725A: $11 $0C $72
    ldh  a, [hMapRoom]                            ; $725D: $F0 $F6
    cp   $D9                                      ; $725F: $FE $D9
    jr   nz, jr_006_7266                          ; $7261: $20 $03

    ld   de, Data_006_7224                        ; $7263: $11 $24 $72

jr_006_7266:
    call RenderAnimatedActiveEntity               ; $7266: $CD $C0 $3B
    call func_006_64C6                            ; $7269: $CD $C6 $64
    ld   a, [wIsIndoor]                           ; $726C: $FA $A5 $DB
    and  a                                        ; $726F: $A7
    jp   z, label_006_7372                        ; $7270: $CA $72 $73

    call func_006_657A                            ; $7273: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $7276: $21 $20 $C3
    add  hl, bc                                   ; $7279: $09
    dec  [hl]                                     ; $727A: $35
    ld   hl, wEntitiesPosZTable                   ; $727B: $21 $10 $C3
    add  hl, bc                                   ; $727E: $09
    ld   a, [hl]                                  ; $727F: $7E
    and  $80                                      ; $7280: $E6 $80
    ldh  [hFFE8], a                               ; $7282: $E0 $E8
    jr   z, jr_006_728C                           ; $7284: $28 $06

    ld   [hl], b                                  ; $7286: $70
    ld   hl, wEntitiesPosZTable                   ; $7287: $21 $10 $C3
    add  hl, bc                                   ; $728A: $09
    ld   [hl], b                                  ; $728B: $70

jr_006_728C:
    ldh  a, [hActiveEntityState]                  ; $728C: $F0 $F0
    JP_TABLE                                      ; $728E
._00 dw MrWriteBirdState0Handler
._01 dw MrWriteBirdState1Handler
._02 dw MrWriteBirdState2Handler

Data_006_7295::
    db   $02, $06, $08, $06, $FE, $FA, $F8, $FA

MrWriteBirdState0Handler::
    call func_006_7335                            ; $729D: $CD $35 $73
    xor  a                                        ; $72A0: $AF
    call SetEntitySpriteVariant                   ; $72A1: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $72A4: $CD $05 $0C

jr_006_72A7:
    jr   nz, jr_006_72E0                          ; $72A7: $20 $37

    call GetRandomByte                            ; $72A9: $CD $0D $28
    and  $07                                      ; $72AC: $E6 $07
    ld   e, a                                     ; $72AE: $5F
    ld   d, b                                     ; $72AF: $50
    ld   hl, Data_006_7295                        ; $72B0: $21 $95 $72
    add  hl, de                                   ; $72B3: $19
    ld   a, [hl]                                  ; $72B4: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $72B5: $21 $40 $C2
    add  hl, bc                                   ; $72B8: $09
    ld   [hl], a                                  ; $72B9: $77
    ld   a, e                                     ; $72BA: $7B
    and  $04                                      ; $72BB: $E6 $04
    ld   hl, wEntitiesDirectionTable              ; $72BD: $21 $80 $C3
    add  hl, bc                                   ; $72C0: $09
    ld   [hl], a                                  ; $72C1: $77
    call GetRandomByte                            ; $72C2: $CD $0D $28
    and  $07                                      ; $72C5: $E6 $07
    ld   e, a                                     ; $72C7: $5F
    ld   hl, Data_006_7295                        ; $72C8: $21 $95 $72
    add  hl, de                                   ; $72CB: $19
    ld   a, [hl]                                  ; $72CC: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $72CD: $21 $50 $C2
    add  hl, bc                                   ; $72D0: $09
    ld   [hl], a                                  ; $72D1: $77
    call GetEntityTransitionCountdown             ; $72D2: $CD $05 $0C
    call GetRandomByte                            ; $72D5: $CD $0D $28
    and  $1F                                      ; $72D8: $E6 $1F
    add  $20                                      ; $72DA: $C6 $20
    ld   [hl], a                                  ; $72DC: $77
    call IncrementEntityState                     ; $72DD: $CD $12 $3B

jr_006_72E0:
    jp   label_006_7308                           ; $72E0: $C3 $08 $73

MrWriteBirdState1Handler::
    call func_006_7335                            ; $72E3: $CD $35 $73
    call func_006_6541                            ; $72E6: $CD $41 $65
    call label_3B23                               ; $72E9: $CD $23 $3B
    ldh  a, [hFFE8]                               ; $72EC: $F0 $E8
    and  a                                        ; $72EE: $A7
    jr   z, label_006_7308                        ; $72EF: $28 $17

    call GetEntityTransitionCountdown             ; $72F1: $CD $05 $0C
    jr   nz, jr_006_72FD                          ; $72F4: $20 $07

    ld   [hl], $30                                ; $72F6: $36 $30
    call IncrementEntityState                     ; $72F8: $CD $12 $3B
    ld   [hl], b                                  ; $72FB: $70
    ret                                           ; $72FC: $C9

jr_006_72FD:
    ld   hl, wEntitiesSpeedZTable                 ; $72FD: $21 $20 $C3
    add  hl, bc                                   ; $7300: $09
    ld   [hl], $08                                ; $7301: $36 $08
    ld   hl, wEntitiesPosZTable                   ; $7303: $21 $10 $C3
    add  hl, bc                                   ; $7306: $09
    inc  [hl]                                     ; $7307: $34

label_006_7308:
    ldh  a, [hFrameCounter]                       ; $7308: $F0 $E7
    rra                                           ; $730A: $1F
    rra                                           ; $730B: $1F
    rra                                           ; $730C: $1F
    and  $01                                      ; $730D: $E6 $01
    jp   SetEntitySpriteVariant                   ; $730F: $C3 $0C $3B

MrWriteBirdState2Handler::
    call func_006_6541                            ; $7312: $CD $41 $65
    call label_3B23                               ; $7315: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $7318: $F0 $E7
    and  $01                                      ; $731A: $E6 $01
    jr   nz, jr_006_7323                          ; $731C: $20 $05

    ld   hl, wEntitiesSpeedZTable                 ; $731E: $21 $20 $C3
    add  hl, bc                                   ; $7321: $09
    inc  [hl]                                     ; $7322: $34

jr_006_7323:
    ldh  a, [hFFE8]                               ; $7323: $F0 $E8
    and  a                                        ; $7325: $A7
    jr   z, jr_006_732C                           ; $7326: $28 $04

    call IncrementEntityState                     ; $7328: $CD $12 $3B
    ld   [hl], b                                  ; $732B: $70

jr_006_732C:
    ldh  a, [hFrameCounter]                       ; $732C: $F0 $E7
    rra                                           ; $732E: $1F
    and  $02                                      ; $732F: $E6 $02
    call SetEntitySpriteVariant                   ; $7331: $CD $0C $3B
    ret                                           ; $7334: $C9

func_006_7335::
    ld   a, [wSwordAnimationState]                ; $7335: $FA $37 $C1
    cp   $02                                      ; $7338: $FE $02
    jr   nz, jr_006_7371                          ; $733A: $20 $35

    call func_006_6594                            ; $733C: $CD $94 $65
    add  $18                                      ; $733F: $C6 $18
    cp   $30                                      ; $7341: $FE $30
    jr   nc, jr_006_7371                          ; $7343: $30 $2C

    call func_006_65A4                            ; $7345: $CD $A4 $65
    add  $18                                      ; $7348: $C6 $18
    cp   $30                                      ; $734A: $FE $30
    jr   nc, jr_006_7371                          ; $734C: $30 $23

    call IncrementEntityState                     ; $734E: $CD $12 $3B
    ld   [hl], $02                                ; $7351: $36 $02
    ld   a, $10                                   ; $7353: $3E $10
    call GetVectorTowardsLink_trampoline          ; $7355: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $7358: $F0 $D7
    cpl                                           ; $735A: $2F
    inc  a                                        ; $735B: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $735C: $21 $50 $C2
    add  hl, bc                                   ; $735F: $09
    ld   [hl], a                                  ; $7360: $77
    ldh  a, [hScratch1]                           ; $7361: $F0 $D8
    cpl                                           ; $7363: $2F
    inc  a                                        ; $7364: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $7365: $21 $40 $C2
    add  hl, bc                                   ; $7368: $09
    ld   [hl], a                                  ; $7369: $77
    ld   hl, wEntitiesSpeedZTable                 ; $736A: $21 $20 $C3
    add  hl, bc                                   ; $736D: $09
    ld   [hl], $0C                                ; $736E: $36 $0C
    pop  af                                       ; $7370: $F1

jr_006_7371:
    ret                                           ; $7371: $C9

label_006_7372:
    ret                                           ; $7372: $C9

Data_006_7373::
    db   $70, $01, $70, $21, $72, $01, $72, $21

PolsVoiceEntityHandler::
    ld   a, [wLinkPlayingOcarinaCountdown]        ; $737B: $FA $66 $C1
    cp   $01                                      ; $737E: $FE $01
    jr   nz, jr_006_73AD                          ; $7380: $20 $2B

    ld   a, [wOcarinaSongFlags]                   ; $7382: $FA $49 $DB
    and  $04                                      ; $7385: $E6 $04
    jr   z, jr_006_73AD                           ; $7387: $28 $24

    ld   a, [$DB4A]                               ; $7389: $FA $4A $DB
    and  a                                        ; $738C: $A7
    jr   nz, jr_006_73AD                          ; $738D: $20 $1E

    ldh  a, [hActiveEntityStatus]                 ; $738F: $F0 $EA
    cp   $01                                      ; $7391: $FE $01
    jr   z, jr_006_73AD                           ; $7393: $28 $18

    ld   hl, wEntitiesUnknowTableV                ; $7395: $21 $80 $C4
    add  hl, bc                                   ; $7398: $09
    ld   [hl], $1F                                ; $7399: $36 $1F
    ld   hl, wEntitiesStatusTable                 ; $739B: $21 $80 $C2
    add  hl, bc                                   ; $739E: $09
    ld   [hl], $01                                ; $739F: $36 $01
    ld   hl, wEntitiesPhysicsFlagsTable           ; $73A1: $21 $40 $C3
    add  hl, bc                                   ; $73A4: $09
    ld   [hl], $04                                ; $73A5: $36 $04
    ld   hl, hNoiseSfx                            ; $73A7: $21 $F4 $FF
    ld   [hl], $13                                ; $73AA: $36 $13
    ret                                           ; $73AC: $C9

jr_006_73AD:
    ld   de, Data_006_7373                        ; $73AD: $11 $73 $73
    call RenderAnimatedActiveEntity               ; $73B0: $CD $C0 $3B
    call func_006_64C6                            ; $73B3: $CD $C6 $64
    call func_006_64F7                            ; $73B6: $CD $F7 $64
    call func_006_6541                            ; $73B9: $CD $41 $65
    ld   hl, wEntitiesUnknowTableT                ; $73BC: $21 $10 $C4
    add  hl, bc                                   ; $73BF: $09
    ld   [hl], $01                                ; $73C0: $36 $01
    push hl                                       ; $73C2: $E5
    call label_3B23                               ; $73C3: $CD $23 $3B
    pop  hl                                       ; $73C6: $E1
    ld   [hl], b                                  ; $73C7: $70
    call label_3B39                               ; $73C8: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $73CB: $F0 $F0
    and  $01                                      ; $73CD: $E6 $01
    JP_TABLE                                      ; $73CF
._00 dw func_006_73E0                             ; $73D0
._01 dw func_006_7423                             ; $73D2

Data_006_73D4::
    db   $08, $08, $F8, $F8, $04, $FC

Data_006_73DA::
    db   $FC, $04, $FC, $04, $08, $F8

func_006_73E0::
    ld   hl, wEntitiesSpriteVariantTable          ; $73E0: $21 $B0 $C3
    add  hl, bc                                   ; $73E3: $09
    ld   [hl], $01                                ; $73E4: $36 $01
    call GetEntityTransitionCountdown             ; $73E6: $CD $05 $0C
    ret  nz                                       ; $73E9: $C0

    call IncrementEntityState                     ; $73EA: $CD $12 $3B
    call GetRandomByte                            ; $73ED: $CD $0D $28
    and  $07                                      ; $73F0: $E6 $07
    add  $10                                      ; $73F2: $C6 $10
    ld   hl, wEntitiesSpeedZTable                 ; $73F4: $21 $20 $C3
    add  hl, bc                                   ; $73F7: $09
    ld   [hl], a                                  ; $73F8: $77
    call GetRandomByte                            ; $73F9: $CD $0D $28
    and  $07                                      ; $73FC: $E6 $07
    cp   $06                                      ; $73FE: $FE $06
    jr   c, jr_006_7409                           ; $7400: $38 $07

    ld   a, $0A                                   ; $7402: $3E $0A
    call ApplyVectorTowardsLink_trampoline        ; $7404: $CD $AA $3B
    jr   jr_006_741F                              ; $7407: $18 $16

jr_006_7409:
    ld   e, a                                     ; $7409: $5F
    ld   d, b                                     ; $740A: $50
    ld   hl, Data_006_73D4                        ; $740B: $21 $D4 $73
    add  hl, de                                   ; $740E: $19
    ld   a, [hl]                                  ; $740F: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7410: $21 $40 $C2
    add  hl, bc                                   ; $7413: $09
    ld   [hl], a                                  ; $7414: $77
    ld   hl, Data_006_73DA                        ; $7415: $21 $DA $73
    add  hl, de                                   ; $7418: $19
    ld   a, [hl]                                  ; $7419: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $741A: $21 $50 $C2
    add  hl, bc                                   ; $741D: $09
    ld   [hl], a                                  ; $741E: $77

jr_006_741F:
    xor  a                                        ; $741F: $AF
    jp   SetEntitySpriteVariant                   ; $7420: $C3 $0C $3B

func_006_7423::
    call func_006_657A                            ; $7423: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $7426: $21 $20 $C3
    add  hl, bc                                   ; $7429: $09
    dec  [hl]                                     ; $742A: $35
    ld   hl, wEntitiesPosZTable                   ; $742B: $21 $10 $C3
    add  hl, bc                                   ; $742E: $09
    ld   a, [hl]                                  ; $742F: $7E
    and  $80                                      ; $7430: $E6 $80
    ret  z                                        ; $7432: $C8

    xor  a                                        ; $7433: $AF
    ld   [hl], a                                  ; $7434: $77
    call IncrementEntityState                     ; $7435: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $7438: $CD $05 $0C
    call GetRandomByte                            ; $743B: $CD $0D $28
    and  $0F                                      ; $743E: $E6 $0F
    add  $18                                      ; $7440: $C6 $18
    ld   [hl], a                                  ; $7442: $77
    jp   ClearEntitySpeed                         ; $7443: $C3 $7F $3D

Data_006_7446::
    db   $60, $07, $62, $07, $64, $07, $66, $07

ArmosStatueEntityHandler::
    ld   de, Data_006_7446                        ; $744E: $11 $46 $74
    call RenderAnimatedActiveEntity               ; $7451: $CD $C0 $3B
    call func_006_64C6                            ; $7454: $CD $C6 $64
    call func_006_64F7                            ; $7457: $CD $F7 $64
    xor  a                                        ; $745A: $AF
    ldh  [hFFE8], a                               ; $745B: $E0 $E8
    call label_3B70                               ; $745D: $CD $70 $3B
    call CheckLinkCollisionWithEnemy_trampoline   ; $7460: $CD $5A $3B
    jr   nc, jr_006_7472                          ; $7463: $30 $0D

    ld   a, $01                                   ; $7465: $3E $01
    ldh  [hFFE8], a                               ; $7467: $E0 $E8
    ldh  a, [hActiveEntityState]                  ; $7469: $F0 $F0
    cp   $02                                      ; $746B: $FE $02
    jr   nc, jr_006_7472                          ; $746D: $30 $03

    call CopyLinkFinalPositionToPosition          ; $746F: $CD $BE $0C

jr_006_7472:
    call func_006_6541                            ; $7472: $CD $41 $65
    call label_3B23                               ; $7475: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $7478: $F0 $F0
    JP_TABLE                                      ; $747A
._00 dw ArmosStatueState0Handler
._01 dw ArmosStatueState1Handler
._02 dw ArmosStatueState2Handler

ArmosStatueState0Handler::
    ldh  a, [hFFE8]
    and  a
    jr   z, .return                              ; $7484: $28 $0E

    call IncrementEntityState                     ; $7486: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $7489: $CD $05 $0C
    ld   [hl], $30                                ; $748C: $36 $30
    ld   hl, wEntitiesFlashCountdownTable         ; $748E: $21 $20 $C4
    add  hl, bc                                   ; $7491: $09
    ld   [hl], $18                                ; $7492: $36 $18

.return
    ret                                           ; $7494: $C9

ArmosStatueState1Handler::
    call GetEntityTransitionCountdown             ; $7495: $CD $05 $0C
    jr   nz, jr_006_74B2                          ; $7498: $20 $18

    call IncrementEntityState                     ; $749A: $CD $12 $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ; $749D: $21 $40 $C3
    add  hl, bc                                   ; $74A0: $09
    res  7, [hl]                                  ; $74A1: $CB $BE
    ld   hl, wEntitiesHitboxFlagsTable            ; $74A3: $21 $50 $C3
    add  hl, bc                                   ; $74A6: $09
    res  7, [hl]                                  ; $74A7: $CB $BE
    ld   hl, wEntitiesUnknowTableH                ; $74A9: $21 $30 $C4
    add  hl, bc                                   ; $74AC: $09
    res  6, [hl]                                  ; $74AD: $CB $B6
    jp   ClearEntitySpeed                         ; $74AF: $C3 $7F $3D

jr_006_74B2:
    ld   e, $08                                   ; $74B2: $1E $08
    and  $04                                      ; $74B4: $E6 $04
    jr   z, jr_006_74BA                           ; $74B6: $28 $02

    ld   e, $F8                                   ; $74B8: $1E $F8

jr_006_74BA:
    ld   hl, wEntitiesSpeedXTable                 ; $74BA: $21 $40 $C2
    add  hl, bc                                   ; $74BD: $09
    ld   [hl], e                                  ; $74BE: $73
    ret                                           ; $74BF: $C9

Data_006_74C0::
    db   $F8, $FA

Data_006_74C2::
    db   $00, $06, $08, $06, $00, $FA, $F8, $FA

ArmosStatueState2Handler::
    call GetEntityTransitionCountdown             ; $74CA: $CD $05 $0C
    jr   nz, jr_006_74EF                          ; $74CD: $20 $20

    call GetRandomByte                            ; $74CF: $CD $0D $28
    and  $3F                                      ; $74D2: $E6 $3F
    add  $20                                      ; $74D4: $C6 $20
    ld   [hl], a                                  ; $74D6: $77
    and  $07                                      ; $74D7: $E6 $07
    ld   e, a                                     ; $74D9: $5F
    ld   d, b                                     ; $74DA: $50
    ld   hl, Data_006_74C2                        ; $74DB: $21 $C2 $74
    add  hl, de                                   ; $74DE: $19
    ld   a, [hl]                                  ; $74DF: $7E

jr_006_74E0:
    ld   hl, wEntitiesSpeedXTable                 ; $74E0: $21 $40 $C2
    add  hl, bc                                   ; $74E3: $09
    ld   [hl], a                                  ; $74E4: $77
    ld   hl, Data_006_74C0                        ; $74E5: $21 $C0 $74
    add  hl, de                                   ; $74E8: $19
    ld   a, [hl]                                  ; $74E9: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $74EA: $21 $50 $C2
    add  hl, bc                                   ; $74ED: $09
    ld   [hl], a                                  ; $74EE: $77

jr_006_74EF:
    ldh  a, [hFrameCounter]                       ; $74EF: $F0 $E7
    rra                                           ; $74F1: $1F
    rra                                           ; $74F2: $1F
    rra                                           ; $74F3: $1F
    rra                                           ; $74F4: $1F
    and  $01                                      ; $74F5: $E6 $01
    jp   SetEntitySpriteVariant                   ; $74F7: $C3 $0C $3B

Data_006_74FA::
    db   $50, $02, $50, $22

Data_006_74FE::
    db   $20, $E0, $00, $00

Data_006_7502::
    db   $F8, $08, $00, $00

Data_006_7506::
    db   $00, $00, $E0, $20

Data_006_750A::
    db   $00, $00, $08, $F8, $30, $20

SpikeTrapEntityHandler::
    ld   a, $01                                   ; $7510: $3E $01
    ldh  [$FFBE], a                               ; $7512: $E0 $BE
    ld   de, Data_006_74FA                        ; $7514: $11 $FA $74
    call RenderAnimatedActiveEntity               ; $7517: $CD $C0 $3B
    call func_006_64C6                            ; $751A: $CD $C6 $64
    call func_C56                                 ; $751D: $CD $56 $0C
    call label_3B39                               ; $7520: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $7523: $F0 $F0
    JP_TABLE                                      ; $7525
._00 dw SpikeTrapState0Handler
._01 dw SpikeTrapState1Handler
._02 dw SpikeTrapState2Handler
._03 dw SpikeTrapState3Handler

SpikeTrapState0Handler::
    ldh  a, [hActiveEntityPosX]
    ld   hl, wEntitiesPrivateState1Table
    add  hl, bc
    ld   [hl], a

    ldh  a, [$FFEC]                               ; $7535: $F0 $EC
    ld   hl, wEntitiesPrivateState2Table          ; $7537: $21 $C0 $C2
    add  hl, bc                                   ; $753A: $09
    ld   [hl], a                                  ; $753B: $77
    jp   IncrementEntityState                     ; $753C: $C3 $12 $3B

SpikeTrapState1Handler::
    call GetEntityTransitionCountdown             ; $753F: $CD $05 $0C
    jr   nz, jr_006_7599                          ; $7542: $20 $55

    call ClearEntitySpeed                         ; $7544: $CD $7F $3D
    call func_006_65A4                            ; $7547: $CD $A4 $65
    add  $12                                      ; $754A: $C6 $12
    cp   $24                                      ; $754C: $FE $24
    jr   nc, jr_006_7567                          ; $754E: $30 $17

    call func_006_6594                            ; $7550: $CD $94 $65
    ld   d, b                                     ; $7553: $50
    ld   hl, Data_006_74FE                        ; $7554: $21 $FE $74
    add  hl, de                                   ; $7557: $19
    ld   a, [hl]                                  ; $7558: $7E
    ld   hl, wEntitiesDirectionTable              ; $7559: $21 $80 $C3
    add  hl, bc                                   ; $755C: $09
    ld   [hl], e                                  ; $755D: $73
    ld   hl, wEntitiesSpeedXTable                 ; $755E: $21 $40 $C2
    add  hl, bc                                   ; $7561: $09
    ld   [hl], a                                  ; $7562: $77
    ld   e, $18                                   ; $7563: $1E $18
    jr   jr_006_7585                              ; $7565: $18 $1E

jr_006_7567:
    call func_006_6594                            ; $7567: $CD $94 $65
    add  $12                                      ; $756A: $C6 $12
    cp   $24                                      ; $756C: $FE $24
    jr   nc, jr_006_7599                          ; $756E: $30 $29

    call func_006_65A4                            ; $7570: $CD $A4 $65
    ld   d, b                                     ; $7573: $50
    ld   hl, Data_006_7506                        ; $7574: $21 $06 $75
    add  hl, de                                   ; $7577: $19
    ld   a, [hl]                                  ; $7578: $7E
    ld   hl, wEntitiesDirectionTable              ; $7579: $21 $80 $C3
    add  hl, bc                                   ; $757C: $09
    ld   [hl], e                                  ; $757D: $73
    ld   hl, wEntitiesSpeedYTable                 ; $757E: $21 $50 $C2
    add  hl, bc                                   ; $7581: $09
    ld   [hl], a                                  ; $7582: $77
    ld   e, $10                                   ; $7583: $1E $10

jr_006_7585:
    call GetEntityTransitionCountdown             ; $7585: $CD $05 $0C
    ld   [hl], e                                  ; $7588: $73
    call label_3B23                               ; $7589: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $758C: $21 $A0 $C2
    add  hl, bc                                   ; $758F: $09
    ld   a, [hl]                                  ; $7590: $7E
    and  $0F                                      ; $7591: $E6 $0F
    jr   z, jr_006_759A                           ; $7593: $28 $05

    call GetEntityTransitionCountdown             ; $7595: $CD $05 $0C
    ld   [hl], b                                  ; $7598: $70

jr_006_7599:
    ret                                           ; $7599: $C9

jr_006_759A:
    ld   a, $0A                                   ; $759A: $3E $0A
    ldh  [hNoiseSfx], a                           ; $759C: $E0 $F4
    jp   IncrementEntityState                     ; $759E: $C3 $12 $3B

SpikeTrapState2Handler::
    call func_006_6541                            ; $75A1: $CD $41 $65
    call GetEntityTransitionCountdown             ; $75A4: $CD $05 $0C
    jr   nz, jr_006_75B5                          ; $75A7: $20 $0C

jr_006_75A9:
    ld   a, $07                                   ; $75A9: $3E $07
    ldh  [hJingle], a                             ; $75AB: $E0 $F2
    call GetEntityTransitionCountdown             ; $75AD: $CD $05 $0C
    ld   [hl], $20                                ; $75B0: $36 $20
    jp   IncrementEntityState                     ; $75B2: $C3 $12 $3B

jr_006_75B5:
    call label_3B23                               ; $75B5: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $75B8: $21 $A0 $C2
    add  hl, bc                                   ; $75BB: $09
    ld   a, [hl]                                  ; $75BC: $7E
    and  $0F                                      ; $75BD: $E6 $0F
    jr   nz, jr_006_75A9                          ; $75BF: $20 $E8

    ret                                           ; $75C1: $C9

SpikeTrapState3Handler::
    call GetEntityTransitionCountdown             ; $75C2: $CD $05 $0C
    ret  nz                                       ; $75C5: $C0

    ld   hl, wEntitiesDirectionTable              ; $75C6: $21 $80 $C3
    add  hl, bc                                   ; $75C9: $09
    ld   e, [hl]                                  ; $75CA: $5E
    ld   d, b                                     ; $75CB: $50
    ld   hl, Data_006_7502                        ; $75CC: $21 $02 $75
    add  hl, de                                   ; $75CF: $19
    ld   a, [hl]                                  ; $75D0: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $75D1: $21 $40 $C2
    add  hl, bc                                   ; $75D4: $09
    ld   [hl], a                                  ; $75D5: $77
    ld   hl, Data_006_750A                        ; $75D6: $21 $0A $75
    add  hl, de                                   ; $75D9: $19
    ld   a, [hl]                                  ; $75DA: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $75DB: $21 $50 $C2
    add  hl, bc                                   ; $75DE: $09
    ld   [hl], a                                  ; $75DF: $77
    call func_006_6541                            ; $75E0: $CD $41 $65
    ld   hl, wEntitiesPrivateState1Table          ; $75E3: $21 $B0 $C2
    add  hl, bc                                   ; $75E6: $09
    ld   a, [hl]                                  ; $75E7: $7E
    ld   hl, wEntitiesPosXTable                   ; $75E8: $21 $00 $C2
    add  hl, bc                                   ; $75EB: $09
    cp   [hl]                                     ; $75EC: $BE
    ret  nz                                       ; $75ED: $C0

    ld   hl, wEntitiesPrivateState2Table          ; $75EE: $21 $C0 $C2
    add  hl, bc                                   ; $75F1: $09
    ld   a, [hl]                                  ; $75F2: $7E
    ld   hl, wEntitiesPosYTable                   ; $75F3: $21 $10 $C2
    add  hl, bc                                   ; $75F6: $09
    cp   [hl]                                     ; $75F7: $BE
    ret  nz                                       ; $75F8: $C0

    call GetEntityTransitionCountdown             ; $75F9: $CD $05 $0C
    ld   [hl], $20                                ; $75FC: $36 $20
    call IncrementEntityState                     ; $75FE: $CD $12 $3B
    ld   [hl], $01                                ; $7601: $36 $01
    ret                                           ; $7603: $C9

Data_006_7604::
    db   $6E, $00, $6E, $20, $66, $20, $64, $20, $64, $00, $66, $00, $62, $00, $62, $20
    db   $60, $00, $60, $20

Data_006_7618::
    db   $08, $F8, $00, $00

Data_006_761C::
    db   $00, $00, $F8, $08

Data_006_7620::
    db   $20, $E0, $00, $00

Data_006_7624::
    db   $00, $00, $E0, $20

WizrobeEntityHandler::
    ld   de, Data_006_7604                        ; $7628: $11 $04 $76
    call RenderAnimatedActiveEntity               ; $762B: $CD $C0 $3B
    call func_006_64C6                            ; $762E: $CD $C6 $64
    call func_006_64F7                            ; $7631: $CD $F7 $64
    call func_006_6541                            ; $7634: $CD $41 $65
    call label_3B23                               ; $7637: $CD $23 $3B
    ld   hl, wEntitiesStateTable                  ; $763A: $21 $90 $C2
    add  hl, bc                                   ; $763D: $09
    ld   a, [hl]                                  ; $763E: $7E
    JP_TABLE                                      ; $763F
._00 dw WizrobeState0Handler                             ; $7640
._01 dw WizrobeState1Handler                             ; $7642
._02 dw WizrobeState2Handler                             ; $7644
._03 dw WizrobeState3Handler                             ; $7646

WizrobeState0Handler::
    ld   hl, wEntitiesTransitionCountdownTable    ; $7648: $21 $E0 $C2
    add  hl, bc                                   ; $764B: $09
    ld   a, [hl]                                  ; $764C: $7E
    and  a                                        ; $764D: $A7
    jr   nz, jr_006_765E                          ; $764E: $20 $0E

    call IncrementEntityState                     ; $7650: $CD $12 $3B
    ld   hl, wEntitiesPrivateState1Table          ; $7653: $21 $B0 $C2
    add  hl, bc                                   ; $7656: $09
    ld   [hl], $01                                ; $7657: $36 $01
    call IsEntityUnknownFZero                     ; $7659: $CD $00 $0C
    ld   [hl], $20                                ; $765C: $36 $20

jr_006_765E:
    jr   jr_006_767E                              ; $765E: $18 $1E

WizrobeState1Handler::
    call IsEntityUnknownFZero                     ; $7660: $CD $00 $0C
    jr   nz, jr_006_7679                          ; $7663: $20 $14

    ld   hl, wEntitiesPrivateState1Table          ; $7665: $21 $B0 $C2
    add  hl, bc                                   ; $7668: $09
    ld   a, [hl]                                  ; $7669: $7E
    ld   hl, wEntitiesStateTable                  ; $766A: $21 $90 $C2
    add  hl, bc                                   ; $766D: $09
    add  [hl]                                     ; $766E: $86

jr_006_766F:
    ld   [hl], a                                  ; $766F: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $7670: $21 $E0 $C2
    add  hl, bc                                   ; $7673: $09
    ld   [hl], $30                                ; $7674: $36 $30
    jp   label_006_7735                           ; $7676: $C3 $35 $77

jr_006_7679:
    ld   a, [hl]                                  ; $7679: $7E
    and  $02                                      ; $767A: $E6 $02
    jr   nz, jr_006_7686                          ; $767C: $20 $08

jr_006_767E:
    ld   a, $FF                                   ; $767E: $3E $FF
    call SetEntitySpriteVariant                   ; $7680: $CD $0C $3B
    jp   label_006_7735                           ; $7683: $C3 $35 $77

jr_006_7686:
    xor  a                                        ; $7686: $AF
    call SetEntitySpriteVariant                   ; $7687: $CD $0C $3B
    jp   label_006_7735                           ; $768A: $C3 $35 $77

WizrobeState2Handler::
    xor  a                                        ; $768D: $AF
    call SetEntitySpriteVariant                   ; $768E: $CD $0C $3B
    call IsEntityUnknownFZero                     ; $7691: $CD $00 $0C
    cp   $02                                      ; $7694: $FE $02
    jr   nc, jr_006_76B6                          ; $7696: $30 $1E

    ld   a, [hl]                                  ; $7698: $7E
    cp   $01                                      ; $7699: $FE $01
    jr   z, jr_006_76A2                           ; $769B: $28 $05

    ld   [hl], $18                                ; $769D: $36 $18
    jp   label_006_7735                           ; $769F: $C3 $35 $77

jr_006_76A2:
    ld   hl, wEntitiesPrivateState1Table          ; $76A2: $21 $B0 $C2
    add  hl, bc                                   ; $76A5: $09
    ld   a, [hl]                                  ; $76A6: $7E
    ld   hl, wEntitiesStateTable                  ; $76A7: $21 $90 $C2
    add  hl, bc                                   ; $76AA: $09
    add  [hl]                                     ; $76AB: $86
    ld   [hl], a                                  ; $76AC: $77
    cp   $01                                      ; $76AD: $FE $01
    jr   nz, jr_006_76B6                          ; $76AF: $20 $05

    call IsEntityUnknownFZero                     ; $76B1: $CD $00 $0C
    ld   [hl], $20                                ; $76B4: $36 $20

jr_006_76B6:
    jp   label_006_7735                           ; $76B6: $C3 $35 $77

WizrobeState3Handler::
    call label_3B39                               ; $76B9: $CD $39 $3B
    call IsEntityUnknownFZero                     ; $76BC: $CD $00 $0C
    cp   $28                                      ; $76BF: $FE $28
    jr   z, jr_006_76E9                           ; $76C1: $28 $26

    cp   $02                                      ; $76C3: $FE $02
    jr   nc, jr_006_772D                          ; $76C5: $30 $66

    ld   a, [hl]                                  ; $76C7: $7E
    cp   $01                                      ; $76C8: $FE $01
    jr   z, jr_006_76DD                           ; $76CA: $28 $11

    ld   [hl], $40                                ; $76CC: $36 $40
    call func_006_65B4                            ; $76CE: $CD $B4 $65
    ld   hl, wEntitiesDirectionTable              ; $76D1: $21 $80 $C3
    add  hl, bc                                   ; $76D4: $09
    ld   [hl], a                                  ; $76D5: $77
    inc  a                                        ; $76D6: $3C
    ld   hl, wEntitiesSpriteVariantTable          ; $76D7: $21 $B0 $C3
    add  hl, bc                                   ; $76DA: $09
    ld   [hl], a                                  ; $76DB: $77
    ret                                           ; $76DC: $C9

jr_006_76DD:
    ld   hl, wEntitiesPrivateState1Table          ; $76DD: $21 $B0 $C2
    add  hl, bc                                   ; $76E0: $09
    ld   [hl], $FF                                ; $76E1: $36 $FF
    ld   hl, wEntitiesStateTable                  ; $76E3: $21 $90 $C2
    add  hl, bc                                   ; $76E6: $09
    dec  [hl]                                     ; $76E7: $35
    ret                                           ; $76E8: $C9

jr_006_76E9:
    ld   a, $22                                   ; $76E9: $3E $22
    call SpawnNewEntity_trampoline                ; $76EB: $CD $86 $3B
    jr   c, jr_006_772D                           ; $76EE: $38 $3D

    push bc                                       ; $76F0: $C5
    ldh  a, [hScratch2]                           ; $76F1: $F0 $D9
    ld   hl, wEntitiesDirectionTable              ; $76F3: $21 $80 $C3
    add  hl, de                                   ; $76F6: $19
    ld   [hl], a                                  ; $76F7: $77
    ld   c, a                                     ; $76F8: $4F
    ld   hl, Data_006_7618                        ; $76F9: $21 $18 $76
    add  hl, bc                                   ; $76FC: $09
    ldh  a, [hScratch0]                           ; $76FD: $F0 $D7
    add  [hl]                                     ; $76FF: $86
    ld   hl, wEntitiesPosXTable                   ; $7700: $21 $00 $C2
    add  hl, de                                   ; $7703: $19
    ld   [hl], a                                  ; $7704: $77
    ld   hl, Data_006_761C                        ; $7705: $21 $1C $76
    add  hl, bc                                   ; $7708: $09

label_006_7709:
    ldh  a, [hScratch1]                           ; $7709: $F0 $D8
    add  [hl]                                     ; $770B: $86
    ld   hl, wEntitiesPosYTable                   ; $770C: $21 $10 $C2
    add  hl, de                                   ; $770F: $19
    ld   [hl], a                                  ; $7710: $77
    ld   hl, Data_006_7620                        ; $7711: $21 $20 $76
    add  hl, bc                                   ; $7714: $09
    ld   a, [hl]                                  ; $7715: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7716: $21 $40 $C2
    add  hl, de                                   ; $7719: $19
    ld   [hl], a                                  ; $771A: $77
    ld   hl, Data_006_7624                        ; $771B: $21 $24 $76
    add  hl, bc                                   ; $771E: $09
    ld   a, [hl]                                  ; $771F: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7720: $21 $50 $C2
    add  hl, de                                   ; $7723: $19
    ld   [hl], a                                  ; $7724: $77

jr_006_7725:
    pop  bc                                       ; $7725: $C1
    ldh  a, [hScratch2]                           ; $7726: $F0 $D9
    ld   hl, wEntitiesSpriteVariantTable          ; $7728: $21 $B0 $C3
    add  hl, de                                   ; $772B: $19
    ld   [hl], a                                  ; $772C: $77

jr_006_772D:
    ld   hl, wEntitiesPhysicsFlagsTable           ; $772D: $21 $40 $C3
    add  hl, bc                                   ; $7730: $09
    ld   a, $02                                   ; $7731: $3E $02
    ld   [hl], a                                  ; $7733: $77
    ret                                           ; $7734: $C9

label_006_7735:
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7735: $21 $40 $C3
    add  hl, bc                                   ; $7738: $09
    ld   [hl], $42                                ; $7739: $36 $42
    ret                                           ; $773B: $C9

Data_006_773C::
    db   $00, $D8, $60, $00, $00, $E0, $60, $20, $00, $28, $60, $00, $00, $30, $60, $20
    db   $D8, $00, $62, $00, $D8, $08, $62, $20, $28, $00, $62, $00, $28, $08, $62, $20
    db   $F0, $F0, $6A, $00, $F0, $F8, $6A, $60, $F0, $10, $6A, $40, $F0, $18, $6A, $20
    db   $10, $F0, $6A, $40, $10, $F8, $6A, $20, $10, $10, $6A, $00, $10, $18, $6A, $60
    db   $00, $E8, $60, $00, $00, $F0, $60, $20, $00, $18, $60, $00, $00, $20, $60, $20
    db   $E8, $00, $62, $00, $E8, $08, $62, $20, $18, $00, $62, $00, $18, $08, $62, $20
    db   $F0, $F0, $FF, $00, $F0, $F8, $FF, $00, $F0, $10, $FF, $00, $F0, $18, $FF, $00
    db   $10, $F0, $FF, $00, $10, $F8, $FF, $00, $10, $10, $FF, $00, $10, $18, $FF, $00
    db   $E0, $E0, $68, $00, $E0, $E8, $68, $60, $20, $E0, $68, $40, $20, $E8, $68, $20
    db   $E0, $20, $68, $40, $E0, $28, $68, $20, $20, $20, $68, $00, $20, $28, $68, $60
    db   $00, $F0, $64, $00, $00, $F8, $64, $20, $F0, $00, $66, $00, $F0, $08, $66, $20
    db   $00, $10, $64, $00, $00, $18, $64, $20, $10, $00, $66, $00, $10, $08, $66, $20
    db   $E8, $E8, $68, $00, $E8, $F0, $68, $60, $18, $E8, $68, $40, $18, $F0, $68, $20
    db   $E8, $18, $68, $40, $E8, $20, $68, $20, $18, $18, $68, $00, $18, $20, $68, $60
    db   $00, $F0, $FF, $00, $00, $F8, $FF, $20, $F0, $00, $FF, $00, $F0, $08, $FF, $20
    db   $00, $10, $FF, $00, $00, $18, $FF, $20, $10, $00, $FF, $00, $10, $08, $FF, $20

func_006_783C::
    call func_006_64C6                            ; $783C: $CD $C6 $64

jr_006_783F:
    ldh  a, [hFrameCounter]                       ; $783F: $F0 $E7
    rra                                           ; $7841: $1F
    rra                                           ; $7842: $1F
    rra                                           ; $7843: $1F
    and  $03                                      ; $7844: $E6 $03
    ld   e, a                                     ; $7846: $5F
    ld   d, b                                     ; $7847: $50
    sla  e                                        ; $7848: $CB $23
    rl   d                                        ; $784A: $CB $12
    sla  e                                        ; $784C: $CB $23
    rl   d                                        ; $784E: $CB $12
    sla  e                                        ; $7850: $CB $23
    rl   d                                        ; $7852: $CB $12
    sla  e                                        ; $7854: $CB $23
    rl   d                                        ; $7856: $CB $12
    sla  e                                        ; $7858: $CB $23
    rl   d                                        ; $785A: $CB $12
    sla  e                                        ; $785C: $CB $23
    rl   d                                        ; $785E: $CB $12
    ld   hl, Data_006_773C                        ; $7860: $21 $3C $77
    add  hl, de                                   ; $7863: $19
    ld   c, $10                                   ; $7864: $0E $10
    call func_3CE6                                ; $7866: $CD $E6 $3C
    ld   a, $10                                   ; $7869: $3E $10
    jp   label_3DA0                               ; $786B: $C3 $A0 $3D

Data_006_786E::
    db   $5A, $00, $5A, $20, $5A, $14, $5A, $34

AntiFairyEntityHandler::
    ld   de, Data_006_786E                        ; $7876: $11 $6E $78
    call RenderAnimatedActiveEntity               ; $7879: $CD $C0 $3B
    call func_006_64C6                            ; $787C: $CD $C6 $64

jr_006_787F:
    call func_006_64F7                            ; $787F: $CD $F7 $64
    call label_3B39                               ; $7882: $CD $39 $3B
    call func_006_6541                            ; $7885: $CD $41 $65
    call label_3B23                               ; $7888: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $788B: $21 $A0 $C2
    add  hl, bc                                   ; $788E: $09
    ld   a, [hl]                                  ; $788F: $7E
    and  $03                                      ; $7890: $E6 $03
    jr   nz, jr_006_789B                          ; $7892: $20 $07

    ld   a, [hl]                                  ; $7894: $7E
    and  $0C                                      ; $7895: $E6 $0C
    jr   nz, jr_006_78A5                          ; $7897: $20 $0C

    jr   jr_006_78AD                              ; $7899: $18 $12

jr_006_789B:
    ld   hl, wEntitiesSpeedXTable                 ; $789B: $21 $40 $C2
    add  hl, bc                                   ; $789E: $09
    ld   a, [hl]                                  ; $789F: $7E
    cpl                                           ; $78A0: $2F
    inc  a                                        ; $78A1: $3C
    ld   [hl], a                                  ; $78A2: $77
    jr   jr_006_78AD                              ; $78A3: $18 $08

jr_006_78A5:
    ld   hl, wEntitiesSpeedYTable                 ; $78A5: $21 $50 $C2
    add  hl, bc                                   ; $78A8: $09
    ld   a, [hl]                                  ; $78A9: $7E
    cpl                                           ; $78AA: $2F
    inc  a                                        ; $78AB: $3C
    ld   [hl], a                                  ; $78AC: $77

jr_006_78AD:
    ldh  a, [hFrameCounter]                       ; $78AD: $F0 $E7
    rra                                           ; $78AF: $1F
    rra                                           ; $78B0: $1F
    rra                                           ; $78B1: $1F
    and  $01                                      ; $78B2: $E6 $01
    jp   SetEntitySpriteVariant                   ; $78B4: $C3 $0C $3B

Data_006_78B7::
    db   $58, $02, $58, $22, $5A, $02, $5A, $22

Data_006_78BF::
    db   $10, $F0, $10, $F0

Data_006_78C3::
    db   $10, $10, $F0, $F0

TektiteEntityHandler::
    ld   de, Data_006_78B7                        ; $78C7: $11 $B7 $78
    call RenderAnimatedActiveEntity               ; $78CA: $CD $C0 $3B

jr_006_78CD:
    call func_006_64C6                            ; $78CD: $CD $C6 $64
    call func_006_64F7                            ; $78D0: $CD $F7 $64
    call label_3B39                               ; $78D3: $CD $39 $3B
    call func_006_6541                            ; $78D6: $CD $41 $65
    call label_3B23                               ; $78D9: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $78DC: $21 $A0 $C2
    add  hl, bc                                   ; $78DF: $09
    ld   a, [hl]                                  ; $78E0: $7E
    and  $03                                      ; $78E1: $E6 $03
    jr   z, jr_006_78E8                           ; $78E3: $28 $03

    call func_006_7979                            ; $78E5: $CD $79 $79

jr_006_78E8:
    ld   a, [hl]                                  ; $78E8: $7E
    and  $0C                                      ; $78E9: $E6 $0C
    jr   z, jr_006_78F0                           ; $78EB: $28 $03

    call func_006_797E                            ; $78ED: $CD $7E $79

jr_006_78F0:
    ldh  a, [hActiveEntityState]                  ; $78F0: $F0 $F0
    and  a                                        ; $78F2: $A7
    jr   nz, jr_006_7921                          ; $78F3: $20 $2C

    ld   hl, wEntitiesPosZTable                   ; $78F5: $21 $10 $C3
    add  hl, bc                                   ; $78F8: $09
    ld   a, [hl]                                  ; $78F9: $7E
    and  $80                                      ; $78FA: $E6 $80
    jr   z, jr_006_7918                           ; $78FC: $28 $1A

    xor  a                                        ; $78FE: $AF
    ld   [hl], a                                  ; $78FF: $77
    call ClearEntitySpeed                         ; $7900: $CD $7F $3D
    ld   hl, wEntitiesStateTable                  ; $7903: $21 $90 $C2
    add  hl, bc                                   ; $7906: $09
    inc  [hl]                                     ; $7907: $34
    call GetEntityTransitionCountdown             ; $7908: $CD $05 $0C
    call GetRandomByte                            ; $790B: $CD $0D $28
    and  $3F                                      ; $790E: $E6 $3F
    add  $10                                      ; $7910: $C6 $10
    ld   [hl], a                                  ; $7912: $77
    ld   a, $01                                   ; $7913: $3E $01
    jp   SetEntitySpriteVariant                   ; $7915: $C3 $0C $3B

jr_006_7918:
    call func_006_657A                            ; $7918: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $791B: $21 $20 $C3
    add  hl, bc                                   ; $791E: $09
    dec  [hl]                                     ; $791F: $35
    ret                                           ; $7920: $C9

jr_006_7921:
    ld   hl, wEntitiesUnknowTableY                ; $7921: $21 $D0 $C3
    add  hl, bc                                   ; $7924: $09
    inc  [hl]                                     ; $7925: $34
    ld   a, [hl]                                  ; $7926: $7E
    and  $10                                      ; $7927: $E6 $10
    srl  a                                        ; $7929: $CB $3F
    srl  a                                        ; $792B: $CB $3F
    srl  a                                        ; $792D: $CB $3F
    srl  a                                        ; $792F: $CB $3F
    call SetEntitySpriteVariant                   ; $7931: $CD $0C $3B
    and  a                                        ; $7934: $A7
    ret  nz                                       ; $7935: $C0

    call GetEntityTransitionCountdown             ; $7936: $CD $05 $0C
    ret  nz                                       ; $7939: $C0

    call GetRandomByte                            ; $793A: $CD $0D $28
    and  $07                                      ; $793D: $E6 $07
    add  $10                                      ; $793F: $C6 $10
    ld   hl, wEntitiesSpeedZTable                 ; $7941: $21 $20 $C3
    add  hl, bc                                   ; $7944: $09
    ld   [hl], a                                  ; $7945: $77
    call func_006_657A                            ; $7946: $CD $7A $65
    call GetRandomByte                            ; $7949: $CD $0D $28
    and  $03                                      ; $794C: $E6 $03
    ld   e, a                                     ; $794E: $5F
    ld   d, b                                     ; $794F: $50
    ld   hl, Data_006_78BF                        ; $7950: $21 $BF $78
    add  hl, de                                   ; $7953: $19
    ld   a, [hl]                                  ; $7954: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7955: $21 $40 $C2
    add  hl, bc                                   ; $7958: $09
    ld   [hl], a                                  ; $7959: $77
    ld   hl, Data_006_78C3                        ; $795A: $21 $C3 $78
    add  hl, de                                   ; $795D: $19
    ld   a, [hl]                                  ; $795E: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $795F: $21 $50 $C2
    add  hl, bc                                   ; $7962: $09
    ld   [hl], a                                  ; $7963: $77
    call GetRandomByte                            ; $7964: $CD $0D $28
    and  $01                                      ; $7967: $E6 $01
    jr   z, jr_006_7970                           ; $7969: $28 $05

    ld   a, $14                                   ; $796B: $3E $14
    call ApplyVectorTowardsLink_trampoline        ; $796D: $CD $AA $3B

jr_006_7970:
    ld   hl, wEntitiesStateTable                  ; $7970: $21 $90 $C2
    add  hl, bc                                   ; $7973: $09
    xor  a                                        ; $7974: $AF
    ld   [hl], a                                  ; $7975: $77
    jp   SetEntitySpriteVariant                   ; $7976: $C3 $0C $3B

func_006_7979::
    ld   hl, wEntitiesSpeedXTable                 ; $7979: $21 $40 $C2
    jr   jr_006_7982                              ; $797C: $18 $04

func_006_797E::
    ld   hl, wEntitiesSpeedXTable                 ; $797E: $21 $40 $C2
    add  hl, bc                                   ; $7981: $09

jr_006_7982:
    ld   a, [hl]                                  ; $7982: $7E
    cpl                                           ; $7983: $2F
    inc  a                                        ; $7984: $3C
    sra  a                                        ; $7985: $CB $2F
    ld   [hl], a                                  ; $7987: $77
    ret                                           ; $7988: $C9

Data_006_7989::
    db   $62, $20, $60, $20, $66, $20, $64, $20, $60, $00, $62, $00, $64, $00, $66, $00
    db   $68, $00, $68, $20, $6A, $00, $6A, $20, $6E, $20, $6C, $20, $6C, $00, $6E, $00

BooBuddyEntityHandler::
    ld   de, Data_006_7989                        ; $79A9: $11 $89 $79
    call RenderAnimatedActiveEntity               ; $79AC: $CD $C0 $3B
    call func_006_64C6                            ; $79AF: $CD $C6 $64
    call func_006_64F7                            ; $79B2: $CD $F7 $64
    call func_006_6541                            ; $79B5: $CD $41 $65
    call func_006_5E54                            ; $79B8: $CD $54 $5E
    ldh  a, [hActiveEntityState]                  ; $79BB: $F0 $F0
    JP_TABLE                                      ; $79BD
._00 dw BooBuddyState0Handler
._01 dw BooBuddyState1Handler

BooBuddyState0Handler::
    ld   a, [$C1A2]                               ; $79C2: $FA $A2 $C1
    and  a                                        ; $79C5: $A7
    jp   nz, label_006_7A38                       ; $79C6: $C2 $38 $7A

    call GetEntityTransitionCountdown             ; $79C9: $CD $05 $0C
    jr   nz, jr_006_7A11                          ; $79CC: $20 $43

    call IsEntityUnknownFZero                     ; $79CE: $CD $00 $0C
    jr   nz, jr_006_7A21                          ; $79D1: $20 $4E

    ld   a, [wSwordAnimationState]                ; $79D3: $FA $37 $C1
    cp   $03                                      ; $79D6: $FE $03
    jr   z, jr_006_79FA                           ; $79D8: $28 $20

    call GetRandomByte                            ; $79DA: $CD $0D $28
    xor  c                                        ; $79DD: $A9
    and  $07                                      ; $79DE: $E6 $07
    add  $06                                      ; $79E0: $C6 $06
    call GetVectorTowardsLink_trampoline          ; $79E2: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $79E5: $F0 $D7
    ld   hl, wEntitiesSpeedYTable                 ; $79E7: $21 $50 $C2
    call func_006_7A79                            ; $79EA: $CD $79 $7A
    ldh  a, [hScratch1]                           ; $79ED: $F0 $D8
    ld   hl, wEntitiesSpeedXTable                 ; $79EF: $21 $40 $C2

jr_006_79F2:
    call func_006_7A79                            ; $79F2: $CD $79 $7A
    call label_3B44                               ; $79F5: $CD $44 $3B
    jr   jr_006_7A27                              ; $79F8: $18 $2D

jr_006_79FA:
    call func_006_6594                            ; $79FA: $CD $94 $65
    add  $24                                      ; $79FD: $C6 $24
    cp   $48                                      ; $79FF: $FE $48
    jr   nc, jr_006_7A27                          ; $7A01: $30 $24

    call func_006_65A4                            ; $7A03: $CD $A4 $65
    add  $24                                      ; $7A06: $C6 $24

jr_006_7A08:
    cp   $48                                      ; $7A08: $FE $48
    jr   nc, jr_006_7A27                          ; $7A0A: $30 $1B

    call GetEntityTransitionCountdown             ; $7A0C: $CD $05 $0C
    ld   [hl], $20                                ; $7A0F: $36 $20

jr_006_7A11:
    call ClearEntitySpeed                         ; $7A11: $CD $7F $3D
    call func_006_7AB0                            ; $7A14: $CD $B0 $7A
    ld   hl, wEntitiesPrivateState1Table          ; $7A17: $21 $B0 $C2
    add  hl, bc                                   ; $7A1A: $09
    ld   a, [hl]                                  ; $7A1B: $7E
    and  a                                        ; $7A1C: $A7
    ret  z                                        ; $7A1D: $C8

    call func_006_7A8C                            ; $7A1E: $CD $8C $7A

jr_006_7A21:
    call ClearEntitySpeed                         ; $7A21: $CD $7F $3D
    jp   func_006_7AB0                            ; $7A24: $C3 $B0 $7A

jr_006_7A27:
    call func_006_6594                            ; $7A27: $CD $94 $65
    sla  e                                        ; $7A2A: $CB $23
    ldh  a, [hFrameCounter]                       ; $7A2C: $F0 $E7
    rra                                           ; $7A2E: $1F
    rra                                           ; $7A2F: $1F
    rra                                           ; $7A30: $1F
    rra                                           ; $7A31: $1F
    and  $01                                      ; $7A32: $E6 $01
    add  e                                        ; $7A34: $83
    jp   SetEntitySpriteVariant                   ; $7A35: $C3 $0C $3B

label_006_7A38:
    call IncrementEntityState                     ; $7A38: $CD $12 $3B
    ld   [hl], $01                                ; $7A3B: $36 $01
    ret                                           ; $7A3D: $C9

BooBuddyState1Handler::
    ld   a, [$C1A2]                               ; $7A3E: $FA $A2 $C1
    and  a                                        ; $7A41: $A7
    jr   z, jr_006_7A74                           ; $7A42: $28 $30

    ld   hl, wEntitiesHealthTable                 ; $7A44: $21 $60 $C3
    add  hl, bc                                   ; $7A47: $09
    ld   [hl], $01                                ; $7A48: $36 $01
    call label_3B39                               ; $7A4A: $CD $39 $3B
    ld   a, $04                                   ; $7A4D: $3E $04
    call GetVectorTowardsLink_trampoline          ; $7A4F: $CD $B5 $3B
    ldh  a, [hScratch0]                           ; $7A52: $F0 $D7
    cpl                                           ; $7A54: $2F
    inc  a                                        ; $7A55: $3C
    ld   hl, wEntitiesSpeedYTable                 ; $7A56: $21 $50 $C2
    add  hl, bc                                   ; $7A59: $09
    ld   [hl], a                                  ; $7A5A: $77
    ldh  a, [hScratch1]                           ; $7A5B: $F0 $D8
    cpl                                           ; $7A5D: $2F
    inc  a                                        ; $7A5E: $3C
    ld   hl, wEntitiesSpeedXTable                 ; $7A5F: $21 $40 $C2
    add  hl, bc                                   ; $7A62: $09
    ld   [hl], a                                  ; $7A63: $77
    ldh  a, [hFrameCounter]                       ; $7A64: $F0 $E7
    rra                                           ; $7A66: $1F
    rra                                           ; $7A67: $1F
    rra                                           ; $7A68: $1F
    rra                                           ; $7A69: $1F
    and  $01                                      ; $7A6A: $E6 $01
    add  $04                                      ; $7A6C: $C6 $04
    ld   hl, wEntitiesSpriteVariantTable          ; $7A6E: $21 $B0 $C3
    add  hl, bc                                   ; $7A71: $09
    ld   [hl], a                                  ; $7A72: $77
    ret                                           ; $7A73: $C9

jr_006_7A74:
    call IncrementEntityState                     ; $7A74: $CD $12 $3B
    ld   [hl], b                                  ; $7A77: $70
    ret                                           ; $7A78: $C9

func_006_7A79::
    add  hl, bc                                   ; $7A79: $09
    sub  [hl]                                     ; $7A7A: $96
    jr   z, jr_006_7A8B                           ; $7A7B: $28 $0E

    bit  7, a                                     ; $7A7D: $CB $7F
    jr   z, jr_006_7A87                           ; $7A7F: $28 $06

    dec  [hl]                                     ; $7A81: $35
    dec  [hl]                                     ; $7A82: $35
    dec  [hl]                                     ; $7A83: $35
    dec  [hl]                                     ; $7A84: $35
    jr   jr_006_7A8B                              ; $7A85: $18 $04

jr_006_7A87:
    inc  [hl]                                     ; $7A87: $34
    inc  [hl]                                     ; $7A88: $34
    inc  [hl]                                     ; $7A89: $34
    inc  [hl]                                     ; $7A8A: $34

jr_006_7A8B:
    ret                                           ; $7A8B: $C9

func_006_7A8C::
    call IsEntityUnknownFZero                     ; $7A8C: $CD $00 $0C
    ld   [hl], $20                                ; $7A8F: $36 $20
    ld   hl, wEntitiesPrivateState1Table          ; $7A91: $21 $B0 $C2
    add  hl, bc                                   ; $7A94: $09
    ld   [hl], $00                                ; $7A95: $36 $00
    ld   hl, wEntitiesPosYTable                   ; $7A97: $21 $10 $C2
    add  hl, bc                                   ; $7A9A: $09
    ld   a, [hl]                                  ; $7A9B: $7E
    sub  $48                                      ; $7A9C: $D6 $48
    ld   e, a                                     ; $7A9E: $5F
    ld   a, $48                                   ; $7A9F: $3E $48
    sub  e                                        ; $7AA1: $93
    ld   [hl], a                                  ; $7AA2: $77
    ld   hl, wEntitiesPosXTable                   ; $7AA3: $21 $00 $C2
    add  hl, bc                                   ; $7AA6: $09
    ld   a, [hl]                                  ; $7AA7: $7E
    sub  $50                                      ; $7AA8: $D6 $50
    ld   e, a                                     ; $7AAA: $5F
    ld   a, $50                                   ; $7AAB: $3E $50
    sub  e                                        ; $7AAD: $93
    ld   [hl], a                                  ; $7AAE: $77
    ret                                           ; $7AAF: $C9

func_006_7AB0::
    ldh  a, [hFrameCounter]                       ; $7AB0: $F0 $E7
    rra                                           ; $7AB2: $1F
    rra                                           ; $7AB3: $1F
    and  $01                                      ; $7AB4: $E6 $01
    jr   z, jr_006_7AC7                           ; $7AB6: $28 $0F

    call func_006_6594                            ; $7AB8: $CD $94 $65
    srl  e                                        ; $7ABB: $CB $3B
    jr   c, jr_006_7AC3                           ; $7ABD: $38 $04

    ld   a, $06                                   ; $7ABF: $3E $06
    jr   jr_006_7AC9                              ; $7AC1: $18 $06

jr_006_7AC3:
    ld   a, $07                                   ; $7AC3: $3E $07
    jr   jr_006_7AC9                              ; $7AC5: $18 $02

jr_006_7AC7:
    ld   a, $FF                                   ; $7AC7: $3E $FF

jr_006_7AC9:
    call SetEntitySpriteVariant                   ; $7AC9: $CD $0C $3B
    ld   hl, wEntitiesPrivateState1Table          ; $7ACC: $21 $B0 $C2
    add  hl, bc                                   ; $7ACF: $09
    ld   [hl], b                                  ; $7AD0: $70

Data_006_7AD1::
    call GetEntityTransitionCountdown             ; $7AD1: $CD $05 $0C
    cp   $01                                      ; $7AD4: $FE $01
    ret  nz                                       ; $7AD6: $C0

    ld   hl, wEntitiesPrivateState1Table          ; $7AD7: $21 $B0 $C2
    add  hl, bc                                   ; $7ADA: $09
    inc  [hl]                                     ; $7ADB: $34
    ret                                           ; $7ADC: $C9

Data_006_7ADD::
    db   $A6, $15, $8E, $16, $80, $15, $A6, $15, $A9, $14, $2A, $41, $2A, $61

Data_006_7AEB::
    db   $00, $FC, $22, $00, $00, $0C, $22, $20, $00, $FC, $22, $40, $00, $0C, $22, $60

Data_006_7AFB::
    db   $0F, $0F, $10, $11, $11, $11, $10, $0F

Data_006_7B03::
    db   $00, $00, $01, $02, $02, $02, $01, $00

FloatingItemEntityHandler::
    ld   a, [wIsIndoor]                           ; $7B0B: $FA $A5 $DB
    and  a                                        ; $7B0E: $A7
    jr   z, FloatingItem2EntityHandler            ; $7B0F: $28 $0B

    ldh  a, [hMapId]                              ; $7B11: $F0 $F7
    cp   $FF                                      ; $7B13: $FE $FF
    jr   nz, FloatingItem2EntityHandler           ; $7B15: $20 $05

    ld   a, $06                                   ; $7B17: $3E $06
    jp   func_036_4F9B_trampoline                 ; $7B19: $C3 $53 $0A

FloatingItem2EntityHandler::
    ld   a, [wIsIndoor]                           ; $7B1C: $FA $A5 $DB
    and  a                                        ; $7B1F: $A7
    jr   z, jr_006_7B32                           ; $7B20: $28 $10

    ldh  a, [hMapId]                              ; $7B22: $F0 $F7
    and  a                                        ; $7B24: $A7
    jr   nz, jr_006_7B32                          ; $7B25: $20 $0B

    ldh  a, [hMapRoom]                            ; $7B27: $F0 $F6
    cp   $1C                                      ; $7B29: $FE $1C
    jr   nz, jr_006_7B32                          ; $7B2B: $20 $05

    ld   a, $01                                   ; $7B2D: $3E $01
    ld   [$DE00], a                               ; $7B2F: $EA $00 $DE

jr_006_7B32:
    ld   hl, Data_006_7AFB                        ; $7B32: $21 $FB $7A
    ldh  a, [hIsSideScrolling]                    ; $7B35: $F0 $F9
    and  a                                        ; $7B37: $A7
    jr   z, jr_006_7B3D                           ; $7B38: $28 $03

    ld   hl, Data_006_7B03                        ; $7B3A: $21 $03 $7B

jr_006_7B3D:
    ldh  a, [hFrameCounter]                       ; $7B3D: $F0 $E7
    rra                                           ; $7B3F: $1F
    rra                                           ; $7B40: $1F
    rra                                           ; $7B41: $1F
    and  $07                                      ; $7B42: $E6 $07
    ld   e, a                                     ; $7B44: $5F
    ld   d, b                                     ; $7B45: $50
    add  hl, de                                   ; $7B46: $19
    ld   a, [hl]                                  ; $7B47: $7E
    ld   hl, wEntitiesPosZTable                   ; $7B48: $21 $10 $C3
    add  hl, bc                                   ; $7B4B: $09
    ld   [hl], a                                  ; $7B4C: $77
    ldh  a, [hActiveEntitySpriteVariant]          ; $7B4D: $F0 $F1
    cp   $05                                      ; $7B4F: $FE $05
    jr   nz, jr_006_7B5B                          ; $7B51: $20 $08

    ld   de, Data_006_7AD1 + 2                    ; $7B53: $11 $D3 $7A
    call RenderAnimatedActiveEntity               ; $7B56: $CD $C0 $3B
    jr   jr_006_7B61                              ; $7B59: $18 $06

jr_006_7B5B:
    ld   de, Data_006_7ADD                        ; $7B5B: $11 $DD $7A
    call RenderSimpleEntityWithSpriteVariantToOAM ; $7B5E: $CD $77 $3C

jr_006_7B61:
    ldh  a, [hFrameCounter]                       ; $7B61: $F0 $E7
    and  $08                                      ; $7B63: $E6 $08
    ld   e, a                                     ; $7B65: $5F
    ld   d, b                                     ; $7B66: $50
    ld   hl, Data_006_7AEB                        ; $7B67: $21 $EB $7A
    add  hl, de                                   ; $7B6A: $19
    ld   c, $02                                   ; $7B6B: $0E $02
    call func_3CE6                                ; $7B6D: $CD $E6 $3C
    ld   a, $01                                   ; $7B70: $3E $01
    call label_3DA0                               ; $7B72: $CD $A0 $3D
    call CopyEntityPositionToActivePosition       ; $7B75: $CD $8A $3D
    call func_006_64C6                            ; $7B78: $CD $C6 $64
    ldh  a, [hIsSideScrolling]                    ; $7B7B: $F0 $F9
    and  a                                        ; $7B7D: $A7
    jr   nz, jr_006_7B85                          ; $7B7E: $20 $05

    ldh  a, [hLinkPositionZ]                      ; $7B80: $F0 $A2
    cp   $0C                                      ; $7B82: $FE $0C
    ret  c                                        ; $7B84: $D8

jr_006_7B85:
    call CheckLinkCollisionWithEnemy_trampoline   ; $7B85: $CD $5A $3B
    ret  nc                                       ; $7B88: $D0

    call DidKillEnemy.label_3F5E                  ; $7B89: $CD $5E $3F
    call func_006_65DB                            ; $7B8C: $CD $DB $65
    ld   a, $01                                   ; $7B8F: $3E $01
    ldh  [hWaveSfx], a                            ; $7B91: $E0 $F3
    ldh  a, [hActiveEntitySpriteVariant]          ; $7B93: $F0 $F1
    JP_TABLE                                      ; $7B95
._00 dw Floating10RupeesHandler
._01 dw FloatingMagicPowderHandler
._02 dw FloatingBombsHandler
._03 dw Floating10RupeesHandler
._04 dw func_006_7BA2
._05 dw FloatingArrowsHandler

func_006_7BA2::
    ld   a, [wSubstractRupeeBufferLow]            ; $7BA2: $FA $93 $DB
    add  $18                                      ; $7BA5: $C6 $18
    jr   nc, jr_006_7BAB                          ; $7BA7: $30 $02

    ld   a, $FF                                   ; $7BA9: $3E $FF

jr_006_7BAB:
    ld   [wSubstractRupeeBufferLow], a            ; $7BAB: $EA $93 $DB
    ret                                           ; $7BAE: $C9

FloatingArrowsHandler::
    ld   a, [wArrowCount]                         ; $7BAF: $FA $45 $DB
    add  $10                                      ; $7BB2: $C6 $10
    daa                                           ; $7BB4: $27
    ld   [wArrowCount], a                         ; $7BB5: $EA $45 $DB
    ret                                           ; $7BB8: $C9

Floating10RupeesHandler::
    ld   a, 10                                    ; $7BB9: $3E $0A
    ld   [wAddRupeeBufferHigh], a                 ; $7BBB: $EA $90 $DB
    ret                                           ; $7BBE: $C9

FloatingMagicPowderHandler::
    ld   d, $0C                                   ; $7BBF: $16 $0C
    call label_3E6B                               ; $7BC1: $CD $6B $3E
    ld   a, $0B                                   ; $7BC4: $3E $0B
    ldh  [hFFA5], a                               ; $7BC6: $E0 $A5
    ld   hl, wMaxMagicPowder                      ; $7BC8: $21 $76 $DB
    ld   de, wMagicPowderCount                    ; $7BCB: $11 $4C $DB
    jr   jr_006_7BD6                              ; $7BCE: $18 $06

FloatingBombsHandler::
    ld   hl, wMaxBombs                            ; $7BD0: $21 $77 $DB
    ld   de, wBombCount                           ; $7BD3: $11 $4D $DB

jr_006_7BD6:
    ld   a, [de]                                  ; $7BD6: $1A
    cp   [hl]                                     ; $7BD7: $BE
    ret  nc                                       ; $7BD8: $D0

    add  $10                                      ; $7BD9: $C6 $10
    daa                                           ; $7BDB: $27
    cp   [hl]                                     ; $7BDC: $BE
    jr   c, jr_006_7BE0                           ; $7BDD: $38 $01

    ld   a, [hl]                                  ; $7BDF: $7E

jr_006_7BE0:
    ld   [de], a                                  ; $7BE0: $12
    ret                                           ; $7BE1: $C9

func_006_7BE2::
    ldh  a, [hMapId]                              ; $7BE2: $F0 $F7
    cp   $0A                                      ; $7BE4: $FE $0A
    ret  nz                                       ; $7BE6: $C0

jr_006_7BE7:
    ldh  a, [hMapRoom]                            ; $7BE7: $F0 $F6
    cp   $97                                      ; $7BE9: $FE $97
    jr   z, jr_006_7BF0                           ; $7BEB: $28 $03

    cp   $98                                      ; $7BED: $FE $98
    ret  nz                                       ; $7BEF: $C0

jr_006_7BF0:
    ld   a, [$DB7F]                               ; $7BF0: $FA $7F $DB
    and  a                                        ; $7BF3: $A7
    ret  z                                        ; $7BF4: $C8

    ld   a, $FF                                   ; $7BF5: $3E $FF
    ldh  [hActiveEntitySpriteVariant], a          ; $7BF7: $E0 $F1
    ret                                           ; $7BF9: $C9

Data_006_7BFA::
    db   $56, $02, $56, $22

MiniGelEntityHandler::
    call func_006_7BE2                            ; $7BFE: $CD $E2 $7B
    ld   de, Data_006_7BFA                        ; $7C01: $11 $FA $7B
    call RenderSimpleEntityWithSpriteVariantToOAM ; $7C04: $CD $77 $3C
    jr   jr_006_7C2E                              ; $7C07: $18 $25

Data_006_7C09::
    db   $52, $02, $52, $22, $54, $02, $54, $22

Data_006_7C11::
    db   $52, $00, $52, $20, $54, $00, $54, $20

GelEntityHandler::
    call func_006_7BE2                            ; $7C19: $CD $E2 $7B
    ld   de, Data_006_7C09                        ; $7C1C: $11 $09 $7C
    ld   hl, wEntitiesHealthTable                 ; $7C1F: $21 $60 $C3
    add  hl, bc                                   ; $7C22: $09
    ld   a, [hl]                                  ; $7C23: $7E
    and  $02                                      ; $7C24: $E6 $02
    jr   nz, jr_006_7C2B                          ; $7C26: $20 $03

    ld   de, Data_006_7C11                        ; $7C28: $11 $11 $7C

jr_006_7C2B:
    call RenderAnimatedActiveEntity               ; $7C2B: $CD $C0 $3B

jr_006_7C2E:
    ld   hl, $C1AE                                ; $7C2E: $21 $AE $C1
    inc  [hl]                                     ; $7C31: $34
    call func_006_64C6                            ; $7C32: $CD $C6 $64
    call func_006_657A                            ; $7C35: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $7C38: $21 $20 $C3
    add  hl, bc                                   ; $7C3B: $09
    dec  [hl]                                     ; $7C3C: $35
    dec  [hl]                                     ; $7C3D: $35
    dec  [hl]                                     ; $7C3E: $35
    ld   hl, wEntitiesPosZTable                   ; $7C3F: $21 $10 $C3
    add  hl, bc                                   ; $7C42: $09
    ld   a, [hl]                                  ; $7C43: $7E
    and  $80                                      ; $7C44: $E6 $80
    ldh  [hFFE8], a                               ; $7C46: $E0 $E8
    jr   z, jr_006_7C50                           ; $7C48: $28 $06

    ld   [hl], b                                  ; $7C4A: $70
    ld   hl, wEntitiesSpeedZTable                 ; $7C4B: $21 $20 $C3
    add  hl, bc                                   ; $7C4E: $09
    ld   [hl], b                                  ; $7C4F: $70

jr_006_7C50:
    ldh  a, [hActiveEntityType]                   ; $7C50: $F0 $EB
    cp   $1B                                      ; $7C52: $FE $1B
    jr   nz, jr_006_7CB7                          ; $7C54: $20 $61

    ld   hl, wEntitiesFlashCountdownTable         ; $7C56: $21 $20 $C4
    add  hl, bc                                   ; $7C59: $09
    ld   a, [hl]                                  ; $7C5A: $7E
    cp   $08                                      ; $7C5B: $FE $08
    jr   nz, jr_006_7CB7                          ; $7C5D: $20 $58

    ld   [hl], b                                  ; $7C5F: $70
    ld   hl, wEntitiesLoadOrderTable              ; $7C60: $21 $60 $C4
    add  hl, bc                                   ; $7C63: $09
    ld   a, [hl]                                  ; $7C64: $7E
    push hl                                       ; $7C65: $E5
    push af                                       ; $7C66: $F5
    ld   hl, wEntitiesTypeTable                   ; $7C67: $21 $A0 $C3

jr_006_7C6A:
    add  hl, bc                                   ; $7C6A: $09
    ld   [hl], $1C                                ; $7C6B: $36 $1C
    call label_3965                               ; $7C6D: $CD $65 $39
    pop  af                                       ; $7C70: $F1
    pop  hl                                       ; $7C71: $E1
    ld   [hl], a                                  ; $7C72: $77
    ld   hl, wEntitiesPosXTable                   ; $7C73: $21 $00 $C2
    add  hl, bc                                   ; $7C76: $09
    ld   a, [hl]                                  ; $7C77: $7E
    sub  $04                                      ; $7C78: $D6 $04
    ld   [hl], a                                  ; $7C7A: $77
    call ClearEntitySpeed                         ; $7C7B: $CD $7F $3D
    ld   hl, wEntitiesUnknowTableT                ; $7C7E: $21 $10 $C4
    add  hl, bc                                   ; $7C81: $09
    ld   [hl], b                                  ; $7C82: $70
    ld   hl, wEntitiesSpeedZTable                 ; $7C83: $21 $20 $C3
    add  hl, bc                                   ; $7C86: $09
    ld   [hl], $20                                ; $7C87: $36 $20
    ld   a, $1C                                   ; $7C89: $3E $1C
    call SpawnNewEntity_trampoline                ; $7C8B: $CD $86 $3B
    jr   c, jr_006_7CB7                           ; $7C8E: $38 $27

    ld   hl, wEntitiesLoadOrderTable              ; $7C90: $21 $60 $C4
    add  hl, bc                                   ; $7C93: $09
    ld   a, [hl]                                  ; $7C94: $7E
    ld   hl, wEntitiesLoadOrderTable              ; $7C95: $21 $60 $C4
    add  hl, de                                   ; $7C98: $19
    ld   [hl], a                                  ; $7C99: $77
    ldh  a, [hScratch0]                           ; $7C9A: $F0 $D7
    add  $08                                      ; $7C9C: $C6 $08
    ld   hl, wEntitiesPosXTable                   ; $7C9E: $21 $00 $C2
    add  hl, de                                   ; $7CA1: $19
    ld   [hl], a                                  ; $7CA2: $77
    ldh  a, [hScratch1]                           ; $7CA3: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7CA5: $21 $10 $C2
    add  hl, de                                   ; $7CA8: $19
    ld   [hl], a                                  ; $7CA9: $77
    ldh  a, [hScratch3]                           ; $7CAA: $F0 $DA
    ld   hl, wEntitiesPosZTable                   ; $7CAC: $21 $10 $C3
    add  hl, de                                   ; $7CAF: $19
    ld   [hl], a                                  ; $7CB0: $77
    ld   hl, wEntitiesSpeedZTable                 ; $7CB1: $21 $20 $C3
    add  hl, de                                   ; $7CB4: $19
    ld   [hl], $20                                ; $7CB5: $36 $20

jr_006_7CB7:
    call func_006_64F7                            ; $7CB7: $CD $F7 $64
    ld   hl, wEntitiesUnknowTableG                ; $7CBA: $21 $00 $C3
    add  hl, bc                                   ; $7CBD: $09
    ld   a, [hl]                                  ; $7CBE: $7E
    and  a                                        ; $7CBF: $A7
    jr   nz, jr_006_7CD4                          ; $7CC0: $20 $12

    ldh  a, [hActiveEntityState]                  ; $7CC2: $F0 $F0
    and  $01                                      ; $7CC4: $E6 $01
    ld   hl, wEntitiesSpriteVariantTable          ; $7CC6: $21 $B0 $C3
    add  hl, bc                                   ; $7CC9: $09
    ld   [hl], a                                  ; $7CCA: $77
    dec  a                                        ; $7CCB: $3D
    jr   nz, jr_006_7CD4                          ; $7CCC: $20 $06

    ld   hl, wEntitiesUnknowTableG                ; $7CCE: $21 $00 $C3
    add  hl, bc                                   ; $7CD1: $09
    ld   [hl], $08                                ; $7CD2: $36 $08

jr_006_7CD4:
    ldh  a, [hActiveEntityState]                  ; $7CD4: $F0 $F0
    cp   $04                                      ; $7CD6: $FE $04
    jr   z, jr_006_7CE5                           ; $7CD8: $28 $0B

    ld   hl, wEntitiesUnknowTableV                ; $7CDA: $21 $80 $C4
    add  hl, bc                                   ; $7CDD: $09
    ld   a, [hl]                                  ; $7CDE: $7E
    and  a                                        ; $7CDF: $A7
    jr   nz, jr_006_7CE5                          ; $7CE0: $20 $03

    call label_3B39                               ; $7CE2: $CD $39 $3B

jr_006_7CE5:
    ldh  a, [hActiveEntityState]                  ; $7CE5: $F0 $F0
    JP_TABLE                                      ; $7CE7
._00 dw GelState0Handler
._01 dw GelState1Handler
._02 dw GelState2Handler
._03 dw GelState3Handler
._04 dw GelState4Handler

GelState1Handler::
    call GetEntityTransitionCountdown             ; $7CF2: $CD $05 $0C
    jr   nz, func_006_7D0F                        ; $7CF5: $20 $18

    ld   [hl], $10                                ; $7CF7: $36 $10
    call ClearEntitySpeed                         ; $7CF9: $CD $7F $3D
    call GetRandomByte                            ; $7CFC: $CD $0D $28
    and  $0F                                      ; $7CFF: $E6 $0F
    jr   nz, jr_006_7D0B                          ; $7D01: $20 $08

    call GetEntityTransitionCountdown             ; $7D03: $CD $05 $0C
    ld   [hl], $50                                ; $7D06: $36 $50
    jp   IncrementEntityState                     ; $7D08: $C3 $12 $3B

jr_006_7D0B:
    call IncrementEntityState                     ; $7D0B: $CD $12 $3B
    ld   [hl], b                                  ; $7D0E: $70

func_006_7D0F::
    call func_006_6541                            ; $7D0F: $CD $41 $65
    call IsEntityUnknownFZero                     ; $7D12: $CD $00 $0C
    ret  nz                                       ; $7D15: $C0

    ld   hl, wEntitiesUnknowTableT                ; $7D16: $21 $10 $C4
    add  hl, bc                                   ; $7D19: $09
    ld   [hl], $02                                ; $7D1A: $36 $02
    call label_3B23                               ; $7D1C: $CD $23 $3B
    ld   hl, wEntitiesUnknowTableT                ; $7D1F: $21 $10 $C4
    add  hl, bc                                   ; $7D22: $09
    ld   [hl], b                                  ; $7D23: $70
    ret                                           ; $7D24: $C9

GelState0Handler::
    call func_006_7D0F                            ; $7D25: $CD $0F $7D
    call GetEntityTransitionCountdown             ; $7D28: $CD $05 $0C
    ret  nz                                       ; $7D2B: $C0

    ld   [hl], $07                                ; $7D2C: $36 $07
    call IncrementEntityState                     ; $7D2E: $CD $12 $3B
    ld   a, $04                                   ; $7D31: $3E $04
    jp   ApplyVectorTowardsLink_trampoline        ; $7D33: $C3 $AA $3B

GelState2Handler::
    call GetEntityTransitionCountdown             ; $7D36: $CD $05 $0C
    jr   nz, jr_006_7D4A                          ; $7D39: $20 $0F

    call IncrementEntityState                     ; $7D3B: $CD $12 $3B
    ld   a, $10                                   ; $7D3E: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $7D40: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $7D43: $21 $20 $C3
    add  hl, bc                                   ; $7D46: $09
    ld   [hl], $20                                ; $7D47: $36 $20
    ret                                           ; $7D49: $C9

jr_006_7D4A:
    call GetEntityTransitionCountdown             ; $7D4A: $CD $05 $0C
    ld   hl, wEntitiesSpeedXTable                 ; $7D4D: $21 $40 $C2
    add  hl, bc                                   ; $7D50: $09
    and  $04                                      ; $7D51: $E6 $04
    jr   nz, jr_006_7D59                          ; $7D53: $20 $04

    ld   [hl], $08                                ; $7D55: $36 $08
    jr   jr_006_7D5B                              ; $7D57: $18 $02

jr_006_7D59:
    ld   [hl], $F8                                ; $7D59: $36 $F8

jr_006_7D5B:
    ld   hl, wEntitiesSpeedYTable                 ; $7D5B: $21 $50 $C2
    add  hl, bc                                   ; $7D5E: $09
    ld   [hl], b                                  ; $7D5F: $70
    jp   func_006_7D0F                            ; $7D60: $C3 $0F $7D

GelState3Handler::
    call func_006_7D0F                            ; $7D63: $CD $0F $7D
    ldh  a, [hFFE8]                               ; $7D66: $F0 $E8
    and  a                                        ; $7D68: $A7
    jr   z, jr_006_7D6F                           ; $7D69: $28 $04

    call IncrementEntityState                     ; $7D6B: $CD $12 $3B
    ld   [hl], b                                  ; $7D6E: $70

jr_006_7D6F:
    ret                                           ; $7D6F: $C9

GelState4Handler::
    call GetEntityTransitionCountdown             ; $7D70: $CD $05 $0C
    jr   nz, jr_006_7D91                          ; $7D73: $20 $1C

    ld   hl, wEntitiesUnknowTableV                ; $7D75: $21 $80 $C4
    add  hl, bc                                   ; $7D78: $09
    ld   [hl], $30                                ; $7D79: $36 $30
    ld   a, $10                                   ; $7D7B: $3E $10
    call ApplyVectorTowardsLink_trampoline        ; $7D7D: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $7D80: $21 $20 $C3
    add  hl, bc                                   ; $7D83: $09
    ld   [hl], $20                                ; $7D84: $36 $20
    ld   hl, wEntitiesPosZTable                   ; $7D86: $21 $10 $C3
    add  hl, bc                                   ; $7D89: $09
    inc  [hl]                                     ; $7D8A: $34
    call IncrementEntityState                     ; $7D8B: $CD $12 $3B
    ld   [hl], $03                                ; $7D8E: $36 $03
    ret                                           ; $7D90: $C9

jr_006_7D91:
    push af                                       ; $7D91: $F5
    rra                                           ; $7D92: $1F
    and  $07                                      ; $7D93: $E6 $07
    sub  $04                                      ; $7D95: $D6 $04
    ld   e, a                                     ; $7D97: $5F
    ldh  a, [hLinkPositionX]                      ; $7D98: $F0 $98
    sub  e                                        ; $7D9A: $93
    ld   hl, wEntitiesPosXTable                   ; $7D9B: $21 $00 $C2
    add  hl, bc                                   ; $7D9E: $09
    ld   [hl], a                                  ; $7D9F: $77
    pop  af                                       ; $7DA0: $F1
    rra                                           ; $7DA1: $1F
    rra                                           ; $7DA2: $1F
    and  $07                                      ; $7DA3: $E6 $07
    sub  $04                                      ; $7DA5: $D6 $04
    ld   e, a                                     ; $7DA7: $5F
    ldh  a, [hLinkPositionY]                      ; $7DA8: $F0 $99
    sub  e                                        ; $7DAA: $93
    ld   hl, wEntitiesPosYTable                   ; $7DAB: $21 $10 $C2
    add  hl, bc                                   ; $7DAE: $09
    ld   [hl], a                                  ; $7DAF: $77
    ldh  a, [hLinkPositionZ]                      ; $7DB0: $F0 $A2
    ld   hl, wEntitiesPosZTable                   ; $7DB2: $21 $10 $C3
    add  hl, bc                                   ; $7DB5: $09
    ld   [hl], a                                  ; $7DB6: $77
    ld   a, $01                                   ; $7DB7: $3E $01
    ld   [wC117], a                               ; $7DB9: $EA $17 $C1
    call label_3B23                               ; $7DBC: $CD $23 $3B
    ldh  a, [hJoypadState]                        ; $7DBF: $F0 $CC
    and  a                                        ; $7DC1: $A7
    jr   z, jr_006_7DD3                           ; $7DC2: $28 $0F

    call func_006_7DCD                            ; $7DC4: $CD $CD $7D
    call func_006_7DCD                            ; $7DC7: $CD $CD $7D
    call func_006_7DCD                            ; $7DCA: $CD $CD $7D

func_006_7DCD::
    call GetEntityTransitionCountdown             ; $7DCD: $CD $05 $0C
    jr   z, jr_006_7DD3                           ; $7DD0: $28 $01

    dec  [hl]                                     ; $7DD2: $35

jr_006_7DD3:
    ret                                           ; $7DD3: $C9

Data_003_7DD4::
    db   $7C, $01, $7C, $21, $7E, $01, $7E, $21

LikeLikeEntityHandler::
    ld   de, Data_003_7DD4                        ; $7DDC: $11 $D4 $7D
    call RenderAnimatedActiveEntity               ; $7DDF: $CD $C0 $3B
    call func_006_64C6                            ; $7DE2: $CD $C6 $64
    call func_006_64F7                            ; $7DE5: $CD $F7 $64
    ld   hl, wEntitiesUnknownTableD               ; $7DE8: $21 $D0 $C2
    add  hl, bc                                   ; $7DEB: $09
    ld   a, [hl]                                  ; $7DEC: $7E
    JP_TABLE                                      ; $7DED
._00 dw LikeLikeState0Handler
._01 dw LikeLikeState1Handler

LikeLikeState0Handler::
    call IsEntityDropTimerZero                    ; $7DF2: $CD $FB $0B
    jr   nz, jr_006_7E06                          ; $7DF5: $20 $0F

    call label_3B44                               ; $7DF7: $CD $44 $3B
    jr   nc, jr_006_7E06                          ; $7DFA: $30 $0A

    ld   hl, wEntitiesUnknownTableD               ; $7DFC: $21 $D0 $C2
    add  hl, bc                                   ; $7DFF: $09
    inc  [hl]                                     ; $7E00: $34
    ld   hl, wEntitiesUnknowTableY                ; $7E01: $21 $D0 $C3
    add  hl, bc                                   ; $7E04: $09
    ld   [hl], b                                  ; $7E05: $70

jr_006_7E06:
    call label_3B70                               ; $7E06: $CD $70 $3B

label_006_7E09:
    jp   label_006_7E9D                           ; $7E09: $C3 $9D $7E

LikeLikeState1Handler::
    ldh  a, [hJoypadState]                        ; $7E0C: $F0 $CC
    and  $30                                      ; $7E0E: $E6 $30
    jr   z, jr_006_7E27                           ; $7E10: $28 $15

    ld   hl, wEntitiesUnknowTableY                ; $7E12: $21 $D0 $C3
    add  hl, bc                                   ; $7E15: $09
    inc  [hl]                                     ; $7E16: $34
    ld   a, [hl]                                  ; $7E17: $7E
    cp   $08                                      ; $7E18: $FE $08
    jr   c, jr_006_7E27                           ; $7E1A: $38 $0B

    call IsEntityDropTimerZero                    ; $7E1C: $CD $FB $0B
    ld   [hl], $15                                ; $7E1F: $36 $15
    ld   hl, wEntitiesUnknownTableD               ; $7E21: $21 $D0 $C2
    add  hl, bc                                   ; $7E24: $09
    ld   [hl], b                                  ; $7E25: $70
    ret                                           ; $7E26: $C9

jr_006_7E27:
    ld   a, $FF                                   ; $7E27: $3E $FF
    ldh  [hLinkAnimationState], a                 ; $7E29: $E0 $9D
    ld   hl, wEntitiesPrivateState1Table          ; $7E2B: $21 $B0 $C2
    add  hl, bc                                   ; $7E2E: $09
    ld   a, [hl]                                  ; $7E2F: $7E
    and  a                                        ; $7E30: $A7
    jr   nz, jr_006_7E55                          ; $7E31: $20 $22

    ld   hl, wAButtonSlot                         ; $7E33: $21 $00 $DB
    ld   e, b                                     ; $7E36: $58

jr_006_7E37:
    ld   a, [hl]                                  ; $7E37: $7E
    cp   $04                                      ; $7E38: $FE $04
    jr   nz, jr_006_7E4E                          ; $7E3A: $20 $12

    ld   a, [wShieldLevel]                        ; $7E3C: $FA $44 $DB
    cp   $02                                      ; $7E3F: $FE $02
    jr   nc, jr_006_7E55                          ; $7E41: $30 $12

    ld   [hl], b                                  ; $7E43: $70
    ld   hl, wEntitiesPrivateState1Table          ; $7E44: $21 $B0 $C2
    add  hl, bc                                   ; $7E47: $09
    ld   a, [wShieldLevel]                        ; $7E48: $FA $44 $DB
    ld   [hl], a                                  ; $7E4B: $77
    jr   jr_006_7E55                              ; $7E4C: $18 $07

jr_006_7E4E:
    inc  hl                                       ; $7E4E: $23
    inc  e                                        ; $7E4F: $1C
    ld   a, e                                     ; $7E50: $7B
    cp   $02                                      ; $7E51: $FE $02
    jr   nz, jr_006_7E37                          ; $7E53: $20 $E2

jr_006_7E55:
    ld   a, [wLinkMotionState]                    ; $7E55: $FA $1C $C1
    cp   $00                                      ; $7E58: $FE $00
    ret  nz                                       ; $7E5A: $C0

    ldh  a, [hActiveEntityPosX]                   ; $7E5B: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $7E5D: $E0 $98
    ldh  a, [hActiveEntityPosY]                   ; $7E5F: $F0 $EF
    ldh  [hLinkPositionY], a                      ; $7E61: $E0 $99
    xor  a                                        ; $7E63: $AF
    ld   [$C146], a                               ; $7E64: $EA $46 $C1
    ldh  [hLinkPositionZ], a                      ; $7E67: $E0 $A2
    call func_006_7F05                            ; $7E69: $CD $05 $7F
    jp   func_006_7F05                            ; $7E6C: $C3 $05 $7F

Data_006_7E6F::
    db   $74, $02, $76, $02, $76, $22, $74, $22

Data_006_7E77::
    db   $44, $02, $46, $02, $46, $22, $44, $22

Data_006_7E7F::
    db   $00, $08, $F8, $00, $F8, $08

GibdoEntityHandler::
    ld   de, Data_006_7E6F                        ; $7E85: $11 $6F $7E
    ldh  a, [hMapId]                              ; $7E88: $F0 $F7
    cp   $07                                      ; $7E8A: $FE $07
    jr   nz, jr_006_7E91                          ; $7E8C: $20 $03

    ld   de, Data_006_7E77                        ; $7E8E: $11 $77 $7E

jr_006_7E91:
    call RenderAnimatedActiveEntity               ; $7E91: $CD $C0 $3B
    call func_006_64C6                            ; $7E94: $CD $C6 $64
    call func_C56                                 ; $7E97: $CD $56 $0C
    call label_3B39                               ; $7E9A: $CD $39 $3B

label_006_7E9D:
    call func_006_6541                            ; $7E9D: $CD $41 $65
    call label_3B23                               ; $7EA0: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $7EA3: $21 $A0 $C2
    add  hl, bc                                   ; $7EA6: $09
    ld   a, [hl]                                  ; $7EA7: $7E
    and  $03                                      ; $7EA8: $E6 $03
    jr   nz, jr_006_7EBB                          ; $7EAA: $20 $0F

    ld   a, [hl]                                  ; $7EAC: $7E
    and  $0C                                      ; $7EAD: $E6 $0C
    jr   z, jr_006_7EC3                           ; $7EAF: $28 $12

    ld   hl, wEntitiesSpeedYTable                 ; $7EB1: $21 $50 $C2
    add  hl, bc                                   ; $7EB4: $09
    ld   a, [hl]                                  ; $7EB5: $7E
    xor  $F0                                      ; $7EB6: $EE $F0
    ld   [hl], a                                  ; $7EB8: $77
    jr   jr_006_7EC3                              ; $7EB9: $18 $08

jr_006_7EBB:
    ld   hl, wEntitiesSpeedXTable                 ; $7EBB: $21 $40 $C2
    add  hl, bc                                   ; $7EBE: $09
    ld   a, [hl]                                  ; $7EBF: $7E
    xor  $F0                                      ; $7EC0: $EE $F0
    ld   [hl], a                                  ; $7EC2: $77

jr_006_7EC3:
    ld   hl, wEntitiesStateTable                  ; $7EC3: $21 $90 $C2
    add  hl, bc                                   ; $7EC6: $09
    ld   a, [hl]                                  ; $7EC7: $7E
    and  a                                        ; $7EC8: $A7
    jr   nz, jr_006_7ED2                          ; $7EC9: $20 $07

    call GetRandomByte                            ; $7ECB: $CD $0D $28
    and  $3F                                      ; $7ECE: $E6 $3F
    jr   nz, jr_006_7EFF                          ; $7ED0: $20 $2D

jr_006_7ED2:
    xor  a                                        ; $7ED2: $AF
    ld   hl, wEntitiesSpeedYTable                 ; $7ED3: $21 $50 $C2
    add  hl, bc                                   ; $7ED6: $09
    ld   [hl], a                                  ; $7ED7: $77
    call GetRandomByte                            ; $7ED8: $CD $0D $28
    and  $03                                      ; $7EDB: $E6 $03
    ld   e, a                                     ; $7EDD: $5F
    ld   d, b                                     ; $7EDE: $50
    ld   hl, Data_006_7E7F                        ; $7EDF: $21 $7F $7E
    add  hl, de                                   ; $7EE2: $19
    ld   a, [hl]                                  ; $7EE3: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7EE4: $21 $40 $C2
    add  hl, bc                                   ; $7EE7: $09
    ld   [hl], a                                  ; $7EE8: $77
    and  a                                        ; $7EE9: $A7
    jr   nz, jr_006_7EFF                          ; $7EEA: $20 $13

    call GetRandomByte                            ; $7EEC: $CD $0D $28
    and  $01                                      ; $7EEF: $E6 $01
    add  $04                                      ; $7EF1: $C6 $04
    ld   e, a                                     ; $7EF3: $5F
    ld   d, b                                     ; $7EF4: $50
    ld   hl, Data_006_7E7F                        ; $7EF5: $21 $7F $7E
    add  hl, de                                   ; $7EF8: $19
    ld   a, [hl]                                  ; $7EF9: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $7EFA: $21 $50 $C2
    add  hl, bc                                   ; $7EFD: $09
    ld   [hl], a                                  ; $7EFE: $77

jr_006_7EFF:
    ld   hl, wEntitiesStateTable                  ; $7EFF: $21 $90 $C2
    add  hl, bc                                   ; $7F02: $09
    xor  a                                        ; $7F03: $AF
    ld   [hl], a                                  ; $7F04: $77

func_006_7F05::
    ld   hl, wEntitiesUnknowTableP                ; $7F05: $21 $40 $C4
    add  hl, bc                                   ; $7F08: $09
    ld   a, [hl]                                  ; $7F09: $7E
    inc  [hl]                                     ; $7F0A: $34
    rra                                           ; $7F0B: $1F
    rra                                           ; $7F0C: $1F
    rra                                           ; $7F0D: $1F
    rra                                           ; $7F0E: $1F
    and  $01                                      ; $7F0F: $E6 $01
    jp   SetEntitySpriteVariant                   ; $7F11: $C3 $0C $3B
