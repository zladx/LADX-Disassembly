end_def: macro
    db $00
endm

rest: macro
    db $01
endm

; Sets [wActiveMusicTableIndex] to 1.
unknownop_94: macro
    db $94
endm

; Sets [$D3CD] to 0.
disable_unknown1: macro
    db $95
endm

; Sets [$D3CD] to 1.
enable_unknown1: macro
    db $96
endm

; Sets [$D3B6 + channelIndex] to 1.
enable_unknown2: macro
    db $97
endm

; Sets [$D3B6 + channelIndex] to 0.
disable_unknown2: macro
    db $98
endm

; This seems to enable some kind of mode that controls the volume, similar to
; the hardware envelope? (This name is just a guess and may need to be changed.)
; Sets [$D39E] to 1.
enable_software_envelope: macro
    db $99
endm

; Ses [$D39E] to 0.
disable_software_envelope: macro
    db $9a
endm

; Sets a loop point to jump back to with the NEXT_LOOP macro.
;
; Arg1: Number of times to loop. (NEXT_LOOP macro will jump back that many
; times.) If bit 7 is set, this causes some special-case code in the Noise
; channel when note NOISE_FF is played?
begin_loop: macro
    db $9b, \1
endm

; Loops back to begin_loop, or continues on if it's looped enough times already.
next_loop: macro
    db $9c
endm

; Set waveform data for channel 3 ONLY.
set_waveform: macro
    db $9d
    dw \1
    db \2
endm

; Set envelope (volume control) duty (wave pattern) for channels 1/2 (maybe 4) ONLY.
;
; Arg 1: Volume / Envelope control; written to NRx2. (Bits 4-7 control volume,
;        0-3 control the envelope.)
; Arg 2: A separate, software-based volume control? Might be related to the
;        "enable_software_envelope" command (or else that needs to be renamed).
; Arg 3: Duty (0-3); bits 6-7 of NRx1
; Arg 4: Note length; bits 0-5 or NRx1
;
; The opcode's 3 bytes are written to D3x6, D3x7, D3x8 (x = channel number).
set_envelope_duty: macro
    ; Assertions:
    ;   - \3 < 4
    ;   - \4 < 0x40
    db $9d, \1, \2, ((\3<<6) | \4)
endm

; Takes a pointer to some data which determines the music speed.
set_speed: macro
    db $9e
    dw \1
endm

; Set the transpose value to transpose all subsequent notes.
set_transpose: macro
    db $9f, \1 * 2
endm

; Sets the length of subsequent notes.
notelen: macro
    ; If someone figures out how to "assert \1 <= $f" please add it here!
    db $a0 + \1
endm

; Play a note. Can pass multiple notes to this.
note: macro
    REPT _NARG
        ; Desired assertion: \1 >= $02 && \1 <= $90 && (\1 % 2) == 0
        db \1
        SHIFT
    ENDR
endm


; Noise (channel 4) doesn't really correspond to notes like the other channels.
NOISE_1     EQU $01
NOISE_2     EQU $06
NOISE_3     EQU $0b
NOISE_4     EQU $10
NOISE_5     EQU $15
NOISE_6     EQU $1a
NOISE_7     EQU $1f
NOISE_8     EQU $24
NOISE_9     EQU $29
NOISE_10    EQU $2e
NOISE_11    EQU $33
NOISE_12    EQU $38
NOISE_13    EQU $3d
NOISE_14    EQU $42
NOISE_15    EQU $47
NOISE_16    EQU $4c
NOISE_17    EQU $51
NOISE_FF    EQU $ff ; Some special-case behaviour?

; Notes for channels 1-3
C_1     EQU $02
C#1     EQU $04
D_1     EQU $06
D#1     EQU $08
E_1     EQU $0a
F_1     EQU $0c
F#1     EQU $0e
G_1     EQU $10
G#1     EQU $12
A_1     EQU $14
A#1     EQU $16
B_1     EQU $18
C_2     EQU $1a
C#2     EQU $1c
D_2     EQU $1e
D#2     EQU $20
E_2     EQU $22
F_2     EQU $24
F#2     EQU $26
G_2     EQU $28
G#2     EQU $2a
A_2     EQU $2c
A#2     EQU $2e
B_2     EQU $30
C_3     EQU $32
C#3     EQU $34
D_3     EQU $36
D#3     EQU $38
E_3     EQU $3a
F_3     EQU $3c
F#3     EQU $3e
G_3     EQU $40
G#3     EQU $42
A_3     EQU $44
A#3     EQU $46
B_3     EQU $48
C_4     EQU $4a
C#4     EQU $4c
D_4     EQU $4e
D#4     EQU $50
E_4     EQU $52
F_4     EQU $54
F#4     EQU $56
G_4     EQU $58
G#4     EQU $5a
A_4     EQU $5c
A#4     EQU $5e
B_4     EQU $60
C_5     EQU $62
C#5     EQU $64
D_5     EQU $66
D#5     EQU $68
E_5     EQU $6a
F_5     EQU $6c
F#5     EQU $6e
G_5     EQU $70
G#5     EQU $72
A_5     EQU $74
A#5     EQU $76
B_5     EQU $78
C_6     EQU $7a
C#6     EQU $7c
D_6     EQU $7e
D#6     EQU $80
E_6     EQU $82
F_6     EQU $84
F#6     EQU $86
G_6     EQU $88
G#6     EQU $8a
A_6     EQU $8c
A#6     EQU $8e
B_6     EQU $90
