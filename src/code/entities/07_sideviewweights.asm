; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SideViewWeightsSpriteVariants::
.variant0
    db $50, OAM_GBC_PAL_7 | OAMF_PAL0
    db $50, OAM_GBC_PAL_7 | OAMF_PAL0 | OAMF_XFLIP

SideViewWeightsEntityHandler::
    ld   de, SideViewWeightsSpriteVariants        ; $61D2: $11 $CE $61
    call RenderActiveEntitySpritesPair            ; $61D5: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $61D8: $CD $96 $7D
    call func_007_639E                            ; $61DB: $CD $9E $63
    ld   hl, wEntitiesPrivateState3Table          ; $61DE: $21 $D0 $C2
    add  hl, bc                                   ; $61E1: $09
    ld   a, [hl]                                  ; $61E2: $7E
    ld   e, a                                     ; $61E3: $5F
    and  a                                        ; $61E4: $A7
    jr   nz, .jr_61FA                             ; $61E5: $20 $13

    ld   hl, wEntitiesPrivateState2Table          ; $61E7: $21 $C0 $C2
    add  hl, bc                                   ; $61EA: $09
    ld   a, [hl]                                  ; $61EB: $7E
    and  a                                        ; $61EC: $A7
    jr   z, jr_007_6248                           ; $61ED: $28 $59

    call func_007_631C                            ; $61EF: $CD $1C $63
    ld   hl, wEntitiesPrivateState3Table          ; $61F2: $21 $D0 $C2
    add  hl, de                                   ; $61F5: $19
    ld   [hl], $F0                                ; $61F6: $36 $F0
    ld   e, $10                                   ; $61F8: $1E $10

.jr_61FA
    ldh  a, [hFrameCounter]                       ; $61FA: $F0 $E7
    and  $01                                      ; $61FC: $E6 $01
    jr   nz, jr_007_620E                          ; $61FE: $20 $0E

    call GetEntitySpeedYAddress                   ; $6200: $CD $05 $40
    ld   a, [hl]                                  ; $6203: $7E
    sub  e                                        ; $6204: $93
    jr   z, jr_007_620E                           ; $6205: $28 $07

    and  $80                                      ; $6207: $E6 $80
    jr   z, .jr_620D                              ; $6209: $28 $02

    inc  [hl]                                     ; $620B: $34
    inc  [hl]                                     ; $620C: $34

.jr_620D
    dec  [hl]                                     ; $620D: $35

jr_007_620E:
    ld   hl, wEntitiesHitboxFlagsTable            ; $620E: $21 $50 $C3
    add  hl, bc                                   ; $6211: $09
    ld   [hl], $02                                ; $6212: $36 $02
    call GetEntitySpeedYAddress                   ; $6214: $CD $05 $40
    ld   a, [hl]                                  ; $6217: $7E
    push hl                                       ; $6218: $E5
    push af                                       ; $6219: $F5
    ld   [hl], e                                  ; $621A: $73
    ld   hl, wEntitiesPosYTable                   ; $621B: $21 $10 $C2
    add  hl, bc                                   ; $621E: $09
    ld   a, [hl]                                  ; $621F: $7E
    push hl                                       ; $6220: $E5
    push af                                       ; $6221: $F5
    call label_3B23                               ; $6222: $CD $23 $3B
    pop  af                                       ; $6225: $F1
    pop  hl                                       ; $6226: $E1
    ld   [hl], a                                  ; $6227: $77
    pop  af                                       ; $6228: $F1
    pop  hl                                       ; $6229: $E1
    ld   [hl], a                                  ; $622A: $77
    ld   hl, wEntitiesHitboxFlagsTable            ; $622B: $21 $50 $C3
    add  hl, bc                                   ; $622E: $09
    ld   [hl], $30                                ; $622F: $36 $30
    ld   hl, wEntitiesCollisionsTable             ; $6231: $21 $A0 $C2
    add  hl, bc                                   ; $6234: $09
    ld   a, [hl]                                  ; $6235: $7E
    and  a                                        ; $6236: $A7
    jr   z, .jr_6246                              ; $6237: $28 $0D

    call GetEntitySpeedYAddress                   ; $6239: $CD $05 $40
    ld   [hl], b                                  ; $623C: $70
    call func_007_631C                            ; $623D: $CD $1C $63
    ld   hl, wEntitiesSpeedYTable                 ; $6240: $21 $50 $C2
    add  hl, de                                   ; $6243: $19
    ld   [hl], $00                                ; $6244: $36 $00

.jr_6246
    jr   jr_007_625F                              ; $6246: $18 $17

jr_007_6248:
    call GetEntitySpeedYAddress                   ; $6248: $CD $05 $40
    ld   a, [hl]                                  ; $624B: $7E
    and  a                                        ; $624C: $A7
    jr   z, jr_007_6256                           ; $624D: $28 $07

    and  $80                                      ; $624F: $E6 $80
    jr   z, .jr_6255                              ; $6251: $28 $02

    inc  [hl]                                     ; $6253: $34
    inc  [hl]                                     ; $6254: $34

.jr_6255
    dec  [hl]                                     ; $6255: $35

jr_007_6256:
    call func_007_631C                            ; $6256: $CD $1C $63
    ld   hl, wEntitiesPrivateState3Table          ; $6259: $21 $D0 $C2
    add  hl, de                                   ; $625C: $19
    ld   [hl], $00                                ; $625D: $36 $00

jr_007_625F:
    ldh  a, [hActiveEntityPosY]                   ; $625F: $F0 $EF
    and  $0F                                      ; $6261: $E6 $0F
    cp   $00                                      ; $6263: $FE $00
    jr   nz, ret_007_62D1                         ; $6265: $20 $6A

    ldh  a, [hActiveEntityPosY]                   ; $6267: $F0 $EF
    sub  $10                                      ; $6269: $D6 $10
    ldh  [hIntersectedObjectTop], a               ; $626B: $E0 $CD
    and  $F0                                      ; $626D: $E6 $F0
    ld   e, a                                     ; $626F: $5F
    ldh  a, [hActiveEntityPosX]                   ; $6270: $F0 $EE
    sub  $08                                      ; $6272: $D6 $08
    ldh  [hIntersectedObjectLeft], a              ; $6274: $E0 $CE
    swap a                                        ; $6276: $CB $37
    and  $0F                                      ; $6278: $E6 $0F
    or   e                                        ; $627A: $B3
    ld   e, a                                     ; $627B: $5F
    ld   d, b                                     ; $627C: $50
    call GetEntitySpeedYAddress                   ; $627D: $CD $05 $40
    ld   a, [hl]                                  ; $6280: $7E
    and  a                                        ; $6281: $A7
    jr   z, ret_007_62D1                          ; $6282: $28 $4D

    and  $80                                      ; $6284: $E6 $80
    jr   nz, jr_007_62D2                          ; $6286: $20 $4A

    ld   hl, wRoomObjects                         ; $6288: $21 $11 $D7
    add  hl, de                                   ; $628B: $19
    ld   [hl], $4D                                ; $628C: $36 $4D
    call label_2887                               ; $628E: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $6291: $F0 $FE
    and  a                                        ; $6293: $A7
    jr   z, .jr_62A2                              ; $6294: $28 $0C

    push bc                                       ; $6296: $C5
    ld   a, $4D                                   ; $6297: $3E $4D
    ld   [wDDD8], a                               ; $6299: $EA $D8 $DD
    ld   a, $07                                   ; $629C: $3E $07
    call func_91D                                 ; $629E: $CD $1D $09
    pop  bc                                       ; $62A1: $C1

.jr_62A2
    ld   hl, wDrawCommand                         ; $62A2: $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ; $62A5: $FA $00 $D6
    ld   e, a                                     ; $62A8: $5F
    add  $0A                                      ; $62A9: $C6 $0A
    ld   [wDrawCommandsSize], a                   ; $62AB: $EA $00 $D6
    ld   d, $00                                   ; $62AE: $16 $00
    add  hl, de                                   ; $62B0: $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $62B1: $F0 $CF
    ld   [hl+], a                                 ; $62B3: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $62B4: $F0 $D0
    ld   [hl+], a                                 ; $62B6: $22
    ld   a, $81                                   ; $62B7: $3E $81
    ld   [hl+], a                                 ; $62B9: $22
    ld   a, $44                                   ; $62BA: $3E $44
    ld   [hl+], a                                 ; $62BC: $22
    ld   a, $54                                   ; $62BD: $3E $54
    ld   [hl+], a                                 ; $62BF: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $62C0: $F0 $CF
    ld   [hl+], a                                 ; $62C2: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $62C3: $F0 $D0
    inc  a                                        ; $62C5: $3C
    ld   [hl+], a                                 ; $62C6: $22
    ld   a, $81                                   ; $62C7: $3E $81
    ld   [hl+], a                                 ; $62C9: $22
    ld   a, $45                                   ; $62CA: $3E $45
    ld   [hl+], a                                 ; $62CC: $22
    ld   a, $55                                   ; $62CD: $3E $55
    ld   [hl+], a                                 ; $62CF: $22
    ld   [hl], b                                  ; $62D0: $70

ret_007_62D1:
    ret                                           ; $62D1: $C9

jr_007_62D2:
    ld   hl, wRoomObjects                         ; $62D2: $21 $11 $D7
    add  hl, de                                   ; $62D5: $19
    ld   [hl], $04                                ; $62D6: $36 $04
    call label_2887                               ; $62D8: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $62DB: $F0 $FE
    and  a                                        ; $62DD: $A7
    jr   z, .jr_62EC                              ; $62DE: $28 $0C

    push bc                                       ; $62E0: $C5
    ld   a, $04                                   ; $62E1: $3E $04
    ld   [wDDD8], a                               ; $62E3: $EA $D8 $DD
    ld   a, $07                                   ; $62E6: $3E $07
    call func_91D                                 ; $62E8: $CD $1D $09
    pop  bc                                       ; $62EB: $C1

.jr_62EC
    ld   hl, wDrawCommand                         ; $62EC: $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ; $62EF: $FA $00 $D6
    ld   e, a                                     ; $62F2: $5F
    add  $0A                                      ; $62F3: $C6 $0A
    ld   [wDrawCommandsSize], a                   ; $62F5: $EA $00 $D6
    ld   d, $00                                   ; $62F8: $16 $00
    add  hl, de                                   ; $62FA: $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $62FB: $F0 $CF
    ld   [hl+], a                                 ; $62FD: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $62FE: $F0 $D0
    ld   [hl+], a                                 ; $6300: $22
    ld   a, $81                                   ; $6301: $3E $81
    ld   [hl+], a                                 ; $6303: $22
    ld   a, $7E                                   ; $6304: $3E $7E
    ld   [hl+], a                                 ; $6306: $22
    ld   a, $7E                                   ; $6307: $3E $7E
    ld   [hl+], a                                 ; $6309: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $630A: $F0 $CF
    ld   [hl+], a                                 ; $630C: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $630D: $F0 $D0
    inc  a                                        ; $630F: $3C
    ld   [hl+], a                                 ; $6310: $22
    ld   a, $81                                   ; $6311: $3E $81
    ld   [hl+], a                                 ; $6313: $22
    ld   a, $7E                                   ; $6314: $3E $7E
    ld   [hl+], a                                 ; $6316: $22
    ld   a, $7E                                   ; $6317: $3E $7E
    ld   [hl+], a                                 ; $6319: $22
    ld   [hl], b                                  ; $631A: $70
    ret                                           ; $631B: $C9

func_007_631C::
    ld   hl, wEntitiesLoadOrderTable              ; $631C: $21 $60 $C4
    add  hl, bc                                   ; $631F: $09
    ld   a, [hl]                                  ; $6320: $7E
    xor  $01                                      ; $6321: $EE $01
    ldh  [hMultiPurpose0], a                      ; $6323: $E0 $D7
    ld   e, b                                     ; $6325: $58
    ld   d, b                                     ; $6326: $50

jr_007_6327:
    ld   hl, wEntitiesStatusTable                 ; $6327: $21 $80 $C2
    add  hl, de                                   ; $632A: $19
    ld   a, [hl]                                  ; $632B: $7E
    and  a                                        ; $632C: $A7
    jr   z, .jr_6341                              ; $632D: $28 $12

    ld   hl, wEntitiesTypeTable                   ; $632F: $21 $A0 $C3
    add  hl, de                                   ; $6332: $19
    ld   a, [hl]                                  ; $6333: $7E
    cp   $A6                                      ; $6334: $FE $A6
    jr   nz, .jr_6341                             ; $6336: $20 $09

    ld   hl, wEntitiesLoadOrderTable              ; $6338: $21 $60 $C4
    add  hl, de                                   ; $633B: $19
    ldh  a, [hMultiPurpose0]                      ; $633C: $F0 $D7
    cp   [hl]                                     ; $633E: $BE
    jr   z, ret_007_6347                          ; $633F: $28 $06

.jr_6341
    inc  e                                        ; $6341: $1C
    ld   a, e                                     ; $6342: $7B
    cp   $10                                      ; $6343: $FE $10
    jr   nz, jr_007_6327                          ; $6345: $20 $E0

ret_007_6347:
    ret                                           ; $6347: $C9
