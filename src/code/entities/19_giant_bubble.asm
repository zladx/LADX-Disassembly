Data_019_536C::
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $62, $60, $08, $10, $60, $60

Data_019_538C::
    db   $00, $04, $08, $04

GiantBubbleEntityHandler::
    ldh  a, [hFrameCounter]                       ; $5390: $F0 $E7
    rla                                           ; $5392: $17
    rla                                           ; $5393: $17
    and  OAMF_PAL1                                ; $5394: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $5396: $E0 $ED
    ldh  a, [hFrameCounter]                       ; $5398: $F0 $E7
    rra                                           ; $539A: $1F
    rra                                           ; $539B: $1F
    rra                                           ; $539C: $1F
    rra                                           ; $539D: $1F
    and  $03                                      ; $539E: $E6 $03
    ld   e, a                                     ; $53A0: $5F
    ld   d, b                                     ; $53A1: $50
    ld   hl, Data_019_538C                        ; $53A2: $21 $8C $53
    add  hl, de                                   ; $53A5: $19
    ld   a, [hl]                                  ; $53A6: $7E
    ldh  [hActiveEntityTilesOffset], a            ; $53A7: $E0 $F5
    ld   hl, Data_019_536C                        ; $53A9: $21 $6C $53
    ld   c, $08                                   ; $53AC: $0E $08
    call RenderActiveEntitySpritesRect            ; $53AE: $CD $E6 $3C
    call ReturnIfNonInteractive_19                ; $53B1: $CD $3D $7D
    call label_3B44                               ; $53B4: $CD $44 $3B
    call UpdateEntityPosWithSpeed_19              ; $53B7: $CD $B8 $7D
    call label_3B23                               ; $53BA: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $53BD: $21 $A0 $C2
    add  hl, bc                                   ; $53C0: $09
    ld   a, [hl]                                  ; $53C1: $7E
    and  $03                                      ; $53C2: $E6 $03
    jr   z, .jr_53CE                              ; $53C4: $28 $08

    ld   hl, wEntitiesSpeedXTable                 ; $53C6: $21 $40 $C2
    add  hl, bc                                   ; $53C9: $09
    ld   a, [hl]                                  ; $53CA: $7E
    cpl                                           ; $53CB: $2F
    inc  a                                        ; $53CC: $3C
    ld   [hl], a                                  ; $53CD: $77

.jr_53CE
    ld   hl, wEntitiesCollisionsTable             ; $53CE: $21 $A0 $C2
    add  hl, bc                                   ; $53D1: $09
    ld   a, [hl]                                  ; $53D2: $7E
    and  $0C                                      ; $53D3: $E6 $0C
    jr   z, .ret_53DF                             ; $53D5: $28 $08

    ld   hl, wEntitiesSpeedYTable                 ; $53D7: $21 $50 $C2
    add  hl, bc                                   ; $53DA: $09
    ld   a, [hl]                                  ; $53DB: $7E
    cpl                                           ; $53DC: $2F
    inc  a                                        ; $53DD: $3C
    ld   [hl], a                                  ; $53DE: $77

.ret_53DF
    ret                                           ; $53DF: $C9
