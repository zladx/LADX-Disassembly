MusicSpeedData_1e_4a9d::
    db   $01, $03, $06, $0c, $18, $30, $09, $12, $24, $02, $04, $08, $01, $01, $48

MusicSpeedData_1e_4aac::
    db   $02, $04, $08, $10, $20, $40, $0c, $18, $30, $02, $05, $03, $01, $01, $60

MusicSpeedData_1e_4abb::
    db   $03, $05, $0a, $14, $28, $50, $0f, $1e, $3c, $02, $08, $10, $02, $01, $78

MusicSpeedData_1e_4aca::
    db   $03, $06, $0c, $18, $30, $60, $12, $24, $48, $03, $08, $10, $02, $04, $90

MusicSpeedData_1e_4ad9::
    db   $03, $07, $0e, $1c, $38, $70, $15, $2a, $54, $04, $09, $12, $02, $01, $a8

MusicSpeedData_1e_4ae8::
    db   $04, $08, $10, $20, $40, $80, $18, $30, $60, $04, $02, $01, $01, $00, $c0

MusicSpeedData_1e_4af7::
    db   $04, $09, $12, $24, $48, $90, $1b, $36, $6c, $05, $0c, $18, $18, $06, $d8

MusicSpeedData_1e_4b06::
    db   $05, $0a, $14, $28, $50, $a0, $1e, $3c, $78, $05, $01, $01, $01, $01, $f0

HardcodedData_1e_4b15::
    db   $10, $32, $22, $47, $60, $20, $00

Music14Channel1::
Music17Channel3::
Music1cChannel3::
Music1eChannel3::
Music1fChannel3::
Music1fChannel4::
Music20Channel1::
Music21Channel1::
Music21Channel3::
Music22Channel3::
Music24Channel3::
Music26Channel3::
Music28Channel1::
Music29Channel1::
Music2aChannel1::
Music2cChannel1::
Music2dChannel1::
Music2eChannel1::
Music2eChannel3::
Music41Channel2::
Music56Channel3::
Music58Channel3::
Music59Channel3::
Music5cChannel3::
Music5dChannel1::
Music5dChannel3::
Music5eChannel3::
    dw   ChannelDefinition_1e_4b22
    dw   $ffff, Music14Channel1

ChannelDefinition_1e_4b22::
    begin_loop $20
        notelen 14
        rest
    next_loop

    end_def

Music49::
    db   $00
    dw   MusicSpeedData_1e_4aca
    dw   Music49Channel1
    dw   Music49Channel2
    dw   Music49Channel3
    dw   Music49Channel4

Music27::
    db   $00
    dw   MusicSpeedData_1e_4aca
    dw   Music27Channel1
    dw   Music27Channel2
    dw   Music27Channel3
    dw   Music27Channel4

Music27Channel1::
    dw   ChannelDefinition_1e_4b5e

MusicLoop_1e_4b40::
Music49Channel1::
    dw   ChannelDefinition_1e_4b65
    dw   $ffff, MusicLoop_1e_4b40

Music27Channel2::
    dw   ChannelDefinition_1e_4b87

MusicLoop_1e_4b48::
Music49Channel2::
    dw   ChannelDefinition_1e_4b97
    dw   $ffff, MusicLoop_1e_4b48

Music27Channel3::
    dw   ChannelDefinition_1e_4c19

MusicLoop_1e_4b50::
Music49Channel3::
    dw   ChannelDefinition_1e_4c1e
    dw   $ffff, MusicLoop_1e_4b50

Music27Channel4::
    dw   ChannelDefinition_1e_4c2a

MusicLoop_1e_4b58::
Music49Channel4::
    dw   ChannelDefinition_1e_4c2f
    dw   $ffff, MusicLoop_1e_4b58

ChannelDefinition_1e_4b5e::
    notelen 5
    rest
    notelen 8
    rest
    notelen 10
    rest
    end_def

ChannelDefinition_1e_4b65::
    set_envelope_duty $10, $00, 2, 0

    begin_loop $04
        notelen 1
        note C#6
        note A#5
        note F#5
        note C#5
    next_loop

    begin_loop $04
        note D_6
        note B_5
        note G_5
        note D_5
    next_loop

    begin_loop $04
        note C#6
        note A#5
        note F#5
        note C#5
    next_loop

    begin_loop $04
        note B_5
        note G#5
        note E_5
        note B_4
    next_loop

    end_def

ChannelDefinition_1e_4b87::
    set_envelope_duty $60, $81, 1, 1
    notelen 10
    rest
    note F#4
    note B_4
    note E_5
    note B_4
    note D_5
    notelen 5
    note C#5
    notelen 3
    rest
    end_def

ChannelDefinition_1e_4b97::
    set_envelope_duty $34, $00, 0, 0

    begin_loop $03
        notelen 1
        note C#6
        note A#5
        note F#5
        note C#5
    next_loop

    set_envelope_duty $43, $00, 0, 0
    note C#6
    note A#5
    note F#5
    note C#5
    set_envelope_duty $62, $00, 0, 0
    note D_6
    note B_5
    note G_5
    note D_5
    set_envelope_duty $43, $00, 0, 0
    note D_6
    note B_5
    note G_5
    note D_5
    set_envelope_duty $34, $00, 0, 0

    begin_loop $02
        note D_6
        note B_5
        note G_5
        note D_5
    next_loop

    begin_loop $02
        note C#6
        note A#5
        note F#5
        note C#5
    next_loop

    set_envelope_duty $43, $00, 0, 0
    note C#6
    note A#5
    note F#5
    note C#5
    set_envelope_duty $62, $00, 0, 0
    note C#6
    note A#5
    note F#5
    note C#5
    set_envelope_duty $82, $00, 0, 0
    note B_5
    note G#5
    note E_5
    note B_4
    set_envelope_duty $62, $00, 0, 0
    note B_5
    note G#5
    note E_5
    note B_4
    set_envelope_duty $43, $00, 0, 0

    begin_loop $02
        note B_5
        note G#5
        note E_5
        note B_4
    next_loop

    end_def

waveform_1e_4bf9::
    db   $66, $66, $66, $66, $00, $00, $00, $00, $66, $66, $66, $66, $00, $00, $00, $00

waveform_1e_4c09::
    db   $00, $22, $44, $55, $66, $66, $88, $88, $aa, $aa, $cc, $cc, $04, $84, $04, $84

ChannelDefinition_1e_4c19::
    notelen 5
    rest
    notelen 8
    rest
    end_def

ChannelDefinition_1e_4c1e::
    set_waveform waveform_1e_4bf9, $20
    enable_software_envelope

    begin_loop $20
        notelen 2
        note C#1
        note C#2
    next_loop

    end_def

ChannelDefinition_1e_4c2a::
    notelen 5
    rest
    notelen 8
    rest
    end_def

ChannelDefinition_1e_4c2f::
    begin_loop $20
        notelen 2
        note NOISE_6
        notelen 1
        note NOISE_6
        note NOISE_6
    next_loop

    end_def

Music50::
    db   $02
    dw   MusicSpeedData_1e_4abb
    dw   Music50Channel1
    dw   Music50Channel2
    dw   Music50Channel3
    dw   Music50Channel4

Music50Channel1::
    dw   ChannelDefinition_1e_4c71

MusicLoop_1e_4c45::
    dw   ChannelDefinition_1e_4c87
    dw   ChannelDefinition_1e_4c99
    dw   ChannelDefinition_1e_4cab
    dw   ChannelDefinition_1e_4c99
    dw   $ffff, MusicLoop_1e_4c45

Music50Channel2::
    dw   ChannelDefinition_1e_4c78
    dw   ChannelDefinition_1e_4c87
    dw   ChannelDefinition_1e_4c7d
    dw   ChannelDefinition_1e_4c99
    dw   ChannelDefinition_1e_4c82
    dw   ChannelDefinition_1e_4cab
    dw   ChannelDefinition_1e_4c7d
    dw   ChannelDefinition_1e_4c99
    dw   $ffff, Music50Channel2

Music50Channel3::
    dw   ChannelDefinition_1e_4cbd
    dw   $ffff, Music50Channel3

Music50Channel4::
    dw   ChannelDefinition_1e_4cf0
    dw   $ffff, Music50Channel4

ChannelDefinition_1e_4c71::
    set_envelope_duty $43, $00, 0, 3
    notelen 0
    rest
    end_def

ChannelDefinition_1e_4c78::
    set_envelope_duty $43, $00, 0, 0
    end_def

ChannelDefinition_1e_4c7d::
    set_envelope_duty $71, $00, 0, 0
    end_def

ChannelDefinition_1e_4c82::
    set_envelope_duty $91, $00, 0, 0
    end_def

ChannelDefinition_1e_4c87::
    begin_loop $02
        notelen 1
        note B_3
        note C#4
        note D_4
        notelen 6
        note A_4
        notelen 1
        note B_3
        note C#4
        note D_4
        notelen 6
        note G#4
        notelen 3
        rest
    next_loop

    end_def

ChannelDefinition_1e_4c99::
    begin_loop $02
        notelen 1
        note C#4
        note D#4
        note E_4
        notelen 6
        note B_4
        notelen 1
        note C#4
        note D#4
        note E_4
        notelen 6
        note A#4
        notelen 3
        rest
    next_loop

    end_def

ChannelDefinition_1e_4cab::
    begin_loop $02
        notelen 1
        note D#4
        note F_4
        note F#4
        notelen 6
        note C#5
        notelen 1
        note D#4
        note F_4
        note F#4
        notelen 6
        note C_5
        notelen 3
        rest
    next_loop

    end_def

ChannelDefinition_1e_4cbd::
    set_waveform waveform_1e_4c09, $20
    enable_software_envelope

    begin_loop $02
        notelen 2
        note B_2
        note B_1
        note B_1
        note B_2
        note B_1
        note B_1
        note B_2
        note B_1
    next_loop

    begin_loop $02
        note C#3
        note C#2
        note C#2
        note C#3
        note C#2
        note C#2
        note C#3
        note C#2
    next_loop

    begin_loop $02
        note D#3
        note D#2
        note D#2
        note D#3
        note D#2
        note D#2
        note D#3
        note D#2
    next_loop

    begin_loop $02
        note C#3
        note C#2
        note C#2
        note C#3
        note C#2
        note C#2
        note C#3
        note C#2
    next_loop

    end_def

ChannelDefinition_1e_4cf0::
    begin_loop $02
        notelen 1
        note NOISE_6
        note NOISE_6
        note NOISE_6
        notelen 6
        note NOISE_6
    next_loop

    notelen 1
    note NOISE_6
    note NOISE_5
    note NOISE_5
    note NOISE_5
    end_def
