; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis


; Data in these tables is formatted as instructions for copying data:
; [address], always 2 bytes, high byte first
; [size / flags], contains the amount of bytes to write - 1, and 2 flag bits.
;       0x40 = repeat the same byte
;       0x80 = unknown flag
; [data] 1 or more data bytes follow. If the repeat flag is set, only a single byte follow.
;        else, the size is used from after the address.
;        if the 0x80 flag is set, there is 1 more byte then normal, but only if the 0x40 flag is not set.

BGCopyRequest24::
    db   $9B, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $98, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $98, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $98, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $98, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $98, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $98, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $98, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $98, $C0 ; address
    db   $03   ; count(3) - 1
    db   $2A, $2B, $04, $14
    db   $98, $CE ; address
    db   $03   ; count(3) - 1
    db   $2A, $2B, $04, $14
    db   $98, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $98, $E0 ; address
    db   $03   ; count(3) - 1
    db   $39, $7F, $7F, $1E
    db   $98, $EE ; address
    db   $05   ; count(5) - 1
    db   $39, $7F, $7F, $1E, $3A, $3B
    db   $99, $00 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $04, $14, $7C, $7C, $2A, $2B, $04, $14, $2A, $2B, $7F, $7F, $7F, $7F, $7F, $7F
    db   $99, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $25 ; address
    db   $03   ; count(3) - 1
    db   $1E, $3A, $3B, $39
    db   $99, $2B ; address
    db   $01   ; count(1) - 1
    db   $1E, $39
    db   $99, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9A, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9A, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $86 ; address
    db   $07   ; count(7) - 1
    db   $24, $25, $26, $26, $29, $29, $27, $28
    db   $99, $A7 ; address
    db   $05   ; count(5) - 1
    db   $34, $35, $36, $36, $37, $38
    db   $99, $C7 ; address
    db   $05   ; count(5) - 1
    db   $24, $25, $26, $26, $27, $28
    db   $99, $E7 ; address
    db   $05   ; count(5) - 1
    db   $24, $25, $26, $26, $27, $28
    db   $9A, $06 ; address
    db   $07   ; count(7) - 1
    db   $24, $25, $26, $26, $29, $29, $27, $28
    db   $9A, $26 ; address
    db   $07   ; count(7) - 1
    db   $24, $25, $26, $26, $29, $29, $27, $28
    db   $00 ; end of data

BGCopyRequest1E::
    db   $99, $E0 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $30, $31, $32, $33, $7F, $5A, $74, $74, $7F, $5A, $30, $31, $32, $33, $30, $31
    db   $98, $00 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $1A, $5A, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $74, $74, $5A, $7F, $24, $25
    db   $98, $20 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $5A, $1A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $74, $74, $7F, $5A, $34, $35
    db   $98, $40 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $5E, $5E, $5E, $5E, $5E, $5E, $5A, $7F, $5A, $7F, $74, $74, $5A, $7F, $20, $21
    db   $98, $60 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $5F, $5F, $5F, $5F, $5F, $5F, $7F, $5A, $7F, $5A, $74, $74, $7F, $5A, $30, $31
    db   $98, $80 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $2C, $2D, $2E, $2F, $2C, $2D, $5A, $7F, $5A, $7F, $74, $74, $5A, $7F, $24, $25
    db   $98, $A0 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $3C, $3D, $3E, $3F, $3C, $3D, $7F, $5A, $7F, $5A, $74, $74, $7F, $5A, $34, $35
    db   $98, $C0 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $74, $74, $74, $74, $1A, $5A, $20, $21
    db   $98, $E0 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $74, $74, $74, $74, $5A, $1A, $30, $31
    db   $99, $00 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $5A, $7F, $5A, $7F, $5A, $7F, $74, $74, $74, $74, $5A, $7F, $14, $16, $24, $25
    db   $99, $20 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $7F, $5A, $7F, $5A, $7F, $5A, $74, $74, $74, $74, $7F, $5A, $15, $17, $34, $35
    db   $99, $40 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $5A, $7F, $5A, $7F, $5A, $7F, $74, $74, $5A, $7F, $5A, $7F, $14, $16, $20, $21
    db   $99, $60 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $7F, $5A, $7F, $5A, $7F, $5A, $74, $74, $7F, $5A, $7F, $5A, $15, $17, $30, $31
    db   $99, $80 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $5A, $7F, $5A, $7F, $5A, $7F, $74, $74, $5A, $7F, $5A, $7F, $20, $21, $22, $29
    db   $99, $A0 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $7F, $5A, $7F, $5A, $7F, $5A, $74, $74, $7F, $5A, $7F, $5A, $30, $31, $32, $33
    db   $99, $C0 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $20, $21, $22, $23, $5A, $7F, $74, $74, $5A, $7F, $20, $21, $22, $29, $28, $21
    db   $99, $E0 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $30, $31, $32, $33, $7F, $5A, $74, $74, $7F, $5A, $30, $31, $32, $33, $30, $31
    db   $9A, $00 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $24, $25, $26, $27, $5A, $7F, $74, $74, $5A, $7F, $24, $25, $28, $21, $22, $29
    db   $9A, $20 ; address
    db   $13   ; count(19) - 1
    db   $1B, $1B, $48, $49, $34, $35, $36, $37, $7F, $5A, $74, $74, $7F, $5A, $34, $35, $30, $31, $32, $33
    db   $00 ; end of data

BGCopyRequest1F::
    db   $98, $00 ; address
    db   $13   ; count(19) - 1
    db   $26, $27, $5A, $7F, $44, $56, $55, $56, $55, $56, $55, $56, $55, $56, $55, $56, $55, $56, $55, $56
    db   $98, $20 ; address
    db   $13   ; count(19) - 1
    db   $36, $37, $7F, $5A, $54, $56, $55, $56, $55, $56, $55, $56, $55, $56, $55, $56, $55, $56, $55, $56
    db   $98, $40 ; address
    db   $13   ; count(19) - 1
    db   $22, $23, $5A, $7F, $5A, $7F, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $5A, $7F, $5A, $7F
    db   $98, $60 ; address
    db   $13   ; count(19) - 1
    db   $32, $33, $7F, $5A, $7F, $5A, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $7F, $5A, $7F, $5A
    db   $98, $80 ; address
    db   $13   ; count(19) - 1
    db   $26, $27, $5A, $7F, $EF, $EF, $EF, $EF, $1A, $5A, $1A, $5A, $1A, $5A, $EF, $EF, $EF, $EF, $5A, $7F
    db   $98, $A0 ; address
    db   $13   ; count(19) - 1
    db   $36, $37, $7F, $5A, $EF, $EF, $EF, $EF, $5A, $1A, $5A, $1A, $5A, $1A, $EF, $EF, $EF, $EF, $7F, $5A
    db   $98, $C0 ; address
    db   $13   ; count(19) - 1
    db   $22, $23, $5A, $7F, $EF, $EF, $1A, $5A, $EF, $EF, $E0, $E1, $EF, $EF, $1A, $5A, $EF, $EF, $5A, $7F
    db   $98, $E0 ; address
    db   $13   ; count(19) - 1
    db   $32, $33, $7F, $5A, $EF, $EF, $5A, $1A, $EF, $EF, $F0, $F1, $EF, $EF, $5A, $1A, $EF, $EF, $7F, $5A
    db   $99, $00 ; address
    db   $13   ; count(19) - 1
    db   $26, $27, $5A, $7F, $EF, $EF, $1A, $5A, $EF, $EF, $E2, $E3, $EF, $EF, $1A, $5A, $EF, $EF, $5A, $7F
    db   $99, $20 ; address
    db   $13   ; count(19) - 1
    db   $36, $37, $7F, $5A, $EF, $EF, $5A, $1A, $EF, $EF, $F2, $F3, $EF, $EF, $5A, $1A, $EF, $EF, $7F, $5A
    db   $99, $40 ; address
    db   $13   ; count(19) - 1
    db   $22, $23, $5A, $7F, $EF, $EF, $1A, $5A, $EF, $EF, $EF, $EF, $EF, $EF, $1A, $5A, $EF, $EF, $5A, $7F
    db   $99, $60 ; address
    db   $13   ; count(19) - 1
    db   $32, $33, $7F, $5A, $EF, $EF, $5A, $1A, $EF, $EF, $EF, $EF, $EF, $EF, $5A, $1A, $EF, $EF, $7F, $5A
    db   $99, $80 ; address
    db   $13   ; count(19) - 1
    db   $26, $27, $5A, $7F, $EF, $EF, $EF, $EF, $1A, $5A, $1A, $5A, $1A, $5A, $EF, $EF, $EF, $EF, $74, $74
    db   $99, $A0 ; address
    db   $13   ; count(19) - 1
    db   $36, $37, $7F, $5A, $EF, $EF, $EF, $EF, $5A, $1A, $5A, $1A, $5A, $1A, $EF, $EF, $EF, $EF, $74, $74
    db   $99, $C0 ; address
    db   $13   ; count(19) - 1
    db   $22, $23, $5A, $7F, $5A, $7F, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $5A, $7F, $5A, $7F
    db   $99, $E0 ; address
    db   $13   ; count(19) - 1
    db   $32, $33, $7F, $5A, $7F, $5A, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $EF, $7F, $5A, $7F, $5A
    db   $9A, $00 ; address
    db   $13   ; count(19) - 1
    db   $26, $27, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F
    db   $9A, $20 ; address
    db   $13   ; count(19) - 1
    db   $36, $37, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A
    db   $00 ; end of data

BGCopyRequest20::
    db   $98, $00 ; address
    db   $13   ; count(19) - 1
    db   $24, $25, $26, $27, $24, $25, $26, $27, $75, $75, $75, $75, $75, $75, $24, $25, $26, $27, $24, $25
    db   $98, $20 ; address
    db   $13   ; count(19) - 1
    db   $34, $35, $36, $37, $34, $35, $36, $37, $75, $75, $75, $75, $75, $75, $34, $35, $36, $37, $34, $35
    db   $98, $40 ; address
    db   $13   ; count(19) - 1
    db   $74, $74, $74, $74, $E6, $E7, $E7, $E7, $E7, $E8, $75, $75, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F
    db   $98, $60 ; address
    db   $13   ; count(19) - 1
    db   $74, $74, $74, $74, $E9, $7C, $7C, $7C, $7C, $F9, $75, $75, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A
    db   $98, $80 ; address
    db   $13   ; count(19) - 1
    db   $5A, $7F, $74, $74, $E9, $7C, $7C, $7C, $7C, $F9, $5E, $5E, $1A, $5A, $5A, $7F, $5A, $7F, $5A, $7F
    db   $98, $A0 ; address
    db   $13   ; count(19) - 1
    db   $7F, $5A, $74, $74, $F6, $F7, $F7, $F7, $F7, $F8, $5F, $5F, $5A, $1A, $7F, $5A, $7F, $5A, $7F, $5A
    db   $98, $C0 ; address
    db   $13   ; count(19) - 1
    db   $5A, $7F, $74, $74, $2C, $2D, $2E, $2F, $2C, $2D, $2E, $2F, $EC, $EC, $75, $75, $5A, $7F, $5A, $7F
    db   $98, $E0 ; address
    db   $13   ; count(19) - 1
    db   $7F, $5A, $74, $74, $3C, $3D, $3E, $3F, $3C, $3D, $3E, $3F, $FC, $FC, $75, $75, $7F, $5A, $7F, $5A
    db   $99, $00 ; address
    db   $13   ; count(19) - 1
    db   $5A, $7F, $74, $74, $74, $74, $74, $74, $74, $EC, $75, $75, $75, $75, $75, $75, $75, $75, $5A, $7F
    db   $99, $20 ; address
    db   $13   ; count(19) - 1
    db   $7F, $5A, $74, $74, $74, $74, $74, $74, $74, $FC, $75, $75, $75, $75, $75, $75, $75, $75, $7F, $5A
    db   $99, $40 ; address
    db   $13   ; count(19) - 1
    db   $5A, $7F, $5A, $7F, $1A, $5A, $75, $75, $75, $75, $75, $75, $75, $75, $75, $75, $5A, $7F, $5A, $7F
    db   $99, $60 ; address
    db   $13   ; count(19) - 1
    db   $7F, $5A, $7F, $5A, $5A, $1A, $75, $75, $75, $75, $75, $75, $75, $75, $75, $75, $7F, $5A, $7F, $5A
    db   $99, $80 ; address
    db   $13   ; count(19) - 1
    db   $74, $74, $74, $74, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $1A, $5A, $5A, $7F
    db   $99, $A0 ; address
    db   $13   ; count(19) - 1
    db   $74, $74, $74, $74, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $5A, $1A, $7F, $5A
    db   $99, $C0 ; address
    db   $13   ; count(19) - 1
    db   $22, $23, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74
    db   $99, $E0 ; address
    db   $13   ; count(19) - 1
    db   $32, $33, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74, $74
    db   $9A, $00 ; address
    db   $13   ; count(19) - 1
    db   $26, $27, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F
    db   $9A, $20 ; address
    db   $13   ; count(19) - 1
    db   $36, $37, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A
    db   $00 ; end of data

BGCopyRequest21::
    db   $98, $00 ; address
    db   $13   ; count(19) - 1
    db   $92, $7C, $92, $7C, $92, $83, $5A, $7F, $5A, $7F, $5A, $7F, $75, $75, $82, $7C, $92, $7C, $24, $25
    db   $98, $20 ; address
    db   $13   ; count(19) - 1
    db   $7C, $92, $7C, $84, $80, $89, $7F, $5A, $7F, $5A, $7F, $5A, $75, $75, $82, $92, $7C, $92, $8E, $8F
    db   $98, $40 ; address
    db   $13   ; count(19) - 1
    db   $92, $7C, $92, $83, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $75, $75, $82, $7C, $92, $7C, $28, $21
    db   $98, $60 ; address
    db   $13   ; count(19) - 1
    db   $7C, $84, $80, $89, $7F, $5A, $7F, $5A, $7F, $5A, $7F, $5A, $75, $75, $88, $80, $85, $92, $30, $31
    db   $98, $80 ; address
    db   $13   ; count(19) - 1
    db   $92, $83, $8C, $8D, $5A, $7F, $14, $16, $14, $16, $5A, $7F, $5A, $7F, $1A, $5A, $82, $7C, $24, $25
    db   $98, $A0 ; address
    db   $13   ; count(19) - 1
    db   $7C, $83, $9C, $9D, $7F, $5A, $15, $17, $15, $17, $7F, $5A, $7F, $5A, $5A, $1A, $82, $92, $8E, $8F
    db   $98, $C0 ; address
    db   $13   ; count(19) - 1
    db   $92, $83, $5A, $7F, $14, $16, $20, $21, $22, $23, $14, $16, $1A, $5A, $75, $75, $82, $7C, $28, $21
    db   $98, $E0 ; address
    db   $13   ; count(19) - 1
    db   $7C, $83, $7F, $5A, $15, $17, $30, $31, $32, $33, $15, $17, $5A, $1A, $75, $75, $82, $92, $30, $31
    db   $99, $00 ; address
    db   $13   ; count(19) - 1
    db   $92, $83, $5A, $7F, $14, $16, $24, $25, $26, $27, $14, $16, $5A, $7F, $75, $75, $82, $7C, $24, $25
    db   $99, $20 ; address
    db   $13   ; count(19) - 1
    db   $7C, $83, $7F, $5A, $15, $17, $34, $35, $36, $37, $15, $17, $7F, $5A, $75, $75, $82, $92, $8E, $8F
    db   $99, $40 ; address
    db   $13   ; count(19) - 1
    db   $92, $83, $5A, $7F, $5A, $7F, $14, $16, $14, $16, $5A, $7F, $75, $75, $75, $75, $82, $7C, $28, $21
    db   $99, $60 ; address
    db   $13   ; count(19) - 1
    db   $7C, $83, $7F, $5A, $7F, $5A, $15, $17, $15, $17, $7F, $5A, $75, $75, $75, $75, $82, $92, $30, $31
    db   $99, $80 ; address
    db   $13   ; count(19) - 1
    db   $92, $83, $5A, $7F, $5A, $7F, $1A, $5A, $8C, $8D, $5A, $7F, $75, $75, $8A, $81, $92, $7C, $24, $25
    db   $99, $A0 ; address
    db   $13   ; count(19) - 1
    db   $7C, $83, $7F, $5A, $7F, $5A, $5A, $1A, $9C, $9D, $7F, $5A, $75, $75, $82, $92, $7C, $92, $8E, $8F
    db   $99, $C0 ; address
    db   $13   ; count(19) - 1
    db   $92, $86, $81, $81, $81, $8B, $5A, $7F, $5A, $7F, $5A, $7F, $75, $75, $82, $7C, $92, $7C, $28, $21
    db   $99, $E0 ; address
    db   $13   ; count(19) - 1
    db   $7C, $92, $7C, $92, $7C, $83, $7F, $5A, $7F, $5A, $7F, $5A, $75, $75, $82, $92, $7C, $92, $30, $31
    db   $9A, $00 ; address
    db   $13   ; count(19) - 1
    db   $92, $7C, $92, $7C, $92, $83, $5A, $7F, $5A, $7F, $75, $75, $75, $75, $82, $7C, $92, $7C, $24, $25
    db   $9A, $20 ; address
    db   $13   ; count(19) - 1
    db   $7C, $92, $7C, $92, $7C, $83, $7F, $5A, $7F, $5A, $75, $75, $75, $75, $82, $92, $7C, $92, $8E, $8F
    db   $00 ; end of data

BGCopyRequest22::
    db   $98, $00 ; address
    db   $13   ; count(19) - 1
    db   $76, $76, $49, $59, $AC, $AD, $AC, $AD, $AC, $AD, $AC, $AD, $AC, $AD, $44, $56, $48, $51, $45, $45
    db   $98, $20 ; address
    db   $13   ; count(19) - 1
    db   $76, $76, $49, $59, $BC, $BD, $BC, $BD, $BC, $BD, $BC, $BD, $BC, $BD, $44, $56, $44, $56, $55, $56
    db   $98, $40 ; address
    db   $13   ; count(19) - 1
    db   $45, $45, $52, $59, $AC, $AD, $AC, $AD, $AC, $AD, $AC, $AD, $AA, $AB, $44, $56, $44, $56, $55, $56
    db   $98, $60 ; address
    db   $13   ; count(19) - 1
    db   $55, $56, $55, $47, $BC, $BD, $BC, $BD, $BC, $BD, $BC, $BD, $BA, $BB, $54, $56, $44, $56, $55, $56
    db   $98, $80 ; address
    db   $13   ; count(19) - 1
    db   $55, $56, $55, $47, $AC, $AD, $AC, $AD, $AC, $AD, $AC, $AD, $AC, $AD, $AC, $AD, $44, $56, $55, $56
    db   $98, $A0 ; address
    db   $13   ; count(19) - 1
    db   $55, $56, $55, $57, $BC, $BD, $BC, $BD, $BC, $BD, $BC, $BD, $BC, $BD, $BC, $BD, $54, $56, $55, $56
    db   $98, $C0 ; address
    db   $13   ; count(19) - 1
    db   $AC, $AD, $AC, $AD, $AC, $AD, $AC, $AD, $AC, $AD, $AE, $AF, $AC, $AD, $AC, $AD, $AA, $AB, $AC, $AD
    db   $98, $E0 ; address
    db   $13   ; count(19) - 1
    db   $BC, $BD, $BC, $BD, $BC, $BD, $BC, $BD, $BC, $BD, $BE, $BF, $BC, $BD, $BC, $BD, $BA, $BB, $BC, $BD
    db   $99, $00 ; address
    db   $13   ; count(19) - 1
    db   $4A, $4A, $4A, $4D, $AC, $AD, $AC, $AD, $AE, $AF, $AC, $AD, $AC, $AD, $A8, $A9, $AC, $AD, $AC, $AD
    db   $99, $20 ; address
    db   $13   ; count(19) - 1
    db   $45, $45, $5D, $59, $BC, $BD, $BC, $BD, $BE, $BF, $BC, $BD, $BC, $BD, $B8, $B9, $BC, $BD, $BC, $BD
    db   $99, $40 ; address
    db   $13   ; count(19) - 1
    db   $76, $76, $49, $59, $1C, $1D, $1C, $1D, $1C, $1D, $1C, $1D, $1C, $1D, $1C, $1D, $1C, $1D, $1C, $1D
    db   $99, $60 ; address
    db   $13   ; count(19) - 1
    db   $76, $76, $49, $59, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F
    db   $99, $80 ; address
    db   $13   ; count(19) - 1
    db   $45, $45, $52, $59, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F
    db   $99, $A0 ; address
    db   $13   ; count(19) - 1
    db   $55, $56, $55, $47, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F
    db   $99, $C0 ; address
    db   $13   ; count(19) - 1
    db   $55, $56, $55, $47, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F
    db   $99, $E0 ; address
    db   $13   ; count(19) - 1
    db   $55, $56, $55, $57, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F
    db   $9A, $00 ; address
    db   $13   ; count(19) - 1
    db   $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F
    db   $9A, $20 ; address
    db   $13   ; count(19) - 1
    db   $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F, $1E, $1F
    db   $00 ; end of data

BGCopyRequest01::
    db   $98, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $49 ; address
    db   $00   ; count(0) - 1
    db   $1F
    db   $98, $68 ; address
    db   $02   ; count(2) - 1
    db   $06, $44, $0A
    db   $98, $88 ; address
    db   $02   ; count(2) - 1
    db   $16, $15, $1A
    db   $98, $A7 ; address
    db   $04   ; count(4) - 1
    db   $07, $15, $15, $15, $19
    db   $98, $C6 ; address
    db   $07   ; count(7) - 1
    db   $07, $15, $15, $15, $15, $15, $08, $09
    db   $98, $E5 ; address
    db   $09   ; count(9) - 1
    db   $07, $15, $15, $15, $15, $15, $15, $15, $15, $19
    db   $99, $03 ; address
    db   $0D   ; count(13) - 1
    db   $17, $18, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15, $08, $09
    db   $99, $21 ; address
    db   $11   ; count(17) - 1
    db   $17, $18, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15, $15, $08, $09
    db   $99, $40 ; address
    db   $13   ; count(19) - 1
    db   $82, $83, $0C, $0D, $0C, $0D, $0E, $0F, $0E, $0F, $0E, $0F, $0E, $0F, $0C, $0D, $0C, $0D, $82, $83
    db   $99, $60 ; address
    db   $01   ; count(1) - 1
    db   $92, $93
    db   $99, $72 ; address
    db   $01   ; count(1) - 1
    db   $92, $93
    db   $00 ; end of data

BGCopyRequest16::       ; Ending water spout
    db   $9C, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9C, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9C, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9C, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9C, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9C, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9C, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9C, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9D, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9D, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9D, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9D, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9D, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9D, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9D, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9D, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9E, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9E, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9E, $40 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $A0, $A0, $A0, $A0, $A0
    db   $9E, $60 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $92, $93, $94, $95, $96, $97, $98, $99, $9A, $9B, $9C, $9D, $A0, $A0, $A0, $A0
    db   $9E, $80 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A1, $A2, $A3, $A4, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $A0, $A0, $A0
    db   $9E, $A0 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF, $A0, $A0
    db   $9E, $C0 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $8E, $8F, $CA, $CB, $CC, $CD, $CE, $CF, $A0, $A0
    db   $9E, $E0 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $82, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $8D, $A0, $A0, $A0
    db   $9F, $00 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80, $81, $A0, $A0, $A0, $A0, $A0, $A0
    db   $9F, $20 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0
    db   $9F, $40 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80, $81, $A0, $A0, $A0, $A0, $A0, $A0
    db   $9F, $60 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0
    db   $9F, $80 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80, $81, $A0, $A0, $A0, $A0, $A0, $A0
    db   $9F, $A0 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0
    db   $9F, $C0 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80, $81, $A0, $A0, $A0, $A0, $A0, $A0
    db   $9F, $E0 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0
    db   $98, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $98, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $98, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $98, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $98, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $98, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $98, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $98, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $99, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $99, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $99, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $99, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $99, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $99, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $99, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $99, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9A, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9A, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $A0
    db   $98, $80 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $03, $04, $03, $04, $A0, $A0, $A0
    db   $98, $A0 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $03, $04, $A0, $A0, $02, $10, $11, $10, $30, $04, $03, $04
    db   $98, $C0 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $12, $04, $03, $30, $30, $30, $04, $00, $01, $00, $6B, $30, $30, $30, $30
    db   $98, $E0 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $02, $5A, $10, $30, $30, $30, $30, $10, $04, $A0, $03, $30, $30, $11, $10, $11
    db   $99, $00 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $00, $01, $00, $10, $11, $21, $00, $00, $21, $12, $5A, $10, $11, $01, $00, $01
    db   $99, $20 ; address
    db   $13   ; count(19) - 1
    db   $04, $A0, $A0, $A0, $A0, $A0, $A0, $00, $01, $A0, $A0, $A0, $A0, $00, $01, $00, $01, $A0, $A0, $A0
    db   $99, $40 ; address
    db   $13   ; count(19) - 1
    db   $30, $04, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0
    db   $99, $60 ; address
    db   $13   ; count(19) - 1
    db   $10, $0F, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $03, $04, $A0, $A0
    db   $99, $80 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $12, $30, $30, $04, $A0
    db   $99, $A0 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $03, $04, $A0, $02, $5A, $20, $10, $0F, $A0
    db   $99, $C0 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A0, $A0, $A0, $A0, $A0, $12, $04, $03, $30, $30, $30, $0F, $A0, $00, $01, $00, $01, $A0, $A0
    db   $99, $E0 ; address
    db   $13   ; count(19) - 1
    db   $A0, $12, $04, $A0, $A0, $A0, $00, $20, $10, $10, $10, $30, $04, $A0, $A0, $A0, $A0, $A0, $A0, $A0
    db   $9A, $00 ; address
    db   $13   ; count(19) - 1
    db   $A0, $00, $10, $04, $03, $04, $03, $71, $6B, $10, $10, $10, $0F, $A0, $A0, $A0, $A0, $03, $04, $A0
    db   $9A, $20 ; address
    db   $13   ; count(19) - 1
    db   $A0, $02, $5A, $10, $30, $11, $10, $30, $11, $11, $11, $01, $A0, $A0, $12, $04, $03, $30, $0F, $A0
    db   $9A, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $A0
    db   $9A, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $A0
    db   $9A, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $A0
    db   $9A, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $A0
    db   $9A, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $A0
    db   $9A, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $A0
    db   $9B, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $A0
    db   $00 ; end of data

BGCopyRequest17::
    db   $98, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $02 ; address
    db   $03   ; count(3) - 1
    db   $E5, $E6, $E1, $E2
    db   $98, $22 ; address
    db   $03   ; count(3) - 1
    db   $F5, $F6, $F1, $F2
    db   $98, $40 ; address
    db   $07   ; count(7) - 1
    db   $E3, $E4, $E7, $E8, $A0, $A1, $80, $81
    db   $98, $52 ; address
    db   $01   ; count(1) - 1
    db   $E3, $E4
    db   $98, $60 ; address
    db   $07   ; count(7) - 1
    db   $F3, $F4, $F7, $AE, $B0, $B1, $90, $91
    db   $98, $72 ; address
    db   $01   ; count(1) - 1
    db   $F3, $F4
    db   $98, $80 ; address
    db   $13   ; count(19) - 1
    db   $E7, $E8, $AE, $AE, $AE, $AE, $A0, $A1, $80, $81, $E3, $E4, $E1, $E2, $AC, $AC, $E5, $E6, $E7, $E8
    db   $98, $A0 ; address
    db   $13   ; count(19) - 1
    db   $F7, $AE, $AE, $AE, $AE, $AE, $B0, $B1, $90, $91, $F3, $F4, $F1, $F2, $AC, $AC, $F5, $F6, $F7, $AE
    db   $98, $C0 ; address
    db   $13   ; count(19) - 1
    db   $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83
    db   $98, $E0 ; address
    db   $13   ; count(19) - 1
    db   $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93
    db   $00 ; end of data

BGCopyRequest18::
    db   $98, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $00 ; address
    db   $07   ; count(7) - 1
    db   $56, $73, $AE, $AE, $AE, $AE, $AE, $3E
    db   $98, $0E ; address
    db   $05   ; count(5) - 1
    db   $56, $73, $AE, $AE, $AE, $AE
    db   $98, $20 ; address
    db   $07   ; count(7) - 1
    db   $72, $AE, $AE, $AE, $AE, $AE, $3D, $3F
    db   $98, $2E ; address
    db   $05   ; count(5) - 1
    db   $72, $AE, $AE, $AE, $AE, $AE
    db   $98, $40 ; address
    db   $07   ; count(7) - 1
    db   $AE, $AE, $AE, $AE, $AE, $AE, $74, $67
    db   $98, $4E ; address
    db   $05   ; count(5) - 1
    db   $45, $AE, $AE, $AE, $AE, $AE
    db   $98, $60 ; address
    db   $07   ; count(7) - 1
    db   $AE, $AE, $AE, $AE, $AE, $AE, $AE, $75
    db   $98, $6E ; address
    db   $05   ; count(5) - 1
    db   $78, $79, $AE, $AE, $AE, $AE
    db   $98, $80 ; address
    db   $07   ; count(7) - 1
    db   $45, $AE, $2C, $2D, $45, $AE, $2C, $2D
    db   $98, $90 ; address
    db   $03   ; count(3) - 1
    db   $7A, $4B, $AE, $3E
    db   $98, $A0 ; address
    db   $06   ; count(6) - 1
    db   $78, $79, $3C, $AC, $78, $79, $3C
    db   $98, $B1 ; address
    db   $02   ; count(2) - 1
    db   $7B, $3D, $3F
    db   $98, $C8 ; address
    db   $03   ; count(3) - 1
    db   $84, $85, $9D, $9F
    db   $98, $E8 ; address
    db   $03   ; count(3) - 1
    db   $A2, $A3, $BF, $F0
    db   $99, $08 ; address
    db   $03   ; count(3) - 1
    db   $F8, $FA, $FC, $FD
    db   $99, $28 ; address
    db   $03   ; count(3) - 1
    db   $FE, $FF, $05, $0B
    db   $98, $E0 ; address
    db   $01   ; count(1) - 1
    db   $74, $67
    db   $99, $00 ; address
    db   $01   ; count(1) - 1
    db   $AE, $75
    db   $99, $20 ; address
    db   $01   ; count(1) - 1
    db   $2C, $2D
    db   $99, $40 ; address
    db   $00   ; count(0) - 1
    db   $3C
    db   $99, $44 ; address
    db   $03   ; count(3) - 1
    db   $56, $73, $74, $67
    db   $99, $64 ; address
    db   $03   ; count(3) - 1
    db   $72, $AE, $AE, $75
    db   $99, $84 ; address
    db   $03   ; count(3) - 1
    db   $7A, $4B, $AE, $3E
    db   $99, $A5 ; address
    db   $02   ; count(2) - 1
    db   $7B, $3D, $3F
    db   $99, $92 ; address
    db   $01   ; count(1) - 1
    db   $56, $73
    db   $99, $B2 ; address
    db   $01   ; count(1) - 1
    db   $72, $AE
    db   $99, $D2 ; address
    db   $01   ; count(1) - 1
    db   $7A, $4B
    db   $99, $F3 ; address
    db   $00   ; count(0) - 1
    db   $7B
    db   $9A, $13 ; address
    db   $00   ; count(0) - 1
    db   $57
    db   $9A, $32 ; address
    db   $01   ; count(1) - 1
    db   $70, $71
    db   $99, $C2 ; address
    db   $02   ; count(2) - 1
    db   $56, $73, $66
    db   $99, $E2 ; address
    db   $03   ; count(3) - 1
    db   $72, $AE, $76, $77
    db   $9A, $00 ; address
    db   $07   ; count(7) - 1
    db   $56, $73, $AE, $AE, $AE, $AE, $74, $67
    db   $9A, $20 ; address
    db   $07   ; count(7) - 1
    db   $72, $AE, $AE, $AE, $AE, $AE, $AE, $75
    db   $00 ; end of data

BGCopyRequest19::
    db   $98, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9B, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9B, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $12 ; address
    db   $01   ; count(1) - 1
    db   $E5, $E6
    db   $98, $32 ; address
    db   $01   ; count(1) - 1
    db   $F5, $F6
    db   $98, $40 ; address
    db   $01   ; count(1) - 1
    db   $80, $81
    db   $98, $4C ; address
    db   $07   ; count(7) - 1
    db   $E5, $E6, $E1, $E2, $E3, $E4, $E7, $E8
    db   $98, $60 ; address
    db   $01   ; count(1) - 1
    db   $90, $91
    db   $98, $6C ; address
    db   $07   ; count(7) - 1
    db   $F5, $F6, $F1, $F2, $F3, $F4, $F7, $AE
    db   $98, $80 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A1, $E1, $E2, $AC, $E3, $E4, $E1, $E2, $AC, $E3, $E4, $E7, $E8, $A0, $A1, $E7, $E8, $A0, $A1
    db   $98, $A0 ; address
    db   $13   ; count(19) - 1
    db   $B0, $B1, $F1, $F2, $AC, $F3, $F4, $F1, $F2, $AC, $F3, $F4, $F7, $AE, $B0, $B1, $F7, $AE, $B0, $B1
    db   $98, $C0 ; address
    db   $13   ; count(19) - 1
    db   $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83
    db   $98, $E0 ; address
    db   $13   ; count(19) - 1
    db   $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93
    db   $99, $68 ; address
    db   $03   ; count(3) - 1
    db   $86, $87, $88, $89
    db   $99, $86 ; address
    db   $05   ; count(5) - 1
    db   $94, $95, $96, $97, $98, $99
    db   $99, $A6 ; address
    db   $07   ; count(7) - 1
    db   $A4, $A5, $A6, $A7, $A8, $A9, $AA, $AB
    db   $99, $C4 ; address
    db   $0C   ; count(12) - 1
    db   $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE
    db   $99, $E2 ; address
    db   $0F   ; count(15) - 1
    db   $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF
    db   $9A, $02 ; address
    db   $0F   ; count(15) - 1
    db   $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF
    db   $9A, $22 ; address
    db   $0F   ; count(15) - 1
    db   $E0, $6C, $6D, $6E, $6F, $6C, $6D, $6E, $6F, $6C, $6D, $6E, $6F, $6C, $6D, $EF
    db   $00 ; end of data

BGCopyRequest1A::
    db   $98, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $28 ; address
    db   $03   ; count(3) - 1
    db   $50, $51, $52, $53
    db   $98, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $48 ; address
    db   $05   ; count(5) - 1
    db   $60, $61, $62, $63, $64, $65
    db   $98, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $92 ; address
    db   $01   ; count(1) - 1
    db   $E5, $E6
    db   $98, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $A4 ; address
    db   $01   ; count(1) - 1
    db   $64, $65
    db   $98, $B2 ; address
    db   $01   ; count(1) - 1
    db   $F5, $F6
    db   $98, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $C0 ; address
    db   $01   ; count(1) - 1
    db   $80, $81
    db   $98, $CC ; address
    db   $07   ; count(7) - 1
    db   $E5, $E6, $E1, $E2, $E3, $E4, $E7, $E8
    db   $98, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $E0 ; address
    db   $01   ; count(1) - 1
    db   $90, $91
    db   $98, $EC ; address
    db   $07   ; count(7) - 1
    db   $F5, $F6, $F1, $F2, $F3, $F4, $F7, $AE
    db   $99, $00 ; address
    db   $13   ; count(19) - 1
    db   $A0, $A1, $E1, $E2, $AC, $E3, $E4, $E1, $E2, $AC, $E3, $E4, $E7, $E8, $A0, $A1, $E7, $E8, $A0, $A1
    db   $99, $20 ; address
    db   $13   ; count(19) - 1
    db   $B0, $B1, $F1, $F2, $AC, $F3, $F4, $F1, $F2, $AC, $F3, $F4, $F7, $AE, $B0, $B1, $F7, $AE, $B0, $B1
    db   $99, $40 ; address
    db   $1F   ; count(31) - 1
    db   $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83
    db   $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83
    db   $99, $60 ; address
    db   $1F   ; count(31) - 1
    db   $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93
    db   $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93
    db   $99, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $00 ; end of data

BGCopyRequest1B::
    db   $9B, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9B, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $01 ; address
    db   $05   ; count(5) - 1
    db   $58, $59, $5A, $5B, $5C, $5D
    db   $98, $21 ; address
    db   $05   ; count(5) - 1
    db   $68, $69, $6A, $6B, $6C, $6D
    db   $98, $31 ; address
    db   $02   ; count(2) - 1
    db   $58, $59, $5A
    db   $98, $51 ; address
    db   $02   ; count(2) - 1
    db   $68, $69, $6A
    db   $98, $60 ; address
    db   $01   ; count(1) - 1
    db   $5C, $5D
    db   $98, $80 ; address
    db   $07   ; count(7) - 1
    db   $6C, $6D, $AC, $AC, $50, $51, $52, $53
    db   $98, $A4 ; address
    db   $05   ; count(5) - 1
    db   $60, $61, $62, $63, $64, $65
    db   $99, $40 ; address
    db   $03   ; count(3) - 1
    db   $50, $51, $52, $53
    db   $99, $4F ; address
    db   $03   ; count(3) - 1
    db   $50, $51, $52, $53
    db   $99, $60 ; address
    db   $03   ; count(3) - 1
    db   $60, $61, $62, $63
    db   $99, $6D ; address
    db   $05   ; count(5) - 1
    db   $64, $65, $60, $61, $62, $63
    db   $99, $E3 ; address
    db   $01   ; count(1) - 1
    db   $64, $65
    db   $9A, $00 ; address
    db   $01   ; count(1) - 1
    db   $64, $65
    db   $9A, $10 ; address
    db   $01   ; count(1) - 1
    db   $64, $65
    db   $00 ; end of data

BGCopyRequest1C::
BGCopyRequest1D::
    db   $98, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $98, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $99, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9B, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9B, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9B, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9B, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9B, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9B, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9B, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9B, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9A, $40 ; address
    db   $01   ; count(1) - 1
    db   $6C, $6D
    db   $9A, $46 ; address
    db   $03   ; count(3) - 1
    db   $50, $51, $52, $53
    db   $9A, $66 ; address
    db   $03   ; count(3) - 1
    db   $60, $61, $62, $63
    db   $9A, $90 ; address
    db   $03   ; count(3) - 1
    db   $E3, $E4, $E1, $E2
    db   $9A, $B0 ; address
    db   $03   ; count(3) - 1
    db   $F3, $F4, $F1, $F2
    db   $9A, $CE ; address
    db   $05   ; count(5) - 1
    db   $E3, $E4, $E7, $E8, $A0, $A1
    db   $9A, $EE ; address
    db   $05   ; count(5) - 1
    db   $F3, $F4, $F7, $AE, $B0, $B1
    db   $9B, $04 ; address
    db   $03   ; count(3) - 1
    db   $50, $51, $52, $53
    db   $9B, $0E ; address
    db   $05   ; count(5) - 1
    db   $22, $23, $02, $03, $23, $AE
    db   $9B, $24 ; address
    db   $03   ; count(3) - 1
    db   $60, $61, $62, $63
    db   $9B, $2E ; address
    db   $05   ; count(5) - 1
    db   $32, $33, $12, $13, $AE, $AE
    db   $9B, $40 ; address
    db   $03   ; count(3) - 1
    db   $E3, $E4, $E1, $E2
    db   $9B, $4B ; address
    db   $01   ; count(1) - 1
    db   $64, $65
    db   $9B, $50 ; address
    db   $03   ; count(3) - 1
    db   $22, $23, $02, $03
    db   $9B, $60 ; address
    db   $03   ; count(3) - 1
    db   $F3, $F4, $F1, $F2
    db   $9B, $70 ; address
    db   $03   ; count(3) - 1
    db   $32, $33, $12, $13
    db   $9B, $80 ; address
    db   $08   ; count(8) - 1
    db   $E7, $E8, $A0, $A1, $80, $81, $AC, $64, $65
    db   $9B, $92 ; address
    db   $01   ; count(1) - 1
    db   $22, $23
    db   $9B, $A0 ; address
    db   $05   ; count(5) - 1
    db   $F7, $AE, $B0, $B1, $90, $91
    db   $9B, $B2 ; address
    db   $01   ; count(1) - 1
    db   $F5, $F6
    db   $9B, $C0 ; address
    db   $05   ; count(5) - 1
    db   $03, $00, $01, $AE, $20, $21
    db   $9B, $CC ; address
    db   $07   ; count(7) - 1
    db   $E5, $E6, $E1, $E2, $E3, $E4, $E7, $E8
    db   $9B, $E0 ; address
    db   $05   ; count(5) - 1
    db   $13, $10, $11, $AE, $30, $31
    db   $9B, $EC ; address
    db   $07   ; count(7) - 1
    db   $F5, $F6, $F1, $F2, $F3, $F4, $F7, $AE
    db   $98, $00 ; address
    db   $03   ; count(3) - 1
    db   $AE, $AE, $20, $21
    db   $98, $0A ; address
    db   $09   ; count(9) - 1
    db   $E3, $E4, $E7, $E8, $A0, $A1, $E7, $E8, $A0, $A1
    db   $98, $20 ; address
    db   $03   ; count(3) - 1
    db   $AE, $AE, $30, $31
    db   $98, $2A ; address
    db   $09   ; count(9) - 1
    db   $F3, $F4, $F7, $AE, $B0, $B1, $F7, $23, $B0, $B1
    db   $98, $40 ; address
    db   $03   ; count(3) - 1
    db   $02, $03, $E1, $E2
    db   $98, $4A ; address
    db   $09   ; count(9) - 1
    db   $22, $23, $02, $03, $23, $AE, $AE, $AE, $AE, $AE
    db   $98, $60 ; address
    db   $03   ; count(3) - 1
    db   $12, $13, $F1, $F2
    db   $98, $6A ; address
    db   $09   ; count(9) - 1
    db   $32, $33, $12, $13, $23, $AE, $23, $AE, $AE, $AE
    db   $98, $80 ; address
    db   $03   ; count(3) - 1
    db   $AE, $AE, $20, $21
    db   $98, $8C ; address
    db   $07   ; count(7) - 1
    db   $22, $23, $02, $03, $23, $AE, $AE, $AE
    db   $98, $A0 ; address
    db   $03   ; count(3) - 1
    db   $AE, $AE, $30, $31
    db   $98, $AC ; address
    db   $07   ; count(7) - 1
    db   $32, $33, $12, $13, $AE, $AE, $AE, $AE
    db   $98, $C0 ; address
    db   $03   ; count(3) - 1
    db   $AE, $AE, $E1, $E2
    db   $98, $CC ; address
    db   $07   ; count(7) - 1
    db   $E3, $E4, $E7, $E8, $AE, $AE, $AE, $AE
    db   $98, $E0 ; address
    db   $03   ; count(3) - 1
    db   $AE, $AE, $F1, $F2
    db   $98, $EC ; address
    db   $07   ; count(7) - 1
    db   $F3, $F4, $F7, $AE, $AE, $AE, $AE, $AE
    db   $99, $00 ; address
    db   $05   ; count(5) - 1
    db   $02, $03, $00, $01, $80, $81
    db   $99, $0A ; address
    db   $09   ; count(9) - 1
    db   $E5, $E6, $E7, $E8, $AE, $AE, $AE, $AE, $AE, $AE
    db   $99, $20 ; address
    db   $05   ; count(5) - 1
    db   $12, $13, $10, $11, $90, $91
    db   $99, $2A ; address
    db   $09   ; count(9) - 1
    db   $F5, $F6, $F7, $AE, $AE, $AE, $AE, $AE, $AE, $AE
    db   $99, $40 ; address
    db   $13   ; count(19) - 1
    db   $23, $AE, $AE, $AE, $A0, $A1, $E1, $E2, $AC, $AC, $22, $23, $AE, $AE, $AE, $AE, $AE, $AE, $AE, $AE
    db   $99, $60 ; address
    db   $13   ; count(19) - 1
    db   $AE, $AE, $AE, $23, $B0, $B1, $F1, $F2, $AC, $AC, $32, $33, $23, $AE, $AE, $AE, $AE, $AE, $AE, $AE
    db   $99, $80 ; address
    db   $13   ; count(19) - 1
    db   $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83
    db   $99, $A0 ; address
    db   $13   ; count(19) - 1
    db   $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93
    db   $9C, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9C, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9C, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9C, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9C, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9C, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9C, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9C, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9D, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9D, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9D, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9D, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9D, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9D, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9D, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9D, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9E, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $9E, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $AC
    db   $00 ; end of data

BGCopyRequest14::
    db   $9A, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9A, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9A, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9A, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9A, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9A, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9A, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9A, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9B, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9B, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9B, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9B, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9B, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9B, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9B, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $9B, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $00 ; end of data

BGCopyRequest08::       ; World Map screen
    db   $98, $00 ; address
    db   $13   ; count(19) - 1
    db   $FC, $3B, $52, $52, $52, $52, $52, $52, $52, $52, $52, $52, $52, $52, $52, $52, $52, $52, $3C, $FC
    db   $9A, $20 ; address
    db   $13   ; count(19) - 1
    db   $FC, $4B, $4F, $4E, $4E, $4E, $4E, $4D, $53, $53, $4F, $4E, $4D, $53, $53, $53, $53, $53, $4C, $FC
    db   $98, $20 ; address
    db   $CF   ; count(16) - 1 | FLAG_REPEAT | FLAG_UNKNOWN
    db   $FC
    db   $98, $33 ; address
    db   $CF   ; count(16) - 1 | FLAG_REPEAT | FLAG_UNKNOWN
    db   $FC
    db   $98, $21 ; address
    db   $CF   ; count(16) - 1 | FLAG_REPEAT | FLAG_UNKNOWN
    db   $50
    db   $98, $32 ; address
    db   $CF   ; count(16) - 1 | FLAG_REPEAT | FLAG_UNKNOWN
    db   $51
    db   $00 ; end of data

BGCopyRequest04::
    db   $99, $E6 ; address
    db   $0A   ; count(10) - 1
    db   $04, $11, $00, $12, $04, $7E, $7E, $02, $0E, $0F, $18
    ; fall to the next data section

BGCopyRequest03::
    db   $98, $00 ; address
    db   $48   ; count(9) - 1 | FLAG_REPEAT
    db   $8F
    db   $98, $01 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $03 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $05 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $07 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $09 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $20 ; address
    db   $08   ; count(8) - 1
    db   $9F, $80, $81, $82, $83, $84, $89, $8F, $9F
    db   $98, $40 ; address
    db   $08   ; count(8) - 1
    db   $8F, $90, $91, $92, $93, $94, $AA, $9F, $8F
    db   $98, $60 ; address
    db   $08   ; count(8) - 1
    db   $9F, $8A, $8B, $8C, $8D, $8E, $AF, $8F, $9F
    db   $98, $80 ; address
    db   $52   ; count(19) - 1 | FLAG_REPEAT
    db   $8F
    db   $98, $81 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $83 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $85 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $87 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $89 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $8B ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $8D ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $8F ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $91 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $93 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $A0 ; address
    db   $CB   ; count(12) - 1 | FLAG_REPEAT | FLAG_UNKNOWN
    db   $9F
    db   $98, $C0 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $00 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $40 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $80 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $C0 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $9A, $00 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $9A, $20 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $21 ; address
    db   $50   ; count(17) - 1 | FLAG_REPEAT
    db   $8F
    db   $9A, $22 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $24 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $26 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $28 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $2A ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $2C ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $2E ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $30 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $32 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $98, $B3 ; address
    db   $CA   ; count(11) - 1 | FLAG_REPEAT | FLAG_UNKNOWN
    db   $8F
    db   $98, $D3 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $13 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $53 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $93 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $D3 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $13 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $33 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $0A ; address
    db   $49   ; count(10) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $29 ; address
    db   $4A   ; count(11) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $69 ; address
    db   $4A   ; count(11) - 1 | FLAG_REPEAT
    db   $A2
    db   $98, $49 ; address
    db   $0A   ; count(10) - 1
    db   $A1, $A0, $A1, $A5, $A6, $A0, $A1, $A5, $A6, $A0, $A1
    db   $98, $2C ; address
    db   $01   ; count(1) - 1
    db   $A3, $A4
    db   $98, $30 ; address
    db   $01   ; count(1) - 1
    db   $A3, $A4
    db   $98, $6C ; address
    db   $01   ; count(1) - 1
    db   $A7, $A8
    db   $98, $70 ; address
    db   $01   ; count(1) - 1
    db   $A7, $A8
    db   $98, $C4 ; address
    db   $00   ; count(0) - 1
    db   $AB
    db   $99, $24 ; address
    db   $00   ; count(0) - 1
    db   $AC
    db   $99, $84 ; address
    db   $00   ; count(0) - 1
    db   $AD
    db   $99, $C2 ; address
    db   $4F   ; count(16) - 1 | FLAG_REPEAT
    db   $A9
    db   $9A, $32 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $33 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $00 ; end of data

BGCopyRequest05::
    db   $98, $00 ; address
    db   $50   ; count(17) - 1 | FLAG_REPEAT
    db   $8F
    db   $98, $01 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $03 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $05 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $07 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $09 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $0B ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $0D ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $0F ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $11 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $20 ; address
    db   $07   ; count(7) - 1
    db   $9F, $85, $86, $87, $88, $8F, $9F, $8F
    db   $98, $40 ; address
    db   $07   ; count(7) - 1
    db   $8F, $95, $96, $97, $98, $99, $8F, $9F
    db   $98, $60 ; address
    db   $07   ; count(7) - 1
    db   $9F, $9A, $9B, $9C, $9D, $9E, $9F, $8F
    db   $98, $30 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $50 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $98, $70 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $12 ; address
    db   $41   ; count(2) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $31 ; address
    db   $42   ; count(3) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $51 ; address
    db   $02   ; count(2) - 1
    db   $A1, $A0, $A1
    db   $98, $71 ; address
    db   $42   ; count(3) - 1 | FLAG_REPEAT
    db   $A2
    db   $98, $80 ; address
    db   $52   ; count(19) - 1 | FLAG_REPEAT
    db   $8F
    db   $98, $81 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $83 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $85 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $87 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $89 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $8B ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $8D ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $8F ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $91 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $93 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $A0 ; address
    db   $C9   ; count(10) - 1 | FLAG_REPEAT | FLAG_UNKNOWN
    db   $9F
    db   $98, $C0 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $00 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $40 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $80 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $C0 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $98, $B3 ; address
    db   $C9   ; count(10) - 1 | FLAG_REPEAT | FLAG_UNKNOWN
    db   $8F
    db   $98, $D3 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $13 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $53 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $93 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $D3 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $20 ; address
    db   $52   ; count(19) - 1 | FLAG_REPEAT
    db   $9F
    db   $9A, $21 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $9A, $23 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $9A, $25 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $9A, $27 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $9A, $29 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $9A, $2B ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $9A, $2D ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $9A, $2F ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $9A, $31 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $9A, $33 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $98, $C2 ; address
    db   $06   ; count(6) - 1
    db   $00, $01, $02, $03, $04, $05, $06
    db   $99, $02 ; address
    db   $06   ; count(6) - 1
    db   $07, $08, $09, $0A, $0B, $0C, $0D
    db   $99, $42 ; address
    db   $06   ; count(6) - 1
    db   $0E, $0F, $10, $11, $12, $13, $14
    db   $99, $82 ; address
    db   $04   ; count(4) - 1
    db   $15, $16, $17, $18, $19
    db   $98, $CB ; address
    db   $06   ; count(6) - 1
    db   $1A, $1B, $1C, $1D, $1E, $1F, $20
    db   $99, $0B ; address
    db   $06   ; count(6) - 1
    db   $21, $22, $23, $24, $25, $26, $27
    db   $99, $4B ; address
    db   $06   ; count(6) - 1
    db   $28, $29, $2A, $2B, $2C, $2D, $2E
    db   $99, $8B ; address
    db   $04   ; count(4) - 1
    db   $2F, $30, $31, $32, $3E
    db   $00 ; end of data

BGCopyRequest06:: ; ERASE WHICH PLAYER?
    db   $98, $00 ; address
    db   $52   ; count(19) - 1 | FLAG_REPEAT
    db   $8F
    db   $98, $01 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $03 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $05 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $07 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $09 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $0B ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $0D ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $0F ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $11 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $13 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $20 ; address
    db   $D1   ; count(18) - 1 | FLAG_REPEAT | FLAG_UNKNOWN
    db   $9F
    db   $98, $40 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $98, $80 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $98, $C0 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $00 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $40 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $80 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $C0 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $9A, $00 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $98, $33 ; address
    db   $D1   ; count(18) - 1 | FLAG_REPEAT | FLAG_UNKNOWN
    db   $8F
    db   $98, $53 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $93 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $D3 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $13 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $53 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $93 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $D3 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $13 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $21 ; address
    db   $50   ; count(17) - 1 | FLAG_REPEAT
    db   $8F
    db   $9A, $22 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $24 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $26 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $28 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $2A ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $2C ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $2E ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $30 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $32 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $42 ; address
    db   $0A   ; count(10) - 1
    db   $04, $11, $00, $12, $04, $7E, $16, $07, $08, $02, $07
    db   $98, $8A ; address
    db   $07   ; count(7) - 1
    db   $0F, $0B, $00, $18, $04, $11, $7E, $3C
    db   $98, $C4 ; address
    db   $00   ; count(0) - 1
    db   $AB
    db   $99, $24 ; address
    db   $00   ; count(0) - 1
    db   $AC
    db   $99, $84 ; address
    db   $00   ; count(0) - 1
    db   $AD
    db   $99, $C2 ; address
    db   $4F   ; count(16) - 1 | FLAG_REPEAT
    db   $A9
    db   $99, $E4 ; address
    db   $0D   ; count(13) - 1
    db   $11, $04, $13, $14, $11, $0D, $7E, $13, $0E, $7E, $0C, $04, $0D, $14
    db   $00 ; end of data

BGCopyRequest0C::
    db   $98, $00 ; address
    db   $52   ; count(19) - 1 | FLAG_REPEAT
    db   $8F
    db   $98, $01 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $03 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $05 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $07 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $09 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $0B ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $0D ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $0F ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $11 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $13 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $20 ; address
    db   $D1   ; count(18) - 1 | FLAG_REPEAT | FLAG_UNKNOWN
    db   $9F
    db   $98, $40 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $98, $80 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $98, $C0 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $00 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $40 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $80 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $99, $C0 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $9A, $00 ; address
    db   $00   ; count(0) - 1
    db   $8F
    db   $98, $33 ; address
    db   $D1   ; count(18) - 1 | FLAG_REPEAT | FLAG_UNKNOWN
    db   $8F
    db   $98, $53 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $93 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $98, $D3 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $13 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $53 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $93 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $D3 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $13 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $21 ; address
    db   $50   ; count(17) - 1 | FLAG_REPEAT
    db   $8F
    db   $9A, $22 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $24 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $26 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $28 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $2A ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $2C ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $2E ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $30 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $9A, $32 ; address
    db   $00   ; count(0) - 1
    db   $9F
    db   $99, $C2 ; address
    db   $4F   ; count(16) - 1 | FLAG_REPEAT
    db   $A9
    db   $98, $42 ; address
    db   $0A   ; count(10) - 1
    db   $02, $0E, $0F, $18, $7E, $0F, $0B, $00, $18, $04, $11
    db   $98, $84 ; address
    db   $0C   ; count(12) - 1
    db   $3F, $05, $11, $0E, $0C, $3F, $7E, $7E, $7E, $3F, $13, $0E, $3F
    db   $98, $C3 ; address
    db   $00   ; count(0) - 1
    db   $AB
    db   $98, $CC ; address
    db   $00   ; count(0) - 1
    db   $AB
    db   $99, $23 ; address
    db   $00   ; count(0) - 1
    db   $AC
    db   $99, $2C ; address
    db   $00   ; count(0) - 1
    db   $AC
    db   $99, $83 ; address
    db   $00   ; count(0) - 1
    db   $AD
    db   $99, $8C ; address
    db   $00   ; count(0) - 1
    db   $AD
    db   $99, $E4 ; address
    db   $0D   ; count(13) - 1
    db   $11, $04, $13, $14, $11, $0D, $7E, $13, $0E, $7E, $0C, $04, $0D, $14
    db   $00 ; end of data

BGCopyRequest02::
    db   $9C, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9C, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9C, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9C, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9C, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9C, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9C, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9C, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9D, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9D, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9D, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9D, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9D, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9D, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9D, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9D, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9E, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9E, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7F
    db   $9C, $00 ; address
    db   $0E   ; count(14) - 1
    db   $BD, $7F, $7F, $7F, $BE, $BB, $7F, $7F, $7F, $BE, $CF, $7F, $7F, $7F, $7F
    db   $9C, $20 ; address
    db   $0E   ; count(14) - 1
    db   $BC, $7F, $7F, $7F, $BF, $BC, $7F, $7F, $7F, $BF, $7F, $7F, $7F, $7F, $7F
    db   $9C, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $CC
    db   $9C, $68 ; address
    db   $CE   ; count(15) - 1 | FLAG_REPEAT | FLAG_UNKNOWN
    db   $8D
    db   $9C, $E9 ; address
    db   $49   ; count(10) - 1 | FLAG_REPEAT
    db   $7F
    db   $9D, $09 ; address
    db   $49   ; count(10) - 1 | FLAG_REPEAT
    db   $7F
    db   $9D, $0A ; address
    db   $C8   ; count(9) - 1 | FLAG_REPEAT | FLAG_UNKNOWN
    db   $7F
    db   $00 ; end of data

BGCopyRequest09::
    db   $9A, $14 ; address
    db   $0B   ; count(11) - 1
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C
    db   $9A, $34 ; address
    db   $0B   ; count(11) - 1
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C
    db   $9A, $54 ; address
    db   $0B   ; count(11) - 1
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C
    db   $9A, $74 ; address
    db   $0B   ; count(11) - 1
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C
    db   $9A, $94 ; address
    db   $0B   ; count(11) - 1
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C
    db   $9A, $B4 ; address
    db   $0B   ; count(11) - 1
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C
    db   $9A, $D4 ; address
    db   $0B   ; count(11) - 1
    db   $2C, $2D, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $2A, $2B
    db   $9A, $F4 ; address
    db   $0B   ; count(11) - 1
    db   $7F, $3D, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $3A, $7F
    db   $9B, $14 ; address
    db   $0B   ; count(11) - 1
    db   $7F, $7F, $2C, $2D, $7C, $7C, $7C, $7C, $2A, $2B, $7F, $7F
    db   $9B, $34 ; address
    db   $0B   ; count(11) - 1
    db   $7F, $7F, $7F, $3D, $3E, $3F, $3E, $3F, $3A, $7F, $7F, $7F
    db   $98, $14 ; address
    db   $0B   ; count(11) - 1
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C
    db   $98, $34 ; address
    db   $0B   ; count(11) - 1
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C
    db   $98, $54 ; address
    db   $0B   ; count(11) - 1
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C
    db   $98, $74 ; address
    db   $0B   ; count(11) - 1
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C
    db   $98, $94 ; address
    db   $0B   ; count(11) - 1
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C
    db   $98, $B4 ; address
    db   $0B   ; count(11) - 1
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C
    db   $98, $D4 ; address
    db   $0B   ; count(11) - 1
    db   $2C, $2D, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $2A, $2B
    db   $98, $F4 ; address
    db   $0B   ; count(11) - 1
    db   $7F, $3D, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $3A, $7F
    db   $99, $14 ; address
    db   $0B   ; count(11) - 1
    db   $7F, $7F, $2C, $2D, $7C, $7C, $7C, $7C, $2A, $2B, $7F, $7F
    db   $99, $34 ; address
    db   $0B   ; count(11) - 1
    db   $7F, $7F, $7F, $3D, $3E, $3F, $3E, $3F, $3A, $7F, $7F, $7F
    db   $00 ; end of data

BGCopyRequest0B::
    db   $9C, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9C, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9C, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9C, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9C, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9C, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9C, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9C, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9D, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9D, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9D, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9D, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9D, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9D, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9D, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9D, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9E, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9E, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9E, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9E, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9E, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9E, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9E, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9E, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9F, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9F, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9F, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9F, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9F, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9F, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9F, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9F, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $9C, $A9 ; address
    db   $41   ; count(2) - 1 | FLAG_REPEAT
    db   $7F
    db   $9C, $C8 ; address
    db   $43   ; count(4) - 1 | FLAG_REPEAT
    db   $7F
    db   $9C, $E7 ; address
    db   $45   ; count(6) - 1 | FLAG_REPEAT
    db   $7F
    db   $9D, $07 ; address
    db   $45   ; count(6) - 1 | FLAG_REPEAT
    db   $7F
    db   $9D, $28 ; address
    db   $43   ; count(4) - 1 | FLAG_REPEAT
    db   $7F
    db   $9D, $49 ; address
    db   $41   ; count(2) - 1 | FLAG_REPEAT
    db   $7F
    db   $00 ; end of data

BGCopyRequest0A::       ; Game Over
    db   $98, $65 ; address
    db   $4B   ; count(12) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $83 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $A3 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $C3 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $E3 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $03 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $23 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $43 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $63 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $83 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $A3 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $C3 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $42 ; address
    db   $0F   ; count(15) - 1
    db   $90, $91, $92, $93, $94, $98, $99, $98, $99, $98, $99, $98, $99, $98, $99, $A4
    db   $98, $62 ; address
    db   $02   ; count(2) - 1
    db   $95, $96, $97
    db   $98, $82 ; address
    db   $8B   ; count(139) - 1 | FLAG_UNKNOWN
    db   $9E   ; unknown
    db   $9C, $9E, $9C, $9E, $9C, $9E, $9C, $9E, $9C, $9E, $A5, $99
    db   $E3, $0E ; address
    db   $9A   ; count(154) - 1 | FLAG_UNKNOWN
    db   $9B   ; unknown
    db   $9A, $9B, $9A, $9B, $9A, $9B, $9A, $9B, $9A, $9B, $9A, $9B, $A6, $98, $71, $8B, $9D, $9F, $9D, $9F
    db   $9D, $9F, $9D, $9F, $9D, $9F, $9D
    db   $9F, $9A ; address
    db   $03   ; count(3) - 1
    db   $0E, $A7, $A8, $A7
    db   $A8, $A7 ; address
    db   $A8   ; count(168) - 1 | FLAG_UNKNOWN
    db   $A7   ; unknown
    db   $A8, $A7, $A8, $A7, $A8, $A7, $A8, $A7, $98, $86, $47, $A2, $98, $A5, $09, $A0, $80, $81, $82, $83
    db   $84, $85, $86, $87, $A1, $98, $C5, $09, $A0, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F, $A1, $98, $E6
    db   $47
    db   $A3, $99 ; address
    db   $05   ; count(5) - 1
    db   $0A, $A9, $AA, $AB, $AC, $AD
    db   $B0, $B1 ; address
    db   $B2   ; count(178) - 1 | FLAG_UNKNOWN
    db   $B3   ; unknown
    db   $B4, $B5, $99, $45, $07, $A9, $AA, $AB, $AC, $AD, $B6, $B7, $B8, $99, $85, $05, $B0, $B1, $B2, $B3
    db   $B4, $B5, $99, $A5, $0A, $C5, $C6, $C7, $C8, $C9, $CA, $A9, $AA, $CB, $CC, $CD, $00
    ; fall to the next data section

BGCopyRequest0D::       ; Save + Quit menu
    db   $98, $A5 ; address
    db   $4B   ; count(12) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $C3 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $E3 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $03 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $23 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $99, $43 ; address
    db   $4D   ; count(14) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $82 ; address
    db   $0F   ; count(15) - 1
    db   $90, $91, $92, $93, $94, $98, $99, $98, $99, $98, $99, $98, $99, $98, $99, $A4
    db   $98, $A2 ; address
    db   $02   ; count(2) - 1
    db   $95, $96, $97
    db   $98, $C2 ; address
    db   $84   ; count(132) - 1 | FLAG_UNKNOWN
    db   $9E   ; unknown
    db   $9C, $9E, $9C, $9E, $98
    db   $B1, $85 ; address
    db   $9D   ; count(157) - 1 | FLAG_UNKNOWN
    db   $9F   ; unknown
    db   $9D, $9F, $9D, $9F, $99, $62, $0F, $A5, $9A, $9B, $9A, $9B, $9A, $9B, $9A, $9B, $9A, $9B, $9A, $9B
    db   $9A, $9B, $A6, $99, $82, $0F, $A8, $A7, $A8, $A7
    db   $A8, $A7 ; address
    db   $A8   ; count(168) - 1 | FLAG_UNKNOWN
    db   $A7   ; unknown
    db   $A8, $A7, $A8, $A7, $A8, $A7, $A8, $A7, $98, $E5, $09, $B9, $BA, $BB, $BC, $BD, $C0, $C1, $C2, $C3
    db   $C4, $99, $25, $07, $A9, $AA, $AB, $AC, $AD, $B6, $B7, $B8, $00
    ; fall to the next data section

BGCopyRequest0E::
    db   $98, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $80 ; address
    db   $1F   ; count(31) - 1
    db   $80, $81, $82, $83, $80, $81, $82, $83, $80, $81, $82, $83, $80, $81, $82, $83, $80, $81, $82, $83
    db   $80, $81, $82, $83, $80, $81, $82, $83, $80, $81, $82, $83
    db   $98, $A0 ; address
    db   $1F   ; count(31) - 1
    db   $84, $85, $86, $87, $84, $85, $86, $87, $84, $85, $86, $87, $84, $85, $86, $87, $84, $85, $86, $87
    db   $84, $85, $86, $87, $84, $85, $86, $87, $84, $85, $86, $87
    db   $98, $C0 ; address
    db   $1F   ; count(31) - 1
    db   $88, $89, $8A, $8B, $88, $89, $8A, $8B, $88, $89, $8A, $8B, $88, $89, $8A, $8B, $88, $89, $8A, $8B
    db   $88, $89, $8A, $8B, $88, $89, $8A, $8B, $88, $89, $8A, $8B
    db   $98, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7C
    db   $99, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7C
    db   $99, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7C
    db   $99, $40 ; address
    db   $1F   ; count(31) - 1
    db   $90, $91, $92, $93, $90, $91, $92, $93, $90, $91, $92, $93, $90, $91, $92, $93, $90, $91, $92, $93
    db   $90, $91, $92, $93, $90, $91, $92, $93, $90, $91, $92, $93
    db   $99, $60 ; address
    db   $1F   ; count(31) - 1
    db   $94, $95, $96, $97, $94, $95, $96, $97, $94, $95, $96, $97, $94, $95, $96, $97, $94, $95, $96, $97
    db   $94, $95, $96, $97, $94, $95, $96, $97, $94, $95, $96, $97
    db   $99, $80 ; address
    db   $1F   ; count(31) - 1
    db   $8C, $8D, $8E, $8F, $8C, $8D, $8E, $8F, $8C, $8D, $8E, $8F, $8C, $8D, $8E, $8F, $8C, $8D, $8E, $8F
    db   $8C, $8D, $8E, $8F, $8C, $8D, $8E, $8F, $8C, $8D, $8E, $8F
    db   $99, $A0 ; address
    db   $1F   ; count(31) - 1
    db   $98, $99, $9A, $9B, $98, $99, $9A, $9B, $98, $99, $9A, $9B, $98, $99, $9A, $9B, $98, $99, $9A, $9B
    db   $98, $99, $9A, $9B, $98, $99, $9A, $9B, $98, $99, $9A, $9B
    db   $99, $C0 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $9C, $9D, $7F, $7F, $9C, $9D, $7F, $7F, $9C, $9D, $7F, $7F, $9C, $9D, $7F, $7F, $9C, $9D
    db   $7F, $7F, $9C, $9D, $7F, $7F, $9C, $9D, $7F, $7F, $9C, $9D
    db   $99, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $9A, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $9A, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $9A, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $9A, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $00 ; end of data

BGCopyRequest25::
    db   $98, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $80 ; address
    db   $1F   ; count(31) - 1
    db   $80, $81, $82, $83, $80, $81, $82, $83, $80, $81, $82, $83, $80, $81, $82, $83, $80, $81, $82, $83
    db   $80, $81, $82, $83, $80, $81, $82, $83, $80, $81, $82, $83
    db   $98, $A0 ; address
    db   $1F   ; count(31) - 1
    db   $84, $85, $86, $87, $84, $85, $86, $87, $84, $85, $86, $87, $84, $85, $86, $87, $84, $85, $86, $87
    db   $84, $85, $86, $87, $84, $85, $86, $87, $84, $85, $86, $87
    db   $98, $C0 ; address
    db   $1F   ; count(31) - 1
    db   $88, $89, $8A, $8B, $88, $89, $8A, $8B, $88, $89, $8A, $8B, $88, $89, $8A, $8B, $88, $89, $8A, $8B
    db   $88, $89, $8A, $8B, $88, $89, $8A, $8B, $88, $89, $8A, $8B
    db   $98, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7D
    db   $99, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7D
    db   $99, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7D
    db   $99, $40 ; address
    db   $1F   ; count(31) - 1
    db   $90, $91, $92, $93, $90, $91, $92, $93, $90, $91, $92, $93, $90, $91, $92, $93, $90, $91, $92, $93
    db   $90, $91, $92, $93, $90, $91, $92, $93, $90, $91, $92, $93
    db   $99, $60 ; address
    db   $1F   ; count(31) - 1
    db   $94, $95, $96, $97, $94, $95, $96, $97, $94, $95, $96, $97, $94, $95, $96, $97, $94, $95, $96, $97
    db   $94, $95, $96, $97, $94, $95, $96, $97, $94, $95, $96, $97
    db   $99, $80 ; address
    db   $1F   ; count(31) - 1
    db   $8C, $8D, $8E, $8F, $8C, $8D, $8E, $8F, $8C, $8D, $8E, $8F, $8C, $8D, $8E, $8F, $8C, $8D, $8E, $8F
    db   $8C, $8D, $8E, $8F, $8C, $8D, $8E, $8F, $8C, $8D, $8E, $8F
    db   $99, $A0 ; address
    db   $1F   ; count(31) - 1
    db   $98, $99, $9A, $9B, $98, $99, $9A, $9B, $98, $99, $9A, $9B, $98, $99, $9A, $9B, $98, $99, $9A, $9B
    db   $98, $99, $9A, $9B, $98, $99, $9A, $9B, $98, $99, $9A, $9B
    db   $99, $C0 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $9C, $9D, $7F, $7F, $9C, $9D, $7F, $7F, $9C, $9D, $7F, $7F, $9C, $9D, $7F, $7F, $9C, $9D
    db   $7F, $7F, $9C, $9D, $7F, $7F, $9C, $9D, $7F, $7F, $9C, $9D
    db   $99, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $9A, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $9A, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $9A, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $9A, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $00 ; end of data

BGCopyRequest0F::   ; Link bracing himself in the intro
    db   $98, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $98, $40 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $A0, $A1, $A2, $A3, $A4, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $98, $60 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $27, $28, $29, $2A, $B3, $B4, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $98, $80 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $A5, $A6, $A7, $A8, $A9, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $98, $A0 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $9E, $7F, $7F, $7F, $7F, $B0, $B1, $B2, $AA, $AB, $7F, $AC, $7F, $7F, $7F, $7F, $7F, $7F
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $98, $C0 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $9F, $AD, $7F, $7F, $B7, $A1, $A2, $B9, $BA, $BB, $BC, $BD, $BE, $BF, $C0, $C1, $7F, $7F
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $98, $E0 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $AE, $AF, $B5, $C2, $C3, $B1, $B2, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $7F, $7F
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $99, $00 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $CE, $CF, $B8, $D0, $D1, $A2, $A3, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $7F, $7F, $7F
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $99, $20 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $7F, $DC, $DD, $DE, $C4, $26, $B3, $DF, $E0, $E1, $E2, $E3, $E4, $E5, $7F, $7F, $7F, $7F
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $99, $40 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $7F, $7F, $E8, $E9, $EA, $EB, $DA, $7F, $EC, $ED, $EE, $EF, $F0, $F1, $F2, $F3, $7F, $7F
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $99, $60 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $7F, $7F, $B0, $B1, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF, $7F, $7F
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $99, $80 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $7F, $A0, $A1, $A2, $A3, $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0A, $7F, $7F
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $99, $A0 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $7F, $B0, $B1, $B2, $B3, $0B, $0C, $0D, $0E, $0F, $10, $11, $12, $13, $7F, $7F, $7F, $7F
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $99, $C0 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $A0, $A1, $A2, $A3, $A4, $7F, $7F, $7F, $14, $15, $16, $17, $18, $19, $7F, $7F, $7F, $7F
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $99, $E0 ; address
    db   $1F   ; count(31) - 1
    db   $7F, $7F, $B0, $B1, $B2, $B3, $B4, $7F, $7F, $DB, $E6, $E7, $1A, $1B, $1C, $1D, $7F, $7F, $7F, $7F
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $9A, $00 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $9A, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $9A, $40 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $9A, $60 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $9B, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $9B, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7F
    db   $00 ; end of data

BGCopyRequest10::
    db   $98, $00 ; address
    db   $1F   ; count(31) - 1
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C
    db   $44, $45, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D
    db   $98, $20 ; address
    db   $1F   ; count(31) - 1
    db   $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $40, $41, $42, $43
    db   $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D
    db   $98, $40 ; address
    db   $1F   ; count(31) - 1
    db   $7C, $7C, $7C, $7C, $40, $41, $42, $43, $47, $48, $49, $4A, $40, $41, $42, $43, $7D, $7D, $7D, $7D
    db   $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D
    db   $98, $60 ; address
    db   $1F   ; count(31) - 1
    db   $40, $41, $42, $43, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D
    db   $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D
    db   $98, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7D
    db   $98, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7D
    db   $98, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7D
    db   $98, $E0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7D
    db   $99, $00 ; address
    db   $1F   ; count(31) - 1
    db   $38, $39, $3A, $3B, $38, $39, $3A, $3B, $38, $39, $3A, $3B, $38, $39, $3A, $3B, $38, $39, $3A, $3B
    db   $38, $39, $3A, $3B, $38, $39, $3A, $3B, $38, $39, $3A, $3B
    db   $99, $20 ; address
    db   $1F   ; count(31) - 1
    db   $3C, $3D, $3E, $3F, $3C, $3D, $3E, $3F, $3C, $3D, $3E, $3F, $3C, $3D, $3E, $3F, $3C, $3D, $3E, $3F
    db   $3C, $3D, $3E, $3F, $3C, $3D, $3E, $3F, $3C, $3D, $3E, $3F
    db   $99, $40 ; address
    db   $1F   ; count(31) - 1
    db   $60, $61, $62, $63, $60, $61, $62, $63, $60, $61, $62, $63, $60, $61, $62, $63, $60, $61, $62, $63
    db   $60, $61, $62, $63, $60, $61, $62, $63, $60, $61, $62, $63
    db   $99, $60 ; address
    db   $1F   ; count(31) - 1
    db   $4E, $4F, $4E, $4F, $4E, $4F, $4E, $4F, $4E, $4F, $4E, $4F, $4E, $4F, $4E, $4F, $4E, $4F, $4E, $4F
    db   $4E, $4F, $4E, $4F, $4E, $4F, $4E, $4F, $4E, $4F, $4E, $4F
    db   $99, $80 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $99, $A0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7E
    db   $99, $C0 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $64
    db   $99, $E0 ; address
    db   $1F   ; count(31) - 1
    db   $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33
    db   $30, $31, $32, $33, $30, $31, $32, $33, $30, $31, $32, $33
    db   $9A, $00 ; address
    db   $1F   ; count(31) - 1
    db   $34, $35, $36, $37, $34, $35, $36, $37, $34, $35, $36, $37, $34, $35, $36, $37, $34, $35, $36, $37
    db   $34, $35, $36, $37, $34, $35, $36, $37, $34, $35, $36, $37
    db   $9A, $20 ; address
    db   $5F   ; count(32) - 1 | FLAG_REPEAT
    db   $7C
    db   $00 ; end of data

BGCopyRequest11::
    db   $98, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $98, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7E
    db   $98, $40 ; address
    db   $13   ; count(19) - 1
    db   $7E, $7E, $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F, $7E, $7E
    db   $98, $60 ; address
    db   $13   ; count(19) - 1
    db   $7E, $7E, $90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9A, $9B, $9C, $9D, $9E, $9F, $7E, $7E
    db   $98, $80 ; address
    db   $13   ; count(19) - 1
    db   $7E, $7E, $A0, $A1, $A2, $A3, $A4, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF, $7E, $7E
    db   $98, $A0 ; address
    db   $13   ; count(19) - 1
    db   $7E, $7E, $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF, $7E, $7E
    db   $98, $C0 ; address
    db   $13   ; count(19) - 1
    db   $7E, $7E, $C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, $7E, $7E
    db   $98, $E0 ; address
    db   $13   ; count(19) - 1
    db   $7E, $7E, $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF, $7E, $7E
    db   $99, $00 ; address
    db   $13   ; count(19) - 1
    db   $7E, $7E, $E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA, $EB, $EC, $ED, $EE, $EF, $7E, $7E
    db   $99, $20 ; address
    db   $13   ; count(19) - 1
    db   $7E, $7E, $75, $7E, $78, $77, $75, $78, $79, $2B, $2C, $79, $79, $77, $75, $78, $77, $75, $7E, $7E
    db   $99, $40 ; address
    db   $13   ; count(19) - 1
    db   $77, $78, $7C, $79, $7C, $7C, $7C, $7C, $50, $51, $52, $53, $7C, $7C, $7C, $7C, $7C, $7C, $77, $78
    db   $99, $60 ; address
    db   $13   ; count(19) - 1
    db   $7C, $7C, $7C, $73, $74, $76, $73, $7A, $54, $55, $56, $57, $7A, $74, $76, $73, $74, $7C, $7C, $7C
    db   $99, $80 ; address
    db   $13   ; count(19) - 1
    db   $7C, $7C, $73, $75, $78, $77, $78, $79, $58, $59, $5A, $5B, $79, $79, $77, $75, $7E, $74, $7C, $7C
    db   $99, $A0 ; address
    db   $13   ; count(19) - 1
    db   $7C, $7C, $77, $7A, $7A, $74, $73, $74, $5C, $5D, $5E, $5F, $73, $74, $73, $7A, $7E, $78, $7C, $7C
    db   $99, $C0 ; address
    db   $13   ; count(19) - 1
    db   $7C, $7C, $7C, $77, $75, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $7E, $75, $78, $7C, $7C, $7C
    db   $99, $E0 ; address
    db   $13   ; count(19) - 1
    db   $7C, $7C, $7C, $65, $66, $67, $68, $69, $6A, $6B, $6C, $6D, $6E, $6F, $70, $71, $72, $7C, $7C, $7C
    db   $9A, $00 ; address
    db   $13   ; count(19) - 1
    db   $7C, $7C, $7C, $7C, $44, $45, $7D, $2D, $2E, $2D, $2E, $2D, $2E, $7D, $4C, $4D, $7C, $7C, $7C, $7C
    db   $9A, $20 ; address
    db   $13   ; count(19) - 1
    db   $7C, $7C, $44, $45, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $7D, $4C, $4D, $7C, $7C
    db   $00 ; end of data

BGCopyRequest15::       ; Face Shrine mural
    db   $98, $00 ; address
    db   $13   ; count(19) - 1
    db   $00, $01, $02, $03, $00, $01, $02, $03, $00, $01, $02, $03, $00, $01, $02, $03, $00, $01, $02, $03
    db   $98, $20 ; address
    db   $13   ; count(19) - 1
    db   $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13
    db   $98, $40 ; address
    db   $13   ; count(19) - 1
    db   $02, $03, $04, $05, $06, $07, $06, $07, $07, $06, $06, $07, $06, $07, $07, $07, $06, $08, $00, $01
    db   $98, $60 ; address
    db   $13   ; count(19) - 1
    db   $12, $13, $09, $0A, $0B, $14, $0C, $0D, $0E, $0F, $0B, $15, $14, $15, $0B, $14, $16, $17, $10, $11
    db   $98, $80 ; address
    db   $13   ; count(19) - 1
    db   $00, $03, $18, $19, $1A, $1B, $1C, $1D, $1E, $1F, $20, $21, $22, $1E, $20, $22, $24, $25, $00, $03
    db   $98, $A0 ; address
    db   $13   ; count(19) - 1
    db   $10, $13, $26, $27, $28, $29, $2A, $2B, $2C, $22, $21, $37, $21, $22, $1F, $20, $42, $2D, $10, $13
    db   $98, $C0 ; address
    db   $13   ; count(19) - 1
    db   $02, $03, $18, $2E, $2F, $30, $42, $1D, $40, $21, $1F, $22, $20, $1F, $37, $21, $40, $31, $00, $01
    db   $98, $E0 ; address
    db   $13   ; count(19) - 1
    db   $12, $13, $32, $33, $34, $42, $35, $36, $1D, $22, $20, $1F, $39, $37, $38, $39, $42, $2D, $10, $11
    db   $99, $00 ; address
    db   $13   ; count(19) - 1
    db   $00, $03, $3A, $3B, $2B, $2C, $3C, $1D, $3D, $3E, $3F, $42, $40, $40, $40, $40, $3C, $31, $00, $03
    db   $99, $20 ; address
    db   $13   ; count(19) - 1
    db   $10, $13, $18, $41, $42, $3C, $1D, $42, $43, $44, $45, $40, $42, $40, $42, $1D, $46, $31, $10, $13
    db   $99, $40 ; address
    db   $13   ; count(19) - 1
    db   $02, $03, $18, $47, $48, $49, $4A, $4B, $48, $49, $4A, $4C, $4D, $4E, $3C, $4F, $50, $2D, $00, $01
    db   $99, $60 ; address
    db   $13   ; count(19) - 1
    db   $12, $13, $51, $52, $53, $54, $55, $56, $57, $58, $56, $58, $59, $5A, $5B, $5C, $5D, $2D, $10, $11
    db   $99, $80 ; address
    db   $13   ; count(19) - 1
    db   $02, $03, $5E, $5F, $60, $61, $62, $63, $64, $65, $63, $64, $66, $67, $68, $69, $6A, $31, $00, $03
    db   $99, $A0 ; address
    db   $13   ; count(19) - 1
    db   $10, $13, $18, $6B, $6C, $6D, $70, $6E, $6F, $70, $6E, $6F, $71, $72, $42, $73, $50, $2D, $10, $13
    db   $99, $C0 ; address
    db   $13   ; count(19) - 1
    db   $02, $03, $26, $41, $42, $1D, $3C, $1D, $74, $75, $76, $1D, $40, $1D, $35, $36, $77, $78, $00, $01
    db   $99, $E0 ; address
    db   $13   ; count(19) - 1
    db   $12, $13, $79, $10, $7B, $7A, $7B, $7A, $7C, $7D, $23, $7A, $7B, $7B, $7A, $7A, $7F, $13, $10, $11
    db   $9A, $00 ; address
    db   $13   ; count(19) - 1
    db   $00, $01, $02, $03, $00, $01, $02, $03, $00, $01, $02, $03, $00, $01, $02, $03, $00, $01, $02, $03
    db   $9A, $20 ; address
    db   $13   ; count(19) - 1
    db   $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13, $10, $11, $12, $13
    db   $00 ; end of data

BGCopyRequest12::
    db   $98, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $98, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $98, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $98, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $98, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $98, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $98, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $98, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $99, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $99, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $99, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $99, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $99, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $99, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $99, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $99, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $9A, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $9A, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $98, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $98, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $05
    db   $98, $40 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $7B, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7E, $05, $05, $05, $05, $05
    db   $98, $60 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $7F, $00, $01, $02, $03, $04, $05, $06, $07, $7F, $05, $05, $05, $05, $05
    db   $98, $80 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $7F, $10, $11, $12, $13, $14, $15, $16, $17, $7F, $05, $05, $05, $05, $05
    db   $98, $A0 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $7F, $20, $21, $22, $23, $24, $25, $26, $27, $7F, $05, $05, $05, $05, $05
    db   $98, $C0 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $7F, $30, $31, $32, $33, $34, $35, $36, $37, $7F, $05, $05, $05, $05, $05
    db   $98, $E0 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $7F, $40, $41, $42, $43, $44, $45, $46, $47, $7F, $05, $05, $05, $05, $05
    db   $99, $00 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $7F, $50, $51, $52, $53, $54, $55, $56, $57, $7F, $05, $05, $05, $05, $05
    db   $99, $20 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $7F, $60, $61, $62, $63, $64, $65, $66, $67, $7F, $05, $05, $05, $05, $05
    db   $99, $40 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $7F, $70, $71, $72, $73, $74, $75, $76, $77, $7F, $05, $05, $05, $05, $05
    db   $99, $60 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $7F, $08, $09, $0A, $0B, $0C, $0D, $0E, $0F, $7F, $68, $05, $05, $05, $05
    db   $99, $80 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $7F, $18, $19, $1A, $1B, $1C, $1D, $1E, $1F, $7F, $78, $79, $05, $05, $05
    db   $99, $A0 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $7D, $3E, $4D, $4E, $58, $69, $6A, $6B, $6C, $6D, $6E, $6F, $05, $05, $05
    db   $99, $C0 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $28, $29, $2A, $2B, $2C, $2D, $2E, $2F, $05, $05
    db   $99, $E0 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $38, $39, $3A, $3B, $3C, $3D, $3D, $3F, $05, $05
    db   $9A, $00 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $48, $49, $4A, $4B, $4C, $3D, $3D, $4F, $05, $05
    db   $9A, $20 ; address
    db   $13   ; count(19) - 1
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $59, $5A, $5B, $5C, $5D, $5E, $5F, $05, $05
    db   $00 ; end of data

BGCopyRequest13::       ; Marin at the beach cutscene
    db   $98, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $98, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $98, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $98, $60 ; address
    db   $13   ; count(19) - 1
    db   $06, $07, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $08, $09
    db   $98, $80 ; address
    db   $13   ; count(19) - 1
    db   $7F, $16, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $17, $7F
    db   $98, $A0 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $06, $07, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $08, $09, $06, $07, $08, $09, $7F, $7F
    db   $98, $C0 ; address
    db   $13   ; count(19) - 1
    db   $0D, $0E, $0F, $20, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $7C, $17, $7F, $7F, $16, $0A, $0B, $0C, $0D
    db   $98, $E0 ; address
    db   $13   ; count(19) - 1
    db   $1D, $1E, $1F, $30, $06, $07, $7C, $7C, $7C, $7C, $08, $09, $7F, $7F, $7F, $7F, $1A, $1B, $1C, $1D
    db   $99, $00 ; address
    db   $13   ; count(19) - 1
    db   $24, $25, $26, $27, $7F, $16, $7C, $7C, $7C, $7C, $17, $7F, $7F, $7F, $7F, $7F, $21, $22, $23, $24
    db   $99, $20 ; address
    db   $13   ; count(19) - 1
    db   $34, $35, $36, $37, $50, $51, $50, $51, $50, $51, $50, $51, $50, $51, $50, $51, $31, $32, $33, $34
    db   $99, $40 ; address
    db   $13   ; count(19) - 1
    db   $2B, $2C, $2D, $2E, $52, $53, $52, $53, $52, $53, $52, $53, $52, $53, $52, $53, $28, $29, $2A, $2B
    db   $99, $60 ; address
    db   $13   ; count(19) - 1
    db   $3B, $3C, $54, $55, $54, $55, $54, $55, $54, $55, $54, $55, $54, $55, $54, $55, $54, $55, $3A, $3B
    db   $99, $80 ; address
    db   $13   ; count(19) - 1
    db   $3E, $3F, $56, $57, $56, $57, $56, $57, $56, $57, $56, $57, $56, $57, $56, $57, $56, $57, $3D, $3E
    db   $99, $A0 ; address
    db   $13   ; count(19) - 1
    db   $3E, $3F, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $3D, $3E
    db   $99, $C0 ; address
    db   $13   ; count(19) - 1
    db   $3E, $3F, $10, $11, $10, $11, $10, $11, $10, $11, $10, $11, $10, $11, $04, $05, $10, $11, $3D, $3E
    db   $99, $E0 ; address
    db   $13   ; count(19) - 1
    db   $43, $44, $45, $46, $04, $05, $02, $18, $19, $38, $39, $4E, $4F, $03, $14, $15, $40, $41, $42, $43
    db   $9A, $00 ; address
    db   $13   ; count(19) - 1
    db   $4A, $4B, $4C, $4D, $14, $15, $12, $13, $12, $13, $12, $13, $12, $13, $12, $13, $47, $48, $49, $4A
    db   $9A, $20 ; address
    db   $13   ; count(19) - 1
    db   $12, $13, $12, $13, $12, $13, $12, $13, $12, $13, $12, $13, $12, $13, $12, $13, $12, $13, $12, $13
    db   $9A, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $9A, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $9A, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $9A, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $9A, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $9A, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $9B, $00 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $9B, $20 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $9B, $40 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $9B, $60 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $9B, $80 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $9B, $A0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $9B, $C0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $9B, $E0 ; address
    db   $53   ; count(20) - 1 | FLAG_REPEAT
    db   $7C
    db   $00 ; end of data

BGCopyRequest23::
    db   $98, $00 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $04, $05, $06, $07, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $98, $20 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $30, $7F, $7F, $40, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $7F
    db   $98, $40 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $00, $01, $02, $03, $03, $01, $01, $02, $08, $09, $7F, $7F, $7F, $7F, $7F
    db   $98, $60 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $7F, $7F, $7F, $7F, $7F
    db   $98, $80 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $7F, $7F, $7F, $7F, $7F
    db   $98, $A0 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $10, $31, $32, $33, $34, $35, $36, $37, $38, $39, $7F, $7F, $7F, $7F, $7F
    db   $98, $C0 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $20, $41, $42, $43, $44, $45, $46, $47, $48, $49, $7F, $7F, $7F, $7F, $7F
    db   $98, $E0 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $7F, $7F, $7F, $7F, $7F
    db   $99, $00 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $60, $61, $62, $63, $45, $65, $66, $67, $68, $69, $7F, $7F, $7F, $7F, $7F
    db   $99, $20 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $70, $71, $72, $73, $75, $75, $76, $77, $78, $79, $7F, $7F, $7F, $7F, $7F
    db   $99, $40 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $0A, $0B, $0C, $0D, $0E, $0F, $77, $4B, $4C, $4D, $7F, $7F, $7F, $7F, $7F
    db   $99, $60 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $1A, $1B, $1C, $1D, $1E, $1F, $5A, $5B, $5C, $5D, $7F, $7F, $7F, $7F, $7F
    db   $99, $80 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $2A, $2B, $2C, $2D, $2E, $2F, $6A, $6B, $1B, $6D, $7F, $7F, $7F, $7F, $7F
    db   $99, $A0 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $3A, $3B, $3C, $3D, $3E, $3F, $7A, $7B, $7C, $7D, $7F, $7F, $7F, $7F, $7F
    db   $99, $C0 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $6E, $4A, $64, $64, $6C, $64, $4A, $4A, $6C, $4A, $64, $6F, $7F, $7F, $7F, $7F
    db   $99, $E0 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $7F, $04, $05, $7F, $4E, $4F, $7F, $06, $07, $7F, $7F, $7F, $7F, $7F, $7F
    db   $9A, $00 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $7F, $30, $7F, $7F, $4E, $4F, $7F, $7F, $40, $7F, $7F, $7F, $7F, $7F, $7F
    db   $9A, $20 ; address
    db   $13   ; count(19) - 1
    db   $7F, $7F, $7F, $7F, $7F, $7F, $40, $7F, $7F, $5E, $5F, $7F, $7F, $30, $7F, $7F, $7F, $7F, $7F, $7F
    db   $00 ; end of data
