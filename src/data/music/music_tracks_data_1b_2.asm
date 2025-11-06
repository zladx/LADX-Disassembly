MusicTotakaUnused::
    db   $00
    dw   MusicSpeedData_1b_4ae6
    dw   MusicTotakaUnused_Channel1_rest_1C0
    dw   MusicTotakaUnused_Channel2_rest_1C0
    dw   MusicTotakaUnused_Channel3
    dw   $0000

MusicTotakaUnused_Channel3::
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

MusicTitleScreen::
    db   $00
    dw   MusicSpeedData_1b_4ac8
    dw   MusicTitleScreen_Channel1
    dw   MusicTitleScreen_Channel2
    dw   MusicTitleScreen_Channel3
    dw   $0000

MusicTitleScreen_Channel1::
    dw   ChannelDefinition_1b_rest_14
MusicLoop_1b_5041::
    dw   ChannelDefinition_1b_505b
    dw   $ffff, MusicLoop_1b_5041

MusicTitleScreen_Channel2::
    dw   ChannelDefinition_1b_50ab
MusicLoop_1b_5049::
    dw   ChannelDefinition_1b_50d9
    dw   $ffff, MusicLoop_1b_5049

MusicTitleScreen_Channel3::
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

MusicMinigame::
    db   $00
    dw   MusicSpeedData_1b_4aaa
    dw   MusicMinigame_Channel1
    dw   MusicMinigame_Channel2
    dw   MusicMinigame_Channel3
    dw   $0000

MusicMinigame_Channel1::
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
    dw   $ffff, MusicMinigame_Channel1

MusicMinigame_Channel2::
    dw   ChannelDefinition_1b_6f84
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_rest_1C_1
    dw   ChannelDefinition_1b_525d
    dw   ChannelDefinition_1b_6f89
    dw   ChannelDefinition_1b_702a
    dw   ChannelDefinition_1b_525d
    dw   ChannelDefinition_1b_527a
    dw   $ffff, MusicMinigame_Channel2

MusicMinigame_Channel3::
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
    dw   $ffff, MusicMinigame_Channel3

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

ChannelDefinition_1b_rest_1C_1::
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

MusicGameOver::
    db   $00
    dw   MusicSpeedData_1b_4ae6
    dw   MusicGameOver_Channel1
    dw   MusicGameOver_Channel2
    dw   MusicGameOver_Channel3
    dw   $0000

MusicGameOver_Channel1::
    dw   ChannelDefinition_1b_52eb
    dw   $ffff, MusicGameOver_Channel1

MusicGameOver_Channel2::
    dw   ChannelDefinition_1b_52b6
    dw   ChannelDefinition_1b_52bb
    dw   $ffff, MusicGameOver_Channel2

MusicGameOver_Channel3::
    dw   ChannelDefinition_1b_rest_6
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

MusicMabeVillage::
    db   $00
    dw   MusicSpeedData_1b_4af5
    dw   MusicMabeVillage_Channel1
    dw   MusicMabeVillage_Channel2
    dw   MusicMabeVillage_Channel3_rest_1C0
    dw   $0000

MusicMabeVillage_Channel1:: ; accompaniment
    dw   ChannelDefinition_1b_5343
    dw   $ffff, MusicMabeVillage_Channel1

MusicMabeVillage_Channel2:: ; melody
    dw   ChannelDefinition_1b_53a5
    dw   $ffff, MusicMabeVillage_Channel2

ChannelDefinition_1b_5343:: ; accompaniment
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

ChannelDefinition_1b_53a5:: ; melody
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

MusicOverworld::
    db   $00
    dw   MusicSpeedData_1b_4ac8
    dw   MusicOverworld_Channel1
    dw   MusicOverworld_Channel2
    dw   MusicOverworld_Channel3
    dw   $0000

MusicOverworld_Channel1::
    dw   ChannelDefinition_1b_5446
MusicLoop_1b_5412::
    dw   ChannelDefinition_1b_5471
    dw   ChannelDefinition_1b_54bc
    dw   ChannelDefinition_1b_5471
    dw   ChannelDefinition_1b_54e9
    dw   $ffff, MusicLoop_1b_5412

MusicOverworld_Channel2::
    dw   ChannelDefinition_1b_5562
MusicLoop_1b_5420::
    dw   ChannelDefinition_1b_558f
    dw   ChannelDefinition_1b_55c4
    dw   ChannelDefinition_1b_558f
    dw   ChannelDefinition_1b_55e8
    dw   $ffff, MusicLoop_1b_5420

MusicOverworld_Channel3::
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

MusicTalTalRange::
    db   $00
    dw   MusicSpeedData_1b_4ac8
    dw   MusicTalTalRange_Channel1
    dw   MusicTalTalRange_Channel2
    dw   MusicTalTalRange_Channel3
    dw   MusicTalTalRange_Channel4

MusicTalTalRange_Channel1::
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
    dw   ChannelDefinition_1b_rest_A_2
    dw   ChannelDefinition_1b_6f98
    dw   ChannelDefinition_1b_57f8
    dw   ChannelDefinition_1b_57f8
    dw   $ffff, MusicLoop_1b_5769

MusicTalTalRange_Channel2::
    dw   ChannelDefinition_1b_rest_14
    dw   ChannelDefinition_1b_586f
MusicLoop_1b_5791::
    dw   ChannelDefinition_1b_6fa2
    dw   ChannelDefinition_1b_588e
    dw   ChannelDefinition_1b_rest_14
    dw   ChannelDefinition_1b_rest_14
    dw   ChannelDefinition_1b_6fa7
    dw   ChannelDefinition_1b_588e
    dw   ChannelDefinition_1b_rest_A_2
    dw   ChannelDefinition_1b_rest_14
    dw   ChannelDefinition_1b_591b
    dw   $ffff, MusicLoop_1b_5791

MusicTalTalRange_Channel3::
    dw   ChannelDefinition_1b_6f55
    dw   ChannelDefinition_1b_5926
MusicLoop_1b_57ab::
    dw   ChannelDefinition_1b_6f6b
    dw   ChannelDefinition_1b_5933
    dw   ChannelDefinition_1b_597f
    dw   ChannelDefinition_1b_rest_14
    dw   ChannelDefinition_1b_rest_32
    dw   ChannelDefinition_1b_rest_A_2
    dw   ChannelDefinition_1b_597f
    dw   ChannelDefinition_1b_rest_A_2
    dw   ChannelDefinition_1b_rest_14
    dw   ChannelDefinition_1b_rest_14
    dw   $ffff, MusicLoop_1b_57ab

MusicTalTalRange_Channel4::
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

MusicShop::
    db   $00
    dw   MusicSpeedData_1b_4b04
    dw   MusicShop_Channel1
    dw   MusicShop_Channel2
    dw   MusicShop_Channel3
    dw   $0000

MusicShop_Channel1::
    dw   ChannelDefinition_1b_5a0f
    dw   $ffff, MusicShop_Channel1

MusicShop_Channel2::
    dw   ChannelDefinition_1b_5a3f
    dw   $ffff, MusicShop_Channel2

MusicShop_Channel3::
    dw   ChannelDefinition_1b_6f46
    dw   ChannelDefinition_1b_5a7a
    dw   $ffff, MusicShop_Channel3

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

MusicRaftRideRapids::
    db   $00
    dw   MusicSpeedData_1b_4ad7
    dw   MusicRaftRideRapids_Channel1
    dw   MusicRaftRideRapids_Channel2
    dw   MusicRaftRideRapids_Channel3
    dw   MusicRaftRideRapids_Channel4

MusicRaftRideRapids_Channel1::
    dw   ChannelDefinition_1b_702a
    dw   ChannelDefinition_1b_rest_5_1
    dw   ChannelDefinition_1b_6fb1
    dw   ChannelDefinition_1b_5af9
    dw   ChannelDefinition_1b_6fac
    dw   ChannelDefinition_1b_5af9
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_5ae0
    dw   ChannelDefinition_1b_702a
    dw   ChannelDefinition_1b_5ae0
    dw   ChannelDefinition_1b_rest_A_2
    dw   $ffff, MusicRaftRideRapids_Channel1

MusicRaftRideRapids_Channel2::
    dw   ChannelDefinition_1b_6fb1
    dw   ChannelDefinition_1b_5b21
    dw   ChannelDefinition_1b_6fac
    dw   ChannelDefinition_1b_5b28
    dw   ChannelDefinition_1b_5b00
    dw   ChannelDefinition_1b_5b00
    dw   ChannelDefinition_1b_rest_A_2
    dw   $ffff, MusicRaftRideRapids_Channel2

MusicRaftRideRapids_Channel3::
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_rest_A_2
    dw   ChannelDefinition_1b_5b2f
    dw   ChannelDefinition_1b_5b45
    dw   ChannelDefinition_1b_5b2f
    dw   ChannelDefinition_1b_5b45
    dw   ChannelDefinition_1b_rest_A_2
    dw   $ffff, MusicRaftRideRapids_Channel3

MusicRaftRideRapids_Channel4::
    dw   ChannelDefinition_1b_5b68
    dw   ChannelDefinition_1b_5b5a
    dw   ChannelDefinition_1b_5b68
    dw   $ffff, MusicRaftRideRapids_Channel4

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

MusicMysteriousForest::
    db   $00
    dw   MusicSpeedData_1b_4b04
    dw   MusicMysteriousForest_Channel1
    dw   MusicMysteriousForest_Channel2
    dw   MusicMysteriousForest_Channel3
    dw   MusicMysteriousForest_Channel4

MusicMysteriousForest_Channel1::
    dw   ChannelDefinition_1b_rest_A_2
MusicLoop_1b_5b8a::
    dw   ChannelDefinition_1b_5bae
    dw   ChannelDefinition_1b_5bae
    dw   ChannelDefinition_1b_5bbe
    dw   $ffff, MusicLoop_1b_5b8a

MusicMysteriousForest_Channel2::
    dw   ChannelDefinition_1b_5bd3
MusicLoop_1b_5b96::
    dw   ChannelDefinition_1b_5bf4
    dw   $ffff, MusicLoop_1b_5b96

MusicMysteriousForest_Channel3::
    dw   ChannelDefinition_1b_rest_A_2
MusicLoop_1b_5b9e::
    dw   ChannelDefinition_1b_6f6b
    dw   ChannelDefinition_1b_5c26
    dw   ChannelDefinition_1b_5c44
    dw   $ffff, MusicLoop_1b_5b9e

MusicMysteriousForest_Channel4::
    dw   ChannelDefinition_1b_5c61
    dw   $ffff, MusicMysteriousForest_Channel4

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

MusicInsideBuilding::
    db   $04
    dw   MusicSpeedData_1b_4ae6
    dw   MusicInsideBuilding_Channel1
    dw   MusicInsideBuilding_Channel2
    dw   MusicInsideBuilding_Channel3_rest_1C0
    dw   $0000

MusicInsideBuilding_Channel1::
    dw   ChannelDefinition_1b_702d
    dw   ChannelDefinition_1b_rest_6
MusicLoop_1b_5c80::
    dw   ChannelDefinition_1b_5c8e
    dw   $ffff, MusicLoop_1b_5c80

MusicInsideBuilding_Channel2::
    dw   ChannelDefinition_1b_7032
    dw   ChannelDefinition_1b_5c8e
    dw   $ffff, MusicInsideBuilding_Channel2

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

MusicAnimalVillage::
    db   $00
    dw   MusicSpeedData_1b_4b04
    dw   MusicAnimalVillage_Channel1
    dw   MusicAnimalVillage_Channel2
    dw   MusicAnimalVillage_Channel3
    dw   MusicAnimalVillage_Channel4

MusicAnimalVillage_Channel1::
    dw   ChannelDefinition_1b_rest_5_1
MusicLoop_1b_5d16::
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_5d3e
    dw   ChannelDefinition_1b_702a
    dw   ChannelDefinition_1b_5d3e
    dw   $ffff, MusicLoop_1b_5d16

MusicAnimalVillage_Channel2::
    dw   ChannelDefinition_1b_rest_5_1
MusicLoop_1b_5d24::
    dw   ChannelDefinition_1b_5d60
    dw   ChannelDefinition_1b_5d60
    dw   $ffff, MusicLoop_1b_5d24

MusicAnimalVillage_Channel3::
    dw   ChannelDefinition_1b_rest_5_1
MusicLoop_1b_5d2e::
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_5d7b
    dw   ChannelDefinition_1b_5d7b
    dw   $ffff, MusicLoop_1b_5d2e

MusicAnimalVillage_Channel4::
    dw   ChannelDefinition_1b_5da5
    dw   $ffff, MusicAnimalVillage_Channel4

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

MusicFairyFountain::
    db   $00
    dw   MusicSpeedData_1b_4ac8
    dw   MusicFairyFountain_Channel1
    dw   MusicFairyFountain_Channel2
    dw   MusicFairyFountain_Channel3
    dw   $0000

MusicFairyFountain_Channel1::
    dw   ChannelDefinition_1b_5df1
    dw   ChannelDefinition_1b_rest_1
MusicLoop_1b_5dc7::
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_5df6
    dw   ChannelDefinition_1b_7021
    dw   ChannelDefinition_1b_5df6
    dw   $ffff, MusicLoop_1b_5dc7

MusicFairyFountain_Channel2::
    dw   ChannelDefinition_1b_7037
    dw   ChannelDefinition_1b_7024
    dw   ChannelDefinition_1b_5df6
    dw   ChannelDefinition_1b_7021
    dw   ChannelDefinition_1b_5df6
    dw   $ffff, MusicFairyFountain_Channel2

MusicFairyFountain_Channel3::
    dw   ChannelDefinition_1b_rest_6
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

MusicTitleScreenNoIntro::
    db   $00
    dw   MusicSpeedData_1b_4ac8
    dw   MusicTitleScreenNoIntro_Channel1
    dw   MusicTitleScreenNoIntro_Channel2
    dw   MusicTitleScreenNoIntro_Channel3
    dw   $0000

MusicTitleScreenNoIntro_Channel1::
    dw   ChannelDefinition_1b_505b
    dw   $ffff, MusicTitleScreenNoIntro_Channel1

MusicTitleScreenNoIntro_Channel2::
    dw   ChannelDefinition_1b_50d9
    dw   $ffff, MusicTitleScreenNoIntro_Channel2

MusicTitleScreenNoIntro_Channel3::
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_517e
    dw   $ffff, MusicTitleScreenNoIntro_Channel3

MusicBowwowKidnapped::
    db   $00
    dw   MusicSpeedData_1b_4ab9
    dw   MusicBowwowKidnapped_Channel1
    dw   MusicBowwowKidnapped_Channel2
    dw   MusicBowwowKidnapped_Channel3
    dw   $0000

MusicBowwowKidnapped_Channel1::
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
    dw   $ffff, MusicBowwowKidnapped_Channel1

MusicBowwowKidnapped_Channel2::
    dw   ChannelDefinition_1b_5e78
    dw   ChannelDefinition_1b_5e91
    dw   ChannelDefinition_1b_5e78
    dw   ChannelDefinition_1b_5e91
    dw   $ffff, MusicBowwowKidnapped_Channel2

MusicBowwowKidnapped_Channel3::
    dw   ChannelDefinition_1b_6f6b
    dw   ChannelDefinition_1b_5ea0
    dw   ChannelDefinition_1b_5ea0
    dw   ChannelDefinition_1b_6f75
    dw   ChannelDefinition_1b_5ea0
    dw   ChannelDefinition_1b_5ea0
    dw   $ffff, MusicBowwowKidnapped_Channel3

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

MusicObtainSword::
    db   $00
    dw   MusicSpeedData_1b_4ab9
    dw   MusicObtainSword_Channel1
    dw   MusicObtainSword_Channel2
    dw   MusicObtainSword_Channel3
    dw   $0000

MusicObtainSword_Channel1::
    dw   ChannelDefinition_1b_5ecc
    dw   ChannelDefinition_1b_5ed1
    dw   ChannelDefinition_1b_5edb
    dw   $0000

MusicObtainSword_Channel2::
    dw   ChannelDefinition_1b_5ed6
    dw   ChannelDefinition_1b_5edb
    dw   ChannelDefinition_1b_5ed1
    dw   $0000

MusicObtainSword_Channel3::
    dw   ChannelDefinition_1b_6f55
    dw   ChannelDefinition_1b_rest_2
    dw   ChannelDefinition_1b_5edb
    dw   ChannelDefinition_1b_rest_6
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

MusicOverworldIntro::
    db   $00
    dw   MusicSpeedData_1b_4ac8
    dw   MusicOverworldIntro_Channel1
    dw   MusicOverworldIntro_Channel2
    dw   MusicOverworldIntro_Channel3
    dw   $0000

MusicOverworldIntro_Channel1::
    dw   ChannelDefinition_1b_5f29
    dw   $ffff, MusicLoop_1b_5412

MusicOverworldIntro_Channel2::
    dw   ChannelDefinition_1b_5f5c
    dw   $ffff, MusicLoop_1b_5420

MusicOverworldIntro_Channel3::
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

MusicMrWriteHouse::
    db   $00
    dw   MusicSpeedData_1b_4ae6
    dw   MusicMrWriteHouse_Channel1
    dw   MusicMrWriteHouse_Channel2
    dw   MusicMrWriteHouse_Channel3_rest_1C0
    dw   $0000

MusicMrWriteHouse_Channel1::
    dw   ChannelDefinition_1b_6fb6
    dw   ChannelDefinition_1b_5fdc
    dw   $ffff, MusicMrWriteHouse_Channel1

MusicMrWriteHouse_Channel2::
    dw   ChannelDefinition_1b_6fbb
    dw   ChannelDefinition_1b_5ffe
    dw   $ffff, MusicMrWriteHouse_Channel2

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

MusicUlrira::
    db   $00
    dw   MusicSpeedData_1b_4ab9
    dw   MusicUlrira_Channel1
    dw   MusicUlrira_Channel2
    dw   MusicUlrira_Channel3_rest_1C0
    dw   $0000

MusicUlrira_Channel1::
    dw   ChannelDefinition_1b_6059
    dw   ChannelDefinition_1b_6065
    dw   ChannelDefinition_1b_rest_275
    dw   ChannelDefinition_1b_rest_275
    dw   ChannelDefinition_1b_6059
    dw   ChannelDefinition_1b_606a
    dw   ChannelDefinition_1b_rest_275
    dw   ChannelDefinition_1b_rest_275
    dw   ChannelDefinition_1b_rest_275
    dw   $ffff, MusicUlrira_Channel1

MusicUlrira_Channel2::
    dw   ChannelDefinition_1b_607e
    dw   ChannelDefinition_1b_608a
    dw   ChannelDefinition_1b_606f
    dw   ChannelDefinition_1b_606f
    dw   ChannelDefinition_1b_607e
    dw   ChannelDefinition_1b_6090
    dw   ChannelDefinition_1b_606f
    dw   ChannelDefinition_1b_606f
    dw   ChannelDefinition_1b_606f
    dw   $ffff, MusicUlrira_Channel2

ChannelDefinition_1b_rest_275::
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

MusicTarinBees::
    db   $00
    dw   MusicSpeedData_1b_4ad7
    dw   MusicTarinBees_Channel1_rest_1C0
    dw   MusicTarinBees_Channel2
    dw   MusicTarinBees_Channel3
    dw   $0000

MusicTarinBees_Channel2::
    dw   ChannelDefinition_1b_60c1
    dw   ChannelDefinition_1b_60d9
    dw   ChannelDefinition_1b_60d9
    dw   ChannelDefinition_1b_60fa
    dw   ChannelDefinition_1b_7032
    dw   ChannelDefinition_1b_610f
    dw   ChannelDefinition_1b_rest_1
    dw   $0000

MusicTarinBees_Channel3::
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

MusicMamuFrogSong::
    db   $00
    dw   MusicSpeedData_1b_4ad7
    dw   MusicMamuFrogSong_Channel1
    dw   MusicMamuFrogSong_Channel2
    dw   MusicMamuFrogSong_Channel3
    dw   $0000

MusicMamuFrogSong_Channel1::
    dw   ChannelDefinition_1b_6fc0
    dw   ChannelDefinition_1b_618c
    dw   ChannelDefinition_1b_6fc5
    dw   ChannelDefinition_1b_619a
    dw   ChannelDefinition_1b_619a
    dw   $0000

MusicMamuFrogSong_Channel2::
    dw   ChannelDefinition_1b_6fc0
    dw   ChannelDefinition_1b_61c8
    dw   ChannelDefinition_1b_6fc5
    dw   ChannelDefinition_1b_61d6
    dw   ChannelDefinition_1b_61d6
    dw   $0000

MusicMamuFrogSong_Channel3::
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

MusicMonkeysBuildingBridge::
    db   $00
    dw   MusicSpeedData_1b_4ad7
    dw   MusicMonkeysBuildingBridge_Channel1_rest_1C0
    dw   MusicMonkeysBuildingBridge_Channel2
    dw   MusicMonkeysBuildingBridge_Channel3
    dw   $0000

MusicMonkeysBuildingBridge_Channel2::
    dw   ChannelDefinition_1b_626c
    dw   ChannelDefinition_1b_6271
    dw   ChannelDefinition_1b_6fa2
    dw   ChannelDefinition_1b_6271
    dw   ChannelDefinition_1b_6282
    dw   ChannelDefinition_1b_6fb6
    dw   ChannelDefinition_1b_62ba
    dw   $0000

MusicMonkeysBuildingBridge_Channel3::
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

MusicTurtleRockEntranceBoss::
    db   $00
    dw   MusicSpeedData_1b_4ab9
    dw   MusicTurtleRockEntranceBoss_Channel1
    dw   MusicTurtleRockEntranceBoss_Channel2
    dw   MusicTurtleRockEntranceBoss_Channel3
    dw   MusicTurtleRockEntranceBoss_Channel4

MusicTurtleRockEntranceBoss_Channel1::
    dw   ChannelDefinition_1b_rest_14
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

MusicTurtleRockEntranceBoss_Channel2::
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

MusicTurtleRockEntranceBoss_Channel3::
    dw   ChannelDefinition_1b_6f46
    dw   ChannelDefinition_1b_63e5
    dw   ChannelDefinition_1b_rest_A_2
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_63f4

MusicLoop_1b_635a::
    dw   ChannelDefinition_1b_6f41
    dw   ChannelDefinition_1b_6404
    dw   ChannelDefinition_1b_6404
    dw   $ffff, MusicLoop_1b_635a

MusicTurtleRockEntranceBoss_Channel4::
    dw   ChannelDefinition_1b_rest_1C_2
    dw   ChannelDefinition_1b_rest_14_1

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

ChannelDefinition_1b_rest_1C_2::
    begin_loop $04
        notelen 5
        rest
    next_loop

    notelen 8
    rest
    end_def

ChannelDefinition_1b_rest_14_1::
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

MusicFishermanUnderBridge::
    db   $00
    dw   MusicSpeedData_1b_4af5
    dw   MusicFishermanUnderBridge_Channel1_rest_1C0
    dw   MusicFishermanUnderBridge_Channel2
    dw   MusicFishermanUnderBridge_Channel3
    dw   MusicFishermanUnderBridge_Channel4

MusicFishermanUnderBridge_Channel2::
    dw   ChannelDefinition_1b_6fb6
    dw   ChannelDefinition_1b_6461
    dw   ChannelDefinition_1b_6480
    dw   $ffff, MusicFishermanUnderBridge_Channel2

MusicFishermanUnderBridge_Channel3::
    dw   ChannelDefinition_1b_6f6b
    dw   ChannelDefinition_1b_64b5
    dw   $ffff, MusicFishermanUnderBridge_Channel3

MusicFishermanUnderBridge_Channel4::
    dw   ChannelDefinition_1b_64d0
    dw   $ffff, MusicFishermanUnderBridge_Channel4

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

MusicObtainItemUnused::
    db   $00
    dw   MusicSpeedData_1b_4ab9
    dw   MusicObtainItemUnused_Channel1
    dw   MusicObtainItemUnused_Channel2
    dw   MusicObtainItemUnused_Channel3
    dw   $0000

MusicObtainItemUnused_Channel1::
    dw   ChannelDefinition_1b_6fcf
    dw   ChannelDefinition_1b_64fc
    dw   $0000

MusicObtainItemUnused_Channel2::
    dw   ChannelDefinition_1b_6fcf
    dw   ChannelDefinition_1b_6503
    dw   $0000

MusicObtainItemUnused_Channel3::
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

MusicEnding::
    db   $00
    dw   MusicSpeedData_1b_4ae6
    dw   MusicEnding_Channel1
    dw   MusicEnding_Channel2
    dw   MusicEnding_Channel3
    dw   MusicEnding_Channel4

MusicEnding_Channel1::
    dw   ChannelDefinition_1b_rest_31_1
    dw   ChannelDefinition_1b_rest_3b
    dw   ChannelDefinition_1b_6656
    dw   ChannelDefinition_1b_665b
    dw   ChannelDefinition_1b_666d
    dw   ChannelDefinition_1b_668a
    dw   ChannelDefinition_1b_66ba
    dw   ChannelDefinition_1b_709f
    dw   ChannelDefinition_1b_66d8
    dw   ChannelDefinition_1b_6716
    dw   ChannelDefinition_1b_671b
    dw   ChannelDefinition_1b_rest_4
    dw   ChannelDefinition_1b_709b
    dw   ChannelDefinition_1b_rest_A_2
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

MusicEnding_Channel2::
    dw   ChannelDefinition_1b_rest_31_1
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
    dw   ChannelDefinition_1b_rest_1
    dw   ChannelDefinition_1b_671b
    dw   ChannelDefinition_1b_rest_6
    dw   ChannelDefinition_1b_709b
    dw   ChannelDefinition_1b_rest_A_2
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

MusicEnding_Channel3::
    dw   ChannelDefinition_1b_rest_31_1
    dw   ChannelDefinition_1b_rest_6
    dw   ChannelDefinition_1b_6a3c
    dw   ChannelDefinition_1b_688f
    dw   ChannelDefinition_1b_6a41
    dw   ChannelDefinition_1b_68a5
    dw   ChannelDefinition_1b_rest_18
    dw   ChannelDefinition_1b_6f55
    dw   ChannelDefinition_1b_665b
    dw   ChannelDefinition_1b_666d
    dw   ChannelDefinition_1b_rest_5_1
    dw   ChannelDefinition_1b_rest_A
    dw   ChannelDefinition_1b_6a55
    dw   ChannelDefinition_1b_709f
    dw   ChannelDefinition_1b_6a7c
    dw   ChannelDefinition_1b_6f55
    dw   ChannelDefinition_1b_rest_2
    dw   ChannelDefinition_1b_671b
    dw   ChannelDefinition_1b_rest_7
    dw   ChannelDefinition_1b_709b
    dw   ChannelDefinition_1b_rest_A_2
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

MusicEnding_Channel4::
    dw   ChannelDefinition_1b_rest_31_2
    dw   ChannelDefinition_1b_rest_67
    dw   ChannelDefinition_1b_709f
    dw   ChannelDefinition_1b_rest_21
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

ChannelDefinition_1b_rest_18::
    begin_loop $03
        notelen 5
        rest
    next_loop

    notelen 3
    rest
    notelen 6
    rest
    end_def

ChannelDefinition_1b_rest_A::
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

ChannelDefinition_1b_rest_67::
    begin_loop $14
        notelen 5
        rest
    next_loop

    notelen 3
    rest
    end_def

ChannelDefinition_1b_rest_21::
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

MusicMoblinHideout::
    db   $00
    dw   MusicSpeedData_1b_4ab9
    dw   MusicMoblinHideout_Channel1
    dw   MusicMoblinHideout_Channel2
    dw   MusicMoblinHideout_Channel3
    dw   $0000

MusicMoblinHideout_Channel1::
    dw   ChannelDefinition_1b_6c50
    dw   ChannelDefinition_1b_6c55
    dw   ChannelDefinition_1b_6c55
    dw   ChannelDefinition_1b_6fc0
    dw   ChannelDefinition_1b_6c55
    dw   ChannelDefinition_1b_6ff7
    dw   ChannelDefinition_1b_6c55
    dw   $ffff, MusicBowwowKidnapped_Channel1

MusicMoblinHideout_Channel2::
    dw   ChannelDefinition_1b_6c50
    dw   ChannelDefinition_1b_6c5f
    dw   ChannelDefinition_1b_6c5f
    dw   ChannelDefinition_1b_6fc0
    dw   ChannelDefinition_1b_6c5f
    dw   ChannelDefinition_1b_6ff7
    dw   ChannelDefinition_1b_6c5f
    dw   $ffff, MusicBowwowKidnapped_Channel2

MusicMoblinHideout_Channel3::
    dw   ChannelDefinition_1b_rest_A_2
    dw   $ffff, MusicBowwowKidnapped_Channel3

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

MusicIslandDisappear::
    db   $00
    dw   MusicSpeedData_1b_4ad7
    dw   MusicIslandDisappear_Channel1
    dw   MusicIslandDisappear_Channel2
    dw   MusicIslandDisappear_Channel3
    dw   MusicIslandDisappear_Channel4

MusicIslandDisappear_Channel1::
    dw   ChannelDefinition_1b_rest_A_2
    dw   ChannelDefinition_1b_6cf6
    dw   ChannelDefinition_1b_6e00
    dw   ChannelDefinition_1b_rest_3
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

MusicIslandDisappear_Channel2::
    dw   ChannelDefinition_1b_rest_A_2
    dw   ChannelDefinition_1b_6d81
    dw   ChannelDefinition_1b_6e00
    dw   ChannelDefinition_1b_rest_3
    dw   ChannelDefinition_1b_6ffc
    dw   ChannelDefinition_1b_6d88
    dw   ChannelDefinition_1b_7010
    dw   ChannelDefinition_1b_6da7
    dw   ChannelDefinition_1b_rest_2
    dw   ChannelDefinition_1b_6dfb
    dw   ChannelDefinition_1b_6dc7
    dw   ChannelDefinition_1b_6dd4
    dw   ChannelDefinition_1b_6de0
    dw   ChannelDefinition_1b_rest_2
    dw   ChannelDefinition_1b_6df3
    dw   ChannelDefinition_1b_6df8
    dw   $ffff, MusicLoop_1b_708f

MusicIslandDisappear_Channel3::
    dw   ChannelDefinition_1b_rest_A_2
    dw   ChannelDefinition_1b_7015
    dw   ChannelDefinition_1b_6e00
    dw   ChannelDefinition_1b_rest_2
    dw   ChannelDefinition_1b_rest_3
    dw   ChannelDefinition_1b_701b
    dw   ChannelDefinition_1b_6e12
    dw   ChannelDefinition_1b_6e34
    dw   ChannelDefinition_1b_6f55
    dw   ChannelDefinition_1b_6dc7
    dw   ChannelDefinition_1b_6dd4
    dw   ChannelDefinition_1b_6de0
    dw   ChannelDefinition_1b_rest_3
    dw   ChannelDefinition_1b_6df8
    dw   $ffff, MusicLoop_1b_708f

MusicIslandDisappear_Channel4::
    dw   ChannelDefinition_1b_rest_37
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
    dw   ChannelDefinition_1b_rest_1b
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

ChannelDefinition_1b_rest_37::
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

ChannelDefinition_1b_rest_1b::
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

ChannelDefinition_1b_rest_3b::
    begin_loop $0b
        notelen 5
        rest
    next_loop

    notelen 4
    rest
    end_def
; UNREFERENCED DATA
    db   $9b, $11, $a5, $01, $9c, $00

ChannelDefinition_1b_rest_31_1::
    begin_loop $09
        notelen 5
        rest
    next_loop

    notelen 4
    rest
    end_def

ChannelDefinition_1b_rest_31_2::
    begin_loop $09
        notelen 5
        rest
    next_loop

    notelen 4
    rest
    end_def
; UNREFERENCED DATA
    db   $a5, $01, $01, $00

ChannelDefinition_1b_rest_5_1::
    notelen 5
    rest
    end_def

ChannelDefinition_1b_rest_A_2::
    notelen 5
    rest
    rest
    end_def
; UNREFERENCED DATA
    db   $9b, $03, $a5, $01, $9c, $00

ChannelDefinition_1b_rest_14::
    begin_loop $04
        notelen 5
        rest
    next_loop

    end_def

ChannelDefinition_1b_rest_32::
    begin_loop $10
        notelen 5
        rest
    next_loop

    end_def
; UNREFERENCED DATA
    db   $a8, $01, $00

ChannelDefinition_1b_rest_6::
    notelen 6
    rest
    end_def

ChannelDefinition_1b_rest_7::
    notelen 7
    rest
    end_def

ChannelDefinition_1b_rest_1::
    notelen 1
    rest
    end_def

ChannelDefinition_1b_rest_2::
    notelen 2
    rest
    end_def

ChannelDefinition_1b_rest_4::
    notelen 4
    rest
    end_def

ChannelDefinition_1b_rest_3::
    notelen 3
    rest
    end_def

ChannelDefinition_1b_rest_5_2::
    notelen 5
    rest
    end_def

MusicLoop_1b_708f::
    dw   ChannelDefinition_1b_rest_5_1
    dw   $ffff, MusicLoop_1b_708f

MusicLoop_1b_7095::
    dw   ChannelDefinition_1b_rest_5_2
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
