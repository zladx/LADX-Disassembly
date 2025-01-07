CrazyTracySpriteAttributes::
._00 db   $00, $00, $64, $02, $00, $08, $66, $02, $10, $00, $68, $02, $10, $08, $6A, $02
._01 db   $00, $00, $60, $02, $00, $08, $62, $02, $10, $00, $68, $02, $10, $08, $6A, $02
._02 db   $00, $00, $66, $22, $00, $08, $64, $22, $10, $00, $6A, $22, $10, $08, $68, $22

MedicineSpriteAttributes::
    db   $A0, $14

CrazyTracyEntityHandler::
    ;
    ; Move Tracy so that she appears seated on its stool.
    ;

    ; Extend Tracy's hitbox to the top, so that Link
    ; can't walk over Tracy's head.
    push bc                                       ;; 06:5E95 $C5
    sla  c                                        ;; 06:5E96 $CB $21
    sla  c                                        ;; 06:5E98 $CB $21
    ld   hl, wEntitiesHitboxPositionTable         ;; 06:5E9A $21 $80 $D5
    add  hl, bc                                   ;; 06:5E9D $09
    inc  hl                                       ;; 06:5E9E $23
    inc  hl                                       ;; 06:5E9F $23
    inc  hl                                       ;; 06:5EA0 $23
    ld   a, $0A                                   ;; 06:5EA1 $3E $0A
    ld   [hl], a                                  ;; 06:5EA3 $77
    pop  bc                                       ;; 06:5EA4 $C1

    ; Move Tracy up
    ld   hl, wEntitiesPosYTable                   ;; 06:5EA5 $21 $10 $C2
    add  hl, bc                                   ;; 06:5EA8 $09
    ld   a, $28                                   ;; 06:5EA9 $3E $28
    ld   [hl], a                                  ;; 06:5EAB $77

    ;
    ; When Link just got the Medicine, display the Medicine
    ; over its head.
    ;

    call GetEntityTransitionCountdown             ;; 06:5EAC $CD $05 $0C
    jr   z, .gotMedicineEnd                       ;; 06:5EAF $28 $2D

    ; Position the medicine sprite above Link
    ldh  a, [hLinkPositionX]                      ;; 06:5EB1 $F0 $98
    ldh  [hActiveEntityPosX], a                   ;; 06:5EB3 $E0 $EE
    ld   a, [wC145]                               ;; 06:5EB5 $FA $45 $C1
    sub  $10                                      ;; 06:5EB8 $D6 $10
    ldh  [hActiveEntityVisualPosY], a             ;; 06:5EBA $E0 $EC

    ; Configure Link appearance
    ld   a, LINK_ANIMATION_STATE_GOT_ITEM         ;; 06:5EBC $3E $6C
    ldh  [hLinkAnimationState], a                 ;; 06:5EBE $E0 $9D
    ld   a, $02                                   ;; 06:5EC0 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 06:5EC2 $E0 $A1
    ld   a, DIRECTION_DOWN                        ;; 06:5EC4 $3E $03
    ldh  [hLinkDirection], a                      ;; 06:5EC6 $E0 $9E
    ; reset sword parameter
    xor  a                                        ;; 06:5EC8 $AF
    ld   [wSwordAnimationState], a                ;; 06:5EC9 $EA $37 $C1
    ld   [wC16A], a                               ;; 06:5ECC $EA $6A $C1
    ld   [wSwordCharge], a                        ;; 06:5ECF $EA $22 $C1
    ld   [wIsUsingSpinAttack], a                  ;; 06:5ED2 $EA $21 $C1

    ld   de, MedicineSpriteAttributes             ;; 06:5ED5 $11 $93 $5E
    call RenderActiveEntitySprite                 ;; 06:5ED8 $CD $77 $3C
    call CopyEntityPositionToActivePosition       ;; 06:5EDB $CD $8A $3D
.gotMedicineEnd

    ;
    ; Turn Tracy's head if Link is on the side
    ;

    ld   e, $00                                   ;; 06:5EDE $1E $00
    ldh  a, [hLinkPositionX]                      ;; 06:5EE0 $F0 $98
    cp   $30                                      ;; 06:5EE2 $FE $30
    jr   c, .turnHeadEnd                          ;; 06:5EE4 $38 $08

    ld   e, $01                                   ;; 06:5EE6 $1E $01
    cp   $60                                      ;; 06:5EE8 $FE $60
    jr   c, .turnHeadEnd                          ;; 06:5EEA $38 $02

    ld   e, $02                                   ;; 06:5EEC $1E $02
.turnHeadEnd

    ld   a, e                                     ;; 06:5EEE $7B
    ldh  [hActiveEntitySpriteVariant], a          ;; 06:5EEF $E0 $F1

    rla                                           ;; 06:5EF1 $17
    rla                                           ;; 06:5EF2 $17
    rla                                           ;; 06:5EF3 $17
    rla                                           ;; 06:5EF4 $17
    and  $F0                                      ;; 06:5EF5 $E6 $F0
    ld   e, a                                     ;; 06:5EF7 $5F
    ld   d, b                                     ;; 06:5EF8 $50
    ld   hl, CrazyTracySpriteAttributes           ;; 06:5EF9 $21 $63 $5E
    add  hl, de                                   ;; 06:5EFC $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 06:5EFD $F0 $EC
    sub  $04                                      ;; 06:5EFF $D6 $04
    ldh  [hActiveEntityVisualPosY], a             ;; 06:5F01 $E0 $EC
    ld   c, $04                                   ;; 06:5F03 $0E $04
    call RenderActiveEntitySpritesRect            ;; 06:5F05 $CD $E6 $3C
    ld   a, $04                                   ;; 06:5F08 $3E $04
    call func_015_7964_trampoline                 ;; 06:5F0A $CD $A0 $3D
    call CopyEntityPositionToActivePosition       ;; 06:5F0D $CD $8A $3D
    call ReturnIfNonInteractive_06                ;; 06:5F10 $CD $C6 $64
    call PushLinkOutOfEntity_06                   ;; 06:5F13 $CD $1A $64

    ldh  a, [hActiveEntityState]                  ;; 06:5F16 $F0 $F0
    JP_TABLE                                      ;; 06:5F18
._00 dw CrazyTracyGreetingHandler
._01 dw CrazyTracyProposingPriceHandler
._02 dw CrazyTracySellingHandler
._03 dw CrazyTracyDialogResponseHandler
._04 dw CrazyTracyBonusHandler

; Set c if Link is close to Tracy, and pressed a button to talk to her.
ShouldLinkTalkToTracy::
    ldh  a, [hLinkPositionY]                      ;; 06:5F23 $F0 $99
    ld   hl, hActiveEntityPosY                    ;; 06:5F25 $21 $EF $FF
    sub  [hl]                                     ;; 06:5F28 $96
    add  $28                                      ;; 06:5F29 $C6 $28
    cp   $50                                      ;; 06:5F2B $FE $50
    jp   CheckLinkInteractionWithEntity_06.label_006_647E ;; 06:5F2D $C3 $7E $64

CrazyTracyGreetingHandler::
    call ShouldLinkTalkToTracy                    ;; 06:5F30 $CD $23 $5F
    ret  nc                                       ;; 06:5F33 $D0

    ; Open Tracy greeting dialog
    call_open_dialog Dialog017                    ;; 06:5F34
    ld   hl, wDialogState                         ;; 06:5F39 $21 $9F $C1
    set  DIALOG_BOX_BOTTOM_BIT, [hl]              ;; 06:5F3C $CB $FE

    ; Gather the informations for the medicine price.
    ; wEntitiesPrivateState1Table is wether Tracy makes a discount:
    ;   Total number of killed enemies is even: 28 rupees
    ;   Total number of killed enemies is odd:  42 rupees
    ;   Every 8th purchase: 7 rupees
    ld   a, [wPieceOfPowerKillCount]              ;; 06:5F3E $FA $15 $D4
    and  $01                                      ;; 06:5F41 $E6 $01
    ld   hl, wEntitiesPrivateState1Table          ;; 06:5F43 $21 $B0 $C2
    add  hl, bc                                   ;; 06:5F46 $09
    ld   [hl], a                                  ;; 06:5F47 $77

    ld   a, [wPurchasedMedicineCount]             ;; 06:5F48 $FA $75 $DB
    cp   $07                                      ;; 06:5F4B $FE $07
    jr   nz, .discountEnd                         ;; 06:5F4D $20 $02
    inc  [hl]                                     ;; 06:5F4F $34
    inc  [hl]                                     ;; 06:5F50 $34
.discountEnd

    ; Move to the next state
    jp   IncrementEntityState                     ;; 06:5F51 $C3 $12 $3B

CrazyTracyProposingPriceHandler::
    call ShouldLinkTalkToTracy                    ;; 06:5F54 $CD $23 $5F
    ret  nc                                       ;; 06:5F57 $D0

    ; If Link doesn’t already have the medicine…
    ld   a, [wHasMedicine]                        ;; 06:5F58 $FA $0D $DB
    and  a                                        ;; 06:5F5B $A7
    jr   nz, .giveMedicinePriceEnd                ;; 06:5F5C $20 $18
    ; Open the dialog proposing to sell the medicine.
    ; (See wEntitiesPrivateState1Table for the price)
    ld   hl, wEntitiesPrivateState1Table          ;; 06:5F5E $21 $B0 $C2
    add  hl, bc                                   ;; 06:5F61 $09
    ld   a, [hl]                                  ;; 06:5F62 $7E
    and  $01                                      ;; 06:5F63 $E6 $01
    ld_dialog_low a, Dialog018 ; "Will you give 28 Rupees?" ;; 06:5F65 $3E $18
    jr   z, .priceEnd                             ;; 06:5F67 $28 $02
    ld_dialog_low a, Dialog019 ; "How about 42 Rupees?" ;; 06:5F69 $3E $19
.priceEnd

    call OpenDialogInTable0                       ;; 06:5F6B $CD $85 $23
    ld   hl, wDialogState                         ;; 06:5F6E $21 $9F $C1
    set  DIALOG_BOX_BOTTOM_BIT, [hl]              ;; 06:5F71 $CB $FE
    jp   IncrementEntityState                     ;; 06:5F73 $C3 $12 $3B
.giveMedicinePriceEnd

    ; Link already has a medicine in the inventory:
    ; open the "No medicine for you!" dialog.
    call_open_dialog Dialog01C                    ;; 06:5F76
    ld   hl, wDialogState                         ;; 06:5F7B $21 $9F $C1
    set  DIALOG_BOX_BOTTOM_BIT, [hl]              ;; 06:5F7E $CB $FE
    ret                                           ;; 06:5F80 $C9

MedicinePriceCharacters::
    db   $28, $42, $07, $07

Data_006_5F85::
    db   $00, $00, $00, $00

MedicinePriceDecimal::
    db   28, 42, 7, 7

Data_006_5F8D::
    db   $00, $00, $00, $00

CrazyTracySellingHandler::
    ld   a, [wDialogState]                        ;; 06:5F91 $FA $9F $C1
    and  a                                        ;; 06:5F94 $A7
    jp   nz, CrazyTracySellingHandler.return      ;; 06:5F95 $C2 $1B $60

    ld   a, [wDialogAskSelectionIndex]            ;; 06:5F98 $FA $77 $C1
    and  a                                        ;; 06:5F9B $A7
    jr   nz, .refusedMedicine

    ; Open the "Too bad" dialog                   ;; 06:5F9C $20 $6F
    ld   hl, wEntitiesPrivateState1Table          ;; 06:5F9E $21 $B0 $C2
    add  hl, bc                                   ;; 06:5FA1 $09
    ld   e, [hl]                                  ;; 06:5FA2 $5E
    ld   d, b                                     ;; 06:5FA3 $50
    ld   hl, Data_006_5F85                        ;; 06:5FA4 $21 $85 $5F
    add  hl, de                                   ;; 06:5FA7 $19
    ld   a, [hl]                                  ;; 06:5FA8 $7E
    ld   hl, MedicinePriceCharacters              ;; 06:5FA9 $21 $81 $5F
    add  hl, de                                   ;; 06:5FAC $19
    ld   e, [hl]                                  ;; 06:5FAD $5E
    ld   d, a                                     ;; 06:5FAE $57
    ld   a, [wRupeeCountLow]                      ;; 06:5FAF $FA $5E $DB
    sub  e                                        ;; 06:5FB2 $93
    ld   a, [wRupeeCountHigh]                     ;; 06:5FB3 $FA $5D $DB
    sbc  d                                        ;; 06:5FB6 $9A
    jr   nc, .jr_006_5FBD                         ;; 06:5FB7 $30 $04

    ld   a, $01B                                  ;; 06:5FB9 $3E $1B
    jr   CrazyTracySellingHandler.openFinalDialog ;; 06:5FBB $18 $52

.jr_006_5FBD

    ; Every 8th purchased medicine, give a discount
    ld   a, [wPurchasedMedicineCount]             ;; 06:5FBD $FA $75 $DB
    inc  a                                        ;; 06:5FC0 $3C
    and  $07                                      ;; 06:5FC1 $E6 $07
    ld   [wPurchasedMedicineCount], a             ;; 06:5FC3 $EA $75 $DB
    jr   nz, .buy                                 ;; 06:5FC6 $20 $0D
    ; Open "I'll give you a discount dialog"
    call_open_dialog Dialog01E                    ;; 06:5FC8
    ld   hl, wDialogState                         ;; 06:5FCD $21 $9F $C1
    set  DIALOG_BOX_BOTTOM_BIT, [hl]              ;; 06:5FD0 $CB $FE
    jp   IncrementEntityState                     ;; 06:5FD2 $C3 $12 $3B

.buy
    ;
    ; Buy the medicine
    ;

    ld   hl, wEntitiesPrivateState1Table          ;; 06:5FD5 $21 $B0 $C2
    add  hl, bc                                   ;; 06:5FD8 $09
    ld   e, [hl]                                  ;; 06:5FD9 $5E
    ld   d, b                                     ;; 06:5FDA $50
    ld   hl, MedicinePriceDecimal                 ;; 06:5FDB $21 $89 $5F
    add  hl, de                                   ;; 06:5FDE $19
    ld   a, [wSubstractRupeeBufferLow]            ;; 06:5FDF $FA $92 $DB
    add  [hl]                                     ;; 06:5FE2 $86
    ld   [wSubstractRupeeBufferLow], a            ;; 06:5FE3 $EA $92 $DB
    rl   a                                        ;; 06:5FE6 $CB $17
    ld   hl, Data_006_5F8D                        ;; 06:5FE8 $21 $8D $5F
    add  hl, de                                   ;; 06:5FEB $19
    rr   a                                        ;; 06:5FEC $CB $1F
    ld   a, [wSubstractRupeeBufferHigh]           ;; 06:5FEE $FA $91 $DB
    adc  [hl]                                     ;; 06:5FF1 $8E
    ld   [wSubstractRupeeBufferHigh], a           ;; 06:5FF2 $EA $91 $DB
    ld   hl, wHasMedicine                         ;; 06:5FF5 $21 $0D $DB
    inc  [hl]                                     ;; 06:5FF8 $34

    ; Open the "Ok done" dialog
    ld   a, $01A                                  ;; 06:5FF9 $3E $1A
    call CrazyTracySellingHandler.openFinalDialog ;; 06:5FFB $CD $0F $60
    ; Transition to state 4
    call IncrementEntityState                     ;; 06:5FFE $CD $12 $3B
    ld   [hl], $04                                ;; 06:6001 $36 $04
    call GetEntityTransitionCountdown             ;; 06:6003 $CD $05 $0C
    ld   [hl], $20                                ;; 06:6006 $36 $20
    ld   a, JINGLE_TREASURE_FOUND                 ;; 06:6008 $3E $01
    ldh  [hJingle], a                             ;; 06:600A $E0 $F2
    ret                                           ;; 06:600C $C9

.refusedMedicine
    ; Open the "Too bad" dialog
    ld   a, $01D                                  ;; 06:600D $3E $1D

.openFinalDialog
    call OpenDialogInTable0                       ;; 06:600F $CD $85 $23
    ld   hl, wDialogState                         ;; 06:6012 $21 $9F $C1
    set  DIALOG_BOX_BOTTOM_BIT, [hl]              ;; 06:6015 $CB $FE
    call IncrementEntityState                     ;; 06:6017 $CD $12 $3B
    ld   [hl], b                                  ;; 06:601A $70

.return
    ret                                           ;; 06:601B $C9

CrazyTracyDialogResponseHandler::
    ld   a, [wDialogState]                        ;; 06:601C $FA $9F $C1
    and  a                                        ;; 06:601F $A7
    jr   nz, .return                              ;; 06:6020 $20 $02
    jr   CrazyTracySellingHandler.buy             ;; 06:6022 $18 $B1
.return
    ret                                           ;; 06:6024 $C9

CrazyTracyBonusHandler::
    call GetEntityTransitionCountdown             ;; 06:6025 $CD $05 $0C
    ret  nz                                       ;; 06:6028 $C0

    ld   a, [wDialogState]                        ;; 06:6029 $FA $9F $C1
    and  a                                        ;; 06:602C $A7
    jr   nz, jr_006_6048                          ;; 06:602D $20 $19

    ld   a, [wFullHearts]                         ;; 06:602F $FA $A9 $C5
    and  a                                        ;; 06:6032 $A7
    jr   nz, .fillHeartsEnd                       ;; 06:6033 $20 $0F
    ; Also fill hearts
    ld   a, $FF                                   ;; 06:6035 $3E $FF
    ld   [wAddHealthBuffer], a                    ;; 06:6037 $EA $93 $DB
    call_open_dialog Dialog19A                    ;; 06:603A
    ld   hl, wDialogState                         ;; 06:603F $21 $9F $C1
    set  DIALOG_BOX_BOTTOM_BIT, [hl]              ;; 06:6042 $CB $FE
.fillHeartsEnd

    ; Reset to state 0 (first stage dialog)
    call IncrementEntityState                     ;; 06:6044 $CD $12 $3B
    ld   [hl], b                                  ;; 06:6047 $70

jr_006_6048:
    ld   a, $02                                   ;; 06:6048 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 06:604A $E0 $A1
    ret                                           ;; 06:604C $C9
