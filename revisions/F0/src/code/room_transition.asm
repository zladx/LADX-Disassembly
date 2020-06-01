;
; Sliding transition between rooms of the same map
;

RoomTransitionLinkXIncrement::
.right  db $C6
.left   db $3A
.top    db $00
.bottom db $00

RoomTransitionLinkYIncrement::
.right  db $00
.left   db $00
.top    db $3A
.bottom db $C6

RoomTransitionXIncrement::
.right  db $04
.left   db $FC
.top    db $00
.bottom db $00

RoomTransitionYIncrement::
.right  db $00
.left   db $00
.top    db $FC
.bottom db $04

ApplyRoomTransition::
    ld   a, [wRoomTransitionState]                ; $78E8: $FA $24 $C1
    cp   ROOM_TRANSITION_NONE                     ; $78EB: $FE $00
    jp   z, .return                               ; $78ED: $CA $D9 $79

    ; If the room transition didn't start to scroll yet,
    ; go directly to the jump table.
    push af                                       ; $78F0: $F5
    cp   ROOM_TRANSITION_FIRST_HALF               ; $78F1: $FE $04
    jp   c, .dispatchTransition                   ; $78F3: $DA $CC $79

    ;
    ; Apply the scroll offset
    ;

    ; hLinkPositionXIncrement = RoomTransitionLinkXIncrement[wRoomTransitionDirection]
    ld   a, [wRoomTransitionDirection]            ; $78F6: $FA $25 $C1
    ld   c, a                                     ; $78F9: $4F
    ld   b, $00                                   ; $78FA: $06 $00
    ld   hl, RoomTransitionLinkXIncrement         ; $78FC: $21 $D8 $78
    add  hl, bc                                   ; $78FF: $09
    ld   a, [hl]                                  ; $7900: $7E
    ldh  [hLinkPositionXIncrement], a             ; $7901: $E0 $9A

    ; hLinkPositionYIncrement = RoomTransitionLinkYIncrement[wRoomTransitionDirection]
    ld   hl, RoomTransitionLinkYIncrement         ; $7903: $21 $DC $78
    add  hl, bc                                   ; $7906: $09
    ld   a, [hl]                                  ; $7907: $7E
    ldh  [hLinkPositionYIncrement], a             ; $7908: $E0 $9B

    push bc                                       ; $790A: $C5
    call UpdateFinalLinkPosition                  ; $790B: $CD $A8 $21
    pop  bc                                       ; $790E: $C1

    ; hBaseScrollX += RoomTransitionXIncrement[wRoomTransitionDirection]
    ld   hl, RoomTransitionXIncrement             ; $790F: $21 $E0 $78
    add  hl, bc                                   ; $7912: $09
    ldh  a, [hBaseScrollX]                        ; $7913: $F0 $96
    add  [hl]                                     ; $7915: $86
    ldh  [hBaseScrollX], a                        ; $7916: $E0 $96

    ; hBaseScrollY += RoomTransitionYIncrement[wRoomTransitionDirection]
    ld   hl, RoomTransitionYIncrement             ; $7918: $21 $E4 $78
    add  hl, bc                                   ; $791B: $09
    ldh  a, [hBaseScrollY]                        ; $791C: $F0 $97
    add  [hl]                                     ; $791E: $86
    ldh  [hBaseScrollY], a                        ; $791F: $E0 $97

    ; If the target scroll position is not reached yet,
    ; go to the jump table
    ld   hl, wRoomTransitionTargetScrollY         ; $7921: $21 $2D $C1
    cp   [hl]                                     ; $7924: $BE
    jp   nz, .dispatchTransition                  ; $7925: $C2 $CC $79

    ldh  a, [hBaseScrollX]                        ; $7928: $F0 $96
    ld   hl, wRoomTransitionTargetScrollX         ; $792A: $21 $2C $C1
    cp   [hl]                                     ; $792D: $BE
    jp   nz, .dispatchTransition                  ; $792E: $C2 $CC $79

    ;
    ; Scroll reached the target scroll position:
    ; finish the transition.
    ;

    ; Change the music track if needed
    pop  af                                       ; $7931: $F1
    ldh  a, [hNextMusicTrackToFadeInto]           ; $7932: $F0 $B1
    and  a                                        ; $7934: $A7
    jr   z, .noMusicTrackChange                   ; $7935: $28 $06
    call SetWorldMusicTrack                       ; $7937: $CD $C3 $27
    xor  a                                        ; $793A: $AF
    ldh  [hNextMusicTrackToFadeInto], a           ; $793B: $E0 $B1
.noMusicTrackChange

    ; Clear variables
    call ClearLinkPositionIncrement               ; $793D: $CD $8E $17
    ldh  [$FFA3], a                               ; $7940: $E0 $A3
    ld   [wRoomTransitionState], a                ; $7942: $EA $24 $C1

    ; Save Link's initial position on the new map
    ldh  a, [hLinkPositionX]                      ; $7945: $F0 $98
    ld   [wLinkMapEntryPositionX], a              ; $7947: $EA $B1 $DB
    ldh  a, [hLinkPositionY]                      ; $794A: $F0 $99
    ld   [wLinkMapEntryPositionY], a              ; $794C: $EA $B2 $DB

    ; If the transition direction was to the bottom…
    ld   a, [wRoomTransitionDirection]            ; $794F: $FA $25 $C1
    cp   DIRECTION_DOWN                           ; $7952: $FE $03
    jr   nz, .bottomDirectionEnd                  ; $7954: $20 $24

    ; Initiate a jump if Link landed on a ledge
    ld   a, $01                                   ; $7956: $3E $01
    ldh  [hLinkPositionYIncrement], a             ; $7958: $E0 $9B
    call CheckForLedgeJump                        ; $795A: $CD $45 $6E

    ; If (hObjectUnderEntity != $DB && hObjectUnderEntity != $DC && (hObjectUnderEntity == $E1 || wCollisionType != 0),
    ; handle special case.
    ldh  a, [hObjectUnderEntity]                  ; $795D: $F0 $AF
    cp   $DB                                      ; $795F: $FE $DB
    jr   z, .bottomDirectionEnd                   ; $7961: $28 $17

    cp   $DC                                      ; $7963: $FE $DC
    jr   z, .bottomDirectionEnd                   ; $7965: $28 $13

    cp   $E1                                      ; $7967: $FE $E1
    jr   z, .handleFFAFSpecialCase                ; $7969: $28 $06

    ld   a, [wCollisionType]                      ; $796B: $FA $33 $C1
    and  a                                        ; $796E: $A7
    jr   z, .bottomDirectionEnd                   ; $796F: $28 $09

.handleFFAFSpecialCase
    ld   a, [wFreeMovementMode]                   ; $7971: $FA $7B $C1
    and  a                                        ; $7974: $A7
    jr   nz, .bottomDirectionEnd                  ; $7975: $20 $03

    call func_002_6EAD                            ; $7977: $CD $AD $6E
.bottomDirectionEnd

    ; If a jingle has been configured…
    ld   a, [wNextJingle]                         ; $797A: $FA $69 $C1
    and  a                                        ; $797D: $A7
    jr   z, .noJingle                             ; $797E: $28 $06
    ; … play the configured jingle immediately
    ldh  [hJingle], a                             ; $7980: $E0 $F2
    xor  a                                        ; $7982: $AF
    ld   [wNextJingle], a                         ; $7983: $EA $69 $C1
.noJingle

    call CreateFollowingNpcEntity_trampoline      ; $7986: $CD $58 $39

    ; Reset animated tiles frame
    ld   a, $FF                                   ; $7989: $3E $FF
    ldh  [hAnimatedTilesFrameCount], a            ; $798B: $E0 $A6

    ;
    ; Play compass SFX if needed
    ;

    ; If wIsIndoor == 0, return
    ld   a, [wIsIndoor]                           ; $798D: $FA $A5 $DB
    and  a                                        ; $7990: $A7
    ret  z                                        ; $7991: $C8

    ; d = wIsIndoor
    ld   d, a                                     ; $7992: $57

    ; If hMapId == MAP_COLOR_DUNGEON, d = 0
    ldh  a, [hMapId]                              ; $7993: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $7995: $FE $FF
    jr   nz, .mapNotFF                            ; $7997: $20 $04

    ld   d, 0                                     ; $7999: $16 $00
    jr   .activeRoomEnd                           ; $799B: $18 $09

.mapNotFF
    ; else if (hMapId >= MAP_FACE_SHRINE && hMapId < $1A), d += 1
    cp   $1A                                      ; $799D: $FE $1A
    jr   nc, .activeRoomEnd                       ; $799F: $30 $05
    cp   $06                                      ; $79A1: $FE $06
    jr   c, .activeRoomEnd                        ; $79A3: $38 $01
    inc  d                                        ; $79A5: $14
.activeRoomEnd

    ; e = hMapRoom
    ldh  a, [hMapRoom]                            ; $79A6: $F0 $F6
    ld   e, a                                     ; $79A8: $5F

    call GetChestsStatusForRoom_trampoline        ; $79A9: $CD $ED $29

    ; If chest status is not some key, and room trigger != EFFECT_DROP_KEY, return.
    cp   CHEST_SMALL_KEY                          ; $79AC: $FE $1A
    jr   z, .hasCompassDetectableTreasure         ; $79AE: $28 $0C

    cp   CHEST_NIGHTMARE_KEY                      ; $79B0: $FE $19
    jr   z, .hasCompassDetectableTreasure         ; $79B2: $28 $08

    ld   a, [wRoomEvent]                          ; $79B4: $FA $8E $C1
    and  EVENT_EFFECT_MASK                        ; $79B7: $E6 $E0
    cp   EFFECT_DROP_KEY                          ; $79B9: $FE $80
    ret  nz                                       ; $79BB: $C0

.hasCompassDetectableTreasure

    ; If player doesn't have the compass, return
    ld   a, [wHasDungeonCompass]                  ; $79BC: $FA $CD $DB
    and  a                                        ; $79BF: $A7
    ret  z                                        ; $79C0: $C8

    ; If the chests for this room have been opened, return
    ldh  a, [hRoomStatus]                         ; $79C1: $F0 $F8
    and  $10                                      ; $79C3: $E6 $10
    ret  nz                                       ; $79C5: $C0

    ; Request compass sound effect to be played with a 12 frames delay
    ld   a, 12                                    ; $79C6: $3E $0C
    ld   [wCompassSfxCountdown], a                ; $79C8: $EA $62 $D4
    ret                                           ; $79CB: $C9

.dispatchTransition
    pop  af                                       ; $79CC: $F1
    dec  a                                        ; $79CD: $3D
    JP_TABLE                                      ; $79CE: $C7
._00 dw RoomTransitionPrepareHandler
._01 dw RoomTransitionLoadTiles
._02 dw RoomTransitionConfigureScrollTargets
._03 dw RoomTransitionFirstHalfHandler
._04 dw RoomTransitionSecondHalfHandler

.return
    ret                                           ; $79D9: $C9

WindFishEggMazeSequence::
    db DIRECTION_LEFT
    db DIRECTION_LEFT
    db DIRECTION_UP
    db DIRECTION_RIGHT
    db DIRECTION_RIGHT
    db DIRECTION_UP
    db DIRECTION_LEFT
    db DIRECTION_UP

    db DIRECTION_RIGHT
    db DIRECTION_UP
    db DIRECTION_UP
    db DIRECTION_RIGHT
    db DIRECTION_UP
    db DIRECTION_UP
    db DIRECTION_RIGHT
    db DIRECTION_UP

    db DIRECTION_LEFT
    db DIRECTION_UP
    db DIRECTION_RIGHT
    db DIRECTION_UP
    db DIRECTION_LEFT
    db DIRECTION_UP
    db DIRECTION_RIGHT
    db DIRECTION_UP

    db DIRECTION_RIGHT
    db DIRECTION_RIGHT
    db DIRECTION_RIGHT
    db DIRECTION_RIGHT
    db DIRECTION_UP
    db DIRECTION_UP
    db DIRECTION_UP
    db DIRECTION_UP

RoomTransitionPrepareHandler::
    ld   a, [wRoomTransitionDirection]            ; $79FA: $FA $25 $C1
    ld   c, a                                     ; $79FD: $4F
    ld   b, $00                                   ; $79FE: $06 $00

    ; If map in indoor…
    ld   a, [wIsIndoor]                           ; $7A00: $FA $A5 $DB
    and  a                                        ; $7A03: $A7
    jr   z, .indoorEnd                            ; $7A04: $28 $67

    ;
    ; Wind Fish's Egg
    ;

    ; If map is not color dungeon…
    ldh  a, [hMapId]                              ; $7A06: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $7A08: $FE $FF
    jr   z, .noWindFishEggMaze                    ; $7A0A: $28 $3C

    ; … and hMapId < $0B…
    cp   MAP_DUNGEON_G1                           ; $7A0C: $FE $0B
    jr   nc, .indoorEnd                           ; $7A0E: $30 $5D

    ; … and map is Wind Fish's Egg…
    cp   MAP_WINDFISHS_EGG                        ; $7A10: $FE $08
    jr   nz, .noWindFishEggMaze                   ; $7A12: $20 $34

    ; … and egg room is $71…
    ldh  a, [hMapRoom]                            ; $7A14: $F0 $F6
    cp   $71                                      ; $7A16: $FE $71
    jr   nz, .noWindFishEggMaze                   ; $7A18: $20 $2E

    ; … and is not sliding to the bottom…
    ld   a, c                                     ; $7A1A: $79
    cp   DIRECTION_DOWN                           ; $7A1B: $FE $03
    jr   z, .noWindFishEggMaze                    ; $7A1D: $28 $29

    ; hl = WindFishEggMazeSequence + wWindFishEggMazeSequenceOffset
    ld   a, [wWindFishEggMazeSequenceOffset]      ; $7A1F: $FA $7C $DB
    ld   e, a                                     ; $7A22: $5F
    ld   d, $00                                   ; $7A23: $16 $00
    ld   hl, WindFishEggMazeSequence              ; $7A25: $21 $DA $79
    add  hl, de                                   ; $7A28: $19

    ; wEggMazeProgress += 1
    ld   a, [wEggMazeProgress]                    ; $7A29: $FA $AA $C5
    ld   e, a                                     ; $7A2C: $5F
    inc  a                                        ; $7A2D: $3C
    ld   [wEggMazeProgress], a                    ; $7A2E: $EA $AA $C5

    ; If direction != hl[wEggMazeProgress]…
    add  hl, de                                   ; $7A31: $19
    ld   a, c                                     ; $7A32: $79
    cp   [hl]                                     ; $7A33: $BE
    jr   z, .mazeDirectionOk                      ; $7A34: $28 $07
    ; … clear progress.
    xor  a                                        ; $7A36: $AF
    ld   [wEggMazeProgress], a                    ; $7A37: $EA $AA $C5
    jp   .loadRoom                                ; $7A3A: $C3 $A5 $7A
.mazeDirectionOk

    ; If maze progress >= 7, mark maze as solved
    ld   a, e                                     ; $7A3D: $7B
    cp   $07                                      ; $7A3E: $FE $07
    jp   nz, .loadRoom                            ; $7A40: $C2 $A5 $7A
    ld   a, JINGLE_PUZZLE_SOLVED                  ; $7A43: $3E $02
    ld   [wNextJingle], a                         ; $7A45: $EA $69 $C1

.noWindFishEggMaze

    ; Reset maze progress
    xor  a                                        ; $7A48: $AF
    ld   [wEggMazeProgress], a                    ; $7A49: $EA $AA $C5

    ;
    ; Compute the next IndoorRoom according to the direction
    ;

    ; hl = IndoorRoomIncrement + wRoomTransitionDirection
    ld   hl, IndoorRoomIncrement                  ; $7A4C: $21 $7B $7B
    add  hl, bc                                   ; $7A4F: $09

    ; If wRoomTransitionDirection == Top…
    ld   a, c                                     ; $7A50: $79
    cp   DIRECTION_UP                             ; $7A51: $FE $02
    jr   nz, .noFaceShrineHack                    ; $7A53: $20 $12

    ; … and dungeon is Face Shrine…
    ldh  a, [hMapId]                              ; $7A55: $F0 $F7
    cp   MAP_FACE_SHRINE                          ; $7A57: $FE $05
    jr   nz, .noFaceShrineHack                    ; $7A59: $20 $0C

    ; … and dungeon room is $1D…
    ld   a, [wIndoorRoom]                         ; $7A5B: $FA $AE $DB
    cp   $1D                                      ; $7A5E: $FE $1D
    jr   nz, .noFaceShrineHack                    ; $7A60: $20 $05

    ; … actually pretend we are on map $35.
    ld   a, $35                                   ; $7A62: $3E $35
    ld   [wIndoorRoom], a                         ; $7A64: $EA $AE $DB
.noFaceShrineHack

    ; a = IndoorRoomIncrement[direction]
    ; hl = wIndoorRoom
    ld   a, [hl]                                  ; $7A67: $7E
    ld   hl, wIndoorRoom                          ; $7A68: $21 $AE $DB
    jr   .incrementRoom                           ; $7A6B: $18 $1F
.indoorEnd

    ;
    ; Overworld
    ;

    ; If C10C != 0…
    ld   a, [wC10C]                               ; $7A6D: $FA $0C $C1
    and  a                                        ; $7A70: $A7
    jr   z, .mysteriousWoodsEnd                   ; $7A71: $28 $11

    ; … and direction == top…
    ld   a, c                                     ; $7A73: $79
    cp   DIRECTION_UP                             ; $7A74: $FE $02
    jr   nz, .mysteriousWoodsEnd                  ; $7A76: $20 $0C

    ; … Link got lost in the Mysterious Woods
    ld   a, JINGLE_FOREST_LOST                    ; $7A78: $3E $1E
    ld   [wNextJingle], a                         ; $7A7A: $EA $69 $C1

    ; a = $63
    ; hl = hMapRoom
    ld   a, $63                                   ; $7A7D: $3E $63
    ld   hl, hMapRoom                             ; $7A7F: $21 $F6 $FF
    jr   .setRoom                                 ; $7A82: $18 $09
.mysteriousWoodsEnd

    ; a = OverworldRoomIncrement[direction]
    ; hl = hMapRoom
    ld   hl, OverworldRoomIncrement               ; $7A84: $21 $77 $7B
    add  hl, bc                                   ; $7A87: $09
    ld   a, [hl]                                  ; $7A88: $7E
    ld   hl, hMapRoom                             ; $7A89: $21 $F6 $FF

.incrementRoom
    add  [hl]                                     ; $7A8C: $86

.setRoom
    ; Write the new room to the defined address
    ; (either hMapRoom or wIndoorRoom)
    ld   [hl], a                                  ; $7A8D: $77

    ; If room == $41 (Tail Cave Key on Mysterious Forest)…
    cp   $41                                      ; $7A8E: $FE $41
    jr   nz, .forestRoomEnd                       ; $7A90: $20 $13

    ; … and direction == top…
    ld   a, c                                     ; $7A92: $79
    cp   DIRECTION_UP                             ; $7A93: $FE $02
    jr   nz, .forestRoomEnd                       ; $7A95: $20 $0E

    ; … and this room has not been visited yet…
    ld   hl, wOverworldRoomStatus + $41           ; $7A97: $21 $41 $D8
    bit  6, [hl]                                  ; $7A9A: $CB $76
    jr   nz, .forestRoomEnd                       ; $7A9C: $20 $07

    ; … mark the room as discovered…
    set  6, [hl]                                  ; $7A9E: $CB $F6
    ; … and play a success jingle.
    ld   a, JINGLE_PUZZLE_SOLVED                  ; $7AA0: $3E $02
    ld   [wNextJingle], a                         ; $7AA2: $EA $69 $C1
.forestRoomEnd

.loadRoom
    call LoadRoom                                 ; $7AA5: $CD $F4 $30

    ; If in Color Dungeon…
    ld   a, [wIsIndoor]                           ; $7AA8: $FA $A5 $DB
    and  a                                        ; $7AAB: $A7
    jr   z, .colorDungeonEnd                      ; $7AAC: $28 $0F

    ldh  a, [hMapId]                              ; $7AAE: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $7AB0: $FE $FF
    jr   nz, .colorDungeonEnd                     ; $7AB2: $20 $09

    ; force update the background tiles
    ld   a, $01                                   ; $7AB4: $3E $01
    ldh  [hNeedsUpdatingBGTiles], a               ; $7AB6: $E0 $90

    ; Replace objects $56 and $57 by object $0D
    ld   a, $02                                   ; $7AB8: $3E $02
    call ReplaceObjects56and57_trampoline         ; $7ABA: $CD $F5 $09
.colorDungeonEnd

    call LoadRoomEntities                         ; $7ABD: $CD $FE $37
    call DrawLinkSprite                           ; $7AC0: $CD $2E $1D
    call ApplyLinkMotionState                     ; $7AC3: $CD $94 $17

    ;
    ; Get the music track to apply later
    ;

    ld   a, [$C1CF]                               ; $7AC6: $FA $CF $C1
    and  a                                        ; $7AC9: $A7
    jr   z, .C1CFIsZero                           ; $7ACA: $28 $1D

    xor  a                                        ; $7ACC: $AF
    ld   [$C1CF], a                               ; $7ACD: $EA $CF $C1

    ld   a, [wActivePowerUp]                      ; $7AD8: $FA $7C $D4
    and  a                                        ; $7ADB: $A7
    ldh  a, [hDefaultMusicTrack]                  ; $7ADC: $F0 $B0
    jr   z, .jr_002_7AE2                          ; $7ADE: $28 $02

    ld   a, MUSIC_ACTIVE_POWER_UP                 ; $7AE0: $3E $49

.jr_002_7AE2
    ldh  [hNextMusicTrackToFadeInto], a           ; $7AE2: $E0 $B1
    call label_27EA                               ; $7AE4: $CD $EA $27
    jr   IncrementRoomTransitionStateAndReturn    ; $7AE7: $18 $4D

.C1CFIsZero
    ; If indoors, or sword wasn't found yet, the music
    ; track will be handled directly by the audio code ; return.
    ld   a, [wIsIndoor]                           ; $7AE9: $FA $A5 $DB
    and  a                                        ; $7AEC: $A7
    jr   nz, IncrementRoomTransitionStateAndReturn ; $7AED: $20 $47

    ld   a, [wSwordLevel]                         ; $7AEF: $FA $4E $DB
    and  a                                        ; $7AF2: $A7
    jr   z, IncrementRoomTransitionStateAndReturn ; $7AF3: $28 $41

    ; Load the music track from the Overworld tracks array
    ldh  a, [hMapRoom]                            ; $7AF5: $F0 $F6
    ld   e, a                                     ; $7AF7: $5F
    ld   d, $00                                   ; $7AF8: $16 $00
    ld   hl, OverworldMusicTracks                 ; $7AFA: $21 $00 $40
    add  hl, de                                   ; $7AFD: $19
    ld   a, [hl]                                  ; $7AFE: $7E
    ld   hl, hDefaultMusicTrack                   ; $7AFF: $21 $B0 $FF
    cp   [hl]                                     ; $7B02: $BE
    jr   z, IncrementRoomTransitionStateAndReturn ; $7B03: $28 $31

    ld   c, a                                     ; $7B05: $4F
    cp   $25                                      ; $7B06: $FE $25
    jr   nc, jr_002_7B14                          ; $7B08: $30 $0A

    ld   b, $00                                   ; $7B0A: $06 $00
    ld   hl, MusicOverridesPowerUpTrack           ; $7B0C: $21 $20 $41
    add  hl, bc                                   ; $7B0F: $09
    ld   a, [hl]                                  ; $7B10: $7E
    and  a                                        ; $7B11: $A7
    jr   nz, jr_002_7B2A                          ; $7B12: $20 $16

jr_002_7B14:
    ld   a, [wActivePowerUp]                      ; $7B14: $FA $7C $D4
    and  a                                        ; $7B17: $A7
    jr   z, SetNextMusicTrack                     ; $7B18: $28 $13

    ldh  a, [$FFBD]                               ; $7B1A: $F0 $BD
    cp   MUSIC_ACTIVE_POWER_UP                    ; $7B1C: $FE $49
    jr   z, SetNextMusicTrack.setMusicTrack       ; $7B1E: $28 $13

    call SetNextMusicTrack                        ; $7B20: $CD $2D $7B
    ld   a, MUSIC_ACTIVE_POWER_UP                 ; $7B23: $3E $49
    ldh  [hNextMusicTrackToFadeInto], a           ; $7B25: $E0 $B1
    ldh  [$FFBD], a                               ; $7B27: $E0 $BD
    ret                                           ; $7B29: $C9

jr_002_7B2A:
    ld   a, c                                     ; $7B2A: $79
    ldh  [$FFBD], a                               ; $7B2B: $E0 $BD

SetNextMusicTrack::
    ld   a, c                                     ; $7B2D: $79
    ldh  [hNextMusicTrackToFadeInto], a           ; $7B2E: $E0 $B1
    call label_27EA                               ; $7B30: $CD $EA $27

.setMusicTrack
    ld   a, c                                     ; $7B33: $79
    ldh  [hDefaultMusicTrack], a                  ; $7B34: $E0 $B0

IncrementRoomTransitionStateAndReturn::
    ld   a, [wRoomTransitionState]                ; $7B36: $FA $24 $C1
    inc  a                                        ; $7B39: $3C
    ld   [wRoomTransitionState], a                ; $7B3A: $EA $24 $C1
    ret                                           ; $7B3D: $C9

RoomTransitionLoadTiles::
    call LoadRoomTiles                            ; $7B3E: $CD $1E $0D

    ; If room has mobile blocks…
    ld   a, [wRoomSwitchableObject]               ; $7B41: $FA $FA $D6
    cp   ROOM_SWITCHABLE_OBJECT_MOBILE_BLOCK      ; $7B44: $FE $02
    jr   nz, .mobileBlocksEnd                     ; $7B46: $20 $04
    ; … $FFBB == 2
    ld   a, $02                                   ; $7B48: $3E $02
    ldh  [$FFBB], a                               ; $7B4A: $E0 $BB

.mobileBlocksEnd

    jp   IncrementRoomTransitionStateAndReturn    ; $7B4C: $C3 $36 $7B

RoomTransitionBGOriginHigh::
.right  db $00
.left   db $00
.top    db $02
.bottom db $02

RoomTransitionBGOriginLow::
.right  db $14
.left   db $0C
.top    db $00
.bottom db $00

RoomTransitionBGInitialUpdateRegionHigh::
.right  db $00
.left   db $00
.top    db $03
.bottom db $02

RoomTransitionBGInitialUpdateRegionLow::
.right  db $14
.left   db $1F
.top    db $E0
.bottom db $00

data_002_7B5F::
.right  db $08
.left   db $08
.top    db $0A
.bottom db $0A

RoomTransitionFramesToMidScreen::
.right  db $14
.left   db $14
.top    db $10
.bottom db $10

data_002_7B67::
    db   $00                                      ; $7B67: $00
    add  hl, bc                                   ; $7B68: $09
    ld   [hl], b                                  ; $7B69: $70
    nop                                           ; $7B6A: $00
    ld   b, b                                     ; $7B6B: $40
    ld   b, b                                     ; $7B6C: $40
    ld   [bc], a                                  ; $7B6D: $02
    ld   [bc], a                                  ; $7B6E: $02

RoomTransitionTargetScrollX::
.right  db $A0
.left   db $60
.top    db $00
.bottom db $00

RoomTransitionTargetScrollY::
.right  db $00
.left   db $00
.top    db $80
.bottom db $80

OverworldRoomIncrement::
.right  db $01
.left   db $FF
.top    db $F0
.bottom db $10

IndoorRoomIncrement::
.right  db $01
.left   db $FF
.top    db $F8
.bottom db $08

RoomTransitionConfigureScrollTargets::
    ; If $FFBB == 0, return
    ldh  a, [$FFBB]                               ; $7B7F: $F0 $BB
    and  a                                        ; $7B81: $A7
    ret  nz                                       ; $7B82: $C0

    ; a = wRoomTransitionDirection
    ; e = (direction horizontal ? $DF : $FF)
    ld   e, $FF                                   ; $7B83: $1E $FF
    ld   a, [wRoomTransitionDirection]            ; $7B85: $FA $25 $C1
    ld   c, a                                     ; $7B88: $4F
    ld   b, $00                                   ; $7B89: $06 $00
    and  $02                                      ; $7B8B: $E6 $02
    jr   nz, .directionNotHorizontal              ; $7B8D: $20 $02
    ld   e, $DF                                   ; $7B8F: $1E $DF
.directionNotHorizontal

    ; Configure the target scrollX position
    ld   hl, RoomTransitionTargetScrollX          ; $7B91: $21 $6F $7B
    add  hl, bc                                   ; $7B94: $09
    ld   a, [wRoomTransitionTargetScrollX]        ; $7B95: $FA $2C $C1
    add  [hl]                                     ; $7B98: $86
    ld   [wRoomTransitionTargetScrollX], a        ; $7B99: $EA $2C $C1

    ; Configure the target scrollY position
    ld   hl, RoomTransitionTargetScrollY          ; $7B9C: $21 $73 $7B
    add  hl, bc                                   ; $7B9F: $09
    ld   a, [wRoomTransitionTargetScrollY]        ; $7BA0: $FA $2D $C1
    add  [hl]                                     ; $7BA3: $86
    ld   [wRoomTransitionTargetScrollY], a        ; $7BA4: $EA $2D $C1

    ; Configure the initial position of the Background region to be updated
    ld   hl, RoomTransitionBGInitialUpdateRegionLow ; $7BA7: $21 $5B $7B
    add  hl, bc                                   ; $7BAA: $09
    ld   a, [wBGOriginLow]                        ; $7BAB: $FA $2F $C1
    add  [hl]                                     ; $7BAE: $86
    rl   d                                        ; $7BAF: $CB $12
    and  e                                        ; $7BB1: $A3
    ld   [wBGUpdateRegionOriginLow], a            ; $7BB2: $EA $27 $C1

    ld   hl, RoomTransitionBGInitialUpdateRegionHigh ; $7BB5: $21 $57 $7B
    add  hl, bc                                   ; $7BB8: $09
    ld   a, [wBGOriginHigh]                       ; $7BB9: $FA $2E $C1
    rr   d                                        ; $7BBC: $CB $1A
    adc  [hl]                                     ; $7BBE: $8E
    and  $03                                      ; $7BBF: $E6 $03
    ld   [wBGUpdateRegionOriginHigh], a           ; $7BC1: $EA $26 $C1

    ; Save the background origin position after the transition
    ld   hl, RoomTransitionBGOriginLow            ; $7BC4: $21 $53 $7B
    add  hl, bc                                   ; $7BC7: $09
    ld   a, [wBGOriginLow]                        ; $7BC8: $FA $2F $C1
    add  [hl]                                     ; $7BCB: $86
    rl   d                                        ; $7BCC: $CB $12
    and  e                                        ; $7BCE: $A3
    ld   [wBGOriginLow], a                        ; $7BCF: $EA $2F $C1

    ld   hl, RoomTransitionBGOriginHigh           ; $7BD2: $21 $4F $7B
    add  hl, bc                                   ; $7BD5: $09
    ld   a, [wBGOriginHigh]                       ; $7BD6: $FA $2E $C1
    rr   d                                        ; $7BD9: $CB $1A
    adc  [hl]                                     ; $7BDB: $8E
    and  $03                                      ; $7BDC: $E6 $03
    ld   [wBGOriginHigh], a                       ; $7BDE: $EA $2E $C1

    ; Configure wBGUpdateRegionTilesCount
    ld   hl, data_002_7B5F                        ; $7BE1: $21 $5F $7B
    add  hl, bc                                   ; $7BE4: $09
    ld   a, [hl]                                  ; $7BE5: $7E
    ld   [wBGUpdateRegionTilesCount], a           ; $7BE6: $EA $28 $C1

    ; Set number of frames to elapse before reaching
    ; the mid-transition point
    ld   hl, RoomTransitionFramesToMidScreen      ; $7BE9: $21 $63 $7B
    add  hl, bc                                   ; $7BEC: $09
    ld   a, [hl]                                  ; $7BED: $7E
    ld   [wRoomTransitionFramesBeforeMidScreen], a ; $7BEE: $EA $29 $C1

    ld   hl, data_002_7B67                        ; $7BF1: $21 $67 $7B
    add  hl, bc                                   ; $7BF4: $09
    ld   a, [hl]                                  ; $7BF5: $7E
    ld   [$C12A], a                               ; $7BF6: $EA $2A $C1
    xor  a                                        ; $7BF9: $AF
    ld   [$C12B], a                               ; $7BFA: $EA $2B $C1

    jp   IncrementRoomTransitionStateAndReturn    ; $7BFD: $C3 $36 $7B

RoomTransitionFirstHalfHandler::
    ; Update BG Map
    jp   UpdateBGRegion                           ; $7C00: $C3 $09 $22

RoomTransitionSecondHalfHandler::
    ; The scroll increment has already been done earlier:
    ; nothing more to do.
    ret                                           ; $7C03: $C9

Data_002_7C04::
    db   $00, $00, $FF, $01, $01, $FF, $01, $FF   ; $7C04

Data_002_7C0C::
    db   $01, $FF, $00, $00, $01, $01, $FF, $FF   ; $7C0C

label_002_7C14:
    ldh  a, [hFrameCounter]                       ; $7C14: $F0 $E7
    and  $03                                      ; $7C16: $E6 $03
    ld   hl, wC167                                ; $7C18: $21 $67 $C1
    or   [hl]                                     ; $7C1B: $B6
    ld   hl, hLinkInteractiveMotionBlocked        ; $7C1C: $21 $A1 $FF
    or   [hl]                                     ; $7C1F: $B6
    ld   hl, wDialogGotItem                       ; $7C20: $21 $A9 $C1
    or   [hl]                                     ; $7C23: $B6
    ret  nz                                       ; $7C24: $C0

    ld   a, [wLinkGroundVfx]                      ; $7C25: $FA $81 $C1
    sub  $F0                                      ; $7C28: $D6 $F0
    ld   e, a                                     ; $7C2A: $5F
    ld   d, $00                                   ; $7C2B: $16 $00
    ld   hl, Data_002_7C04                        ; $7C2D: $21 $04 $7C
    add  hl, de                                   ; $7C30: $19
    ldh  a, [hLinkPositionX]                      ; $7C31: $F0 $98
    add  [hl]                                     ; $7C33: $86
    ldh  [hLinkPositionX], a                      ; $7C34: $E0 $98
    ld   hl, Data_002_7C0C                        ; $7C36: $21 $0C $7C
    add  hl, de                                   ; $7C39: $19
    ldh  a, [hLinkPositionY]                      ; $7C3A: $F0 $99
    add  [hl]                                     ; $7C3C: $86
    ldh  [hLinkPositionY], a                      ; $7C3D: $E0 $99
    ret                                           ; $7C3F: $C9

Data_002_7C40::
    db   $FC, $FA, $F8, $F6, $0C, $00, $00, $F4

Data_002_7C48::
    db   $00, $00, $00, $00, $00, $F4, $0C, $00

label_002_7C50:
    ldh  a, [hFrameCounter]                       ; $7C50: $F0 $E7
    and  $00                                      ; $7C52: $E6 $00
    ld   hl, wRoomTransitionState                 ; $7C54: $21 $24 $C1
    or   [hl]                                     ; $7C57: $B6
    ld   hl, wDialogGotItem                       ; $7C58: $21 $A9 $C1
    or   [hl]                                     ; $7C5B: $B6
    ld   hl, hLinkInteractiveMotionBlocked        ; $7C5C: $21 $A1 $FF
    or   [hl]                                     ; $7C5F: $B6
    ld   hl, wDialogState                         ; $7C60: $21 $9F $C1
    or   [hl]                                     ; $7C63: $B6
    ld   hl, wInventoryAppearing                  ; $7C64: $21 $4F $C1
    or   [hl]                                     ; $7C67: $B6
    ret  nz                                       ; $7C68: $C0

    ld   e, $01                                   ; $7C69: $1E $01
    ldh  a, [hObjectUnderEntity]                               ; $7C6B: $F0 $AF
    cp   $0E                                      ; $7C6D: $FE $0E
    jr   nz, jr_002_7C88                          ; $7C6F: $20 $17

    ldh  a, [hMapRoom]                            ; @TODO Likely involves the river rapids area
    cp   $3E                                      ; possibly for determining the leftward push
    jr   z, jr_002_7C8B                           ; at the top, before entering the rapids themselves

    inc  e                                        ; $7C77: $1C
    cp   $3D                                      ; $7C78: $FE $3D
    jr   z, jr_002_7C8B                           ; $7C7A: $28 $0F

    inc  e                                        ; $7C7C: $1C
    cp   $3C                                      ; $7C7D: $FE $3C
    jr   z, jr_002_7C8B                           ; $7C7F: $28 $0A

    cp   $3F                                      ; $7C81: $FE $3F
    ret  nz                                       ; $7C83: $C0

    ld   e, $00                                   ; $7C84: $1E $00
    jr   jr_002_7C8B                              ; $7C86: $18 $03

jr_002_7C88:
    sub  $E7                                      ; $7C88: $D6 $E7
    ld   e, a                                     ; $7C8A: $5F

jr_002_7C8B:
    ld   d, $00                                   ; $7C8B: $16 $00
    ld   hl, Data_002_7C40                        ; $7C8D: $21 $40 $7C
    add  hl, de                                   ; $7C90: $19
    ld   a, [hl]                                  ; $7C91: $7E
    ldh  [hLinkPositionXIncrement], a             ; $7C92: $E0 $9A
    ld   hl, Data_002_7C48                        ; $7C94: $21 $48 $7C
    add  hl, de                                   ; $7C97: $19
    ld   a, [hl]                                  ; $7C98: $7E
    ldh  [hLinkPositionYIncrement], a             ; $7C99: $E0 $9B
    call UpdateFinalLinkPosition                  ; $7C9B: $CD $A8 $21
    jp   CheckForLedgeJump                        ; $7C9E: $C3 $45 $6E
