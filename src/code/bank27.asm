; Pointers table
; Format: [address high-byte, bank]
Data_027_SourceTable::
._00 db HIGH($6000), $38
._01 db HIGH($6100), $38
._02 db HIGH($6200), $38
._03 db HIGH($6300), $38
._04 db HIGH($6400), $38
._05 db HIGH($6F00), $35

; Copy data from a source specified in the table
; to a destination specified by $D01A
Func_027_7FC5::
    ; Destination address higher byte
    ld   a, [$D01A]                              ; $7FC5: $FA $1A $D0
    cp   $05                                     ; $7FC8: $FE $05
    jr   nz, .else                               ; $7FCA: $20 $04
    ld   c, HIGH($0700)                          ; $7FCC: $0E $07
    jr   .lengthEnd                              ; $7FCE: $18 $01
.else
    ld   c, a                                    ; $7FD0: $4F
.lengthEnd

    ; de = a * 2
    sla  a                                       ; $7FD1: $CB $27
    ld   e, a                                    ; $7FD3: $5F
    ld   d, $00                                  ; $7FD4: $16 $00
    ld   hl, Data_027_SourceTable                ; $7FD6: $21 $B9 $7F
    add  hl, de                                  ; $7FD9: $19
    ; Source address higher byte
    ld   a, [hl+]                                ; $7FDA: $2A
    ld   b, a                                    ; $7FDB: $47
    ; Source bank
    ld   a, [hl]                                 ; $7FDC: $7E
    ; Bank to switch back after the transfert
    ld   h, BANK(Func_027_7FC5)                  ; $7FDD: $26 $27
    ; Execute the copy
    jp   Copy100BytesFromBankAtA                 ; $7FDF: $C3 $13 $0A
