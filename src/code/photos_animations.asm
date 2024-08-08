; Array of origin addresses
Data_038_7800::
    dw   PhotographerTiles + $000
    dw   PhotographerTiles + $040
    dw   PhotographerTiles + $080
    dw   PhotographerTiles + $0C0
    dw   PhotographerTiles + $100
    dw   PhotographerTiles + $140
    dw   PhotographerTiles + $180
    dw   PhotographerTiles + $1C0

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
    ld   hl, Data_038_7810                        ;; 38:7830 $21 $10 $78
    ldh  a, [hMapRoom]                            ;; 38:7833 $F0 $F6
    cp   UNKNOWN_ROOM_0D                          ;; 38:7835 $FE $0D
    jr   nz, .else_783C_38                        ;; 38:7837 $20 $03

    ld   hl, Data_038_7820                        ;; 38:7839 $21 $20 $78
.else_783C_38:
    ldh  a, [hAnimatedTilesFrameCount]            ;; 38:783C $F0 $A6
    dec  a                                        ;; 38:783E $3D
    and  %00000111                                ;; 38:783F $E6 $07
    sla  a                                        ;; 38:7841 $CB $27
    ld   c, a                                     ;; 38:7843 $4F
    ld   b, $00                                   ;; 38:7844 $06 $00
    add  hl, bc                                   ;; 38:7846 $09
    ldi  a, [hl]                                  ;; 38:7847 $2A
    ld   d, [hl]                                  ;; 38:7848 $56
    ld   e, a                                     ;; 38:7849 $5F
    ld   hl, Data_038_7800                        ;; 38:784A $21 $00 $78
    add  hl, bc                                   ;; 38:784D $09
    ldi  a, [hl]                                  ;; 38:784E $2A
    ld   h, [hl]                                  ;; 38:784F $66
    ld   l, a                                     ;; 38:7850 $6F
    ld   bc, $40                                  ;; 38:7851 $01 $40 $00
    ld   a, $38                                   ;; 38:7854 $3E $38
    call CopyData                                 ;; 38:7856 $CD $14 $29
    ret                                           ;; 38:7859 $C9


func_038_785A::
    ld   a, [wDialogState]                        ;; 38:785A $FA $9F $C1
    and  a                                        ;; 38:785D $A7
    ret  nz                                       ;; 38:785E $C0

    ld   a, [wPaletteDataFlags]                   ;; 38:785F $FA $D1 $DD
    and  a                                        ;; 38:7862 $A7
    ret  nz                                       ;; 38:7863 $C0

    ld   bc, $00                                  ;; 38:7864 $01 $00 $00
.loop_7867_38
    push bc                                       ;; 38:7867 $C5
    ld   hl, wEntitiesSpeedXTable+2               ;; 38:7868 $21 $42 $C2
    add  hl, bc                                   ;; 38:786B $09
    ld   a, [hl]                                  ;; 38:786C $7E
    and  a                                        ;; 38:786D $A7
    jr   z, .else_7890_38                         ;; 38:786E $28 $20

    push bc                                       ;; 38:7870 $C5
    sla  c                                        ;; 38:7871 $CB $21
    ld   hl, wEntitiesPosYSignTable+10            ;; 38:7873 $21 $3A $C2
    add  hl, bc                                   ;; 38:7876 $09
    ld   e, [hl]                                  ;; 38:7877 $5E
    inc  hl                                       ;; 38:7878 $23
    ld   d, [hl]                                  ;; 38:7879 $56
    ld   hl, wEntitiesPosYSignTable+2             ;; 38:787A $21 $32 $C2
    add  hl, bc                                   ;; 38:787D $09
    ldi  a, [hl]                                  ;; 38:787E $2A
    ld   h, [hl]                                  ;; 38:787F $66
    ld   l, a                                     ;; 38:7880 $6F
    pop  bc                                       ;; 38:7881 $C1
    push hl                                       ;; 38:7882 $E5
    ld   hl, wEntitiesPosXSignTable+10            ;; 38:7883 $21 $2A $C2
    add  hl, bc                                   ;; 38:7886 $09
    ld   c, [hl]                                  ;; 38:7887 $4E
    ld   b, $00                                   ;; 38:7888 $06 $00
    pop  hl                                       ;; 38:788A $E1
    ld   a, $38                                   ;; 38:788B $3E $38
    call CopyData                                 ;; 38:788D $CD $14 $29
.else_7890_38:
    pop  bc                                       ;; 38:7890 $C1
    inc  bc                                       ;; 38:7891 $03
    ld   a, c                                     ;; 38:7892 $79
    and  %00000011                                ;; 38:7893 $E6 $03
    jr   nz, .loop_7867_38                        ;; 38:7895 $20 $D0

    ret                                           ;; 38:7897 $C9

