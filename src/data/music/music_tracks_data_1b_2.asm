Music38::
    db   $00
    dw   MusicSpeedData_1b_4ae6
    dw   Music38Channel1
    dw   Music38Channel2
    dw   Music38Channel3
    dw   $0000

Music38Channel3::
    dw   ChannelDefinition_1b_500f
    dw   $0000

ChannelDefinition_1b_500f::
    set_waveform waveform_1b_6f01, $01
    unknownop_94
    notelen 3
    note C_4
    notelen 2
    note D_4
    notelen 3
    note E_4
    notelen 2
    note D_4
    notelen 7
    note C_4
    note G_4
    note E_4
    note C_5
    notelen 8
    note G_4
    notelen 3
    note G_4
    notelen 2
    note G#4
    notelen 3
    note G_4
    notelen 2
    note F#4
    notelen 8
    note D#4
    notelen 7
    note D_4
    note G_4
    notelen 8
    note C_4
    disable_software_envelope
    end_def

Music01::
    db   $00
    dw   MusicSpeedData_1b_4ac8
    dw   Music01Channel1
    dw   Music01Channel2
    dw   Music01Channel3
    dw   $0000

Music01Channel1::
    dw   ChannelDefinition_1b_706b

MusicLoop_1b_5041::
    dw   ChannelDefinition_1b_505b
    dw   $ffff, MusicLoop_1b_5041

Music01Channel2::
    dw   ChannelDefinition_1b_50ab

MusicLoop_1b_5049::
    dw   ChannelDefinition_1b_50d9
    dw   $ffff, MusicLoop_1b_5049

Music01Channel3::
    dw   ChannelDefinition_1b_6f60
    dw   ChannelDefinition_1b_513c

MusicLoop_1b_5053::
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_517e
    dw   $ffff, MusicLoop_1b_5053

ChannelDefinition_1b_505b::
    set_envelope_duty $66, $81, 2, 0
    notelen 5
    rest
    notelen 2
    rest
    note A#4
    notelen 1
    note A#4
    note C_5
    note D_5
    note D#5
    notelen 3
    note F_5
    rest
    rest
    notelen 1
    note C#5
    note F#5
    note G#5
    note A#5
    notelen 3
    note C#6
    rest
    notelen 7
    rest
    notelen 1
    note C#5
    note D#5
    notelen 2
    note F_5
    note C#5
    notelen 3
    note G#4
    notelen 7
    rest

    begin_loop $02
        notelen 1
        note D#5
        note F_5
        notelen 2
        note F#5
    next_loop

    rest
    notelen 7
    rest

    begin_loop $02
        notelen 1
        note C#5
        note D#5
        notelen 2
        note F_5
    next_loop

    rest
    notelen 7
    rest
    notelen 1
    note C_5
    note D_5
    notelen 2
    note E_5
    notelen 1
    note E_5
    note F_5
    note G_5
    note A_5
    note A#5
    note C_6
    notelen 2
    note A_5
    rest
    notelen 8
    rest
    notelen 5
    rest
    end_def

ChannelDefinition_1b_50ab::
    set_envelope_duty $a0, $84, 2, 0
    notelen 4
    note A#3
    notelen 2
    rest
    note A#3
    note A#3
    notelen 1
    note A#3
    note A#3

    begin_loop $02
        notelen 6
        note A#3
        notelen 1
        note G#3
        notelen 3
        note A#3
        notelen 2
        rest
        note A#3
        note A#3
        notelen 1
        note A#3
        note A#3
    next_loop

    notelen 2
    note A#3
    notelen 1
    note F_3
    note F_3

    begin_loop $02
        notelen 2
        note F_3
        notelen 1
        note F_3
        note F_3
    next_loop

    notelen 2
    note F_3
    note F_3
    end_def

ChannelDefinition_1b_50d9::
    set_envelope_duty $80, $21, 1, 0
    notelen 2
    note A#3
    rest
    notelen 7
    note F_3
    notelen 1
    rest
    note A#3
    note A#3
    note C_4
    note D_4
    note D#4
    notelen 4
    note F_4
    notelen 2
    rest
    note F_4
    note F_4
    notelen 1
    note F#4
    note G#4
    notelen 4
    note A#4
    notelen 2
    rest
    note A#4
    note A#4
    notelen 1
    note G#4
    note F#4
    notelen 6
    note G#4
    notelen 1
    note F#4
    notelen 4
    note F_4
    notelen 3
    note F_4
    notelen 6
    note D#4
    notelen 1
    note F_4
    notelen 4
    note F#4
    notelen 2
    note F_4
    note D#4
    notelen 6
    note C#4
    notelen 1
    note D#4
    notelen 4
    note F_4
    notelen 2
    note D#4
    note C#4
    notelen 6
    note C_4
    notelen 1
    note D_4
    notelen 4
    note E_4
    notelen 3
    note G_4
    set_envelope_duty $60, $81, 2, 0
    notelen 2
    note F_4
    notelen 1
    note A#3
    note A#3
    notelen 2
    note A#3
    notelen 1
    note A#3
    note A#3
    notelen 3
    note A#3
    rest
    notelen 2
    rest
    notelen 1
    note A_3
    note A_3
    notelen 2
    note A_3
    notelen 1
    note A_3
    note A_3
    notelen 3
    note A_3
    rest
    end_def

ChannelDefinition_1b_513c::
    enable_software_envelope
    notelen 3
    note D_4
    notelen 2
    rest
    notelen 1
    note A#2
    note A#2
    notelen 2
    note A#2
    note D_4
    note D_4
    notelen 1
    note D_4
    note D_4
    notelen 6
    note C_4
    notelen 1
    note C_4
    notelen 2
    note C_4
    notelen 1
    note G#2
    note G#2
    notelen 2
    note G#2
    note C_4
    note C_4
    notelen 1
    note C_4
    note C_4
    notelen 6
    note C#4
    notelen 1
    note C#4
    notelen 2
    note C#4
    notelen 1
    note F#2
    note F#2
    notelen 2
    note F#2
    note C#4
    note C#4
    notelen 1
    note C#4
    note C#4
    notelen 2
    note C#4
    notelen 1
    note A_3
    note A_3

    begin_loop $02
        notelen 2
        note A_3
        notelen 1
        note A_3
        note A_3
    next_loop

    notelen 2
    note F_2
    notelen 1
    note G_2
    note A_2
    end_def

ChannelDefinition_1b_517e::
    enable_software_envelope

    begin_loop $02
        notelen 2
        note A#2
        notelen 3
        note A#3
        notelen 2
        note A#3
    next_loop

    begin_loop $02
        notelen 2
        note G#2
        notelen 3
        note G#3
        notelen 2
        note G#3
    next_loop

    begin_loop $02
        notelen 2
        note F#2
        notelen 3
        note F#3
        notelen 2
        note F#3
    next_loop

    begin_loop $02
        notelen 2
        note C#3
        notelen 3
        note C#4
        notelen 2
        note C#4
    next_loop

    begin_loop $02
        notelen 2
        note B_2
        notelen 3
        note B_3
        notelen 2
        note B_3
    next_loop

    begin_loop $02
        notelen 2
        note A#2
        notelen 3
        note A#3
        notelen 2
        note A#3
    next_loop

    notelen 2
    note C_3
    notelen 3
    note C_4
    notelen 2
    note C_4
    note C_3
    note C_4
    note A#4
    note C_3
    note F_3

    begin_loop $02
        notelen 1
        note D#4
        note D#4
        notelen 2
        note D#4
    next_loop

    notelen 1
    note C_3
    note C_3
    notelen 2
    note C_3
    notelen 1
    note C_3
    note C_3
    notelen 2
    note F_3

    begin_loop $02
        notelen 1
        note D#4
        note D#4
        notelen 2
        note D#4
    next_loop

    notelen 1
    note F_2
    note F_2
    note F_2
    note F#2
    note G_2
    note A_2
    end_def

Music02::
    db   $00
    dw   MusicSpeedData_1b_4aaa
    dw   Music02Channel1
    dw   Music02Channel2
    dw   Music02Channel3
    dw   $0000

Music02Channel1::
    dw   ChannelDefinition_1b_6f7a
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_5241
    dw   ChannelDefinition_1b_5241
    dw   ChannelDefinition_1b_5241
    dw   ChannelDefinition_1b_5241
    dw   ChannelDefinition_1b_5241
    dw   ChannelDefinition_1b_5241
    dw   ChannelDefinition_1b_6f7f
    dw   ChannelDefinition_1b_702a
    dw   ChannelDefinition_1b_5241
    dw   ChannelDefinition_1b_5241
    dw   ChannelDefinition_1b_5241
    dw   ChannelDefinition_1b_524b
    dw   $ffff, Music02Channel1

Music02Channel2::
    dw   ChannelDefinition_1b_6f84
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_5255
    dw   ChannelDefinition_1b_525d
    dw   ChannelDefinition_1b_6f89
    dw   ChannelDefinition_1b_702a
    dw   ChannelDefinition_1b_525d
    dw   ChannelDefinition_1b_527a
    dw   $ffff, Music02Channel2

Music02Channel3::
    dw   ChannelDefinition_1b_6f5b
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_527d
    dw   ChannelDefinition_1b_527d
    dw   ChannelDefinition_1b_527d
    dw   ChannelDefinition_1b_527d
    dw   ChannelDefinition_1b_527d
    dw   ChannelDefinition_1b_527d
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_702a
    dw   ChannelDefinition_1b_527d
    dw   ChannelDefinition_1b_527d
    dw   ChannelDefinition_1b_527d
    dw   ChannelDefinition_1b_5288
    dw   $ffff, Music02Channel3

ChannelDefinition_1b_5241::
    notelen 7
    note E_2
    notelen 2
    note E_2
    notelen 3
    note F_2
    note E_2
    note D_2
    note B_1
    end_def

ChannelDefinition_1b_524b::
    notelen 7
    note E_2
    notelen 2
    note E_2
    notelen 3
    note F_2
    note E_2
    note D_2
    rest
    end_def

ChannelDefinition_1b_5255::
    begin_loop $03
        notelen 8
        rest
    next_loop

    notelen 4
    rest
    end_def

ChannelDefinition_1b_525d::
    begin_loop $02
        notelen 1
        rest
        note G_3
        note G#3
        note A_3
        notelen 7
        note A#3
        notelen 2
        note E_3
        notelen 4
        note A#3
        notelen 1
        rest
        note A_3
        note A#3
        note A_3
        notelen 2
        note G_3
        note F_3
        notelen 7
        note G_3
        notelen 2
        note C_3
        notelen 8
        note G_3
    next_loop

    end_def

ChannelDefinition_1b_527a::
    notelen 3
    rest
    end_def

ChannelDefinition_1b_527d::
    enable_software_envelope
    notelen 7
    note C_3
    notelen 2
    note C_3
    notelen 3
    note C#3
    note C_3
    note A#2
    note G_2
    end_def

ChannelDefinition_1b_5288::
    enable_software_envelope
    notelen 7
    note C_3
    notelen 2
    note C_3
    notelen 3
    note C#3
    note C_3
    note A#2
    rest
    end_def

Music03::
    db   $00
    dw   MusicSpeedData_1b_4ae6
    dw   Music03Channel1
    dw   Music03Channel2
    dw   Music03Channel3
    dw   $0000

Music03Channel1::
    dw   ChannelDefinition_1b_52eb
    dw   $ffff, Music03Channel1

Music03Channel2::
    dw   ChannelDefinition_1b_52b6
    dw   ChannelDefinition_1b_52bb
    dw   $ffff, Music03Channel2

Music03Channel3::
    dw   ChannelDefinition_1b_707a

MusicLoop_1b_52ae::
    dw   ChannelDefinition_1b_5327
    dw   ChannelDefinition_1b_52bb
    dw   $ffff, MusicLoop_1b_52ae

ChannelDefinition_1b_52b6::
    set_envelope_duty $57, $00, 2, 0
    end_def

ChannelDefinition_1b_52bb::
    notelen 2
    note B_5
    note C#6
    notelen 3
    note D_6
    rest
    rest
    notelen 2
    note B_5
    note C#6
    notelen 3
    note D_6
    rest
    rest
    notelen 2
    note C#6
    note B_5
    note F#5
    notelen 7
    note A_5
    notelen 3
    note B_5
    rest
    notelen 8
    rest
    notelen 2
    note B_5
    note C#6
    notelen 3
    note D_6
    rest
    rest
    notelen 2
    note B_5
    note D_6
    notelen 3
    note G_6
    rest
    rest
    notelen 2
    note F#6
    note E_6
    notelen 4
    note F#6
    rest
    notelen 8
    rest
    end_def

ChannelDefinition_1b_52eb::
    set_envelope_duty $37, $00, 2, 0
    notelen 7
    rest

    begin_loop $02
        notelen 2
        note G_3
        note D_4
        note G_4
        note A_4
        notelen 3
        note B_4
        rest
    next_loop

    notelen 2
    note B_3
    note F#4
    note A_4
    note E_5
    notelen 3
    note F#5
    rest
    notelen 2
    note B_3
    note F#4
    note A_4
    note F#4
    note A_3
    note F#4
    note A_4
    note F#4

    begin_loop $02
        notelen 2
        note G_3
        note D_4
        note G_4
        note A_4
        notelen 3
        note B_4
        rest
    next_loop

    notelen 2
    note D_3
    note A_3
    note C#4
    note E_4
    note F#4
    note A_4
    note C#5
    note E_5
    note F#5
    note E_5
    note F#5
    note A_5
    note A_6
    end_def

ChannelDefinition_1b_5327::
    set_waveform waveform_1b_6f21, $20
    end_def

Music04::
    db   $00
    dw   MusicSpeedData_1b_4af5
    dw   Music04Channel1
    dw   Music04Channel2
    dw   Music04Channel3
    dw   $0000

Music04Channel1::
    dw   ChannelDefinition_1b_5343
    dw   $ffff, Music04Channel1

Music04Channel2::
    dw   ChannelDefinition_1b_53a5
    dw   $ffff, Music04Channel2

ChannelDefinition_1b_5343::
    set_envelope_duty $52, $00, 2, 0
    enable_software_envelope

    begin_loop $02
        notelen 2
        note G_3
        note D_4
    next_loop

    begin_loop $02
        note G_3
        note E_4
    next_loop

    begin_loop $02
        note G_3
        note F#4
    next_loop

    begin_loop $02
        note G_3
        note E_4
    next_loop

    begin_loop $02
        note G_3
        note D_4
    next_loop

    begin_loop $02
        note G_3
        note D#4
    next_loop

    begin_loop $02
        note A_3
        note E_4
    next_loop

    note D_4
    note D_3
    note E_3
    note D_3

    begin_loop $02
        note C_3
        note G_3
    next_loop

    begin_loop $02
        note C_3
        note A_3
    next_loop

    begin_loop $02
        note B_2
        note A_3
    next_loop

    begin_loop $02
        note E_3
        note B_3
    next_loop

    begin_loop $02
        note A_2
        note E_3
    next_loop

    note A_2
    note D#3
    note D_3
    note C_3
    set_envelope_duty $40, $00, 2, 0
    notelen 4
    note D_3
    note C_3
    set_speed MusicSpeedData_1b_4b04
    notelen 4
    note B_2
    notelen 7
    note A_2
    set_envelope_duty $52, $00, 2, 0
    notelen 2
    note D_3
    set_speed MusicSpeedData_1b_4af5
    end_def

ChannelDefinition_1b_53a5::
    set_envelope_duty $56, $00, 2, 0
    notelen 3
    note D_5
    note G_4
    notelen 7
    note A_4
    notelen 1
    note B_4
    note C_5
    notelen 2
    note D_5
    note D_5
    note G_4
    note G_4
    notelen 7
    note A_4
    notelen 1
    note B_4
    note C_5
    notelen 2
    note B_4
    note D_5
    notelen 7
    note A_5
    notelen 2
    note G_5
    note A_5
    note G_5
    note D_5
    notelen 1
    note C_5
    note B_4
    notelen 3
    note A_4
    set_envelope_duty $42, $00, 2, 0
    note F#4
    set_envelope_duty $56, $00, 2, 0
    notelen 1
    rest
    note B_4
    note C_5
    note D_5
    notelen 3
    note E_5
    note G_4
    notelen 7
    note F#4
    notelen 1
    note A_4
    note E_5
    notelen 2
    note D_5
    note D_5
    note F#4
    note F#4
    notelen 7
    note G_4
    notelen 1
    note G_4
    note F#4
    notelen 2
    note E_4
    note G_4
    notelen 7
    note B_4
    notelen 2
    note A_4
    note G_4
    note D#4

    begin_loop $04
        note D_4
        note D_5
    next_loop

    set_speed MusicSpeedData_1b_4b04

    begin_loop $04
        notelen 2
        note D_5
        note D_6
    next_loop

    set_speed MusicSpeedData_1b_4af5
    end_def

Music05::
    db   $00
    dw   MusicSpeedData_1b_4ac8
    dw   Music05Channel1
    dw   Music05Channel2
    dw   Music05Channel3
    dw   $0000

Music05Channel1::
    dw   ChannelDefinition_1b_5446

MusicLoop_1b_5412::
    dw   ChannelDefinition_1b_5471
    dw   ChannelDefinition_1b_54bc
    dw   ChannelDefinition_1b_5471
    dw   ChannelDefinition_1b_54e9
    dw   $ffff, MusicLoop_1b_5412

Music05Channel2::
    dw   ChannelDefinition_1b_5562

MusicLoop_1b_5420::
    dw   ChannelDefinition_1b_558f
    dw   ChannelDefinition_1b_55c4
    dw   ChannelDefinition_1b_558f
    dw   ChannelDefinition_1b_55e8
    dw   $ffff, MusicLoop_1b_5420

Music05Channel3::
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_5664

MusicLoop_1b_5430::
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_568d
    dw   ChannelDefinition_1b_56af
    dw   ChannelDefinition_1b_568d
    dw   ChannelDefinition_1b_56dd
    dw   ChannelDefinition_1b_6f46
    dw   ChannelDefinition_1b_56ea
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_56f7
    dw   $ffff, MusicLoop_1b_5430

ChannelDefinition_1b_5446::
    set_envelope_duty $45, $00, 2, 0
    notelen 3
    note B_2
    notelen 10
    note B_2
    note B_2
    note B_2
    notelen 3
    note A_2
    notelen 10
    note A_2
    note B_2
    note C_3
    notelen 3
    note D#3
    notelen 10
    note D#3
    note D#3
    note D#3
    notelen 3
    note F_3
    notelen 10
    note F_3
    note F_3
    note F_3
    set_envelope_duty $40, $21, 2, 1
    notelen 8
    note G_3
    notelen 10
    note F_3
    note F_3
    note F_3
    notelen 8
    note G_3
    notelen 3
    rest
    end_def

ChannelDefinition_1b_5471::
    set_envelope_duty $45, $00, 2, 0
    notelen 3
    note B_2
    notelen 10
    note C_3
    note B_2
    note A_2
    notelen 6
    note B_2
    notelen 1
    note B_2
    note B_2
    note C_3
    note D_3
    note E_3
    notelen 6
    note F_3
    notelen 1
    note G_3
    note G_3
    note A_3
    note B_3
    note C_4
    notelen 3
    note D_4
    notelen 10
    note F_3
    note G_3
    note A_3
    notelen 6
    note A#3
    notelen 1
    note D#3
    note D#3
    note F_3
    note G_3
    note A_3
    notelen 10
    note A#3
    rest
    note A#3
    note A#3
    note A_3
    note G_3
    note A#3
    rest
    note F_3
    note F_3
    note F_3
    note D#3
    note F_3
    rest
    note F_3
    note F_3
    note D#3
    note F_3
    notelen 2
    note D#3
    notelen 1
    note D#3
    note D_3
    notelen 2
    note D#3
    notelen 1
    note D#3
    note F_3
    notelen 3
    note G_3
    notelen 2
    note F_3
    note D#3
    end_def

ChannelDefinition_1b_54bc::
    notelen 2
    note D_3
    notelen 1
    note D_3
    note C_3
    notelen 2
    note D_3
    notelen 1
    note D_3
    note D#3
    notelen 3
    note F_3
    notelen 2
    note D#3
    note D_3
    notelen 3
    note C#3
    notelen 2
    note C#3
    notelen 1
    note C#3
    note D_3
    notelen 2
    note E_3
    notelen 1
    note E_3
    note F_3
    note G_3
    note A_3
    note A#3
    note C_4
    notelen 3
    note A_3
    set_envelope_duty $40, $21, 1, 1
    notelen 10
    note C_3
    note C_3
    note C_3
    notelen 3
    note D_3
    rest
    end_def

ChannelDefinition_1b_54e9::
    set_envelope_duty $45, $00, 2, 0
    notelen 10
    note D_3
    note C#3
    note D_3
    note F#3
    note G_3
    note A_3
    note A#3
    rest
    note A#3
    note A#3
    note A_3
    note G_3
    set_envelope_duty $70, $21, 2, 0
    notelen 6
    note D_4
    note A#3
    notelen 2
    note G_3
    notelen 3
    note F#3
    notelen 10
    note F#3
    note E_3
    note F#3
    notelen 10
    note G_3
    note A_3
    note A#3
    note C_4
    note A#3
    note A_3
    notelen 3
    note A#3
    rest
    set_envelope_duty $50, $21, 2, 1
    notelen 3
    note A#3
    notelen 7
    note G_3
    notelen 1
    rest
    note A#3
    note A#3
    note C_4
    note D_4
    note D#4
    notelen 10
    note C_4
    rest
    note A#3
    notelen 4
    note A_3
    notelen 3
    note F_3
    notelen 10
    note G_3
    rest
    note D_3
    notelen 3
    note D_3
    note C_3
    note E_3
    notelen 2
    note G_3
    notelen 1
    note G_3
    note F#3
    note G_3
    note A_3
    note A#3
    note C_4
    notelen 4
    note D_4
    notelen 10
    note D_4
    rest
    note C_4
    notelen 4
    note A#3
    notelen 3
    rest
    notelen 10
    note C_4
    rest
    note D#4
    notelen 4
    note G#4
    notelen 3
    rest
    rest
    notelen 10
    note G_3
    note G_3
    note G_3
    notelen 3
    note G_3
    rest
    set_envelope_duty $40, $21, 1, 0
    rest
    notelen 10
    note C_4
    note C_4
    note C_4
    notelen 3
    note D_4
    rest
    end_def

ChannelDefinition_1b_5562::
    set_envelope_duty $55, $00, 2, 0
    notelen 3
    note G_3
    notelen 10
    note G_3
    note D_3
    note G_3
    notelen 3
    note F_3
    notelen 10
    note F_3
    note G_3
    note A_3
    notelen 3
    note A#3
    notelen 10
    note A#3
    note G_3
    note A#3
    notelen 3
    note A_3
    notelen 10
    note A_3
    note A#3
    note C_4
    set_envelope_duty $50, $21, 2, 1
    notelen 8
    note D_4
    notelen 10
    note C_4
    note C_4
    note C_4
    notelen 8
    note D_4
    notelen 10
    note C_4
    note B_3
    note A_3
    end_def

ChannelDefinition_1b_558f::
    set_envelope_duty $65, $00, 2, 0
    notelen 3
    note G_3
    notelen 7
    note D_3
    notelen 1
    rest
    note G_3
    note G_3
    note A_3
    note B_3
    note C_4
    notelen 4
    note D_4
    notelen 10
    rest
    rest
    note D_4
    note D_4
    note D#4
    note F_4
    notelen 4
    note G_4
    notelen 10
    rest
    rest
    note G_4
    note G_4
    note F_4
    note D#4
    note F_4
    rest
    note D#4
    notelen 4
    note D_4
    notelen 10
    note D_4
    note D#4
    note D_4
    notelen 2
    note C_4
    notelen 1
    note C_4
    note D_4
    notelen 4
    note D#4
    notelen 2
    note D_4
    note C_4
    end_def

ChannelDefinition_1b_55c4::
    notelen 2
    note A#3
    notelen 1
    note A#3
    note C_4
    notelen 4
    note D_4
    notelen 2
    note C_4
    note A#3
    note A_3
    notelen 1
    note A_3
    note B_3
    notelen 4
    note C#4
    notelen 3
    note E_4
    notelen 2
    note D_4
    set_envelope_duty $60, $21, 0, 1
    notelen 13
    note D_3
    note D_3
    note D_3
    notelen 10
    note E_3
    note E_3
    note E_3
    notelen 3
    note F#3
    rest
    end_def

ChannelDefinition_1b_55e8::
    set_envelope_duty $45, $00, 2, 0
    notelen 10
    note A#3
    note A_3
    note A#3
    note C_4
    note A#3
    note C_4
    note D_4
    rest
    note D_4
    note D_4
    note C_4
    note A#3
    set_envelope_duty $40, $00, 2, 1
    notelen 4
    note D_4
    note D_5
    notelen 8
    note G_4
    set_envelope_duty $70, $21, 1, 1
    notelen 10
    note D_4
    note D#4
    note F_4
    notelen 3
    note G_4
    notelen 7
    note D_4
    notelen 1
    rest
    note G_4
    note G_4
    note A_4
    note A#4
    note C_5
    notelen 10
    note A_4
    rest
    note F_4
    notelen 7
    note C_4
    notelen 1
    note C_4
    note D_4
    note F_4
    note D#4
    note D_4
    note C_4
    notelen 10
    note D_4
    rest
    note G_3
    notelen 7
    note G_3
    notelen 1
    note G_3
    note F#3
    note G_3
    note A_3
    note A#3
    note C_4
    notelen 4
    note D_4
    notelen 3
    rest
    notelen 10
    note D_4
    note C_4
    note D_4
    notelen 10
    note A#4
    rest
    note A_4
    notelen 3
    note G_4
    notelen 10
    rest
    note D_4
    note D_4
    note D_4
    note A#3
    note G_4
    note G#4
    rest
    note A#4
    notelen 3
    note C_5
    notelen 10
    rest
    note C_5
    note D_5
    note D#5
    note F_5
    note D#5
    notelen 5
    note D_5
    set_envelope_duty $40, $21, 1, 0
    notelen 2
    rest
    notelen 13
    note D_4
    note D_4
    note D_4
    notelen 10
    note E_4
    note E_4
    note E_4
    notelen 3
    note F#4
    rest
    end_def

ChannelDefinition_1b_5664::
    enable_software_envelope
    notelen 3
    note G_3
    notelen 10
    note G_3
    note G_3
    note G_3
    notelen 3
    note F_3
    notelen 10
    note F_3
    note F_3
    note F_3
    notelen 3
    note D#3
    notelen 10
    note D#3
    note D#3
    note D#3
    note F_3
    note F_3
    note F_3
    note F_3
    note D#3
    note F_3

    begin_loop $02
        notelen 3
        note G_3
        notelen 10
        note G_3
        note G_3
        note G_3
        notelen 3
        note G_3
        notelen 10
        note D_3
        note D_3
        note D_3
    next_loop

    end_def

ChannelDefinition_1b_568d::
    notelen 3
    note G_2
    notelen 10
    note G_2
    note G_2
    note F_2
    notelen 3
    note G_2
    note G_2
    note F_2
    notelen 10
    note F_2
    note F_2
    note D#2
    notelen 3
    note F_2
    note F_2
    note D#2
    notelen 10
    note D#2
    note D#2
    note D_2
    notelen 3
    note D#2
    note D#2
    note A#2
    notelen 10
    note A#2
    note A#2
    note G#2
    notelen 3
    note A#2
    note A#2
    end_def

ChannelDefinition_1b_56af::
    note G#2
    notelen 10
    note G#2
    note G#2
    note G_2
    notelen 3
    note G#2
    notelen 10
    note G#2
    note G#2
    note G#2
    notelen 3
    note G_2
    notelen 10
    note G_2
    note G_2
    note F_2
    notelen 3
    note G_2
    notelen 10
    note G_2
    note G_2
    note G_2

    begin_loop $02
        notelen 3
        note A_2
        notelen 10
        note A_2
        note A_2
        note A_2
    next_loop

    notelen 3
    note D_3
    notelen 10
    note G_3
    note G_3
    note G_3
    disable_software_envelope
    notelen 3
    note A_3
    enable_software_envelope
    notelen 2
    note E_2
    note F#2
    end_def

ChannelDefinition_1b_56dd::
    notelen 3
    note G#2
    notelen 10
    note G#3
    note G#3
    note G_3
    notelen 3
    note G#3
    notelen 10
    note G#3
    note G#3
    note G#3
    end_def

ChannelDefinition_1b_56ea::
    disable_software_envelope
    notelen 3
    note G_3
    note F#3
    notelen 4
    note F_3
    notelen 3
    note E_3
    note C_3
    enable_software_envelope
    notelen 3
    note D_3
    end_def

ChannelDefinition_1b_56f7::
    notelen 10
    note D_3
    note D_4
    note C_4
    note A#3
    note A_3
    note G_3
    notelen 3
    note A_3
    note G_3
    rest
    note D#2
    notelen 10
    note D#3
    note G_3
    note A#3
    notelen 3
    note D#4
    notelen 10
    note D#2
    note D#2
    note D#2
    notelen 3
    note D_2
    notelen 10
    note D_3
    note F_3
    note A_3
    notelen 3
    note D_4
    notelen 10
    note D_3
    note D_3
    note D_3

    begin_loop $03
        notelen 3
        note G_2
        notelen 10
        note G_2
        note G_2
        note G_2
    next_loop

    notelen 6
    note G_2
    note G_2
    notelen 2
    note F_2
    notelen 3
    note D#2
    notelen 10
    note D#2
    note G_2
    note A#2
    notelen 3
    note D#3
    notelen 10
    note D#2
    note D#2
    note D#2
    notelen 3
    note G#2
    notelen 10
    note G#2
    note C_3
    note D#3
    notelen 3
    note G#3
    notelen 10
    note G#2
    note G#2
    note G#2
    notelen 3
    note D_2
    notelen 10
    note C_4
    note C_4
    note C_4
    notelen 3
    note C_4
    notelen 10
    note D_2
    note D_2
    note D_2
    notelen 3
    note D_2
    notelen 10
    note G_4
    note G_4
    note G_4
    note A_4
    note D#3
    note D_3
    note C_3
    note A#2
    note A_2
    end_def

Music06::
    db   $00
    dw   MusicSpeedData_1b_4ac8
    dw   Music06Channel1
    dw   Music06Channel2
    dw   Music06Channel3
    dw   Music06Channel4

Music06Channel1::
    dw   ChannelDefinition_1b_6f98
    dw   ChannelDefinition_1b_57d3
    dw   ChannelDefinition_1b_57d3

MusicLoop_1b_5769::
    dw   ChannelDefinition_1b_6f98
    dw   ChannelDefinition_1b_57f8
    dw   ChannelDefinition_1b_5816
    dw   ChannelDefinition_1b_6f98
    dw   ChannelDefinition_1b_57f8
    dw   ChannelDefinition_1b_7027
    dw   ChannelDefinition_1b_6f7a
    dw   ChannelDefinition_1b_57f8
    dw   ChannelDefinition_1b_6f9d
    dw   ChannelDefinition_1b_57f8
    dw   ChannelDefinition_1b_5816
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_7061
    dw   ChannelDefinition_1b_6f98
    dw   ChannelDefinition_1b_57f8
    dw   ChannelDefinition_1b_57f8
    dw   $ffff, MusicLoop_1b_5769

Music06Channel2::
    dw   ChannelDefinition_1b_706b
    dw   ChannelDefinition_1b_586f

MusicLoop_1b_5791::
    dw   ChannelDefinition_1b_6fa2
    dw   ChannelDefinition_1b_588e
    dw   ChannelDefinition_1b_706b
    dw   ChannelDefinition_1b_706b
    dw   ChannelDefinition_1b_6fa7
    dw   ChannelDefinition_1b_588e
    dw   ChannelDefinition_1b_7061
    dw   ChannelDefinition_1b_706b
    dw   ChannelDefinition_1b_591b
    dw   $ffff, MusicLoop_1b_5791

Music06Channel3::
    dw   ChannelDefinition_1b_6f55
    dw   ChannelDefinition_1b_5926

MusicLoop_1b_57ab::
    dw   ChannelDefinition_1b_6f6b
    dw   ChannelDefinition_1b_5933
    dw   ChannelDefinition_1b_597f
    dw   ChannelDefinition_1b_706b
    dw   ChannelDefinition_1b_7071
    dw   ChannelDefinition_1b_7061
    dw   ChannelDefinition_1b_597f
    dw   ChannelDefinition_1b_7061
    dw   ChannelDefinition_1b_706b
    dw   ChannelDefinition_1b_706b
    dw   $ffff, MusicLoop_1b_57ab

Music06Channel4::
    dw   ChannelDefinition_1b_5994

MusicLoop_1b_57c5::
    dw   ChannelDefinition_1b_59a1
    dw   ChannelDefinition_1b_59b8
    dw   ChannelDefinition_1b_59c2
    dw   ChannelDefinition_1b_59b8
    dw   ChannelDefinition_1b_59d9
    dw   $ffff, MusicLoop_1b_57c5

ChannelDefinition_1b_57d3::
    set_envelope_duty $33, $00, 2, 0

    begin_loop $04
        notelen 2
        note D_4
        notelen 1
        note D_4
        note D_4
    next_loop

    begin_loop $04
        notelen 2
        note E_4
        notelen 1
        note E_4
        note E_4
    next_loop

    begin_loop $04
        notelen 2
        note F_4
        notelen 1
        note F_4
        note F_4
    next_loop

    begin_loop $04
        notelen 2
        note E_4
        notelen 1
        note E_4
        note E_4
    next_loop

    end_def

ChannelDefinition_1b_57f8::
    begin_loop $04
        notelen 1
        note G_2
        note D_3
        note A#2
        note D_3
    next_loop

    begin_loop $04
        note G_2
        note E_3
        note C_3
        note E_3
    next_loop

    begin_loop $04
        note G_2
        note F_3
        note D_3
        note F_3
    next_loop

    begin_loop $04
        note G_2
        note E_3
        note C_3
        note E_3
    next_loop

    end_def

ChannelDefinition_1b_5816::
    begin_loop $04
        note D#2
        note D_3
        note A#2
        note D_3
    next_loop

    begin_loop $04
        note F_2
        note C_3
        note A_2
        note C_3
    next_loop

    begin_loop $02
        note F_2
        note D_3
        note A#2
        note D_3
    next_loop

    begin_loop $02
        note G_2
        note E_3
        note C_3
        note E_3
    next_loop

    begin_loop $04
        note A_2
        note F#3
        note D_3
        note F#3
    next_loop

    begin_loop $04
        note G_2
        note D_3
        note A#2
        note D_3
    next_loop

    begin_loop $04
        note G#2
        note D#3
        note C_3
        note D#3
    next_loop

    begin_loop $04
        note G_2
        note D_3
        note A#2
        note D_3
    next_loop

    begin_loop $04
        note E_2
        note D_3
        note A#2
        note D_3
    next_loop

    begin_loop $04
        note G#2
        note D#3
        note C_3
        note D#3
    next_loop

    notelen 1
    note D_3
    note G_3
    note A_3
    note C_4
    notelen 3
    note D_4
    notelen 4
    rest
    set_envelope_duty $50, $26, 0, 1
    notelen 4
    note D_4
    note C_4
    note A#3
    note C_4
    end_def

ChannelDefinition_1b_586f::
    set_envelope_duty $40, $26, 1, 1
    notelen 3
    note G_3
    notelen 7
    note D_3
    notelen 2
    note G_3
    notelen 1
    note G_3
    note A_3
    note A#3
    note C_4
    notelen 5
    note D_4
    notelen 3
    note G_4
    notelen 7
    note D_4
    notelen 2
    note G_4
    notelen 1
    note G_4
    note A_4
    note A#4
    note C_5
    notelen 5
    note D_5
    end_def

ChannelDefinition_1b_588e::
    notelen 6
    note G_3
    notelen 1
    note D_3
    notelen 7
    note D_3
    notelen 2
    note G_3
    notelen 1
    note G_3
    note A_3
    note A#3
    note C_4
    notelen 7
    note D_4
    notelen 1
    note E_4
    note F_4
    notelen 6
    note E_4
    note D_4
    notelen 2
    note C_4
    notelen 6
    note D_4
    notelen 1
    note G_3
    notelen 5
    note G_4
    notelen 2
    rest
    note D_4
    note A#4
    note A_4
    note A#4
    note C_5
    note D_5
    notelen 1
    note G_4
    note D_5
    notelen 3
    note G_5
    notelen 2
    rest
    note D_5
    note C_5
    note A#4
    note C_5
    notelen 1
    note F_4
    note C_5
    notelen 3
    note F_5
    notelen 2
    rest
    note C_5
    note A#4
    note A_4
    notelen 6
    note A#4
    notelen 1
    note D_4
    notelen 3
    note D_4
    notelen 2
    rest
    notelen 13
    note C_4
    note D_4
    note C_4
    notelen 2
    note A#3
    note C_4
    notelen 5
    note D_4
    notelen 6
    note G_3
    notelen 1
    note D_3
    notelen 7
    note D_3
    notelen 2
    note G_3
    notelen 1
    note G_3
    note A_3
    note A#3
    note C_4
    notelen 7
    note D_4
    notelen 1
    note D#4
    note F_4
    notelen 6
    note D#4
    note D_4
    notelen 2
    note C_4
    notelen 6
    note A#3
    notelen 1
    note G_3
    notelen 7
    note D_4
    notelen 2
    note A#3
    note G_4
    note D_4
    notelen 7
    note A#4
    notelen 2
    note A_4
    note G_4
    note A_4
    note A#4
    note C_5
    notelen 2
    note D_5
    notelen 1
    note C_5
    note D_5
    notelen 3
    note D#5
    notelen 2
    rest
    notelen 6
    note F_5
    note D#5
    note D_5
    note A_4
    notelen 2
    note A#4
    notelen 6
    note C_5
    note A#4
    notelen 2
    note A_4
    notelen 5
    note G_4
    note G_5
    end_def

ChannelDefinition_1b_591b::
    set_envelope_duty $56, $00, 2, 0

    begin_loop $04
        notelen 4
        rest
        note A_6
    next_loop

    end_def

ChannelDefinition_1b_5926::
    begin_loop $1f
        notelen 2
        note G_3
        notelen 1
        note G_3
        note G_3
    next_loop

    rest
    note C_2
    note A#1
    note A_1
    end_def

ChannelDefinition_1b_5933::
    enable_software_envelope

    begin_loop $02
        notelen 3
        note G_2
        notelen 4
        note G_2
        notelen 3
        note G_2
    next_loop

    note G_2
    notelen 4
    note G_2
    notelen 3
    note D_3
    note C_3
    notelen 4
    note C_3
    notelen 2
    note C_3
    note D_3
    notelen 3
    note D#3
    notelen 4
    note D#3
    notelen 3
    note D#3
    note F_3
    notelen 4
    note F_3
    notelen 3
    note F_3
    note A#2
    note A#2
    note C_3
    note C_3
    note D_3
    notelen 4
    note D_3
    notelen 1
    note D_3
    note C_3
    note A#2
    note A_2
    notelen 3
    note G_2
    notelen 4
    note G_2
    notelen 3
    note G_2
    note G#2
    notelen 4
    note G#2
    notelen 3
    note G#2
    note G_2
    notelen 4
    note G_2
    notelen 3
    note F_2
    note E_2
    notelen 4
    note E_2
    notelen 3
    note E_2
    note G#2
    notelen 4
    note G#2
    notelen 3
    note G#2
    note D_3
    rest
    rest
    disable_software_envelope
    note D_2
    end_def

ChannelDefinition_1b_597f::
    notelen 6
    note G_2
    note D_3
    notelen 2
    note G_2
    notelen 6
    note F_2
    note C_3
    notelen 2
    note F_2
    notelen 6
    note D#2
    note A#2
    notelen 2
    note D#2
    notelen 6
    note F_2
    note C_3
    notelen 2
    note F_2
    end_def

ChannelDefinition_1b_5994::
    begin_loop $1f
        notelen 2
        note NOISE_3
        notelen 1
        note NOISE_3
        note NOISE_3
    next_loop

    note NOISE_5
    note NOISE_5
    note NOISE_5
    note NOISE_5
    end_def

ChannelDefinition_1b_59a1::
    begin_loop $0d
        notelen 2
        note NOISE_5
        notelen 1
        note NOISE_5
        note NOISE_5
        notelen 2
        note NOISE_5
        notelen 1
        note NOISE_5
        note NOISE_5
        notelen 2
        note NOISE_5
        notelen 1
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
    next_loop

    end_def

ChannelDefinition_1b_59b8::
    notelen 1
    note NOISE_5
    note NOISE_5
    note NOISE_5
    note NOISE_5
    notelen 3
    note NOISE_5
    notelen 4
    rest
    end_def

ChannelDefinition_1b_59c2::
    begin_loop $17
        notelen 2
        note NOISE_5
        notelen 1
        note NOISE_5
        note NOISE_5
        notelen 2
        note NOISE_5
        notelen 1
        note NOISE_5
        note NOISE_5
        notelen 2
        note NOISE_5
        notelen 1
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
    next_loop

    end_def

ChannelDefinition_1b_59d9::
    begin_loop $0c
        notelen 2
        note NOISE_5
        notelen 1
        note NOISE_5
        note NOISE_5
        notelen 2
        note NOISE_5
        notelen 1
        note NOISE_5
        note NOISE_5
        notelen 2
        note NOISE_5
        notelen 1
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
    next_loop

    end_def

Music07::
    db   $00
    dw   MusicSpeedData_1b_4b04
    dw   Music07Channel1
    dw   Music07Channel2
    dw   Music07Channel3
    dw   $0000

Music07Channel1::
    dw   ChannelDefinition_1b_5a0f
    dw   $ffff, Music07Channel1

Music07Channel2::
    dw   ChannelDefinition_1b_5a3f
    dw   $ffff, Music07Channel2

Music07Channel3::
    dw   ChannelDefinition_1b_6f46
    dw   ChannelDefinition_1b_5a7a
    dw   $ffff, Music07Channel3

ChannelDefinition_1b_5a0f::
    set_envelope_duty $44, $00, 2, 0
    disable_unknown2

    begin_loop $02
        notelen 3
        rest
        notelen 2
        note A#3
        notelen 1
        note G_6
        note G_6
        notelen 3
        rest
        notelen 2
        note A_3
        notelen 1
        note G_6
        note G_6
    next_loop

    set_envelope_duty $24, $00, 2, 0
    notelen 3
    rest
    notelen 2
    note C#5
    note C_5
    note B_4
    note C#5
    note A#4
    note B_4
    note A_4
    note B_4
    note G#4
    note A_4
    note G_4
    note F#4
    notelen 4
    rest
    enable_unknown2
    notelen 1
    note G_6
    note G_6
    end_def

ChannelDefinition_1b_5a3f::
    set_envelope_duty $50, $84, 0, 0
    notelen 6
    note G_5
    notelen 1
    note D_5
    notelen 2
    note B_4
    note G_4
    notelen 3
    note G#4
    notelen 1
    note D#5
    note C_5
    note G#4
    note D#4
    notelen 2
    note D_4
    notelen 1
    note D_5
    note B_4
    notelen 2
    note G_4
    note D_4
    note F_4
    notelen 1
    note D#4
    note F_4
    notelen 3
    note D_4
    set_envelope_duty $24, $00, 0, 0
    notelen 2
    note C#4
    note D_4
    note D#5
    note D_5
    note C#5
    note D_5
    note C_5
    note C#5
    note B_4
    note C_5
    note A#4
    note B_4
    notelen 1
    note A_4
    note A#4
    note G#4
    note A_4
    notelen 3
    rest
    notelen 7
    rest
    end_def

ChannelDefinition_1b_5a7a::
    begin_loop $02
        enable_software_envelope
        notelen 2
        note G_3
        note C#4
        note F#4
        note C#4
        note D_3
        note C_4
        note F_4
        note C_4
    next_loop

    notelen 5
    rest
    rest
    notelen 7
    rest
    end_def

Music08::
    db   $00
    dw   MusicSpeedData_1b_4ad7
    dw   Music08Channel1
    dw   Music08Channel2
    dw   Music08Channel3
    dw   Music08Channel4

Music08Channel1::
    dw   ChannelDefinition_1b_702a
    dw   ChannelDefinition_1b_705e
    dw   ChannelDefinition_1b_6fb1
    dw   ChannelDefinition_1b_5af9
    dw   ChannelDefinition_1b_6fac
    dw   ChannelDefinition_1b_5af9
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_5ae0
    dw   ChannelDefinition_1b_702a
    dw   ChannelDefinition_1b_5ae0
    dw   ChannelDefinition_1b_7061
    dw   $ffff, Music08Channel1

Music08Channel2::
    dw   ChannelDefinition_1b_6fb1
    dw   ChannelDefinition_1b_5b21
    dw   ChannelDefinition_1b_6fac
    dw   ChannelDefinition_1b_5b28
    dw   ChannelDefinition_1b_5b00
    dw   ChannelDefinition_1b_5b00
    dw   ChannelDefinition_1b_7061
    dw   $ffff, Music08Channel2

Music08Channel3::
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_7061
    dw   ChannelDefinition_1b_5b2f
    dw   ChannelDefinition_1b_5b45
    dw   ChannelDefinition_1b_5b2f
    dw   ChannelDefinition_1b_5b45
    dw   ChannelDefinition_1b_7061
    dw   $ffff, Music08Channel3

Music08Channel4::
    dw   ChannelDefinition_1b_5b68
    dw   ChannelDefinition_1b_5b5a
    dw   ChannelDefinition_1b_5b68
    dw   $ffff, Music08Channel4

ChannelDefinition_1b_5ae0::
    set_envelope_duty $33, $00, 2, 0

    begin_loop $04
        notelen 1
        note G_4
        note F#4
        note F_4
        note E_4
        note D#4
        note D_4
        note C#4
        note C_4
        note B_3
        note C_4
        note C#4
        note D_4
        note D#4
        note E_4
        note F_4
        note F#4
    next_loop

    end_def

ChannelDefinition_1b_5af9::
    begin_loop $04
        notelen 1
        note A#3
        note A_3
    next_loop

    end_def

ChannelDefinition_1b_5b00::
    set_envelope_duty $40, $81, 2, 0
    notelen 7
    note G_4
    notelen 2
    note D_4
    note G_4
    note A_4
    note B_4
    note D_5
    notelen 7
    note C#5
    notelen 2
    note D_5
    notelen 4
    note D#5
    notelen 7
    note G_4
    notelen 2
    note D_4
    note G_4
    note A_4
    note B_4
    note D_5
    notelen 7
    note C#5
    notelen 2
    note D_5
    notelen 4
    note D#6
    end_def

ChannelDefinition_1b_5b21::
    begin_loop $0c
        notelen 1
        note G_4
        note F#4
    next_loop

    end_def

ChannelDefinition_1b_5b28::
    begin_loop $04
        notelen 1
        note G_4
        note F#4
    next_loop

    end_def

ChannelDefinition_1b_5b2f::
    enable_software_envelope
    notelen 3
    note G_2
    notelen 2
    note D_3
    notelen 3
    note G_2
    notelen 2
    note G_2
    note G#2
    note D#3
    notelen 3
    note G_2
    notelen 2
    note D_3
    notelen 3
    note G_2
    notelen 2
    note G_2
    note F_2
    note F#2
    end_def

ChannelDefinition_1b_5b45::
    notelen 3
    note G_2
    notelen 2
    note D_3
    notelen 3
    note G_2
    notelen 2
    note G_2
    note G#2
    note D#3
    notelen 3
    note G_2
    notelen 2
    note D_3
    notelen 3
    note G_2
    notelen 2
    note G_2
    note D_3
    note G_3
    end_def

ChannelDefinition_1b_5b5a::
    begin_loop $08
        notelen 2
        note NOISE_9
        note NOISE_9
        note NOISE_9
        note NOISE_9
        notelen 3
        note NOISE_FF
        notelen 2
        note NOISE_9
        note NOISE_9
    next_loop

    end_def

ChannelDefinition_1b_5b68::
    notelen 3
    note NOISE_9
    notelen 2
    note NOISE_9
    note NOISE_9
    notelen 3
    note NOISE_FF
    notelen 2
    note NOISE_9
    note NOISE_9
    notelen 2
    note NOISE_9
    note NOISE_9
    note NOISE_9
    note NOISE_9
    notelen 3
    note NOISE_FF
    notelen 2
    note NOISE_9
    note NOISE_9
    end_def

Music09::
    db   $00
    dw   MusicSpeedData_1b_4b04
    dw   Music09Channel1
    dw   Music09Channel2
    dw   Music09Channel3
    dw   Music09Channel4

Music09Channel1::
    dw   ChannelDefinition_1b_7061

MusicLoop_1b_5b8a::
    dw   ChannelDefinition_1b_5bae
    dw   ChannelDefinition_1b_5bae
    dw   ChannelDefinition_1b_5bbe
    dw   $ffff, MusicLoop_1b_5b8a

Music09Channel2::
    dw   ChannelDefinition_1b_5bd3

MusicLoop_1b_5b96::
    dw   ChannelDefinition_1b_5bf4
    dw   $ffff, MusicLoop_1b_5b96

Music09Channel3::
    dw   ChannelDefinition_1b_7061

MusicLoop_1b_5b9e::
    dw   ChannelDefinition_1b_6f6b
    dw   ChannelDefinition_1b_5c26
    dw   ChannelDefinition_1b_5c44
    dw   $ffff, MusicLoop_1b_5b9e

Music09Channel4::
    dw   ChannelDefinition_1b_5c61
    dw   $ffff, Music09Channel4

ChannelDefinition_1b_5bae::
    set_envelope_duty $23, $00, 2, 0

    begin_loop $20
        notelen 0
        note A#4
        note C_5
    next_loop

    begin_loop $20
        note C_5
        note C#5
    next_loop

    end_def

ChannelDefinition_1b_5bbe::
    begin_loop $20
        note A#4
        note F_4
    next_loop

    begin_loop $20
        note A_4
        note E_4
    next_loop

    begin_loop $20
        note A#4
        note D#4
    next_loop

    begin_loop $20
        note A_4
        note E_4
    next_loop

    end_def

ChannelDefinition_1b_5bd3::
    set_envelope_duty $81, $82, 0, 0
    notelen 2
    note G_1
    note D_2
    notelen 1
    note F_2
    notelen 2
    note F#2
    notelen 1
    note G_2
    notelen 7
    rest
    notelen 1
    note F_1
    note F#1
    notelen 2
    note G_1
    notelen 1
    note D_2
    notelen 2
    note F_2
    note F#2
    notelen 1
    note G_2
    notelen 7
    rest
    notelen 1
    note F_1
    note F#1
    end_def

ChannelDefinition_1b_5bf4::
    set_envelope_duty $40, $00, 2, 1

    begin_loop $02
        notelen 4
        note G_4
        note D_4
        notelen 8
        note D_4
        notelen 0
        note G_4
        note F#4
        note G_4
        note A_4
        note A#4
        note A_4
        note A#4
        note C_5
        notelen 6
        note D_5
        note D#5
        notelen 2
        note F_5
        notelen 8
        note G_5
        notelen 2
        note G_5
        note F_5
        notelen 6
        note D#5
        note C_5
        notelen 2
        note G#4
    next_loop

    set_envelope_duty $30, $00, 0, 1
    notelen 5
    note G_4
    note D_4
    note D#4
    note E_4
    note F_4
    note F_4
    note F#4
    note F#4
    end_def

ChannelDefinition_1b_5c26::
    enable_software_envelope
    notelen 2
    note G_2
    note D_3
    notelen 1
    note F_3
    notelen 2
    note F#3
    notelen 1
    note G_3
    notelen 7
    rest
    notelen 1
    note F_2
    note F#2
    notelen 2
    note G_2
    notelen 1
    note D_3
    notelen 2
    note F_3
    note F#3
    notelen 1
    note G_3
    notelen 7
    rest
    notelen 1
    note F#2
    note G_2
    end_def

ChannelDefinition_1b_5c44::
    notelen 2
    note G#2
    note D#3
    notelen 1
    note F#3
    notelen 2
    note G_3
    notelen 1
    note G#3
    notelen 7
    rest
    notelen 1
    note F#2
    note G_2
    notelen 2
    note G#2
    notelen 1
    note D#3
    notelen 2
    note F#3
    note G_3
    notelen 1
    note G#3
    notelen 7
    rest
    notelen 1
    note F_2
    note F#2
    end_def

ChannelDefinition_1b_5c61::
    begin_loop $04
        notelen 1
        note NOISE_9
    next_loop

    note NOISE_FF

    begin_loop $05
        note NOISE_9
    next_loop

    note NOISE_FF

    begin_loop $05
        note NOISE_9
    next_loop

    end_def

Music0a::
    db   $04
    dw   MusicSpeedData_1b_4ae6
    dw   Music0aChannel1
    dw   Music0aChannel2
    dw   Music0aChannel3
    dw   $0000

Music0aChannel1::
    dw   ChannelDefinition_1b_702d
    dw   ChannelDefinition_1b_707a

MusicLoop_1b_5c80::
    dw   ChannelDefinition_1b_5c8e
    dw   $ffff, MusicLoop_1b_5c80

Music0aChannel2::
    dw   ChannelDefinition_1b_7032
    dw   ChannelDefinition_1b_5c8e
    dw   $ffff, Music0aChannel2

ChannelDefinition_1b_5c8e::
    notelen 2
    note A_4
    note F_3
    note C_4
    note E_4
    note G_4
    note A_4
    note A#4
    note G_3
    note D_4
    note F_4
    note A_4
    note A#4
    note C_5
    note A_3
    note E_4
    note G_4
    note G_5
    note F_5
    note C_5
    note D_3
    note A_3
    note C_4
    note A#4
    note A_4
    note A_4
    note G_3
    note D_4
    note F_4
    note G_4
    note A_4
    note A#4
    note G_3
    note C#4
    note F_4
    note A_4
    note A#4
    note G_4
    note C_3
    note G_3
    note A#3
    note C#4
    note F_4
    note E_4
    note C_4
    note D_4
    note E_4
    note F_4
    note G_4
    note A_4
    note F_3
    note C_4
    note E_4
    note G_4
    note A_4
    note A#4
    note G_3
    note D_4
    note F_4
    note A_4
    note A#4
    note C_5
    note A_3
    note E_4
    note G_4
    note A_5
    note G_5
    note G_5
    note D_3
    note A_3
    note F#5
    note D#5
    note D_5
    note C_5
    note G_3
    note D_4
    note F_4
    note A#4
    note A_4
    note A_4
    note C_3
    note G_3
    note A#3
    note G_4
    note A_4
    note F_4
    note A#3
    note F_4
    note A_4
    note A#4
    note A_5
    note G_5
    note A_3
    note E_4
    note G_4
    note A_4
    note E_5
    note D_5
    note G_3
    note D_4
    note F_4
    note G_4
    note D_5
    note C#5
    note C_3
    note G_3
    note A#3
    note C#4
    note F_4
    note C_5
    note C_3
    note E_3
    note G_3
    note C_4
    note E_4
    notelen 3
    note C_5
    notelen 2
    note C_5
    notelen 7
    note C_6
    note C_3
    end_def

Music0b::
    db   $00
    dw   MusicSpeedData_1b_4b04
    dw   Music0bChannel1
    dw   Music0bChannel2
    dw   Music0bChannel3
    dw   Music0bChannel4

Music0bChannel1::
    dw   ChannelDefinition_1b_705e

MusicLoop_1b_5d16::
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_5d3e
    dw   ChannelDefinition_1b_702a
    dw   ChannelDefinition_1b_5d3e
    dw   $ffff, MusicLoop_1b_5d16

Music0bChannel2::
    dw   ChannelDefinition_1b_705e

MusicLoop_1b_5d24::
    dw   ChannelDefinition_1b_5d60
    dw   ChannelDefinition_1b_5d60
    dw   $ffff, MusicLoop_1b_5d24

Music0bChannel3::
    dw   ChannelDefinition_1b_705e

MusicLoop_1b_5d2e::
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_5d7b
    dw   ChannelDefinition_1b_5d7b
    dw   $ffff, MusicLoop_1b_5d2e

Music0bChannel4::
    dw   ChannelDefinition_1b_5da5
    dw   $ffff, Music0bChannel4

ChannelDefinition_1b_5d3e::
    set_envelope_duty $44, $00, 2, 0
    notelen 2
    rest
    notelen 1
    note D_3
    note D_3
    notelen 2
    note C#3
    notelen 3
    rest
    notelen 1
    note D_3
    note D_3
    notelen 2
    note D#3
    notelen 3
    rest
    notelen 1
    note D_3
    note D_3
    notelen 2
    note C#3
    notelen 3
    rest
    notelen 1
    note D_3
    note C#3
    notelen 2
    note D_3
    rest
    end_def

ChannelDefinition_1b_5d60::
    set_envelope_duty $64, $00, 0, 0

    begin_loop $02
        notelen 2
        note G_3
        note D_3
        notelen 1
        note G_3
        note A_3
        note B_3
        note C_4
        notelen 2
        note D_4
        notelen 0
        note F#4
        notelen 1
        note G_4
        notelen 0
        rest
        notelen 2
        note D_4
        rest
    next_loop

    end_def

ChannelDefinition_1b_5d7b::
    enable_software_envelope
    notelen 2
    note G_2
    notelen 1
    note G_3
    note G_3
    notelen 2
    note F#3
    notelen 1
    note D_3
    note D_3
    notelen 2
    note G_2
    notelen 1
    note G_3
    note G_3
    notelen 2
    note G#3
    notelen 1
    note G#2
    note G#2
    notelen 2
    note G_2
    notelen 1
    note G_3
    note G_3
    notelen 2
    note F#3
    notelen 1
    note D_3
    note D_3
    notelen 2
    note G_2
    notelen 1
    note G_3
    note F#3
    notelen 2
    note G_3
    notelen 1
    note G_2
    note G_2
    end_def

ChannelDefinition_1b_5da5::
    notelen 2
    note NOISE_9
    notelen 1
    note NOISE_9
    note NOISE_9
    notelen 2
    note NOISE_FF
    notelen 1
    note NOISE_9
    note NOISE_9
    notelen 1
    note NOISE_9
    note NOISE_9
    note NOISE_9
    note NOISE_9
    notelen 2
    note NOISE_FF
    note NOISE_6
    end_def

Music0c::
    db   $00
    dw   MusicSpeedData_1b_4ac8
    dw   Music0cChannel1
    dw   Music0cChannel2
    dw   Music0cChannel3
    dw   $0000

Music0cChannel1::
    dw   ChannelDefinition_1b_5df1
    dw   ChannelDefinition_1b_7080

MusicLoop_1b_5dc7::
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_5df6
    dw   ChannelDefinition_1b_7021
    dw   ChannelDefinition_1b_5df6
    dw   $ffff, MusicLoop_1b_5dc7

Music0cChannel2::
    dw   ChannelDefinition_1b_7037
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_5df6
    dw   ChannelDefinition_1b_7021
    dw   ChannelDefinition_1b_5df6
    dw   $ffff, Music0cChannel2

Music0cChannel3::
    dw   ChannelDefinition_1b_707a

MusicLoop_1b_5de3::
    dw   ChannelDefinition_1b_6f65
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_5df6
    dw   ChannelDefinition_1b_7021
    dw   ChannelDefinition_1b_5df6
    dw   $ffff, MusicLoop_1b_5de3

ChannelDefinition_1b_5df1::
    set_envelope_duty $44, $00, 2, 0
    end_def

ChannelDefinition_1b_5df6::
    notelen 2
    note B_2
    note C#3
    note E_3
    note G_3
    note B_3
    note C#4
    note E_4
    note G_4
    note B_4
    note C#5
    note E_5
    note G_5
    note B_5
    note C#6
    note E_6
    note G_6
    end_def

Music0d::
    db   $00
    dw   MusicSpeedData_1b_4ac8
    dw   Music0dChannel1
    dw   Music0dChannel2
    dw   Music0dChannel3
    dw   $0000

Music0dChannel1::
    dw   ChannelDefinition_1b_505b
    dw   $ffff, Music0dChannel1

Music0dChannel2::
    dw   ChannelDefinition_1b_50d9
    dw   $ffff, Music0dChannel2

Music0dChannel3::
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_517e
    dw   $ffff, Music0dChannel3

Music0e::
    db   $00
    dw   MusicSpeedData_1b_4ab9
    dw   Music0eChannel1
    dw   Music0eChannel2
    dw   Music0eChannel3
    dw   $0000

Music0eChannel1::
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_6f8e
    dw   ChannelDefinition_1b_5e6e
    dw   ChannelDefinition_1b_5e6e
    dw   ChannelDefinition_1b_6f93
    dw   ChannelDefinition_1b_5e6e
    dw   ChannelDefinition_1b_5e6e
    dw   ChannelDefinition_1b_7021
    dw   ChannelDefinition_1b_6f8e
    dw   ChannelDefinition_1b_5e6e
    dw   ChannelDefinition_1b_5e6e
    dw   ChannelDefinition_1b_6f93
    dw   ChannelDefinition_1b_5e6e
    dw   ChannelDefinition_1b_5e6e
    dw   $ffff, Music0eChannel1

Music0eChannel2::
    dw   ChannelDefinition_1b_5e78
    dw   ChannelDefinition_1b_5e91
    dw   ChannelDefinition_1b_5e78
    dw   ChannelDefinition_1b_5e91
    dw   $ffff, Music0eChannel2

Music0eChannel3::
    dw   ChannelDefinition_1b_6f6b
    dw   ChannelDefinition_1b_5ea0
    dw   ChannelDefinition_1b_5ea0
    dw   ChannelDefinition_1b_6f75
    dw   ChannelDefinition_1b_5ea0
    dw   ChannelDefinition_1b_5ea0
    dw   $ffff, Music0eChannel3

ChannelDefinition_1b_5e6e::
    begin_loop $02
        notelen 2
        note C#2
        note D#2
        note D#2
    next_loop

    note C#2
    note D#2
    end_def

ChannelDefinition_1b_5e78::
    set_envelope_duty $70, $21, 1, 0
    notelen 7
    note B_3
    notelen 1
    note A_3
    note B_3
    notelen 7
    note C_4
    notelen 1
    note B_3
    note C_4
    notelen 7
    note C#4
    notelen 1
    note A_4
    note G_4
    notelen 2
    note C#4
    note C#5
    notelen 3
    note C#5
    end_def

ChannelDefinition_1b_5e91::
    set_envelope_duty $20, $21, 2, 1
    notelen 2
    note C#4
    note C#5
    notelen 8
    note C#5
    notelen 2
    note C#5
    note C#6
    notelen 8
    note C#6
    end_def

ChannelDefinition_1b_5ea0::
    enable_software_envelope
    notelen 7
    note G_2
    note G_2
    notelen 3
    note G_2
    end_def

Music0f::
    db   $00
    dw   MusicSpeedData_1b_4ab9
    dw   Music0fChannel1
    dw   Music0fChannel2
    dw   Music0fChannel3
    dw   $0000

Music0fChannel1::
    dw   ChannelDefinition_1b_5ecc
    dw   ChannelDefinition_1b_5ed1
    dw   ChannelDefinition_1b_5edb
    dw   $0000

Music0fChannel2::
    dw   ChannelDefinition_1b_5ed6
    dw   ChannelDefinition_1b_5edb
    dw   ChannelDefinition_1b_5ed1
    dw   $0000

Music0fChannel3::
    dw   ChannelDefinition_1b_6f55
    dw   ChannelDefinition_1b_7083
    dw   ChannelDefinition_1b_5edb
    dw   ChannelDefinition_1b_707a
    dw   $0000

ChannelDefinition_1b_5ecc::
    set_envelope_duty $26, $00, 2, 0
    end_def

ChannelDefinition_1b_5ed1::
    notelen 3
    rest
    notelen 1
    rest
    end_def

ChannelDefinition_1b_5ed6::
    set_envelope_duty $67, $00, 2, 1
    end_def

ChannelDefinition_1b_5edb::
    enable_unknown1
    notelen 1
    note G_5
    note F#5
    note D_5
    note B_4
    note G_4
    note F#4
    note D_4
    note B_3
    note A_5
    note G_5
    note E_5
    note C_5
    note A_4
    note G_4
    note E_4
    note C_4
    note B_5
    note A_5
    note F#5
    note D_5
    note B_4
    note A_4
    note F#4
    note D_4
    note C_6
    note B_5
    note G_5
    note E_5
    note C_5
    note B_4
    note G_4
    note E_4
    notelen 2
    note D_3
    note A_3
    note C_4
    note D_4
    note F#4
    note A_4
    note C_5
    note D_5
    notelen 8
    note D_6
    disable_unknown1
    end_def

Music31::
    db   $00
    dw   MusicSpeedData_1b_4ac8
    dw   Music31Channel1
    dw   Music31Channel2
    dw   Music31Channel3
    dw   $0000

Music31Channel1::
    dw   ChannelDefinition_1b_5f29
    dw   $ffff, MusicLoop_1b_5412

Music31Channel2::
    dw   ChannelDefinition_1b_5f5c
    dw   $ffff, MusicLoop_1b_5420

Music31Channel3::
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_5f85
    dw   $ffff, MusicLoop_1b_5430

ChannelDefinition_1b_5f29::
    set_envelope_duty $70, $21, 2, 1
    notelen 10
    rest
    note D_3
    note G_3
    notelen 3
    note B_3
    notelen 10
    note B_3
    note B_3
    note A_3
    notelen 3
    note B_3
    notelen 10
    rest
    note F_3
    note A#3
    notelen 3
    note D_4
    notelen 10
    note D_4
    note D_4
    note C_4
    notelen 3
    note D_4
    notelen 3
    rest

    begin_loop $02
        notelen 3
        note C#4
        notelen 2
        rest
        notelen 1
        note C#4
        note C#4
    next_loop

    notelen 8
    note C_4
    set_envelope_duty $40, $21, 2, 0
    notelen 10
    note C_3
    note B_2
    note A_2
    end_def

ChannelDefinition_1b_5f5c::
    set_envelope_duty $90, $21, 2, 1
    notelen 10
    note D_3
    note G_3
    note B_3
    notelen 8
    note D_4
    notelen 10
    note F_3
    note A#3
    note D_4
    notelen 8
    note F_4
    notelen 10
    note D_4
    note F_4
    note A#4

    begin_loop $02
        notelen 3
        note G#4
        notelen 2
        rest
        notelen 1
        note G#4
        note G#4
    next_loop

    notelen 8
    note A_4
    set_envelope_duty $60, $21, 2, 0
    notelen 10
    note A_3
    note G_3
    note F#3
    end_def

ChannelDefinition_1b_5f85::
    enable_software_envelope
    notelen 10
    rest
    rest
    note D_4
    disable_software_envelope
    notelen 3
    note G_4
    enable_software_envelope
    notelen 10
    note G_3
    note G_3
    note F_3
    disable_software_envelope
    notelen 3
    note G_3
    enable_software_envelope
    notelen 10
    rest
    rest
    note F_4
    disable_software_envelope
    notelen 3
    note A#4
    enable_software_envelope
    notelen 10
    note A#3
    note A#3
    note G#3
    disable_software_envelope
    notelen 3
    note A#3
    rest
    enable_software_envelope
    notelen 10
    note G#2
    note G_2
    note G#2
    note C#3
    note C_3
    note C#3
    note F_3
    note E_3
    note F_3
    note G#3
    note C#4
    note F_4
    note F#4
    note E_4
    note F#4
    note G_4
    note F#4
    note E_4
    notelen 3
    note D_4
    notelen 10
    note D_2
    note D_2
    note D_2
    end_def

Music32::
    db   $00
    dw   MusicSpeedData_1b_4ae6
    dw   Music32Channel1
    dw   Music32Channel2
    dw   Music32Channel3
    dw   $0000

Music32Channel1::
    dw   ChannelDefinition_1b_6fb6
    dw   ChannelDefinition_1b_5fdc
    dw   $ffff, Music32Channel1

Music32Channel2::
    dw   ChannelDefinition_1b_6fbb
    dw   ChannelDefinition_1b_5ffe
    dw   $ffff, Music32Channel2

ChannelDefinition_1b_5fdc::
    notelen 2
    note C_3
    note E_3
    note G_3
    note E_3
    note C_3
    note D_3
    note F#3
    note A_3
    note B_2
    note D_3
    note F#3
    note A_3
    note E_2
    note G_2
    note B_2
    note G_2
    note A_2
    note C_3
    note E_3
    note C_3
    note D_2
    note F#2
    note A_2
    note F#2
    note G_2
    note A_2
    note C_3
    note D_3
    note G_2
    note B_2
    note D_3
    note F_3
    end_def

ChannelDefinition_1b_5ffe::
    notelen 4
    note G_5
    notelen 2
    rest
    note F#5
    note A_5
    notelen 4
    note D_5
    notelen 2
    rest
    note G_5
    note G_4
    note A_4
    note B_4
    note C_5
    note B_4
    note C_5
    notelen 3
    note F#4
    note E_5
    notelen 5
    note D_5
    notelen 2
    rest
    end_def

Music33::
    db   $00
    dw   MusicSpeedData_1b_4ab9
    dw   Music33Channel1
    dw   Music33Channel2
    dw   Music33Channel3
    dw   $0000

Music33Channel1::
    dw   ChannelDefinition_1b_6059
    dw   ChannelDefinition_1b_6065
    dw   ChannelDefinition_1b_604e
    dw   ChannelDefinition_1b_604e
    dw   ChannelDefinition_1b_6059
    dw   ChannelDefinition_1b_606a
    dw   ChannelDefinition_1b_604e
    dw   ChannelDefinition_1b_604e
    dw   ChannelDefinition_1b_604e
    dw   $ffff, Music33Channel1

Music33Channel2::
    dw   ChannelDefinition_1b_607e
    dw   ChannelDefinition_1b_608a
    dw   ChannelDefinition_1b_606f
    dw   ChannelDefinition_1b_606f
    dw   ChannelDefinition_1b_607e
    dw   ChannelDefinition_1b_6090
    dw   ChannelDefinition_1b_606f
    dw   ChannelDefinition_1b_606f
    dw   ChannelDefinition_1b_606f
    dw   $ffff, Music33Channel2

ChannelDefinition_1b_604e::
    begin_loop $0c
        notelen 13
        rest
        rest
        rest
        rest
    next_loop

    notelen 5
    rest
    end_def

ChannelDefinition_1b_6059::
    set_envelope_duty $40, $41, 2, 0

    begin_loop $02
        notelen 3
        note G_2
        note C_3
        note C_3
    next_loop

    end_def

ChannelDefinition_1b_6065::
    notelen 3
    note B_2
    note F#2
    rest
    end_def

ChannelDefinition_1b_606a::
    notelen 3
    note C#3
    note G#2
    rest
    end_def

ChannelDefinition_1b_606f::
    set_envelope_duty $42, $00, 2, 0

    begin_loop $0c
        notelen 13
        note A#3
        note A_3
        note A#3
        rest
    next_loop

    notelen 5
    rest
    end_def

ChannelDefinition_1b_607e::
    set_envelope_duty $40, $41, 2, 0

    begin_loop $02
        notelen 3
        note B_2
        note E_3
        note E_3
    next_loop

    end_def

ChannelDefinition_1b_608a::
    notelen 3
    note D#3
    note A#2
    notelen 3
    rest
    end_def

ChannelDefinition_1b_6090::
    notelen 3
    note F_3
    note C_3
    notelen 3
    rest
    end_def

Music34::
    db   $00
    dw   MusicSpeedData_1b_4ad7
    dw   Music34Channel1
    dw   Music34Channel2
    dw   Music34Channel3
    dw   $0000

Music34Channel2::
    dw   ChannelDefinition_1b_60c1
    dw   ChannelDefinition_1b_60d9
    dw   ChannelDefinition_1b_60d9
    dw   ChannelDefinition_1b_60fa
    dw   ChannelDefinition_1b_7032
    dw   ChannelDefinition_1b_610f
    dw   ChannelDefinition_1b_7080
    dw   $0000

Music34Channel3::
    dw   ChannelDefinition_1b_6f4b
    dw   ChannelDefinition_1b_611d
    dw   ChannelDefinition_1b_6129
    dw   ChannelDefinition_1b_6f55
    dw   ChannelDefinition_1b_614c
    dw   ChannelDefinition_1b_6159
    dw   ChannelDefinition_1b_610f
    dw   $0000

ChannelDefinition_1b_60c1::
    set_envelope_duty $43, $00, 2, 0
    notelen 4
    rest
    notelen 2
    rest
    notelen 1
    note B_5
    note A_5
    notelen 2
    note B_5
    notelen 3
    rest
    notelen 1
    note C_6
    note B_5
    notelen 2
    note C_6
    notelen 3
    rest
    rest
    end_def

ChannelDefinition_1b_60d9::
    set_envelope_duty $55, $00, 0, 0
    set_speed MusicSpeedData_1b_4ab9

    begin_loop $02
        notelen 1
        note D_5
        note D#5
        note D_5
        note C#5
        note C_5
        note C#5
        note C_5
        note C#5
    next_loop

    notelen 2
    note D_5
    note D_6
    note D_5
    notelen 1
    note D_5
    note D#5
    note E_5
    note F_5
    note E_5
    note D#5
    notelen 3
    note D_5
    end_def

ChannelDefinition_1b_60fa::
    set_envelope_duty $35, $00, 1, 0

    begin_loop $02
        notelen 1
        note D_5
        note D#5
        note D_5
        note C#5
        note C_5
        note C#5
        note C_5
        note C#5
    next_loop

    notelen 5
    rest
    notelen 3
    rest
    end_def

ChannelDefinition_1b_610f::
    set_speed MusicSpeedData_1b_4ac8
    notelen 0
    note D_6
    note C_6
    note A#5
    note G#5
    note F#5
    note E_5
    notelen 3
    note D_5
    rest
    end_def

ChannelDefinition_1b_611d::
    notelen 4
    rest
    notelen 2
    rest
    enable_software_envelope
    notelen 3
    note F_5
    rest
    note F#5
    rest
    rest
    end_def

ChannelDefinition_1b_6129::
    set_speed MusicSpeedData_1b_4ab9
    enable_software_envelope

    begin_loop $02
        notelen 2
        note G_3
        note D_4
        note D_3
        note D_4
    next_loop

    begin_loop $02
        note G#3
        note D#4
        note D#3
        note D#4
    next_loop

    begin_loop $02
        note A#3
        note F_4
        note F_3
        note F_4
    next_loop

    note C_4
    note G_4
    note G_3
    note G_4
    note C_4
    note G_4
    note B_3
    note A_3
    end_def

ChannelDefinition_1b_614c::
    begin_loop $02
        notelen 2
        note G_3
        note D_4
        note D_3
        note D_4
    next_loop

    notelen 5
    rest
    notelen 3
    rest
    end_def

ChannelDefinition_1b_6159::
    set_speed MusicSpeedData_1b_4ac8
    notelen 1
    rest
    end_def

Music35::
    db   $00
    dw   MusicSpeedData_1b_4ad7
    dw   Music35Channel1
    dw   Music35Channel2
    dw   Music35Channel3
    dw   $0000

Music35Channel1::
    dw   ChannelDefinition_1b_6fc0
    dw   ChannelDefinition_1b_618c
    dw   ChannelDefinition_1b_6fc5
    dw   ChannelDefinition_1b_619a
    dw   ChannelDefinition_1b_619a
    dw   $0000

Music35Channel2::
    dw   ChannelDefinition_1b_6fc0
    dw   ChannelDefinition_1b_61c8
    dw   ChannelDefinition_1b_6fc5
    dw   ChannelDefinition_1b_61d6
    dw   ChannelDefinition_1b_61d6
    dw   $0000

Music35Channel3::
    dw   ChannelDefinition_1b_6f70
    dw   ChannelDefinition_1b_6204
    dw   ChannelDefinition_1b_6211
    dw   ChannelDefinition_1b_6211
    dw   $0000

ChannelDefinition_1b_618c::
    notelen 4
    rest
    notelen 1
    note F#2
    note G#2
    note A#2
    note B_2
    note C#3
    rest
    note C#3
    rest
    notelen 5
    note D_3
    end_def

ChannelDefinition_1b_619a::
    notelen 4
    rest
    notelen 2
    note C#3
    note D#3
    note F_3
    note F#3
    notelen 7
    note G#3
    notelen 2
    note A#3
    note G#3
    note F#3
    note F_3
    note D#3
    notelen 4
    note C#3
    notelen 2
    note F_3
    note F#3
    note G#3
    note C#4
    notelen 7
    note F_4
    notelen 2
    note F#4
    note F_4
    note D#4
    note C#4
    note C_4
    notelen 7
    note C#4
    notelen 1
    note G#3
    note G#3

    begin_loop $02
        notelen 2
        note C#4
        notelen 1
        note G#3
        note G#3
    next_loop

    notelen 5
    note C#4
    end_def

ChannelDefinition_1b_61c8::
    notelen 5
    rest
    notelen 1
    note G_3
    note A_3
    note B_3
    note C_4
    note D_4
    rest
    note D_4
    rest
    notelen 4
    note D#4
    end_def

ChannelDefinition_1b_61d6::
    notelen 5
    rest
    notelen 2
    note D_4
    note E_4
    note F#4
    note G_4
    notelen 7
    note A_4
    notelen 2
    note B_4
    note A_4
    note G_4
    note F#4
    note E_4
    notelen 4
    note D_4
    notelen 2
    note F#4
    note G_4
    note A_4
    note D_5
    notelen 7
    note F#5
    notelen 2
    note G_5
    note F#5
    note E_5
    note D_5
    note C#5
    notelen 7
    note D_5
    notelen 1
    note A_4
    note A_4

    begin_loop $02
        notelen 2
        note D_5
        notelen 1
        note A_4
        note A_4
    next_loop

    notelen 4
    note D_5
    end_def

ChannelDefinition_1b_6204::
    disable_software_envelope
    notelen 1
    note F_2
    note G_2
    note A_2
    note A#2
    note C_3
    rest
    note C_3
    rest
    notelen 14
    note C#3
    end_def

ChannelDefinition_1b_6211::
    notelen 2
    note C_3
    note D_3
    note E_3
    note F_3
    notelen 7
    note G_3
    notelen 2
    note A_3
    note G_3
    note F_3
    note E_3
    note D_3
    notelen 4
    note C_3
    notelen 2
    note E_3
    note F_3
    note G_3
    note C_4
    notelen 7
    note E_4
    notelen 2
    note F_4
    note E_4
    note D_4
    note C_4
    note B_3
    notelen 3
    note C_4
    notelen 2
    rest
    enable_software_envelope
    notelen 1
    note G_3
    note G_3

    begin_loop $02
        notelen 2
        note C_4
        notelen 1
        note G_3
        note G_3
    next_loop

    disable_software_envelope
    notelen 14
    note C_4
    end_def

Music36::
    db   $00
    dw   MusicSpeedData_1b_4ad7
    dw   Music36Channel1
    dw   Music36Channel2
    dw   Music36Channel3
    dw   $0000

Music36Channel2::
    dw   ChannelDefinition_1b_626c
    dw   ChannelDefinition_1b_6271
    dw   ChannelDefinition_1b_6fa2
    dw   ChannelDefinition_1b_6271
    dw   ChannelDefinition_1b_6282
    dw   ChannelDefinition_1b_6fb6
    dw   ChannelDefinition_1b_62ba
    dw   $0000

Music36Channel3::
    dw   ChannelDefinition_1b_6f55
    dw   ChannelDefinition_1b_62c7
    dw   ChannelDefinition_1b_6f4b
    dw   ChannelDefinition_1b_62c7
    dw   ChannelDefinition_1b_62d9
    dw   ChannelDefinition_1b_6f55
    dw   ChannelDefinition_1b_6300
    dw   $0000

ChannelDefinition_1b_626c::
    set_envelope_duty $40, $26, 0, 1
    end_def

ChannelDefinition_1b_6271::
    notelen 1
    note B_6
    notelen 6
    note B_6
    notelen 1
    note G_6
    notelen 6
    note G_6
    notelen 1
    note D_6
    notelen 6
    note D_6
    notelen 1
    note G_6
    notelen 6
    note G_6
    end_def

ChannelDefinition_1b_6282::
    notelen 6
    note D_4
    notelen 1
    note D_4
    notelen 3
    note B_3
    notelen 6
    note C_4
    notelen 1
    note C_4
    notelen 3
    note G#3
    notelen 1
    note D_4
    notelen 2
    note D_4
    notelen 1
    note E_4
    note D_4
    note B_3
    note G_3
    note B_3
    notelen 2
    note C_4
    note B_6
    notelen 3
    note B_6
    notelen 6
    note D_4
    notelen 1
    note D_4
    notelen 3
    note B_3
    notelen 6
    note G_4
    notelen 1
    note G_4
    notelen 3
    note D#4
    notelen 1
    note D_4
    notelen 2
    note D_4
    notelen 1
    note E_4
    notelen 2
    note D_4
    notelen 1
    note G_4
    note B_4
    notelen 2
    note C_5
    note B_6
    notelen 3
    note B_6
    end_def

ChannelDefinition_1b_62ba::
    notelen 6
    note D_4
    notelen 1
    note D_4
    notelen 3
    note B_3
    notelen 6
    note C_4
    notelen 1
    note C_4
    notelen 3
    note G#3
    end_def

ChannelDefinition_1b_62c7::
    enable_software_envelope
    notelen 1
    note A#6
    notelen 6
    note A#6
    notelen 1
    note F#6
    notelen 6
    note F#6
    notelen 1
    note C#6
    notelen 6
    note C#6
    notelen 1
    note F#6
    notelen 6
    note F#6
    end_def

ChannelDefinition_1b_62d9::
    begin_loop $02
        notelen 2
        note G_2
        notelen 1
        note B_2
        note D_3
        notelen 2
        note D_2
        notelen 1
        note B_2
        note D_3
        notelen 2
        note G#2
        notelen 1
        note C_3
        note D#3
        notelen 2
        note D#2
        notelen 1
        note C_3
        note D#3
        notelen 2
        note G_2
        notelen 1
        note B_2
        note D_3
        notelen 2
        note D_2
        notelen 1
        note B_2
        note D_3
        notelen 2
        note G#2
        note A#6
        note A#6
        note D_2
    next_loop

    end_def

ChannelDefinition_1b_6300::
    notelen 2
    note G_2
    notelen 1
    note B_2
    note D_3
    notelen 2
    note D_2
    notelen 1
    note B_2
    note D_3
    notelen 2
    note G#2
    notelen 1
    note C_3
    note D#3
    notelen 2
    note D#2
    notelen 1
    note C_3
    note D#3
    end_def

Music39::
    db   $00
    dw   MusicSpeedData_1b_4ab9
    dw   Music39Channel1
    dw   Music39Channel2
    dw   Music39Channel3
    dw   Music39Channel4

Music39Channel1::
    dw   ChannelDefinition_1b_706b
    dw   ChannelDefinition_1b_6fac
    dw   ChannelDefinition_1b_636e
    dw   ChannelDefinition_1b_6fca
    dw   ChannelDefinition_1b_637f

MusicLoop_1b_632a::
    dw   ChannelDefinition_1b_6f8e
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_6394
    dw   ChannelDefinition_1b_6fd9
    dw   ChannelDefinition_1b_7027
    dw   ChannelDefinition_1b_6394
    dw   $ffff, MusicLoop_1b_632a

Music39Channel2::
    dw   ChannelDefinition_1b_6fac
    dw   ChannelDefinition_1b_63a3
    dw   ChannelDefinition_1b_63b2
    dw   ChannelDefinition_1b_6fca
    dw   ChannelDefinition_1b_63c1

MusicLoop_1b_6344::
    dw   ChannelDefinition_1b_6fcf
    dw   ChannelDefinition_1b_63d6
    dw   ChannelDefinition_1b_6fd4
    dw   ChannelDefinition_1b_63d6
    dw   $ffff, MusicLoop_1b_6344

Music39Channel3::
    dw   ChannelDefinition_1b_6f46
    dw   ChannelDefinition_1b_63e5
    dw   ChannelDefinition_1b_7061
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_63f4

MusicLoop_1b_635a::
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_6404
    dw   ChannelDefinition_1b_6404
    dw   $ffff, MusicLoop_1b_635a

Music39Channel4::
    dw   ChannelDefinition_1b_6420
    dw   ChannelDefinition_1b_6428

MusicLoop_1b_6368::
    dw   ChannelDefinition_1b_642e
    dw   $ffff, MusicLoop_1b_6368

ChannelDefinition_1b_636e::
    notelen 8
    rest
    notelen 1
    note A#3
    note B_3
    note A#4
    note B_4
    notelen 8
    rest
    notelen 1
    note B_3
    note C_4
    note B_4
    note C_5
    notelen 8
    rest
    end_def

ChannelDefinition_1b_637f::
    begin_loop $05
        notelen 1
        note G_5
        note G#5
        note G_5
        note F#5
    next_loop

    note G_5
    note F#5
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
    end_def

ChannelDefinition_1b_6394::
    begin_loop $04
        notelen 2
        note D#4
        note C_4
        note C_4
        note D#4
        note C_4
        note C_4
        note D#4
        note C_4
        note D#4
        note C_4
    next_loop

    end_def

ChannelDefinition_1b_63a3::
    notelen 5
    rest

    begin_loop $08
        notelen 1
        note D_2
        note D#2
    next_loop

    notelen 3
    note D_2
    notelen 14
    rest
    notelen 5
    rest
    end_def

ChannelDefinition_1b_63b2::
    notelen 1
    note E_4
    note F_4
    note E_5
    note F_5
    notelen 8
    rest
    notelen 1
    note F_4
    note F#4
    note F_5
    note F#5
    notelen 8
    rest
    end_def

ChannelDefinition_1b_63c1::
    begin_loop $05
        notelen 1
        note G_4
        note G#4
        note G_4
        note F#4
    next_loop

    note G_4
    note F#4
    note F_4
    note E_4
    note D#4
    note D_4
    note C#4
    note C_4
    note B_3
    note A#3
    note A_3
    note G#3
    end_def

ChannelDefinition_1b_63d6::
    begin_loop $04
        notelen 2
        note G_4
        rest
        rest
        note F#4
        rest
        rest
        note G_4
        rest
        note G#4
        rest
    next_loop

    end_def

ChannelDefinition_1b_63e5::
    disable_software_envelope

    begin_loop $10
        notelen 1
        note G_2
        note G#2
    next_loop

    enable_software_envelope
    notelen 3
    note A_2
    notelen 14
    rest
    notelen 5
    rest
    end_def

ChannelDefinition_1b_63f4::
    notelen 5
    rest
    enable_software_envelope

    begin_loop $04
        notelen 2
        note G_3
    next_loop

    note G_2
    note G_2
    notelen 1
    note G_2
    note G_2
    note G#2
    note G_2
    end_def

ChannelDefinition_1b_6404::
    enable_software_envelope

    begin_loop $04
        notelen 1
        note C_4
        note C_4
        note C_3
        note C_3
        notelen 2
        note C_3
        notelen 1
        note C_4
        note C_4
        note C_3
        note C_3
        notelen 2
        note C_3
        notelen 1
        note C_4
        note C_4
        note C_3
        note C_3
        note C_4
        note C_4
        note C_3
        note C_3
    next_loop

    end_def

ChannelDefinition_1b_6420::
    begin_loop $04
        notelen 5
        rest
    next_loop

    notelen 8
    rest
    end_def

ChannelDefinition_1b_6428::
    begin_loop $04
        notelen 5
        rest
    next_loop

    end_def

ChannelDefinition_1b_642e::
    begin_loop $02
        notelen 1
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_5
        notelen 2
        rest
    next_loop

    begin_loop $08
        notelen 1
        note NOISE_5
    next_loop

    end_def

Music3a::
    db   $00
    dw   MusicSpeedData_1b_4af5
    dw   Music3aChannel1
    dw   Music3aChannel2
    dw   Music3aChannel3
    dw   Music3aChannel4

Music3aChannel2::
    dw   ChannelDefinition_1b_6fb6
    dw   ChannelDefinition_1b_6461
    dw   ChannelDefinition_1b_6480
    dw   $ffff, Music3aChannel2

Music3aChannel3::
    dw   ChannelDefinition_1b_6f6b
    dw   ChannelDefinition_1b_64b5
    dw   $ffff, Music3aChannel3

Music3aChannel4::
    dw   ChannelDefinition_1b_64d0
    dw   $ffff, Music3aChannel4

ChannelDefinition_1b_6461::
    notelen 4
    rest
    notelen 7
    rest
    notelen 13
    note G#4
    note A#4
    note G#4
    notelen 3
    note G_4
    rest
    notelen 7
    rest
    notelen 1
    note C_4
    note F_4
    notelen 3
    note D_4
    rest
    notelen 7
    rest
    notelen 13
    note G#3
    note A#3
    note G#3
    notelen 3
    note G_3
    rest
    notelen 7
    rest
    end_def

ChannelDefinition_1b_6480::
    set_envelope_duty $40, $21, 0, 1
    notelen 13
    note D_4
    note D#4
    note E_4
    notelen 6
    note F_4
    notelen 1
    note B_3
    notelen 7
    note F_4
    notelen 13
    note E_4
    note F_4
    note E_4
    notelen 2
    note D_4
    note C_4
    notelen 6
    note D_4
    notelen 1
    note G_3
    notelen 4
    note D_4
    notelen 2
    rest
    notelen 13
    note D_4
    note D#4
    note E_4
    notelen 6
    note F_4
    notelen 1
    note B_3
    notelen 7
    note F_4
    notelen 13
    note E_4
    note F_4
    note E_4
    notelen 2
    note D_4
    note C_4
    notelen 6
    note D_4
    notelen 1
    note G_3
    notelen 8
    note D_4
    end_def

ChannelDefinition_1b_64b5::
    enable_software_envelope

    begin_loop $04
        notelen 6
        note G_2
        notelen 1
        note B_2
        notelen 2
        note D_3
        note G_2
        note G#2
        note C_3
        notelen 3
        note D#3
        notelen 6
        note G_2
        notelen 1
        note B_2
        notelen 2
        note D_3
        note G_2
        note D_2
        note G#2
        notelen 3
        note C_3
    next_loop

    end_def

ChannelDefinition_1b_64d0::
    begin_loop $03
        notelen 2
        note NOISE_5
        notelen 13
        note NOISE_5
        note NOISE_5
        note NOISE_5
    next_loop

    begin_loop $04
        notelen 1
        note NOISE_5
    next_loop

    end_def

Music3b::
    db   $00
    dw   MusicSpeedData_1b_4ab9
    dw   Music3bChannel1
    dw   Music3bChannel2
    dw   Music3bChannel3
    dw   $0000

Music3bChannel1::
    dw   ChannelDefinition_1b_6fcf
    dw   ChannelDefinition_1b_64fc
    dw   $0000

Music3bChannel2::
    dw   ChannelDefinition_1b_6fcf
    dw   ChannelDefinition_1b_6503
    dw   $0000

Music3bChannel3::
    dw   ChannelDefinition_1b_6f6b
    dw   ChannelDefinition_1b_650a
    dw   $0000

ChannelDefinition_1b_64fc::
    notelen 2
    note E_4
    note F_4
    note F#4
    notelen 8
    note G_4
    end_def

ChannelDefinition_1b_6503::
    notelen 2
    note A_4
    note A#4
    note B_4
    notelen 8
    note C_5
    end_def

ChannelDefinition_1b_650a::
    enable_software_envelope
    notelen 2
    note B_2
    note C_3
    note C#3
    disable_software_envelope
    notelen 8
    note D_3
    end_def

Music3d::
    db   $00
    dw   MusicSpeedData_1b_4ae6
    dw   Music3dChannel1
    dw   Music3dChannel2
    dw   Music3dChannel3
    dw   Music3dChannel4

Music3dChannel1::
    dw   ChannelDefinition_1b_704a
    dw   ChannelDefinition_1b_703c
    dw   ChannelDefinition_1b_6656
    dw   ChannelDefinition_1b_665b
    dw   ChannelDefinition_1b_666d
    dw   ChannelDefinition_1b_668a
    dw   ChannelDefinition_1b_66ba
    dw   ChannelDefinition_1b_709f
    dw   ChannelDefinition_1b_66d8
    dw   ChannelDefinition_1b_6716
    dw   ChannelDefinition_1b_671b
    dw   ChannelDefinition_1b_7086
    dw   ChannelDefinition_1b_709b
    dw   ChannelDefinition_1b_7061
    dw   ChannelDefinition_1b_672f
    dw   ChannelDefinition_1b_676a
    dw   ChannelDefinition_1b_676a
    dw   ChannelDefinition_1b_67f2
    dw   ChannelDefinition_1b_676a
    dw   ChannelDefinition_1b_676a
    dw   ChannelDefinition_1b_67f2
    dw   ChannelDefinition_1b_676a
    dw   ChannelDefinition_1b_676a
    dw   ChannelDefinition_1b_67f2
    dw   ChannelDefinition_1b_67d1
    dw   ChannelDefinition_1b_6832
    dw   ChannelDefinition_1b_6852
    dw   ChannelDefinition_1b_709f
    dw   ChannelDefinition_1b_6863
    dw   ChannelDefinition_1b_70a3
    dw   ChannelDefinition_1b_6880
    dw   $0000

Music3dChannel2::
    dw   ChannelDefinition_1b_704a
    dw   ChannelDefinition_1b_6fe8
    dw   ChannelDefinition_1b_688f
    dw   ChannelDefinition_1b_6fe3
    dw   ChannelDefinition_1b_68a5
    dw   ChannelDefinition_1b_6ff2
    dw   ChannelDefinition_1b_688f
    dw   ChannelDefinition_1b_6fde
    dw   ChannelDefinition_1b_68b9
    dw   ChannelDefinition_1b_68cc
    dw   ChannelDefinition_1b_6fed
    dw   ChannelDefinition_1b_68d1
    dw   ChannelDefinition_1b_709f
    dw   ChannelDefinition_1b_68e8
    dw   ChannelDefinition_1b_5ecc
    dw   ChannelDefinition_1b_7080
    dw   ChannelDefinition_1b_671b
    dw   ChannelDefinition_1b_707a
    dw   ChannelDefinition_1b_709b
    dw   ChannelDefinition_1b_7061
    dw   ChannelDefinition_1b_6904
    dw   ChannelDefinition_1b_693d
    dw   ChannelDefinition_1b_693d
    dw   ChannelDefinition_1b_69ae
    dw   ChannelDefinition_1b_693d
    dw   ChannelDefinition_1b_693d
    dw   ChannelDefinition_1b_69ae
    dw   ChannelDefinition_1b_693d
    dw   ChannelDefinition_1b_693d
    dw   ChannelDefinition_1b_69ae
    dw   ChannelDefinition_1b_698f
    dw   ChannelDefinition_1b_69ee
    dw   ChannelDefinition_1b_6a07
    dw   ChannelDefinition_1b_709f
    dw   ChannelDefinition_1b_6a18
    dw   ChannelDefinition_1b_70a3
    dw   ChannelDefinition_1b_6a2d
    dw   $0000

Music3dChannel3::
    dw   ChannelDefinition_1b_704a
    dw   ChannelDefinition_1b_707a
    dw   ChannelDefinition_1b_6a3c
    dw   ChannelDefinition_1b_688f
    dw   ChannelDefinition_1b_6a41
    dw   ChannelDefinition_1b_68a5
    dw   ChannelDefinition_1b_6a46
    dw   ChannelDefinition_1b_6f55
    dw   ChannelDefinition_1b_665b
    dw   ChannelDefinition_1b_666d
    dw   ChannelDefinition_1b_705e
    dw   ChannelDefinition_1b_6a50
    dw   ChannelDefinition_1b_6a55
    dw   ChannelDefinition_1b_709f
    dw   ChannelDefinition_1b_6a7c
    dw   ChannelDefinition_1b_6f55
    dw   ChannelDefinition_1b_7083
    dw   ChannelDefinition_1b_671b
    dw   ChannelDefinition_1b_707d
    dw   ChannelDefinition_1b_709b
    dw   ChannelDefinition_1b_7061
    dw   ChannelDefinition_1b_6aa3
    dw   ChannelDefinition_1b_6ab7
    dw   ChannelDefinition_1b_6ab7
    dw   ChannelDefinition_1b_6b30
    dw   ChannelDefinition_1b_6ab7
    dw   ChannelDefinition_1b_6ab7
    dw   ChannelDefinition_1b_6b30
    dw   ChannelDefinition_1b_6ab7
    dw   ChannelDefinition_1b_6ab7
    dw   ChannelDefinition_1b_6b30
    dw   ChannelDefinition_1b_6b15
    dw   ChannelDefinition_1b_6b7b
    dw   ChannelDefinition_1b_6b98
    dw   ChannelDefinition_1b_709f
    dw   ChannelDefinition_1b_6ba4
    dw   ChannelDefinition_1b_70a3
    dw   ChannelDefinition_1b_6bba
    dw   $0000

Music3dChannel4::
    dw   ChannelDefinition_1b_7052
    dw   ChannelDefinition_1b_6bc5
    dw   ChannelDefinition_1b_709f
    dw   ChannelDefinition_1b_6bcd
    dw   ChannelDefinition_1b_709b
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bf7
    dw   ChannelDefinition_1b_6bf7
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bf7
    dw   ChannelDefinition_1b_6bf7
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6bf7
    dw   ChannelDefinition_1b_6bf7
    dw   ChannelDefinition_1b_6be6
    dw   ChannelDefinition_1b_6bd5
    dw   ChannelDefinition_1b_6c02
    dw   ChannelDefinition_1b_709f
    dw   ChannelDefinition_1b_6c02
    dw   ChannelDefinition_1b_6c02
    dw   ChannelDefinition_1b_70a3
    dw   ChannelDefinition_1b_6c10
    dw   $0000

ChannelDefinition_1b_6656::
    set_envelope_duty $56, $00, 2, 0
    end_def

ChannelDefinition_1b_665b::
    notelen 1
    note B_2
    note F#3
    note A_3
    note C#4
    note D_4
    note F#4
    note A_4
    note C#5
    note D_5
    note C#5
    note A_4
    note F#4
    note D_4
    note C#4
    note A_3
    note F#3
    end_def

ChannelDefinition_1b_666d::
    notelen 1
    note G_3
    note A_3
    note B_3
    note D_4
    note G_4
    note A_4
    note B_4
    note D_5
    note G_5
    note D_5
    note B_4
    note A_4
    note G_4
    note D_4
    note B_3
    note A_3
    note G_3
    note A_3
    note B_3
    note D_4
    note G_4
    note A_4
    note B_4
    note D_5
    notelen 3
    note G_5
    rest
    end_def

ChannelDefinition_1b_668a::
    set_envelope_duty $42, $00, 2, 0
    notelen 1
    note D_3
    note C#3
    note D_3
    note A_2
    note B_2
    note C#3
    note D_3
    note E_3
    note F#3
    note E_3
    note F#3
    note D_3
    note E_3
    note F#3
    note G_3
    note A_3
    set_envelope_duty $52, $00, 2, 0
    note D_4
    note C#4
    note D_4
    note A_3
    note F#4
    note E_4
    note F#4
    note D_4
    set_envelope_duty $62, $00, 2, 0
    note A_4
    note F#4
    note D_4
    note D_5
    note C#5
    note A#4
    note F#4
    note E_4
    notelen 3
    note D_4
    end_def

ChannelDefinition_1b_66ba::
    set_envelope_duty $60, $21, 2, 0
    notelen 3
    note E_4
    note D_4
    note A_4
    notelen 7
    note A_4
    notelen 3
    note B_4
    notelen 2
    note A_4
    note G_4
    note E_4
    notelen 3
    note F#4
    notelen 2
    rest
    note G_4
    note F#4
    note E_4
    note D_4
    note A_4
    notelen 3
    note G_4
    notelen 4
    rest
    end_def

ChannelDefinition_1b_66d8::
    set_envelope_duty $52, $00, 2, 0
    notelen 3
    rest

    begin_loop $02
        notelen 1
        note A_3
        note C_4
        note E_4
        note G_4
        note B_4
        note G_4
        note E_4
        note C_4
    next_loop

    begin_loop $02
        note D_3
        note F#3
        note A_3
        note C_4
        note E_4
        note C_4
        note A_3
        note F#3
    next_loop

    note G_3
    note A_3
    note B_3
    note D_4
    note G_4
    note D_4
    note B_3
    note A_3
    note G_3
    note A_3
    note B_3
    note D_4
    note G_4
    note D_4
    note B_3
    note G_3
    note F#3
    note G#3
    note A#3
    note C#4
    note F#4
    note G#4
    note A#4
    note C#5
    note F#5
    note C#5
    note A#4
    note G#4
    note F#4
    note C#4
    note A#3
    note F#3
    end_def

ChannelDefinition_1b_6716::
    set_envelope_duty $47, $00, 2, 0
    end_def

ChannelDefinition_1b_671b::
    notelen 1
    note D_2
    note E_2
    note F#2
    note A_2
    note C_3
    note E_3
    note F#3
    note A_3
    note C_4
    note E_4
    note F#4
    note A_4
    note C_5
    note E_5
    note F#5
    note A_5
    notelen 4
    note D_6
    end_def

ChannelDefinition_1b_672f::
    set_envelope_duty $52, $00, 2, 0
    notelen 4
    rest
    notelen 3
    note D_2
    notelen 10
    note D_2
    note D_2
    note D_2
    set_envelope_duty $72, $00, 2, 0
    notelen 3
    note E_2

    begin_loop $06
        notelen 10
        note E_2
    next_loop

    note G_2
    note G_2
    note G_2
    set_envelope_duty $92, $00, 2, 0
    notelen 3
    note A_2
    notelen 10
    note A_2
    note A_2
    note A_2
    notelen 3
    note C_3
    notelen 10
    note C_3
    note C_3
    note E_3
    notelen 3
    note F#3
    notelen 10
    note D_3
    note D_3
    note D_3
    notelen 3
    note D_3
    set_envelope_duty $92, $00, 1, 0
    notelen 10
    note D_3
    note E_3
    note F#3
    end_def

ChannelDefinition_1b_676a::
    set_envelope_duty $90, $21, 1, 1
    notelen 3
    note B_2
    notelen 10
    note C_3
    note B_2
    note A_2
    note B_2
    rest
    note B_2
    note C_3
    note D_3
    note E_3
    notelen 3
    note F_3
    notelen 10
    note A_3
    note B_3
    note A_3
    notelen 3
    note G#3
    notelen 10
    note E_3
    note F#3
    note G#3
    notelen 3
    note A_3
    notelen 10
    note A_4
    note C_5
    note E_5
    note G_5
    note D#3
    note F_3
    note G_3
    note F_3
    note D#3
    notelen 3
    note D_3
    notelen 10
    note D_3
    note E_3
    note D_3
    notelen 3
    note C_3
    rest
    set_envelope_duty $77, $00, 2, 0

    begin_loop $02
        notelen 10
        note E_4
        note F#4
        note G_4
    next_loop

    note F#4
    note D_4
    note B_3
    notelen 3
    note D_4
    notelen 10
    note E_4
    note F#4
    note G_4
    note G_4
    note A_4
    note G_4
    note F#4
    note D_4
    note B_3
    notelen 3
    note D_4
    set_envelope_duty $70, $21, 1, 1
    notelen 10
    note C_4
    note D_4
    note E_4
    note E_4
    note E_4
    note E_4
    notelen 3
    note D#4
    notelen 10
    note D#4
    note F_4
    note D#4
    notelen 3
    note D_4
    notelen 10
    note D_4
    note E_4
    note D_4
    notelen 4
    note C_4
    end_def

ChannelDefinition_1b_67d1::
    set_envelope_duty $90, $21, 1, 1
    notelen 3
    note B_2
    notelen 10
    note C_3
    note B_2
    note A_2
    note B_2
    rest
    note B_2
    note C_3
    note D_3
    note E_3
    notelen 3
    note F#3
    set_envelope_duty $70, $21, 1, 1
    notelen 10
    note C_2
    note D_2
    note G_2
    note A_2
    note F#2
    note A_2
    note D_3
    note F#3
    note A_3
    end_def

ChannelDefinition_1b_67f2::
    set_envelope_duty $70, $00, 2, 1
    notelen 5
    rest
    rest
    notelen 8
    note C_4
    notelen 10
    note C_4
    note D_4
    note C_4
    notelen 4
    note B_3
    notelen 3
    note C_4
    note D_4
    set_envelope_duty $90, $26, 2, 0
    notelen 10
    note D#4
    rest
    note F_4
    notelen 4
    note G_4
    notelen 10
    note D#4
    note F_4
    note G_4
    notelen 8
    note G_4
    notelen 10
    note G_4
    note G_4
    note G_4

    begin_loop $02
        rest
        note D#4
        note D#4
        note D#4
        note D_4
        note D#4
    next_loop

    notelen 3
    note D_4
    set_envelope_duty $70, $21, 1, 0
    notelen 10
    note E_3
    rest
    note E_3
    note D_3
    rest
    note D_3
    note C_3
    rest
    note C_3
    end_def

ChannelDefinition_1b_6832::
    set_envelope_duty $80, $21, 1, 1
    notelen 10
    note A#3
    note A_3
    note A#3
    note C_4
    note A#3
    note A_3

    begin_loop $04
        note A#3
    next_loop

    note A_3
    note A#3
    note C_4
    note A#3
    note C_4
    note D#4
    note G#4
    note C_5
    note D#5
    note G#4
    note G#4
    note C_5
    note C_5
    note C_5
    notelen 3
    note B_4
    end_def

ChannelDefinition_1b_6852::
    set_envelope_duty $70, $21, 1, 1
    notelen 2
    note B_3
    notelen 1
    note B_3
    note B_3
    notelen 3
    note A_3
    notelen 2
    note A_3
    notelen 1
    note A#3
    note C_4
    end_def

ChannelDefinition_1b_6863::
    set_envelope_duty $70, $21, 1, 1
    notelen 3
    note D#4
    notelen 2
    note D#4
    notelen 1
    note D#4
    note D#4
    notelen 2
    note A_4
    note G_4
    notelen 3
    note F_4
    notelen 3
    note B_4
    notelen 2
    note B_4
    notelen 1
    note A_4
    note B_4
    notelen 2
    note C_5
    note D_5
    note D#5
    note C_5
    end_def

ChannelDefinition_1b_6880::
    notelen 3
    note D_5
    set_envelope_duty $a0, $21, 1, 0
    notelen 2
    note G_2
    notelen 1
    note G_2
    note G_2
    notelen 3
    note G_2
    rest
    end_def

ChannelDefinition_1b_688f::
    notelen 2
    rest
    note B_4
    note C#5
    notelen 8
    note D_5
    notelen 2
    note B_4
    note C#5
    notelen 8
    note D_5
    notelen 2
    note C#5
    note B_4
    note F#4
    notelen 7
    note A_4
    notelen 5
    note B_4
    notelen 3
    rest
    end_def

ChannelDefinition_1b_68a5::
    notelen 2
    note B_4
    note C#5
    notelen 8
    note D_5
    notelen 2
    note A_4
    note D_5
    notelen 8
    note G_5
    notelen 2
    note F#5
    note E_5
    notelen 5
    note F#5
    notelen 4
    rest
    notelen 2
    rest
    end_def

ChannelDefinition_1b_68b9::
    notelen 2
    note B_4
    note C#5
    notelen 8
    note D_5
    notelen 2
    note A_4
    note D_5
    notelen 8
    note G_5
    notelen 2
    note F#5
    note E_5
    set_envelope_duty $50, $00, 2, 0
    note F#5
    end_def

ChannelDefinition_1b_68cc::
    notelen 5
    note F#5
    notelen 4
    rest
    end_def

ChannelDefinition_1b_68d1::
    notelen 8
    rest
    notelen 3
    note C#6
    note B_5
    note F#5
    notelen 7
    note F#5
    notelen 5
    note G_5
    notelen 2
    note E_6
    note D_6
    note C#6
    note B_5
    note F#5
    note E_5
    note F#5
    note B_5
    note G_5
    notelen 3
    rest
    end_def

ChannelDefinition_1b_68e8::
    notelen 2
    note G_5
    notelen 4
    note A_5
    notelen 2
    rest
    note C_5
    note E_5
    note A_5
    notelen 8
    note F#5
    notelen 2
    rest
    note D_5
    notelen 5
    note B_5
    notelen 2
    rest
    notelen 7
    note A#5
    note G_6
    set_envelope_duty $60, $00, 2, 0
    notelen 4
    note F#6
    end_def

ChannelDefinition_1b_6904::
    set_envelope_duty $62, $21, 2, 0
    notelen 3
    rest
    rest
    note F#2
    notelen 10
    note F#2
    note F#2
    note F#2
    set_envelope_duty $82, $21, 2, 0
    notelen 3
    note G_2
    notelen 10
    note G_2
    note G_2
    note G_2
    note C_3
    note C_3
    note C_3
    note E_3
    note E_3
    note E_3
    set_envelope_duty $a2, $21, 2, 0
    notelen 3
    note F#3
    notelen 10
    note F#3
    note F#3
    note F#3
    notelen 3
    note G_3
    notelen 10
    note G_3
    note G_3
    note G_3
    notelen 3
    note A_3
    notelen 10
    note D_4
    note D_4
    note D_4
    notelen 3
    note D_4
    notelen 10
    note D_4
    note D_4
    note D_4
    end_def

ChannelDefinition_1b_693d::
    set_envelope_duty $a0, $21, 1, 1
    notelen 3
    note G_3
    note D_3
    notelen 10
    note D_3
    rest
    note G_3
    note A_3
    note B_3
    note C_4
    notelen 4
    note D_4
    notelen 10
    rest
    note D_4
    note E_4
    note F_4
    note E_4
    note D_4
    notelen 4
    note C_4
    notelen 10
    rest
    note C_4
    note D_4
    note D#4
    note D_4
    note C_4
    notelen 3
    note B_3
    notelen 10
    note B_3
    note C_4
    note B_3
    notelen 3
    note A_3
    set_envelope_duty $57, $00, 2, 0
    notelen 10
    rest
    note G_5
    note A_5

    begin_loop $02
        notelen 3
        note B_5
        note G_5
        notelen 4
        note D_6
    next_loop

    set_envelope_duty $a0, $21, 1, 1
    notelen 10
    note E_4
    note F#4
    note G_4
    note G_4
    note A_4
    note B_4
    notelen 3
    note C_5
    notelen 10
    note C_5
    note D_5
    note C_5
    notelen 3
    note B_4
    notelen 10
    note B_4
    note C_5
    note B_4
    notelen 4
    note A_4
    end_def

ChannelDefinition_1b_698f::
    set_envelope_duty $a0, $21, 1, 1
    notelen 3
    note G_3
    note D_3
    notelen 10
    note D_3
    rest
    note G_3
    note A_3
    note B_3
    note C_4
    notelen 3
    note D_4
    set_envelope_duty $80, $21, 1, 1
    notelen 10
    note G_2
    note A_2
    note D_3
    note F#3
    note D_3
    note F#3
    note A_3
    note D_4
    note F#4
    end_def

ChannelDefinition_1b_69ae::
    set_envelope_duty $a0, $26, 2, 1
    notelen 10
    note G_4
    rest
    note A_4
    notelen 4
    note A#4
    notelen 10
    note G_4
    rest
    note A_4
    notelen 3
    note A#4
    notelen 10
    rest
    rest
    note A#4
    notelen 6
    note A_4
    note G_4
    notelen 2
    note D_4
    notelen 4
    note F_4
    notelen 14
    note G_4
    notelen 10
    note G_4
    rest
    note A_4
    notelen 4
    note A#4
    notelen 10
    note G_4
    note A_4
    note A#4
    notelen 8
    note D#5
    notelen 10
    note D#5
    note D_5
    note A#4
    notelen 5
    note C_5
    notelen 3
    note C_5
    set_envelope_duty $a0, $21, 1, 0
    notelen 10
    note C_4
    note D_4
    note C_4
    note B_3
    note C_4
    note B_3
    note A_3
    note B_3
    note A_3
    end_def

ChannelDefinition_1b_69ee::
    set_envelope_duty $a0, $21, 1, 1
    notelen 4
    note G_4
    notelen 10
    rest
    note G_4
    note G_4
    note G_4
    note F_4
    note G_4
    notelen 4
    note G#4
    notelen 10
    rest
    note A#4
    note C_5
    note D_5
    note D#5
    note F_5
    notelen 3
    note G_5
    end_def

ChannelDefinition_1b_6a07::
    set_envelope_duty $a0, $21, 0, 0
    notelen 2
    note G_4
    notelen 1
    note D_4
    note G_4
    notelen 3
    note F_4
    notelen 2
    note F_4
    notelen 1
    note G_4
    note A_4
    end_def

ChannelDefinition_1b_6a18::
    notelen 3
    note A#4
    notelen 2
    note A#4
    notelen 1
    note G_4
    note A#4
    notelen 3
    note C_5
    notelen 1
    note C_5
    note D_5
    note D#5
    note F_5
    set_envelope_duty $a0, $00, 0, 1
    notelen 5
    note G_5
    end_def

ChannelDefinition_1b_6a2d::
    set_envelope_duty $a0, $21, 0, 0
    notelen 3
    note B_5
    notelen 2
    note G_3
    notelen 1
    note G_3
    note G_3
    notelen 3
    note G_3
    rest
    end_def

ChannelDefinition_1b_6a3c::
    set_waveform waveform_1b_6f21, $20
    end_def

ChannelDefinition_1b_6a41::
    set_waveform waveform_1b_6f11, $40
    end_def

ChannelDefinition_1b_6a46::
    begin_loop $03
        notelen 5
        rest
    next_loop

    notelen 3
    rest
    notelen 6
    rest
    end_def

ChannelDefinition_1b_6a50::
    notelen 8
    rest
    notelen 2
    rest
    end_def

ChannelDefinition_1b_6a55::
    set_waveform waveform_1b_6ec1, $20
    enable_software_envelope
    notelen 2
    note B_3
    note F#4
    note A_4
    note D_5
    notelen 4
    rest
    notelen 2
    note E_3
    note B_3
    note D_4
    note G_4
    rest
    note F#4
    notelen 1
    note E_4
    note D_4
    note C#4
    note F#3
    notelen 2
    note B_3
    note F#4
    note A_4
    note D_5
    notelen 4
    rest
    notelen 2
    note E_3
    note B_3
    note D_4
    note G_4
    notelen 3
    rest
    end_def

ChannelDefinition_1b_6a7c::
    notelen 3
    rest

    begin_loop $02
        notelen 2
        note A_2
        notelen 3
        note A_2
        notelen 2
        note A_2
    next_loop

    begin_loop $02
        notelen 2
        note D_2
        notelen 3
        note D_2
        notelen 2
        note D_2
    next_loop

    begin_loop $02
        notelen 2
        note G_2
        notelen 3
        note G_2
        notelen 2
        note G_2
    next_loop

    begin_loop $02
        notelen 2
        note F#2
        notelen 3
        note F#2
        notelen 2
        note F#2
    next_loop

    end_def

ChannelDefinition_1b_6aa3::
    set_waveform waveform_1b_6ec1, $20
    enable_software_envelope

    begin_loop $06
        notelen 3
        note D_2
        notelen 10
        note D_2
        note D_2
        note D_2
    next_loop

    notelen 3
    note D_2
    note D_2
    note E_2
    note F#2
    end_def

ChannelDefinition_1b_6ab7::
    enable_software_envelope
    notelen 3
    note G_2
    notelen 10
    note G_2
    note G_2
    note F_2
    notelen 3
    note G_2
    notelen 10
    note G_2
    note G_2
    note G_2
    notelen 3
    note F_2
    notelen 10
    note F_3
    note F_3
    note F_3
    disable_software_envelope
    notelen 3
    note E_3
    note E_2
    enable_software_envelope

    begin_loop $02
        notelen 3
        note A_2
        notelen 10
        note A_2
        note A_2
        note A_2
    next_loop

    notelen 3
    note D_2
    notelen 10
    note D_2
    note D_2
    note D_2
    disable_software_envelope
    notelen 3
    note D_2
    note D#2
    enable_software_envelope
    notelen 10
    note E_2
    note G_3
    note B_3
    note E_4
    note B_3
    note G_3
    note B_2
    note F#3
    note A_3
    note D_4
    note A_3
    note F#3
    note E_3
    note G_3
    note B_3
    note E_4
    note B_3
    note G_3
    note B_2
    note F#3
    note A_3
    note D_4
    note A_3
    note B_2
    notelen 3
    note C_3
    notelen 10
    note C_3
    note C_3
    note C_3
    notelen 3
    note G#2
    notelen 10
    note G#2
    note G#2
    note G#2
    note D_2
    note G_2
    note A_2
    note D_3
    note G_3
    note A_3
    note D_4
    note D_3
    note E_3
    note F#3
    note E_3
    note D_3
    end_def

ChannelDefinition_1b_6b15::
    enable_software_envelope
    notelen 3
    note G_2
    notelen 10
    note G_2
    note G_2
    note F_2
    notelen 3
    note G_2
    notelen 10
    note G_2
    note G_2
    note G_2
    notelen 3
    note D_2
    notelen 10
    note D_2
    note D_2
    note D_2
    note D_2
    notelen 10
    note D_3
    note E_3
    note F#3
    note E_3
    note D_3
    end_def

ChannelDefinition_1b_6b30::
    notelen 10
    note D#3
    note G_4
    note A#4
    note D#5
    note A#4
    note G_4
    note D#4
    note G_4
    note A#4
    note D#5
    note A#4
    note G_4

    begin_loop $02
        note D#4
        note F_4
        note A_4
        note C_5
        note A_4
        note F_4
    next_loop

    begin_loop $02
        note D_4
        note F_4
        note A_4
        note C_5
        note A_4
        note F_4
    next_loop

    note G_3
    note B_3
    note D_4
    note F_4
    note D_4
    note B_3
    note G_3
    note B_3
    note D_4
    note F_4
    note D_4
    note G_3

    begin_loop $02
        enable_software_envelope
        notelen 10
        note C_3
        note G_3
        note A#3
        note D#4
        note G_4
        note A#4
        disable_software_envelope
        notelen 3
        note D#5
        rest
    next_loop

    enable_software_envelope

    begin_loop $02
        notelen 10
        note G#2
        note G#3
        note G#3
        note G#3
        note A#3
        note C_4
    next_loop

    notelen 3
    note D_4
    note D_2
    note E_2
    note F#2
    end_def

ChannelDefinition_1b_6b7b::
    note D#3
    note G_3
    note A#3
    note D#4
    note G_4
    note A#4
    disable_software_envelope
    notelen 3
    note D#5
    enable_software_envelope
    notelen 10
    note D#3
    note D#3
    note D#3
    note G#2
    note C_3
    note D#3
    note G#3
    note C_4
    note D#4
    disable_software_envelope
    notelen 3
    note G#5
    enable_software_envelope
    notelen 10
    note G#2
    note G#2
    note G#2
    end_def

ChannelDefinition_1b_6b98::
    begin_loop $02
        notelen 2
        note G_2
        note D_2
    next_loop

    begin_loop $02
        note F_2
        note C_2
    next_loop

    end_def

ChannelDefinition_1b_6ba4::
    begin_loop $02
        notelen 2
        note D#2
        note A#2
    next_loop

    begin_loop $02
        note F_2
        note C_3
    next_loop

    begin_loop $02
        note G_2
        note D_2
    next_loop

    begin_loop $02
        note G#2
        note D#2
    next_loop

    end_def

ChannelDefinition_1b_6bba::
    notelen 3
    note G_2
    notelen 2
    note G_2
    notelen 1
    note G_2
    note G_2
    notelen 3
    note G_2
    rest
    end_def

ChannelDefinition_1b_6bc5::
    begin_loop $14
        notelen 5
        rest
    next_loop

    notelen 3
    rest
    end_def

ChannelDefinition_1b_6bcd::
    begin_loop $06
        notelen 5
        rest
    next_loop

    notelen 3
    rest
    end_def

ChannelDefinition_1b_6bd5::
    begin_loop $03
        notelen 3
        note NOISE_5
        notelen 10
        note NOISE_6
        note NOISE_6
        note NOISE_6
    next_loop

    notelen 10
    note NOISE_5
    note NOISE_5
    note NOISE_5
    note NOISE_6
    note NOISE_5
    note NOISE_5
    end_def

ChannelDefinition_1b_6be6::
    begin_loop $03
        notelen 3
        note NOISE_5
        notelen 10
        note NOISE_6
        note NOISE_6
        note NOISE_6
    next_loop

    notelen 10
    note NOISE_5
    note NOISE_5
    note NOISE_5
    note NOISE_6
    note NOISE_5
    note NOISE_5
    end_def

ChannelDefinition_1b_6bf7::
    begin_loop $08
        notelen 10
        note NOISE_9
        note NOISE_9
        note NOISE_9
        note NOISE_6
        note NOISE_9
        note NOISE_9
    next_loop

    end_def

ChannelDefinition_1b_6c02::
    begin_loop $02
        notelen 1
        note NOISE_6
        note NOISE_6
        notelen 3
        note NOISE_6
    next_loop

    begin_loop $04
        notelen 1
        note NOISE_6
    next_loop

    end_def

ChannelDefinition_1b_6c10::
    notelen 3
    note NOISE_6
    notelen 2
    note NOISE_6
    notelen 1
    note NOISE_6
    note NOISE_6
    notelen 3
    note NOISE_6
    rest
    end_def

Music3e::
    db   $00
    dw   MusicSpeedData_1b_4ab9
    dw   Music3eChannel1
    dw   Music3eChannel2
    dw   Music3eChannel3
    dw   $0000

Music3eChannel1::
    dw   ChannelDefinition_1b_6c50
    dw   ChannelDefinition_1b_6c55
    dw   ChannelDefinition_1b_6c55
    dw   ChannelDefinition_1b_6fc0
    dw   ChannelDefinition_1b_6c55
    dw   ChannelDefinition_1b_6ff7
    dw   ChannelDefinition_1b_6c55
    dw   $ffff, Music0eChannel1

Music3eChannel2::
    dw   ChannelDefinition_1b_6c50
    dw   ChannelDefinition_1b_6c5f
    dw   ChannelDefinition_1b_6c5f
    dw   ChannelDefinition_1b_6fc0
    dw   ChannelDefinition_1b_6c5f
    dw   ChannelDefinition_1b_6ff7
    dw   ChannelDefinition_1b_6c5f
    dw   $ffff, Music0eChannel2

Music3eChannel3::
    dw   ChannelDefinition_1b_7061
    dw   $ffff, Music0eChannel3

ChannelDefinition_1b_6c50::
    set_envelope_duty $40, $00, 1, 0
    end_def

ChannelDefinition_1b_6c55::
    notelen 1
    note C#3
    note D_3
    note C#3
    note C_3
    note B_2
    note A#2
    note B_2
    note C_3
    end_def

ChannelDefinition_1b_6c5f::
    notelen 1
    note B_3
    note C_4
    note B_3
    note A#3
    note A_3
    note G#3
    note A_3
    note A#3
    end_def

Music3f::
    db   $00
    dw   MusicSpeedData_1b_4ad7
    dw   Music3fChannel1
    dw   Music3fChannel2
    dw   Music3fChannel3
    dw   Music3fChannel4

Music3fChannel1::
    dw   ChannelDefinition_1b_7061
    dw   ChannelDefinition_1b_6cf6
    dw   ChannelDefinition_1b_6e00
    dw   ChannelDefinition_1b_7089
    dw   ChannelDefinition_1b_7006
    dw   ChannelDefinition_1b_6cfd
    dw   ChannelDefinition_1b_700b
    dw   ChannelDefinition_1b_6d03
    dw   ChannelDefinition_1b_7001
    dw   ChannelDefinition_1b_6d09
    dw   ChannelDefinition_1b_6d7a
    dw   ChannelDefinition_1b_6de0
    dw   ChannelDefinition_1b_6df3
    dw   ChannelDefinition_1b_6df8
    dw   $ffff, MusicLoop_1b_708f

Music3fChannel2::
    dw   ChannelDefinition_1b_7061
    dw   ChannelDefinition_1b_6d81
    dw   ChannelDefinition_1b_6e00
    dw   ChannelDefinition_1b_7089
    dw   ChannelDefinition_1b_6ffc
    dw   ChannelDefinition_1b_6d88
    dw   ChannelDefinition_1b_7010
    dw   ChannelDefinition_1b_6da7
    dw   ChannelDefinition_1b_7083
    dw   ChannelDefinition_1b_6dfb
    dw   ChannelDefinition_1b_6dc7
    dw   ChannelDefinition_1b_6dd4
    dw   ChannelDefinition_1b_6de0
    dw   ChannelDefinition_1b_7083
    dw   ChannelDefinition_1b_6df3
    dw   ChannelDefinition_1b_6df8
    dw   $ffff, MusicLoop_1b_708f

Music3fChannel3::
    dw   ChannelDefinition_1b_7061
    dw   ChannelDefinition_1b_7015
    dw   ChannelDefinition_1b_6e00
    dw   ChannelDefinition_1b_7083
    dw   ChannelDefinition_1b_7089
    dw   ChannelDefinition_1b_701b
    dw   ChannelDefinition_1b_6e12
    dw   ChannelDefinition_1b_6e34
    dw   ChannelDefinition_1b_6f55
    dw   ChannelDefinition_1b_6dc7
    dw   ChannelDefinition_1b_6dd4
    dw   ChannelDefinition_1b_6de0
    dw   ChannelDefinition_1b_7089
    dw   ChannelDefinition_1b_6df8
    dw   $ffff, MusicLoop_1b_708f

Music3fChannel4::
    dw   ChannelDefinition_1b_6e4a
    dw   ChannelDefinition_1b_6e56
    dw   ChannelDefinition_1b_6e56
    dw   ChannelDefinition_1b_6e56
    dw   ChannelDefinition_1b_6e56
    dw   ChannelDefinition_1b_6e6b
    dw   ChannelDefinition_1b_6e6b
    dw   ChannelDefinition_1b_6e6b
    dw   ChannelDefinition_1b_6e6b
    dw   ChannelDefinition_1b_6e6b
    dw   ChannelDefinition_1b_6e6b
    dw   ChannelDefinition_1b_6e95
    dw   ChannelDefinition_1b_6e99
    dw   $ffff, MusicLoop_1b_7095

ChannelDefinition_1b_6cf6::
    set_envelope_duty $10, $00, 2, 1
    notelen 2
    rest
    end_def

ChannelDefinition_1b_6cfd::
    notelen 4
    note B_6
    note E_6
    note F#6
    note B_5
    end_def

ChannelDefinition_1b_6d03::
    notelen 4
    note B_6
    note E_6
    note F#6
    rest
    end_def

ChannelDefinition_1b_6d09::
    set_envelope_duty $b1, $82, 0, 0
    notelen 2
    note G_1
    note G_1
    set_envelope_duty $71, $82, 2, 0
    notelen 1
    note F#5
    note B_4
    note F#5
    note B_5
    notelen 3
    rest
    set_envelope_duty $b1, $82, 0, 0
    notelen 2
    rest
    note D_1
    note G_1
    note G_1
    set_envelope_duty $71, $82, 2, 0
    notelen 1
    note F#5
    note B_4
    note F#5
    note B_5
    notelen 3
    rest
    set_envelope_duty $b1, $82, 0, 0
    notelen 2
    rest
    note G_1
    note B_1
    note B_1
    set_envelope_duty $71, $82, 2, 0
    notelen 1
    note E_5
    note A_4
    note E_5
    note F#5
    notelen 3
    rest
    set_envelope_duty $b1, $82, 0, 0
    notelen 2
    rest
    note F#1
    note B_1
    note B_1
    set_envelope_duty $71, $82, 2, 0
    notelen 1
    note E_5
    note A_4
    note E_5
    note F#5
    set_envelope_duty $80, $00, 0, 0
    notelen 3
    note B_1
    note A_1
    set_envelope_duty $a1, $82, 0, 0
    notelen 2
    note G_1
    note G_1
    notelen 4
    rest
    notelen 2
    rest
    note D_1
    note G_1
    note G_1
    notelen 4
    rest
    notelen 3
    note G_1

    begin_loop $03
        notelen 2
        note D_1
        note D_1
        notelen 4
        rest
        notelen 2
        rest
        note A_1
    next_loop

    end_def

ChannelDefinition_1b_6d7a::
    set_envelope_duty $26, $00, 0, 0
    notelen 3
    rest
    end_def

ChannelDefinition_1b_6d81::
    set_envelope_duty $40, $00, 1, 1
    notelen 2
    rest
    end_def

ChannelDefinition_1b_6d88::
    begin_loop $03
        notelen 5
        rest
    next_loop

    notelen 4
    rest
    notelen 2
    rest
    note B_3
    note C#4
    notelen 8
    note D_4
    notelen 2
    note B_3
    note C#4
    notelen 8
    note D_4
    notelen 2
    note C#4
    note B_3
    note F#3
    notelen 7
    note A_3
    notelen 8
    note B_3
    notelen 2
    rest
    notelen 8
    rest
    end_def

ChannelDefinition_1b_6da7::
    begin_loop $03
        notelen 1
        note B_4
        note A_4
        note G_4
        note D_4
        note B_3
        note D_4
        note G_4
        note A_4
    next_loop

    note B_4
    note A_4
    note G_4
    note D_4
    note B_3
    note D_4
    note G_4
    note B_4

    begin_loop $02
        note A_4
        note F#4
        note E_4
        note D_4
        note A_3
        note D_4
        note E_4
        note F#4
    next_loop

    end_def

ChannelDefinition_1b_6dc7::
    begin_loop $02
        notelen 1
        note C#5
        note A_4
        note F#4
        note D_4
        note C#4
        note D_4
        note F#4
        note A_4
    next_loop

    end_def

ChannelDefinition_1b_6dd4::
    begin_loop $02
        note E_5
        note C#5
        note A_4
        note F#4
        note E_4
        note F#4
        note A_4
        note C#5
    next_loop

    end_def

ChannelDefinition_1b_6de0::
    notelen 1
    note D_1
    note A_1
    note C#2
    note D_2
    note F#2
    note A_2
    note C#3
    note D_3
    note F#3
    note A_3
    note C#4
    note D_4
    note F#4
    note A_4
    notelen 2
    note C#5
    note D_5
    end_def

ChannelDefinition_1b_6df3::
    set_envelope_duty $77, $00, 2, 0
    end_def

ChannelDefinition_1b_6df8::
    notelen 5
    note A_6
    end_def

ChannelDefinition_1b_6dfb::
    set_envelope_duty $40, $00, 2, 0
    end_def

ChannelDefinition_1b_6e00::
    notelen 2
    note B_3
    note C#4
    notelen 8
    note D_4
    notelen 2
    note B_3
    note C#4
    notelen 8
    note D_4
    notelen 2
    note C#4
    note B_3
    notelen 6
    note F#3
    notelen 5
    note F#4
    end_def

ChannelDefinition_1b_6e12::
    begin_loop $03
        notelen 5
        rest
    next_loop

    notelen 4
    rest
    notelen 2
    rest
    notelen 2
    note D_3
    note E_3
    notelen 4
    note F#3
    notelen 3
    rest
    notelen 2
    note D_3
    note E_3
    notelen 4
    note F#3
    notelen 3
    rest
    notelen 2
    note E_3
    notelen 3
    note D_3
    notelen 7
    note C#3
    notelen 4
    note D_3
    notelen 8
    rest
    end_def

ChannelDefinition_1b_6e34::
    notelen 2
    note B_3
    note C#4
    notelen 4
    note D_4
    notelen 3
    rest
    notelen 2
    note B_3
    note D_4
    notelen 4
    note G_4
    notelen 3
    rest
    notelen 2
    note F#4
    note E_4
    notelen 5
    note F#4
    notelen 2
    rest
    end_def

ChannelDefinition_1b_6e4a::
    begin_loop $05
        notelen 5
        rest
    next_loop

    notelen 4
    rest
    notelen 2
    rest
    notelen 6
    rest
    end_def

ChannelDefinition_1b_6e56::
    begin_loop $03
        notelen 2
        note NOISE_5
        notelen 9
        note NOISE_5
        notelen 13
        rest
        notelen 9
        note NOISE_5
        notelen 13
        rest
        notelen 9
        note NOISE_5
    next_loop

    begin_loop $04
        notelen 1
        note NOISE_5
    next_loop

    end_def

ChannelDefinition_1b_6e6b::
    notelen 2
    note NOISE_8
    notelen 9
    note NOISE_6
    notelen 13
    rest
    notelen 9
    note NOISE_6
    notelen 13
    rest
    notelen 9
    note NOISE_6
    notelen 2
    note NOISE_6
    notelen 9
    note NOISE_6
    notelen 13
    rest
    notelen 9
    note NOISE_6
    notelen 13
    rest
    notelen 9
    note NOISE_6
    notelen 2
    note NOISE_8
    notelen 9
    note NOISE_5
    notelen 13
    rest
    notelen 9
    note NOISE_6
    notelen 13
    rest
    notelen 9
    note NOISE_6

    begin_loop $04
        notelen 1
        note NOISE_6
    next_loop

    end_def

ChannelDefinition_1b_6e95::
    notelen 4
    note NOISE_8
    rest
    end_def

ChannelDefinition_1b_6e99::
    begin_loop $04
        notelen 5
        rest
    next_loop

    notelen 7
    rest
    end_def

waveform_1b_6ea1::
    db   $66, $66, $66, $66, $66, $66, $66, $66, $00, $00, $00, $00, $00, $00, $00, $00

waveform_1b_6eb1::
    db   $88, $88, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

waveform_1b_6ec1::
    db   $88, $88, $88, $88, $88, $88, $88, $88, $00, $00, $00, $00, $00, $00, $00, $00

waveform_1b_6ed1::
    db   $88, $88, $88, $88, $00, $00, $00, $00, $88, $88, $88, $88, $00, $00, $00, $00

waveform_1b_6ee1::
    db   $aa, $aa, $aa, $aa, $aa, $aa, $aa, $aa, $00, $00, $00, $00, $00, $00, $00, $00

waveform_1b_6ef1::
    db   $06, $9b, $cd, $de, $ee, $ff, $ff, $fe, $06, $9b, $cd, $de, $ee, $ff, $ff, $fe

waveform_1b_6f01::
    db   $7f, $ff, $57, $73, $55, $34, $42, $21, $7f, $ff, $57, $73, $55, $34, $42, $21

waveform_1b_6f11::
    db   $33, $33, $33, $33, $00, $00, $00, $00, $33, $33, $33, $33, $00, $00, $00, $00

waveform_1b_6f21::
    db   $11, $11, $11, $11, $00, $00, $00, $00, $11, $11, $11, $11, $00, $00, $00, $00

waveform_1b_6f31::
    db   $44, $44, $44, $44, $00, $00, $00, $00, $44, $44, $44, $44, $00, $00, $00, $00

ChannelDefinition_1b_6f41::
    set_waveform waveform_1b_6ec1, $20
    end_def

ChannelDefinition_1b_6f46::
    set_waveform waveform_1b_6ec1, $40
    end_def

ChannelDefinition_1b_6f4b::
    set_waveform waveform_1b_6ed1, $21
    end_def
; UNREFERENCED DATA
    db   $9d, $d1, $6e, $40, $00

ChannelDefinition_1b_6f55::
    set_waveform waveform_1b_6ed1, $40
    enable_software_envelope
    end_def

ChannelDefinition_1b_6f5b::
    set_waveform waveform_1b_6ea1, $20
    end_def

ChannelDefinition_1b_6f60::
    set_waveform waveform_1b_6ee1, $20
    end_def

ChannelDefinition_1b_6f65::
    set_waveform waveform_1b_6f31, $40
    enable_software_envelope
    end_def

ChannelDefinition_1b_6f6b::
    set_waveform waveform_1b_6eb1, $21
    end_def

ChannelDefinition_1b_6f70::
    set_waveform waveform_1b_6eb1, $25
    end_def

ChannelDefinition_1b_6f75::
    set_waveform waveform_1b_6eb1, $40
    end_def

ChannelDefinition_1b_6f7a::
    set_envelope_duty $42, $00, 2, 0
    end_def

ChannelDefinition_1b_6f7f::
    set_envelope_duty $53, $00, 2, 0
    end_def

ChannelDefinition_1b_6f84::
    set_envelope_duty $50, $83, 1, 0
    end_def

ChannelDefinition_1b_6f89::
    set_envelope_duty $60, $81, 2, 0
    end_def

ChannelDefinition_1b_6f8e::
    set_envelope_duty $71, $00, 1, 0
    end_def

ChannelDefinition_1b_6f93::
    set_envelope_duty $42, $00, 1, 0
    end_def

ChannelDefinition_1b_6f98::
    set_envelope_duty $33, $00, 1, 0
    end_def

ChannelDefinition_1b_6f9d::
    set_envelope_duty $62, $00, 2, 0
    end_def

ChannelDefinition_1b_6fa2::
    set_envelope_duty $60, $26, 0, 1
    end_def

ChannelDefinition_1b_6fa7::
    set_envelope_duty $60, $26, 2, 1
    end_def

ChannelDefinition_1b_6fac::
    set_envelope_duty $40, $00, 2, 0
    end_def

ChannelDefinition_1b_6fb1::
    set_envelope_duty $20, $00, 2, 0
    end_def

ChannelDefinition_1b_6fb6::
    set_envelope_duty $43, $00, 2, 0
    end_def

ChannelDefinition_1b_6fbb::
    set_envelope_duty $40, $21, 2, 0
    end_def

ChannelDefinition_1b_6fc0::
    set_envelope_duty $50, $00, 1, 1
    end_def

ChannelDefinition_1b_6fc5::
    set_envelope_duty $60, $21, 1, 1
    end_def

ChannelDefinition_1b_6fca::
    set_envelope_duty $60, $00, 2, 1
    end_def

ChannelDefinition_1b_6fcf::
    set_envelope_duty $90, $21, 1, 1
    end_def

ChannelDefinition_1b_6fd4::
    set_envelope_duty $b0, $21, 1, 1
    end_def

ChannelDefinition_1b_6fd9::
    set_envelope_duty $91, $00, 1, 0
    end_def

ChannelDefinition_1b_6fde::
    set_envelope_duty $50, $26, 2, 0
    end_def

ChannelDefinition_1b_6fe3::
    set_envelope_duty $30, $21, 2, 0
    end_def

ChannelDefinition_1b_6fe8::
    set_envelope_duty $20, $21, 2, 0
    end_def

ChannelDefinition_1b_6fed::
    set_envelope_duty $60, $26, 2, 0
    end_def

ChannelDefinition_1b_6ff2::
    set_envelope_duty $40, $26, 2, 0
    end_def

ChannelDefinition_1b_6ff7::
    set_envelope_duty $60, $00, 1, 0
    end_def

ChannelDefinition_1b_6ffc::
    set_envelope_duty $a0, $21, 1, 1
    end_def

ChannelDefinition_1b_7001::
    set_envelope_duty $82, $82, 2, 0
    end_def

ChannelDefinition_1b_7006::
    set_envelope_duty $77, $00, 2, 0
    end_def

ChannelDefinition_1b_700b::
    set_envelope_duty $97, $00, 2, 0
    end_def

ChannelDefinition_1b_7010::
    set_envelope_duty $51, $82, 2, 0
    end_def

ChannelDefinition_1b_7015::
    set_waveform waveform_1b_6f01, $01
    unknownop_94
    end_def

ChannelDefinition_1b_701b::
    set_waveform waveform_1b_6ef1, $01
    unknownop_94
    end_def

ChannelDefinition_1b_7021::
    set_transpose -1
    end_def

ChannelDefinition_1b_7024::
    set_transpose 0
    end_def

ChannelDefinition_1b_7027::
    set_transpose 1
    end_def

ChannelDefinition_1b_702a::
    set_transpose 5
    end_def

ChannelDefinition_1b_702d::
    set_envelope_duty $10, $00, 2, 0
    end_def

ChannelDefinition_1b_7032::
    set_envelope_duty $37, $00, 2, 0
    end_def

ChannelDefinition_1b_7037::
    set_envelope_duty $43, $83, 2, 0
    end_def

ChannelDefinition_1b_703c::
    begin_loop $0b
        notelen 5
        rest
    next_loop

    notelen 4
    rest
    end_def
; UNREFERENCED DATA
    db   $9b, $11, $a5, $01, $9c, $00

ChannelDefinition_1b_704a::
    begin_loop $09
        notelen 5
        rest
    next_loop

    notelen 4
    rest
    end_def

ChannelDefinition_1b_7052::
    begin_loop $09
        notelen 5
        rest
    next_loop

    notelen 4
    rest
    end_def
; UNREFERENCED DATA
    db   $a5, $01, $01, $00

ChannelDefinition_1b_705e::
    notelen 5
    rest
    end_def

ChannelDefinition_1b_7061::
    notelen 5
    rest
    rest
    end_def
; UNREFERENCED DATA
    db   $9b, $03, $a5, $01, $9c, $00

ChannelDefinition_1b_706b::
    begin_loop $04
        notelen 5
        rest
    next_loop

    end_def

ChannelDefinition_1b_7071::
    begin_loop $10
        notelen 5
        rest
    next_loop

    end_def
; UNREFERENCED DATA
    db   $a8, $01, $00

ChannelDefinition_1b_707a::
    notelen 6
    rest
    end_def

ChannelDefinition_1b_707d::
    notelen 7
    rest
    end_def

ChannelDefinition_1b_7080::
    notelen 1
    rest
    end_def

ChannelDefinition_1b_7083::
    notelen 2
    rest
    end_def

ChannelDefinition_1b_7086::
    notelen 4
    rest
    end_def

ChannelDefinition_1b_7089::
    notelen 3
    rest
    end_def

ChannelDefinition_1b_708c::
    notelen 5
    rest
    end_def

MusicLoop_1b_708f::
    dw   ChannelDefinition_1b_705e
    dw   $ffff, MusicLoop_1b_708f

MusicLoop_1b_7095::
    dw   ChannelDefinition_1b_708c
    dw   $ffff, MusicLoop_1b_7095

ChannelDefinition_1b_709b::
    set_speed MusicSpeedData_1b_4ac8
    end_def

ChannelDefinition_1b_709f::
    set_speed MusicSpeedData_1b_4ad7
    end_def

ChannelDefinition_1b_70a3::
    set_speed MusicSpeedData_1b_4af5
    end_def
