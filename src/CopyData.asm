; Copy data
; Inputs:
;   bc : number of bytes to copy
;   de: destination address
;   hl: source address
CopyData::
    ld   a, [hli]
    ld   [de], a
    inc  de
    dec  bc
    ld   a, b
    or   c
    jr   nz, CopyData
    ret

