; Array of origin addresses
Data_038_7800::
    dw   CgbMiscTiles + $000
    dw   CgbMiscTiles + $040
    dw   CgbMiscTiles + $080
    dw   CgbMiscTiles + $0C0
    dw   CgbMiscTiles + $100
    dw   CgbMiscTiles + $140
    dw   CgbMiscTiles + $180
    dw   CgbMiscTiles + $1C0

; Array of destination addresses
Data_038_7810::
    dw   $8400
    dw   $8440
    dw   $8480
    dw   $84C0
    dw   $8700
    dw   $8740
    dw   $8780
    dw   $87C0

; Array of destination addresses
Data_038_7820::
    dw   $8400
    dw   $8440
    dw   $8480
    dw   $84C0
    dw   $8600
    dw   $8640
    dw   $8680
    dw   $86C0

; Animate photo tiles group
func_038_7830::
    ld   hl, Data_038_7810                       ; $7830: $21 $10 $78
    ldh  a, [hMapRoom]                           ; $7833: $F0 $F6
    cp   $0D                                     ; $7835: $FE $0D
    jr   nz, .else_783C_38                       ; $7837: $20 $03

    ld   hl, Data_038_7820                       ; $7839: $21 $20 $78
.else_783C_38:
    ldh  a, [hAnimatedTilesFrameCount]           ; $783C: $F0 $A6
    dec  a                                       ; $783E: $3D
    and  %00000111                               ; $783F: $E6 $07
    sla  a                                       ; $7841: $CB $27
    ld   c, a                                    ; $7843: $4F
    ld   b, $00                                  ; $7844: $06 $00
    add  hl, bc                                  ; $7846: $09
    ldi  a, [hl]                                 ; $7847: $2A
    ld   d, [hl]                                 ; $7848: $56
    ld   e, a                                    ; $7849: $5F
    ld   hl, Data_038_7800                       ; $784A: $21 $00 $78
    add  hl, bc                                  ; $784D: $09
    ldi  a, [hl]                                 ; $784E: $2A
    ld   h, [hl]                                 ; $784F: $66
    ld   l, a                                    ; $7850: $6F
    ld   bc, $40                                 ; $7851: $01 $40 $00
    ld   a, $38                                  ; $7854: $3E $38
    call CopyData                                ; $7856: $CD $14 $29
    ret                                          ; $7859: $C9


func_038_785A::
    ld   a, [$C19F]                              ; $785A: $FA $9F $C1
    and  a                                       ; $785D: $A7
    ret  nz                                      ; $785E: $C0

    ld   a, [$DDD1]                              ; $785F: $FA $D1 $DD
    and  a                                       ; $7862: $A7
    ret  nz                                      ; $7863: $C0

    ld   bc, $00                                 ; $7864: $01 $00 $00
.loop_7867_38:
    push bc                                      ; $7867: $C5
    ld   hl, $C242                               ; $7868: $21 $42 $C2
    add  hl, bc                                  ; $786B: $09
    ld   a, [hl]                                 ; $786C: $7E
    and  a                                       ; $786D: $A7
    jr   z, .else_7890_38                        ; $786E: $28 $20

    push bc                                      ; $7870: $C5
    sla  c                                       ; $7871: $CB $21
    ld   hl, $C23A                               ; $7873: $21 $3A $C2
    add  hl, bc                                  ; $7876: $09
    ld   e, [hl]                                 ; $7877: $5E
    inc  hl                                      ; $7878: $23
    ld   d, [hl]                                 ; $7879: $56
    ld   hl, $C232                               ; $787A: $21 $32 $C2
    add  hl, bc                                  ; $787D: $09
    ldi  a, [hl]                                 ; $787E: $2A
    ld   h, [hl]                                 ; $787F: $66
    ld   l, a                                    ; $7880: $6F
    pop  bc                                      ; $7881: $C1
    push hl                                      ; $7882: $E5
    ld   hl, $C22A                               ; $7883: $21 $2A $C2
    add  hl, bc                                  ; $7886: $09
    ld   c, [hl]                                 ; $7887: $4E
    ld   b, $00                                  ; $7888: $06 $00
    pop  hl                                      ; $788A: $E1
    ld   a, $38                                  ; $788B: $3E $38
    call CopyData                                ; $788D: $CD $14 $29
.else_7890_38:
    pop  bc                                      ; $7890: $C1
    inc  bc                                      ; $7891: $03
    ld   a, c                                    ; $7892: $79
    and  %00000011                               ; $7893: $E6 $03
    jr   nz, .loop_7867_38                       ; $7895: $20 $D0

    ret                                          ; $7897: $C9

