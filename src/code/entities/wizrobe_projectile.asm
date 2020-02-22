Data_006_65E1::
    db   $6A, $23, $68, $23, $68, $03, $6A, $03, $6C, $43, $6C, $63, $6C, $03, $6C, $23

WizrobeProjectileEntityHandler::
    ; Flip palette every 8 frame
    ldh  a, [hFrameCounter]                       ; $65F1: $F0 $E7
    rla                                           ; $65F3: $17
    rla                                           ; $65F4: $17
    and  OAMF_PAL1                                ; $65F5: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $65F7: $E0 $ED

    ld   de, Data_006_65E1                        ; $65F9: $11 $E1 $65
    call RenderActiveEntitySpritesPair            ; $65FC: $CD $C0 $3B
    call func_006_64C6                            ; $65FF: $CD $C6 $64
    call CheckLinkCollisionWithProjectile_trampoline; $6602: $CD $4F $3B
    call func_006_6541                            ; $6605: $CD $41 $65
    call label_3B2E                               ; $6608: $CD $2E $3B
    ld   hl, wEntitiesCollisionsTable             ; $660B: $21 $A0 $C2
    add  hl, bc                                   ; $660E: $09
    ld   a, [hl]                                  ; $660F: $7E
    and  a                                        ; $6610: $A7
    ret  z                                        ; $6611: $C8

    jp   ClearEntityStatus_06                     ; $6612: $C3 $DB $65
