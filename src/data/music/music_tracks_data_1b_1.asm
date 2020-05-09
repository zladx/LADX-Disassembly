MusicSpeedData_1b_4aaa::
    db   $02, $04, $08, $10, $20, $40, $0c, $18, $30, $02, $05, $03, $01, $01, $60

MusicSpeedData_1b_4ab9::
    db   $03, $05, $0a, $14, $28, $50, $0f, $1e, $3c, $02, $08, $10, $02, $01, $78

MusicSpeedData_1b_4ac8::
    db   $03, $06, $0c, $18, $30, $60, $12, $24, $48, $03, $08, $10, $02, $04, $90

MusicSpeedData_1b_4ad7::
    db   $03, $07, $0e, $1c, $38, $70, $15, $2a, $54, $04, $09, $12, $02, $01, $a8

MusicSpeedData_1b_4ae6::
    db   $04, $08, $10, $20, $40, $80, $18, $30, $60, $04, $02, $01, $01, $00, $c0

MusicSpeedData_1b_4af5::
    db   $04, $09, $12, $24, $48, $90, $1b, $36, $6c, $05, $0c, $18, $18, $06, $d8

MusicSpeedData_1b_4b04::
    db   $05, $0a, $14, $28, $50, $a0, $1e, $3c, $78, $05, $01, $01, $01, $01, $f0

HardcodedData_1b_4b13::
    db   $10, $32, $22, $47, $81, $20, $00

Music04Channel3::
Music0aChannel3::
Music32Channel3::
Music33Channel3::
Music34Channel1::
Music36Channel1::
Music38Channel1::
Music38Channel2::
Music3aChannel1::
    dw   ChannelDefinition_1b_4b20
    dw   $ffff, Music04Channel3

ChannelDefinition_1b_4b20::
    begin_loop $20
        notelen 14
        rest
    next_loop

    end_def
; UNREFERENCED DATA
    db   $00, $22, $44, $55, $66, $66, $88, $88, $aa, $aa, $cc, $cc, $04, $84, $04, $84

Music10::
    db   $00
    dw   MusicSpeedData_1b_4ab9
    dw   Music10Channel1
    dw   Music10Channel2
    dw   Music10Channel3
    dw   Music10Channel4

Music10Channel1::
    dw   ChannelDefinition_1b_4b51
    dw   $0000

Music10Channel2::
    dw   ChannelDefinition_1b_4b61
    dw   $0000

Music10Channel3::
    dw   ChannelDefinition_1b_4b6f
    dw   $0000

Music10Channel4::
    dw   ChannelDefinition_1b_4b81
    dw   $0000

ChannelDefinition_1b_4b51::
    set_envelope_duty $60, $21, 0, 0
    enable_unknown1
    notelen 2
    note A_4
    note A#4
    notelen 10
    note B_4
    note C_5
    note C#5
    notelen 14
    note D_5
    disable_unknown1
    end_def

ChannelDefinition_1b_4b61::
    set_envelope_duty $80, $21, 1, 1
    notelen 2
    note C_4
    note C#4
    notelen 10
    note D_4
    note D#4
    note E_4
    notelen 14
    note F_4
    end_def

ChannelDefinition_1b_4b6f::
    set_waveform waveform_1b_6ec1, $20
    enable_software_envelope
    notelen 2
    note F_3
    note F#3
    notelen 10
    note G_3
    note G#3
    note A_3
    disable_software_envelope
    notelen 5
    note A#3
    notelen 4
    rest
    end_def

ChannelDefinition_1b_4b81::
    notelen 3
    rest
    notelen 10
    note NOISE_5
    note NOISE_6
    note NOISE_6

    begin_loop $1e
        notelen 0
        note NOISE_5
    next_loop

    notelen 7
    rest
    end_def

Music40::
    db   $04
    dw   MusicSpeedData_1b_4af5
    dw   Music40Channel1
    dw   Music40Channel2
    dw   Music40Channel3
    dw   $0000

Music40Channel1::
    dw   ChannelDefinition_1b_4bd0
    dw   ChannelDefinition_1b_4c0a
    dw   ChannelDefinition_1b_4c0a
    dw   ChannelDefinition_1b_4c0a
    dw   ChannelDefinition_1b_4c0a
    dw   ChannelDefinition_1b_4c0a
    dw   ChannelDefinition_1b_4c0a
    dw   ChannelDefinition_1b_4c0a
    dw   ChannelDefinition_1b_4c0a
    dw   ChannelDefinition_1b_4c74
    dw   $ffff, Music40Channel1

Music40Channel2::
    dw   ChannelDefinition_1b_4bd5
    dw   ChannelDefinition_1b_4c3f
    dw   $ffff, Music40Channel2

Music40Channel3::
    dw   ChannelDefinition_1b_4c05
    dw   ChannelDefinition_1b_4c05
    dw   ChannelDefinition_1b_4c05
    dw   ChannelDefinition_1b_4c05
    dw   ChannelDefinition_1b_4c05
    dw   ChannelDefinition_1b_4c05
    dw   ChannelDefinition_1b_4c05
    dw   ChannelDefinition_1b_4c05
    dw   ChannelDefinition_1b_4c74
    dw   $ffff, Music40Channel3

ChannelDefinition_1b_4bd0::
    set_envelope_duty $31, $00, 1, 0
    end_def

ChannelDefinition_1b_4bd5::
    set_envelope_duty $30, $81, 2, 0

    begin_loop $08
        notelen 3
        rest
        notelen 2
        note A_3
        note A#3
        notelen 3
        note C_4
        notelen 2
        note F_4
        note A_4
        notelen 7
        note A_4
        notelen 1
        note G_4
        note F#4
        notelen 4
        note G_4
        notelen 2
        rest
        note G_4
        note A_4
        note A#4
        notelen 3
        note A_4
        note G_4
        notelen 5
        note C_4
        notelen 4
        note C_6
        notelen 7
        note F_5
        notelen 1
        note E_5
        note F_5
        notelen 4
        note G_5
        note C_5
        note D_5
        notelen 14
        note A_5
    next_loop

    end_def

ChannelDefinition_1b_4c05::
    set_waveform waveform_1b_6ed1, $40
    enable_software_envelope

ChannelDefinition_1b_4c0a::
    begin_loop $02
        notelen 2
        note F_2
        note A_2
        note C_3
        note A_2
    next_loop

    begin_loop $02
        note F_2
        note B_2
        note D_3
        note B_2
    next_loop

    note F_2
    note A#2
    note D_3
    note A#2
    note E_2
    note A#2
    note C#3
    note A#2
    note A_2
    note C_3
    note G_3
    note E_3
    note F_3
    note D_3
    note C_3
    note A_2

    begin_loop $02
        note G_2
        note A#2
        note D_3
        note A#2
    next_loop

    begin_loop $02
        note G_2
        note A#2
        note C#3
        note A#2
    next_loop

    begin_loop $04
        note F_2
        note A_2
        note C_3
        note A_2
    next_loop

    end_def

ChannelDefinition_1b_4c3f::
    set_envelope_duty $61, $00, 2, 0
    notelen 4
    rest
    enable_unknown2
    notelen 12
    rest
    notelen 13
    note A_2
    note A_2
    notelen 12
    note A_2
    notelen 10
    note A_2
    disable_unknown2
    notelen 12
    note C_3
    notelen 13
    note C_3
    note D_3
    notelen 12
    note E_3
    notelen 10
    note D_3
    notelen 3
    note C_3
    note G_3
    note E_3
    note C_4
    notelen 4
    note G_3
    notelen 12
    note G_3
    notelen 13
    note G_3
    note G#3
    notelen 12
    note G_3
    notelen 10
    note F#3
    notelen 4
    note D#3
    notelen 3
    note D_3
    notelen 7
    note G_3
    notelen 4
    note G_3
    notelen 7
    rest
    end_def

ChannelDefinition_1b_4c74::
    begin_loop $0b
        notelen 4
        rest
    next_loop

    end_def

Music3c::
    db   $00
    dw   MusicSpeedData_1b_4ae6
    dw   Music3cChannel1
    dw   Music3cChannel2
    dw   Music3cChannel3
    dw   Music3cChannel4

Music3cChannel1::
    dw   ChannelDefinition_1b_4ca5

MusicLoop_1b_4c87::
    dw   ChannelDefinition_1b_4cde
    dw   $ffff, MusicLoop_1b_4c87

Music3cChannel2::
    dw   ChannelDefinition_1b_4cb2

MusicLoop_1b_4c8f::
    dw   ChannelDefinition_1b_4cef
    dw   $ffff, MusicLoop_1b_4c8f

Music3cChannel3::
    dw   ChannelDefinition_1b_4cbf

MusicLoop_1b_4c97::
    dw   ChannelDefinition_1b_4d3f
    dw   $ffff, MusicLoop_1b_4c97

Music3cChannel4::
    dw   ChannelDefinition_1b_4ccc

MusicLoop_1b_4c9f::
    dw   ChannelDefinition_1b_4d88
    dw   $ffff, MusicLoop_1b_4c9f

ChannelDefinition_1b_4ca5::
    set_envelope_duty $60, $00, 1, 1
    notelen 7
    rest
    notelen 1
    note D_4
    notelen 10
    rest
    notelen 14
    note D#4
    end_def

ChannelDefinition_1b_4cb2::
    set_envelope_duty $40, $00, 0, 1
    notelen 7
    rest
    notelen 1
    note C#5
    notelen 10
    rest
    notelen 14
    note D_5
    end_def

ChannelDefinition_1b_4cbf::
    set_waveform waveform_1b_4d2f, $20
    notelen 7
    rest
    notelen 1
    note G#4
    notelen 10
    rest
    notelen 14
    note A_4
    end_def

ChannelDefinition_1b_4ccc::
    notelen 7
    rest
    notelen 1
    rest
    notelen 10
    rest
    notelen 5
    rest
    notelen 1
    note NOISE_FF
    notelen 2
    note NOISE_FF
    note NOISE_FF
    notelen 1
    note NOISE_FF
    notelen 2
    note NOISE_FF
    end_def

ChannelDefinition_1b_4cde::
    set_envelope_duty $22, $00, 2, 0
    enable_unknown2

    begin_loop $20
        notelen 1
        note F_4
        note E_5
        note C_5
        note A_4
        note B_5
        note G_5
        note E_5
    next_loop

    end_def

ChannelDefinition_1b_4cef::
    set_envelope_duty $81, $00, 1, 0
    notelen 6
    note A#3
    notelen 0
    note A#3
    note C_4
    notelen 6
    note D_4
    notelen 1
    note C_4
    notelen 3
    note A#3
    note F_4
    note D_4
    note A#4
    notelen 4
    note F_4
    notelen 6
    note F_4
    notelen 0
    note F_4
    note F#4
    notelen 6
    note F_4
    notelen 1
    note E_4
    notelen 4
    note C#4
    notelen 3
    note C_4
    note F_4
    notelen 4
    note A#3
    notelen 5
    rest
    rest
    rest
    set_envelope_duty $61, $00, 2, 0
    enable_unknown2
    notelen 1
    note D_3
    notelen 6
    note D_3
    notelen 1
    note D_3
    notelen 6
    note D_3
    notelen 1
    note D_3
    notelen 2
    note D_3
    note D_3
    notelen 1
    note D_3
    notelen 2
    note D_3
    disable_unknown2
    end_def

waveform_1b_4d2f::
    db   $8a, $df, $da, $86, $31, $01, $36, $86, $8a, $df, $da, $86, $31, $01, $36, $86

ChannelDefinition_1b_4d3f::
    set_waveform waveform_1b_4d2f, $20
    enable_unknown2

    begin_loop $02
        notelen 10
        note B_2
        rest
        notelen 0
        rest
        notelen 1
        rest
    next_loop

    notelen 6
    rest
    notelen 10
    note B_2
    rest
    notelen 0
    rest
    notelen 1
    rest

    begin_loop $02
        notelen 10
        note B_2
        rest
        notelen 0
        rest
    next_loop

    notelen 1
    rest
    notelen 3
    rest

    begin_loop $02
        notelen 10
        note B_2
        rest
        notelen 0
        rest
        notelen 1
        rest
    next_loop

    notelen 6
    rest
    notelen 10
    note B_2
    rest
    notelen 0
    rest
    notelen 1
    rest

    begin_loop $02
        notelen 10
        note B_2
        rest
        notelen 0
        rest
    next_loop

    notelen 1
    rest
    notelen 6
    rest
    notelen 10
    note B_2
    rest
    notelen 0
    rest
    end_def

ChannelDefinition_1b_4d88::
    begin_loop $07
        notelen 1
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_FF
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_FF
        note NOISE_5
        note NOISE_5
        note NOISE_6
    next_loop

    begin_loop $02
        note NOISE_FF
        note NOISE_FF
        note NOISE_5
        note NOISE_5
    next_loop

    note NOISE_FF
    note NOISE_FF
    note NOISE_5
    note NOISE_FF
    note NOISE_5
    note NOISE_FF
    note NOISE_FF
    note NOISE_5
    end_def

Music37::
    db   $00
    dw   MusicSpeedData_1b_4ab9
    dw   Music37Channel1
    dw   Music37Channel2
    dw   Music37Channel3
    dw   $0000

Music37Channel1::
    dw   ChannelDefinition_1b_4dc9
    dw   $ffff, Music37Channel1

Music37Channel2::
    dw   ChannelDefinition_1b_4ddf
    dw   $ffff, Music37Channel2

Music37Channel3::
    dw   ChannelDefinition_1b_4e15
    dw   $ffff, Music37Channel3

ChannelDefinition_1b_4dc9::
    set_envelope_duty $43, $00, 2, 0
    notelen 7
    note C#4
    note C#4
    note C#4
    note C#4
    note C_4
    note C_4
    note C_4
    note C_4
    note A#3
    note A#3
    note A#3
    note A#3
    note G#3
    note A#3
    note C_4
    note D#4
    end_def

ChannelDefinition_1b_4ddf::
    set_envelope_duty $40, $21, 2, 0
    notelen 8
    note G#4
    notelen 3
    rest
    notelen 2
    note G_4
    notelen 3
    note A#4
    notelen 8
    note D#4
    notelen 2
    rest
    notelen 3
    note G#4
    notelen 2
    note G#3
    notelen 3
    note A#3
    notelen 2
    note C_4
    notelen 3
    note C#4
    notelen 2
    note C_4
    notelen 3
    note C#4
    notelen 7
    note G_3
    note F_4
    notelen 14
    note D#4
    notelen 2
    rest
    end_def

waveform_1b_4e05::
    db   $44, $44, $44, $42, $00, $00, $00, $00, $44, $44, $44, $42, $00, $00, $00, $00

ChannelDefinition_1b_4e15::
    set_waveform waveform_1b_4e05, $20
    enable_software_envelope
    notelen 7
    note C_4
    note C_4
    note A#3
    note A#3
    note A#3
    note A#3
    note G#3
    note G#3
    note G#3
    note G#3
    note G_3
    note G_3
    note F#3
    note F#3
    note A_3
    note C_4
    end_def
