Music61::
Music62::
Music63::
Music64::
Music65::
Music66::
Music67::
Music68::
Music69::
Music6a::
Music6b::
Music6c::
Music6d::
Music6e::
Music6f::
Music70::
    db   $00
    dw   MusicSpeedData_1b_4ac8
    dw   Music61Channel1
    dw   Music61Channel2
    dw   Music61Channel3
    dw   $0000

Music61Channel1::
    dw   ChannelDefinition_1b_712f
    dw   $ffff, MusicLoop_1b_7113

Music61Channel2::
    dw   ChannelDefinition_1b_7137

MusicLoop_1b_7113::
    dw   ChannelDefinition_1b_713c
    dw   ChannelDefinition_1b_713c
    dw   ChannelDefinition_1b_71b2
    dw   $ffff, MusicLoop_1b_7113

Music61Channel3::
    dw   ChannelDefinition_1b_7228
    dw   ChannelDefinition_1b_722d
    dw   ChannelDefinition_1b_722d
    dw   ChannelDefinition_1b_726a
    dw   $ffff, Music61Channel3
; UNREFERENCED DATA
    db   $22, $73, $ff, $ff, $29, $71

ChannelDefinition_1b_712f::
    set_envelope_duty $37, $00, 2, 0
    notelen 10
    rest
    rest
    end_def

ChannelDefinition_1b_7137::
    set_envelope_duty $47, $00, 2, 0
    end_def

ChannelDefinition_1b_713c::
    notelen 2
    note G_4
    note A#4
    note D_5
    note D#5
    note G_4
    note A#4
    note D_5
    note D#5
    note G_4
    note A#4
    note D_5
    note D#5
    note G_4
    note A#4
    note D_5
    note D#5
    note F#4
    note A_4
    note D_5
    note D#5
    note F#4
    note A_4
    note D_5
    note D#5
    note F#4
    note A_4
    note D_5
    note D#5
    note F#4
    note A_4
    note D_5
    note D#5
    note F_4
    note G#4
    note D_5
    note D#5
    note F_4
    note G#4
    note D_5
    note D#5
    note F_4
    note G#4
    note D_5
    note D#5
    note F_4
    note G#4
    note D_5
    note D#5
    note E_4
    note G_4
    note D_5
    note D#5
    note E_4
    note G_4
    note D_5
    note D#5
    note E_4
    note G_4
    note D_5
    note D#5
    note E_4
    note G_4
    note D_5
    note D#5
    note D#4
    note G_4
    note C_5
    note D_5
    note D#4
    note G_4
    note C_5
    note D_5
    note D#4
    note G_4
    note C_5
    note D_5
    note D#4
    note G_4
    note C_5
    note D_5
    note D_4
    note G_4
    note C_5
    note D_5
    note D_4
    note G_4
    note C_5
    note D_5
    note D_4
    note G_4
    note C_5
    note D_5
    note D_4
    note G_4
    note C_5
    note D_5
    note C_4
    note F#4
    note A_4
    note C_5
    note F#4
    note A_4
    note C_5
    note D#5
    note A_4
    note C_5
    note D#5
    note C_5
    note D#5
    note F#5
    note D#5
    note F#5
    note A_5
    note F#5
    note A_5
    note C_6
    end_def

ChannelDefinition_1b_71b2::
    notelen 2
    note D_5
    note A#4
    note G_4
    note A#4
    note D_5
    note A#4
    note G_4
    note A#4
    note D_5
    note A#4
    note G_4
    note A#4
    note D_5
    note A#4
    note G_4
    note A#4
    note D_5
    note A_4
    note F#4
    note A_4
    note D_5
    note A_4
    note F#4
    note A_4
    note D_5
    note A_4
    note F#4
    note A_4
    note D_5
    note A_4
    note F#4
    note A_4
    note D_5
    note G#4
    note F_4
    note G#4
    note D_5
    note G#4
    note F_4
    note G#4
    note D_5
    note G#4
    note F_4
    note G#4
    note D_5
    note G#4
    note F_4
    note G#4
    note D_5
    note G_4
    note E_4
    note G_4
    note D_5
    note G_4
    note E_4
    note G_4
    note D_5
    note G_4
    note E_4
    note G_4
    note D_5
    note G_4
    note E_4
    note G_4
    note D_5
    note G_4
    note D#4
    note G_4
    note D_5
    note G_4
    note D#4
    note G_4
    note D_5
    note G_4
    note D#4
    note G_4
    note D_5
    note G_4
    note D#4
    note G_4
    note D_5
    note G_4
    note D_4
    note G_4
    note D_5
    note G_4
    note D_4
    note G_4
    note D_5
    note G_4
    note D_4
    note G_4
    note D_5
    note G_4
    note D_4
    note G_4
    note C_4
    note F#4
    note A_4
    note C_5
    note F#4
    note A_4
    note C_5
    note D#5
    note A_4
    note C_5
    note D#5
    note C_5
    note D#5
    note F#5
    note D#5
    note F#5
    note A_5
    note F#5
    note A_5
    note C_6
    end_def

ChannelDefinition_1b_7228::
    set_waveform waveform_1b_7349, $21
    end_def

ChannelDefinition_1b_722d::
    notelen 5
    note G_2
    notelen 4
    note A#2
    note D_3
    note C#3
    notelen 14
    note F#2
    notelen 5
    note F_2
    notelen 7
    note F_2
    note G#2
    notelen 3
    note C#3
    notelen 4
    note C_3
    notelen 14
    note E_2
    notelen 2
    note D#2
    note D_2
    notelen 8
    note D#2
    notelen 7
    note G_2
    note D#3
    notelen 3
    note D_3
    notelen 2
    note D_2
    note C#2
    notelen 8
    note D_2
    notelen 7
    note G_2
    note D_3
    notelen 3
    note C#3
    notelen 2
    note D_2
    note F#2
    note A_2
    note F#2
    note A_2
    note C_3
    note A_2
    note C_3
    note D#3
    note C_3
    note D#3
    note F#3
    note A_3
    note F#3
    note D#3
    note C_3
    note D#3
    note C_3
    note A_2
    note F#2
    end_def

ChannelDefinition_1b_726a::
    set_waveform waveform_1b_7359, $40
    enable_software_envelope
    notelen 2
    note D_3
    note D_3
    note D_3
    note D_3
    set_waveform waveform_1b_7369, $40
    note D_3
    note D_3
    note D_3
    note D_3
    set_waveform waveform_1b_7359, $40
    note D_3
    note D_3
    note D_3
    note D_3
    set_waveform waveform_1b_7369, $40
    note D_3
    note D_3
    note D_3
    note D_3
    set_waveform waveform_1b_7359, $40
    rest
    rest
    rest
    rest
    note C#3
    note C#3
    note C#3
    note C#3
    note A_2
    note A_2
    note A_2
    note A_2
    set_waveform waveform_1b_7369, $40
    note A_2
    note A_2
    note A_2
    note A_2
    set_waveform waveform_1b_7359, $40
    note C_3
    note C_3
    note C_3
    note C_3
    set_waveform waveform_1b_7369, $40
    note C_3
    note C_3
    note C_3
    note C_3
    set_waveform waveform_1b_7359, $40
    rest
    rest
    rest
    rest
    note D_3
    note D_3
    note C_3
    note C_3
    note B_2
    note B_2
    note B_2
    note B_2
    set_waveform waveform_1b_7369, $40
    note B_2
    note B_2
    note B_2
    note B_2
    set_waveform waveform_1b_7359, $40
    rest
    rest
    rest
    rest
    note G_2
    note G_2
    note A_2
    note A_2
    note A#2
    note A#2
    note A#2
    note A#2
    set_waveform waveform_1b_7369, $40
    note A#2
    note A#2
    note A#2
    note A#2
    set_waveform waveform_1b_7359, $40
    rest
    rest
    note A#2
    note A#2
    note C_3
    note C_3
    note A#2
    note A#2
    note A_2
    note A_2
    note A_2
    note A_2
    set_waveform waveform_1b_7369, $40
    note A_2
    note A_2
    note A_2
    note A_2
    set_waveform waveform_1b_7359, $40
    rest
    rest
    note G_2
    note G_2
    note F#2
    note F#2
    note G_2
    note G_2
    note A_2
    note A_2
    note A_2
    note A_2
    set_waveform waveform_1b_7369, $40
    note A_2
    note A_2
    note A_2
    note A_2
    rest
    rest
    rest
    rest
    rest
    rest
    rest
    rest
    rest
    rest
    rest
    rest
    disable_software_envelope
    end_def
; UNREFERENCED DATA
    db   $9b, $07, $a3, $15, $15, $1f, $a2, $06, $a3, $15, $15, $a2, $15, $a3, $10, $9c
    db   $a2, $15, $15, $15, $15, $a3, $01, $a2, $15, $15, $15, $15, $a3, $01, $a2, $15
    db   $15, $15, $15, $a3, $06, $06, $00

waveform_1b_7349::
    db   $66, $66, $66, $66, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

waveform_1b_7359::
    db   $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09, $09

waveform_1b_7369::
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
