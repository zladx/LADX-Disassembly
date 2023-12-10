Data_019_536C::
    db   $F8, $F8, $60, $00, $F8, $00, $62, $00, $F8, $08, $62, $20, $F8, $10, $60, $20
    db   $08, $F8, $60, $40, $08, $00, $62, $40, $08, $08, $62, $60, $08, $10, $60, $60

Data_019_538C::
    db   $00, $04, $08, $04

GiantBubbleEntityHandler::
    ldh  a, [hFrameCounter]                       ; $19:5390: $F0 $E7
    rla                                           ; $19:5392: $17
    rla                                           ; $19:5393: $17
    and  OAMF_PAL1                                ; $19:5394: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $19:5396: $E0 $ED
    ldh  a, [hFrameCounter]                       ; $19:5398: $F0 $E7
    rra                                           ; $19:539A: $1F
    rra                                           ; $19:539B: $1F
    rra                                           ; $19:539C: $1F
    rra                                           ; $19:539D: $1F
    and  $03                                      ; $19:539E: $E6 $03
    ld   e, a                                     ; $19:53A0: $5F
    ld   d, b                                     ; $19:53A1: $50
    ld   hl, Data_019_538C                        ; $19:53A2: $21 $8C $53
    add  hl, de                                   ; $19:53A5: $19
    ld   a, [hl]                                  ; $19:53A6: $7E
    ldh  [hActiveEntityTilesOffset], a            ; $19:53A7: $E0 $F5
    ld   hl, Data_019_536C                        ; $19:53A9: $21 $6C $53
    ld   c, $08                                   ; $19:53AC: $0E $08
    call RenderActiveEntitySpritesRect            ; $19:53AE: $CD $E6 $3C
    call ReturnIfNonInteractive_19                ; $19:53B1: $CD $3D $7D
    call label_3B44                               ; $19:53B4: $CD $44 $3B
    call UpdateEntityPosWithSpeed_19              ; $19:53B7: $CD $B8 $7D
    call DefaultEntityPhysics_trampoline          ; $19:53BA: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $19:53BD: $21 $A0 $C2
    add  hl, bc                                   ; $19:53C0: $09
    ld   a, [hl]                                  ; $19:53C1: $7E
    and  $03                                      ; $19:53C2: $E6 $03
    jr   z, .jr_53CE                              ; $19:53C4: $28 $08

    ld   hl, wEntitiesSpeedXTable                 ; $19:53C6: $21 $40 $C2
    add  hl, bc                                   ; $19:53C9: $09
    ld   a, [hl]                                  ; $19:53CA: $7E
    cpl                                           ; $19:53CB: $2F
    inc  a                                        ; $19:53CC: $3C
    ld   [hl], a                                  ; $19:53CD: $77

.jr_53CE
    ld   hl, wEntitiesCollisionsTable             ; $19:53CE: $21 $A0 $C2
    add  hl, bc                                   ; $19:53D1: $09
    ld   a, [hl]                                  ; $19:53D2: $7E
    and  $0C                                      ; $19:53D3: $E6 $0C
    jr   z, .ret_53DF                             ; $19:53D5: $28 $08

    ld   hl, wEntitiesSpeedYTable                 ; $19:53D7: $21 $50 $C2
    add  hl, bc                                   ; $19:53DA: $09
    ld   a, [hl]                                  ; $19:53DB: $7E
    cpl                                           ; $19:53DC: $2F
    inc  a                                        ; $19:53DD: $3C
    ld   [hl], a                                  ; $19:53DE: $77

.ret_53DF
    ret                                           ; $19:53DF: $C9
