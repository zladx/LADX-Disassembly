; Overworld music tracks, indexed by map index
OverworldMusicTracks::
    db   $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06
    db   $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
    db   $09, $09, $09, $09, $05, $05, $05, $05, $05, $05, $05, $05, $08, $08, $08, $08
    db   $09, $09, $09, $09, $05, $05, $05, $05, $05, $05, $05, $05, $08, $08, $08, $08
    db   $09, $09, $09, $09, $05, $05, $05, $05, $05, $05, $05, $05, $08, $08, $08, $08
    db   $09, $09, $09, $09, $05, $05, $05, $05, $05, $05, $05, $05, $08, $08, $08, $08
    db   $09, $04, $04, $04, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
    db   $04, $04, $04, $04, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
    db   $04, $04, $04, $04, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
    db   $04, $04, $04, $04, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $0B, $0B, $05, $05
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $0B, $0B, $05, $05
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05

; Music tracks for inside houses, indexed by map index
HouseMusicTracks::
    db   $14, $15, $16, $17, $4B, $58, $5B, $5A, $12, $61, $26, $26, $26, $26, $07, $02
    db   $0A, $26, $0A, $53, $13, $3E, $1F, $00, $00, $00, $00, $00, $00, $0A, $48, $26

; Whether a music track has precedence over the Power-Up music, indexed by track id
MusicOverridesPowerUpTrack::
    db   $00, $00, $01, $00, $01, $00, $00, $01, $00, $00, $01, $01, $01, $00, $01, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $01, $00, $01, $00             

SelectMusicTrackAfterTransition::
    ldh  a, [hFFBC]                               ; $4146: $F0 $BC
    and  a                                        ; $4148: $A7
    jr   z, .noPendingGameplayTransition          ; $4149: $28 $04

    ; Gameplay transition is pending:
    ; clear the transition flag and return.
    xor  a                                        ; $414B: $AF
    ldh  [hFFBC], a                               ; $414C: $E0 $BC
    ret                                           ; $414E: $C9

.noPendingGameplayTransition
    ; If wDidFindSword == 0, use adventure start music
    ld   d, $1D                                   ; $414F: $16 $1D
    ld   a, [wDidFindSword]                       ; $4151: $FA $4E $DB
    and  a                                        ; $4154: $A7
    jp   z, .clearEventFlagsAndLoadSoundtrack     ; $4155: $CA $A2 $41

    ; Lookup the music to use
    ; d = OverworldMusicTracks[hMapRoom]
    ldh  a, [hMapRoom]                            ; $4158: $F0 $F6
    ld   e, a                                     ; $415A: $5F
    ld   d, $00                                   ; $415B: $16 $00
    ld   hl, OverworldMusicTracks                 ; $415D: $21 $00 $40
    add  hl, de                                   ; $4160: $19
    ld   d, [hl]                                  ; $4161: $56
    ld   a, d                                     ; $4162: $7A

    ; Clear hNextMusicTrack
    xor  a                                        ; $4163: $AF
    ldh  [hNextMusicTrack], a                     ; $4164: $E0 $B1

    ; If wIsIndoor == 0, skip further code and load the soundtrack
    ld   a, [wIsIndoor]                         ; $4166: $FA $A5 $DB
    and  a                                        ; $4169: $A7
    jr   z, .clearEventFlagsAndLoadSoundtrack     ; $416A: $28 $36

    ; If a boss was just defeated, load specific music
    ld   d, $18 ; Siren Instrument Calling music  ; $416C: $16 $18
    ld   a, [wBossDefeated]                       ; $416E: $FA $6C $D4
    and  a                                        ; $4171: $A7
    jr   nz, .loadSoundtrack                      ; $4172: $20 $32

    ; Set a depending on the world map
    ldh  a, [hMapId]                              ; $4174: $F0 $F7
    cp   MAP_COLOR_DUNGEON                              ; $4176: $FE $FF
    jr   nz, .mapNotFF                            ; $4178: $20 $04

    ld   a, $09                                   ; $417A: $3E $09
    jr   .mapDone                                 ; $417C: $18 $0E

.mapNotFF
    ; If on the houses map…
    cp   MAP_HOUSE                                ; $417E: $FE $10
    jr   nz, .mapDone                             ; $4180: $20 $0A
    ; … and the map is $B5 (Photo Shop)…
    ld   d, a                                     ; $4182: $57
    ldh  a, [hMapRoom]                            ; $4183: $F0 $F6
    cp   $B5                                      ; $4185: $FE $B5
    ld   a, d                                     ; $4187: $7A
    jr   nz, .mapDone                             ; $4188: $20 $02
    ; … use same music than for map $0F (Trendy Game)
    ld   a, $0F                                   ; $418A: $3E $0F
.mapDone

    ; music id = HouseMusicTracks[a]
    ld   e, a                                     ; $418C: $5F
    ld   d, $00                                   ; $418D: $16 $00
    ld   hl, HouseMusicTracks                     ; $418F: $21 $00 $41
    add  hl, de                                   ; $4192: $19
    ld   d, [hl]                                  ; $4193: $56

    ; If hIsSideScrolling != 0 and a <= $0A…
    ldh  a, [hIsSideScrolling]                    ; $4194: $F0 $F9
    and  a                                        ; $4196: $A7
    jr   z, .loadSoundtrack                       ; $4197: $28 $0D
    ld   a, e                                     ; $4199: $7B
    cp   $0A                                      ; $419A: $FE $0A
    jr   nc, .loadSoundtrack                      ; $419C: $30 $08
    ; …force sountrack_id to $21
    ld   a, $21                                   ; $419E: $3E $21
    jr   .loadSoundtrackFromA                     ; $41A0: $18 $05

.clearEventFlagsAndLoadSoundtrack
    ; Clear wBossDefeated
    xor  a                                        ; $41A2: $AF
    ld   [wBossDefeated], a                       ; $41A3: $EA $6C $D4

.loadSoundtrack
    ld   a, d                                     ; $41A6: $7A

.loadSoundtrackFromA
    ; Set overworld soundtrack
    ld   e, a                                     ; $41A7: $5F
    ld   d, $00                                   ; $41A8: $16 $00
    ldh  [hMusicTrack], a                               ; $41AA: $E0 $B0
    call SetWorldMusicTrack                       ; $41AC: $CD $C3 $27

    ; If soundtrack id <= $24…
    ld   a, e                                     ; $41AF: $7B
    cp   $25                                      ; $41B0: $FE $25
    jr   nc, .mayUsePowerUpMusic                  ; $41B2: $30 $08
    ; … and MusicOverridesPowerUpTrack[soundtrack_id] == 1…
    ld   hl, MusicOverridesPowerUpTrack           ; $41B4: $21 $20 $41
    add  hl, de                                   ; $41B7: $19
    ld   a, [hl]                                  ; $41B8: $7E
    and  a                                        ; $41B9: $A7
    ; … the map-defined music has precedence over
    ; the power-up music.
    jr   nz, .return                              ; $41BA: $20 $13

.mayUsePowerUpMusic
    ; If Link currently has no power-up, return
    ld   a, [wActivePowerUp]                      ; $41BC: $FA $7C $D4
    and  a                                        ; $41BF: $A7
    jr   z, .return                               ; $41C0: $28 $0D

    ; Replace the current music by the power-up music
    ld   a, $49 ; Piece of Power / Accorn         ; $41C2: $3E $49
    ld   [wWorldMusicTrack], a                    ; $41C4: $EA $68 $D3
    ldh  [$FFBD], a                               ; $41C7: $E0 $BD
    ldh  [$FFBF], a                               ; $41C9: $E0 $BF
    xor  a                                        ; $41CB: $AF
    ld   [$C1CF], a                               ; $41CC: $EA $CF $C1

.return
    ret                                           ; $41CF: $C9
