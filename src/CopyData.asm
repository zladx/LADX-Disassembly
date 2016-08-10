; Copy data from specified bank
; Inputs:
;   a  : source bank
;   bc : number of bytes to copy
;   de : destination address
;   hl : source address
CopyDataFromBank::
    ld   [SelectRomBank_2100], a
    call CopyData
    ld   a, $01
    ld   [SelectRomBank_2100], a
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
