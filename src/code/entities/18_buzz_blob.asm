
; Note: this entity, unlike most others, use 3 spriteslots (out of 4 available).
;
; In usual gameplay, only 2 spriteslots are updated during a room transition.
; The map transition code is special-cased for the color-dungeon to handle this.


; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
BuzzBlobSpriteVariants::
.variant0
    db $62, OAM_GBC_PAL_0 | OAMF_PAL0
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0
.variant1
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $64, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $62, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0
.variant4
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0
    db $60, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $68, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $66, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant6
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0
.variant7
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0
    db $6A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant8
    db $6E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $6C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

Data_018_774D::
    db   $00, $01, $02, $01

Data_018_7751::
    db   $03, $04, $05, $04

Data_018_7755::
    db   $06, $07, $08, $07

BuzzBlobEntityHandler::
    ldh  a, [hMapId]                              ; $7759: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $775B: $FE $FF
    jr   nz, .jr_7764                             ; $775D: $20 $05

    ld   a, $18                                   ; $775F: $3E $18
    jp   func_036_4F68_trampoline                 ; $7761: $C3 $77 $0A

.jr_7764
    ld   de, BuzzBlobSpriteVariants               ; $7764: $11 $29 $77
    call RenderActiveEntitySpritesPair            ; $7767: $CD $C0 $3B
    call ReturnIfNonInteractive_18                ; $776A: $CD $E8 $7D
    call ApplyRecoilIfNeeded_18                   ; $776D: $CD $15 $7E
    call label_3B39                               ; $7770: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $7773: $F0 $F0
    JP_TABLE                                      ; $7775
._00 dw BuzzBlobState0Handler
._01 dw BuzzBlobState1Handler

Data_018_777A::
    db   $FA, $FC

Data_018_777C::
    db   $00, $04, $06, $04, $00, $FC, $FA, $FC

BuzzBlobState0Handler::
    call GetEntityTransitionCountdown             ; $7784: $CD $05 $0C
    jr   nz, .jr_77A9                             ; $7787: $20 $20

    call GetRandomByte                            ; $7789: $CD $0D $28
    and  $3F                                      ; $778C: $E6 $3F
    add  $30                                      ; $778E: $C6 $30
    ld   [hl], a                                  ; $7790: $77
    and  $07                                      ; $7791: $E6 $07
    ld   e, a                                     ; $7793: $5F
    ld   d, b                                     ; $7794: $50
    ld   hl, Data_018_777C                        ; $7795: $21 $7C $77
    add  hl, de                                   ; $7798: $19
    ld   a, [hl]                                  ; $7799: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $779A: $21 $40 $C2
    add  hl, bc                                   ; $779D: $09
    ld   [hl], a                                  ; $779E: $77
    ld   hl, Data_018_777A                        ; $779F: $21 $7A $77
    add  hl, de                                   ; $77A2: $19
    ld   a, [hl]                                  ; $77A3: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $77A4: $21 $50 $C2
    add  hl, bc                                   ; $77A7: $09
    ld   [hl], a                                  ; $77A8: $77

.jr_77A9
    call UpdateEntityPosWithSpeed_18              ; $77A9: $CD $5F $7E
    call label_3B23                               ; $77AC: $CD $23 $3B
    ld   hl, wEntitiesPrivateState1Table          ; $77AF: $21 $B0 $C2
    add  hl, bc                                   ; $77B2: $09
    ld   a, [hl]                                  ; $77B3: $7E
    ld   hl, Data_018_774D                        ; $77B4: $21 $4D $77
    and  a                                        ; $77B7: $A7

.jr_77B8
    jr   z, label_018_77CF                        ; $77B8: $28 $15

    call func_018_7D95                            ; $77BA: $CD $95 $7D
    jr   nc, .jr_77CC                             ; $77BD: $30 $0D

    ld   hl, wEntitiesPrivateState2Table          ; $77BF: $21 $C0 $C2
    add  hl, bc                                   ; $77C2: $09
    ld   a, [hl]                                  ; $77C3: $7E
    and  $03                                      ; $77C4: $E6 $03
    add  $7C ; open Dialog27C, Dialog27D, Dialog27E or Dialog27F ; $77C6: $C6 $7C
    inc  [hl]                                     ; $77C8: $34
    call OpenDialogInTable2                       ; $77C9: $CD $7C $23

.jr_77CC
    ld   hl, Data_018_7755                        ; $77CC: $21 $55 $77

label_018_77CF:
    ldh  a, [hFrameCounter]                       ; $77CF: $F0 $E7
    rra                                           ; $77D1: $1F
    rra                                           ; $77D2: $1F
    rra                                           ; $77D3: $1F
    and  $03                                      ; $77D4: $E6 $03
    ld   e, a                                     ; $77D6: $5F
    ld   d, b                                     ; $77D7: $50
    add  hl, de                                   ; $77D8: $19
    ld   a, [hl]                                  ; $77D9: $7E
    jp   SetEntitySpriteVariant                   ; $77DA: $C3 $0C $3B

BuzzBlobState1Handler::
    call GetEntityTransitionCountdown             ; $77DD: $CD $05 $0C
    jr   nz, .jr_77E7                             ; $77E0: $20 $05

    call IncrementEntityState                     ; $77E2: $CD $12 $3B
    ld   [hl], b                                  ; $77E5: $70
    ret                                           ; $77E6: $C9

.jr_77E7
    ld   hl, Data_018_7751                        ; $77E7: $21 $51 $77
    jp   label_018_77CF                           ; $77EA: $C3 $CF $77
