; Copy data from specified bank
; Inputs:
;   a  : source bank
;   bc : number of bytes to copy
;   de : destination address
;   hl : source address
CopyDataFromBank::
    ld   [rSelectROMBank], a                      ; $2908: $EA $00 $21
    call CopyData                                 ; $290B: $CD $14 $29
    ld   a, $01                                   ; $290E: $3E $01
    ld   [rSelectROMBank], a                      ; $2910: $EA $00 $21
    ret                                           ; $2913: $C9

; Copy data
; Inputs:
;   bc : number of bytes to copy
;   de : destination address
;   hl : source address
CopyData::
    ld   a, [hli]                                 ; $2914: $2A
    ld   [de], a                                  ; $2915: $12
    inc  de                                       ; $2916: $13
    dec  bc                                       ; $2917: $0B
    ld   a, b                                     ; $2918: $78
    or   c                                        ; $2919: $B1
    jr   nz, CopyData                             ; $291A: $20 $F8
    ret                                           ; $291C: $C9

; Copy data from a series of draw command structures to VRAM.
;
; Inputs:
;   de: address of the next draw command struct (see wDrawCommand)
NoRoomTransitionDrawLoop::
    ; Copy destination address to hl
    inc  de                                       ; $291D: $13
    ld   h, a                                     ; $291E: $67
    ld   a, [de]                                  ; $291F: $1A
    ld   l, a                                     ; $2920: $6F
    ; Copy data length to a
    inc  de                                       ; $2921: $13
    ld   a, [de]                                  ; $2922: $1A
    ; Move de to the data start
    inc  de                                       ; $2923: $13
    call DrawCommandToVRAM                        ; $2924: $CD $41 $29
    ; fallthrough to the next wDrawCommand

; Copy data from a series of draw command structures to VRAM,
; with optional handling during room transitions.
;
; Inputs:
;   de: address of the first draw command struct (see wDrawCommand)
ExecuteDrawCommands::
    ld   a, [wRoomTransitionState]                ; $2927: $FA $24 $C1
    and  a                                        ; $292A: $A7
    jr   nz, .duringMapTransition                 ; $292B: $20 $0F

.noRoomTransition
    ; If a draw command is present, copy the data.
    ld   a, [de]                                  ; $292D: $1A
    and  a                                        ; $292E: $A7
    jr   nz, NoRoomTransitionDrawLoop             ; $292F: $20 $EC
    ; No more draw commands: return.
    ret                                           ; $2931: $C9

.roomTransitionDrawLoop
    inc  de                                       ; $2932: $13
    ld   h, a                                     ; $2933: $67
    ld   a, [de]                                  ; $2934: $1A
    ld   l, a                                     ; $2935: $6F
    inc  de                                       ; $2936: $13
    ld   a, [de]                                  ; $2937: $1A
    inc  de                                       ; $2938: $13
    call DrawCommandToVRAMDuringRoomTransition    ; $2939: $CD $91 $29

.duringMapTransition
    ld   a, [de]                                  ; $293C: $1A
    and  a                                        ; $293D: $A7
    jr   nz, .roomTransitionDrawLoop              ; $293E: $20 $F2
    ret                                           ; $2940: $C9

; Copy data to VRAM map, with support for copying a full row or column.
; See DC_* constants for possible options.
;
; Inputs:
;   de: data copy source address
;   hl: data copy destination address
;   a:  data length (bits 0-5) and copy mode (bits 6-7)
DrawCommandToVRAM::
    ; Save the six lowest bits (actual data length) of the data length to b
    push af                                       ; $2941: $F5
    and  $3F                                      ; $2942: $E6 $3F
    ld   b, a                                     ; $2944: $47
    inc  b                                        ; $2945: $04
    pop  af                                       ; $2946: $F1

    ; Save the two highmost bits (copy flag) of the data length to a
    rlca                                          ; $2947: $07
    rlca                                          ; $2948: $07
    and  $03                                      ; $2949: $E6 $03

    ; Dispatch according to the copy mode
    ; DC_COPY_ROW
    jr   z, .copyRow                              ; $294B: $28 $08
    dec  a                                        ; $294D: $3D
    ; DC_FILL_ROW
    jr   z, .fillRow                              ; $294E: $28 $16
    dec  a                                        ; $2950: $3D
    ; DC_COPY_COLUMN
    jr   z, .copyColumn                           ; $2951: $28 $24
    ; DC_FILL_COLUMN
    jr   .fillColumn                              ; $2953: $18 $2F

.copyRow
    ; Copy one byte from [de] to [hl]
    ld   a, [de]                                  ; $2955: $1A
    ldi  [hl], a                                  ; $2956: $22
    ; If 'dest mod 32' is 0…
    ld   a, l                                     ; $2957: $7D
    and  $1F                                      ; $2958: $E6 $1F
    jr   nz, .noSubstraction0                     ; $295A: $20 $05
    ; dest = dest - 32
    dec  hl                                       ; $295C: $2B
    ld   a, l                                     ; $295D: $7D
    and  $E0                                      ; $295E: $E6 $E0
    ld   l, a                                     ; $2960: $6F
.noSubstraction0
    ; Increment the source address
    inc  de                                       ; $2961: $13
    ; Decrement the length to be copied
    dec  b                                        ; $2962: $05
    ; Loop
    jr   nz, .copyRow                             ; $2963: $20 $F0
    ret                                           ; $2965: $C9

; Copy a single value in [de] from [hl] to [hl + a]
.fillRow
    ; Copy one byte from [de] to [hl]
    ld   a, [de]                                  ; $2966: $1A
    ldi  [hl], a                                  ; $2967: $22
    ; If 'dest mod 32' is 0…
    ld   a, l                                     ; $2968: $7D
    and  $1F                                      ; $2969: $E6 $1F
    jr   nz, .noSubstraction1                     ; $296B: $20 $05
    ; dest = dest - 32
    dec  hl                                       ; $296D: $2B
    ld   a, l                                     ; $296E: $7D
    and  $E0                                      ; $296F: $E6 $E0
    ld   l, a                                     ; $2971: $6F
.noSubstraction1
    ; Decrement the length to be copied
    dec  b                                        ; $2972: $05
    ; Loop (without incrementing the source address)
    jr   nz, .fillRow                             ; $2973: $20 $F1
    inc  de                                       ; $2975: $13
    ret                                           ; $2976: $C9

.copyColumn
    ; Copy one byte from [de] to [hl]
    ld   a, [de]                                  ; $2977: $1A
    ld   [hl], a                                  ; $2978: $77
    ; Increment the source address
    inc  de                                       ; $2979: $13
    ; Move the destination to the next background column
    ld   a, b                                     ; $297A: $78
    ld   bc, $20                                  ; $297B: $01 $20 $00
    add  hl, bc                                   ; $297E: $09
    ; Decrement the length to be copied
    ld   b, a                                     ; $297F: $47
    dec  b                                        ; $2980: $05
    ; Loop
    jr   nz, .copyColumn                          ; $2981: $20 $F4
    ret                                           ; $2983: $C9

.fillColumn
    ; Copy one byte from [de] to [hl]
    ld   a, [de]                                  ; $2984: $1A
    ld   [hl], a                                  ; $2985: $77
    ; Move the destination to the next background column
    ld   a, b                                     ; $2986: $78
    ld   bc, $20                                  ; $2987: $01 $20 $00
    add  hl, bc                                   ; $298A: $09
    ; Decrement the length to be copied
    ld   b, a                                     ; $298B: $47
    dec  b                                        ; $298C: $05
    ; Loop (without incrementing the source address)
    jr   nz, .fillColumn                          ; $298D: $20 $F5
    inc  de                                       ; $298F: $13
    ret                                           ; $2990: $C9

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
    push af                                       ; $2991: $F5
    and  $3F                                      ; $2992: $E6 $3F
    ld   b, a                                     ; $2994: $47
    inc  b                                        ; $2995: $04
    pop  af                                       ; $2996: $F1
    and  $80                                      ; $2997: $E6 $80
    jr   nz, .updateNextBGColumnWithTiles         ; $2999: $20 $15

.jr_299B
    ld   a, [de]                                  ; $299B: $1A
    cp   $EE                                      ; $299C: $FE $EE
    jr   z, .jr_29AB                              ; $299E: $28 $0B
    ldi  [hl], a                                  ; $29A0: $22
    ld   a, l                                     ; $29A1: $7D
    and  $1F                                      ; $29A2: $E6 $1F
    jr   nz, .jr_29AB                             ; $29A4: $20 $05
    dec  hl                                       ; $29A6: $2B
    ld   a, l                                     ; $29A7: $7D
    and  $E0                                      ; $29A8: $E6 $E0
    ld   l, a                                     ; $29AA: $6F

.jr_29AB
    inc  de                                       ; $29AB: $13
    dec  b                                        ; $29AC: $05
    jr   nz, .jr_299B                             ; $29AD: $20 $EC
    ret                                           ; $29AF: $C9

.updateNextBGColumnWithTiles
    ld   a, [de]                                  ; $29B0: $1A
    cp   $EE                                      ; $29B1: $FE $EE
    jr   z, .continue                             ; $29B3: $28 $01
    ld   [hl], a                                  ; $29B5: $77
.continue
    inc  de                                       ; $29B6: $13
    ld   a, b                                     ; $29B7: $78
    ld   bc, $20                                  ; $29B8: $01 $20 $00
    add  hl, bc                                   ; $29BB: $09
    ld   b, a                                     ; $29BC: $47
    dec  b                                        ; $29BD: $05
    jr   nz, .updateNextBGColumnWithTiles         ; $29BE: $20 $F0
    ret                                           ; $29C0: $C9
