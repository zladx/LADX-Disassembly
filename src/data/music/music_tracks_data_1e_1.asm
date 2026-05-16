; The `notelen` macro indexes into NoteLengthTable_* tables, which give a note
; length in frames.

; Not used
NoteLengthTable_1e_2::
    db   NOTELENS_2

; Boss, FinalBoss, EagleBossTransition, InstrumentSurfHarp
NoteLengthTable_1e_3::
    db   NOTELENS_3

; FinalBoss, ObtainInstrument, OverworldSwordless, DreamShrineDream,
; FinalBossDefeat
NoteLengthTable_1e_4::
    db   NOTELENS_4

; Miniboss, EagleBossLoop, EagleBossTransition, TailCave, BottleGrotto,
; AnglersTunnel, DreamShrineSleep, SouthernShrine, Owl, InstrumentWindMarimba,
; Henhouse
NoteLengthTable_1e_5::
    db   NOTELENS_5

; TurtleRock, IntroWakeUp, DreamShrineBed, DreamShrineDream, Cave,
; MarinUnused, TitleCutscene, DreamShrineSleep, InstrumentCoralTriangle,
; RoosterRevival, WindFish, BossDefeat
NoteLengthTable_1e_6::
    db   NOTELENS_6

; FileSelect, KeyCavern, AfterBoss, CatfishsMaw, EaglesTower,
; OpenAnglersTunnel, MarinBeachTalk, TitleCutscene, FinalBoss,
; EggBalladDefault, EggBalladBell, EggBalladHarp, EggBalladMarimba,
; EggBalladTriangle, EggBalladOrgan, EggBalladAll, InstrumentSeaLilysBell,
; InstrumentThunderDrum, MarinSing, LearnBallad, GhostHouse, FileSelectZelda,
; HeartContainer
NoteLengthTable_1e_7::
    db   NOTELENS_7

; TitleCutscene, FinalBossIntro, KanaletCastle, FaceShrine, 2dUnderground,
; MarinOnBeach, MarinBeachTalk, InstrumentFullMoonCello,
; InstrumentOrganOfEveningCalm, HeartContainer
NoteLengthTable_1e_8::
    db   NOTELENS_8

; EggMaze, InstrumentConchHorn, L2Sword
NoteLengthTable_1e_9::
    db   NOTELENS_9

; ManbosMambo
NoteLengthTable_1e_10::
    db   NOTELENS_10

HardcodedData_1e_4b15::
    db   $10, $32, $22, $47, $60, $20, $00

MusicTailCave_Channel1_rest_1C0::
MusicAnglersTunnel_Channel3_rest_1C0::
MusicIntroWakeUp_Channel3_rest_1C0::
MusicDreamShrineSleep_Channel3_rest_1C0::
MusicSouthernShrine_Channel3_rest_1C0::
MusicSouthernShrine_Channel4_rest_1C0::
MusicInstrumentFullMoonCello_Channel1_rest_1C0::
Music2dUnderground_Channel1_rest_1C0::
Music2dUnderground_Channel3_rest_1C0::
MusicOwl_Channel3_rest_1C0::
MusicDreamShrineBed_Channel3_rest_1C0::
MusicCave_Channel3_rest_1C0::
MusicInstrumentConchHorn_Channel1_rest_1C0::
MusicInstrumentSeaLilysBell_Channel1_rest_1C0::
MusicInstrumentSurfHarp_Channel1_rest_1C0::
MusicInstrumentCoralTriangle_Channel1_rest_1C0::
MusicInstrumentOrganOfEveningCalm_Channel1_rest_1C0::
MusicInstrumentThunderDrum_Channel1_rest_1C0::
MusicInstrumentThunderDrum_Channel3_rest_1C0::
MusicEggBalladDefault_Channel2_rest_1C0::
MusicL2Sword_Channel3_rest_1C0::
MusicFaceShrine_Channel3_rest_1C0::
MusicWindFish_Channel3_rest_1C0::
MusicEagleBossLoop_Channel3_rest_1C0::
MusicFinalBossIntro_Channel1_rest_1C0::
MusicFinalBossIntro_Channel3_rest_1C0::
MusicBossDefeat_Channel3_rest_1C0::
    dw   ChannelDefinition_1e_rest_1C0_1
    dw   $ffff, MusicTailCave_Channel1_rest_1C0

ChannelDefinition_1e_rest_1C0_1::
    begin_loop $20
        notelen 14
        rest
    next_loop

    end_def

MusicActivePowerUp::
    db   $00
    dw   NoteLengthTable_1e_6
    dw   MusicActivePowerUp_Channel1
    dw   MusicActivePowerUp_Channel2
    dw   MusicActivePowerUp_Channel3
    dw   MusicActivePowerUp_Channel4

MusicObtainPowerup::
    db   $00
    dw   NoteLengthTable_1e_6
    dw   MusicObtainPowerup_Channel1
    dw   MusicObtainPowerup_Channel2
    dw   MusicObtainPowerup_Channel3
    dw   MusicObtainPowerup_Channel4

MusicObtainPowerup_Channel1::
    dw   ChannelDefinition_1e_4b5e

MusicLoop_1e_4b40::
MusicActivePowerUp_Channel1::
    dw   ChannelDefinition_1e_4b65
    dw   $ffff, MusicLoop_1e_4b40

MusicObtainPowerup_Channel2::
    dw   ChannelDefinition_1e_4b87

MusicLoop_1e_4b48::
MusicActivePowerUp_Channel2::
    dw   ChannelDefinition_1e_4b97
    dw   $ffff, MusicLoop_1e_4b48

MusicObtainPowerup_Channel3::
    dw   ChannelDefinition_1e_4c19

MusicLoop_1e_4b50::
MusicActivePowerUp_Channel3::
    dw   ChannelDefinition_1e_4c1e
    dw   $ffff, MusicLoop_1e_4b50

MusicObtainPowerup_Channel4::
    dw   ChannelDefinition_1e_4c2a

MusicLoop_1e_4b58::
MusicActivePowerUp_Channel4::
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

MusicMiniboss::
    db   $02
    dw   NoteLengthTable_1e_5
    dw   MusicMiniboss_Channel1
    dw   MusicMiniboss_Channel2
    dw   MusicMiniboss_Channel3
    dw   MusicMiniboss_Channel4

MusicMiniboss_Channel1::
    dw   ChannelDefinition_1e_4c71
MusicLoop_1e_4c45::
    dw   ChannelDefinition_1e_4c87
    dw   ChannelDefinition_1e_4c99
    dw   ChannelDefinition_1e_4cab
    dw   ChannelDefinition_1e_4c99
    dw   $ffff, MusicLoop_1e_4c45

MusicMiniboss_Channel2::
    dw   ChannelDefinition_1e_4c78
    dw   ChannelDefinition_1e_4c87
    dw   ChannelDefinition_1e_4c7d
    dw   ChannelDefinition_1e_4c99
    dw   ChannelDefinition_1e_4c82
    dw   ChannelDefinition_1e_4cab
    dw   ChannelDefinition_1e_4c7d
    dw   ChannelDefinition_1e_4c99
    dw   $ffff, MusicMiniboss_Channel2

MusicMiniboss_Channel3::
    dw   ChannelDefinition_1e_4cbd
    dw   $ffff, MusicMiniboss_Channel3

MusicMiniboss_Channel4::
    dw   ChannelDefinition_1e_4cf0
    dw   $ffff, MusicMiniboss_Channel4

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
