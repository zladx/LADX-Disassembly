; Copy data from specified bank
; Inputs:
;   a  : source bank
;   bc : number of bytes to copy
;   de : destination address
;   hl : source address
CopyDataFromBank::
    ld   [rSelectROMBank], a                      ;; 00:2908 $EA $00 $21
    call CopyData                                 ;; 00:290B $CD $14 $29
    ld   a, $01                                   ;; 00:290E $3E $01
    ld   [rSelectROMBank], a                      ;; 00:2910 $EA $00 $21
    ret                                           ;; 00:2913 $C9

; Copy data
; Inputs:
;   bc : number of bytes to copy
;   de : destination address
;   hl : source address
CopyData::
    ld   a, [hli]                                 ;; 00:2914 $2A
    ld   [de], a                                  ;; 00:2915 $12
    inc  de                                       ;; 00:2916 $13
    dec  bc                                       ;; 00:2917 $0B
    ld   a, b                                     ;; 00:2918 $78
    or   c                                        ;; 00:2919 $B1
    jr   nz, CopyData                             ;; 00:291A $20 $F8
    ret                                           ;; 00:291C $C9

; Copy data from a series of draw command structures to VRAM.
;
; Inputs:
;   de: address of the next draw command struct (see wDrawCommand)
NoRoomTransitionDrawLoop::
    ; Copy destination address to hl
    inc  de                                       ;; 00:291D $13
    ld   h, a                                     ;; 00:291E $67
    ld   a, [de]                                  ;; 00:291F $1A
    ld   l, a                                     ;; 00:2920 $6F
    ; Copy data length to a
    inc  de                                       ;; 00:2921 $13
    ld   a, [de]                                  ;; 00:2922 $1A
    ; Move de to the data start
    inc  de                                       ;; 00:2923 $13
    call DrawCommandToVRAM                        ;; 00:2924 $CD $41 $29
    ; fallthrough to the next wDrawCommand

; Copy data from a series of draw command structures to VRAM,
; with optional handling during room transitions.
;
; Inputs:
;   de: address of the first draw command struct (see wDrawCommand)
ExecuteDrawCommands::
    ld   a, [wRoomTransitionState]                ;; 00:2927 $FA $24 $C1
    and  a                                        ;; 00:292A $A7
    jr   nz, .duringMapTransition                 ;; 00:292B $20 $0F

.noRoomTransition
    ; If a draw command is present, copy the data.
    ld   a, [de]                                  ;; 00:292D $1A
    and  a                                        ;; 00:292E $A7
    jr   nz, NoRoomTransitionDrawLoop             ;; 00:292F $20 $EC
    ; No more draw commands: return.
    ret                                           ;; 00:2931 $C9

.roomTransitionDrawLoop
    inc  de                                       ;; 00:2932 $13
    ld   h, a                                     ;; 00:2933 $67
    ld   a, [de]                                  ;; 00:2934 $1A
    ld   l, a                                     ;; 00:2935 $6F
    inc  de                                       ;; 00:2936 $13
    ld   a, [de]                                  ;; 00:2937 $1A
    inc  de                                       ;; 00:2938 $13
    call DrawCommandToVRAMDuringRoomTransition    ;; 00:2939 $CD $91 $29

.duringMapTransition
    ld   a, [de]                                  ;; 00:293C $1A
    and  a                                        ;; 00:293D $A7
    jr   nz, .roomTransitionDrawLoop              ;; 00:293E $20 $F2
    ret                                           ;; 00:2940 $C9

; Copy data to VRAM map, with support for copying a full row or column.
; See DC_* constants for possible options.
;
; Inputs:
;   de: data copy source address
;   hl: data copy destination address
;   a:  data length (bits 0-5) and copy mode (bits 6-7)
DrawCommandToVRAM::
    ; Save the six lowest bits (actual data length) of the data length to b
    push af                                       ;; 00:2941 $F5
    and  $3F                                      ;; 00:2942 $E6 $3F
    ld   b, a                                     ;; 00:2944 $47
    inc  b                                        ;; 00:2945 $04
    pop  af                                       ;; 00:2946 $F1

    ; Save the two highmost bits (copy flag) of the data length to a
    rlca                                          ;; 00:2947 $07
    rlca                                          ;; 00:2948 $07
    and  $03                                      ;; 00:2949 $E6 $03

    ; Dispatch according to the copy mode
    ; DC_COPY_ROW
    jr   z, .copyRow                              ;; 00:294B $28 $08
    dec  a                                        ;; 00:294D $3D
    ; DC_FILL_ROW
    jr   z, .fillRow                              ;; 00:294E $28 $16
    dec  a                                        ;; 00:2950 $3D
    ; DC_COPY_COLUMN
    jr   z, .copyColumn                           ;; 00:2951 $28 $24
    ; DC_FILL_COLUMN
    jr   .fillColumn                              ;; 00:2953 $18 $2F

.copyRow
    ; Copy one byte from [de] to [hl]
    ld   a, [de]                                  ;; 00:2955 $1A
    ldi  [hl], a                                  ;; 00:2956 $22
    ; If 'dest mod 32' is 0…
    ld   a, l                                     ;; 00:2957 $7D
    and  $1F                                      ;; 00:2958 $E6 $1F
    jr   nz, .noSubstraction0                     ;; 00:295A $20 $05
    ; dest = dest - 32
    dec  hl                                       ;; 00:295C $2B
    ld   a, l                                     ;; 00:295D $7D
    and  $E0                                      ;; 00:295E $E6 $E0
    ld   l, a                                     ;; 00:2960 $6F
.noSubstraction0
    ; Increment the source address
    inc  de                                       ;; 00:2961 $13
    ; Decrement the length to be copied
    dec  b                                        ;; 00:2962 $05
    ; Loop
    jr   nz, .copyRow                             ;; 00:2963 $20 $F0
    ret                                           ;; 00:2965 $C9

; Copy a single value in [de] from [hl] to [hl + a]
.fillRow
    ; Copy one byte from [de] to [hl]
    ld   a, [de]                                  ;; 00:2966 $1A
    ldi  [hl], a                                  ;; 00:2967 $22
    ; If 'dest mod 32' is 0…
    ld   a, l                                     ;; 00:2968 $7D
    and  $1F                                      ;; 00:2969 $E6 $1F
    jr   nz, .noSubstraction1                     ;; 00:296B $20 $05
    ; dest = dest - 32
    dec  hl                                       ;; 00:296D $2B
    ld   a, l                                     ;; 00:296E $7D
    and  $E0                                      ;; 00:296F $E6 $E0
    ld   l, a                                     ;; 00:2971 $6F
.noSubstraction1
    ; Decrement the length to be copied
    dec  b                                        ;; 00:2972 $05
    ; Loop (without incrementing the source address)
    jr   nz, .fillRow                             ;; 00:2973 $20 $F1
    inc  de                                       ;; 00:2975 $13
    ret                                           ;; 00:2976 $C9

.copyColumn
    ; Copy one byte from [de] to [hl]
    ld   a, [de]                                  ;; 00:2977 $1A
    ld   [hl], a                                  ;; 00:2978 $77
    ; Increment the source address
    inc  de                                       ;; 00:2979 $13
    ; Move the destination to the next background column
    ld   a, b                                     ;; 00:297A $78
    ld   bc, $20                                  ;; 00:297B $01 $20 $00
    add  hl, bc                                   ;; 00:297E $09
    ; Decrement the length to be copied
    ld   b, a                                     ;; 00:297F $47
    dec  b                                        ;; 00:2980 $05
    ; Loop
    jr   nz, .copyColumn                          ;; 00:2981 $20 $F4
    ret                                           ;; 00:2983 $C9

.fillColumn
    ; Copy one byte from [de] to [hl]
    ld   a, [de]                                  ;; 00:2984 $1A
    ld   [hl], a                                  ;; 00:2985 $77
    ; Move the destination to the next background column
    ld   a, b                                     ;; 00:2986 $78
    ld   bc, $20                                  ;; 00:2987 $01 $20 $00
    add  hl, bc                                   ;; 00:298A $09
    ; Decrement the length to be copied
    ld   b, a                                     ;; 00:298B $47
    dec  b                                        ;; 00:298C $05
    ; Loop (without incrementing the source address)
    jr   nz, .fillColumn                          ;; 00:298D $20 $F5
    inc  de                                       ;; 00:298F $13
    ret                                           ;; 00:2990 $C9

; Copy data to VRAM map, with support for copying a full row or column,
; special-cased for code executed during a room transition.
;
; See DC_* constants for possible options.
;
; Inputs:
;   de: data copy source address
;   hl: data copy destination address
;   a:  data length (bits 0-6) and copy mode (bits 7-8)
DrawCommandToVRAMDuringRoomTransition::
    push af                                       ;; 00:2991 $F5
    and  $3F                                      ;; 00:2992 $E6 $3F
    ld   b, a                                     ;; 00:2994 $47
    inc  b                                        ;; 00:2995 $04
    pop  af                                       ;; 00:2996 $F1
    and  $80                                      ;; 00:2997 $E6 $80
    jr   nz, .updateNextBGColumnWithTiles         ;; 00:2999 $20 $15

.jr_299B
    ld   a, [de]                                  ;; 00:299B $1A
    cp   $EE                                      ;; 00:299C $FE $EE
    jr   z, .jr_29AB                              ;; 00:299E $28 $0B
    ldi  [hl], a                                  ;; 00:29A0 $22
    ld   a, l                                     ;; 00:29A1 $7D
    and  $1F                                      ;; 00:29A2 $E6 $1F
    jr   nz, .jr_29AB                             ;; 00:29A4 $20 $05
    dec  hl                                       ;; 00:29A6 $2B
    ld   a, l                                     ;; 00:29A7 $7D
    and  $E0                                      ;; 00:29A8 $E6 $E0
    ld   l, a                                     ;; 00:29AA $6F

.jr_29AB
    inc  de                                       ;; 00:29AB $13
    dec  b                                        ;; 00:29AC $05
    jr   nz, .jr_299B                             ;; 00:29AD $20 $EC
    ret                                           ;; 00:29AF $C9

.updateNextBGColumnWithTiles
    ld   a, [de]                                  ;; 00:29B0 $1A
    cp   $EE                                      ;; 00:29B1 $FE $EE
    jr   z, .continue                             ;; 00:29B3 $28 $01
    ld   [hl], a                                  ;; 00:29B5 $77
.continue
    inc  de                                       ;; 00:29B6 $13
    ld   a, b                                     ;; 00:29B7 $78
    ld   bc, $20                                  ;; 00:29B8 $01 $20 $00
    add  hl, bc                                   ;; 00:29BB $09
    ld   b, a                                     ;; 00:29BC $47
    dec  b                                        ;; 00:29BD $05
    jr   nz, .updateNextBGColumnWithTiles         ;; 00:29BE $20 $F0
    ret                                           ;; 00:29C0 $C9
