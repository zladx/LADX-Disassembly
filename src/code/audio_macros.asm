macro end_def
    db $00
endm

macro rest
    db $01
endm

; Sets [wActiveMusicTableIndex] to 1.
macro unknownop_94
    db $94
endm

; Sets [wD3CD] to 0.
macro disable_unknown1
    db $95
endm

; Sets [wD3CD] to 1.
macro enable_unknown1
    db $96
endm

; Sets [wD3B6 + channelIndex] to 1.
macro enable_unknown2
    db $97
endm

; Sets [wD3B6 + channelIndex] to 0.
macro disable_unknown2
    db $98
endm

; This seems to enable some kind of mode that controls the volume, similar to
; the hardware envelope? (This name is just a guess and may need to be changed.)
; Sets [wD39E] to 1.
macro enable_software_envelope
    db $99
endm

; Ses [wD39E] to 0.
macro disable_software_envelope
    db $9a
endm

; Sets a loop point to jump back to with the NEXT_LOOP macro.
;
; Arg1: Number of times to loop. (NEXT_LOOP macro will jump back that many
; times.) If bit 7 is set, this causes some special-case code in the Noise
; channel when note NOISE_FF is played?
macro begin_loop
    db $9b, \1
endm

; Loops back to begin_loop, or continues on if it's looped enough times already.
macro next_loop
    db $9c
endm

; Set waveform data for channel 3 ONLY.
macro set_waveform
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
macro set_envelope_duty
    ASSERT \3 < 4, "set_envelope_duty: Invalid duty cycle value \3"
    ASSERT \4 < $40, "set_envelope_duty: Note length must be less than 0x40, got \4"
    db $9d, \1, \2, ((\3<<6) | \4)
endm

; Takes a pointer to some data which determines the music speed.
macro set_speed
    db $9e
    dw \1
endm

; Set the transpose value to transpose all subsequent notes.
macro set_transpose
    db $9f, \1 * 2
endm

; Sets the length of subsequent notes.
macro notelen
    ASSERT \1 <= $f, "notelen: Length must be less than or equal to $f, got \1"
    db $a0 + \1
endm

; Play a note. Can pass multiple notes to this.
macro note
    REPT _NARG
        ASSERT (\1 >= $1 && \1 <= $90) || \1 == $ff, "note: Invalid note value \1"
        db \1
        SHIFT
    ENDR
endm


; Noise (channel 4) doesn't really correspond to notes like the other channels.
DEF NOISE_1     EQU $01
DEF NOISE_2     EQU $06
DEF NOISE_3     EQU $0b
DEF NOISE_4     EQU $10
DEF NOISE_5     EQU $15
DEF NOISE_6     EQU $1a
DEF NOISE_7     EQU $1f
DEF NOISE_8     EQU $24
DEF NOISE_9     EQU $29
DEF NOISE_10    EQU $2e
DEF NOISE_11    EQU $33
DEF NOISE_12    EQU $38
DEF NOISE_13    EQU $3d
DEF NOISE_14    EQU $42
DEF NOISE_15    EQU $47
DEF NOISE_16    EQU $4c
DEF NOISE_17    EQU $51
DEF NOISE_FF    EQU $ff ; Some special-case behaviour?

; Notes for channels 1-3
DEF C_1     EQU $02
DEF C#1     EQU $04
DEF D_1     EQU $06
DEF D#1     EQU $08
DEF E_1     EQU $0a
DEF F_1     EQU $0c
DEF F#1     EQU $0e
DEF G_1     EQU $10
DEF G#1     EQU $12
DEF A_1     EQU $14
DEF A#1     EQU $16
DEF B_1     EQU $18
DEF C_2     EQU $1a
DEF C#2     EQU $1c
DEF D_2     EQU $1e
DEF D#2     EQU $20
DEF E_2     EQU $22
DEF F_2     EQU $24
DEF F#2     EQU $26
DEF G_2     EQU $28
DEF G#2     EQU $2a
DEF A_2     EQU $2c
DEF A#2     EQU $2e
DEF B_2     EQU $30
DEF C_3     EQU $32
DEF C#3     EQU $34
DEF D_3     EQU $36
DEF D#3     EQU $38
DEF E_3     EQU $3a
DEF F_3     EQU $3c
DEF F#3     EQU $3e
DEF G_3     EQU $40
DEF G#3     EQU $42
DEF A_3     EQU $44
DEF A#3     EQU $46
DEF B_3     EQU $48
DEF C_4     EQU $4a
DEF C#4     EQU $4c
DEF D_4     EQU $4e
DEF D#4     EQU $50
DEF E_4     EQU $52
DEF F_4     EQU $54
DEF F#4     EQU $56
DEF G_4     EQU $58
DEF G#4     EQU $5a
DEF A_4     EQU $5c
DEF A#4     EQU $5e
DEF B_4     EQU $60
DEF C_5     EQU $62
DEF C#5     EQU $64
DEF D_5     EQU $66
DEF D#5     EQU $68
DEF E_5     EQU $6a
DEF F_5     EQU $6c
DEF F#5     EQU $6e
DEF G_5     EQU $70
DEF G#5     EQU $72
DEF A_5     EQU $74
DEF A#5     EQU $76
DEF B_5     EQU $78
DEF C_6     EQU $7a
DEF C#6     EQU $7c
DEF D_6     EQU $7e
DEF D#6     EQU $80
DEF E_6     EQU $82
DEF F_6     EQU $84
DEF F#6     EQU $86
DEF G_6     EQU $88
DEF G#6     EQU $8a
DEF A_6     EQU $8c
DEF A#6     EQU $8e
DEF B_6     EQU $90
