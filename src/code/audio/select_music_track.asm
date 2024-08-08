; Overworld music tracks, indexed by map index
; See MUSIC_* constants for values

OverworldMusicTracks::
    db   $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06 ; LEGEND:
    db   $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06, $06
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05 ; $04 MUSIC_MABE_VILLAGE
    db   $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05, $05 ; $05 MUSIC_OVERWORLD
    db   $09, $09, $09, $09, $05, $05, $05, $05, $05, $05, $05, $05, $08, $08, $08, $08 ; $06 MUSIC_TAL_TAL_RANGE
    db   $09, $09, $09, $09, $05, $05, $05, $05, $05, $05, $05, $05, $08, $08, $08, $08 ; $08 MUSIC_RAFT_RIDE_RAPIDS
    db   $09, $09, $09, $09, $05, $05, $05, $05, $05, $05, $05, $05, $08, $08, $08, $08 ; $09 MUSIC_MYSTERIOUS_FOREST
    db   $09, $09, $09, $09, $05, $05, $05, $05, $05, $05, $05, $05, $08, $08, $08, $08 ; $0B MUSIC_ANIMAL_VILLAGE
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
    db   MUSIC_TAIL_CAVE, MUSIC_BOTTLE_GROTTO, MUSIC_KEY_CAVERN, MUSIC_ANGLERS_TUNNEL, MUSIC_CATFISHS_MAW, MUSIC_FACE_SHRINE, MUSIC_EAGLES_TOWER, MUSIC_TURTLE_ROCK, MUSIC_EGG_MAZE, MUSIC_COLOR_DUNGEON, MUSIC_CAVE, MUSIC_CAVE, MUSIC_CAVE, MUSIC_CAVE, MUSIC_SHOP, MUSIC_MINIGAME
    db   MUSIC_INSIDE_BUILDING, MUSIC_CAVE, MUSIC_INSIDE_BUILDING, MUSIC_DREAM_SHRINE_DREAM, MUSIC_KANALET_CASTLE, MUSIC_MOBLIN_HIDEOUT, MUSIC_SOUTHERN_SHRINE, MUSIC_NONE, MUSIC_NONE, MUSIC_NONE, MUSIC_NONE, MUSIC_NONE, MUSIC_NONE, MUSIC_INSIDE_BUILDING, MUSIC_GHOST_HOUSE, MUSIC_CAVE

; Whether a music track has precedence over the Power-Up music, indexed by track id
MusicOverridesPowerUpTrack::
    db   $00, $00, $01, $00, $01, $00, $00, $01, $00, $00, $01, $01, $01, $00, $01, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $01, $00, $01, $00

SelectMusicTrackAfterTransition::
    ; If the game requested the music track to continue after the transition,
    ; return immediately.
    ldh  a, [hContinueMusicAfterWarp]             ;; 02:4146 $F0 $BC
    and  a                                        ;; 02:4148 $A7
    jr   z, .startNewMusicTrack                   ;; 02:4149 $28 $04
    xor  a                                        ;; 02:414B $AF
    ldh  [hContinueMusicAfterWarp], a             ;; 02:414C $E0 $BC
    ret                                           ;; 02:414E $C9
.startNewMusicTrack

    ; If wSwordLevel == 0 (Link doesn’t have its sword yet), use adventure start music
    ld   d, MUSIC_OVERWORLD_SWORDLESS             ;; 02:414F $16 $1D
    ld   a, [wSwordLevel]                         ;; 02:4151 $FA $4E $DB
    and  a                                        ;; 02:4154 $A7
    jp   z, .clearEventFlagsAndLoadSoundtrack     ;; 02:4155 $CA $A2 $41

    ; Lookup the music to use
    ; d = OverworldMusicTracks[hMapRoom]
    ldh  a, [hMapRoom]                            ;; 02:4158 $F0 $F6
    ld   e, a                                     ;; 02:415A $5F
    ld   d, $00                                   ;; 02:415B $16 $00
    ld   hl, OverworldMusicTracks                 ;; 02:415D $21 $00 $40
    add  hl, de                                   ;; 02:4160 $19
    ld   d, [hl]                                  ;; 02:4161 $56
    ld   a, d                                     ;; 02:4162 $7A

    ; Clear hNextMusicTrackToFadeInto
    xor  a                                        ;; 02:4163 $AF
    ldh  [hNextMusicTrackToFadeInto], a           ;; 02:4164 $E0 $B1

    ; If wIsIndoor == 0, skip further code and load the soundtrack
    ld   a, [wIsIndoor]                           ;; 02:4166 $FA $A5 $DB
    and  a                                        ;; 02:4169 $A7
    jr   z, .clearEventFlagsAndLoadSoundtrack     ;; 02:416A $28 $36

    ; If a boss was just defeated, load specific music
    ld   d, MUSIC_AFTER_BOSS                      ;; 02:416C $16 $18
    ld   a, [wBossDefeated]                       ;; 02:416E $FA $6C $D4
    and  a                                        ;; 02:4171 $A7
    jr   nz, .loadSoundtrack                      ;; 02:4172 $20 $32

    ; Set a depending on the world map
    ldh  a, [hMapId]                              ;; 02:4174 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 02:4176 $FE $FF
    jr   nz, .mapNotFF                            ;; 02:4178 $20 $04

    ld   a, $09                                   ;; 02:417A $3E $09
    jr   .mapDone                                 ;; 02:417C $18 $0E

.mapNotFF
    ; If on the houses map…
    cp   MAP_HOUSE                                ;; 02:417E $FE $10
    jr   nz, .mapDone                             ;; 02:4180 $20 $0A
    ; … and the map is $B5 (Photo Shop)…
    ld   d, a                                     ;; 02:4182 $57
    ldh  a, [hMapRoom]                            ;; 02:4183 $F0 $F6
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ;; 02:4185 $FE $B5
    ld   a, d                                     ;; 02:4187 $7A
    jr   nz, .mapDone                             ;; 02:4188 $20 $02
    ; … use same music than for map $0F (Trendy Game)
    ld   a, $0F                                   ;; 02:418A $3E $0F
.mapDone

    ; music id = HouseMusicTracks[a]
    ld   e, a                                     ;; 02:418C $5F
    ld   d, $00                                   ;; 02:418D $16 $00
    ld   hl, HouseMusicTracks                     ;; 02:418F $21 $00 $41
    add  hl, de                                   ;; 02:4192 $19
    ld   d, [hl]                                  ;; 02:4193 $56

    ; If hIsSideScrolling != 0 and a <= $0A…
    ldh  a, [hIsSideScrolling]                    ;; 02:4194 $F0 $F9
    and  a                                        ;; 02:4196 $A7
    jr   z, .loadSoundtrack                       ;; 02:4197 $28 $0D
    ld   a, e                                     ;; 02:4199 $7B
    cp   $0A                                      ;; 02:419A $FE $0A
    jr   nc, .loadSoundtrack                      ;; 02:419C $30 $08
    ; …force sountrack_id to $21
    ld   a, MUSIC_2D_UNDERGROUND                  ;; 02:419E $3E $21
    jr   .loadSoundtrackFromA                     ;; 02:41A0 $18 $05

.clearEventFlagsAndLoadSoundtrack
    ; Clear wBossDefeated
    xor  a                                        ;; 02:41A2 $AF
    ld   [wBossDefeated], a                       ;; 02:41A3 $EA $6C $D4

.loadSoundtrack
    ld   a, d                                     ;; 02:41A6 $7A

.loadSoundtrackFromA
    ; Set overworld soundtrack
    ld   e, a                                     ;; 02:41A7 $5F
    ld   d, $00                                   ;; 02:41A8 $16 $00
    ldh  [hDefaultMusicTrack], a                  ;; 02:41AA $E0 $B0
    call SetWorldMusicTrack                       ;; 02:41AC $CD $C3 $27

    ; If soundtrack id <= $24…
    ld   a, e                                     ;; 02:41AF $7B
    cp   $25                                      ;; 02:41B0 $FE $25
    jr   nc, .mayUsePowerUpMusic                  ;; 02:41B2 $30 $08
    ; … and MusicOverridesPowerUpTrack[soundtrack_id] == 1…
    ld   hl, MusicOverridesPowerUpTrack           ;; 02:41B4 $21 $20 $41
    add  hl, de                                   ;; 02:41B7 $19
    ld   a, [hl]                                  ;; 02:41B8 $7E
    and  a                                        ;; 02:41B9 $A7
    ; … the map-defined music has precedence over
    ; the power-up music.
    jr   nz, .return                              ;; 02:41BA $20 $13

.mayUsePowerUpMusic
    ; If Link currently has no power-up, return
    ld   a, [wActivePowerUp]                      ;; 02:41BC $FA $7C $D4
    and  a                                        ;; 02:41BF $A7
    jr   z, .return                               ;; 02:41C0 $28 $0D

    ; Replace the current music by the power-up music
    ld   a, MUSIC_ACTIVE_POWER_UP                 ;; 02:41C2 $3E $49
    ld   [wMusicTrackToPlay], a                   ;; 02:41C4 $EA $68 $D3
    ldh  [hDefaultMusicTrackAlt], a               ;; 02:41C7 $E0 $BD
    ldh  [hNextDefaultMusicTrack], a              ;; 02:41C9 $E0 $BF
    xor  a                                        ;; 02:41CB $AF
    ld   [wC1CF], a                               ;; 02:41CC $EA $CF $C1

.return
    ret                                           ;; 02:41CF $C9
