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
    ld   a, [wRoomTransitionState]
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
;   a:  data length (bits 0-6) and copy mode (bits 7-8)
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

    ; Dispatch according to the copy mode
    ; BG_COPY_MODE_ROW
    jr   z, .copyRow
    dec  a
    ; BG_COPY_MODE_ROW_SINGLE_VALUE
    jr   z, .copyRowSingleValue
    dec  a
    ; BG_COPY_MODE_COLUMN
    jr   z, .copyColumn
    ; BG_COPY_MODE_COLUMN_SINGLE_VALUE
    jr   .copyColumnSingleValue

.copyRow
    ; Copy one byte from [de] to [hl]
    ld   a, [de]
    ldi  [hl], a
    ; If 'dest mod 32' is 0…
    ld   a, l
    and  $1F
    jr   nz, .noSubstraction0
    ; dest = dest - 32
    dec  hl
    ld   a, l
    and  $E0
    ld   l, a
.noSubstraction0
    ; Increment the source address
    inc  de
    ; Decrement the length to be copied
    dec  b
    ; Loop
    jr   nz, .copyRow
    ret

; Copy a single value in [de] from [hl] to [hl + a]
.copyRowSingleValue
    ; Copy one byte from [de] to [hl]
    ld   a, [de]
    ldi  [hl], a
    ; If 'dest mod 32' is 0…
    ld   a, l
    and  $1F
    jr   nz, .noSubstraction1
    ; dest = dest - 32
    dec  hl
    ld   a, l
    and  $E0
    ld   l, a
.noSubstraction1
    ; Decrement the length to be copied
    dec  b
    ; Loop (without incrementing the source address)
    jr   nz, .copyRowSingleValue
    inc  de
    ret

.copyColumn
    ; Copy one byte from [de] to [hl]
    ld   a, [de]
    ld   [hl], a
    ; Increment the source address
    inc  de
    ; Move the destination to the next background column
    ld   a, b
    ld   bc, $20
    add  hl, bc
    ; Decrement the length to be copied
    ld   b, a
    dec  b
    ; Loop
    jr   nz, .copyColumn
    ret

.copyColumnSingleValue
    ; Copy one byte from [de] to [hl]
    ld   a, [de]
    ld   [hl], a
    ; Move the destination to the next background column
    ld   a, b
    ld   bc, $20
    add  hl, bc
    ; Decrement the length to be copied
    ld   b, a
    dec  b
    ; Loop (without incrementing the source address)
    jr   nz, .copyColumnSingleValue
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
    ld   bc, $20
    add  hl, bc
    ld   b, a
    dec  b
    jr   nz, UpdateNextBGColumnWithTiles
    ret
