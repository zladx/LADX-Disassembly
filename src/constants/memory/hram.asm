section "HRAM", HRAM[$ff80]

; *******************************************************************
; *                                                                 *
; *             >> LABEL GUIDELINE <<                               *
; *                                                                 *
; *         ; Description of the usage of this memory address.      *
; *         ; Possible values:                                      *
; *         ; 0 = meaning 0,                                        *
; *         ; 1 = meaning 1,                                        *
; *         ; 2 = meaning 2                                         *
; *         label::                                                 *
; *           ds 1 ; address as 4 hex value                         *
; *                                                                 *
; *******************************************************************

; Unused
ds $10 ; FF80 - FF8F

; Beginning of the game-variables section of the HRAM
hGameValuesSection::
 ; Commands for loading tiles into VRAM at the next vblank period (see LoadTiles)
 ;
 ; Commands:
 ;   0:   do nothing
 ;   1:   load world tiles
 ;   2:   load dungeon minimap tiles
 ;   3:   load tiles for the piece of heart meter (part 1)
 ;   4:   load tiles for the piece of heart meter (part 1)
 ;   5:   clear tiles for the piece of heart meter (part 1)
 ;   6:   clear tiles for the piece of heart meter (part 1)
 ;   7:   load inventory tiles and BG map for siren instruments
 ;   8-A: load inventory tiles for ocarina songs
 ;   B-D: load shared gfx: shadows, explosions, etc
hNeedsUpdatingBGTiles::
 ds 1 ; FF90

; Request the spriteslot at wEntityTilesSpriteslotIndexA to be updated
; with the spritesheet specified at wLoadedEntitySpritesheets.
;
; Writing to this value will block the gameplay code from being run
; while the spriteslot is updated (i.e. during four frames, starting at
; the next v-blank).
;
; See also: wNeedsUpdatingEntityTilesB
hNeedsUpdatingEntityTilesA::
 ds 1 ; FF91

; Tiles are loaded in several passes. Holds the state of loading function progress.
; Possible values: 0 -> $0B
hBGTilesLoadingStage::
 ds 1 ; FF92

; Holds the progression of a loading progress started by hNeedsUpdatingEntityTilesA.
;
; Entity tiles are loaded in several passes (at $40 bytes per v-blank,
; it takes 4 v-blank interrupts to transfer 1 full spriteslot). So the work
; is divided into several slides. This variable holds whch slice is the current one.
;
; Possible values: 0 -> $0B
;
; See also: wEntityTilesLoadingStageB
hEntityTilesLoadingStageA::
 ds 1 ; FF93

; Sub-tileset to use for overworld or dungeon
hWorldTileset::
  ds 1 ; FF94

; Unused
ds 1 ; FF95

; offset of the main window in X direction
hBaseScrollX::
 ds 1 ; FF96

; offset of the main window in Y direction
hBaseScrollY::
 ds 1 ; FF97

; X position of Link on the map
hLinkPositionX::
 ds 1 ; FF98

; Y position of Link on the map
hLinkPositionY::
 ds 1 ; FF99

; Increment applied to hLinkPositionX at the end of the frame
hLinkSpeedX::
 ds 1 ; FF9A

; Increment applied to hLinkPositionY at the end of the frame
hLinkSpeedY::
 ds 1 ; FF9B

; During gameplay: Link physics, mostly in side-scrolling sections.
;
; Possible values:
; 0 = normal physics,
; 1 =
;   when jumping off a cliff;
;   when on a ladder in a side-scrolling section;
;   when diving in a top-view section
; 2 = when diving in a side-scrolling section
;
; See jump-table at 02:68E4
hLinkPhysicsModifier::
; On the Game Over screen: the loading stage of the screen.
hGameOverStage::
 ds 1 ; FF9C

; How the Link sprite should be drawn.
; for values see gameplay.asm
hLinkAnimationState::
  ds 1 ; FF9D

; Direction Link is facing
; See DIRECTION_* constants for possible values
hLinkDirection::
  ds 1 ; FF9E

; Final computed position of Link, once every modifiers added
hLinkFinalPositionX::
  ds 1 ; FF9F

; Final computed position of Link, once every modifiers added
hLinkFinalPositionY::
  ds 1 ; FFA0

; Whether the interactive motion of Link (i.e. responding to directional pad presses)
; is temporary blocked.
; For instance when grabbing an object with the Power Bracelet, giving
; a sword slash, or talking to some NPCs.
;
; Values:
;   0: interactive motion autorized
;   1: interactive motion locked (e.g. during grab or sword slash)
;   2: interactive motion locked (e.g. talking to Trendy game owner)
hLinkInteractiveMotionBlocked::
  ds 1 ; FFA1

; distance from Link to the ground
hLinkPositionZ::
  ds 1 ; FFA2

; Z velocity of link, signed value.
hLinkVelocityZ::
  ds 1 ; FFA3

; Animated tiles are grouped by groups of 4 tiles.
; Each map can use one of these groups.
; See ANIMATED_TILES_* constants for possible values
hAnimatedTilesGroup::
  ds 1 ; FFA4

; Individual tile to update
; See REPLACE_TILES_* constants for possible values.
hReplaceTiles::
  ds 1 ; FFA5

; Incremented every frame, wraps around $FF
hAnimatedTilesFrameCount::
  ds 1 ; FFA6

; Pointer to the animation data for the current
; frame (either 00, 40, 80 or C0).
hAnimatedTilesDataOffset::
  ds 1 ; FFA7

; Music fade out timer
hMusicFadeOutTimer::
  ds 1 ; FFA8

; Right channel volume -- low nybble only, 00-07
hVolumeRight::
  ds 1 ; FFA9

; Left channel volume -- high nybble only, 00-70
hVolumeLeft::
  ds 1 ; FFAA

; Music fade in timer
hMusicFadeInTimer::
  ds 1 ; FFAB

; Status of the staircase in the current room.
; (There can be only one staircase per room.)
; See STAIRCASE_* constants for possible values.
hStaircase::
  ds 1 ; FFAC

; X position of staircase in the current room, in pixels
; (unlike warp data, which uses tile position).
hStaircasePosX::
  ds 1 ; FFAD

; Y position of staircase in the current room, in pixels
; (unlike warp data, which uses tile position).
hStaircasePosY::
  ds 1 ; FFAE

; Type of the object under the active entity
; See OBJECT_* constants
hObjectUnderEntity::
  ds 1 ; FFAF

; Music track to play
; See MUSIC_* constants for possible values
hDefaultMusicTrack::
  ds 1 ; FFB0

; Next music to be played after room transition
hNextMusicTrackToFadeInto::
  ds 1 ; FFB1

; When 1, Link is moving much slower, like when being
; incapacited by a gel.
hLinkSlowWalkingSpeed::
  ds 1 ; FFB2

; Set to "hLinkPositionZ - wInvincibilityCounter" every frame
;
; Seems unused besides that.
; Maybe it was used differently at some point?
hLinkPositionZModified::
  ds 1 ; FFB3

; Countdown for displaying the message presenting the
; dungeon name when entering a dungeon.
hDungeonTitleMessageCountdown::
  ds 1 ; FFB4

; Number of frames during which joypad is ignored
hButtonsInactiveDelay::
  ds 1 ; FFB5

; Invicibility duration when Link is punched away
; (by Master Stalfos or Blaino).
hLinkPunchedAwayCountdown::
  ds 1 ; FFB6

; Countdown specific to Link.
; Used for various purposes in different areas.
hLinkCountdown::
  ds 1 ; FFB7

; Type of the object under Link.
; See hObjectUnderEntity
hObjectUnderLink::
  ds 1 ; FFB8

; There are 4 different sequences in D4 that the tile glint puzzle can take,
; this variable indicates which one is active.
hTileGlintSequence::
  ds 1 ; FFB9

; State of a pull switch used to move blocks
;
; Possible values:
;  0   not grabbed
;  1   grabbed and pulled
;  2   grabbed but not pulled
hMovingBlockMoverState::
  ds 1 ; FFBA

; Kind of switchable block needing its tiles to be updated during V-Blank.
; Possible values:
;  0  none
;  1  switchable block kind A
;  2  switchable block kind B
hSwitchBlockNeedingUpdate::
  ds 1 ; FFBB

; Whether the music track is restarted after a warp (staircase, exit door, etc.)
; Possible values:
;  0:                  the music track is restarted after the warp
;  any non-zero value: the music track continues to play as-this after the warp
hContinueMusicAfterWarp::
  ds 1 ; FFBC

; A copy of hDefaultMusicTrack
; Used to see wether the power-up music track should override
; the current music track.
hDefaultMusicTrackAlt::
  ds 1 ; FFBD

; Disable BG collisions for the current entity.
;
; The engine resets this value to 0 before animating each entity.
hActiveEntityNoBGCollision::
  ds 1 ; FFBE

; Music track to be played after countdown
; See hNextMusicTrackToFadeInto and
hNextDefaultMusicTrack::
  ds 1 ; FFBF

; DMA routine copied from ROM during initialization
; Copy the content of wOAMBuffer to the OAM memory
hDMARoutine::
  ds $A ; FFC0 - FFC9

; Unused
ds 1 ; FFCA

; The pressed buttons on the joypad.
; During all the time a button is pressed, the matching bit on this variable is set.
;
; See J_* constants for values.
hPressedButtonsMask::
  ds 1 ; FFCB

; The buttons newly pressed on the joypad.
; The matching bit is set only during the first frame the button is pressed.
; Afterwards, the bit is cleared.
;
; See J_* constants for values.
hJoypadState::
  ds 1 ; FFCC

; Topmost corner of the object intersected by Link or Link's sword
; Vary from $00 to $80 by increments of $10
hIntersectedObjectTop::
  ds 1 ; FFCD

; Leftmost corner of the object intersected by Link or Link's sword
; Vary from $00 to $A0 by increments of $10
hIntersectedObjectLeft::
  ds 1 ; FFCE

; BG address of the top-left tile of the intersected object (high byte)
hIntersectedObjectBGAddressHigh::
  ds $1 ; FFCF

; BG address of the top-left tile of the intersected object (low byte)
hIntersectedObjectBGAddressLow::
  ds $1 ; FFD0

; Whether the VBlank interrupt was serviced since the last frame was computed
; 0 = the VBlank interrupt didn't execute since last frame
; 1 = the VBlank interrupt just finished
hVBlankOccurred::
  ds 1 ; FFD1

; Copy of the rIE register
hInterrupts::
  ds 5 ; FFD2

; used in many different cases
hMultiPurpose0::
  ds 1 ; FFD7

; used in many different cases
hMultiPurpose1::
  ds 1 ; FFD8

; used in many different cases
hMultiPurpose2::
  ds 1 ; FFD9

; used in many different cases
hMultiPurpose3::
  ds 1 ; FFDA

; used in many different cases
hMultiPurpose4::
  ds 1 ; FFDB

; used in many different cases
hMultiPurpose5::
  ds 1 ; FFDC

; used in many different cases
hMultiPurpose6::
  ds 1 ; FFDD

; used in many different cases
hMultiPurpose7::
  ds 1 ; FFDE

; used in many different cases
hMultiPurpose8::
  ds 1 ; FFDF

; used in many different cases
hMultiPurpose9::
; high bit of the BG map offset
hBGMapOffsetHigh::
  ds 1 ; FFE0

; used in many different cases
hMultiPurposeA::
; low bit of the BG map offset
hBGMapOffsetLow::
  ds 1 ; FFE1

; used in many different cases
hMultiPurposeB::
  ds 1 ; FFE2

; used in many different cases
hMultiPurposeC::
  ds 1 ; FFE3

; used in many different cases
hMultiPurposeD::
  ds 1 ; FFE4

; used in many different cases
hMultiPurposeE::
  ds 1 ; FFE5

; used in many different cases
hMultiPurposeF::
; Address of the first free warp data slot
hFreeWarpDataAddress::
  ds 1 ; FFE6

; wraps around 00-FF
hFrameCounter::
  ds 1 ; FFE7

; used in many different cases
hMultiPurposeG::
; bank number for the used room
hRoomBank::
; tile data for the dialog background
hDialogBackgroundTile::
  ds 1 ; FFE8

; used in many different cases
hMultiPurposeH::
; tile data for the dungeon floor
hDungeonFloorTile::
; TODO comment
hIndexOfObjectBelowLink::
  ds 1 ; FFE9

; Active entity status
; See wEntitiesStatusTable
hActiveEntityStatus::
  ds 1 ; FFEA

; Active entity type
; See wEntitiesTypeTable
hActiveEntityType::
  ds 1 ; FFEB

; Visual Y-position (including the Z position) of the active entity.
; Usually equal to posY + posZ.
hActiveEntityVisualPosY::
  ds 1 ; FFEC

; Invert OAM attribute bits of the active entity.
;
; Each bit set inverts the OAM attributes of the active sprite pair.
; bit 0-3: GBC palette,
; bit 4: use inverted color palette,
; bit 5: x-flip the entity,
; bit 6: y-flip the entity,
; bit 7: invert the background priority
hActiveEntityFlipAttribute::
  ds 1 ; FFED

; Logical X-position of the active entity.
hActiveEntityPosX::
  ds 1 ; FFEE

; Logical Y-position of the active entity.
; (Also see hActiveEntityVisualPosY)
hActiveEntityPosY::
  ds 1 ; FFEF

; The entity-specific state of the active entity
; See wEntitiesStateTable
hActiveEntityState::
  ds 1 ; FFF0

; See wEntitiesSpriteVariantTable
hActiveEntitySpriteVariant::
  ds 1 ; FFF1

; Start playing a jingle
; See JINGLE_* constants for possible values
hJingle::
  ds 1 ; FFF2

; Start playing a waveform audio effect
; See WAVE_SFX_* constants for possible values
hWaveSfx::
  ds 1 ; FFF3

; Play a noise-generated audio effect next
; See NOISE_SFX_* constants for possible values
hNoiseSfx::
  ds 1 ; FFF4

; hActiveEntityTilesOffset?
; Control the base location of the active entity tiles
; in the tilemap.
;
; Dodongo snake: $10 for a specific instance
; Octorock: $30
; etc.
hActiveEntityTilesOffset::
  ds 1 ; FFF5

; Room id on the active map
hMapRoom:: ; FFF6
  ds 1

; Id of the current indoor world map
; See MAP_* constants for values
hMapId::
  ds 1 ; FFF7

; Status flags of the current room
; See ROOM_STATUS_* constants for possible values
hRoomStatus::
  ds 1 ; FFF8

; 0  top view
; 1  Unknown
; 2  side-scrolling view
hIsSideScrolling::
  ds 1 ; FFF9

; Position of Link in the current world room
; Value goes from 0 (top left) to $79 (bottom right)
; Not updated during room transitions
hLinkRoomPosition::
  ds 1 ; FFFA

; Final position of Link in the room, once modifiers applied
hLinkFinalRoomPosition::
  ds 1 ; FFFB

; Unused
ds 1 ; FFFC

; Is the engine currently computing a frame.
; 0 = computation is done, a frame is ready to be copied to VRAM,
; 1 = the engine is computing a new frame
hIsComputingFrame::
 ds 1 ; FFFD

; Marker for the Hardware that the program is running on
; 0 = GB,
; 1 = GBC
hIsGBC::
  ds 1 ; FFFE
