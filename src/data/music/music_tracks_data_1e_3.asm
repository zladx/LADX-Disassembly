Music41::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music41Channel1
    dw   Music41Channel2
    dw   Music41Channel3
    dw   $0000

Music41Channel1::
    dw   ChannelDefinition_1e_701d
    dw   ChannelDefinition_1e_7097
    dw   ChannelDefinition_1e_70c0
    dw   $0000

Music41Channel3::
    dw   ChannelDefinition_1e_7026
    dw   ChannelDefinition_1e_7097
    dw   ChannelDefinition_1e_7091
    dw   ChannelDefinition_1e_70c0
    dw   $0000

ChannelDefinition_1e_701d::
    set_envelope_duty $20, $00, 2, 1
    notelen 2
    rest
    notelen 9
    rest
    end_def

ChannelDefinition_1e_7026::
    set_waveform waveform_1e_730f, $01
    unknownop_94
    end_def

Music42::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music42Channel1
    dw   Music42Channel2
    dw   Music42Channel3
    dw   $0000

Music42Channel1::
    dw   ChannelDefinition_1e_704d
    dw   ChannelDefinition_1e_7097
    dw   ChannelDefinition_1e_70c0
    dw   $0000

Music42Channel2::
Music43Channel1::
    dw   ChannelDefinition_1e_7058
    dw   $0000

Music42Channel3::
Music43Channel3::
Music44Channel3::
Music45Channel3::
Music46Channel3::
Music47Channel3::
    dw   ChannelDefinition_1e_7089
    dw   ChannelDefinition_1e_7097
    dw   ChannelDefinition_1e_7091
    dw   ChannelDefinition_1e_70c0
    dw   $0000

ChannelDefinition_1e_704d::
    set_envelope_duty $20, $00, 2, 1
    notelen 2
    rest
    notelen 9
    rest
    notelen 14
    rest
    end_def

ChannelDefinition_1e_7058::
    set_envelope_duty $47, $00, 2, 0
    enable_unknown1

    begin_loop $0a
        notelen 3
        note A_5
        note D_5
        note E_5
        note B_5
    next_loop

    begin_loop $02
        note F#5
        note B_4
        note D_5
        note F#5
        note G_5
        note B_4
        note E_5
        note G_5
    next_loop

    note A_5
    note C_5
    note E_5
    note A_5
    note C_6
    note D#5
    note F#5
    note A_5
    note G_5
    note B_4
    note D_5
    note G_5
    note E_5
    note A#4
    note C#5
    note A#5

    begin_loop $02
        note A_5
        note D_5
        note E_5
        note B_5
    next_loop

    disable_unknown1
    end_def

ChannelDefinition_1e_7089::
    set_waveform waveform_1e_730f, $01
    notelen 14
    rest
    unknownop_94
    end_def

ChannelDefinition_1e_7091::
    set_waveform waveform_1e_72e1, $01
    unknownop_94
    end_def

ChannelDefinition_1e_7097::
    enable_unknown1
    notelen 2
    rest
    note B_2
    note C#3
    notelen 8
    note D_3
    notelen 2
    note B_2
    note C#3
    notelen 8
    note D_3
    notelen 2
    note C#3
    note B_2
    note F#2
    notelen 7
    note A_2
    notelen 5
    note B_2
    notelen 3
    rest
    notelen 2
    note B_2
    note C#3
    notelen 8
    note D_3
    notelen 2
    note A_2
    note D_3
    notelen 8
    note G_3
    notelen 2
    note F#3
    note E_3
    notelen 5
    note F#3
    rest
    notelen 2
    rest
    end_def

ChannelDefinition_1e_70c0::
    notelen 3
    rest
    note C#5
    note B_4
    note F#4
    notelen 7
    note F#4
    notelen 5
    note G_4
    notelen 2
    note E_5
    note D_5
    note C#5
    note B_4
    note F#4
    note E_4
    note F#4
    note B_4
    notelen 7
    note G_4
    notelen 2
    note G_4
    notelen 4
    note A_4
    notelen 2
    rest
    note C_4
    note E_4
    note A_4
    notelen 8
    note F#4
    notelen 2
    rest
    note D_4
    notelen 8
    note B_4
    notelen 7
    rest
    note A#4
    note G_5
    note F#5
    rest
    notelen 4
    rest
    notelen 5
    rest
    disable_unknown1
    end_def

Music43::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music43Channel1
    dw   Music43Channel2
    dw   Music43Channel3
    dw   $0000

Music43Channel2::
Music44Channel2::
Music45Channel2::
Music47Channel1::
    dw   ChannelDefinition_1e_7107
    dw   ChannelDefinition_1e_7114
    dw   ChannelDefinition_1e_7123
    dw   ChannelDefinition_1e_7123
    dw   ChannelDefinition_1e_7133
    dw   $0000

ChannelDefinition_1e_7107::
    set_envelope_duty $71, $82, 2, 0
    enable_unknown1

    begin_loop $04
        notelen 2
        note D_4
        note F#4
        note C#5
        note A_4
    next_loop


ChannelDefinition_1e_7114::
    begin_loop $04
        note E_4
        note G_4
        note D_5
        note B_4
    next_loop

    begin_loop $04
        note D_4
        note F#4
        note C#5
        note B_4
    next_loop

    end_def

ChannelDefinition_1e_7123::
    begin_loop $02
        notelen 2
        note B_3
        note D_4
        note B_4
        note F#4
    next_loop

    begin_loop $02
        note B_3
        note E_4
        note B_4
        note G_4
    next_loop

    end_def

ChannelDefinition_1e_7133::
    begin_loop $02
        note A_3
        note C_4
        note G_4
        note E_4
    next_loop

    begin_loop $02
        note A_3
        note C_4
        note F#4
        note D#4
    next_loop

    begin_loop $02
        note G_3
        note B_3
        note F#4
        note D_4
    next_loop

    begin_loop $02
        note G_3
        note A#3
        note E_4
        note C#4
    next_loop

    begin_loop $04
        note D_4
        note F#4
        note C#5
        note A_4
    next_loop

    disable_unknown1
    end_def

Music44::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music44Channel1
    dw   Music44Channel2
    dw   Music44Channel3
    dw   $0000

Music44Channel1::
Music45Channel1::
    dw   ChannelDefinition_1e_716d
    dw   ChannelDefinition_1e_7176
    dw   ChannelDefinition_1e_7176
    dw   ChannelDefinition_1e_718a
    dw   $0000

ChannelDefinition_1e_716d::
    set_envelope_duty $87, $00, 2, 0
    enable_unknown1
    notelen 5
    note A_6
    note A_6
    end_def

ChannelDefinition_1e_7176::
    set_envelope_duty $87, $00, 2, 0
    notelen 5
    note A_6
    note A_6
    set_envelope_duty $37, $00, 2, 0

    begin_loop $02
        notelen 3
        note A_5
        note D_5
        note E_5
        note B_5
    next_loop

    end_def

ChannelDefinition_1e_718a::
    set_envelope_duty $76, $00, 2, 0

    begin_loop $02
        notelen 4
        note B_6
        note F#6
        note B_6
        note G_6
    next_loop

    note A_6
    note G_6
    note F#6
    note A_6
    note B_6
    note G_6
    note A#6
    note G_6
    set_envelope_duty $87, $00, 2, 0
    notelen 5
    note A_6
    note A_6
    end_def

Music45::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music45Channel1
    dw   Music45Channel2
    dw   Music45Channel3
    dw   Music45Channel4

Music45Channel4::
Music46Channel4::
    dw   ChannelDefinition_1e_71b5
    dw   $0000

ChannelDefinition_1e_71b5::
    begin_loop $0a
        notelen 1
        note NOISE_7
        note NOISE_7
        note NOISE_7
        note NOISE_7
        notelen 2
        note NOISE_7
        notelen 3
        note NOISE_8
        notelen 2
        note NOISE_7
        notelen 3
        note NOISE_8
        notelen 1
        note NOISE_7
        note NOISE_7
        note NOISE_7
        note NOISE_7
        notelen 3
        note NOISE_8
        notelen 1
        note NOISE_7
        note NOISE_7
        note NOISE_7
        note NOISE_7
        notelen 3
        note NOISE_8
    next_loop

    end_def

Music46::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music46Channel1
    dw   Music46Channel2
    dw   Music46Channel3
    dw   Music46Channel4

Music46Channel1::
    dw   ChannelDefinition_1e_716d
    dw   ChannelDefinition_1e_7176
    dw   ChannelDefinition_1e_7176
    dw   ChannelDefinition_1e_7237
    dw   ChannelDefinition_1e_7123
    dw   ChannelDefinition_1e_7123
    dw   ChannelDefinition_1e_7133
    dw   $0000

Music46Channel2::
    dw   ChannelDefinition_1e_71f7
    dw   ChannelDefinition_1e_7204
    dw   ChannelDefinition_1e_7213
    dw   $0000

ChannelDefinition_1e_71f7::
    set_envelope_duty $19, $45, 1, 0
    enable_unknown1

    begin_loop $02
        notelen 3
        note D_2
        note A_2
        note F#2
        note A_2
    next_loop


ChannelDefinition_1e_7204::
    begin_loop $02
        note E_2
        note B_2
        note G_2
        note B_2
    next_loop

    begin_loop $02
        note D_2
        note A_2
        note F#2
        note A_2
    next_loop

    end_def

ChannelDefinition_1e_7213::
    begin_loop $02
        notelen 3
        note B_1
        note F#2
        note D_2
        note F#2
        note B_1
        note G_2
        note E_2
        note G_2
    next_loop

    note A_2
    note E_2
    note C_2
    note E_2
    note A_2
    note D#2
    note C_2
    note D#2
    note G_2
    note D_2
    note B_1
    note D_2
    note G_2
    note C#2
    note A#1
    note C#2

    begin_loop $02
        note D_2
        note A_2
        note F#2
        note A_2
    next_loop

    end_def

ChannelDefinition_1e_7237::
    set_envelope_duty $61, $82, 2, 0
    end_def

Music47::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music47Channel1
    dw   Music47Channel2
    dw   Music47Channel3
    dw   Music47Channel4

Music47Channel2::
    dw   ChannelDefinition_1e_716d
    dw   ChannelDefinition_1e_7176
    dw   ChannelDefinition_1e_7176
    dw   ChannelDefinition_1e_727d
    dw   ChannelDefinition_1e_7213
    dw   $0000

Music47Channel4::
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7295
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7295
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   ChannelDefinition_1e_7282
    dw   $0000

ChannelDefinition_1e_727d::
    set_envelope_duty $19, $45, 1, 0
    end_def

ChannelDefinition_1e_7282::
    begin_loop $03
        notelen 2
        note NOISE_6
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

    notelen 2
    note NOISE_6
    note NOISE_6
    end_def

ChannelDefinition_1e_7295::
    begin_loop $02
        notelen 1
        note NOISE_7
        note NOISE_7
        note NOISE_7
        note NOISE_7
        notelen 2
        note NOISE_7
        notelen 3
        note NOISE_8
        notelen 2
        note NOISE_7
        notelen 3
        note NOISE_8
        end_def

Music20::
    db   $00
    dw   MusicSpeedData_1e_4ae8
    dw   Music20Channel1
    dw   Music20Channel2
    dw   Music20Channel3
    dw   $0000

Music20Channel2::
    dw   ChannelDefinition_1e_72ba
    dw   ChannelDefinition_1e_72c8
    dw   $0000

Music20Channel3::
    dw   ChannelDefinition_1e_72c3
    dw   $0000

ChannelDefinition_1e_72ba::
    set_envelope_duty $20, $00, 1, 1
    notelen 1
    rest
    notelen 0
    rest
    end_def

ChannelDefinition_1e_72c3::
    set_waveform waveform_1e_72e1, $01
    unknownop_94

ChannelDefinition_1e_72c8::
    notelen 2
    note B_4
    note C#5
    notelen 8
    note D_5
    notelen 2
    note B_4
    note C#5
    notelen 4
    note D_5
    notelen 2
    note C#5
    notelen 6
    note B_4
    notelen 3
    note F#4
    notelen 14
    note F#5
    disable_software_envelope

    begin_loop $20
        notelen 5
        rest
    next_loop

    end_def

waveform_1e_72e1::
    db   $01, $35, $66, $53, $10, $02, $46, $8a, $01, $35, $66, $53, $10, $02, $46, $8a

Music28::
    db   $00
    dw   MusicSpeedData_1e_4af7
    dw   Music28Channel1
    dw   Music28Channel2
    dw   Music28Channel3
    dw   $0000

Music28Channel2::
    dw   ChannelDefinition_1e_7306
    dw   ChannelDefinition_1e_7324
    dw   $0000

Music28Channel3::
    dw   ChannelDefinition_1e_731f
    dw   $0000

ChannelDefinition_1e_7306::
    set_envelope_duty $20, $00, 1, 1
    notelen 1
    rest
    notelen 0
    rest
    end_def

waveform_1e_730f::
    db   $06, $9b, $cd, $de, $ee, $ff, $ff, $fe, $06, $9b, $cd, $de, $ee, $ff, $ff, $fe

ChannelDefinition_1e_731f::
    set_waveform waveform_1e_730f, $01
    unknownop_94

ChannelDefinition_1e_7324::
    notelen 1
    note B_2
    note C#3
    notelen 4
    note D_3
    notelen 3
    rest
    notelen 1
    note B_2
    note C#3
    notelen 2
    note D_3
    note C#3
    notelen 6
    note B_2
    notelen 3
    note F#2
    notelen 2
    rest
    notelen 5
    note F#3

    begin_loop $20
        notelen 14
        rest
    next_loop

    end_def

Music29::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music29Channel1
    dw   Music29Channel2
    dw   Music29Channel3
    dw   $0000

Music29Channel2::
    dw   ChannelDefinition_1e_735a
    dw   ChannelDefinition_1e_735a
    dw   ChannelDefinition_1e_736a
    dw   $ffff, MusicLoop_1e_78bb

Music29Channel3::
    dw   ChannelDefinition_1e_7380
    dw   $ffff, MusicLoop_1e_78bb

ChannelDefinition_1e_735a::
    set_envelope_duty $81, $00, 2, 0
    notelen 1
    note A_5
    note D_5
    note E_5
    note B_5
    set_envelope_duty $a6, $00, 2, 0
    notelen 4
    note A_5
    end_def

ChannelDefinition_1e_736a::
    set_envelope_duty $82, $00, 2, 0
    notelen 2
    note A_5
    note D_5
    notelen 6
    note E_5
    set_envelope_duty $85, $00, 2, 0
    notelen 3
    note B_5
    set_envelope_duty $a6, $00, 2, 0
    notelen 14
    note A_5
    end_def

ChannelDefinition_1e_7380::
    set_waveform waveform_1e_750c, $23
    enable_software_envelope

    begin_loop $02
        notelen 1
        note E_5
        note A_4
        note B_4
        note F#5
        notelen 4
        note E_5
    next_loop

    notelen 2
    note E_5
    note A_4
    notelen 6
    note B_4
    notelen 3
    note F#5
    notelen 14
    note E_5

    begin_loop $20
        notelen 14
        rest
    next_loop

    end_def

Music2a::
    db   $18
    dw   MusicSpeedData_1e_4a9d
    dw   Music2aChannel1
    dw   Music2aChannel2
    dw   Music2aChannel3
    dw   $0000

Music2aChannel2::
    dw   ChannelDefinition_1e_73b3
    dw   ChannelDefinition_1e_73d1
    dw   $0000

Music2aChannel3::
    dw   ChannelDefinition_1e_73cc
    dw   $0000

ChannelDefinition_1e_73b3::
    set_envelope_duty $10, $00, 2, 0
    notelen 3
    rest
    notelen 1
    rest
    end_def

waveform_1e_73bc::
    db   $46, $79, $98, $64, $43, $10, $01, $34, $46, $79, $98, $64, $43, $10, $01, $34

ChannelDefinition_1e_73cc::
    set_waveform waveform_1e_73bc, $20
    enable_software_envelope

ChannelDefinition_1e_73d1::
    notelen 3
    note C_5
    note B_4
    note G_4
    note E_4
    notelen 6
    note C_4
    note B_3
    note C_4
    note E_4
    note G_4
    notelen 11
    note B_4
    note G_4
    note E_4
    note C_4
    notelen 2
    note B_3
    note C_4
    note E_4
    note G_4
    note B_4
    note G_4
    note E_4
    note C_4
    note B_3
    note C_4
    note E_4
    note G_4

    begin_loop $02
        note A#4
        note F#4
        note D#4
        note B_3
        note A#3
        note B_3
        note D#4
        note F#4
    next_loop

    note G_4
    note D#4
    note C_4
    note G#3
    note G_3
    note G#3
    note C_4
    note D#4
    notelen 11
    note F_4
    note C#4
    note A#3
    note F#3
    notelen 6
    note F_3
    note F#3
    notelen 3
    note A#3
    note C#4
    notelen 10
    rest
    notelen 2
    note D#4

    begin_loop $20
        notelen 14
        rest
    next_loop

    end_def

Music2b::
    db   $00
    dw   MusicSpeedData_1e_4abb
    dw   Music2bChannel1
    dw   Music2bChannel2
    dw   Music2bChannel3
    dw   $0000

Music2bChannel1::
    dw   ChannelDefinition_1e_7433
    dw   $ffff, MusicLoop_1e_78bb

Music2bChannel2::
    dw   ChannelDefinition_1e_7458
    dw   $ffff, MusicLoop_1e_78bb

Music2bChannel3::
    dw   ChannelDefinition_1e_748c
    dw   $ffff, MusicLoop_1e_78bb

ChannelDefinition_1e_7433::
    set_envelope_duty $81, $00, 2, 0
    notelen 1
    rest
    notelen 2
    note F#5
    set_envelope_duty $c1, $00, 2, 0
    notelen 2
    note F#5
    notelen 6
    rest
    notelen 4
    rest
    set_envelope_duty $a2, $00, 2, 0
    notelen 2
    rest
    notelen 3
    note C#5
    note E_5
    note A_5
    note E_5
    note B_5
    set_envelope_duty $a7, $00, 2, 0
    notelen 14
    note A_6
    end_def

ChannelDefinition_1e_7458::
    set_envelope_duty $61, $00, 2, 0
    notelen 2
    note F#5
    set_envelope_duty $a1, $00, 2, 0
    notelen 2
    note F#5
    set_envelope_duty $e5, $00, 2, 0
    notelen 8
    note F#5
    set_envelope_duty $a2, $00, 2, 0
    notelen 3
    note B_4
    note D_5
    note F#5
    note G#5
    note F#5
    note E_6
    set_envelope_duty $a7, $00, 2, 0
    notelen 14
    note F#6
    end_def

waveform_1e_747c::
    db   $66, $00, $66, $00, $66, $00, $66, $00, $66, $00, $66, $00, $66, $00, $66, $00

ChannelDefinition_1e_748c::
    set_waveform waveform_1e_747c, $23
    enable_software_envelope
    notelen 1
    note C#5
    note C#5
    note C#5
    note C#5
    notelen 8
    note C#5
    notelen 2
    note F#4
    note G#4
    note A_4
    note B_5
    note C#5
    note E_5
    note D#5
    note B_4
    note C#5
    note F#5
    note B_5
    note E_6
    notelen 14
    note C#6
    end_def

Music2c::
    db   $00
    dw   MusicSpeedData_1e_4aca
    dw   Music2cChannel1
    dw   Music2cChannel2
    dw   Music2cChannel3
    dw   $0000

Music2cChannel2::
    dw   ChannelDefinition_1e_74d3
    dw   ChannelDefinition_1e_74ec
    dw   ChannelDefinition_1e_74d3
    dw   ChannelDefinition_1e_74fe
    dw   ChannelDefinition_1e_74d3
    dw   ChannelDefinition_1e_74fe
    dw   ChannelDefinition_1e_74d3
    dw   ChannelDefinition_1e_74ec
    dw   ChannelDefinition_1e_74d3
    dw   ChannelDefinition_1e_74fe
    dw   ChannelDefinition_1e_74d3
    dw   ChannelDefinition_1e_7505
    dw   ChannelDefinition_1e_7540
    dw   $0000

Music2cChannel3::
    dw   ChannelDefinition_1e_751c
    dw   $0000

ChannelDefinition_1e_74d3::
    set_envelope_duty $21, $00, 2, 0
    notelen 1
    note B_5
    set_envelope_duty $41, $00, 2, 0
    notelen 1
    note B_5
    set_envelope_duty $71, $00, 2, 0
    notelen 1
    note B_5
    set_envelope_duty $a1, $00, 2, 0
    notelen 1
    note B_5
    end_def

ChannelDefinition_1e_74ec::
    set_envelope_duty $a1, $00, 2, 0
    notelen 2
    note B_5
    set_envelope_duty $c3, $00, 2, 0
    notelen 3
    note B_5
    set_envelope_duty $82, $00, 2, 0
    notelen 2
    note B_5

ChannelDefinition_1e_74fe::
    set_envelope_duty $d2, $00, 2, 0
    notelen 3
    note B_5
    end_def

ChannelDefinition_1e_7505::
    set_envelope_duty $e3, $00, 2, 0
    notelen 14
    note B_5
    end_def

waveform_1e_750c::
    db   $00, $0c, $00, $0c, $00, $0c, $00, $0c, $06, $06, $06, $06, $06, $06, $06, $06

ChannelDefinition_1e_751c::
    set_waveform waveform_1e_750c, $20
    enable_software_envelope

    begin_loop $02
        notelen 1
        note F#6
        note F#6
        note F#6
        note F#6
        notelen 2
        note F#6
        notelen 3
        note F#6
        notelen 2
        note F#6
        notelen 3
        note F#6
        notelen 1
        note F#6
        note F#6
        note F#6
        note F#6
        notelen 3
        note F#6
        notelen 1
        note F#6
        note F#6
        note F#6
        note F#6
        notelen 3
        note F#6
    next_loop

    disable_software_envelope

ChannelDefinition_1e_7540::
    begin_loop $20
        notelen 14
        rest
    next_loop

    end_def

Music2d::
    db   $00
    dw   MusicSpeedData_1e_4ae8
    dw   Music2dChannel1
    dw   Music2dChannel2
    dw   Music2dChannel3
    dw   $0000

Music2dChannel2::
    dw   ChannelDefinition_1e_755f
    dw   ChannelDefinition_1e_757d
    dw   $ffff, MusicLoop_1e_78bb

Music2dChannel3::
    dw   ChannelDefinition_1e_7578
    dw   $ffff, MusicLoop_1e_78bb

ChannelDefinition_1e_755f::
    set_envelope_duty $20, $00, 2, 0
    notelen 2
    rest
    notelen 9
    rest
    end_def

waveform_1e_7568::
    db   $88, $88, $88, $84, $00, $00, $00, $00, $88, $88, $88, $84, $00, $00, $00, $00

ChannelDefinition_1e_7578::
    set_waveform waveform_1e_7568, $00
    unknownop_94

ChannelDefinition_1e_757d::
    notelen 2
    note B_3
    note C#4
    notelen 8
    note D_4
    notelen 2
    note B_3
    note C#4
    notelen 3
    note D_4
    note C#4
    note B_3
    notelen 0
    rest
    notelen 3
    note F#3
    notelen 1
    rest
    notelen 5
    note F#4
    end_def

Music2e::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music2eChannel1
    dw   Music2eChannel2
    dw   Music2eChannel3
    dw   Music2eChannel4

Music2eChannel2::
    dw   ChannelDefinition_1e_75b5
    dw   ChannelDefinition_1e_75b5
    dw   ChannelDefinition_1e_75cb
    dw   ChannelDefinition_1e_75b5
    dw   ChannelDefinition_1e_75b5
    dw   ChannelDefinition_1e_75cb
    dw   $ffff, MusicLoop_1e_78bb

Music2eChannel4::
    dw   ChannelDefinition_1e_75e2
    dw   ChannelDefinition_1e_75e2
    dw   ChannelDefinition_1e_75fa
    dw   $0000

ChannelDefinition_1e_75b5::
    set_envelope_duty $a1, $00, 2, 0
    enable_unknown2
    notelen 2
    note D_3
    set_envelope_duty $61, $00, 2, 0
    notelen 9
    note A_2
    notelen 13
    rest
    notelen 9
    note A_2
    notelen 13
    rest
    notelen 9
    note A_2
    end_def

ChannelDefinition_1e_75cb::
    notelen 1
    note A_2
    set_envelope_duty $a1, $00, 2, 0
    notelen 1
    note D_3
    set_envelope_duty $61, $00, 2, 0
    notelen 1
    note A_2
    note A_2
    set_envelope_duty $a1, $00, 2, 0
    notelen 2
    note D_3
    note D_3
    end_def

ChannelDefinition_1e_75e2::
    begin_loop $02
        notelen 2
        note NOISE_FF
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

    notelen 1
    note NOISE_5
    note NOISE_FF
    note NOISE_5
    note NOISE_5
    notelen 2
    note NOISE_FF
    note NOISE_FF
    end_def

ChannelDefinition_1e_75fa::
    begin_loop $20
        notelen 14
        rest
    next_loop

    end_def

Music2f::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music2fChannel1
    dw   Music2fChannel2
    dw   Music2fChannel3
    dw   $0000

Music2fChannel1::
    dw   ChannelDefinition_1e_7627

MusicLoop_1e_760d::
    dw   ChannelDefinition_1e_7634
    dw   ChannelDefinition_1e_764a
    dw   ChannelDefinition_1e_765d
    dw   $ffff, MusicLoop_1e_760d

Music2fChannel2::
    dw   ChannelDefinition_1e_7630
    dw   ChannelDefinition_1e_764a
    dw   ChannelDefinition_1e_765d
    dw   $ffff, Music2fChannel2

Music2fChannel3::
    dw   ChannelDefinition_1e_768a
    dw   $ffff, MusicLoop_1e_760d

ChannelDefinition_1e_7627::
    set_envelope_duty $20, $00, 2, 0
    notelen 1
    rest
    notelen 9
    rest
    end_def

ChannelDefinition_1e_7630::
    set_envelope_duty $60, $21, 2, 0

ChannelDefinition_1e_7634::
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

ChannelDefinition_1e_764a::
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
    rest
    notelen 7
    rest
    end_def

ChannelDefinition_1e_765d::
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
    notelen 7
    note G_5
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
    note F#6
    rest
    notelen 5
    rest
    end_def

ChannelDefinition_1e_768a::
    set_waveform waveform_1e_6d68, $60
    notelen 3
    rest
    notelen 1
    rest
    end_def

Music4a::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music4aChannel1
    dw   Music4aChannel2
    dw   Music4aChannel3
    dw   $0000

Music4aChannel1::
    dw   ChannelDefinition_1e_76be

MusicLoop_1e_76a0::
    dw   ChannelDefinition_1e_7114
    dw   ChannelDefinition_1e_7114
    dw   ChannelDefinition_1e_7123
    dw   ChannelDefinition_1e_7123
    dw   ChannelDefinition_1e_7133
    dw   $ffff, MusicLoop_1e_76a0

Music4aChannel2::
    dw   ChannelDefinition_1e_7630
    dw   ChannelDefinition_1e_76c7
    dw   ChannelDefinition_1e_765d
    dw   $ffff, Music4aChannel2

Music4aChannel3::
    dw   ChannelDefinition_1e_76eb
    dw   $ffff, Music4aChannel3

ChannelDefinition_1e_76be::
    set_envelope_duty $19, $42, 1, 0
    notelen 7
    rest
    notelen 2
    rest
    end_def

ChannelDefinition_1e_76c7::
    notelen 2
    note B_2
    note C#3
    notelen 8
    note D_3
    notelen 2
    note A_2
    note D_3
    notelen 8
    note G_3
    notelen 2
    note F#3
    note E_3
    notelen 14
    note F#3
    notelen 4
    rest
    notelen 7
    rest
    end_def

waveform_1e_76db::
    db   $01, $37, $9a, $bb, $bb, $bb, $a6, $21, $01, $37, $9a, $bb, $bb, $bb, $a6, $21

ChannelDefinition_1e_76eb::
    set_waveform waveform_1e_76db, $40

    begin_loop $08
        notelen 5
        rest
    next_loop

    notelen 8
    rest
    notelen 3
    note E_5
    note D_5
    notelen 6
    note A_4
    notelen 1
    rest
    notelen 7
    note A_4
    notelen 8
    note B_4
    notelen 3
    rest
    notelen 1
    note G_5
    rest
    note F#5
    rest
    note E_5
    rest
    note D_5
    rest
    note A_4
    rest
    note G_4
    rest
    note A_4
    rest
    note D_5
    rest
    notelen 6
    note B_4
    rest
    notelen 2
    note B_4
    notelen 7
    note C_5
    notelen 3
    rest
    notelen 1
    note E_4
    rest
    note G_4
    rest
    note C_5
    rest
    notelen 4
    note A_4
    notelen 7
    rest
    notelen 2
    note F#4
    notelen 8
    note D_5
    notelen 7
    rest
    notelen 3
    note C#5
    notelen 2
    rest
    notelen 3
    note A#4
    notelen 2
    rest
    notelen 3
    note A_4
    notelen 4
    rest
    notelen 5
    rest
    end_def

Music30::
    db   $00
    dw   MusicSpeedData_1e_4b06
    dw   Music30Channel1
    dw   Music30Channel2
    dw   Music30Channel3
    dw   Music30Channel4

Music30Channel1::
    dw   ChannelDefinition_1e_7758
    dw   $0000

Music30Channel2::
    dw   ChannelDefinition_1e_77a3
    dw   $0000

Music30Channel3::
    dw   ChannelDefinition_1e_7827
    dw   $0000

Music30Channel4::
    dw   ChannelDefinition_1e_788c
    dw   $0000

ChannelDefinition_1e_7758::
    set_envelope_duty $62, $00, 0, 0
    notelen 1
    note D_2
    note E_2
    note F_2
    notelen 6
    note F#2
    notelen 1
    note F#2
    note G_2
    note G#2
    notelen 6
    note A_2
    notelen 1
    note A_2
    note B_2
    note C_3
    note C#3
    notelen 3
    note D_3
    enable_unknown2
    note F_3
    disable_unknown2
    set_envelope_duty $41, $00, 2, 0

    begin_loop $06
        notelen 2
        note B_5
        notelen 1
        note D_6
        notelen 2
        note A_5
        note D_6
        note B_5
        note D_6
        notelen 1
        note B_5
        notelen 2
        note A_5
        note D_6
    next_loop

    set_envelope_duty $61, $00, 1, 0
    notelen 6
    note G_5
    notelen 1
    note G_5
    note F_5
    notelen 2
    note A_5
    note G_5
    note G_5
    notelen 1
    note G_5
    notelen 2
    note F_5
    note A_5
    note G_6
    note G_6
    note F_6
    notelen 7
    note G_6
    enable_unknown2
    notelen 3
    note A_2
    disable_unknown2
    end_def

ChannelDefinition_1e_77a3::
    set_envelope_duty $81, $00, 1, 0
    notelen 1
    note F#3
    note G_3
    note G#3
    notelen 6
    note A_3
    notelen 1
    note A_3
    note A#3
    note B_3
    notelen 6
    note C_4
    notelen 1
    note C_4
    note D_4
    note E_4
    note F_4
    notelen 4
    note F#4
    notelen 14
    rest
    enable_unknown2
    notelen 1
    rest
    notelen 2
    note C_4
    notelen 1
    note C_4
    notelen 2
    note G_3
    notelen 1
    note B_2
    note B_2
    disable_unknown2
    notelen 6
    note B_2
    notelen 1
    note B_2
    note A_2
    notelen 2
    note C_3
    note B_2
    note B_2
    notelen 1
    note B_2
    notelen 2
    note A_2
    note C_3
    notelen 6
    note B_2
    notelen 1
    note B_2
    note A_2
    notelen 2
    note C_3
    notelen 2
    note B_2
    enable_unknown2
    note C_4
    notelen 1
    note C_4
    notelen 2
    note G_3
    notelen 1
    note B_2
    note B_2
    disable_unknown2
    notelen 6
    note D_3
    notelen 1
    note D_3
    note C_3
    notelen 2
    note E_3
    note D_3
    note D_3
    notelen 1
    note D_3
    notelen 2
    note C_3
    note E_3
    notelen 6
    note D_3
    notelen 1
    note D_3
    note C_3
    notelen 2
    note E_3
    notelen 2
    note D_3
    enable_unknown2
    note C_4
    notelen 1
    note C_4
    notelen 2
    note G_3
    notelen 1
    note B_2
    note B_2
    disable_unknown2
    notelen 6
    note G_1
    notelen 1
    note G_1
    note F_1
    notelen 2
    note A_1
    note G_1
    note G_1
    notelen 1
    note G_1
    notelen 2
    note F_1
    note A_1
    note G_1
    note G_1
    note F_1
    notelen 7
    note G_1
    set_envelope_duty $a1, $00, 2, 0
    enable_unknown2
    notelen 3
    note F_3
    disable_unknown2
    end_def

ChannelDefinition_1e_7827::
    set_waveform waveform_1e_730f, $20
    enable_software_envelope
    notelen 1
    note D_4
    note E_4
    note F_4
    notelen 6
    note F#4
    notelen 1
    note F#4
    note G_4
    note G#4
    notelen 6
    note A_4
    notelen 1
    note A_4
    note B_4
    note C_5
    note C#5
    notelen 4
    note D_5

    begin_loop $02
        notelen 6
        note G_2
        notelen 1
        note G_2
        note F_2
        notelen 2
        note A_2
        note G_2
        note G_2
        notelen 1
        note G_2
        notelen 2
        note F_2
        note A_2
        notelen 6
        note G_2
        notelen 1
        note G_2
        note F_2
        notelen 2
        note A_2
        note G_2
        notelen 6
        rest
        notelen 3
        rest
    next_loop

    notelen 6
    note B_2
    notelen 1
    note B_2
    note A_2
    notelen 2
    note C_3
    note B_2
    note B_2
    notelen 1
    note B_2
    notelen 2
    note A_2
    note C_3
    notelen 6
    note B_2
    notelen 1
    note B_2
    note A_2
    notelen 2
    note C_3
    note B_2
    notelen 6
    rest
    notelen 3
    rest
    notelen 6
    note G_3
    notelen 1
    note G_3
    note F_3
    notelen 2
    note A_3
    note G_3
    note G_3
    notelen 1
    note G_3
    notelen 2
    note F_3
    note A_3
    note G_3
    note G_3
    note F_3
    notelen 7
    note G_3
    notelen 3
    rest
    end_def

ChannelDefinition_1e_788c::
    notelen 5
    rest
    notelen 3
    rest
    note NOISE_FF

    begin_loop $06
        notelen 1
        note NOISE_6
        note NOISE_5
        note NOISE_5
        note NOISE_6
        note NOISE_5
        note NOISE_5
        note NOISE_FF
        note NOISE_6
        note NOISE_6
        note NOISE_5
        note NOISE_5
        note NOISE_6
        note NOISE_5
        note NOISE_5
        note NOISE_FF
        note NOISE_FF
    next_loop

    notelen 6
    note NOISE_FF
    notelen 1
    note NOISE_FF
    note NOISE_FF
    notelen 2
    note NOISE_FF
    note NOISE_FF
    note NOISE_FF
    notelen 1
    note NOISE_FF
    notelen 2
    note NOISE_FF
    note NOISE_FF
    note NOISE_FF
    note NOISE_FF
    note NOISE_FF
    notelen 7
    note NOISE_FF
    notelen 3
    note NOISE_FF
    end_def

MusicLoop_1e_78bb::
    dw   ChannelDefinition_1e_78c1
    dw   $ffff, MusicLoop_1e_78bb

ChannelDefinition_1e_78c1::
    begin_loop $20
        notelen 14
        rest
    next_loop

    end_def

MusicLoop_1e_78c7::
    dw   ChannelDefinition_1e_78cd
    dw   $ffff, MusicLoop_1e_78c7

ChannelDefinition_1e_78cd::
    begin_loop $20
        notelen 14
        rest
    next_loop

    end_def

Music48::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music48Channel1
    dw   Music48Channel2
    dw   Music48Channel3
    dw   $0000

Music48Channel1::
    dw   ChannelDefinition_1e_78f2
    dw   $ffff, Music48Channel1

Music48Channel2::
    dw   ChannelDefinition_1e_7960
    dw   $ffff, Music48Channel2

Music48Channel3::
    dw   ChannelDefinition_1e_79b7

MusicLoop_1e_78ec::
    dw   ChannelDefinition_1e_79be
    dw   $ffff, MusicLoop_1e_78ec

ChannelDefinition_1e_78f2::
    set_envelope_duty $42, $82, 2, 0

    begin_loop $02
        notelen 2
        note G_3
        note D_4
        note A_4
        note B_4
        notelen 4
        rest
        notelen 2
        note G_3
        note E_4
        note B_4
        note C_5
        notelen 4
        rest
    next_loop

    notelen 2
    note G_3
    note D_4
    note A_4
    note B_4
    notelen 4
    rest
    notelen 2
    note G_3
    note C#4
    note A_4
    note A#4
    notelen 4
    rest
    notelen 2
    note A_3
    note E_4
    note B_4
    note C_5
    notelen 4
    rest
    notelen 2
    note G#3
    note B_3
    note D_4
    note F_4
    note E_4
    notelen 7
    rest
    notelen 2
    note A_3
    note C#4
    note E_4
    note G_4
    notelen 4
    rest
    notelen 2
    note C_4
    note D#4
    note F#4
    note A_4
    notelen 4
    rest
    notelen 2
    note B_3
    note D_4
    note F#4
    note A_4
    notelen 4
    rest
    notelen 2
    note B_3
    note D_4
    note F#4
    note G_4
    notelen 4
    rest
    notelen 2
    note A_3
    note C_4
    note E_4
    note G_4
    notelen 4
    rest
    notelen 2
    note A_3
    note C#4
    note E_4
    note G_4
    notelen 4
    rest
    notelen 2
    note B_3
    note D_4
    note F#4
    note D_4
    note A#3
    note C#4
    note E_4
    note C#4
    note A_3
    note C_4
    note E_4
    note C_4
    note A_3
    note C_4
    note D#4
    note C_4
    end_def

ChannelDefinition_1e_7960::
    set_envelope_duty $50, $44, 2, 0

    begin_loop $02
        notelen 4
        note D_5
        note G_4
        note A_4
        notelen 3
        rest
        notelen 2
        note B_4
        note C_5
    next_loop

    notelen 3
    note B_4
    note D_5
    notelen 4
    note A_5
    notelen 3
    rest
    note G_5
    note A_5
    note G_5
    note D_5
    notelen 2
    note C_5
    note B_4
    notelen 4
    note A_4
    rest
    notelen 2
    rest
    note B_4
    note C_5
    note D_5
    notelen 4
    note E_5
    note G_4
    note F#4
    notelen 3
    rest
    notelen 2
    note A_4
    note E_5
    notelen 4
    note D_5
    note F#4
    note G_4
    notelen 3
    rest
    notelen 2
    note G_4
    note F#4
    notelen 3
    note E_4
    note G_4
    notelen 4
    note B_4
    notelen 3
    rest
    note A_4
    note G_4
    note D#4
    notelen 4
    note D_4
    notelen 14
    rest
    end_def

waveform_1e_79a7::
    db   $11, $11, $11, $10, $00, $00, $00, $00, $11, $11, $11, $10, $00, $00, $00, $00

ChannelDefinition_1e_79b7::
    set_waveform waveform_1e_79a7, $20
    notelen 2
    rest
    end_def

ChannelDefinition_1e_79be::
    begin_loop $02
        notelen 4
        note D_5
        note G_4
        note A_4
        notelen 3
        rest
        notelen 2
        note B_4
        note C_5
    next_loop

    notelen 3
    note B_4
    note D_5
    notelen 7
    note A_5
    rest
    notelen 3
    note G_5
    note A_5
    note G_5
    note D_5
    notelen 2
    note C_5
    note B_4
    notelen 7
    note A_4
    notelen 4
    rest
    notelen 2
    rest
    rest
    note B_4
    note C_5
    note D_5
    notelen 4
    note E_5
    note G_4
    notelen 7
    note F#4
    rest
    notelen 2
    note A_4
    note E_5
    notelen 4
    note D_5
    note F#4
    notelen 7
    note G_4
    rest
    notelen 2
    note G_4
    note F#4
    notelen 3
    note E_4
    note G_4
    notelen 7
    note B_4
    rest
    notelen 3
    note A_4
    note G_4
    note D#4
    notelen 7
    note D_4
    notelen 2
    rest
    notelen 14
    rest
    end_def

Music55::
    db   $00
    dw   MusicSpeedData_1e_4aca
    dw   Music55Channel1
    dw   Music55Channel2
    dw   Music55Channel3
    dw   $0000

Music55Channel1::
    dw   ChannelDefinition_1e_7a3e
    dw   ChannelDefinition_1e_7a32
    dw   ChannelDefinition_1e_7a43
    dw   ChannelDefinition_1e_7a32
    dw   ChannelDefinition_1e_7a48
    dw   ChannelDefinition_1e_7a32
    dw   ChannelDefinition_1e_7a43
    dw   ChannelDefinition_1e_7a32
    dw   $ffff, Music55Channel1

Music55Channel2::
    dw   ChannelDefinition_1e_7a4d
    dw   $ffff, Music55Channel2

Music55Channel3::
    dw   ChannelDefinition_1e_79b7

MusicLoop_1e_7a2c::
    dw   ChannelDefinition_1e_7a51
    dw   $ffff, MusicLoop_1e_7a2c

ChannelDefinition_1e_7a32::
    begin_loop $02
        notelen 12
        note C#6
        note D_6
    next_loop

    begin_loop $02
        note E_6
        note F_6
    next_loop

    end_def

ChannelDefinition_1e_7a3e::
    set_envelope_duty $10, $00, 0, 0
    end_def

ChannelDefinition_1e_7a43::
    set_envelope_duty $20, $00, 0, 0
    end_def

ChannelDefinition_1e_7a48::
    set_envelope_duty $30, $00, 0, 0
    end_def

ChannelDefinition_1e_7a4d::
    set_envelope_duty $1a, $81, 1, 0

ChannelDefinition_1e_7a51::
    begin_loop $20
        notelen 2
        note C_5
        note F_5
        note A#5
        note B_5
    next_loop

    end_def

Music56::
    db   $00
    dw   MusicSpeedData_1e_4af7
    dw   Music56Channel1
    dw   Music56Channel2
    dw   Music56Channel3
    dw   $0000

Music56Channel1::
    dw   ChannelDefinition_1e_7a7b
    dw   ChannelDefinition_1e_7a87

MusicLoop_1e_7a69::
    dw   ChannelDefinition_1e_7b16
    dw   ChannelDefinition_1e_7b1f
    dw   $ffff, MusicLoop_1e_7a69

Music56Channel2::
    dw   ChannelDefinition_1e_7a82
    dw   ChannelDefinition_1e_7a87

MusicLoop_1e_7a75::
    dw   ChannelDefinition_1e_7b1b
    dw   $ffff, MusicLoop_1e_7a75

ChannelDefinition_1e_7a7b::
    set_envelope_duty $42, $00, 2, 0
    notelen 1
    rest
    end_def

ChannelDefinition_1e_7a82::
    set_envelope_duty $81, $00, 2, 0
    end_def

ChannelDefinition_1e_7a87::
    notelen 5
    rest
    notelen 2
    rest
    enable_unknown2
    notelen 0
    note A#2
    note B_2
    note F#3
    note G_3
    note A#3
    note G_3
    note D#3
    note B_2
    note C_3
    note C#3
    note F_3
    note A_3
    note C_4
    note A_3
    note F_3
    note C#3
    note D_3
    note D#3
    note G_3
    note B_3
    note D_4
    note B_3
    note G_3
    note D#3
    note E_3
    note F_3
    note A_3
    note C#4
    note E_4
    note C#4
    note A_3
    note F_3
    note F#3
    note G_3
    note B_3
    note D#4
    note F#4
    note D#4
    note B_3
    note G_3
    note G#3
    note A_3
    note C#4
    note F_4
    note G#4
    note F_4
    note C#4
    note A_3
    note A#3
    note B_3
    note D#4
    note G_4
    note A#4
    note G_4
    note D#4
    note B_3
    note C_4
    note C#4
    note F_4
    note A_4
    note C_5
    note A_4
    note F_4
    note C#4
    note D_4
    note D#4
    note G_4
    note B_4
    note D_5
    note B_4
    note G_4
    note D#4
    note E_4
    note F_4
    note A_4
    note C#5
    note E_5
    note C#5
    note A_4
    note F_4

    begin_loop $02
        note F#4
        note G_4
        note B_4
        note D#5
        note F#5
        note D#5
        note B_4
        note G_4
        note F#4
        note D#4
        note B_3
        note G_3
        note B_3
        note D#4
    next_loop

    note F#4
    note G_4
    note B_4
    note D#5
    note F#5
    note D#5
    note B_4
    note G_4
    note D#5
    note B_4
    note G_4
    note F#4
    note B_4
    note G_4
    note F#4
    note D#4
    note G_4
    note F#4
    note D#4
    note B_3
    note F#4
    note D#4
    note B_3
    note G_3
    note D#4
    note B_3
    note G_3
    note D#3
    note B_3
    note G_3
    note F#3
    note D#3
    note G_3
    note F#3
    note D#3
    note B_2
    notelen 5
    note G_2
    disable_unknown2
    end_def

ChannelDefinition_1e_7b16::
    set_envelope_duty $10, $00, 2, 0
    end_def

ChannelDefinition_1e_7b1b::
    set_envelope_duty $1a, $81, 1, 0

ChannelDefinition_1e_7b1f::
    begin_loop $20
        notelen 10
        note C_5
        note F_5
        note A#5
        note B_5
    next_loop

    end_def

Music57::
    db   $0e
    dw   MusicSpeedData_1e_4abb
    dw   Music57Channel1
    dw   Music57Channel2
    dw   Music57Channel3
    dw   $0000

Music57Channel1::
    dw   ChannelDefinition_1e_7b45
    dw   $ffff, Music57Channel1

Music57Channel2::
    dw   ChannelDefinition_1e_7b61
    dw   $ffff, Music57Channel2

Music57Channel3::
    dw   ChannelDefinition_1e_7b90
    dw   $ffff, Music57Channel3

ChannelDefinition_1e_7b45::
    set_envelope_duty $62, $00, 1, 0

    begin_loop $20
        notelen 3
        note C_3
        notelen 2
        note E_3
        notelen 3
        note G_3
        notelen 2
        note B_3
        notelen 8
        note A_3
        notelen 3
        note A_2
        notelen 2
        note D_3
        notelen 3
        note F_3
        notelen 2
        note A_3
        notelen 8
        note G_3
    next_loop

    end_def

ChannelDefinition_1e_7b61::
    set_envelope_duty $50, $21, 2, 0
    notelen 14
    rest
    rest
    notelen 8
    note G_4
    notelen 3
    rest
    notelen 2
    note D_4
    notelen 3
    note E_4
    notelen 2
    note G_3
    notelen 5
    note A_3
    notelen 2
    rest
    notelen 3
    note E_4
    notelen 2
    note A_4
    notelen 8
    note G_4
    notelen 3
    rest
    notelen 2
    note D_4
    notelen 3
    note E_4
    notelen 2
    note G_3
    notelen 5
    note A_3
    notelen 2
    rest
    notelen 3
    note G_3
    notelen 2
    note E_4
    notelen 14
    note C_4
    rest
    end_def

ChannelDefinition_1e_7b90::
    set_waveform waveform_1e_4bf9, $40

    begin_loop $20
        notelen 5
        rest
        notelen 1
        note A_4
        rest
        notelen 7
        note A_5
        notelen 5
        rest
        notelen 1
        note G_4
        rest
        notelen 7
        note G_5
    next_loop

    end_def

Music25::
    db   $00
    dw   MusicSpeedData_1e_4ae8
    dw   Music25Channel1
    dw   Music25Channel2
    dw   Music25Channel3
    dw   Music25Channel4

Music25Channel1::
    dw   ChannelDefinition_1e_7bc9
    dw   $ffff, Music18Channel1

Music25Channel2::
    dw   ChannelDefinition_1e_7be0
    dw   $ffff, Music18Channel2

Music25Channel3::
    dw   ChannelDefinition_1e_7c06
    dw   $ffff, MusicLoop_1e_78bb

Music25Channel4::
    dw   ChannelDefinition_1e_7c1a
    dw   $ffff, MusicLoop_1e_78c7

ChannelDefinition_1e_7bc9::
    set_envelope_duty $80, $81, 0, 0
    enable_unknown1
    notelen 1
    note E_4
    note A_4
    note D_5
    note B_4
    note E_5
    note A_5
    set_envelope_duty $80, $00, 0, 0
    notelen 4
    note F#5
    rest
    set_speed MusicSpeedData_1e_4ad9
    end_def

ChannelDefinition_1e_7be0::
    set_envelope_duty $40, $81, 1, 0
    notelen 1
    note G#3
    note C#4
    note F#4
    note D#4
    note G#4
    note C#5
    set_envelope_duty $40, $00, 1, 0
    notelen 4
    note A#4
    rest
    set_speed MusicSpeedData_1e_4ad9
    end_def

waveform_1e_7bf6::
    db   $aa, $aa, $aa, $a8, $00, $00, $00, $00, $aa, $aa, $aa, $a8, $00, $00, $00, $00

ChannelDefinition_1e_7c06::
    set_waveform waveform_1e_7bf6, $20
    enable_software_envelope
    notelen 1
    note B_2
    note E_3
    note A_3
    note F#3
    note B_3
    note E_4
    disable_software_envelope
    notelen 4
    note C#4
    rest
    set_speed MusicSpeedData_1e_4ad9
    end_def

ChannelDefinition_1e_7c1a::
    begin_loop $06
        notelen 1
        note NOISE_6
    next_loop

    begin_loop $10
        notelen 0
        note NOISE_5
    next_loop

    set_speed MusicSpeedData_1e_4ad9
    end_def

Music59::
    db   $00
    dw   MusicSpeedData_1e_4aca
    dw   Music59Channel1
    dw   Music59Channel2
    dw   Music59Channel3
    dw   Music59Channel4

Music59Channel1::
    dw   ChannelDefinition_1e_7c47

MusicLoop_1e_7c35::
    dw   ChannelDefinition_1e_7c4e
    dw   $ffff, MusicLoop_1e_7c35

Music59Channel2::
    dw   ChannelDefinition_1e_7c93
    dw   $ffff, Music59Channel2

Music59Channel4::
    dw   ChannelDefinition_1e_7cf9
    dw   $ffff, Music59Channel4

ChannelDefinition_1e_7c47::
    set_envelope_duty $10, $00, 2, 0
    notelen 1
    rest
    end_def

ChannelDefinition_1e_7c4e::
    notelen 12
    note B_6
    note F#6
    note A#6
    note F_6
    note A_6
    note E_6
    note G#6
    note D#6
    note G_6
    note D_6
    note F#6
    note B_5
    note F_6
    note A#5
    note E_6
    note A_5
    note D#6
    note G#5
    notelen 12
    note F#6
    note B_5
    note F_6
    note A#5
    note E_6
    note A_5
    note D#6
    note G#5
    notelen 13
    note C#6
    note C_6
    note G#5
    note F_5
    note D#5
    note C#5
    note C_5
    note G#4
    note F_4
    note D#4
    notelen 13
    note C#5
    note C_5
    note G#4
    note F_4
    note D#4
    notelen 14
    rest
    notelen 13
    note C_6
    note G#5
    notelen 13
    note C_6
    note G#5
    notelen 5
    rest
    rest
    notelen 13
    note C_5
    note C#5
    note G#5
    note F_5
    note C_5
    note C#5
    note G#5
    note F_5
    notelen 5
    rest
    rest
    end_def

ChannelDefinition_1e_7c93::
    set_envelope_duty $39, $00, 0, 0
    notelen 12
    note B_6
    note F#6
    note A#6
    note F_6
    note A_6
    note E_6
    note G#6
    note D#6
    note G_6
    note D_6
    note F#6
    note B_5
    note F_6
    note A#5
    note E_6
    note A_5
    note D#6
    note G#5
    set_envelope_duty $20, $00, 1, 0
    notelen 12
    note F#6
    note B_5
    note F_6
    note A#5
    note E_6
    note A_5
    note D#6
    note G#5
    set_envelope_duty $29, $00, 0, 0
    notelen 13
    note C#6
    note C_6
    note G#5
    note F_5
    note D#5
    note C#5
    note C_5
    note G#4
    note F_4
    note D#4
    set_envelope_duty $20, $00, 1, 0
    notelen 13
    note C#5
    note C_5
    note G#4
    note F_4
    note D#4
    notelen 14
    rest
    set_envelope_duty $29, $00, 0, 0
    notelen 13
    note C_6
    note G#5
    set_envelope_duty $20, $00, 1, 0
    notelen 13
    note C_6
    note G#5
    notelen 5
    rest
    rest
    set_envelope_duty $29, $00, 0, 0
    notelen 13
    note C_5
    note C#5
    note G#5
    note F_5
    set_envelope_duty $20, $00, 1, 0
    notelen 13
    note C_5
    note C#5
    note G#5
    note F_5
    notelen 5
    rest
    rest
    end_def

ChannelDefinition_1e_7cf9::
    begin_loop $20
        notelen 3
        note NOISE_12
    next_loop

    end_def

Music5e::
    db   $00
    dw   MusicSpeedData_1e_4aca
    dw   Music5eChannel1
    dw   Music5eChannel2
    dw   Music5eChannel3
    dw   $0000

Music5eChannel1::
    dw   ChannelDefinition_1e_7d28

MusicLoop_1e_7d0c::
    dw   ChannelDefinition_1e_7d36
    dw   $ffff, MusicLoop_1e_7d0c

Music5eChannel2::
    dw   ChannelDefinition_1e_7d33

MusicLoop_1e_7d14::
    dw   ChannelDefinition_1e_7d3c
    dw   ChannelDefinition_1e_7d36
    dw   ChannelDefinition_1e_7d41
    dw   ChannelDefinition_1e_7d36
    dw   ChannelDefinition_1e_7d46
    dw   ChannelDefinition_1e_7d36
    dw   ChannelDefinition_1e_7d41
    dw   ChannelDefinition_1e_7d36
    dw   $ffff, MusicLoop_1e_7d14

ChannelDefinition_1e_7d28::
    set_envelope_duty $20, $00, 1, 3
    notelen 7
    rest
    notelen 1
    rest
    notelen 0
    rest
    end_def

ChannelDefinition_1e_7d33::
    notelen 7
    rest
    end_def

ChannelDefinition_1e_7d36::
    notelen 1
    note D#2
    note E_2
    note D#2
    note E_2
    end_def

ChannelDefinition_1e_7d3c::
    set_envelope_duty $20, $00, 1, 0
    end_def

ChannelDefinition_1e_7d41::
    set_envelope_duty $30, $00, 1, 0
    end_def

ChannelDefinition_1e_7d46::
    set_envelope_duty $40, $00, 1, 0
    end_def

Music5f::
    db   $00
    dw   MusicSpeedData_1e_4aac
    dw   Music5fChannel1
    dw   Music5fChannel2
    dw   Music5fChannel3
    dw   $0000

Music5fChannel1::
    dw   ChannelDefinition_1e_7d6e

MusicLoop_1e_7d58::
    dw   ChannelDefinition_1e_7d84
    dw   $ffff, MusicLoop_1e_7d58

Music5fChannel2::
    dw   ChannelDefinition_1e_7d7a

MusicLoop_1e_7d60::
    dw   ChannelDefinition_1e_7d84
    dw   $ffff, MusicLoop_1e_7d60

Music5fChannel3::
    dw   ChannelDefinition_1e_7df8

MusicLoop_1e_7d68::
    dw   ChannelDefinition_1e_7d84
    dw   $ffff, MusicLoop_1e_7d68

ChannelDefinition_1e_7d6e::
    set_envelope_duty $10, $00, 1, 0
    notelen 5
    rest
    rest
    notelen 8
    rest
    notelen 10
    rest
    end_def

ChannelDefinition_1e_7d7a::
    set_envelope_duty $20, $00, 0, 0
    notelen 5
    rest
    rest
    notelen 8
    rest
    end_def

ChannelDefinition_1e_7d84::
    notelen 1
    note A#6
    note G#6
    note G_6
    note D#6
    note C_6
    note A#5
    note G#5
    note G_5
    note D#5
    note C_5
    note A#4
    note G#4
    note G_4
    note D#4
    note C_4
    note A#3
    note G#3
    note G_3
    note D#3
    note C_3
    note A#2
    note G#2
    note A#2
    note C_3
    note D#3
    note G_3
    note G#3
    note A#3
    note C_4
    note D#4
    note G_4
    note G#4
    note A#4
    note C_5
    note D#5
    note G_5
    note G#5
    note A#5
    note C_6
    note D#6
    note G_6
    note G#6
    note A#6
    note G#6
    note F#6
    note D#6
    note B_5
    note A#5
    note G#5
    note F#5
    note D#5
    note B_4
    note A#4
    note G#4
    note F#4
    note D#4
    note B_3
    note A#3
    note G#3
    note F#3
    note D#3
    note B_2
    note C#3
    note D#3
    note F#3
    note G#3
    note A#3
    note B_3
    note C#3
    note D#4
    note F#4
    note G#4
    note A#4
    note B_4
    note C#3
    note D#5
    note F#5
    note G#5
    note A#5
    note A#5
    note G#5
    note F_5
    note C#5
    note C_5
    note A#4
    note G#4
    note F_4
    note C#4
    note C_4
    note A#3
    note G#3
    note F_3
    note C#3
    note C_3
    note A#2
    note C_3
    note C#3
    note F_3
    note G#3
    note A#3
    note C_4
    note C#4
    note F_4
    note G#4
    note A#4
    note C_5
    note C#5
    note F_5
    note G#5
    note A#5
    note C_6
    note C#6
    note F_6
    note G#6
    end_def

ChannelDefinition_1e_7df8::
    set_waveform waveform_1e_79a7, $20
    notelen 5
    rest
    rest
    notelen 8
    rest
    notelen 3
    rest
    end_def

Music60::
    db   $00
    dw   MusicSpeedData_1e_4ad9
    dw   Music60Channel1
    dw   Music60Channel2
    dw   Music60Channel3
    dw   Music60Channel4

Music60Channel1::
    dw   ChannelDefinition_1e_7e2f

MusicLoop_1e_7e11::
    dw   ChannelDefinition_1e_7e70
    dw   $ffff, MusicLoop_1e_7e11

Music60Channel2::
    dw   ChannelDefinition_1e_7e3a

MusicLoop_1e_7e19::
    dw   ChannelDefinition_1e_7e96
    dw   $ffff, MusicLoop_1e_7e19

Music60Channel3::
    dw   ChannelDefinition_1e_7e55

MusicLoop_1e_7e21::
    dw   ChannelDefinition_1e_7efe
    dw   $ffff, MusicLoop_1e_7e21

Music60Channel4::
    dw   ChannelDefinition_1e_7e60

MusicLoop_1e_7e29::
    dw   ChannelDefinition_1e_7f76
    dw   $ffff, MusicLoop_1e_7e29

ChannelDefinition_1e_7e2f::
    set_envelope_duty $60, $00, 1, 1
    notelen 7
    rest
    notelen 10
    note D_4
    notelen 14
    note D#4
    end_def

ChannelDefinition_1e_7e3a::
    set_envelope_duty $40, $00, 0, 1
    notelen 7
    rest
    notelen 10
    note C#5
    notelen 14
    note D_5
    end_def

waveform_1e_7e45::
    db   $8a, $df, $da, $86, $31, $01, $36, $86, $8a, $df, $da, $86, $31, $01, $36, $86

ChannelDefinition_1e_7e55::
    set_waveform waveform_1e_7e45, $20
    notelen 7
    rest
    notelen 10
    note G#4
    notelen 14
    note A_4
    end_def

ChannelDefinition_1e_7e60::
    notelen 7
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

ChannelDefinition_1e_7e70::
    set_envelope_duty $41, $00, 2, 0

    begin_loop $07
        notelen 6
        note E_6
        note E_6
        notelen 3
        note E_6
        notelen 2
        note E_6
        notelen 3
        note E_6
    next_loop

    set_envelope_duty $61, $00, 2, 0
    enable_unknown2
    notelen 2
    note A_3
    notelen 6
    note A_3
    notelen 1
    note A_3
    note A_3
    notelen 3
    note A_3
    notelen 2
    note A_3
    notelen 1
    note A_3
    notelen 2
    note A_3
    disable_unknown2
    end_def

ChannelDefinition_1e_7e96::
    set_envelope_duty $60, $21, 1, 1
    notelen 3
    note A#3
    notelen 7
    note F_3
    notelen 1
    rest
    note A#3
    note A#3
    note C_4
    note C#4
    note D#4
    notelen 8
    note F_4
    notelen 10
    note F_4
    note F#4
    note G#4
    notelen 13
    rest
    notelen 8
    note A#4
    notelen 10
    note A#4
    note G#4
    note F#4
    notelen 13
    rest
    notelen 6
    note G#4
    notelen 1
    note F#4
    notelen 4
    note F_4
    notelen 3
    note F_4
    notelen 2
    note D#4
    notelen 1
    note D#4
    note F_4
    notelen 4
    note F#4
    notelen 2
    note F_4
    note D#4
    notelen 2
    note C#4
    notelen 1
    note C#4
    note D#4
    notelen 4
    note F_4
    notelen 2
    note D#4
    note C#4
    notelen 2
    note C_4
    notelen 1
    note C_4
    note D_4
    notelen 4
    note E_4
    notelen 3
    note G_4
    set_envelope_duty $62, $00, 1, 0
    notelen 2
    note F_4
    notelen 6
    note F_4
    notelen 1
    note F_4
    note F_4
    notelen 3
    note F_4
    notelen 2
    note F_4
    notelen 1
    note F_4
    notelen 2
    note F_4
    end_def

waveform_1e_7eee::
    db   $00, $11, $22, $33, $44, $55, $67, $89, $00, $00, $00, $05, $00, $00, $00, $05

ChannelDefinition_1e_7efe::
    set_waveform waveform_1e_7eee, $20
    enable_software_envelope
    notelen 2
    note A#4
    notelen 1
    note C#4
    notelen 2
    note F_4
    note A#4
    note A_4
    note C#4
    note F_4
    note A_4
    notelen 1
    note C#4
    notelen 2
    note G#4
    notelen 1
    note C#4
    notelen 2
    note F_4
    note G#4
    note G_4
    note C#4
    note F_4
    note G_4
    notelen 1
    note C#4
    notelen 2
    note F#4
    notelen 1
    note A#3
    notelen 2
    note C#4
    note F#4
    note G#4
    note C_4
    note D#4
    note G#4
    notelen 1
    note C_4
    notelen 2
    note G#4
    notelen 1
    note C#4
    notelen 2
    note F_4
    note G#4
    note G#4
    notelen 1
    note C#4
    note F_4
    notelen 2
    note G#4
    notelen 1
    note C#4
    note F_4
    note G#4
    notelen 2
    note F#4
    notelen 1
    note B_3
    notelen 2
    note D#4
    note F#4
    note D#4
    note F#3
    note B_3
    note D#4
    notelen 1
    note E_4
    notelen 2
    note F_4
    notelen 1
    note A#3
    notelen 2
    note C#4
    note F_4
    note A#4
    notelen 1
    note C#4
    note F_4
    notelen 2
    note A#4
    notelen 1
    note A_4
    note A#4
    note B_4
    notelen 2
    note C_5
    notelen 1
    note E_4
    notelen 2
    note G_4
    note C_5
    note A#4
    note E_4
    note G_4
    note A#4
    notelen 1
    note G_4
    notelen 2
    note A_4
    notelen 6
    note A_4
    notelen 1
    note A_4
    note A_4
    notelen 3
    note A_4
    notelen 2
    note A_4
    notelen 1
    note A_4
    notelen 2
    note A_4
    end_def

ChannelDefinition_1e_7f76::
    begin_loop $07
        notelen 1
        note NOISE_5
        note NOISE_5
        note NOISE_6
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_FF
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_6
        note NOISE_5
        note NOISE_5
        note NOISE_5
        note NOISE_6
        note NOISE_FF
    next_loop

    notelen 2
    note NOISE_FF
    notelen 6
    note NOISE_FF
    notelen 1
    note NOISE_FF
    note NOISE_FF
    notelen 3
    note NOISE_FF
    notelen 2
    note NOISE_FF
    notelen 1
    note NOISE_FF
    notelen 2
    note NOISE_FF
    end_def
