Music1a::
    db   $00
    dw   MusicSpeedData_1e_4ae8
    dw   Music1aChannel1
    dw   Music1aChannel2
    dw   Music1aChannel3
    dw   $0000

Music1aChannel1::
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_506f
    dw   ChannelDefinition_1e_6eac
    dw   ChannelDefinition_1e_50a1
    dw   ChannelDefinition_1e_6ea8
    dw   ChannelDefinition_1e_6e22
    dw   ChannelDefinition_1e_50a8
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_6d2a
    dw   ChannelDefinition_1e_5147
    dw   ChannelDefinition_1e_5147
    dw   ChannelDefinition_1e_6d15
    dw   ChannelDefinition_1e_6eb0
    dw   ChannelDefinition_1e_6d10
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_5151
    dw   ChannelDefinition_1e_51e3
    dw   $0000

Music1aChannel2::
    dw   ChannelDefinition_1e_50b7
    dw   ChannelDefinition_1e_6eac
    dw   ChannelDefinition_1e_6dff
    dw   ChannelDefinition_1e_50ed
    dw   ChannelDefinition_1e_6ea8
    dw   ChannelDefinition_1e_50f2
    dw   ChannelDefinition_1e_6dcd
    dw   ChannelDefinition_1e_5147
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_5147
    dw   ChannelDefinition_1e_6d15
    dw   ChannelDefinition_1e_6eb0
    dw   ChannelDefinition_1e_6dbe
    dw   ChannelDefinition_1e_5151
    dw   ChannelDefinition_1e_6d2d
    dw   ChannelDefinition_1e_6e18
    dw   ChannelDefinition_1e_51e3
    dw   $0000

Music1aChannel3::
    dw   ChannelDefinition_1e_6e63
    dw   ChannelDefinition_1e_5100
    dw   ChannelDefinition_1e_6eac
    dw   ChannelDefinition_1e_5131
    dw   ChannelDefinition_1e_6ea8
    dw   ChannelDefinition_1e_6e54
    dw   ChannelDefinition_1e_5138
    dw   ChannelDefinition_1e_6e72
    dw   ChannelDefinition_1e_6d27
    dw   ChannelDefinition_1e_5147
    dw   ChannelDefinition_1e_6e77
    dw   ChannelDefinition_1e_5147
    dw   $ffff, MusicLoop_1e_6d30

ChannelDefinition_1e_506f::
    begin_loop $02
        notelen 2
        note G#1
        note G#2
        note G#1
        note B_1
        note B_2
    next_loop

    note A#1
    note A#2
    note A#1
    note C#2
    note C#3
    note A#1
    note A#2
    note A_1
    note A_2

    begin_loop $02
        notelen 2
        note G#1
        note G#2
        note G#1
        note B_1
        note B_2
    next_loop

    note C_2
    note C_3
    note C_2
    note D#2
    note D#3
    note C_2
    note C_3
    note B_1
    note B_2

    begin_loop $02
        note A#1
        note A#2
        note A#1
        note C#2
        note C#3
    next_loop

    note E_2
    note E_3
    note E_2
    note G_2
    note G_3
    end_def

ChannelDefinition_1e_50a1::
    notelen 2
    note A#1
    note A#2
    note A#1
    note C#2
    note C#3
    end_def

ChannelDefinition_1e_50a8::
    notelen 2
    note E_2
    note E_3
    note E_2
    note G_2
    note G_3
    notelen 2
    note A#2
    note A#3
    note A#2
    note C#3
    note C#4
    notelen 5
    rest
    end_def

ChannelDefinition_1e_50b7::
    set_envelope_duty $97, $86, 2, 0
    notelen 7
    note G#3
    notelen 4
    note C#3
    notelen 6
    rest
    notelen 1
    note D#3
    note E_3
    note F#3
    notelen 3
    note G_3
    notelen 4
    note G_4
    notelen 7
    rest
    note G#3
    notelen 4
    note C#3
    notelen 6
    rest
    notelen 1
    note D#3
    note E_3
    note C#4
    notelen 3
    note C_4
    notelen 4
    note B_3
    notelen 7
    rest
    set_envelope_duty $b7, $86, 2, 0
    notelen 7
    note A#3
    notelen 4
    note D#3
    notelen 6
    rest
    notelen 1
    note F#3
    note G_3
    note G#3
    notelen 3
    note A_3
    notelen 7
    note A_4
    end_def

ChannelDefinition_1e_50ed::
    notelen 3
    note C_3
    notelen 7
    note C_4
    end_def

ChannelDefinition_1e_50f2::
    set_envelope_duty $89, $86, 2, 1
    notelen 3
    note B_3
    notelen 7
    note B_4
    notelen 8
    note D#6
    rest
    notelen 2
    rest
    end_def

ChannelDefinition_1e_5100::
    begin_loop $02
        notelen 2
        note C#1
        note C#2
        note C#1
        note E_1
        note E_2
    next_loop

    note D#1
    note D#2
    note D#1
    note F#1
    note F#2
    note D#1
    note D#2
    note D_1
    note D_2

    begin_loop $02
        note C#1
        note C#2
        note C#1
        note E_1
        note E_2
    next_loop

    note F_1
    note F_2
    note F_1
    note G#1
    note G#2
    note F_1
    note F_2
    note E_1
    note E_2

    begin_loop $02
        note D#1
        note D#2
        note D#1
        note F#1
        note F#2
    next_loop

    note A_1
    note A_2
    note A_1
    note C_2
    note C_3
    end_def

ChannelDefinition_1e_5131::
    notelen 2
    note D#1
    note D#2
    note D#1
    note F#1
    note F#2
    end_def

ChannelDefinition_1e_5138::
    notelen 2
    note A_1
    note A_2
    note A_1
    note C_2
    note C_3
    notelen 2
    note D#2
    note D#3
    note D#2
    note F#2
    note F#3
    notelen 5
    rest
    end_def

ChannelDefinition_1e_5147::
    notelen 1
    note B_3
    note D#4
    note F_4
    note A_4
    note B_4
    note D#5
    note F_5
    note A_5
    end_def

ChannelDefinition_1e_5151::
    notelen 3
    note F_3
    note A#2
    rest
    notelen 1
    note A#2
    note C_3
    note D_3
    note D#3
    notelen 3
    rest
    note D#3
    note G#2
    notelen 1
    note G#2
    note A#2
    note C_3
    note D_3
    notelen 2
    rest
    note F_5
    note A#4
    note F_2
    note A#1
    note A#4
    notelen 1
    note A#4
    note C_5
    note D_5
    notelen 6
    note D#5
    notelen 2
    note D#5
    note G#4
    note D#2
    note G#1
    note G#4
    notelen 1
    note G#4
    note A#4
    note C_5
    note D_5
    notelen 2
    rest
    note F_6
    note A#5
    note F_3
    note A#2
    note A#5
    notelen 1
    note A#5
    note C_6
    note D_6
    notelen 6
    note D#6
    notelen 2
    note D#6
    note G#5
    note D#3
    note G#2
    note G#5
    notelen 1
    note G#5
    note A#5
    note C_6
    note D_6
    notelen 2
    note D#3
    note D_5
    note G_4
    note D#3
    note D#2
    note G_4
    notelen 1
    note G_4
    note A_4
    note A#4
    note C_5
    notelen 2
    note D_3
    note C_5
    note F_4
    note F_5
    notelen 1
    note D_3
    note F_3
    note A_3
    note C_4
    note D_4
    note F_4
    note A_4
    note C_5
    notelen 2
    note C_3
    note A#4
    note D#4
    note C_3
    note C_4
    note D#4
    notelen 1
    note D#4
    note F_4
    note G_4
    note A_4
    notelen 2
    note A#2
    note A_4
    note D_4
    note D_5
    notelen 1
    note A#2
    note D_3
    note F_3
    note A_3
    note A#3
    note D_4
    note F_4
    note A_4
    notelen 2
    note G#2
    note G_4
    notelen 1
    note C_4
    note D#4
    note G_4
    note C_5
    notelen 2
    note F#2
    note F_4
    notelen 1
    note A#3
    notelen 0
    rest
    notelen 1
    note C#4
    notelen 0
    rest
    notelen 1
    note F_4
    notelen 0
    rest
    notelen 1
    note A#4
    notelen 4
    rest
    end_def

ChannelDefinition_1e_51e3::
    set_speed MusicSpeedData_1e_4ad9
    notelen 1
    note C_3
    note F_3
    note A#3

    begin_loop $02
        note F_1
        rest
        rest
    next_loop

    note F_3
    note G_3
    note A_3
    note A#3
    note C_4
    rest
    note F_1
    note F_3
    note A#3
    note D#4
    note F_1
    rest
    rest
    note F_1
    rest
    note A#3
    note D#4
    note G#4
    rest
    note F_1
    note F_1
    rest
    note F_1
    rest
    end_def

Music11::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music11Channel1
    dw   Music11Channel2
    dw   Music11Channel3
    dw   Music11Channel4

Music11Channel1::
    dw   ChannelDefinition_1e_6d15

MusicLoop_1e_5216::
    dw   ChannelDefinition_1e_6de1
    dw   ChannelDefinition_1e_5253
    dw   $ffff, MusicLoop_1e_5216

Music11Channel2::
    dw   ChannelDefinition_1e_6e31
    dw   ChannelDefinition_1e_5234
    dw   $ffff, Music11Channel2

Music11Channel3::
    dw   ChannelDefinition_1e_6e63
    dw   ChannelDefinition_1e_5274
    dw   $ffff, Music11Channel3

Music11Channel4::
    dw   ChannelDefinition_1e_5293
    dw   $ffff, Music11Channel4

ChannelDefinition_1e_5234::
    notelen 2
    note A#3
    rest
    notelen 7
    note F_3
    notelen 1
    note A#3
    rest
    note A#3
    note C_4
    note D_4
    note D#4
    notelen 4
    note F_4
    rest
    notelen 2
    note A#4
    rest
    notelen 7
    note F_4
    notelen 1
    note A#4
    rest
    note A#4
    note C_5
    note D_5
    note D#5
    notelen 4
    note F_5
    rest
    end_def

ChannelDefinition_1e_5253::
    notelen 2
    note G#2
    rest
    notelen 7
    note D#2
    notelen 1
    note G#2
    rest
    note G#2
    note A#2
    note C_3
    note D#3
    note F#3
    notelen 6
    rest
    notelen 5
    rest
    notelen 2
    note G#3
    rest
    notelen 3
    note D#3
    notelen 1
    note G#3
    note D#3
    note C_3
    note G#2
    note A#2
    notelen 6
    rest
    notelen 8
    rest
    end_def

ChannelDefinition_1e_5274::
    begin_loop $02
        enable_software_envelope
        notelen 2
        note A#1
        note A#1
        rest
        note A#1
    next_loop

    begin_loop $02
        note G#1
        note G#1
        rest
        note G#1
    next_loop

    begin_loop $02
        note F#1
        note F#1
        rest
        note F#1
    next_loop

    begin_loop $02
        note G#1
        note G#1
        rest
        note G#1
    next_loop

    end_def

ChannelDefinition_1e_5293::
    begin_loop $07
        notelen 2
        note NOISE_6
        notelen 1
        note NOISE_6
        note NOISE_6
    next_loop

    begin_loop $04
        note NOISE_6
    next_loop

    begin_loop $06
        notelen 2
        note NOISE_6
        notelen 1
        note NOISE_6
        note NOISE_6
    next_loop

    begin_loop $08
        note NOISE_6
    next_loop

    end_def

Music5d::
    db   $00
    dw   MusicSpeedData_1e_4ae8
    dw   Music5dChannel1
    dw   Music5dChannel2
    dw   Music5dChannel3
    dw   $0000

Music5dChannel2::
    dw   ChannelDefinition_1e_6e2c
    dw   ChannelDefinition_1e_53da
    dw   $ffff, Music5dChannel2

Music23::
    db   $00
    dw   MusicSpeedData_1e_4aac
    dw   Music23Channel1
    dw   Music23Channel2
    dw   Music23Channel3
    dw   Music23Channel4

Music23Channel2::
    dw   ChannelDefinition_1e_6de1
    dw   ChannelDefinition_1e_53ce
    dw   ChannelDefinition_1e_6ea0
    dw   ChannelDefinition_1e_6d15
    dw   ChannelDefinition_1e_6eac
    dw   ChannelDefinition_1e_6d27

MusicLoop_1e_52d6::
    dw   ChannelDefinition_1e_6deb
    dw   ChannelDefinition_1e_5498
    dw   ChannelDefinition_1e_54d7
    dw   ChannelDefinition_1e_54d7
    dw   ChannelDefinition_1e_54d7
    dw   ChannelDefinition_1e_54de
    dw   ChannelDefinition_1e_5498
    dw   ChannelDefinition_1e_54d7
    dw   ChannelDefinition_1e_54d7
    dw   ChannelDefinition_1e_54d7
    dw   ChannelDefinition_1e_54de
    dw   $ffff, MusicLoop_1e_553b

Music23Channel1::
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_6dd2
    dw   ChannelDefinition_1e_5411
    dw   ChannelDefinition_1e_6ea0
    dw   ChannelDefinition_1e_6d15
    dw   ChannelDefinition_1e_6eac
    dw   ChannelDefinition_1e_6d27

MusicLoop_1e_52fe::
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_542a
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6d2a
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_5450
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_5461
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_542a
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6d2a
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_5450
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_5461
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6e91
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_5472
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6d2a
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6df0
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_54ab
    dw   ChannelDefinition_1e_6e94
    dw   ChannelDefinition_1e_54ab
    dw   ChannelDefinition_1e_6e8e
    dw   ChannelDefinition_1e_54ba
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_6df0
    dw   ChannelDefinition_1e_54c2
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_542a
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6d2a
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_5450
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_5461
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_542a
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6d2a
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_5450
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_5461
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6e91
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_5472
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6d2a
    dw   ChannelDefinition_1e_543b
    dw   ChannelDefinition_1e_6df0
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_54ab
    dw   ChannelDefinition_1e_6e94
    dw   ChannelDefinition_1e_54ab
    dw   ChannelDefinition_1e_6e8e
    dw   ChannelDefinition_1e_54ba
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_6de1
    dw   ChannelDefinition_1e_54c2
    dw   $ffff, MusicLoop_1e_5531

Music23Channel3::
    dw   ChannelDefinition_1e_6e54
    dw   ChannelDefinition_1e_541d
    dw   ChannelDefinition_1e_6ea0
    dw   ChannelDefinition_1e_6d15
    dw   ChannelDefinition_1e_6eac
    dw   ChannelDefinition_1e_6d27

MusicLoop_1e_53a6::
    dw   ChannelDefinition_1e_6e59
    dw   ChannelDefinition_1e_5482
    dw   ChannelDefinition_1e_54f3
    dw   ChannelDefinition_1e_6e54
    dw   ChannelDefinition_1e_5508
    dw   ChannelDefinition_1e_6e59
    dw   ChannelDefinition_1e_5482
    dw   ChannelDefinition_1e_54f3
    dw   ChannelDefinition_1e_6e54
    dw   ChannelDefinition_1e_5508
    dw   $ffff, MusicLoop_1e_5545

Music23Channel4::
    dw   ChannelDefinition_1e_5518
    dw   ChannelDefinition_1e_6ea0
    dw   ChannelDefinition_1e_602d
    dw   ChannelDefinition_1e_6eac
    dw   ChannelDefinition_1e_551d

MusicLoop_1e_53c8::
    dw   ChannelDefinition_1e_5520
    dw   $ffff, MusicLoop_1e_53c8

ChannelDefinition_1e_53ce::
    notelen 2
    note D_4
    note C#4
    note C_4
    note B_3
    note D_4
    note D#4
    note E_4
    note F_4
    notelen 3
    rest
    end_def

ChannelDefinition_1e_53da::
    begin_loop $06
        notelen 0
        note B_3
        note A#3
    next_loop

    begin_loop $0a
        note A#3
        note A_3
    next_loop

    set_envelope_duty $68, $00, 2, 1

    begin_loop $06
        note A_3
        note G#3
    next_loop

    begin_loop $0a
        note G#3
        note G_3
    next_loop

    set_envelope_duty $a8, $00, 2, 1

    begin_loop $06
        notelen 0
        note C#4
        note C_4
    next_loop

    begin_loop $0a
        note C_4
        note B_3
    next_loop

    set_envelope_duty $78, $00, 2, 1

    begin_loop $06
        note B_3
        note A#3
    next_loop

    begin_loop $0a
        note A#3
        note A_3
    next_loop

    end_def

ChannelDefinition_1e_5411::
    notelen 2
    note F_4
    note E_4
    note D#4
    note D_4
    note F_4
    note F#4
    note G_4
    note G#4
    notelen 3
    rest
    end_def

ChannelDefinition_1e_541d::
    enable_software_envelope
    notelen 2
    note G#4
    note G_4
    note F#4
    note F_4
    note G#4
    note A_4
    note A#4
    note B_4
    notelen 3
    rest
    end_def

ChannelDefinition_1e_542a::
    notelen 1
    note G_3
    note A_3
    rest
    notelen 5
    note A#3
    notelen 7
    rest
    notelen 1
    note G_3
    note A_3
    rest
    note A#3
    notelen 2
    rest
    note C#4
    end_def

ChannelDefinition_1e_543b::
    set_envelope_duty $92, $00, 3, 0
    notelen 1
    note G_1
    rest
    note G_1
    note G_2
    rest
    note C_2
    note C#2
    rest
    note G_1
    rest
    note G#1
    rest
    note G#1
    note C#1
    rest
    end_def

ChannelDefinition_1e_5450::
    notelen 1
    rest
    notelen 2
    note A#4
    notelen 1
    rest
    note A#4
    rest
    notelen 9
    note A#4
    notelen 0
    rest
    notelen 4
    note A#4
    notelen 2
    rest
    end_def

ChannelDefinition_1e_5461::
    notelen 1
    rest
    notelen 2
    note C#5
    notelen 1
    rest
    note C#5
    rest
    notelen 9
    note C#5
    notelen 0
    rest
    notelen 4
    note C#5
    notelen 2
    rest
    end_def

ChannelDefinition_1e_5472::
    notelen 1
    note G_3
    note A_3
    rest
    notelen 5
    note A#3
    notelen 4
    rest
    notelen 1
    rest
    note G_3
    note A_3
    note A#3
    note D#4
    note D_4
    end_def

ChannelDefinition_1e_5482::
    begin_loop $14
        enable_software_envelope
        notelen 1
        note C_3
        note C_3
        rest
        note C_3
        note C_4
        rest
        note F_3
        note F#3
        rest
        note C_3
        rest
        note C#3
        rest
        note C#3
        note F#2
        rest
    next_loop

    end_def

ChannelDefinition_1e_5498::
    notelen 1
    note C#1

    begin_loop $7f
        note C_1
    next_loop

    notelen 1
    note C#1

    begin_loop $7f
        note C_1
    next_loop

    notelen 1
    note C#1

    begin_loop $3f
        note C_1
    next_loop

    end_def

ChannelDefinition_1e_54ab::
    notelen 1
    note E_4
    note E_4
    note E_4
    note D#4
    notelen 3
    rest
    notelen 1
    note D_4
    rest
    rest
    note C#4
    notelen 3
    rest
    end_def

ChannelDefinition_1e_54ba::
    notelen 1
    note E_4
    note E_4
    note E_4
    note D#4
    notelen 8
    rest
    end_def

ChannelDefinition_1e_54c2::
    notelen 1
    note A#3
    note A#3
    rest
    note A#3
    rest
    note A#3
    rest
    note D#4
    rest
    note D#4
    notelen 2
    note D#4
    enable_unknown2
    notelen 1
    rest
    note D_3
    note A_2
    note F_2
    disable_unknown2
    end_def

ChannelDefinition_1e_54d7::
    notelen 1
    note G_1

    begin_loop $0f
        note F#1
    next_loop

    end_def

ChannelDefinition_1e_54de::
    notelen 1
    note F_3
    note F_3
    rest
    note F_3
    rest
    note F_3
    rest
    note F_3
    rest
    note A#3
    notelen 2
    note A#3
    enable_unknown2
    notelen 1
    rest
    note A_2
    note F_2
    note D_2
    disable_unknown2
    end_def

ChannelDefinition_1e_54f3::
    begin_loop $03
        notelen 1
        note F#3
        note F#3
        rest
        note F#3
        note F#4
        rest
        note B_3
        note C_4
        rest
        note F#3
        rest
        note G_3
        rest
        note G_3
        note C_3
        rest
    next_loop

    end_def

ChannelDefinition_1e_5508::
    notelen 1
    note C_3
    note C_3
    rest
    note C_3
    rest
    note C_3
    rest
    note F_3
    rest
    note F_3
    note F_3
    rest
    notelen 3
    rest
    end_def

ChannelDefinition_1e_5518::
    notelen 5
    rest
    notelen 3
    rest
    end_def

ChannelDefinition_1e_551d::
    notelen 6
    rest
    end_def

ChannelDefinition_1e_5520::
    begin_loop $02
        notelen 1
        note NOISE_6
        note NOISE_6
        note NOISE_6
        note NOISE_5
    next_loop

    note NOISE_6
    note NOISE_6
    note NOISE_5
    note NOISE_6
    note NOISE_6
    note NOISE_6
    note NOISE_6
    note NOISE_6
    end_def

MusicLoop_1e_5531::
    dw   ChannelDefinition_1e_5551
    dw   ChannelDefinition_1e_5551
    dw   ChannelDefinition_1e_5561
    dw   $ffff, MusicLoop_1e_52fe

MusicLoop_1e_553b::
    dw   ChannelDefinition_1e_557c
    dw   ChannelDefinition_1e_557c
    dw   ChannelDefinition_1e_55a8
    dw   $ffff, MusicLoop_1e_52d6

MusicLoop_1e_5545::
    dw   ChannelDefinition_1e_6e59
    dw   ChannelDefinition_1e_55ec
    dw   ChannelDefinition_1e_55ec
    dw   ChannelDefinition_1e_5615
    dw   $ffff, MusicLoop_1e_53a6

ChannelDefinition_1e_5551::
    set_envelope_duty $c4, $83, 2, 0
    notelen 1
    note C#1

    begin_loop $1f
        note C_1
    next_loop

    note E_1

    begin_loop $1f
        note D#1
    next_loop

    end_def

ChannelDefinition_1e_5561::
    notelen 1
    note G_1

    begin_loop $0d
        note F#1
    next_loop

    note G_1
    note G#1

    begin_loop $0f
        note A_1
    next_loop

    note G_1

    begin_loop $0e
        note F#1
    next_loop

    note G_1
    note G#1

    begin_loop $07
        note A_1
    next_loop

    note A#1
    notelen 4
    rest
    end_def

ChannelDefinition_1e_557c::
    set_envelope_duty $84, $86, 2, 0

    begin_loop $02
        notelen 1
        note G_1
        note G_1
        rest
        note G_1
        note G_2
        rest
        note C_2
        note C#2
        rest
        note G_1
        rest
        note G#1
        rest
        note G#1
        note C#1
        rest
    next_loop

    begin_loop $02
        note A#1
        note A#1
        rest
        note A#1
        note A#2
        rest
        note D#2
        note E_2
        rest
        note A#1
        rest
        note B_1
        rest
        note B_1
        note F_1
        rest
    next_loop

    end_def

ChannelDefinition_1e_55a8::
    notelen 1
    note C#2
    note C#2
    rest
    note C#2
    note C#3
    rest
    note F#2
    note G#2
    rest
    note C#2

    begin_loop $02
        rest
        note D_2
    next_loop

    note G#1
    rest
    note E_2
    note E_2
    rest
    note E_2
    note E_3
    rest
    note A_2
    note A#2
    rest
    note E_2

    begin_loop $02
        rest
        note F_2
    next_loop

    note B_1
    rest
    note C#2
    note C#2
    rest
    note C#2
    note C#3
    rest
    note F#2
    note G#2
    rest
    note C#2

    begin_loop $02
        rest
        note D_2
    next_loop

    note G#1
    rest
    notelen 2
    note E_2
    note E_2
    note E_3
    notelen 1
    note F_2
    note F#2
    rest
    note F#2
    notelen 6
    note F#3
    notelen 1
    note F#2
    note F#1
    note F#2
    end_def

ChannelDefinition_1e_55ec::
    begin_loop $02
        enable_software_envelope
        notelen 1
        note C_3
        note C_3
        rest
        note C_3
        note C_4
        rest
        note F_3
        note F#3
        rest
        note C_3
        rest
        note C#3
        rest
        note C#3
        note F#2
        rest
    next_loop

    begin_loop $02
        note D#3
        note D#3
        rest
        note D#3
        note D#4
        rest
        note G#3
        note A_3
        rest
        note D#3
        rest
        note E_3
        rest
        note E_3
        note A#2
        rest
    next_loop

    end_def

ChannelDefinition_1e_5615::
    notelen 1
    note F#3
    note F#3
    rest
    note F#3
    note F#4
    rest
    note B_3
    note C#4
    rest
    note F#3
    rest
    note G_3
    rest
    note G_3
    note C#3
    rest
    note A_3
    note A_3
    rest
    note A_3
    note A_4
    rest
    note D_4
    note D#4
    rest
    note A_3
    rest
    note A#3
    rest
    note A#3
    note E_3
    rest
    note F#3
    note F#3
    rest
    note F#3
    note F#4
    rest
    note B_3
    note C#4
    rest
    note F#3
    rest
    note G_3
    rest
    note G_3
    note C#3
    rest
    notelen 2
    note A_3
    note A_3
    note A_4
    notelen 1
    note A#3
    note B_3
    rest
    note B_3
    notelen 6
    note B_4
    notelen 1
    note B_3
    note B_2
    note B_3
    end_def

Music12::
    db   $00
    dw   MusicSpeedData_1e_4af7
    dw   Music12Channel1
    dw   Music12Channel2
    dw   Music12Channel3
    dw   $0000

Music12Channel1::
    dw   ChannelDefinition_1e_6de1
    dw   ChannelDefinition_1e_56a7
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20
    dw   $ffff, MusicLoop_1e_5745

Music12Channel2::
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_56bc
    dw   ChannelDefinition_1e_6e45
    dw   ChannelDefinition_1e_56c7
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_56d2
    dw   ChannelDefinition_1e_56bc
    dw   ChannelDefinition_1e_6e45
    dw   ChannelDefinition_1e_56c7
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_56d2
    dw   ChannelDefinition_1e_6e27
    dw   ChannelDefinition_1e_56e3
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_56d2
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_56ed
    dw   $ffff, MusicLoop_1e_575f

Music12Channel3::
    dw   ChannelDefinition_1e_6e59
    dw   ChannelDefinition_1e_56f9
    dw   ChannelDefinition_1e_56f9
    dw   ChannelDefinition_1e_6e54
    dw   ChannelDefinition_1e_5735
    dw   ChannelDefinition_1e_6e59
    dw   ChannelDefinition_1e_5724
    dw   ChannelDefinition_1e_5724
    dw   $ffff, MusicLoop_1e_5791

ChannelDefinition_1e_56a7::
    begin_loop $10
        notelen 5
        rest
    next_loop

    notelen 3
    rest
    notelen 1
    note F_1
    note B_1
    note F_2
    note B_2
    note F_3
    note B_3
    note F_4
    note B_4
    notelen 5
    rest
    notelen 3
    rest
    end_def

ChannelDefinition_1e_56bc::
    begin_loop $02
        notelen 2
        note E_5
        note G_5
        note F#5
        note A_5
        notelen 14
        rest
    next_loop

    end_def

ChannelDefinition_1e_56c7::
    notelen 1
    note E_3
    note G_3
    note F#3
    note A_3
    notelen 4
    note D#4
    rest
    notelen 8
    rest
    end_def

ChannelDefinition_1e_56d2::
    notelen 8
    rest
    notelen 2
    rest
    notelen 1
    note B_5
    note A#5

    begin_loop $0d
        notelen 0
        note B_5
        note A#5
    next_loop

    note B_5
    notelen 3
    rest
    end_def

ChannelDefinition_1e_56e3::
    notelen 1
    note E_5
    note G_5
    note B_5
    note A#5
    notelen 5
    note D_6
    notelen 8
    rest
    end_def

ChannelDefinition_1e_56ed::
    notelen 3
    rest

    begin_loop $0d
        notelen 0
        note B_5
        note A#5
    next_loop

    note B_5
    notelen 5
    rest
    end_def

ChannelDefinition_1e_56f9::
    enable_software_envelope
    notelen 2
    note E_1
    rest
    notelen 4
    rest
    notelen 6
    rest
    notelen 1
    note E_1
    note E_1
    notelen 6
    rest
    notelen 8
    rest
    notelen 2
    note E_1
    note E_1
    notelen 4
    rest
    notelen 6
    rest
    notelen 1
    note E_1
    notelen 2
    note E_1
    rest
    notelen 8
    rest
    notelen 2
    note E_1
    rest
    notelen 4
    rest
    notelen 6
    rest
    notelen 1
    note E_1
    notelen 2
    note E_1
    rest
    notelen 8
    rest

ChannelDefinition_1e_5724::
    enable_software_envelope
    notelen 2
    note E_1
    note E_1
    notelen 4
    rest
    notelen 6
    rest
    notelen 1
    note E_1
    note E_1
    note E_1
    notelen 8
    rest
    notelen 2
    note E_1
    end_def

ChannelDefinition_1e_5735::
    disable_software_envelope
    notelen 1
    note E_1
    note G_1
    note B_1
    note A#1
    notelen 5
    note D_2
    notelen 4
    rest
    notelen 1
    note D#2
    note B_1
    note G_1
    note E_1
    end_def

MusicLoop_1e_5745::
    dw   ChannelDefinition_1e_6e36
    dw   ChannelDefinition_1e_57b1
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_57db
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_6eb4
    dw   ChannelDefinition_1e_5808
    dw   ChannelDefinition_1e_6de1
    dw   ChannelDefinition_1e_56a7
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20
    dw   $ffff, Music12Channel1

MusicLoop_1e_575f::
    dw   ChannelDefinition_1e_6e36
    dw   ChannelDefinition_1e_5814
    dw   ChannelDefinition_1e_6e40
    dw   ChannelDefinition_1e_583e
    dw   ChannelDefinition_1e_6eb4
    dw   ChannelDefinition_1e_6d15
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_56bc
    dw   ChannelDefinition_1e_6e45
    dw   ChannelDefinition_1e_56c7
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_56d2
    dw   ChannelDefinition_1e_56bc
    dw   ChannelDefinition_1e_6e45
    dw   ChannelDefinition_1e_56c7
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_56d2
    dw   ChannelDefinition_1e_6e27
    dw   ChannelDefinition_1e_56e3
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_56d2
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_56ed
    dw   $ffff, Music12Channel2

MusicLoop_1e_5791::
    dw   ChannelDefinition_1e_6e63
    dw   ChannelDefinition_1e_586b
    dw   ChannelDefinition_1e_6e54
    dw   ChannelDefinition_1e_589b
    dw   ChannelDefinition_1e_6eb4
    dw   ChannelDefinition_1e_6d15
    dw   ChannelDefinition_1e_6e59
    dw   ChannelDefinition_1e_56f9
    dw   ChannelDefinition_1e_56f9
    dw   ChannelDefinition_1e_6e54
    dw   ChannelDefinition_1e_5735
    dw   ChannelDefinition_1e_6e59
    dw   ChannelDefinition_1e_5724
    dw   ChannelDefinition_1e_5724
    dw   $ffff, Music12Channel3

ChannelDefinition_1e_57b1::
    notelen 2
    note B_1
    note C#2
    notelen 4
    note D_2
    notelen 3
    rest
    notelen 2
    note B_1
    note C#2
    notelen 7
    note D_2
    notelen 2
    note G_2
    note F#2
    note B_1
    notelen 4
    note C#2
    notelen 14
    rest
    notelen 2
    note B_1
    note C#2
    notelen 4
    note D_2
    notelen 3
    rest
    notelen 2
    note B_1
    note C#2
    notelen 7
    note D_2
    notelen 2
    note F#2
    note B_2
    note A#2
    notelen 4
    note A#2
    rest
    notelen 5
    rest
    end_def

ChannelDefinition_1e_57db::
    notelen 1
    note B_2
    note C_3
    notelen 4
    note C#3
    notelen 2
    rest
    notelen 1
    note B_2
    note C_3
    note C#3
    notelen 6
    rest
    notelen 3
    note G_3
    notelen 1
    note F#3
    note F_3
    note B_3
    note C_4
    notelen 4
    note C#4
    notelen 1
    note D_4
    rest
    note B_3
    note C_4
    note C#4
    note D_4
    notelen 2
    rest
    notelen 3
    note G_4
    notelen 1
    note F#4
    note F_4
    note E_4
    note F_4
    note F#4
    note B_3
    note C_4
    rest
    notelen 7
    rest
    end_def

ChannelDefinition_1e_5808::
    notelen 7
    rest
    notelen 1
    note B_5
    note A#5

    begin_loop $09
        notelen 0
        note B_5
        note A#5
    next_loop

    end_def

ChannelDefinition_1e_5814::
    notelen 2
    note E_2
    note F#2
    notelen 4
    note G_2
    notelen 3
    rest
    notelen 2
    note E_2
    note F#2
    notelen 7
    note G_2
    notelen 2
    note C_3
    note B_2
    note E_2
    notelen 4
    note F_2
    notelen 14
    rest
    notelen 2
    note E_2
    note F#2
    notelen 4
    note G_2
    notelen 3
    rest
    notelen 2
    note E_2
    note F#2
    notelen 7
    note G_2
    notelen 2
    note B_2
    note E_3
    note D#3
    notelen 4
    note D_3
    rest
    notelen 5
    rest
    end_def

ChannelDefinition_1e_583e::
    notelen 1
    note E_3
    note F_3
    notelen 4
    note F#3
    notelen 2
    rest
    notelen 1
    note E_3
    note F_3
    note F#3
    notelen 6
    rest
    notelen 3
    note C_4
    notelen 1
    note B_3
    note A#3
    note E_4
    note F_4
    notelen 4
    note F#4
    notelen 1
    note G_4
    rest
    note E_4
    note F_4
    note F#4
    note G_4
    notelen 2
    rest
    notelen 3
    note C_4
    notelen 1
    note B_4
    note A#4
    note E_5
    note F_5
    note F#5
    note B_4
    note C_5
    rest
    notelen 7
    rest
    end_def

ChannelDefinition_1e_586b::
    begin_loop $02
        enable_software_envelope
        notelen 2
        note E_1
        note E_1
        notelen 8
        rest
    next_loop

    begin_loop $02
        notelen 2
        note D_1
        note D_1
        notelen 8
        rest
    next_loop

    begin_loop $02
        notelen 2
        note E_1
        note E_1
        rest
        note E_1
        rest
        note E_1
        notelen 1
        note E_1
        note E_1
        note E_1
        note E_1
    next_loop

    begin_loop $02
        notelen 2
        note C_2
        note C_2
        rest
        note C_2
        rest
        note C_2
        notelen 1
        note C_2
        note C_2
        note C_2
        note C_2
    next_loop

    end_def

ChannelDefinition_1e_589b::
    begin_loop $04
        notelen 1
        note E_1
    next_loop

    note E_2

    begin_loop $07
        note E_1
    next_loop

    begin_loop $04
        note E_1
    next_loop

    note E_2

    begin_loop $07
        note E_1
    next_loop

    begin_loop $04
        note E_1
    next_loop

    note E_2

    begin_loop $07
        note E_1
    next_loop

    begin_loop $04
        note E_1
    next_loop

    note E_2

    begin_loop $07
        note E_1
    next_loop

    note E_2
    note F_2
    note F#2
    note B_1
    note C_2
    rest
    notelen 7
    rest
    end_def

Music5a::
    db   $00
    dw   MusicSpeedData_1e_4aca
    dw   Music5aChannel1
    dw   Music5aChannel2
    dw   Music5aChannel3
    dw   $0000

Music5aChannel1::
    dw   ChannelDefinition_1e_6d27

MusicLoop_1e_58d6::
    dw   ChannelDefinition_1e_6d78
    dw   ChannelDefinition_1e_5918
    dw   ChannelDefinition_1e_5921
    dw   ChannelDefinition_1e_5918
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_5929
    dw   ChannelDefinition_1e_5931
    dw   ChannelDefinition_1e_5931
    dw   ChannelDefinition_1e_5931
    dw   ChannelDefinition_1e_5931
    dw   $ffff, MusicLoop_1e_58d6

Music5aChannel2::
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_5918
    dw   ChannelDefinition_1e_5921
    dw   ChannelDefinition_1e_6dc3
    dw   ChannelDefinition_1e_5918
    dw   ChannelDefinition_1e_5929
    dw   ChannelDefinition_1e_6da5
    dw   ChannelDefinition_1e_5931
    dw   ChannelDefinition_1e_5931
    dw   ChannelDefinition_1e_6dc3
    dw   ChannelDefinition_1e_5931
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_5931
    dw   $ffff, Music5aChannel2

Music5aChannel3::
    dw   ChannelDefinition_1e_6e54
    dw   ChannelDefinition_1e_596e
    dw   ChannelDefinition_1e_5939
    dw   ChannelDefinition_1e_5961
    dw   $ffff, Music5aChannel3

ChannelDefinition_1e_5918::
    begin_loop $04
        notelen 2
        note B_3
        note C#4
        note F_4
        note G_4
    next_loop

    end_def

ChannelDefinition_1e_5921::
    begin_loop $04
        note A_3
        note B_3
        note D#4
        note F_4
    next_loop

    end_def

ChannelDefinition_1e_5929::
    begin_loop $04
        note C_4
        note D_4
        note F#4
        note G#4
    next_loop

    end_def

ChannelDefinition_1e_5931::
    begin_loop $02
        note C#4
        note D#4
        note F#4
        note A_4
    next_loop

    end_def

ChannelDefinition_1e_5939::
    enable_software_envelope
    notelen 7
    note B_1
    notelen 2
    note B_1
    notelen 5
    rest
    notelen 7
    rest
    notelen 2
    note A#1
    notelen 7
    note A_1
    notelen 2
    note A_1
    notelen 5
    rest
    notelen 7
    rest
    notelen 2
    note A_1
    notelen 7
    note E_1
    notelen 2
    note E_1
    notelen 5
    rest
    notelen 7
    rest
    notelen 2
    note E_1
    note C_1
    note C_1
    rest
    note C_1
    notelen 5
    rest
    notelen 7
    rest
    end_def

ChannelDefinition_1e_5961::
    begin_loop $04
        notelen 2
        note C#1
    next_loop

    notelen 14
    rest
    rest
    notelen 4
    rest
    notelen 2
    note B_1
    end_def

ChannelDefinition_1e_596e::
    begin_loop $0c
        notelen 5
        rest
    next_loop

    end_def

Music14::
Music52::
    db   $00
    dw   MusicSpeedData_1e_4abb
    dw   Music14Channel1
    dw   Music14Channel2
    dw   Music14Channel3
    dw   $0000

Music14Channel2::
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_5a47
    dw   ChannelDefinition_1e_5a51
    dw   ChannelDefinition_1e_6e1d
    dw   ChannelDefinition_1e_6e94
    dw   ChannelDefinition_1e_5a47
    dw   ChannelDefinition_1e_5a51
    dw   ChannelDefinition_1e_6dfa
    dw   ChannelDefinition_1e_6e8b
    dw   ChannelDefinition_1e_5a47
    dw   ChannelDefinition_1e_6e88
    dw   ChannelDefinition_1e_5a47
    dw   ChannelDefinition_1e_6de6
    dw   ChannelDefinition_1e_6e85
    dw   ChannelDefinition_1e_5a47
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_5a47
    dw   ChannelDefinition_1e_5a51
    dw   ChannelDefinition_1e_6e1d
    dw   ChannelDefinition_1e_6e94
    dw   ChannelDefinition_1e_5a47
    dw   ChannelDefinition_1e_5a51
    dw   ChannelDefinition_1e_6dfa
    dw   ChannelDefinition_1e_6e8b
    dw   ChannelDefinition_1e_5a47
    dw   ChannelDefinition_1e_6e88
    dw   ChannelDefinition_1e_5a47
    dw   ChannelDefinition_1e_6de6
    dw   ChannelDefinition_1e_6e85
    dw   ChannelDefinition_1e_5a47
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5a77
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5a7e
    dw   ChannelDefinition_1e_6d91
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5a8a
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5a90
    dw   ChannelDefinition_1e_6d91
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_6e94
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5a77
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5a7e
    dw   ChannelDefinition_1e_6d91
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5a8a
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5a90
    dw   ChannelDefinition_1e_6d91
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5a84
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_6db9
    dw   ChannelDefinition_1e_5a3f
    dw   ChannelDefinition_1e_6e27
    dw   ChannelDefinition_1e_5a96
    dw   $ffff, Music14Channel2

Music14Channel3::
    dw   ChannelDefinition_1e_6e5e
    dw   ChannelDefinition_1e_5a6a
    dw   ChannelDefinition_1e_5a9f
    dw   ChannelDefinition_1e_6e59
    dw   ChannelDefinition_1e_5a3f
    dw   ChannelDefinition_1e_5a96
    dw   $ffff, Music14Channel3

ChannelDefinition_1e_5a3f::
    notelen 2
    note B_1
    note C#2
    note D_2
    note A_1
    note B_1
    note C_2
    end_def

ChannelDefinition_1e_5a47::
    notelen 3
    note B_2
    note C#3
    note D_3
    notelen 4
    note A_3
    note B_1
    notelen 3
    rest
    end_def

ChannelDefinition_1e_5a51::
    note B_2
    note C#3
    note D_3
    notelen 4
    note G#3
    note B_1
    notelen 3
    rest
    note B_2
    note C#3
    note D_3
    notelen 4
    note G_3
    note B_1
    notelen 3
    rest
    note B_2
    note C#3
    note D_3
    notelen 4
    note G#3
    note B_1
    notelen 3
    rest
    end_def

ChannelDefinition_1e_5a6a::
    begin_loop $18
        enable_software_envelope
        notelen 3
        note B_1
        note B_1
        notelen 5
        rest
        notelen 3
        rest
        note B_1
    next_loop

    end_def

ChannelDefinition_1e_5a77::
    begin_loop $0c
        notelen 1
        note F_2
        note A_2
    next_loop

    end_def

ChannelDefinition_1e_5a7e::
    begin_loop $04
        note F_2
        note A_2
    next_loop

    end_def

ChannelDefinition_1e_5a84::
    begin_loop $04
        note E_2
        note G#2
    next_loop

    end_def

ChannelDefinition_1e_5a8a::
    begin_loop $0c
        note D#2
        note G_2
    next_loop

    end_def

ChannelDefinition_1e_5a90::
    begin_loop $04
        note D#2
        note G_2
    next_loop

    end_def

ChannelDefinition_1e_5a96::
    notelen 2
    rest
    notelen 14
    note F_1
    notelen 5
    rest
    notelen 7
    rest
    end_def

ChannelDefinition_1e_5a9f::
    begin_loop $08
        enable_software_envelope
        notelen 3
        note B_1
        note B_1
        rest
        note B_1
        rest
        notelen 4
        note B_2
        notelen 3
        note B_1
    next_loop

    end_def

Music15::
    db   $00
    dw   MusicSpeedData_1e_4abb
    dw   Music15Channel1
    dw   Music15Channel2
    dw   Music15Channel3
    dw   $0000

Music15Channel1::
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5bdf
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5bdf
    dw   ChannelDefinition_1e_5bdf
    dw   ChannelDefinition_1e_5c00
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5c0b
    dw   ChannelDefinition_1e_5c0b
    dw   ChannelDefinition_1e_5c0b
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_5c0b
    dw   $ffff, Music15Channel1

Music15Channel2::
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c2f
    dw   ChannelDefinition_1e_5c2f
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5c2f
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c2f
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c35
    dw   ChannelDefinition_1e_5c35
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5c35
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c35
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c3a
    dw   ChannelDefinition_1e_5c3a
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5c3a
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c3a
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c3f
    dw   ChannelDefinition_1e_5c3f
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5c3f
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c3f
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c2f
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5c2f
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5c2f
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c2f
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c35
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5c35
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5c35
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c35
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c3a
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5c3a
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5c3a
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c3a
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c3f
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5c3f
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5c3f
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c3f
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c2f
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5c2f
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5c2f
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c2f
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c35
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5c35
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5c35
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c35
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c3a
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5c3a
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5c3a
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c3a
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c3f
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5c3f
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5c3f
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c3f
    dw   ChannelDefinition_1e_6d82
    dw   ChannelDefinition_1e_5c44
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5c44
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5c49
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_5c49
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_5c4e
    dw   ChannelDefinition_1e_6e94
    dw   ChannelDefinition_1e_5c4e
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20
    dw   $ffff, Music15Channel2

Music15Channel3::
    dw   ChannelDefinition_1e_5d67
    dw   ChannelDefinition_1e_6d15
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6e63
    dw   ChannelDefinition_1e_5c5e
    dw   ChannelDefinition_1e_6e72
    dw   ChannelDefinition_1e_5c8d
    dw   ChannelDefinition_1e_6e6d
    dw   ChannelDefinition_1e_5ca1
    dw   ChannelDefinition_1e_6e72
    dw   ChannelDefinition_1e_5c8d
    dw   ChannelDefinition_1e_6e6d
    dw   ChannelDefinition_1e_5ca1
    dw   ChannelDefinition_1e_6d18
    dw   ChannelDefinition_1e_6e6d
    dw   ChannelDefinition_1e_5c96
    dw   ChannelDefinition_1e_6e77
    dw   ChannelDefinition_1e_5ca1
    dw   ChannelDefinition_1e_6d18
    dw   $ffff, Music15Channel3

ChannelDefinition_1e_5bdf::
    notelen 5
    rest
    notelen 3
    rest

    begin_loop $04
        notelen 2
        note F_4
    next_loop

    notelen 14
    rest

    begin_loop $04
        notelen 2
        note E_4
    next_loop

    notelen 14
    rest

    begin_loop $04
        notelen 2
        note G_4
    next_loop

    notelen 14
    rest

    begin_loop $04
        notelen 2
        note F#4
    next_loop

    notelen 3
    rest
    end_def

ChannelDefinition_1e_5c00::
    notelen 8
    rest
    notelen 2
    rest
    note A#4
    notelen 8
    rest
    notelen 2
    rest
    note B_4
    end_def

ChannelDefinition_1e_5c0b::
    begin_loop $03
        notelen 2
        note C_1
        note D#1
        note C#1
        note F_1
    next_loop

    set_envelope_duty $a2, $83, 3, 0
    note C_1
    note D#1
    note C#1
    note F_1
    set_envelope_duty $c2, $83, 3, 0
    note C_1
    note D#1
    note C#1
    note F_1
    set_envelope_duty $81, $83, 3, 0

    begin_loop $03
        note C_1
        note D#1
        note C#1
        note F_1
    next_loop

    end_def

ChannelDefinition_1e_5c2f::
    begin_loop $04
        notelen 2
        note B_4
    next_loop

    end_def

ChannelDefinition_1e_5c35::
    begin_loop $04
        note A#4
    next_loop

    end_def

ChannelDefinition_1e_5c3a::
    begin_loop $04
        note C#5
    next_loop

    end_def

ChannelDefinition_1e_5c3f::
    begin_loop $04
        note C_5
    next_loop

    end_def

ChannelDefinition_1e_5c44::
    begin_loop $04
        note E_5
    next_loop

    end_def

ChannelDefinition_1e_5c49::
    begin_loop $04
        note F_5
    next_loop

    end_def

ChannelDefinition_1e_5c4e::
    notelen 2
    note B_2
    note C#3
    note D_3
    note A_3
    notelen 5
    rest
    notelen 2
    rest
    note G#3
    note C#3
    note G#3
    notelen 5
    rest
    rest
    end_def

ChannelDefinition_1e_5c5e::
    enable_software_envelope
    notelen 2
    note B_1
    note C#2
    note D_2
    note A_2
    notelen 14
    rest
    notelen 2
    note B_1
    note C#2
    note D_2
    note G#2
    notelen 14
    rest
    notelen 2
    note C#2
    note D#2
    note E_2
    note B_2
    notelen 14
    rest
    notelen 2
    note C#2
    note D#2
    note E_2
    note A#2
    notelen 14
    rest
    notelen 2
    note F#2
    note G#2
    note A_2
    note E_3
    notelen 4
    rest
    notelen 2
    note G_2
    note A_2
    note A#2
    note F_3

    begin_loop $09
        notelen 4
        rest
    next_loop

    end_def

ChannelDefinition_1e_5c8d::
    notelen 3
    rest
    notelen 2
    note B_4
    note C#5
    note D_5
    note A_5
    notelen 3
    rest

ChannelDefinition_1e_5c96::
    notelen 5
    rest

    begin_loop $03
        notelen 2
        note G#4
        note B_4
        note A#4
        note C_5
    next_loop

    end_def

ChannelDefinition_1e_5ca1::
    notelen 2
    note G#4
    note B_4
    note A#4
    note C_5
    end_def

Music16::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music16Channel1
    dw   Music16Channel2
    dw   Music16Channel3
    dw   $0000

Music16Channel1::
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6dcd
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6d87
    dw   ChannelDefinition_1e_5d75
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6d18
    dw   ChannelDefinition_1e_6d24
    dw   ChannelDefinition_1e_6d24
    dw   ChannelDefinition_1e_6d2d
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6dcd
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6d87
    dw   ChannelDefinition_1e_5d86
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6dcd
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6d24
    dw   ChannelDefinition_1e_6d24
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_5d98
    dw   $ffff, Music16Channel1

Music16Channel2::
    dw   ChannelDefinition_1e_6e45
    dw   ChannelDefinition_1e_5d36
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_5d4d
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6d2d
    dw   ChannelDefinition_1e_6d2d
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_5d6d
    dw   ChannelDefinition_1e_6d2d
    dw   ChannelDefinition_1e_6d2d
    dw   $ffff, Music16Channel2

Music16Channel3::
    dw   ChannelDefinition_1e_6e5e
    dw   ChannelDefinition_1e_5d36
    dw   ChannelDefinition_1e_5d67
    dw   $ffff, Music16Channel3

ChannelDefinition_1e_5d36::
    notelen 4
    note B_1
    notelen 3
    note C#2
    note D_2
    notelen 5
    note A#1

    begin_loop $04
        rest
    next_loop

    notelen 4
    note B_1
    notelen 3
    note C#2
    note D_2
    notelen 5
    note F_2

    begin_loop $04
        rest
    next_loop

    end_def

ChannelDefinition_1e_5d4d::
    notelen 4
    note B_4
    notelen 3
    note C#5
    note D_5
    notelen 4
    note A_5
    note A#4
    notelen 3
    note C_5
    note C#5
    notelen 4
    note G#5
    note F#5
    notelen 3
    note G#5
    note A_5
    notelen 4
    note E_6
    note G_5
    notelen 3
    note A_5
    note A#5
    notelen 4
    note F_6
    end_def

ChannelDefinition_1e_5d67::
    begin_loop $09
        notelen 5
        rest
    next_loop

    end_def

ChannelDefinition_1e_5d6d::
    notelen 10
    note B_3
    note F_4
    note F#4
    note B_4
    note F#4
    note F_4
    end_def

ChannelDefinition_1e_5d75::
    notelen 1
    rest
    notelen 13
    rest
    notelen 3
    rest
    note A_5
    note G#5
    rest
    note A_5
    note G#5
    notelen 4
    rest
    notelen 2
    note A_5
    note G#5
    end_def

ChannelDefinition_1e_5d86::
    notelen 1
    rest
    notelen 13
    rest
    rest
    notelen 3
    rest
    note C_6
    note B_5
    rest
    note C_6
    note B_5
    notelen 4
    rest
    notelen 2
    note C_6
    note B_5
    end_def

ChannelDefinition_1e_5d98::
    notelen 0
    rest
    rest

    begin_loop $03
        notelen 3
        note B_3
        note F_3
    next_loop

    begin_loop $03
        note A#3
        note E_3
    next_loop

    begin_loop $03
        note F#3
        note C_3
    next_loop

    begin_loop $06
        note G_3
        note C#3
    next_loop

    notelen 14
    rest
    end_def

Music17::
    db   $00
    dw   MusicSpeedData_1e_4abb
    dw   Music17Channel1
    dw   Music17Channel2
    dw   Music17Channel3
    dw   $0000

Music17Channel1::
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_5dd6
    dw   $ffff, Music17Channel1

Music17Channel2::
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_5e20
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_5e4d
    dw   ChannelDefinition_1e_6dcd
    dw   ChannelDefinition_1e_5e5f
    dw   $ffff, Music17Channel2

ChannelDefinition_1e_5dd6::
    notelen 3
    rest
    notelen 2
    note B_3
    note C#4
    note D_4
    note A_4
    rest
    note F_5
    note F_5
    notelen 4
    rest
    notelen 2
    rest
    note B_3
    note C#4
    note D_4
    note G#4
    rest
    note E_5
    note E_5
    notelen 4
    rest
    notelen 2
    rest
    note C#4
    note D#4
    note E_4
    note B_4
    rest
    note G_5
    note G_5
    notelen 4
    rest
    notelen 2
    rest
    note C#4
    note D#4
    note E_4
    note A#4
    rest
    note F#5
    note F#5
    notelen 4
    rest
    notelen 2
    rest
    note F#4
    note G#4
    note A_4
    note E_5
    rest
    note A#5
    notelen 3
    rest
    notelen 2
    note G_4
    note A_4
    note A#4
    note F_5
    rest
    note B_5
    notelen 3
    rest
    notelen 2
    note B_4
    note C#5
    note F_6
    note E_6
    note D#6
    note D_6
    notelen 14
    rest
    end_def

ChannelDefinition_1e_5e20::
    notelen 2
    note B_3
    note C#4
    note D_4
    note A_4
    notelen 7
    rest
    notelen 2
    note B_5
    notelen 4
    note B_5
    notelen 2
    note B_3
    note C#4
    note D_4
    note G#4
    notelen 7
    rest
    notelen 2
    note A#5
    notelen 4
    note A#5
    notelen 2
    note C#4
    note D#4
    note E_4
    note B_4
    notelen 7
    rest
    notelen 2
    note C#6
    notelen 4
    note C#6
    notelen 2
    note C#4
    note D#4
    note E_4
    note A#4
    notelen 7
    rest
    notelen 2
    note C_6
    notelen 4
    note C_6
    end_def

ChannelDefinition_1e_5e4d::
    notelen 2
    note F#4
    note G#4
    note A_4
    note E_5
    notelen 7
    rest
    notelen 2
    note E_6
    note G_4
    note A_4
    note A#4
    note F_5
    notelen 7
    rest
    notelen 2
    note F_6
    end_def

ChannelDefinition_1e_5e5f::
    note B_4
    note C#5
    note D_5
    note A_6
    note G#6
    note G_6
    note F#6
    note F_6
    notelen 14
    rest
    end_def

Music13::
Music51::
    db   $00
    dw   MusicSpeedData_1e_4ae8
    dw   Music13Channel1
    dw   Music13Channel2
    dw   Music13Channel3
    dw   $0000

Music13Channel2::
    dw   ChannelDefinition_1e_6daa
    dw   ChannelDefinition_1e_5e9b
    dw   ChannelDefinition_1e_6daf
    dw   ChannelDefinition_1e_5ead
    dw   ChannelDefinition_1e_6db4
    dw   ChannelDefinition_1e_5ebe
    dw   ChannelDefinition_1e_6daf
    dw   ChannelDefinition_1e_5ecf
    dw   $ffff, Music13Channel2

Music13Channel1::
    dw   ChannelDefinition_1e_6d10

MusicLoop_1e_5e8b::
    dw   ChannelDefinition_1e_6d7d
    dw   ChannelDefinition_1e_5e9b
    dw   $ffff, MusicLoop_1e_5e8b

Music13Channel3::
    dw   ChannelDefinition_1e_6e54
    dw   ChannelDefinition_1e_5ee0
    dw   $ffff, Music13Channel3

ChannelDefinition_1e_5e9b::
    notelen 2
    note A_2
    note F#2
    note D#2
    note C_2
    note A_1
    note F#1
    note D#1
    note C#1
    note C_1
    note D#1
    note F#1
    note A_1
    note C_2
    note D#2
    note F#2
    note A_2
    end_def

ChannelDefinition_1e_5ead::
    note A#2
    note F#2
    note D#2
    note C_2
    note A#1
    note F#1
    note D#1
    note C#1
    note C_1
    note D#1
    note F#1
    note A#1
    note C_2
    note D#2
    note F#2
    note A#2
    end_def

ChannelDefinition_1e_5ebe::
    note B_2
    note F#2
    note D#2
    note C_2
    note B_1
    note F#1
    note D#1
    note C#1
    note C_1
    note D#1
    note F#1
    note B_1
    note C_2
    note D#2
    note F#2
    note B_2
    end_def

ChannelDefinition_1e_5ecf::
    note A#2
    note F#2
    note D#2
    note C_2
    note A#1
    note F#1
    note D#1
    note C#1
    note C_1
    note D#1
    note F#1
    note A#1
    note C_2
    note D#2
    note F#2
    note A#2
    end_def

ChannelDefinition_1e_5ee0::
    enable_software_envelope
    notelen 8
    rest
    notelen 2
    rest
    note C_1
    note C_1
    rest
    notelen 8
    rest
    notelen 5
    rest
    rest
    end_def

Music18::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music18Channel1
    dw   Music18Channel2
    dw   $0000
    dw   $0000

Music18Channel1::
    dw   ChannelDefinition_1e_6d10

MusicLoop_1e_5efb::
    dw   ChannelDefinition_1e_6d7d
    dw   ChannelDefinition_1e_5f19
    dw   ChannelDefinition_1e_5f19
    dw   $ffff, MusicLoop_1e_5efb

Music18Channel2::
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_5f19
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_5f2b

MusicLoop_1e_5f0d::
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_5f19
    dw   ChannelDefinition_1e_6e22
    dw   ChannelDefinition_1e_5f2b
    dw   $ffff, MusicLoop_1e_5f0d

ChannelDefinition_1e_5f19::
    notelen 1
    note B_3
    note A_3
    note F#3
    note D#3
    note B_2
    note A_2
    note F#2
    note D#2
    note B_1
    note D#2
    note F#2
    note A_2
    note B_2
    note D#3
    note F#3
    note A_3
    end_def

ChannelDefinition_1e_5f2b::
    note C#4
    note B_3
    note A_3
    note F#3
    note D#3
    note B_2
    note A_2
    note F#2
    note D#2
    note F#2
    note A_2
    note C#3
    note F#3
    note A_3
    note C#4
    note D#4
    end_def

Music19::
    db   $00
    dw   MusicSpeedData_1e_4a9d
    dw   Music19Channel1
    dw   Music19Channel2
    dw   Music19Channel3
    dw   Music19Channel4

Music19Channel1::
    dw   ChannelDefinition_1e_6e4f
    dw   ChannelDefinition_1e_6003
    dw   ChannelDefinition_1e_6dc8
    dw   ChannelDefinition_1e_5f9d
    dw   ChannelDefinition_1e_6e27
    dw   ChannelDefinition_1e_5fbc
    dw   ChannelDefinition_1e_6dc8
    dw   ChannelDefinition_1e_5f9d
    dw   ChannelDefinition_1e_6d20
    dw   $ffff, Music19Channel1

Music19Channel2::
    dw   ChannelDefinition_1e_6e4f
    dw   ChannelDefinition_1e_5ff1
    dw   ChannelDefinition_1e_6dc8
    dw   ChannelDefinition_1e_5fc7
    dw   ChannelDefinition_1e_6e27
    dw   ChannelDefinition_1e_5fe6
    dw   ChannelDefinition_1e_6e8e
    dw   ChannelDefinition_1e_6dc8
    dw   ChannelDefinition_1e_5fc7
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6e7c
    dw   $ffff, Music19Channel2

Music19Channel3::
    dw   ChannelDefinition_1e_6d15
    dw   ChannelDefinition_1e_6e5e
    dw   ChannelDefinition_1e_6015
    dw   ChannelDefinition_1e_6e59
    dw   ChannelDefinition_1e_6022
    dw   ChannelDefinition_1e_6e5e
    dw   ChannelDefinition_1e_6015
    dw   ChannelDefinition_1e_6d20
    dw   $ffff, Music19Channel3

Music19Channel4::
    dw   ChannelDefinition_1e_602d
    dw   ChannelDefinition_1e_6030
    dw   ChannelDefinition_1e_6030
    dw   ChannelDefinition_1e_6048
    dw   ChannelDefinition_1e_6030
    dw   ChannelDefinition_1e_6030
    dw   ChannelDefinition_1e_6053
    dw   $ffff, Music19Channel4

ChannelDefinition_1e_5f9d::
    begin_loop $02
        notelen 2
        note E_2
        note E_2
        note E_2
        note D#2
        notelen 4
        rest
        notelen 7
        note D_2
        note C#2
        notelen 3
        rest
    next_loop

    begin_loop $02
        notelen 2
        note F#2
        note F#2
        note F#2
        note F_2
        notelen 4
        rest
        notelen 7
        note E_2
        note D#2
        notelen 3
        rest
    next_loop

    end_def

ChannelDefinition_1e_5fbc::
    notelen 7
    note B_3
    note A#3
    notelen 2
    note B_3
    note C_4
    note C#4
    notelen 1
    note D_4
    rest
    end_def

ChannelDefinition_1e_5fc7::
    begin_loop $02
        notelen 2
        note B_2
        note B_2
        note B_2
        note A#2
        notelen 4
        rest
        notelen 7
        note A_2
        note G#2
        notelen 3
        rest
    next_loop

    begin_loop $02
        notelen 2
        note C#3
        note C#3
        note C#3
        note C_3
        notelen 4
        rest
        notelen 7
        note B_2
        note A#2
        notelen 3
        rest
    next_loop

    end_def

ChannelDefinition_1e_5fe6::
    notelen 7
    note E_4
    note D#4
    notelen 2
    note E_4
    note F_4
    note F#4
    notelen 1
    note G_4
    rest
    end_def

ChannelDefinition_1e_5ff1::
    notelen 1
    note F_5
    note E_5
    note D#5
    note D_5
    note C#5
    note C_5
    note B_4
    note A#4
    note A_4
    note G#4
    note G_4
    note F#4
    note F_4
    note E_4
    note D#4
    note D_4
    end_def

ChannelDefinition_1e_6003::
    notelen 1
    note D_5
    note C#5
    note C_5
    note B_4
    note A#4
    note A_4
    note G#4
    note G_4
    note F#4
    note F_4
    note E_4
    note D#4
    note D_4
    note C#4
    note C_4
    note B_3
    end_def

ChannelDefinition_1e_6015::
    begin_loop $10
        enable_software_envelope
        notelen 2
        note B_1
        note F#1
    next_loop

    begin_loop $10
        note C#1
        note C#2
    next_loop

    end_def

ChannelDefinition_1e_6022::
    disable_software_envelope
    notelen 7
    note C_3
    note B_2
    notelen 2
    note C_3
    note C#3
    note D_3
    enable_software_envelope
    note D#3
    end_def

ChannelDefinition_1e_602d::
    notelen 5
    rest
    end_def

ChannelDefinition_1e_6030::
    begin_loop $04
        notelen 2
        note NOISE_5
        note NOISE_5
        note NOISE_FF
        rest
    next_loop

    begin_loop $02
        note NOISE_5
        note NOISE_5
        note NOISE_FF
        note NOISE_5
    next_loop

    note NOISE_6
    note NOISE_FF
    note NOISE_5
    note NOISE_FF

    begin_loop $04
        note NOISE_FF
    next_loop

    end_def

ChannelDefinition_1e_6048::
    begin_loop $02
        note NOISE_FF
        note NOISE_6
        note NOISE_6
    next_loop

    begin_loop $04
        note NOISE_FF
    next_loop

    end_def

ChannelDefinition_1e_6053::
    note NOISE_6
    note NOISE_6
    rest
    note NOISE_5
    note NOISE_5
    rest
    note NOISE_FF
    note NOISE_FF

    begin_loop $04
        note NOISE_5
    next_loop

    begin_loop $04
        note NOISE_6
    next_loop

    end_def

Music1b::
    db   $00
    dw   MusicSpeedData_1e_4aac
    dw   Music1bChannel1
    dw   Music1bChannel2
    dw   Music1bChannel3
    dw   $0000

Music1bChannel1::
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_6d24
    dw   ChannelDefinition_1e_6d27
    dw   ChannelDefinition_1e_6087
    dw   $0000

Music1bChannel2::
    dw   ChannelDefinition_1e_6dcd
    dw   ChannelDefinition_1e_6087
    dw   $0000

Music1bChannel3::
    dw   ChannelDefinition_1e_6e77
    dw   ChannelDefinition_1e_6d27
    dw   ChannelDefinition_1e_6087
    dw   $0000

ChannelDefinition_1e_6087::
    begin_loop $02
        notelen 1
        note B_6
        note G#6
        note E_6
        note C#6
        note B_5
        note G#5
        note E_5
        note C#5
        note B_4
        note G#4
        note E_4
        note C#4
        note B_3
        note G#3
        note E_3
        note C#3
        note A#6
        note G_6
        note E_6
        note C_6
        note A#5
        note G_5
        note E_5
        note C_5
        note A#4
        note G_4
        note E_4
        note C_4
        note A#3
        note G_3
        note E_3
        note C_3
    next_loop

    note A#2
    note G_2
    note E_2
    note C_2
    note A#1
    note G_1
    note E_1
    note C_1
    notelen 6
    note B_3
    note F#4
    note A_4
    note C#5
    rest
    notelen 2
    note B_4
    notelen 1
    note D#5
    note F#5
    notelen 5
    note B_5
    rest
    end_def

Music1c::
    db   $00
    dw   MusicSpeedData_1e_4aca
    dw   Music1cChannel1
    dw   Music1cChannel2
    dw   Music1cChannel3
    dw   $0000

Music1cChannel1::
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_6003
    dw   ChannelDefinition_1e_6d10

MusicLoop_1e_60d3::
    dw   ChannelDefinition_1e_60e3
    dw   $ffff, MusicLoop_1e_60d3

Music1cChannel2::
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_6e9d
    dw   ChannelDefinition_1e_5ff1
    dw   $ffff, MusicLoop_1e_60d3

ChannelDefinition_1e_60e3::
    notelen 2
    note G_2
    note B_2
    note D_3
    note F#3
    notelen 3
    note F#5
    rest
    notelen 2
    note B_4
    note G_2
    note B_2
    note D_3
    note B_4
    note C#5
    note D_5
    note E_5
    note F#2
    note C#3
    notelen 3
    note E_5
    note A_4
    note A_5
    notelen 2
    note E_4
    note C#4
    note A_3
    note F#3
    note E_3
    note C#3
    note A_2
    note F#2
    note E_2
    note G_2
    note B_2
    note D_3
    notelen 3
    note D_5
    rest
    notelen 2
    note G_4
    note E_2
    note G_2
    note B_2
    note G_4
    note A_4
    note B_4
    note C#5
    note D_2
    note A_2
    notelen 3
    note C#5
    note F#4
    note F#5
    notelen 2
    note C#4
    note A_3
    note F#3
    note D_3
    note C#3
    note A_2
    note F#2
    note D_2
    end_def

Music1d::
    db   $00
    dw   MusicSpeedData_1e_4aac
    dw   Music1dChannel1
    dw   Music1dChannel2
    dw   Music1dChannel3
    dw   $0000

Music1dChannel1::
    dw   ChannelDefinition_1e_6154
    dw   $ffff, Music1dChannel1

Music1dChannel2::
    dw   ChannelDefinition_1e_618f
    dw   ChannelDefinition_1e_60e3
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_619d
    dw   ChannelDefinition_1e_6196
    dw   ChannelDefinition_1e_61e2
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_6226
    dw   $ffff, Music1dChannel2

Music1dChannel3::
    dw   ChannelDefinition_1e_6e68
    dw   ChannelDefinition_1e_6267
    dw   ChannelDefinition_1e_6e6d
    dw   ChannelDefinition_1e_6267
    dw   $ffff, Music1dChannel3

ChannelDefinition_1e_6154::
    set_envelope_duty $32, $83, 2, 0

    begin_loop $04
        notelen 2
        note B_3
        rest
        note B_3
        note B_3
    next_loop

    begin_loop $04
        note A_3
        rest
        note A_3
        note A_3
    next_loop

    begin_loop $04
        note G_3
        rest
        note G_3
        note G_3
    next_loop

    begin_loop $04
        note F#3
        rest
        note F#3
        note F#3
    next_loop

    begin_loop $04
        note B_2
        rest
        note B_2
        note B_2
    next_loop

    begin_loop $04
        note A_2
        rest
        note A_2
        note A_2
    next_loop

    begin_loop $07
        note A#2
        rest
        note A#2
        note A#2
    next_loop

    note A_2
    rest
    note A_2
    note A_2
    end_def

ChannelDefinition_1e_618f::
    set_envelope_duty $67, $86, 2, 0
    set_transpose -12
    end_def

ChannelDefinition_1e_6196::
    set_envelope_duty $47, $86, 2, 0
    set_transpose -12
    end_def

ChannelDefinition_1e_619d::
    notelen 2
    note G_1
    note B_1
    note D_2
    note F#2
    notelen 3
    note F#4
    notelen 2
    note G_4
    note A_4
    notelen 3
    note B_4
    notelen 2
    note G_1
    note D_2
    note G_2
    note B_2
    note A_4
    note G_4
    note A_4
    note D_1
    note D_2
    note G_4
    notelen 3
    note F#4
    notelen 2
    note E_4
    note D_4
    note D_1
    note F#1
    note A_1
    note D_2
    notelen 4
    note D_4
    notelen 2
    note F_1
    note A#1
    note C_2
    note D_2
    note F_4
    note A#4
    note C_5
    notelen 3
    note D_5
    notelen 2
    note A#1
    note F_1
    note F_2
    note A#2
    note F_3
    note C_5
    note A#4
    notelen 7
    note C_5
    notelen 2
    note G_5
    note E_1
    note A#1
    note C_2
    note G_2
    notelen 7
    note F#5
    notelen 2
    note C_6
    note D#1
    note A_1
    note C_2
    note F#2
    end_def

ChannelDefinition_1e_61e2::
    notelen 2
    note G_2
    note B_2
    note D_3
    note F#3
    notelen 3
    note F#5
    rest
    notelen 2
    note B_4
    note G_2
    note B_2
    note D_3
    rest
    note F#6
    note B_5
    note B_6
    notelen 2
    note A_6
    note C#4
    note D_4
    note E_4
    notelen 3
    note F#4
    notelen 2
    note G_4
    notelen 4
    note A_4
    notelen 2
    note F#3
    note E_3
    note C#3
    note F#3
    note A_3
    note E_3
    note G_3
    note B_3
    note D_4
    notelen 3
    note D_4
    rest
    notelen 2
    note G_3
    note E_2
    note G_2
    note B_2
    note G_3
    note A_3
    note B_3
    note C#4
    note B_2
    note C#3
    note D_3
    note F#3
    notelen 3
    note D_4
    notelen 2
    note E_4
    notelen 7
    note F#4
    notelen 2
    rest
    note B_3
    note D_4
    note F#4
    note G_4
    note A_4
    end_def

ChannelDefinition_1e_6226::
    notelen 4
    note B_3
    notelen 2
    note G_1
    note B_1
    note D_2
    note F#2
    note G_2
    note B_2
    note D_3
    note F#3
    note B_3
    note C#4
    note D_4
    note E_4
    notelen 7
    note A_3
    notelen 2
    note A_4
    note F#2
    note A_2
    note B_2
    note C#3
    note D_3
    note F#5
    note D_5
    note A_5
    note A_6
    note F#2
    note A_2
    note D_3
    notelen 7
    note A#5
    notelen 2
    note A#6
    note F_3
    note A#3
    note C_4
    notelen 3
    note D_4
    notelen 2
    note A#1
    note F_1
    note F_2
    note A#2
    note F_3
    note C_4
    note A#3
    notelen 7
    note C_4
    notelen 2
    note G_4
    note E_2
    note F_2
    note G_2
    note A#2
    notelen 7
    note F#4
    notelen 2
    note C_5
    note D#3
    note F#3
    note A_3
    note C_4
    end_def

ChannelDefinition_1e_6267::
    begin_loop $04
        enable_software_envelope
        notelen 2
        note G_3
        rest
        note G_3
        note G_3
    next_loop

    begin_loop $04
        note F#3
        rest
        note F#3
        note F#3
    next_loop

    begin_loop $04
        note E_3
        rest
        note E_3
        note E_3
    next_loop

    begin_loop $04
        note B_2
        rest
        note B_2
        note B_2
    next_loop

    begin_loop $04
        note G_2
        rest
        note G_2
        note G_2
    next_loop

    begin_loop $04
        note F#2
        rest
        note F#2
        note F#2
    next_loop

    begin_loop $04
        note F_2
        rest
        note F_2
        note F_2
    next_loop

    begin_loop $02
        note E_2
        rest
        note E_2
        note E_2
    next_loop

    begin_loop $02
        note D#2
        rest
        note D#2
        note D#2
    next_loop

    end_def

Music1e::
    db   $00
    dw   MusicSpeedData_1e_4abb
    dw   Music1eChannel1
    dw   Music1eChannel2
    dw   Music1eChannel3
    dw   $0000

Music1eChannel1::
    dw   ChannelDefinition_1e_6d7d
    dw   ChannelDefinition_1e_6d10
    dw   ChannelDefinition_1e_62f2
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_62f2
    dw   ChannelDefinition_1e_6304
    dw   ChannelDefinition_1e_6d2d
    dw   ChannelDefinition_1e_6ea8
    dw   ChannelDefinition_1e_6d7d
    dw   ChannelDefinition_1e_5147
    dw   ChannelDefinition_1e_5147
    dw   ChannelDefinition_1e_5147
    dw   ChannelDefinition_1e_6d20
    dw   $0000

Music1eChannel2::
    dw   ChannelDefinition_1e_6df0
    dw   ChannelDefinition_1e_62f2
    dw   ChannelDefinition_1e_6de1
    dw   ChannelDefinition_1e_6e94
    dw   ChannelDefinition_1e_62f2
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_6304
    dw   ChannelDefinition_1e_6e22
    dw   ChannelDefinition_1e_6ea8
    dw   ChannelDefinition_1e_5147
    dw   ChannelDefinition_1e_6dcd
    dw   ChannelDefinition_1e_5147
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_5147
    dw   ChannelDefinition_1e_6d20
    dw   $0000

ChannelDefinition_1e_62f2::
    notelen 1
    note A#2
    note C#3
    note F_3
    note A_3
    note A#3
    note C#4
    note F_4
    note A_4
    note A_2
    note C_3
    note E_3
    note G#3
    note A_3
    note G#3
    note E_3
    note C_3
    end_def

ChannelDefinition_1e_6304::
    notelen 1
    note D#3
    note F#3
    note A#3
    note D_4
    note D#4
    note F#4
    note A#4
    note D_5
    end_def

Music4b::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music4bChannel1
    dw   Music4bChannel2
    dw   Music4bChannel3
    dw   $0000

Music4bChannel1::
    dw   ChannelDefinition_1e_6da0
    dw   ChannelDefinition_1e_63c7
    dw   ChannelDefinition_1e_6e3b
    dw   ChannelDefinition_1e_63e7
    dw   ChannelDefinition_1e_6da0
    dw   ChannelDefinition_1e_6418
    dw   $ffff, Music4bChannel1

Music4bChannel2::
    dw   ChannelDefinition_1e_6daa
    dw   ChannelDefinition_1e_6365
    dw   ChannelDefinition_1e_6daa
    dw   ChannelDefinition_1e_6365
    dw   ChannelDefinition_1e_6daa
    dw   ChannelDefinition_1e_638b
    dw   ChannelDefinition_1e_6daa
    dw   ChannelDefinition_1e_6365
    dw   ChannelDefinition_1e_6daa
    dw   ChannelDefinition_1e_6365
    dw   ChannelDefinition_1e_6daa
    dw   ChannelDefinition_1e_6365
    dw   ChannelDefinition_1e_6daa
    dw   ChannelDefinition_1e_638b
    dw   ChannelDefinition_1e_6daf
    dw   ChannelDefinition_1e_63a9
    dw   ChannelDefinition_1e_6daa
    dw   ChannelDefinition_1e_638b
    dw   ChannelDefinition_1e_6daf
    dw   ChannelDefinition_1e_63a9
    dw   $ffff, Music4bChannel2

Music4bChannel3::
    dw   ChannelDefinition_1e_6e6d
    dw   ChannelDefinition_1e_6433
    dw   ChannelDefinition_1e_6e6d
    dw   ChannelDefinition_1e_6454
    dw   ChannelDefinition_1e_6e6d
    dw   ChannelDefinition_1e_645a
    dw   $ffff, Music4bChannel3

ChannelDefinition_1e_6365::
    notelen 2
    note C_1
    note F#1
    note C#1
    note F_1
    rest
    note C#1
    set_envelope_duty $92, $00, 3, 0
    note C_1
    note F#1
    note C#1
    note F_1
    rest
    note C#1
    set_envelope_duty $b2, $00, 3, 0
    note C_1
    note F#1
    note C#1
    note F_1
    rest
    note C#1
    set_envelope_duty $92, $00, 3, 0
    note C_1
    note F#1
    note C#1
    note F_1
    rest
    note C#1
    end_def

ChannelDefinition_1e_638b::
    begin_loop $02
        note C_1
        note F#1
        note C#1
        note F_1
        rest
        note C#1
    next_loop

    set_envelope_duty $92, $00, 3, 0
    note C_1
    note F#1
    note C#1
    note F_1
    rest
    note C#1
    set_envelope_duty $b2, $00, 3, 0
    note C_1
    note F#1
    note C#1
    note F_1
    rest
    note C#1
    end_def

ChannelDefinition_1e_63a9::
    note C_1
    note F#1
    note C#1
    note F_1
    rest
    note C#1
    set_envelope_duty $92, $00, 3, 0
    note C_1
    note F#1
    note C#1
    note F_1
    rest
    note C#1
    set_envelope_duty $62, $00, 3, 0

    begin_loop $02
        note C_1
        note F#1
        note C#1
        note F_1
        rest
        note C#1
    next_loop

    end_def

ChannelDefinition_1e_63c7::
    notelen 14
    rest
    rest

    begin_loop $02
        notelen 1
        note C_3
        note C_3
        note C_3
        note C_3
        note C#3
        note C_3
        notelen 2
        note C_3
        notelen 14
        rest
        notelen 8
        rest
        notelen 2
        rest
        note C_4
        notelen 1
        note C_3
        note C_3
        notelen 7
        rest
        notelen 5
        rest
        notelen 14
        rest
    next_loop

    end_def

ChannelDefinition_1e_63e7::
    notelen 1
    rest
    note D#4
    note F_4
    note F#4
    note C#5
    notelen 3
    note A#4
    notelen 1
    note A#4
    note C_5
    rest
    notelen 14
    rest
    notelen 4
    rest
    notelen 1
    note D#5
    note C_5
    note A#4
    note A_4
    notelen 14
    rest
    notelen 9
    note A_2
    notelen 0
    rest
    notelen 1
    note A_2
    notelen 7
    rest
    notelen 5
    rest
    notelen 1
    note C_5
    note A#4
    note E_4
    note D#4
    notelen 5
    rest
    rest
    notelen 4
    rest
    notelen 2
    note B_2
    notelen 1
    note C_3
    rest
    end_def

ChannelDefinition_1e_6418::
    notelen 1
    note A_2
    note A_2
    note A_2
    note A_2
    note A#2
    note A_2
    notelen 2
    note A_2
    notelen 14
    rest
    notelen 5
    rest
    notelen 1
    note E_2
    note E_2
    note E_2
    note E_2
    note F_2
    note E_2
    notelen 2
    note E_2
    notelen 5
    rest
    notelen 14
    rest
    end_def

ChannelDefinition_1e_6433::
    enable_software_envelope
    notelen 14
    rest
    rest

    begin_loop $02
        notelen 1
        note A#2
        note A#2
        note A#2
        note A#2
        note B_2
        note A#2
        notelen 2
        note A#2
        notelen 14
        rest
        notelen 8
        rest
        notelen 2
        rest
        note A#3
        notelen 1
        note A#2
        note A#2
        notelen 7
        rest
        notelen 14
        rest
        notelen 5
        rest
    next_loop

    end_def

ChannelDefinition_1e_6454::
    begin_loop $0c
        notelen 8
        rest
    next_loop

    end_def

ChannelDefinition_1e_645a::
    notelen 1
    note F_2
    note F_2
    note F_2
    note F_2
    note F#2
    note F_2
    note F_2
    rest
    notelen 5
    rest
    notelen 14
    rest
    notelen 1
    note C_2
    note C_2
    note C_2
    note C_2
    note C#3
    note C_2
    note C_2
    rest
    notelen 5
    rest
    notelen 14
    rest
    end_def

Music1f::
    db   $00
    dw   MusicSpeedData_1e_4abb
    dw   Music1fChannel1
    dw   Music1fChannel2
    dw   Music1fChannel3
    dw   Music1fChannel4

Music1fChannel1::
    dw   ChannelDefinition_1e_6e7f
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_64c0
    dw   ChannelDefinition_1e_64c0

MusicLoop_1e_6488::
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_64c0
    dw   ChannelDefinition_1e_64d7
    dw   ChannelDefinition_1e_64e0
    dw   ChannelDefinition_1e_64e9
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_64f2
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_64fb
    dw   ChannelDefinition_1e_6e1d
    dw   ChannelDefinition_1e_6504
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_650d
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_6516
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_651f
    dw   ChannelDefinition_1e_6e1d
    dw   ChannelDefinition_1e_6528
    dw   ChannelDefinition_1e_6542
    dw   $ffff, MusicLoop_1e_6488

Music1fChannel2::
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20

MusicLoop_1e_64b8::
    dw   ChannelDefinition_1e_6e2c
    dw   ChannelDefinition_1e_654b
    dw   $ffff, MusicLoop_1e_64b8

ChannelDefinition_1e_64c0::
    notelen 3
    note G_2
    note C_3
    note B_2
    note C_3
    note D#3
    note C_3
    note B_2
    note C_3
    end_def

ChannelDefinition_1e_64ca::
    begin_loop $02
        notelen 2
        note G_2
        note C_3
        note B_2
        note C_3
        note D#3
        note C_3
        note B_2
        note C_3
    next_loop

    end_def

ChannelDefinition_1e_64d7::
    note G#2
    note C_3
    note B_2
    note C_3
    note D#3
    note C_3
    note B_2
    note C_3
    end_def

ChannelDefinition_1e_64e0::
    note G#2
    note D_3
    note C_3
    note D_3
    note F_3
    note D_3
    note C_3
    note D_3
    end_def

ChannelDefinition_1e_64e9::
    note G_2
    note D#3
    note D_3
    note D#3
    note G_3
    note D#3
    note D_3
    note D#3
    end_def

ChannelDefinition_1e_64f2::
    note C_3
    note D#3
    note D_3
    note D#3
    note G#3
    note D#3
    note D_3
    note D#3
    end_def

ChannelDefinition_1e_64fb::
    note G#2
    note D_3
    note C_3
    note D_3
    note F_3
    note D_3
    note C_3
    note D_3
    end_def

ChannelDefinition_1e_6504::
    note A#2
    note D_3
    note C_3
    note D_3
    note F_3
    note D_3
    note C_3
    note D_3
    end_def

ChannelDefinition_1e_650d::
    note A#2
    note D#3
    note D_3
    note D#3
    note G_3
    note D#3
    note D_3
    note D#3
    end_def

ChannelDefinition_1e_6516::
    note G#2
    note D#3
    note D_3
    note D#3
    note G#3
    note D#3
    note D_3
    note D#3
    end_def

ChannelDefinition_1e_651f::
    note A_2
    note D_3
    note C_3
    note D_3
    note F#3
    note D_3
    note C_3
    note D_3
    end_def

ChannelDefinition_1e_6528::
    note G_2
    note D_3
    note C_3
    note D_3
    note G_3
    note D_3
    note C_3
    note D_3
    end_def

ChannelDefinition_1e_6531::
    note B_2
    note D_3
    note F_3
    note G#3
    note B_3
    note D_4
    note F_4
    note G#4
    note G_4
    note F_4
    note D_4
    note B_3
    note G_3
    note F_3
    note D_3
    note B_2
    end_def

ChannelDefinition_1e_6542::
    note B_2
    note D_3
    note F_3
    note G#3
    note B_3
    note D_4
    note F_4
    note G#4
    end_def

ChannelDefinition_1e_654b::
    begin_loop $02
        notelen 3
        note C_4
        note D_4
        notelen 14
        note D#4
    next_loop

    notelen 5
    note D_4
    note B_3
    notelen 14
    note C_4
    notelen 4
    rest
    notelen 3
    note C_4
    note D_4
    notelen 14
    note D#4
    notelen 3
    note D_4
    note D#4
    notelen 5
    note F_4
    notelen 4
    rest
    notelen 3
    note A#3
    note D_4
    notelen 5
    note F_4
    notelen 4
    note G#4
    notelen 14
    note G_4
    notelen 4
    rest
    notelen 5
    note F_4
    note F_4
    note F#4
    note F#4
    note G_4
    note G_4
    rest
    rest
    end_def

Music58::
    db   $00
    dw   MusicSpeedData_1e_4ae8
    dw   Music58Channel1
    dw   Music58Channel2
    dw   Music58Channel3
    dw   $0000

Music58Channel1::
    dw   ChannelDefinition_1e_6d24

MusicLoop_1e_6588::
    dw   ChannelDefinition_1e_6d7d
    dw   ChannelDefinition_1e_64ca
    dw   ChannelDefinition_1e_64d7
    dw   ChannelDefinition_1e_64d7
    dw   ChannelDefinition_1e_64e0
    dw   ChannelDefinition_1e_64e0
    dw   ChannelDefinition_1e_64e9
    dw   ChannelDefinition_1e_64e9
    dw   ChannelDefinition_1e_64f2
    dw   ChannelDefinition_1e_64f2
    dw   ChannelDefinition_1e_64fb
    dw   ChannelDefinition_1e_64fb
    dw   ChannelDefinition_1e_6504
    dw   ChannelDefinition_1e_6504
    dw   ChannelDefinition_1e_650d
    dw   ChannelDefinition_1e_650d
    dw   ChannelDefinition_1e_6516
    dw   ChannelDefinition_1e_6516
    dw   ChannelDefinition_1e_651f
    dw   ChannelDefinition_1e_651f
    dw   ChannelDefinition_1e_6528
    dw   ChannelDefinition_1e_6528
    dw   ChannelDefinition_1e_6531
    dw   $ffff, MusicLoop_1e_6588

Music58Channel2::
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_64ca
    dw   ChannelDefinition_1e_64d7
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_64d7
    dw   ChannelDefinition_1e_6dcd
    dw   ChannelDefinition_1e_64e0
    dw   ChannelDefinition_1e_6dfa
    dw   ChannelDefinition_1e_64e0
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_64e9
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_64e9
    dw   ChannelDefinition_1e_64f2
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_64f2
    dw   ChannelDefinition_1e_6dcd
    dw   ChannelDefinition_1e_64fb
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_64fb
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_6504
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_6504
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_650d
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_650d
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_6516
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_6516
    dw   ChannelDefinition_1e_6dcd
    dw   ChannelDefinition_1e_651f
    dw   ChannelDefinition_1e_6dfa
    dw   ChannelDefinition_1e_651f
    dw   ChannelDefinition_1e_6528
    dw   ChannelDefinition_1e_6de6
    dw   ChannelDefinition_1e_6528
    dw   ChannelDefinition_1e_6dcd
    dw   ChannelDefinition_1e_6531
    dw   $ffff, Music58Channel2

Music21::
    db   $00
    dw   MusicSpeedData_1e_4ae8
    dw   Music21Channel1
    dw   Music21Channel2
    dw   Music21Channel3
    dw   $0000

Music21Channel2::
    dw   ChannelDefinition_1e_6df5
    dw   ChannelDefinition_1e_6625
    dw   ChannelDefinition_1e_6d20
    dw   $ffff, Music21Channel2

ChannelDefinition_1e_6625::
    notelen 2
    note C_1
    note F#1
    note F_1
    notelen 7
    rest
    notelen 6
    rest
    notelen 1
    note C_1
    notelen 2
    note C_1
    note F#1
    notelen 1
    note F_1
    note B_1
    end_def

Music22::
    db   $00
    dw   MusicSpeedData_1e_4abb
    dw   Music22Channel1
    dw   Music22Channel2
    dw   Music22Channel3
    dw   $0000

Music22Channel1::
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_6d24
    dw   ChannelDefinition_1e_6d10

MusicLoop_1e_6647::
    dw   ChannelDefinition_1e_6653
    dw   $ffff, MusicLoop_1e_6647

Music22Channel2::
    dw   ChannelDefinition_1e_6dcd
    dw   $ffff, MusicLoop_1e_6647

ChannelDefinition_1e_6653::
    notelen 3
    note C_3
    note A#3
    note G_4
    note D_5
    note G_5
    rest
    notelen 3
    note A#2
    note G#3
    note F_4
    note C_5
    note F_5
    rest
    end_def

Music24::
    db   $00
    dw   MusicSpeedData_1e_4aca
    dw   Music24Channel1
    dw   Music24Channel2
    dw   Music24Channel3
    dw   $0000

Music24Channel1::
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_6d10
    dw   ChannelDefinition_1e_6685
    dw   ChannelDefinition_1e_669b

MusicLoop_1e_6675::
    dw   ChannelDefinition_1e_66ab
    dw   $ffff, MusicLoop_1e_6675

Music24Channel2::
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_6685

MusicLoop_1e_667f::
    dw   ChannelDefinition_1e_668f
    dw   $ffff, MusicLoop_1e_667f

ChannelDefinition_1e_6685::
    notelen 1
    note A#6
    note A_6
    note F_6
    note C#6
    note A#5
    note A_5
    note F_5
    note C#5
    end_def

ChannelDefinition_1e_668f::
    begin_loop $03
        notelen 7
        note A_5
        rest
    next_loop

    notelen 2
    note A_5
    note A_5
    notelen 4
    rest
    end_def

ChannelDefinition_1e_669b::
    notelen 4
    rest
    notelen 6
    rest

    begin_loop $02
        notelen 7
        note F_4
        rest
    next_loop

    notelen 2
    note F_4
    note F_4
    notelen 4
    rest
    end_def

ChannelDefinition_1e_66ab::
    begin_loop $03
        notelen 7
        note F_4
        rest
    next_loop

    notelen 2
    note F_4
    note F_4
    notelen 4
    rest
    end_def

Music53::
    db   $00
    dw   MusicSpeedData_1e_4aca
    dw   Music53Channel1
    dw   Music53Channel2
    dw   Music53Channel3
    dw   $0000

Music53Channel1::
    dw   ChannelDefinition_1e_6d7d
    dw   ChannelDefinition_1e_6d10
    dw   ChannelDefinition_1e_66f6
    dw   ChannelDefinition_1e_6ea4
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_6745
    dw   ChannelDefinition_1e_6ea8
    dw   $ffff, Music53Channel1

Music53Channel2::
    dw   ChannelDefinition_1e_6da0
    dw   ChannelDefinition_1e_66f6
    dw   ChannelDefinition_1e_6d10
    dw   ChannelDefinition_1e_6ea4
    dw   ChannelDefinition_1e_6dbe
    dw   ChannelDefinition_1e_6719
    dw   ChannelDefinition_1e_6ea8
    dw   $ffff, Music53Channel2

Music53Channel3::
    dw   ChannelDefinition_1e_6d10
    dw   ChannelDefinition_1e_6d18
    dw   ChannelDefinition_1e_6ea4
    dw   ChannelDefinition_1e_6e68
    dw   ChannelDefinition_1e_6700
    dw   ChannelDefinition_1e_6ea8
    dw   $ffff, Music53Channel3

ChannelDefinition_1e_66f6::
    notelen 1
    note A#6
    note A_6
    note F_6
    note C#6
    note A#5
    note A_5
    note F_5
    note C#5
    end_def

ChannelDefinition_1e_6700::
    begin_loop $02
        notelen 3
        rest
        notelen 6
        note G_6
        notelen 1
        rest
        notelen 14
        rest
        rest
        rest
        notelen 5
        rest
    next_loop

    notelen 3
    rest
    notelen 6
    note G_6
    notelen 1
    rest
    notelen 14
    rest
    rest
    end_def

ChannelDefinition_1e_6719::
    set_envelope_duty $61, $86, 2, 0

    begin_loop $02
        notelen 3
        note C#5
        note D#5
        note E_5
        note E_6
        notelen 5
        rest
        notelen 3
        rest
        note D#6
        note C#6
        note E_5
        notelen 5
        rest
    next_loop

    notelen 3
    note C#5
    note D#5
    note E_5
    rest
    rest
    note D#5
    note C#5
    note G_4
    note A#4
    note C#5
    notelen 8
    rest
    notelen 3
    note D#5
    note E_5
    note F#5
    note G_5
    note G_6
    notelen 14
    rest
    rest
    end_def

ChannelDefinition_1e_6745::
    begin_loop $04
        notelen 2
        note F_4
        note A_4
        note C#4
        note E_4
        note F_4
        note E_4
        note C#4
        note A_3
    next_loop

    begin_loop $04
        note E_4
        note G_4
        note B_3
        note D#4
        note E_4
        note G_4
        note B_4
        note D#5
    next_loop

    begin_loop $04
        note D#4
        note G_4
        note A#3
        note C#4
        note D#4
        note C#4
        note A#3
        note G_3
    next_loop

    begin_loop $03
        note E_4
        note G_4
        note B_3
        note D#4
        note E_4
        note G_4
        note B_4
        note D#5
    next_loop

    note E_4
    note G_4
    note B_3
    note D#4
    end_def

Music26::
    db   $00
    dw   MusicSpeedData_1e_4aca
    dw   Music26Channel1
    dw   Music26Channel2
    dw   Music26Channel3
    dw   $0000

Music26Channel1::
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_5dd6
    dw   $ffff, Music26Channel1

Music26Channel2::
    dw   ChannelDefinition_1e_6e13
    dw   ChannelDefinition_1e_6e9a
    dw   $ffff, MusicLoop_1e_6792

MusicLoop_1e_6792::
    dw   ChannelDefinition_1e_5e20
    dw   ChannelDefinition_1e_5e4d
    dw   ChannelDefinition_1e_5e5f
    dw   $ffff, MusicLoop_1e_6792

Music5b::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music5bChannel1
    dw   Music5bChannel2
    dw   Music5bChannel3
    dw   $0000

Music5bChannel1::
    dw   ChannelDefinition_1e_6d10

MusicLoop_1e_67a9::
    dw   ChannelDefinition_1e_6d78
    dw   ChannelDefinition_1e_68db
    dw   ChannelDefinition_1e_68db
    dw   ChannelDefinition_1e_68db
    dw   ChannelDefinition_1e_68db
    dw   ChannelDefinition_1e_68db
    dw   ChannelDefinition_1e_68db
    dw   ChannelDefinition_1e_6d78
    dw   ChannelDefinition_1e_68db
    dw   ChannelDefinition_1e_68db
    dw   ChannelDefinition_1e_6d7d
    dw   ChannelDefinition_1e_6897
    dw   ChannelDefinition_1e_6d78
    dw   ChannelDefinition_1e_68db
    dw   ChannelDefinition_1e_68c4
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20
    dw   $ffff, MusicLoop_1e_67a9

Music5bChannel3::
    dw   ChannelDefinition_1e_6973
    dw   ChannelDefinition_1e_6e68
    dw   ChannelDefinition_1e_6856
    dw   ChannelDefinition_1e_6e6d
    dw   ChannelDefinition_1e_6856
    dw   ChannelDefinition_1e_6e68
    dw   ChannelDefinition_1e_6825
    dw   ChannelDefinition_1e_6e77
    dw   ChannelDefinition_1e_6825
    dw   ChannelDefinition_1e_6e68
    dw   ChannelDefinition_1e_6839
    dw   ChannelDefinition_1e_6e6d
    dw   ChannelDefinition_1e_6866
    dw   ChannelDefinition_1e_6e68
    dw   ChannelDefinition_1e_6873
    dw   ChannelDefinition_1e_6e6d
    dw   ChannelDefinition_1e_687f
    dw   ChannelDefinition_1e_6e77
    dw   ChannelDefinition_1e_688b
    dw   $ffff, Music5bChannel3

Music5bChannel2::
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_68fc
    dw   ChannelDefinition_1e_68fc
    dw   ChannelDefinition_1e_68fc
    dw   ChannelDefinition_1e_68fc
    dw   ChannelDefinition_1e_68fc
    dw   ChannelDefinition_1e_68fc
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_68fc
    dw   ChannelDefinition_1e_68fc
    dw   ChannelDefinition_1e_6897
    dw   ChannelDefinition_1e_68fc
    dw   ChannelDefinition_1e_6e0e
    dw   ChannelDefinition_1e_68c4
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_6935
    dw   ChannelDefinition_1e_6d78
    dw   ChannelDefinition_1e_6965
    dw   $ffff, Music5bChannel2

ChannelDefinition_1e_6825::
    notelen 3
    note D#4
    note C#5
    note C_5
    note F#5
    notelen 4
    rest
    notelen 2
    rest
    note C#5
    note C_5
    note D#4
    notelen 3
    note D_4
    note B_4
    note A#4
    note F_5
    notelen 5
    rest
    end_def

ChannelDefinition_1e_6839::
    notelen 3
    note C#4
    note A_4
    note G#4
    note E_5
    notelen 5
    rest
    notelen 3
    note C_4
    note G#4
    note G_4
    note D#5
    notelen 5
    rest
    notelen 3
    note B_3
    note G_4
    note F#4
    note D_5
    notelen 5
    rest
    notelen 3
    note C_4
    note G#4
    note G_4
    note D#5
    notelen 5
    rest
    end_def

ChannelDefinition_1e_6856::
    enable_software_envelope
    notelen 3
    note C#4
    note A_4
    note G#4
    note E_5
    notelen 5
    rest
    notelen 3
    note C_4
    note G#4
    note G_4
    note D#5
    notelen 5
    rest
    end_def

ChannelDefinition_1e_6866::
    disable_software_envelope
    notelen 2
    note B_2
    note C#3
    note D_3
    note A_3
    note B_3
    note C#4
    note D_4
    note A_4
    notelen 5
    rest
    end_def

ChannelDefinition_1e_6873::
    notelen 2
    note B_2
    note C#3
    note D_3
    note G#3
    note B_3
    note C#4
    note D_4
    note G#4
    notelen 5
    rest
    end_def

ChannelDefinition_1e_687f::
    notelen 2
    note C#3
    note D#3
    note E_3
    note B_3
    note C#4
    note D#4
    note E_4
    note B_4
    notelen 5
    rest
    end_def

ChannelDefinition_1e_688b::
    notelen 2
    note C#3
    note D#3
    note E_3
    note A#3
    note C#4
    note D#4
    note E_4
    note A#4
    notelen 5
    rest
    end_def

ChannelDefinition_1e_6897::
    begin_loop $02
        notelen 2
        rest
        note D#3
        note F_3
        note D#3
        note F_3
        notelen 7
        rest
    next_loop

    begin_loop $02
        notelen 2
        rest
        note D_3
        note F_3
        note D_3
        note F_3
        notelen 7
        rest
    next_loop

    begin_loop $02
        notelen 2
        rest
        note D#3
        note F_3
        note F#3
        note A#3
        notelen 7
        rest
    next_loop

    begin_loop $02
        notelen 2
        rest
        note D_3
        note F_3
        note F#3
        note D_4
        notelen 7
        rest
    next_loop

    end_def

ChannelDefinition_1e_68c4::
    begin_loop $02
        note F#3
        note D_3
        note F#3
        note G_3
        note A#3
        note B_3
        note A#3
        note A_3
    next_loop

    begin_loop $02
        note C_3
        note D#3
        note G_3
        note G#3
        note B_3
        note C_4
        note B_3
        note G#3
    next_loop

    end_def

ChannelDefinition_1e_68db::
    notelen 2
    note A_3
    note C#4
    note C_4
    note C#4
    set_envelope_duty $20, $00, 2, 0

    begin_loop $03
        notelen 2
        note A_3
        note C#4
        note C_4
        note C#4
    next_loop

    begin_loop $03
        note G#3
        note B_3
        note C_4
        note B_3
    next_loop

    set_envelope_duty $10, $00, 2, 0
    note G#3
    note B_3
    note C_4
    note B_3
    end_def

ChannelDefinition_1e_68fc::
    notelen 2
    note A_3
    note C#4
    note C_4
    note C#4
    set_envelope_duty $37, $00, 2, 0
    note A_3
    note C#4
    note C_4
    note C#4
    set_envelope_duty $53, $00, 2, 0
    note A_3
    note C#4
    note C_4
    note C#4
    set_envelope_duty $64, $00, 2, 0
    note A_3
    note C#4
    note C_4
    note C#4
    set_envelope_duty $53, $00, 2, 0
    note G#3
    note B_3
    note C_4
    note B_3
    set_envelope_duty $37, $00, 2, 0
    note G#3
    note B_3
    note C_4
    note B_3
    set_envelope_duty $27, $00, 2, 0

    begin_loop $02
        note G#3
        note B_3
        note C_4
        note B_3
    next_loop

    end_def

ChannelDefinition_1e_6935::
    notelen 2
    rest
    note B_2
    note C#3
    note D_3
    note A_3
    note B_3
    note C#4
    note D_4
    note B_4
    note C#5
    note D_5
    note A_5
    notelen 4
    rest
    notelen 2
    rest
    note B_2
    note C#3
    note D_3
    note G#3
    note B_3
    note C#4
    note D_4
    note B_4
    note C#5
    note D_5
    note G#5
    notelen 4
    rest
    notelen 2
    rest
    note C#3
    note D#3
    note E_3
    note B_3
    note C#4
    note D#4
    note E_4
    note C#5
    note D#5
    note E_5
    note B_5
    notelen 4
    rest
    notelen 2
    rest
    end_def

ChannelDefinition_1e_6965::
    note C#3
    note D#3
    note E_3
    note A#3
    note C#4
    note D#4
    note E_4
    note C#5
    note D#5
    note E_5
    note A#5
    notelen 4
    rest
    end_def

ChannelDefinition_1e_6973::
    begin_loop $18
        notelen 5
        rest
    next_loop

    end_def

Music4c::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music4cChannel1
    dw   Music4cChannel2
    dw   Music4cChannel3
    dw   $0000

Music4cChannel1::
    dw   ChannelDefinition_1e_6dff
    dw   ChannelDefinition_1e_69a2
    dw   ChannelDefinition_1e_6e4a
    dw   ChannelDefinition_1e_69b4
    dw   $0000

Music4cChannel2::
    dw   ChannelDefinition_1e_6dff
    dw   ChannelDefinition_1e_69b7
    dw   ChannelDefinition_1e_6e4a
    dw   ChannelDefinition_1e_69c9
    dw   $0000

Music4cChannel3::
    dw   ChannelDefinition_1e_6e54
    dw   ChannelDefinition_1e_69cc
    dw   ChannelDefinition_1e_6e59
    dw   ChannelDefinition_1e_69da
    dw   $0000

ChannelDefinition_1e_69a2::
    notelen 1
    rest
    notelen 4
    rest
    notelen 3
    note C#2
    note D#2
    notelen 8
    note E_2
    notelen 3
    rest
    note E_2
    note F#2
    notelen 7
    note G#2
    notelen 2
    note A#2
    end_def

ChannelDefinition_1e_69b4::
    notelen 14
    note C_2
    end_def

ChannelDefinition_1e_69b7::
    notelen 1
    rest
    notelen 4
    rest
    notelen 3
    note A#2
    note B_2
    notelen 8
    note C#3
    notelen 3
    rest
    note C#3
    note D#3
    notelen 7
    note E_3
    notelen 2
    note F#3
    end_def

ChannelDefinition_1e_69c9::
    notelen 14
    note G#3
    end_def

ChannelDefinition_1e_69cc::
    begin_loop $02
        enable_software_envelope
        notelen 1
        note F#1
        disable_software_envelope
        notelen 5
        note F#1
        notelen 3
        note F#1
        notelen 6
        rest
    next_loop

    end_def

ChannelDefinition_1e_69da::
    notelen 1
    rest
    notelen 14
    note A_1
    end_def

Music4d::
    db   $00
    dw   MusicSpeedData_1e_4ae8
    dw   Music4dChannel1
    dw   Music4dChannel2
    dw   Music4dChannel3
    dw   $0000

Music4dChannel1::
    dw   ChannelDefinition_1e_6d7d
    dw   ChannelDefinition_1e_6d10
    dw   ChannelDefinition_1e_6a08
    dw   $ffff, MusicLoop_1e_69f8

Music4dChannel2::
    dw   ChannelDefinition_1e_6d87
    dw   ChannelDefinition_1e_6a08

MusicLoop_1e_69f8::
    dw   ChannelDefinition_1e_6a12
    dw   $ffff, MusicLoop_1e_6d30

Music4dChannel3::
    dw   ChannelDefinition_1e_6d18
    dw   ChannelDefinition_1e_6e77
    dw   ChannelDefinition_1e_6a1c
    dw   $ffff, MusicLoop_1e_6d30

ChannelDefinition_1e_6a08::
    notelen 1
    note D#6
    note B_5
    note G#5
    note E_5
    note D#5
    note B_4
    note G#4
    note D#4
    end_def

ChannelDefinition_1e_6a12::
    notelen 1
    note F_4
    note A_4
    note C_5
    note E_5
    note F_5
    note A_5
    note C_6
    note E_6
    end_def

ChannelDefinition_1e_6a1c::
    enable_software_envelope
    notelen 2
    note F_4
    note F_4
    end_def

Music4e::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music4eChannel1
    dw   Music4eChannel2
    dw   Music4eChannel3
    dw   $0000

Music4eChannel2::
    dw   ChannelDefinition_1e_6da0
    dw   ChannelDefinition_1e_6a9b
    dw   ChannelDefinition_1e_6aa5

MusicLoop_1e_6a32::
    dw   ChannelDefinition_1e_6eb0
    dw   ChannelDefinition_1e_6d96
    dw   ChannelDefinition_1e_6aa8
    dw   ChannelDefinition_1e_6d10
    dw   ChannelDefinition_1e_6d7d
    dw   ChannelDefinition_1e_6a08
    dw   ChannelDefinition_1e_6d24
    dw   ChannelDefinition_1e_6d2d
    dw   ChannelDefinition_1e_6a96
    dw   ChannelDefinition_1e_6b78
    dw   ChannelDefinition_1e_6da0
    dw   ChannelDefinition_1e_6b28
    dw   ChannelDefinition_1e_6e09
    dw   ChannelDefinition_1e_6b40
    dw   ChannelDefinition_1e_6d27
    dw   $ffff, MusicLoop_1e_6a32

Music4eChannel1::
    dw   ChannelDefinition_1e_6d7d
    dw   ChannelDefinition_1e_6d10
    dw   ChannelDefinition_1e_6a9b
    dw   ChannelDefinition_1e_6d2d

MusicLoop_1e_6a5c::
    dw   ChannelDefinition_1e_6eb0
    dw   ChannelDefinition_1e_6b22
    dw   ChannelDefinition_1e_6d87
    dw   ChannelDefinition_1e_6a08
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d10
    dw   ChannelDefinition_1e_6d7d
    dw   ChannelDefinition_1e_6b28
    dw   ChannelDefinition_1e_6d27
    dw   ChannelDefinition_1e_6d2d
    dw   ChannelDefinition_1e_6d10
    dw   $ffff, MusicLoop_1e_6a5c

Music4eChannel3::
    dw   ChannelDefinition_1e_6d18
    dw   ChannelDefinition_1e_6d24

MusicLoop_1e_6a80::
    dw   ChannelDefinition_1e_6e6d
    dw   ChannelDefinition_1e_6eb0
    dw   ChannelDefinition_1e_6d10
    dw   ChannelDefinition_1e_5d67
    dw   ChannelDefinition_1e_6b46
    dw   ChannelDefinition_1e_6d15
    dw   ChannelDefinition_1e_6d2d
    dw   ChannelDefinition_1e_6d18
    dw   ChannelDefinition_1e_6d24
    dw   $ffff, MusicLoop_1e_6a80

ChannelDefinition_1e_6a96::
    set_envelope_duty $c2, $83, 3, 0
    end_def

ChannelDefinition_1e_6a9b::
    notelen 1
    note A_3
    note B_3
    note C#4
    note D#4
    note F#4
    note A_4
    note B_4
    note C#5
    end_def

ChannelDefinition_1e_6aa5::
    note D#5
    note F#5
    end_def

ChannelDefinition_1e_6aa8::
    set_envelope_duty $b1, $83, 2, 0
    notelen 6
    rest
    note C#5
    note D#5
    note E_5
    set_envelope_duty $81, $83, 2, 0
    notelen 2
    note F#3
    note G#3
    note A_3
    note C#4
    note E_4
    notelen 1
    rest
    set_envelope_duty $b1, $83, 2, 0
    notelen 6
    note C#5
    note D#5
    note E_5
    set_envelope_duty $81, $83, 2, 0
    notelen 2
    note B_2
    note F#3
    note A_3
    note C#4
    note D#4
    set_envelope_duty $b1, $83, 2, 0
    note D#5
    note C#5
    note G#4
    note B_4
    set_envelope_duty $81, $83, 2, 0
    note E_3
    note G#3
    note C#5
    note D#4
    notelen 7
    rest
    notelen 2
    note C#3
    note F_3
    note G#3
    note B_3
    note C#4
    set_envelope_duty $b1, $83, 2, 0
    note C#5
    note D#5
    note E_5
    set_envelope_duty $81, $83, 2, 0
    notelen 2
    note F#3
    note G#3
    note A_3
    note C#4
    note E_4
    set_envelope_duty $b1, $83, 2, 0
    note B_4
    note E_5
    note A_5
    set_envelope_duty $81, $83, 2, 0
    notelen 2
    note B_2
    note F#3
    note A_3
    note C#4
    note F#4
    set_envelope_duty $b1, $83, 2, 0
    note G#5
    note F#5
    note G#5
    set_envelope_duty $81, $83, 2, 0
    notelen 2
    note E_3
    note G#3
    note B_3
    note D#4
    note E_4
    note G#4
    note B_4
    note D#5
    note B_5
    rest
    note B_6
    rest
    end_def

ChannelDefinition_1e_6b22::
    begin_loop $11
        notelen 4
        rest
    next_loop

    end_def

ChannelDefinition_1e_6b28::
    notelen 1
    note C#2
    note E_2
    note G#2
    note B_2
    note D#3
    note E_3
    note G#3
    note B_3
    note D#4
    note B_3
    note G#3
    note E_3
    note D#3
    note B_2
    note G#2
    note E_2
    note B_1
    note F#2
    note A_2
    note C#3
    note F#3
    note A_3
    end_def

ChannelDefinition_1e_6b40::
    note C#4
    note F#4
    note B_4
    notelen 9
    rest
    end_def

ChannelDefinition_1e_6b46::
    notelen 9
    rest
    notelen 3
    rest
    notelen 3
    note D#6
    note C#6
    note G#5
    notelen 7
    note G#5
    notelen 4
    note A_5
    notelen 7
    rest
    notelen 3
    note F#6
    note E_6
    note G#5
    notelen 7
    note G#5
    notelen 3
    note A_5
    notelen 2
    rest
    notelen 3
    note A_5
    notelen 3
    note B_5
    rest
    notelen 2
    note D_5
    note F_5
    note B_5
    notelen 4
    note G#5
    notelen 7
    rest
    notelen 2
    note E_5
    notelen 4
    note C#6
    rest
    notelen 2
    rest
    notelen 7
    note C_6
    note A_6
    notelen 3
    note G#6
    end_def

ChannelDefinition_1e_6b78::
    set_envelope_duty $c2, $83, 3, 0
    notelen 3
    note D#6
    note C#6
    note G#5
    notelen 2
    note G#5
    set_envelope_duty $72, $00, 2, 0
    note F#2
    note C#3
    set_envelope_duty $c2, $83, 3, 0
    note A_5
    set_envelope_duty $72, $00, 2, 0
    notelen 1
    note F#3
    note G#3
    note A_3
    note C#4
    note F#4
    note G#4
    note A_4
    note E_5
    note C#3
    note G#3
    note D#4
    note B_4
    set_envelope_duty $c2, $83, 3, 0
    notelen 3
    note F#6
    note E_6
    note G#5
    notelen 2
    note G#5
    set_envelope_duty $72, $00, 2, 0
    note F#3
    note C#4
    set_envelope_duty $c2, $83, 3, 0
    note A_5
    set_envelope_duty $72, $00, 2, 0
    notelen 1
    note F#4
    note G#4
    note A_4
    note C#5
    set_envelope_duty $c2, $83, 3, 0
    notelen 3
    note A_5
    note B_5
    set_envelope_duty $72, $00, 2, 0
    notelen 1
    note D_4
    note F_4
    note G#4
    note B_4
    set_envelope_duty $c2, $83, 3, 0
    notelen 2
    note D_5
    note F_5
    note B_5
    note G#5
    set_envelope_duty $72, $00, 2, 0
    notelen 1
    rest
    note E_4
    note G#4
    note B_4
    note E_5
    note G#5
    note B_5
    note D_6
    notelen 3
    note E_6
    set_envelope_duty $c2, $83, 3, 0
    notelen 2
    note E_5
    note C#6
    set_envelope_duty $72, $00, 2, 0
    notelen 1
    note A_2
    note C#3
    note E_3
    note G#3
    note A_3
    note C#4
    note E_4
    note G#4
    note C#4
    note E_4
    note G#4
    note A_4
    note E_4
    note G#4
    note A_4
    note C#5
    set_envelope_duty $c2, $83, 3, 0
    notelen 7
    note C_6
    note A_6
    notelen 3
    note G#6

Music4f::
    db   $00
    dw   MusicSpeedData_1e_4aca
    dw   Music4fChannel1
    dw   Music4fChannel2
    dw   Music4fChannel3
    dw   $0000

Music4fChannel1::
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_6c40
    dw   ChannelDefinition_1e_6d2a
    dw   $ffff, MusicLoop_1e_6c22

Music4fChannel2::
    dw   ChannelDefinition_1e_6db9

MusicLoop_1e_6c20::
    dw   ChannelDefinition_1e_6c2e

MusicLoop_1e_6c22::
    dw   ChannelDefinition_1e_6c38
    dw   $0000

Music4fChannel3::
    dw   ChannelDefinition_1e_6e6d
    dw   ChannelDefinition_1e_6d10
    dw   $ffff, MusicLoop_1e_6c20

ChannelDefinition_1e_6c2e::
    notelen 1
    note E_4
    note G#4
    note B_4
    note D#5
    note E_5
    note G#5
    note B_5
    note D#6
    end_def

ChannelDefinition_1e_6c38::
    notelen 3
    rest
    notelen 1
    note G#6
    note B_6
    rest
    rest
    end_def

ChannelDefinition_1e_6c40::
    begin_loop $02
        notelen 1
        note E_3
        note G#3
        note B_3
        note G#3
    next_loop

    end_def

Music5c::
    db   $00
    dw   MusicSpeedData_1e_4abb
    dw   Music5cChannel1
    dw   Music5cChannel2
    dw   Music5cChannel3
    dw   $0000

Music5cChannel1::
    dw   ChannelDefinition_1e_6de1
    dw   ChannelDefinition_1e_6d03
    dw   ChannelDefinition_1e_6df0
    dw   ChannelDefinition_1e_6d03
    dw   ChannelDefinition_1e_6d03
    dw   ChannelDefinition_1e_6de1
    dw   ChannelDefinition_1e_6d03
    dw   $ffff, Music5cChannel1

Music5cChannel2::
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_6ce9
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_6e9d
    dw   ChannelDefinition_1e_6ce9
    dw   ChannelDefinition_1e_6e94
    dw   ChannelDefinition_1e_6ce9
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_6e97
    dw   ChannelDefinition_1e_6ce9
    dw   ChannelDefinition_1e_6e7c
    dw   $ffff, Music5cChannel2

Music54::
    db   $00
    dw   MusicSpeedData_1e_4abb
    dw   Music54Channel1
    dw   Music54Channel2
    dw   Music54Channel3
    dw   Music54Channel4

Music54Channel1::
    dw   ChannelDefinition_1e_6de1
    dw   ChannelDefinition_1e_6d03
    dw   ChannelDefinition_1e_6df0
    dw   ChannelDefinition_1e_6d03
    dw   ChannelDefinition_1e_6dff
    dw   ChannelDefinition_1e_6d03
    dw   ChannelDefinition_1e_6d03
    dw   ChannelDefinition_1e_6d03
    dw   ChannelDefinition_1e_6d03
    dw   ChannelDefinition_1e_6d03
    dw   ChannelDefinition_1e_6ea0
    dw   $ffff, Music19Channel1

Music54Channel2::
    dw   ChannelDefinition_1e_6d9b
    dw   ChannelDefinition_1e_6ce9
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_6e9d
    dw   ChannelDefinition_1e_6ce9
    dw   ChannelDefinition_1e_6deb
    dw   ChannelDefinition_1e_6e94
    dw   ChannelDefinition_1e_6ce9
    dw   ChannelDefinition_1e_6e97
    dw   ChannelDefinition_1e_6ce9
    dw   ChannelDefinition_1e_6d8c
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_6cf6
    dw   ChannelDefinition_1e_6db9
    dw   ChannelDefinition_1e_6e9d
    dw   ChannelDefinition_1e_6cf6
    dw   ChannelDefinition_1e_6deb
    dw   ChannelDefinition_1e_6e94
    dw   ChannelDefinition_1e_6cf6
    dw   ChannelDefinition_1e_6e7c
    dw   ChannelDefinition_1e_6ea0
    dw   $ffff, Music19Channel2

Music54Channel3::
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d20
    dw   ChannelDefinition_1e_6d15
    dw   ChannelDefinition_1e_6ea0
    dw   $ffff, Music19Channel3

Music54Channel4::
    dw   ChannelDefinition_1e_6d0a
    dw   ChannelDefinition_1e_6ea0
    dw   $ffff, Music19Channel4

ChannelDefinition_1e_6ce9::
    begin_loop $02
        notelen 1
        note D_1
        note F_1
        note G#1
        note C_2
        note D_2
        note F_2
        note G#2
        note C_3
    next_loop

    end_def

ChannelDefinition_1e_6cf6::
    begin_loop $02
        notelen 1
        note D_2
        note F_2
        note G#2
        note C_3
        note D_3
        note F_3
        note G#3
        note C_4
    next_loop

    end_def

ChannelDefinition_1e_6d03::
    enable_software_envelope
    notelen 2
    note D_1
    note D_1
    notelen 8
    rest
    end_def

ChannelDefinition_1e_6d0a::
    begin_loop $07
        notelen 5
        rest
    next_loop

    end_def

ChannelDefinition_1e_6d10::
    notelen 1
    rest
    notelen 9
    rest
    end_def

ChannelDefinition_1e_6d15::
    notelen 5
    rest
    end_def

ChannelDefinition_1e_6d18::
    notelen 4
    rest
    end_def
; UNREFERENCED DATA
    db   $a5, $01, $a8, $01, $00

ChannelDefinition_1e_6d20::
    notelen 5
    rest
    rest
    end_def

ChannelDefinition_1e_6d24::
    notelen 2
    rest
    end_def

ChannelDefinition_1e_6d27::
    notelen 6
    rest
    end_def

ChannelDefinition_1e_6d2a::
    notelen 1
    rest
    end_def

ChannelDefinition_1e_6d2d::
    notelen 0
    rest
    end_def

MusicLoop_1e_6d30::
    dw   ChannelDefinition_1e_6d15
    dw   $ffff, MusicLoop_1e_6d30
; UNREFERENCED DATA
    db   $99, $00

waveform_1e_6d38::
    db   $ff, $ff, $ff, $ff, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $00, $00, $00, $00

waveform_1e_6d48::
    db   $ff, $ff, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

waveform_1e_6d58::
    db   $99, $99, $99, $99, $00, $00, $00, $00, $99, $99, $99, $99, $00, $00, $00, $00

waveform_1e_6d68::
    db   $44, $44, $44, $44, $00, $00, $00, $00, $44, $44, $44, $44, $00, $00, $00, $00

ChannelDefinition_1e_6d78::
    set_envelope_duty $10, $00, 2, 0
    end_def

ChannelDefinition_1e_6d7d::
    set_envelope_duty $20, $00, 2, 0
    end_def

ChannelDefinition_1e_6d82::
    set_envelope_duty $24, $83, 3, 0
    end_def

ChannelDefinition_1e_6d87::
    set_envelope_duty $46, $86, 2, 0
    end_def

ChannelDefinition_1e_6d8c::
    set_envelope_duty $81, $83, 3, 0
    end_def

ChannelDefinition_1e_6d91::
    set_envelope_duty $a2, $83, 3, 0
    end_def

ChannelDefinition_1e_6d96::
    set_envelope_duty $91, $83, 2, 0
    end_def

ChannelDefinition_1e_6d9b::
    set_envelope_duty $52, $83, 3, 0
    end_def

ChannelDefinition_1e_6da0::
    set_envelope_duty $62, $00, 2, 0
    end_def

ChannelDefinition_1e_6da5::
    set_envelope_duty $82, $00, 2, 0
    end_def

ChannelDefinition_1e_6daa::
    set_envelope_duty $62, $00, 3, 0
    end_def

ChannelDefinition_1e_6daf::
    set_envelope_duty $92, $00, 3, 0
    end_def

ChannelDefinition_1e_6db4::
    set_envelope_duty $b2, $00, 3, 0
    end_def

ChannelDefinition_1e_6db9::
    set_envelope_duty $c1, $83, 0, 0
    end_def

ChannelDefinition_1e_6dbe::
    set_envelope_duty $45, $00, 2, 0
    end_def

ChannelDefinition_1e_6dc3::
    set_envelope_duty $53, $00, 2, 0
    end_def

ChannelDefinition_1e_6dc8::
    set_envelope_duty $93, $00, 0, 0
    end_def

ChannelDefinition_1e_6dcd::
    set_envelope_duty $64, $00, 2, 0
    end_def

ChannelDefinition_1e_6dd2::
    set_envelope_duty $84, $86, 2, 0
    end_def
; UNREFERENCED DATA
    db   $9d, $b4, $86, $80, $00, $9d, $e4, $86, $80, $00

ChannelDefinition_1e_6de1::
    set_envelope_duty $75, $86, 2, 0
    end_def

ChannelDefinition_1e_6de6::
    set_envelope_duty $a5, $00, 2, 0
    end_def

ChannelDefinition_1e_6deb::
    set_envelope_duty $f5, $86, 2, 0
    end_def

ChannelDefinition_1e_6df0::
    set_envelope_duty $a5, $86, 2, 0
    end_def

ChannelDefinition_1e_6df5::
    set_envelope_duty $a5, $46, 2, 0
    end_def

ChannelDefinition_1e_6dfa::
    set_envelope_duty $85, $00, 2, 0
    end_def

ChannelDefinition_1e_6dff::
    set_envelope_duty $e7, $86, 2, 0
    end_def
; UNREFERENCED DATA
    db   $9d, $17, $00, $80, $00

ChannelDefinition_1e_6e09::
    set_envelope_duty $27, $00, 2, 0
    end_def

ChannelDefinition_1e_6e0e::
    set_envelope_duty $37, $00, 2, 0
    end_def

ChannelDefinition_1e_6e13::
    set_envelope_duty $47, $00, 2, 0
    end_def

ChannelDefinition_1e_6e18::
    set_envelope_duty $86, $00, 3, 0
    end_def

ChannelDefinition_1e_6e1d::
    set_envelope_duty $66, $00, 2, 0
    end_def

ChannelDefinition_1e_6e22::
    set_envelope_duty $87, $00, 2, 0
    end_def

ChannelDefinition_1e_6e27::
    set_envelope_duty $48, $00, 2, 0
    end_def

ChannelDefinition_1e_6e2c::
    set_envelope_duty $38, $00, 2, 1
    end_def

ChannelDefinition_1e_6e31::
    set_envelope_duty $48, $86, 2, 0
    end_def

ChannelDefinition_1e_6e36::
    set_envelope_duty $48, $00, 0, 0
    end_def

ChannelDefinition_1e_6e3b::
    set_envelope_duty $58, $00, 0, 0
    end_def

ChannelDefinition_1e_6e40::
    set_envelope_duty $a8, $86, 3, 0
    end_def

ChannelDefinition_1e_6e45::
    set_envelope_duty $88, $00, 0, 0
    end_def

ChannelDefinition_1e_6e4a::
    set_envelope_duty $1f, $00, 0, 0
    end_def

ChannelDefinition_1e_6e4f::
    set_envelope_duty $5f, $00, 2, 0
    end_def

ChannelDefinition_1e_6e54::
    set_waveform waveform_1e_6d38, $20
    end_def

ChannelDefinition_1e_6e59::
    set_waveform waveform_1e_6d48, $20
    end_def

ChannelDefinition_1e_6e5e::
    set_waveform waveform_1e_6d48, $40
    end_def

ChannelDefinition_1e_6e63::
    set_waveform waveform_1e_6d58, $20
    end_def

ChannelDefinition_1e_6e68::
    set_waveform waveform_1e_6d58, $40
    end_def

ChannelDefinition_1e_6e6d::
    set_waveform waveform_1e_6d58, $60
    end_def

ChannelDefinition_1e_6e72::
    set_waveform waveform_1e_6d68, $40
    end_def

ChannelDefinition_1e_6e77::
    set_waveform waveform_1e_6d68, $60
    end_def

ChannelDefinition_1e_6e7c::
    set_transpose 0
    end_def

ChannelDefinition_1e_6e7f::
    set_transpose 12
    end_def
; UNREFERENCED DATA
    db   $9f, $16, $00

ChannelDefinition_1e_6e85::
    set_transpose 7
    end_def

ChannelDefinition_1e_6e88::
    set_transpose 6
    end_def

ChannelDefinition_1e_6e8b::
    set_transpose 5
    end_def

ChannelDefinition_1e_6e8e::
    set_transpose 4
    end_def

ChannelDefinition_1e_6e91::
    set_transpose 3
    end_def

ChannelDefinition_1e_6e94::
    set_transpose 2
    end_def

ChannelDefinition_1e_6e97::
    set_transpose 1
    end_def

ChannelDefinition_1e_6e9a::
    set_transpose -24
    end_def

ChannelDefinition_1e_6e9d::
    set_transpose -1
    end_def

ChannelDefinition_1e_6ea0::
    set_speed MusicSpeedData_1e_4a9d
    end_def

ChannelDefinition_1e_6ea4::
    set_speed MusicSpeedData_1e_4aac
    end_def

ChannelDefinition_1e_6ea8::
    set_speed MusicSpeedData_1e_4aca
    end_def

ChannelDefinition_1e_6eac::
    set_speed MusicSpeedData_1e_4ad9
    end_def

ChannelDefinition_1e_6eb0::
    set_speed MusicSpeedData_1e_4ae8
    end_def

ChannelDefinition_1e_6eb4::
    set_speed MusicSpeedData_1e_4af7
    end_def
