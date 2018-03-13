; Copy data from specified bank
; Inputs:
;   a  : source bank
;   bc : number of bytes to copy
;   de : destination address
;   hl : source address
CopyDataFromBank::
    ld   [MBC3SelectBank], a
    call CopyData
    ld   a, $01
    ld   [MBC3SelectBank], a
    ret

; Copy data
; Inputs:
;   bc : number of bytes to copy
;   de : destination address
;   hl : source address
CopyData::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  bc
    ld   a, b
    or   c
    jr   nz, CopyData
    ret

; Execute a data copy from a wRequest structure,
; with optional handling during map transitions.
; Inputs:
;   de: data copy request struct (see wRequest)
;   a:  destination address high byte
ExpandCopyRequestArgs
    ; Copy destination address to hl
    inc  de
    ld   h, a
    ld   a, [de]
    ld   l, a
    ; Copy data length to a
    inc  de
    ld   a, [de]
    ; Move de to the data start
    inc  de
    call CopyBackgroundData
    ; fallthrough

; Execute a data copy from a wRequest structure,
; with optional handling during map transitions.
; Inputs:
;   de: data copy request struct (see wRequest)
ExecuteBackgroundCopyRequest::
    ld   a, [wMapSlideTransitionState]
    and  a
    jr   nz, .duringMapTransition

.noMapTransition
    ; If the request is present, copy the data.
    ld   a, [de]
    and  a
    jr   nz, ExpandCopyRequestArgs
    ; but if the request is blank or has just been executed successfully,
    ; return.
    ret

.mapTransitionCopyLoop
    inc  de
    ld   h, a
    ld   a, [de]
    ld   l, a
    inc  de
    ld   a, [de]
    inc  de
    call label_2991

.duringMapTransition
    ld   a, [de]
    and  a
    jr   nz, .mapTransitionCopyLoop
    ret

; Copy map data to Background data
; Inputs:
;   de: data copy source address
;   hl: data copy destination address
;   a:  data length
CopyBackgroundData::
    ; Save the six lowest bits (actual data length) of the data length to b
    push af
    and  $3F
    ld   b, a
    inc  b
    pop  af

    ; Save the two highmost bits (copy flag) of the data length to a
    rlca
    rlca
    and  $03

    ; Dispatch according to the copy flag
    jr   z, .copyMode0
    dec  a
    jr   z, .copyMode1
    dec  a
    jr   z, .copyMode2
    jr   .copyMode3

.copyMode0
    ld   a, [de]
    ldi  [hl], a
    ld   a, l
    and  $1F
    jr   nz, .unknown
    dec  hl
    ld   a, l
    and  $E0
    ld   l, a
.unknown
    inc  de
    dec  b
    jr   nz, .copyMode0
    ret

.copyMode1
    ld   a, [de]
    ldi  [hl], a
    ld   a, l
    and  $1F
    jr   nz, .unknow2
    dec  hl
    ld   a, l
    and  $E0
    ld   l, a
.unknow2
    dec  b
    jr   nz, .copyMode1
    inc  de
    ret

.copyMode2
    ld   a, [de]
    ld   [hl], a
    inc  de
    ld   a, b
    ld   bc, $0020
    add  hl, bc
    ld   b, a
    dec  b
    jr   nz, .copyMode2
    ret

.copyMode3
    ld   a, [de]
    ld   [hl], a
    ld   a, b
    ld   bc, $0020
    add  hl, bc
    ld   b, a
    dec  b
    jr   nz, .copyMode3
    inc  de
    ret

label_2991::
    push af
    and  $3F
    ld   b, a
    inc  b
    pop  af
    and  $80
    jr   nz, UpdateNextBGColumnWithTiles

label_299B::
    ld   a, [de]
    cp   $EE
    jr   z, label_29AB
    ldi  [hl], a
    ld   a, l
    and  $1F
    jr   nz, label_29AB
    dec  hl
    ld   a, l
    and  $E0
    ld   l, a

label_29AB::
    inc  de
    dec  b
    jr   nz, label_299B
    ret

UpdateNextBGColumnWithTiles::
    ld   a, [de]
    cp   $EE
    jr   z, .continue
    ld   [hl], a
.continue
    inc  de
    ld   a, b
    ld   bc, $0020
    add  hl, bc
    ld   b, a
    dec  b
    jr   nz, UpdateNextBGColumnWithTiles
    ret
