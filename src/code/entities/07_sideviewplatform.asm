Data_007_6348::
    db   $00, $00, $50, $07, $00, $08, $52, $07, $00, $10, $52, $27, $00, $18, $50, $27

SideViewPlatformHorizontalEntityHandler::
SideViewPlatformVerticalEntityHandler::
    ld   hl, Data_007_6348                        ; $6358: $21 $48 $63
    ld   c, $04                                   ; $635B: $0E $04
    call RenderActiveEntitySpritesRect            ; $635D: $CD $E6 $3C
    call ReturnIfNonInteractive_07                ; $6360: $CD $96 $7D
    call GetEntityTransitionCountdown             ; $6363: $CD $05 $0C
    ld   e, a                                     ; $6366: $5F
    ld   hl, wEntitiesInertiaTable                ; $6367: $21 $D0 $C3
    add  hl, bc                                   ; $636A: $09
    inc  [hl]                                     ; $636B: $34
    ld   a, [hl]                                  ; $636C: $7E
    and  $03                                      ; $636D: $E6 $03
    or   e                                        ; $636F: $B3
    jr   nz, func_007_639E                        ; $6370: $20 $2C

    ldh  a, [hActiveEntityType]                   ; $6372: $F0 $EB
    cp   ENTITY_SIDE_VIEW_PLATFORM_VERTICAL       ; $6374: $FE $A4
    jp   z, label_007_63FB                        ; $6376: $CA $FB $63

    ld   hl, wEntitiesPrivateState1Table          ; $6379: $21 $B0 $C2
    add  hl, bc                                   ; $637C: $09
    ld   e, [hl]                                  ; $637D: $5E
    ld   d, b                                     ; $637E: $50
    ld   hl, Data_007_63F7                        ; $637F: $21 $F7 $63
    add  hl, de                                   ; $6382: $19
    ld   a, [hl]                                  ; $6383: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $6384: $21 $40 $C2
    add  hl, bc                                   ; $6387: $09
    add  [hl]                                     ; $6388: $86
    ld   [hl], a                                  ; $6389: $77
    ld   hl, Data_007_63F9                        ; $638A: $21 $F9 $63
    add  hl, de                                   ; $638D: $19
    cp   [hl]                                     ; $638E: $BE
    jr   nz, func_007_639E                        ; $638F: $20 $0D

    ld   hl, wEntitiesPrivateState1Table          ; $6391: $21 $B0 $C2
    add  hl, bc                                   ; $6394: $09
    ld   a, [hl]                                  ; $6395: $7E
    xor  $01                                      ; $6396: $EE $01
    ld   [hl], a                                  ; $6398: $77
    call GetEntityTransitionCountdown             ; $6399: $CD $05 $0C
    ld   [hl], $6A                                ; $639C: $36 $6A

func_007_639E::
    ld   hl, wEntitiesPrivateState2Table          ; $639E: $21 $C0 $C2
    add  hl, bc                                   ; $63A1: $09
    ld   [hl], b                                  ; $63A2: $70
    ldh  a, [hActiveEntityPosX]                   ; $63A3: $F0 $EE
    push af                                       ; $63A5: $F5
    call UpdateEntityPosWithSpeed_07              ; $63A6: $CD $0A $7E
    pop  af                                       ; $63A9: $F1
    ld   e, a                                     ; $63AA: $5F
    ld   hl, wEntitiesPosXTable                   ; $63AB: $21 $00 $C2
    add  hl, bc                                   ; $63AE: $09
    ld   a, [hl]                                  ; $63AF: $7E
    sub  e                                        ; $63B0: $93
    ldh  [hMultiPurposeG], a                      ; $63B1: $E0 $E8
    call label_3B23                               ; $63B3: $CD $23 $3B
    call CheckLinkCollisionWithEnemy_trampoline   ; $63B6: $CD $5A $3B
    jr   nc, .ret_63F6                            ; $63B9: $30 $3B

    ldh  a, [hLinkSpeedY]                         ; $63BB: $F0 $9B
    and  $80                                      ; $63BD: $E6 $80
    jr   nz, .ret_63F6                            ; $63BF: $20 $35

    call EntityLinkPositionYDifference_07         ; $63C1: $CD $6D $7E
    add  $08                                      ; $63C4: $C6 $08
    bit  7, a                                     ; $63C6: $CB $7F
    jr   z, .ret_63F6                             ; $63C8: $28 $2C

    ld   hl, wEntitiesPosYTable                   ; $63CA: $21 $10 $C2
    add  hl, bc                                   ; $63CD: $09
    ld   a, [hl]                                  ; $63CE: $7E
    sub  $10                                      ; $63CF: $D6 $10
    ldh  [hLinkPositionY], a                      ; $63D1: $E0 $99
    ldh  a, [hLinkSpeedX]                         ; $63D3: $F0 $9A
    push af                                       ; $63D5: $F5
    ldh  a, [hMultiPurposeG]                      ; $63D6: $F0 $E8
    ldh  [hLinkSpeedX], a                         ; $63D8: $E0 $9A
    ld   hl, hLinkPositionX                       ; $63DA: $21 $98 $FF
    add  [hl]                                     ; $63DD: $86
    ld   [hl], a                                  ; $63DE: $77
    push bc                                       ; $63DF: $C5
    call label_3E19                               ; $63E0: $CD $19 $3E
    pop  bc                                       ; $63E3: $C1
    pop  af                                       ; $63E4: $F1
    ldh  [hLinkSpeedX], a                         ; $63E5: $E0 $9A
    ld   a, $02                                   ; $63E7: $3E $02
    ldh  [hLinkSpeedY], a                         ; $63E9: $E0 $9B
    ld   a, $01                                   ; $63EB: $3E $01
    ld   [wC147], a                               ; $63ED: $EA $47 $C1
    ld   hl, wEntitiesPrivateState2Table          ; $63F0: $21 $C0 $C2
    add  hl, bc                                   ; $63F3: $09
    ld   [hl], $10                                ; $63F4: $36 $10

.ret_63F6
    ret                                           ; $63F6: $C9

Data_007_63F7::
    db   $01, $FF

Data_007_63F9::
    db   $06, $FA

label_007_63FB:
    ld   hl, wEntitiesPrivateState1Table          ; $63FB: $21 $B0 $C2
    add  hl, bc                                   ; $63FE: $09
    ld   e, [hl]                                  ; $63FF: $5E
    ld   d, b                                     ; $6400: $50
    ld   hl, Data_007_63F7                        ; $6401: $21 $F7 $63
    add  hl, de                                   ; $6404: $19
    ld   a, [hl]                                  ; $6405: $7E
    call GetEntitySpeedYAddress                   ; $6406: $CD $05 $40
    add  [hl]                                     ; $6409: $86
    ld   [hl], a                                  ; $640A: $77
    ld   hl, Data_007_63F9                        ; $640B: $21 $F9 $63
    add  hl, de                                   ; $640E: $19
    cp   [hl]                                     ; $640F: $BE
    jr   nz, .jr_641F                             ; $6410: $20 $0D

    ld   hl, wEntitiesPrivateState1Table          ; $6412: $21 $B0 $C2
    add  hl, bc                                   ; $6415: $09
    ld   a, [hl]                                  ; $6416: $7E
    xor  $01                                      ; $6417: $EE $01
    ld   [hl], a                                  ; $6419: $77
    call GetEntityTransitionCountdown             ; $641A: $CD $05 $0C
    ld   [hl], $6A                                ; $641D: $36 $6A

.jr_641F
    jp   func_007_639E                            ; $641F: $C3 $9E $63

Data_007_6422::
    db   $00, $00, $50, $07, $00, $08, $52, $07, $00, $10, $52, $27, $00, $18, $50, $27

SideViewPlatformEntityHandler::
    call GetEntityPrivateCountdown1               ; $6432: $CD $00 $0C
    jr   z, .jr_643B                              ; $6435: $28 $04

    ld   a, $04                                   ; $6437: $3E $04
    ldh  [hActiveEntityTilesOffset], a            ; $6439: $E0 $F5

.jr_643B
    ld   hl, Data_007_6422                        ; $643B: $21 $22 $64
    ld   c, $04                                   ; $643E: $0E $04
    call RenderActiveEntitySpritesRect            ; $6440: $CD $E6 $3C
    call ReturnIfNonInteractive_07                ; $6443: $CD $96 $7D
    call func_007_639E                            ; $6446: $CD $9E $63
    ld   hl, wEntitiesPrivateState2Table          ; $6449: $21 $C0 $C2
    add  hl, bc                                   ; $644C: $09
    ld   a, [hl]                                  ; $644D: $7E
    and  a                                        ; $644E: $A7
    jr   z, jr_007_6489                           ; $644F: $28 $38

    ld   e, $04                                   ; $6451: $1E $04
    ldh  a, [hMapRoom]                            ; $6453: $F0 $F6
    cp   UNKNOWN_ROOM_3B                          ; $6455: $FE $3B
    jr   z, .jr_6466                              ; $6457: $28 $0D

    call GetEntityPrivateCountdown1               ; $6459: $CD $00 $0C
    ld   [hl], $08                                ; $645C: $36 $08
    ld   a, [wC3CF]                               ; $645E: $FA $CF $C3
    and  a                                        ; $6461: $A7
    jr   z, jr_007_6489                           ; $6462: $28 $25

    ld   e, $04                                   ; $6464: $1E $04

.jr_6466
    ld   hl, wEntitiesPrivateState4Table          ; $6466: $21 $40 $C4
    add  hl, bc                                   ; $6469: $09
    ld   a, [hl]                                  ; $646A: $7E
    cp   $04                                      ; $646B: $FE $04
    jr   z, .jr_6478                              ; $646D: $28 $09

    inc  [hl]                                     ; $646F: $34
    cp   $03                                      ; $6470: $FE $03
    jr   nz, .jr_6478                             ; $6472: $20 $04

    ld   a, NOISE_SFX_RUMBLE                      ; $6474: $3E $11
    ldh  [hNoiseSfx], a                           ; $6476: $E0 $F4

.jr_6478
    ldh  a, [hFrameCounter]                       ; $6478: $F0 $E7
    and  $03                                      ; $647A: $E6 $03
    jr   nz, ret_007_6488                         ; $647C: $20 $0A

    call GetEntitySpeedYAddress                   ; $647E: $CD $05 $40

.jr_6481
    ld   a, [hl]                                  ; $6481: $7E
    sub  e                                        ; $6482: $93
    and  $80                                      ; $6483: $E6 $80
    jr   z, ret_007_6488                          ; $6485: $28 $01

    inc  [hl]                                     ; $6487: $34

ret_007_6488:
    ret                                           ; $6488: $C9

jr_007_6489:
    call GetEntitySpeedYAddress                   ; $6489: $CD $05 $40
    ld   [hl], b                                  ; $648C: $70
    ld   hl, wEntitiesPrivateState4Table          ; $648D: $21 $40 $C4
    add  hl, bc                                   ; $6490: $09
    ld   [hl], b                                  ; $6491: $70
    ret                                           ; $6492: $C9
