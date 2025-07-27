section "WRAM Bank0", wram0[$c000]
wram0Section::

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

; Generic 40 tiles buffer for OAM data. Copied to OAM by DMA.
; During World gameplay, the OAM buffer is split between 12 OAM
; tiles for Link, and 28 OAM tiles for dynamic entities.
; Structure:
;  byte 0: Y position
;  byte 1: X position
;  byte 2: tile n°
;  byte 3: attribute
wOAMBuffer::

; During World gameplay, buffer for 12 Link OAM tiles
; Structure:
;  byte 0 = Y position,
;  byte 1 = X position,
;  byte 2 = tile n°,
;  byte 3 = attribute
wLinkOAMBuffer::
  ds 4 * 12 ; C000 - C02F

; During World gameplay, buffer for 28 dynamically allocated OAM elements
; Structure:
;  byte 0 = Y position,
;  byte 1 = X position,
;  byte 2 = tile n°,
;  byte 3 = attribute
wDynamicOAMBuffer::
  ds 4 * 28 ; C030 - C09F

; Unused
ds $60 ; C0A0-C0FF

; Table of the scrollX offset to add for each screen section being drawn
wScrollXOffsetForSection::
  ds $5 ; C100

; Portion of the screen being drawn (0 -> 4)
wLCDSectionIndex::
  ds 1 ; C105

; Offset for compensating the sea movement when drawing bottom screen section on intro sea
wIntroBGYOffset::
  ds 1 ; C106

; Unused
ds 1 ; C107

; Index of the player's name letter being drawn in a dialog
wNameIndex::
  ds 1 ; C108

; Dialog ID to display in the text debugger
wTextDebuggerDialogId::
  ds 1 ; C109

; Unlabeled
wC10A:
  ds 1 ; C10A

; Music timing:
; 0 = normal,
; 1 = double-speed,
; 2 = half-speed
wMusicTrackTiming:
  ds 1 ; C10B

; Checks whether Link should get lost in the Mysterious Forest/Woods
wShouldGetLostInMysteriousWoods:
  ds 1 ; C10C

; Index of the higher sprite slot that needs changing during a room transition.
; Values go from 0 to 3.
;
; (If more then 2 slots are required to change, then only the first
; and last are changed. Normally this never happens, unless you
; bypass collision or change the sprite mapping per room.)
;
; See also: wEntityTilesSpriteslotIndexA
wEntityTilesSpriteslotIndexB:
  ds 1 ; C10D

; Request the spriteslot at wEntityTilesSpriteslotIndexB to be updated
; with the spritesheet specified at wLoadedEntitySpritesheets.
;
; Writing to this value will block the gameplay code from being run
; while the spriteslot is updated (i.e. during four frames, starting at
; the next v-blank).
;
; See also: wNeedsUpdatingEntityTilesB
wNeedsUpdatingEntityTilesB::
  ds 1 ; C10E

; Holds the progression of a loading progress started by wNeedsUpdatingEntityTilesB.
;
; Entity tiles are loaded in several passes (at $40 bytes per v-blank,
; it takes 4 v-blank interrupts to transfer 1 full spriteslot). So the work
; is divided into several slides. This variable holds whch slice is the current one.
;
; Possible values: 0 -> $0B
;
; See also: hEntityTilesLoadingStageA
wEntityTilesLoadingStageB:
  ds 1 ; C10F

; Time until the next low health SFX sound will be played.
wTimeToNextLowHealthSFX:
  ds 1 ; C110

; Unlabeled
wC111:
  ds 1 ; C111

; TODO comment
wDialogIndexHi:
  ds 1 ; C112

; condition for room cleared
; 0 = false,
; any other value = true
wEnemyWasKilled:
  ds 1 ; C113

; Delay for repeating the NOISE_SFX_SEA_WAVES sound effect
; Plays when reaching $A0
wNoiseSfxSeaWavesCounter::
  ds 1 ; C114

; Unlabeled
wC115:
  ds 1 ; C115

; Used by Mamu and the final nightmare to indicate if required extra graphics have been loaded
wC116:
  ds 1 ; C116

; Whether there are Gels clinging to Link
; Possible values:
; 0 = false
; 1 = true
wIsGelClingingToLink:
  ds 1 ; C117

; Unlabeled
wC118:
  ds 1 ; C118

; Unlabeled
wC119:
  ds 1 ; C119

; Written when updating Link's X position from its speed,
; but never read again.
; (unused)
wC11A:;
  ds 1 ; C11A

; Written when updating Link's Y position from its speed,
; but never read again.
; (unused)
wC11B:;
  ds 1 ; C11B

; See LINK_MOTION_* constants for possible values.
wLinkMotionState:;
  ds 1 ; C11C

; Unlabeled
wC11D:
  ds 1 ; C11D

; Unlabeled
wC11E:
  ds 1 ; C11E

; The condition of the ground Link is standing on:
; See GROUND_STATUS_* constants for possible values.
;
; Also see: wLinkObjectPhysics
wLinkGroundStatus::
  ds 1 ; C11F

; Number of consecutive steps taken by Link.
; Doubled when running with pegasus boots.
; Special values:
;  -1 = bumping using Pegasus Boots,
;   7 = initial value at rest
wConsecutiveStepsCount:
  ds 1 ; C120

; Starts by $20 and counts down to 0.
; 0 = False,
; 1-20 = True
wIsUsingSpinAttack::
  ds 1 ; C121

; Link's spin attack charging meter:
; 0x00 = not charged,
; 0x28 = fully charged
wSwordCharge::
  ds 1 ; C122

; Index of the entity being currently animated.
; (Also used for the current transcient VFX being drawn.)
wActiveEntityIndex::
  ds 1 ; C123

; See ROOM_TRANSITION_* constants for possible values.
wRoomTransitionState::
  ds 1 ; C124

; See DIRECTION_* constants for possible values
wRoomTransitionDirection::
  ds 1 ; C125

; Position of the first tile of a background region
; to be updated during a room transition (low byte)
wBGUpdateRegionOriginHigh::
  ds 1 ; C126

; Position of the first tile of a background piece (row or colum)
; to update during a room transition (high byte)
wBGUpdateRegionOriginLow::
  ds 1 ; C127

; Number of tiles of a background piece (row or column) to be updated in a single batch
wBGUpdateRegionTilesCount::
  ds 1 ; C128

; Number of frames remaining before reaching the mid-screen transition point
wRoomTransitionFramesBeforeMidScreen::
  ds 1 ; C129

; some kind of offset is saved here
wTransitionOffset:
  ds 1 ; C12A

; Unlabeled
wTransitionZeroNeverUsed:
  ds 1 ; C12B

; Stop the room transition when reaching this value
wRoomTransitionTargetScrollX::
  ds 1 ; C12C

; Stop the room transition when reaching this value
wRoomTransitionTargetScrollY::
  ds 1 ; C12D

; Position of the first visible background tile (high byte) (Y = 00 or 02)
wBGOriginHigh::
  ds 1 ; C12E

; Position of the first visible background tile (low byte) (X = 00 or 14)
wBGOriginLow::
  ds 1 ; C12F

; Unlabeled
wC130::
  ds 3 ; C130 - C132

; Type of collistion
; Bit 0 = up,
; Bit 1 = down,
; Bit 2 = left,
; Bit 3 = right,
; Bit 4 = unknown
; See COLLISION_TYPE_* constants for possible values
wCollisionType::
  ds 1 ; C133

; When this counter is non-zero, NPCs won't talk to you
wDialogCooldown:
  ds 1 ; C134

; Unlabeled
wC135:
  ds 1 ; C135

; Position of the sword during a sping attack
; See SWORD_DIRECTION_* constants for possible values
wSwordDirection::
  ds 1 ; C136

; State of the sword during a normal swing or a swing attack:
; 0x00 = none,
; 0x01 = swing start,
; 0x02 = swing middle,
; 0x03 = swing front,
; 0x04 = swing end
wSwordAnimationState::
  ds 1 ; C137

; Frames before moving to the next sword animation state?
wC138::
  ds 1 ; C138

; Unlabeled
wC139::
  ds 1 ; C139

; Unlabeled
wC13A::
  ds 1 ; C13A

; Unlabeled
wC13B::
  ds 1 ; C13B

; Unlabeled
wC13C::
  ds 1 ; C13C

; Seed for the Random Number Generator
wRandomSeed::
  ds 1 ; C13D

; Ignore Link's collision with entities and some hurting objects when non-zero
; (for instance after being hurt).
;
; Decremented every frame.
wIgnoreLinkCollisionsCountdown::
  ds 1 ; C13E

; Unlabeled
wC13F::
  ds 1 ; C13F

; Unlabeled
wC140::
  ds 1 ; C140

; Unlabeled
wC141::
  ds 1 ; C141

; Unlabeled
wC142::
  ds 1 ; C142

; Unlabeled
wC143::
  ds 1 ; C143

; TODO comment
; Possible values:
; 0 = false
; 1 = true
; 2 = true
; 3 = true (?pushing with shield?)
wIsLinkPushing:: ; C144
  ds 1

; Unlabeled
wC145::
  ds 1 ; C145

; Is Link in the air (jumping with the feather, flying with rooster, etc)?
; Possible values:
; 0 = not in the air
; 1 = ?
; 2 = above a pit?
wIsLinkInTheAir::
  ds 1 ; C146

; Unlabeled
wC147::
  ds 2 ; C147 - C148

; Unlabeled
wC149::
  ds 1 ; C149

; TODO comment
wIsRunningWithPegasusBoots::
  ds 1 ; C14A

; Pegasus Boots charge meter:
; 0x00 = not charged,
; 0x1F = fully charged
wPegasusBootsChargeMeter::
  ds 1 ; C14B

; TODO comment
wIsShootingArrow::
  ds 1 ; C14C

; Link's active projectiles.
; If ≥0x02, Link cannot shoot any more projectiles.
; Re-initialized to 0 at the end of each frame.
wActiveProjectileCount::
  ds 1 ; C14D

; TODO comment
wHasPlacedBomb::
  ds 1 ; C14E

; Whether the inventory screen (window) is currently in the process
; of appearing. (In the original DMG version, this is set to 1 when
; the window is scrolling either in or out, but in the DX version it's
; only 1 when the inventory screen is fading in, not out.)
;
; Possible values:
; 0 = Regular interactive handling
; 1 = Inventory screen is appearing (DMG only: or disappearing)
wInventoryAppearing::
  ds 1 ; C14F

; Inventory screen (window) scroll direction and scroll increment
; (remnant from the original DMG game, as the inventory screen
; doesn't scroll in DX)
;
; Contains a signed byte saying how much to increment wWindowY by
; when wInventoryAppearing is true. Or you could think of it as
; bit 7 (the sign bit) saying whether it should scroll up (1) or down (0),
; and the remaining bits containing the increment value.
;
; Possible values:
; $F8 = Scroll up by 8 pixels each frame
; $08 = Scroll down by 8 pixels each frame
wSubscreenScrollIncrement::
  ds 1 ; C150

; Unlabeled
wInventoryShouldScroll::
  ds 1 ; C151

; Unlabeled
wC152::
  ds 1 ; C152

; Unlabeled
wC153::
  ds 1 ; C153

; Unlabeled
wC154::
  ds 1 ; C154

; Background offset for shaking the screen horizontally
wScreenShakeHorizontal::
  ds 1 ; C155

; Background offset for shaking the screen vertically
wScreenShakeVertical::
  ds 1 ; C156

; While not zero, the screen shakes
wScreenShakeCountdown::
  ds 1 ; C157

; Unlabeled
wC158::
  ds 1 ; C158

; TODO comment
wInventoryCursorFrameCounter::
  ds 1 ; C159

; TODO comment
wHasMirrorShield::
  ds 1 ; C15A

; TODO comment
wIsUsingShield::
  ds 1 ; C15B

; Is Link carrying an object above his head
; (not a boolean -- possible values: Data_003_56F1)
wIsCarryingLiftedObject:
  ds 1 ; C15C

; Contains a DIRECTION_* value taken from Link's irection
; TODO rename
wC15D:
  ds 1 ; C15D

; Unlabeled
wC15E:
  ds 1 ; C15E

; Counter that is increased every frame when pulling with the powerbracelet.
; Used for a delay after starting pulling something before lifting it over your head
wPullCounter:
  ds 1 ; C15F

; Unlabeled
wC160:
  ds 1 ; C160

; Unlabeled
wC161:
  ds 1 ; C161

; Unlabeled
wC162:
  ds 1 ; C162

; 1 = if on low health by measure of ThresholdLowHealthTable,
; 0 = if health is higher
wIsOnLowHeath::
  ds 1 ; C163

; High byte of index of character in a dialog text
; (See also wDialogCharacterIndex)
wDialogCharacterIndexHi:
  ds 1 ; C164

; Delay boss intro until this reaches zero
wBossIntroDelay:
  ds 1 ; C165

; While not zero, Link is shown playing the Ocarina
wLinkPlayingOcarinaCountdown:
  ds 1 ; C166

; Unlabeled
; maybe it is wHasBoomerangUnlocked
; Fishing-related
wC167:
  ds 1 ; C167

; Unlabeled
wC168:
  ds 1 ; C168

; TODO comment
wNextJingle:
  ds 1 ; C169

; Unlabeled
wC16A:
  ds 1 ; C16A

; TODO comment
wTransitionSequenceCounter::
  ds 1 ; C16B

; Unlabeled
wC16C:
  ds 1 ; C16C

; Unlabeled
wC16D:
  ds 1 ; C16D

; Unlabeled
; Is set to a non-zero value when the sword is swung or held out
wC16E:
  ds 1 ; C16E

; State of the dialog open or close animation.
; Values goes from 0 to 5.
wDialogOpenCloseAnimationFrame:
  ds 1 ; C16F

; Low byte of index of character in a dialog text
; (See also wDialogCharacterIndexHi)
wDialogCharacterIndex:
  ds 1 ; C170

; TODO comment
wDialogNextCharPosition:
  ds 1 ; C171

; TODO comment
wDialogScrollDelay:: ; C172
  ds 1

; TODO comment
wDialogIndex:
  ds 1 ; C173

; Unlabeled
wC174:
  ds 1 ; C174

; Unlabeled
wC175:
  ds 1 ; C175

; Unlabeled
wC176:
  ds 1 ; C176

; 0 or 1 depending on the first or second option is selected in a ask dialog
; 2 if a (non-ask) dialog is skipped with the B button
wDialogAskSelectionIndex:
  ds 1 ; C177

; Set to 2 when Link collides with a wall, tree, etc, while running with the Pegasus Boots
wPegasusBootsCollisionCountdown:
  ds 1 ; C178

; X position of the last Pegasus Boots collision 
wPegasusBootsCollisionPosX:
  ds 1 ; C179

; Y position of the last Pegasus Boots collision 
wPegasusBootsCollisionPosY:
  ds 1 ; C17A

; See https://tcrf.net/The_Legend_of_Zelda:_Link%27s_Awakening#Mono_Pausing_the_Engine_and_Mono.2FDX_Free-Movement_Mode
wFreeMovementMode::
  ds 1 ; C17B

; Unlabeled
wC17C::
  ds 1 ; C17C

; Unlabeled
wC17D::
  ds 1 ; C17D

; Unlabeled
wC17E::
  ds 1 ; C17E

; Special Background effect applied during some transitions or animations.
; See TRANSITION_GFX_* constants for possible values.
wTransitionGfx::
  ds 1 ; C17F

; Number of frames rendered during a warp transition.
wTransitionGfxFrameCount::
  ds 1 ; C180

; Physics flags of the object under Link.
; See OBJ_PHYSICS_* constants for possible values.
wLinkObjectPhysics::
  ds 1 ; C181

; Unlabeled
wC182::
  ds 1 ; C182

; Unlabeled
wC183::
  ds 5 ; C183 - C187

; Unlabeled
wC188::
  ds 1 ; C188

; Unlabeled
wC189::
  ds 1 ; C189

; Unlabeled
wC18A::
  ds 1 ; C18A

; Unlabeled
wC18B::
  ds 1 ; C18B

; Unlabeled
wC18C::
  ds 1 ; C18C

; Unlabeled
wC18D::
  ds 1 ; C18D

; Event for the current room.
; A combination of trigger and effect values.
; See TRIGGER_* and EFFECT_* constants for possible values.
wRoomEvent::
  ds 1 ; C18E

; Has the event effect for the current room been executed already?
wRoomEventEffectExecuted::
  ds 1 ; C18F

; Unlabeled
wC190::
  ds 1 ; C190

; Unlabeled
wC191::
  ds 2 ; C191 - C192

; The 4 bytes indicating which entity spritesheets are loaded in each of the 4 spriteslots.
; Values are taken from OverworldEntitySpritesheetsTable and IndoorEntitySpritesheetsTable.
;
; Each byte is bbbttttt, where:
;  - bbb indicates the bank to use (as an index to NpcTilesBankTable);
;  - ttttt indicate which 16 tile row to take from that bank.
; $FF means "keep current".
wLoadedEntitySpritesheets::
  ds 4 ; C193 - C196

; Index of the lowest sprite slot that needs changing during a room transition.
; Values go from 0 to 3.
;
; (If more then 2 slots are required to change, then only the first
; and last are changed. Normally this never happens, unless you
; bypass collision or change the sprite mapping per room.)
;
; See also: wEntityTilesSpriteslotIndexB
wEntityTilesSpriteslotIndexA::
  ds 1 ; C197

; Used during the falling and revolving door animations.
wLinkAnimationFrame::
  ds 1 ; C198

; Unlabeled
wC199::
  ds 2 ; C199 - C19A

; Link attack-step animation timer.
;
; When the timer is non-zero, display an attack-step animation for Link –
; for instance when slashing the sword, or when throwing a projectile.
;
; Bit 7: is the attack step triggered by the magic rod
; Bits 6-0: countdown until the animation ends
;
; See ATTACK_STEP_ITEM constants
wLinkAttackStepAnimationCountdown::
  ds 1 ; C19B

; Unlabeled
wC19C::
  ds 1 ; C19C

; Unlabeled
wC19D::
  ds 1 ; C19D

; Damage level for the current sword hit?
; (more or less `sword-level + power-ups - 1`)
wC19E::
  ds 1 ; C19E

; Upper bit   = set if the dialog is displayed on bottom (instead of top)
; Lowest bits = the dialog state (see DIALOG_* constants for possible values)
wDialogState::
  ds 1 ; C19F

; Unlabeled
wC1A0::
  ds 2 ; C1A0 - C1A1

; Unlabeled
wC1A2::
  ds 2 ; C1A2 - w1A3

; Unlabeled
wC1A4::
  ds 1 ; C1A4

; Number of conveyor belts on the current screen
wConveyorBeltsCount::
  ds 1 ; C1A5

; Unlabeled
wC1A6::
  ds 1 ; C1A6

; Unlabeled
wC1A7::
  ds 1 ; C1A7

; Unlabeled
wC1A8::
  ds 1 ; C1A8

; The "Got item" dialog to display
; Values:
;  0 = no item,
;  1 = Piece of Power,
;  2 = Toadstool,
;  3 = Magic powder,
;  4 = Break pots (?),
;  5 = Guardian Acorn
wDialogGotItem::
  ds 1 ; C1A9

; Number of frames to wait (while playing the "got item" sound effect)
; before displaying the dialog
wDialogGotItemCountdown::
  ds 1 ; C1AA

; Unlabeled
wC1AB::
  ds 1 ; C1AB

; Unlabeled
wC1AC::
  ds 1 ; C1AC

; Whether pressing the A or B button will do something other than using the current item
; read a sign/interact with a drawer
; See ITEM_USAGE_* constants for possible values.
wItemUsageContext::
  ds 1 ; C1AD

; Number of regular Zols animated so far on this frame.
; Used by Slime Eye to know the number of Zols on screen.
wZolCount::
  ds 2 ; C1AE - C1AF

; Unlabeled
wC1B0::
  ds 1 ; C1B0

; Unlabeled
wC1B1::
  ds 1 ; C1B1

; Unlabeled
wC1B2::
  ds 1 ; C1B2

; Unlabeled
wC1B3::
  ds 1 ; C1B3

; Unlabeled
wC1B4::
  ds 1 ; C1B4

; If non zero, the ocarina menu is opened inside the inventory subscreen.
wOcarinaMenuOpen::
  ds 1 ; C1B5

; Unlabeled
wC1B6::
  ds 1 ; C1B6

; Unlabeled
wC1B7::
  ds 1 ; C1B7

; Counts down from 16 to 0 when the ocarina menu is opening
wOcarinaMenuOpening::
  ds 1 ; C1B8

; Counts down from 16 to 0 when the ocarina menu is closing
wOcarinaMenuClosing::
  ds 1 ; C1B9

; This is set when start is pressed and the ocarina menu is open,
; the ocarina menu is closed first before the inventory menu is closed.
wCloseInventoryAfterOcarinaMenuClosed::
  ds 1 ; C1BA

; Number of consecutives frames during which the player is slipping
; over a pit without falling down into it.
;
; The counter is reset to 0 when reaching solid ground again.
wPitSlippingCounter::
  ds 1 ; C1BB

; Number of frames to wait before loading the previous map and room
wLoadPreviousMapCountdown::
  ds 1 ; C1BC

; Non-zero when the BossIntro routine did its thing
wDidBossIntro::
  ds 1 ; C1BD

; Non-zero after initializing a boss entity
wInBossBattle::
  ds 1 ; C1BE

; TODO comment
wScrollXOffset::
  ds 1 ; C1BF

; Gets set to 6 whenever Link uses the bow or drops a bomb,
; and then decrements by 1 each frame.
wBombArrowCooldown::
  ds 1 ; C1C0

; Entity index of last bomb dropped by the player.
; Used to turn it into a bomb arrow if you drop a bomb within the time window.wLatestDroppedBombEntityIndex::
wLatestDroppedBombEntityIndex::
  ds 1 ; C1C1

; Entity index of last shot arrow by the player.
; Used to turn it into a bomb arrow if you drop a bomb within the time window.
wLatestShotArrowEntityIndex::
  ds 1 ; C1C2

; Unlabeled
wC1C3::
  ds 1 ; C1C3

; Unlabeled
wC1C4::
  ds 1 ; C1C4

; not used
ds 1 ; C1C5

; Unlabeled
wC1C6::
  ds 1 ; C1C6

; Whether Link is shoveling.
;
; 0: not using the shovel
; 1: digging
; 2: hole opened in the ground
;
; If the ground under Link cannot be excavated (whether solid ground or
; hole already dug), this variable goes from 0 to 1, but never through stage 2.
wLinkUsingShovel::
  ds 1 ; C1C7

; Counter when the shovel animation is playing.
; $00 -> $10: digging
; $11 -> $18: throwing dirt away
wLinkUsingShovelTimer::
  ds 1 ; C1C8

; Unlabeled
wC1C9::
  ds 1 ; C1C9

; Unlabeled
; Related to switch buttons
wC1CA::
  ds 1 ; C1CA

; Whether a ROOM_SWITCHABLE_OBJECT_SWITCH_BUTTON has been pressed in the current floor.
; Reset when moving through stairs.
;
; Possible values:
;  0    button has not been pressed yet
;  $60  button pressed
wSwitchButtonPressed::
  ds 1 ; C1CB

; Whether a dialog box is waiting for a button press to continue.
wDialogIsWaitingForButtonPress::
  ds 1 ; C1CC

; Unlabeled
wC1CD::
  ds 1 ; C1CD

; Unlabeled
wC1CE::
  ds 1 ; C1CE

; Unlabeled
wC1CF::
  ds 1 ; C1CF

; Unlabeled
wC1D0::
  ds 16 ; C1D0 -C1DF

; Unlabeled
wC1E0::
  ds 16 ; C1E0 - C1EF

; Unlabeled
wC1F0::
  ds 4 ; C1F0 - C1F3

; Unlabeled
wC1F4::
  ds 12 ; C1F4 - C1FF

; ---------------------------------------------------------
;
; Entities state
;
;----------------------------------------------------------

; X position of visible entities
wEntitiesPosXTable::
  ds $10 ; C200 - C20F

; Y position of visible entities
wEntitiesPosYTable::
  ds $10 ; C210 - C21F

; Controls the sign of the X position:
; 0x00 = position is positive,
; 0xFF = position is negative
wEntitiesPosXSignTable::
  ds $10 ; C220 - C22F

; Controls the sign of the Y position:
; 0x00 = position is positive,
; 0xFF = position is negative
wEntitiesPosYSignTable::
  ds $10 ; C230 - C23F

; X Velocity of visible entities / 16.
; The entity will move this number of pixels every 16 frames. For example, if it's 8,
; the entity will move 1 pixel every other frame (8/16).
wEntitiesSpeedXTable::
  ds $10 ; C240 - C24F

; Y Velocity of visible entities / 16.
; The entity will move this number of pixels every 16 frames. For example, if it's 8,
; the entity will move 1 pixel every other frame (8/16).
wEntitiesSpeedYTable::
  ds $10 ; C250 - C25F

; Used as a way to give entities speeds divided by 16. (EntitySpeedX * 16) is
; added to EntitySpeedXAcc and the carry is used to move the entity.
wEntitiesSpeedXAccTable::
  ds $10 ; C260 - C26F

; Used as a way to give entities speeds divided by 16. (EntitySpeedY * 16) is
; added to EntitySpeedYAcc and the carry is used to move the entity.
wEntitiesSpeedYAccTable::
  ds $10 ; C270 - C27F

; State of visible entities
; See ENTITY_STATUS_* constants
wEntitiesStatusTable::
  ds $10 ; C280 - C28F

; Store the main state of an entity. Meaning of values is entity-specific.
;
; For instance:
; Mabe fox:  1 when jumping around, and 0 when standing in place moving the tail.
; Cucco: 1 when jumping around, and 0 when standing in place
; BowWow: 0 when standing still, 1 when bouncing lightly, 2 when making a big jump, 3 after a jump
; Village kids: 0 when standing still, 1 when bouncing
; Moblin: 0 when walking, 1 when standing still
; etc.
wEntitiesStateTable::
  ds $10 ; C290 - C29F

; Indicates if the entity is colliding:
; 0 = no collisions,
; bit 1 = collision on the right,
; bit 2 = collision on the left,
; bit 3 = collision on the top,
; bit 4 = collision on the bottom
wEntitiesCollisionsTable::
  ds $10 ; C2A0 - C2AF

; Entity-specific state.
;
; Examples:
;  - Octorock: enumerates 1-2-3-0
;  - Moblin: enumerates 1-2-3-0
;  - Cucco: stays to 0
;  - Butterfly: stores a delta X to move closer to Link
;  - Genie: store the substate
;  - LikeLike: swallowed item
;  - Keese: movement angle (0x0 = right ... 0x4 = down ... 0x8 = left ... 0xC = up)
;  - Smashable pillar: 0 = pillar, 1 = dust, 2 = debris
;  - Pincer: hole X position
;  - Peahat: animation speed 
;  - Moving blocks (left): Y position when fully closed
;  - Moving blocks (bottom): X position when fully closed
;  - Knight: when attacking, iron ball speed parallel to attack direction
;  - Mini-Moldorm & Moldorm: movement angle (0x0 = right ... 0x4 = down ... 0x8 = left ... 0xC = up)
;  - Ghini: 0 if trying to move right, 1 if left
;  - Dodongo Snake: offset to the index of the position history, used for the head
wEntitiesPrivateState1Table::
  ds $10 ; C2B0 - C2BF

; Entity-specific state.
;
; Examples:
;  - Butterfly: stores a delta Y to move closer to Link
;  - Keese: -1 when flying counter-clockwise, 1 otherwise
;  - Peahat: -1 when flying counter-clockwise, 1 otherwise
;  - Pincer: hole Y position
;  - Moving block mover: initial Y position
;  - Moving blocks (left): Y position when fully open
;  - Moving blocks (bottom): X position when fully open
;  - Knight: when attacking, iron ball speed accumulator parallel to attack direction
;  - Mini-Moldorm & Moldorm: -1 when moving counter-clockwise, 1 otherwise
;  - Ghini: 0 if trying to move down, 1 if up
;  - Dodongo Snake: offset to the index of the position history, used for the body
wEntitiesPrivateState2Table::
  ds $10 ; C2C0 - C2CF

; Entity-specific state.
;
; Examples:
;  - Droppable entity: 0 if visible; 1 if can be revealed with Pegasus Boots; 2 if buried, in bush, etc
;  - Keese: speed update timer
;  - Peahat: speed update timer
;  - Pincer: head direction
;  - Knight: when attacking, iron ball position parallel to attack direction
;  - Ghinis: 0 if originally hidden, 1 otherwise
wEntitiesPrivateState3Table::
  ds $10 ; C2D0 - C2DF

; Frames before the next state transition of the entity
wEntitiesTransitionCountdownTable::
  ds $10 ; C2E0 - C2EF

; Entity-specific countdown 1
;
; Examples:
;  - Timer Bombite: flashing timer
;  - Mini-Moldorm & Moldorm: counts down to next speed update
wEntitiesPrivateCountdown1Table::
  ds $10 ; C2F0 - C2FF

; Entity-specific countdown 2
;
; Examples:
;  - Ghini: countdown before starting xy movement
;  - Dodongo Snake: countdown after eating a bomb
wEntitiesPrivateCountdown2Table::
  ds $10 ; C300 - C30F

; When the altitude is higher than 0, the entity position is shifted vertically,
; and a shadow is displayed underneath.
wEntitiesPosZTable::
  ds $10 ; C310 - C31F

; Z Velocity of visible entities / 16.
; The entity will move this number of pixels every 16 frames. For example, if it's 8,
; the entity will move 1 pixel every other frame (8/16).
wEntitiesSpeedZTable::
  ds $10 ; C320 - C32F

; Used as a way to give entities speeds divided by 16. (EntitySpeedZ * 16) is
; added to EntitySpeedZAcc and the carry is used to move the entity.
wEntitiesSpeedZAccTable::
  ds $10 ; C330 - C33F

; Physics attribute flags. See ENTITY_PHYSICS_* for possible values.
;
; bits 0-3: number of allocated sprites in OAM memory,
; bit 4: display shadow on posZ > 0 if set (ENTITY_PHYSICS_SHADOW),
; bit 5: item can be picked up (ENTITY_PHYSICS_GRABBABLE),
; bit 6: doesn't react to projectiles if set (arrow, hookshot, etc.) (ENTITY_PHYSICS_PROJECTILE_NOCLIP),
; bit 7: doesn't hurt Link on collision if set (ENTITY_PHYSICS_HARMLESS)
wEntitiesPhysicsFlagsTable::
  ds $10 ; C340 - C34F

; Type of hitbox:
; bits 0-1: collision box type
; bits 2-6: hitbox type (see HitboxPositions),
; bit 7: ignore hits (and force collision, for some entities)
; See HITFLAGS_ constants for possible values.
wEntitiesHitboxFlagsTable::
  ds $10 ; C350 - C35F

; TODO comment
wEntitiesHealthTable::
  ds $10 ; C360 - C36F

; Unused value, likely declared for entities but never actually used.
wEntitiesUnusedTableA::
  ds $10 ; C370 - C37F

; Direction of the entity.
; See DIRECTION_* constants for possible values.
; This direction is always relevant for projectile-throwing entities
; (like Moblins or Octorocks). Other entities may not be as strict to
; update their direction.
wEntitiesDirectionTable::
  ds $10 ; C380 - C38F

; Entity-specific state.
wEntitiesPrivateState5Table::
  ds $10 ; C390 - C39F

; Type of the entity
; See ENTITY_* constants for possible values.
wEntitiesTypeTable::
  ds $10 ; C3A0 - C3AF

; Index of an entity sprite variant, depending for instance on the direction,
; the tail waving, etc.
; A sprite variant may use entirely different tiles, or change only some of them.
wEntitiesSpriteVariantTable::
  ds $10 ; C3B0 - C3BF

; Index of the next available OAM slot
wOAMNextAvailableSlot::
  ds 1 ; C3C0

; OAM-related
wC3C1::
  ds 2 ; C3C1 - C3C2

; Unlabeled
wDialogNextChar::
  ds 1 ; C3C3

; Unlabeled
wC3C4::
  ds 1 ; C3C4

; Unlabeled
wC3C5::
  ds 2 ; C3C5 - C3C6

; Unlabeled
wC3C7::
  ds 1 ; C3C7

wIsMarinSinging::
  ds 1 ; C3C8

; Unlabeled
wC3C9::
  ds 1 ; C3C9

; Unlabeled
wC3CA::
  ds 1 ; C3CA

; Type of the object affecting the background palette
; (for instance a dark palette when torches are not lit)
wObjectAffectingBGPalette::
  ds 1 ; C3CB

; Adress of a palette[frameCount] array
wBGPaletteEffectAddress::
  ds 1 ; C3CC

; Unlabeled
wC3CD::
  ds 1 ; C3CD

; Unlabeled
wC3CE::
  ds 1 ; C3CE

; Unlabeled
wC3CF::
  ds 1 ; C3CF

; How often should an entity speed be updated.
;
; For instance, a value of 4 means that the entity speedX or speedY
; will be updated every 4 frames.
;
; Each entity uses this value differently.
; 
; In segmented entities (Mini-Moldorm, Dodongo Snake...), the most recent position's index in the position history
wEntitiesInertiaTable::
  ds $10 ; C3D0 - C3DF

; Room id of the entity
wEntitiesRoomTable::
  ds $10 ; C3E0 - C3EF

; Recoil velocity X
; (e.g. when hit by the sword, or bumped against the shield)
;
; NB: recoil is applied only when wEntitiesIgnoreHitsCountdownTable is non-zero for this entity.
wEntitiesRecoilVelocityX::
  ds $10 ; C3F0 - C3FF

; Recoil velocity Y
; (e.g. when hit by the sword, or bumped against the shield)
;
; NB: recoil is applied only when wEntitiesIgnoreHitsCountdownTable is non-zero for this entity.
wEntitiesRecoilVelocityY::
  ds $10 ; C400 - C40F

; Invulnerability countdown?
; While this countdown is active, the entity does not
; participate to collision
wEntitiesIgnoreHitsCountdownTable::
  ds $10 ; C410 - C41F

; Countdown during which an entity flashes when taking a hit.
; (or when a bomb is nearing to explode.)
; A flashing entity (countdown > 0) doesn't take any damages from
; sword or projectiles.
; When the countdown reaches 0, the flashing stops.
wEntitiesFlashCountdownTable::
  ds $10 ; C420 - C42F

; Entity initialization flags?
; bit 0: move pit water
; bit 1: excluded from "kill all enemies"
; bit 2: is mini-boss
; bit 3: splashes into water
; bit 4: immune to pit water
; bit 5: allow out-of-bounds
; bit 6: sword doesn't clink
; bit 7: is boss
; See ENTITY_OPT1* for possible values
wEntitiesOptions1Table::
  ds $10 ; C430 - C43F

; Entity-specific state.
;
; Examples:
;  - Peahat: movement angle (0x0 = right ... 0x4 = down ... 0x8 = left ... 0xC = up)
;  - Knight: when attacking, iron ball position perpendicular to attack direction
wEntitiesPrivateState4Table::
  ds $10 ; C440 - C44F

; Frames before the next state transition of the entity (only decremented every four frames)
wEntitiesSlowTransitionCountdownTable::
  ds $10 ; C450 - C45F

; TODO comment
wEntitiesLoadOrderTable::
  ds $10 ; C460 - C46F

; Entity ground effect modifier
;
; Possible values:
;  0: on standard solid ground
;  1: on deep water/lava
;  2: on shallow water (draws ripples)
;  3: on tall grass (draws pushed-away grasses)
; See ENTITY_GROUND_STATUS* for possible values
wEntitiesGroundStatusTable::
  ds $10 ; C470 - C47F

; Entity-specific countdown 3
wEntitiesPrivateCountdown3Table::
  ds $10 ; C480 - C48F

; Is the entity being lifted by Link?
;
; Possible values:
;  0:   not lifted
;  1-3: being lifted (during the animation)
;  4:   lifted
wEntitiesLiftedTable::
  ds $10 ; C490 - C49F

; Is the entity recoiling from a power hit
; (e.g. hit with the power tunic or while having a Piece of power)
wEntitiesPowerRecoilingTable::
  ds $10 ; C4A0 - C4AF

; When an entity is falling, it moves toward this x position
wEntitiesFallingTargetXTable::
  ds $10 ; C4B0 - C4BF

; When an entity is falling, it moves toward this y position
wEntitiesFallingTargetYTable::
  ds $10 ; C4C0 - C4CF

; Entities health group
; See ConfigureNewEntity
; TODO check name, labeler is unsure
; possible values: $00, $02, $09, $1B
wEntitiesHealthGroup::
  ds $10 ; C4D0

; Item to drop when this entity is destroyed.
; Possible values:
;  00 = drop a random item or power-up,
;  01-FE = dropped entity type,
;  FF = don't drop anything at all
wEntitiesDroppedItemTable::
  ds $10 ; C4E0 - C4EF

; TODO rename and comment
wEntitiesUnknowTableJ::
  ds $10 ; C4F0

; If enabled, alternate between two Background position every frame.
wAlternateBackgroundEnabled::
  ds 1 ; C500

; If an OwlEvent entity is active, the index of the entity is stored here (only used to trigger the owl on getting the tail key)
wOwlEntityIndex::
  ds 1 ; C501

; Unlabeled
wC502::
  ds 1 ; C502

; Type of the object the active entity collided with horizontally
wEntityHorizontallyCollidedObject::
  ds 1 ; C503

; Unused? (only written to zero, not read anywhere)
wC504::
  ds 1 ; C504

; List of 4 items that are available in the shop, filled depending on your current state in the game and what you have bought already.
wShopItemList::
  ds 4 ; C505 - C508

; Type of the item we are grabbing in the shop (special shop type numbers, see shop code)
wItemPickedUpInShop::
  ds 1 ; C509

; Block link from using items (used by the shop and trendy game)
wBlockItemUsage::
  ds 1 ; C50A

; Position index of item picked up in shop, left most item is 0, right most 3
wIndexPickedUpInShop::
  ds 1 ; C50B

; Entity index of a picked up rock (only used by the crow on the castle to trigger flying away)
wPickedUpRockIndex::
  ds 1 ; C50C

; Type of the object the active entity collided with vertically
wEntityVerticallyCollidedObject::
  ds 1 ; C50D

; Unlabeled
wC50E::
  ds 1 ; C50E

; Entity index of Marin (as follower, or on the bridge on Tal Tal Heights)
wMarinEntityIndex::
  ds 1 ; C50F

; Temporary visual effects displayed as non-interactive sprites.
; Values are filled starting from the end of the array.
; See TRANSCIENT_VFX_* constants for possible values.
wTranscientVfxTypeTable::
  ds $10 ; C510 - C51F

; Countdown for the transcient visual effects.
; When reaching 0, the visual effect gets removed.
wTranscientVfxCountdownTable::
  ds $10 ; C520 - C52F

; Transcient visual effects X position
wTranscientVfxPosXTable::
  ds $10 ; C530 - C53F

; Transcient visual effects Y position
wTranscientVfxPosYTable::
  ds $10 ; C540 - C54F

; Unlabeled
wC550::
  ds $10 ; C550-C55F

; Unlabeled
wC560::
  ds $10 ; C560 - C56F

; Unlabeled
wC570::
  ds $20 ; C570 - C58F

; Unlabeled
wC590::
  ds $10 ; C590 - C59F

; Unlabeled
wC5A0::
  ds 1 ; C5A0

; Unlabeled
wC5A1::
  ds 1 ; C5A1

; Unlabeled
wC5A2::
  ds 1 ; C5A2

; Unlabeled
wC5A3::
  ds 1 ; C5A3

; Unlabeled
wC5A4::
  ds 1 ; C5A4

; Unlabeled
wC5A5::
  ds 1 ; C5A5

; Unlabeled
wC5A6::
  ds 1 ; C5A6

; When reaching zero, play the WAVE_SFX_BOSS_DEATH_CRY sound effect
wBossAgonySFXCountdown::
  ds 1 ; C5A7

; Type of lifted entity. Used only for Rooster behavior.
wLiftedEntityType::
  ds 1 ; C5A8

; 0 = Link has been damaged
; 1 = Link's hearts are full (full health)
wFullHearts::
  ds 1 ; C5A9

; Number of rooms progressed correctly in the Wind Fish's Egg maze
wEggMazeProgress::
  ds 1 ; C5AA

; TODO comment
wDialogSFX::
    ds 1 ; C5AB

; Unlabeled
wC5AC::
  ds 1 ; C5AC

; Unlabeled
wC5AD::
  ds 1 ; C5AD

; Unlabeled
wC5AE::
  ds 1 ; C5AE

; When reaching zero, play wNextWorldMusicTrack
wNextWorldMusicTrackCountdown::
  ds 1 ; C5AF

; zero if sword collision is disabled
; any other value enables sword collision
; this is used to check if a object can be hit by sword
wSwordCollisionEnabled::
  ds 1 ; C5B0

; not used
wC5B1::
  ds 15 ; C5B1- C5BF

; Unlabeled
wC5C0::
  ds $10 ; C5C0 - C5CF

; Direction the entity was thrown.
; See DIRECTION_* constants for possible values.
; 0xFF = not thrown
wEntitiesThrownDirectionTable::
  ds $10 ; C5D0 - C5DF
  
wC5E0::
  ds $8A0 ; C5E0 - CE7F

; Index of the next slot to use in wRecentRooms
wRecentRoomsIndex::
  ds 1 ; CE80

; List of the 6 most recently loaded rooms.
wRecentRooms::
  ds 6 ; CE81

; not used
wCE87::
  ds $79

; For each room, store the number of entities not to load
; when entering the room next time.
; Used to avoid respawning enemies as soon as the player moves to
; the next room.
wEntitiesClearedRooms::
  ds $FF ; CF00 - CFFF

section "WRAM Bank1", wramx[$D000], bank[1]

UNION

; Histories of either:
; - up to 8 Mini-Moldorms' last 32 horizontal positions (indexed by load order)
; - up to 4 Dodongo Snakes' last 64 horizontal positions (indexed by load order)
wEntitiesPositionXHistoryTable::
  ds $100 ; D000 - D0FF

; See wEntitiesPositionXHistoryTable
wEntitiesPositionYHistoryTable::
  ds $100 ; D100 - D1FF

NEXTU

; This location has multiple uses.
; Time during which the palette is modified by lightning during
; the intro sequence (both on sea and on Link's face).
wIntroLightningVisibleCountdown::
; Scratch variable using during the Credits sequence
wCreditsScratch0::
; Is the arrow on the File Selection screen on the COPY item
wIsFileSelectionArrowShifted::
  ds 1 ; D000

; TODO comment
wIntroTimer::
  ds 1 ; D001

; TODO comment
wIntroSubTimer::
  ds 1 ; D002

; Unlabeled
wD003::
  ds 1 ; D003

; Unlabeled
wD004::
  ds 1 ; D004

; Unlabeled
wD005::
  ds 1 ; D005

; Unlabeled
wD006::
  ds 1 ; D006

; Unlabeled
wD007::
  ds 1 ; D007

; Unlabeled
wD008::
  ds 1 ; D008

; Unlabeled
wD009::
  ds 1 ; D009

; Unlabeled
wD00A::
  ds 1 ; D00A

; Unlabeled
wD00B::
  ds 1 ; D00B

; Unlabeled
wD00C::
  ds 1 ; D00C

; Unlabeled
wD00D::
  ds 1 ; D00D

; TODO comment
wCreditsSubscene::
  ds 1 ; D00E

; Unlabeled
wD00F::
  ds 1 ; D00F

; Unlabeled
wD010::
  ds 1 ; D010

; Unlabeled
wD011::
  ds 1 ; D011

; Unlabeled
wD012::
  ds 1 ; D012

; Unlabeled
wD013::
  ds 1 ; D013

; Unlabeled
wD014::
  ds 1 ; D014

; Unlabeled
wD015::
  ds 1 ; D015

; Unlabeled
wD016::
  ds 1 ; D016

; Unlabeled
wD017::
  ds 1 ; D017

; Unlabeled
wD018::
  ds 1 ; D018

; Unlabeled
wD019::
  ds 1 ; D019

; Unlabeled
wD01A::
  ds 1 ; D01A

; Unlabeled
wD01B::
  ds 1 ; D01B

; Unlabeled
wD01C::
  ds 1 ; D01C

; Unlabeled
wD01D::
  ds 1 ; D01D

; Unlabeled
wD01E::
  ds 1 ; D01E

; Unlabeled
wD01F::
  ds 1 ; D01F

; Unlabeled
wD020::
  ds 1 ; D020

; Unlabeled
wD021::
  ds 1 ; D021

; Unlabeled
wD022::
  ds 1 ; D022

; not used
; TODO check if never used
wD023::
  ds 13 ; D023 - D02F

; Unlabeled
wD030::
  ds $10 ; D030 - D03F

; Unlabeled
wD040::
  ds $10 ; D040 - D04F

; Unlabeled
wD050::
  ds $10 ; D050 - D05F

; Unlabeled
wD060::
  ds $10 ; D060 - D06F

; not used
; TODO check if never used
wD070::
  ds $90 ; D070 - D0FF

; Unlabeled
wD100::
  ds 1 ; D100

; Unlabeled
wD101::
  ds 4 ; D101 - D104

; Unlabeled
wD105::
  ds 1 ; D105

; Unlabeled
wD106::
  ds 2 ; D106 - D107

; Unlabeled
wD108::
  ds 8 ; D108 - D10F

; Unlabeled
wD110::
  ds 1 ; D110

; Unlabeled
wD111::
  ds 4 ; D111 - D114

; Unlabeled
wD115::
  ds 1 ; D115

; Unlabeled
wD116::
  ds 1 ; D116

; Unlabeled
ds ($D150 - $D117)

; Unlabeled
wD150::
  ds 1 ; D150

; Unlabeled
wD151::
  ds 1 ; D151

; Unlabeled
wD152::
  ds 1 ; D152

; Unlabeled
wD153::
  ds 1 ; D153

; Unlabeled
wD154::
  ds 1 ; D154

;
; This section is used for:
; - Link's position history (during gameplay)
; - Photo album display and print
;
UNION ; Link's position history

; History of Link's last 32 horizontal positions
; (Used for NPCs that follow Link)
wLinkPositionXHistory::
  ds $20 ; D155

; History of Link's last 32 vertical positions
; (Used for NPCs that follow Link)
wLinkPositionYHistory::
  ds $20 ; D175

; History of Link's last 32 Z positions
; (Used for NPCs that follow Link)
wLinkPositionZHistory::
  ds $20 ; D195

; History of Link's directions ($10)
wLinkDirectionHistory::
  ds $20 ; D1B5

NEXTU ; Photo album display and print

; Unused
ds $13

wD168::
  ds 1 ; D168

wD169::
  ds 1 ; D169

wD16A::
  ds 1 ; D16A

wD16B::
  ds 1 ; D16B

wD16C::
  ds 1 ; D16C

wD16D::
  ds 1 ; D16D

wD16E::
  ds 1 ; D16E

wD16F::
  ds 1 ; D16F

wD170::
  ds 1 ; D170

wD171::
  ds 1 ; D171

wD172::
  ds 1 ; D172

wD173::
  ds 1 ; D173

wD174::
  ds 1 ; D174

wD175::
  ds 1 ; D175

wD176::
  ds 1 ; D176

wD177::
  ds 1 ; D177

wD178::
  ds 1 ; D178

wD179::
  ds 1 ; D179

wD17A::
  ds 1 ; D17A

wD17B::
  ds 1 ; D17B

wD17C::
  ds 1 ; D17C

wD17D::
  ds 1 ; D17D

wD17E::
  ds 1 ; D17E

wD17F::
  ds 1 ; D17F

wD180::
  ds 1 ; D180

wD181::
  ds 1 ; D181

wD182::
  ds 1 ; D182

; Unlabeled
wD183::
  ds 1 ; D183

; Unlabeled
wD184::
  ds 1 ; D184

; Unlabeled
wD185::
  ds 1 ; D185

; Unlabeled
wD186::
  ds 1 ; D186

; Unlabeled
wD187::
  ds 1 ; D187

; Unlabeled
wD188::
  ds 1 ; D188

; Unlabeled
wD189::
  ds 1 ; D189

; Unlabeled
wD18A::
  ds 1 ; D18A

; Unlabeled
wD18B::
  ds 1 ; D18B

; Unlabeled
wD18C::
  ds 1 ; D18C

; Unlabeled
wD18D::
  ds 1 ; D18D

; Unlabeled
wD18E::
  ds 1 ; D18E

; Unlabeled
wD18F::
  ds 1 ; D18F

; Unlabeled
wD190::
  ds 1 ; D190

; Unlabeled
wD191::
  ds 1 ; D191

; Unlabeled
wD192::
  ds 1 ; D192

; Unlabeled
wD193::
  ds 1 ; D193

; Unlabeled
wD194::
  ds 1 ; D194

; Unlabeled
wD195::
  ds 1 ; D195

; Unlabeled
wD196::
  ds 1 ; D196

; Unlabeled
wD197::
  ds 1 ; D197

; Unlabeled
wD198::
  ds 1 ; D198

; Unlabeled
wD199::
  ds 1 ; D199

; Unlabeled
wD19A::
  ds $12 ; D19A

wD1AC::
  ds $9; ; D1AC

wD1B5::
  ds 1 ; D1B5

; Unlabeled
wD1B6::
  ds 1 ; D1B6

; Unlabeled
wD1B7::
  ds 1 ; D1B7

; Unlabeled
wD1B8::
  ds 1 ; D1B8

; Unlabeled
wD1B9::
  ds 1 ; D1B9

; Unlabeled
wD1BA::
  ds 1 ; D1BA

; Unlabeled
wD1BB::
  ds 1 ; D1BB

; Unlabeled
wD1BC::
  ds 1 ; D1BC

; Unlabeled
wD1BD::
  ds 1 ; D1BD

; Unlabeled
wD1BE::
  ds 1 ; D1BE

; Unlabeled
wD1BF::
  ds 1 ; D1BF

; Unlabeled
wD1C0::
  ds 1 ; D1C0

; Unlabeled
wD1C1::
  ds 1 ; D1C1

; Unlabeled
wD1C2::
  ds 1 ; D1C2

; Unused
ds $2

; Unlabeled
wD1C5::
  ds 1 ; D1C5

; Unlabeled
wD1C6::
  ds 1 ; D1C6

; Unlabeled
wD1C7::
  ds 1 ; D1C7

; Unlabeled
wD1C8::
  ds 1 ; D1C8

; Unlabeled
wD1C9::
  ds 1 ; D1C9

; Unlabeled
wD1CA::
  ds 1 ; D1CA

; Unlabeled
wD1CB::
  ds 1 ; D1CB

; Unlabeled
wD1CC::
  ds 1 ; D1CC

; Unlabeled
wD1CD::
  ds 1 ; D1CD

; Unlabeled
wD1CE::
  ds 1 ; D1CE

; Unlabeled
wD1CF::
  ds 1 ; D1CF

; Unlabeled
wD1D0::
  ds 1 ; D1D0

; Unlabeled
wD1D1::
  ds 1 ; D1D1

; Unused
ds ($D200 - $D1D2)

ENDU

ENDU

; Unlabeled
wD200::
  ds 1 ; D200

; Used by various NPC scripts. Including:
;  Horse heads, to indicate the entity index of the 2nd head.
wD201::
  ds 1 ; D201

; Unlabeled
wD202::
  ds 1 ; D202

; Unlabeled
wD203::
  ds 1 ; D203

; Unlabeled
wD204::
  ds 1 ; D204

; Unlabeled
wD205::
  ds 1 ; D205

; Unlabeled
wD206::
  ds 1 ; D206

; Unlabeled
wD207::
  ds 1 ; D207

; Unlabeled
wD208::
  ds 1 ; D208

; Unlabeled
wD209::
  ds 1 ; D209

; Unlabeled
wD20A::
  ds 1 ; D20A

; Unlabeled
wD20B::
  ds 1 ; D20B

; Unlabeled
wD20C::
  ds 1 ; D20C

; Unlabeled
wD20D::
  ds 1 ; D20D

; Unlabeled
wD20E::
  ds 1 ; D20E

; Unlabeled
wD20F::
  ds 1 ; D20F

; Unlabeled
wD210::
  ds 1 ; D210

; Unlabeled
wD211::
  ds 1 ; D211

; Unlabeled
wD212::
  ds 1 ; D212

; Unlabeled
wD213::
  ds 1 ; D213

; Unlabeled
wD214::
  ds 1 ; D214

; Unlabeled
wD215::
  ds 1 ; D215

; Unlabeled
wD216::
  ds 1 ; D216

; Unlabeled
wD217::
  ds 1 ; D217

; Unlabeled
wD218::
  ds 1 ; D218

; Current form of the Final Nightmare (0-5)
; 0=Intro
; 1=Giant Gel
; 2=Agahnim
; 3=Moldorm
; 4=Ganon/Lanmola
; 5=Dethl
wFinalNightmareForm::
  ds 1 ; D219

; Unlabeled
wD21A::
  ds 1 ; D21A

; Unlabeled
wD21B::
  ds 1 ; D21B

; Unlabeled
wD21C::
  ds 1 ; D21C

; Unlabeled
wD21D::
  ds 1 ; D21D

; Unlabeled
wD21E::
  ds 1 ; D21E

; Unlabeled
wD21F::
  ds 1 ; D21F

; Unlabeled
wD220::
  ds 1 ; D220

; Unlabeled
wD221::
  ds 1 ; D221

; Unlabeled
wD222::
  ds 1 ; D222

; Unlabeled
wD223::
  ds 1 ; D223

; Unlabeled
wD224::
  ds 1 ; D224

; Unlabeled
wD225::
  ds 1 ; D225

; Unlabeled
wD226::
  ds 1 ; D226

; Unlabeled
wD227::
  ds 1 ; D227

; Unlabeled
wD228::
  ds 1 ; D228

; not used
wD229::
  ds 215 ; D220 - D2FF

;
; Audio section
;

wAudioSection::

; Note transpose value applied to all channels. Should be multiple of 2.
wMusicTranspose::
  ds 1 ; D300

; Points to some data which somehow sets the music's speed
wMusicSpeedPointer::
  ds 2 ; D301 - D302

; not used
wD303::
  ds 4 ; D303 - D306

; Unlabeled
; ds 4 (channel-specific, used by opcode A0-AF)
wD307::
  ds 1 ; D307

; Unlabeled
wD308::
  ds 8 ; D308 - D30F

; Channel 1 data pointer
wD310::
  ds 2 ; D310 - D311

; Unlabeled
; Copied from D313. A counter?
wD312::
  ds 1 ; D312

; Unlabeled
wD313::
  ds 1 ; D313

; Unlabeled
; Channel 1 definition data pointer
wD314::
  ds 2 ; D314 - D315

; Unlabeled
; Opcode 9D stores data here.
; For channel 3, D336-D337 are a pointer to waveform data.
wD316::
  ds 1 ; D316

; Unlabeled
; Points to frequency data for NRx3 and NRx4
wD317::
  ds 3 ; D317 - D319

; Unlabeled
wD31A::
  ds 1 ; D31A

; Unlabeled
wD31B::
  ds 1 ; D31B

; Unlabeled
; Loop pointer for sound definition data?
wD31C::
  ds 2 ; D31C - D31D

; Unlabeled
; Incremented each frame?
wD31E::
  ds 1 ; D31E

; Unlabeled
; Audio loop counter; a segment loops [wD31F] times, then continues on.
wD31F::
  ds 1 ; D31F

; Unlabeled
; Channel 2 data (similar to D310)
wD320::
  ds $10 ; D320 - D32F

; Unlabeled
; Channel 3 data (similar to D310)
wD330::
  ds $10 ; D330 - D33F

; Unlabeled
; Channel 4 data (similar to D310)
wD340::
  ds 4 ; D340 - D343

; Unlabeled
wD344::
  ds 1 ; D344

; Unlabeled
wD345::
  ds 1 ; D345

; Unlabeled
wD346::
  ds 9 ; D346 - D34E

; Unlabeled
wD34F::
  ds 1 ; D34F

; Current sound channel being processed. Number from 1-4.
wActiveChannelIndex::
  ds 1 ; D350

; Unlabeled
wD351::
  ds 4 ; D351 -D354

; Unlabeled
wD355::
  ds 11 ; D355 -D35F

; The squareform jingle currently playing
wActiveJingle::
  ds 1 ; D360

; Unlabeled
; squareform jingle parameters
wD361::
  ds 7 ; D361 - D367

; The music track to be played next
wMusicTrackToPlay::
  ds 1 ; D368

; Copied from wMusicTrackToPlay
wActiveMusicIndex::
  ds 1 ; D369

; Unlabeled
wD36A::
  ds 1 ; D36A

; Unlabeled
wD36B::
  ds 1 ; D36B

; Unlabeled
wD36C::
  ds 1 ; D36C

; Unlabeled
wD36D::
  ds 1 ; D36D

; Unlabeled
wD36E::
  ds 1 ; D36E

; Unlabeled
wD36F::
  ds 1 ; D36F

; The waveform sound effect currently playing
wActiveWaveSfx::
  ds 1 ; D370

; wave sound effect parameters
wD371::
  ds 7 ; D371 - D377

; The noise generator sound effect currently playing
wActiveNoiseSfx::
  ds 1 ; D378

; Unlabeled
; noise sound effect parameters?
wD379::
  ds 23 ; D379 - D38F

; Unlabeled
wD390::
  ds 1 ; D390

; Unlabeled
wD391::
  ds 1 ; D391

; Unlabeled
wD392::
  ds 1 ; D392

; Unlabeled
wD393::
  ds 1 ; D393

; Unlabeled
wD394::
  ds 2 ; D394

; Unlabeled
wD396::
  ds 2 ; D396 - D397

; Unlabeled
wD398::
  ds 6 ; D398 - D39D

; Unlabeled
; Set to 1 by opcode 99, 0 by opcode 9A.
; Enabled "envelope" behaviour of channel 3?
wD39E::
  ds 1 ; D39E

; Unlabeled
wD39F::
  ds 1 ; D39F

; Unlabeled
wD3A0::
  ds 1 ; D3A0

; Unlabeled
wD3A1::
  ds 1 ; D3A1

; Unlabeled
wD3A2::
  ds 1 ; D3A2

; Unlabeled
wD3A3::
  ds 1 ; D3A3

; Unlabeled
wD3A4::
  ds 2 ; D3A4 - D3A5

; Unlabeled
wD3A6::
  ds 9 ; D3A6 - D3AE

; Unlabeled
wD3AF::
  ds 1 ; D3AF

; Unlabeled
wD3B0::
  ds 6 ; D3B0 - D3B5

; Unlabeled
; music channel-specific data
wD3B6::
  ds 6 ; D3A6 - D3BB

; Unlabeled
wD3BC::
  ds 1 ; D3BC

; Unlabeled
wD3BD::
  ds 1 ; D3BD

; Unlabeled
wD3BE::
  ds 1 ; D3BE

; Unlabeled
wD3BF::
  ds 1 ; D3BF

; Unlabeled
wD3C0::
  ds 1 ; D3C0

; Unlabeled
wD3C1::
  ds 1 ; D3C1

; Unlabeled
wD3C2::
  ds 1 ; D3C2

; Unlabeled
wD3C3::
  ds 1 ; D3C3

; Unlabeled
wD3C4::
  ds 1 ; D3C4

; Unlabeled
wD3C5::
  ds 1 ; D3C5

; Unlabeled
wD3C6::
  ds 1 ; D3C6

; Unlabeled
wD3C7::
  ds 1 ; D3C7

; Unlabeled
wD3C8::
  ds 1 ; D3C8

; Unlabeled
wD3C9::
  ds 1 ; D3C9

; Unlabeled
; Copied from wActiveMusicIndex (a music index)
wD3CA::
  ds 1 ; D3CA

; Copied from $D3CA
; The music track that was playing previously.
wPreviousMusicTrack::
  ds 1 ; D3CB

; not used
wD3CC::
  ds 1 ; D3CC

; Unlabeled
wD3CD::
  ds 1 ; D3CD

; TODO comment
wActiveMusicTable::
  ds 2 ; D3CE - D3CF

; Unlabeled
wD3D0::
  ds 6 ; D3D0 - D3D5

; Unlabeled
wD3D6::
  ds 1 ; D3D6

; Unlabeled
wD3D7::
  ds 2 ; D3D7

wActiveMusicTableIndex:: ; D3D9
  ; Set to 1 by opcode 94
  ds 1

; Unlabeled
wD3DA::
  ds 2 ; D3DA - D3DB

; Unlabeled
wD3DC::
  ds 1 ; D3DC

; Unlabeled
wD3DD::
  ds 1 ; D3DD

; Unlabeled
wD3DE::
  ds 1 ; D3DE

; Unlabeled
wD3DF::
  ds 1 ; D3DF

; Unlabeled
wD3E0::
  ds 1 ; D3E0

; Unlabeled
wD3E1::
  ds 1 ; D3E1

; Unlabeled
wD3E2::
  ds 4 ; D3E2 - D3E5

; Unlabeled
wD3E6::
  ds 1 ; D3E6

; Unlabeled
wD3E7::
  ds 1 ; D3E7

; Unlabeled
wD3E8::
  ds 1 ; D3E8

; Unlabeled
wD3E9::
  ds 24 ; D3E9 - D400

; Room warps
; Each room can have 4 warp points. The room warps destination are defined below,
; and the warp positions is defined at D416-D419.
wWarpStructs::

; Warp 0
wWarp0MapCategory::
  ds 1 ; D401
wWarp0Map::
  ds 1 ; D402
wWarp0Room::
  ds 1 ; D403
wWarp0DestinationX::
  ds 1 ; D404
wWarp0DestinationY::
  ds 1 ; D405

; Warp 1
wWarp1MapCategory::
  ds 1 ; D406
wWarp1Map::
  ds 1 ; D407
wWarp1Room::
  ds 1 ; D408
wWarp1DestinationX::
  ds 1 ; D409
wWarp1DestinationY::
  ds 1 ; D40A

; Warp 2
wWarp2MapCategory::
  ds 1 ; D40B
wWarp2Map::
  ds 1 ; D40C
wWarp2Room::
  ds 1 ; D40D
wWarp2DestinationX::
  ds 1 ; D40E
wWarp2DestinationY::
  ds 1 ; D40F

; Warp 3
wWarp3MapCategory::
  ds 1 ; D410
wWarp3Map::
  ds 1 ; D411
wWarp3Room::
  ds 1 ; D412
wWarp3DestinationX::
  ds 1 ; D413
wWarp3DestinationY::
  ds 1 ; D414

; Kill count, to tell if a Piece of Power should be dropped
wPieceOfPowerKillCount::
  ds 1 ; D415

; TODO comment
wWarpPositions::
; Position of warp 0, as a tile index on the map
wWarp0PositionTileIndex::
  ds 1 ; D416

; Position of warp 1, as a tile index on the map
wWarp1PositionTileIndex::
  ds 1 ; D417

; Position of warp 2, as a tile index on the map
wWarp2PositionTileIndex::
  ds 1 ; D418

; Position of warp 3, as a tile index on the map
wWarp3PositionTileIndex::
  ds 1 ; D419

; not used
wD41A::
  ds 68 ; D41A - D45D

; Unlabeled
wD45E::
  ds 1 ; D45E

; Unlabeled
wD45F::
  ds 1 ; D45F

; Unlabeled
wD460::
  ds 1 ; D460

; Unlabeled
wD461::
  ds 1 ; D461

; Each frame decrements the value.
; When reaching 0, play the compass sfx.
wCompassSfxCountdown::
  ds 1 ; D462

; Temporary copy of wLinkMotionState, used in various cases.
wD463::
  ds 1 ; D463

; Unlabeled
wD464::
  ds 1 ; D464

; Unlabeled
wD465::
  ds 1 ; D465

; Unlabeled
wD466::
  ds 1 ; D466

; not used
wD467::
  ds 1 ; D467

; Unlabeled
wD468::
  ds 1 ; D463

; not used
wD469::
  ds 2 ; D469 - D46A

; Unlabeled
wD46B::
  ds 1 ; D46B

; A boss was just defeated
wBossDefeated::
  ds 1 ; D46C

; not used
wD45D::
  ds 4 ; D45D - D470

; Increases on each kill. Reset to 0 when hit, or when it hits 12 a guardian acorn is spawned.
wGuardianAcornCounter::
  ds 1 ; D471

; Signpost maze: current goal
wMazeSignpostGoal::
  ds 1 ; D472

; Signpost maze: sign activated by Link
wMazeSignpostPos::
  ds 1 ; D473

; Unlabeled
wD474::
  ds 1 ; D474

; If non-zero, Link will be animated to rotate on itself
wD475::
  ds 1 ; D475

; not used
wD476::
  ds 1 ; D476

; Unlabeled
wD477::
  ds 1 ; D477

; Unlabeled
wD478::
  ds 1 ; D478

; What index the B + SELECT warp tool is at (00~0B)
wDebugWarpIndex::
  ds 1 ; D479

; Power-ups are disabled after 3 hits are taken from enemies
wPowerUpHits::
  ds 1 ; D47A

; If not zero, force the music track to change when displaying the file selections screen
wForceFileSelectionScreenMusic::
  ds 1 ; D47B

; 0 = No power-up
; 1 = Piece of Power
; 2 = Guardian Acorn
wActivePowerUp::
  ds 1 ; D47C

; Unlabeled
wD47D::
  ds 1 ; D47D

; TODO comment
wDidStealItem::
  ds 1 ; D47E

; Unlabeled
wD47F::
  ds 1 ; D47F

; TODO comment
wDungeonMinimap::
  ds $40 ; D480 - D4DF

; not used
wD4C0::
  ds $40 ; D4C0 - D4FF

; BG tilemap under a dialog box?
wD500::
  ds $80 ; D500 - D57F

; Entities hitboxes.
; Each hitbox is a tuple of 4 bytes: x, y, width and height.
wEntitiesHitboxPositionTable::
  ds MAX_ENTITIES * 4 ; D580 - D5DF

; Unlabeled
wD5C0:
  ds 2 ; D5C0 - D5C1

; Unlabeled
wD5C2::
  ds 2 ; D5C2

; not used
wD5C4::
  ds 60 ; D5C4 - D600

;
; Data structures for copying data to VRAM (tilemaps or tile data) during blanking times.
;
; The game mostly uses these commands to copy tilemaps; hence the modes to copy either rows or
; columns of data. However it is also occasionally used to copy tile data (the actual pixels),
; the most common example being the dialog letters.
;
; Draw commands are either decoded from static data (like the rooms objects), or built
; dynamically at runtime (like the inventory).
;
; There can be several wDrawCommands stacked together in this area.
;

wDrawCommandsSection::

; Size of all cumulated wDrawCommandsSize
; When 0, no wDrawCommand is executed on vblank.
wDrawCommandsSize::
  ds 1 ; D600

; Format of a wDrawCommand data structure
; (This is the address of first one in memory; but several of them can be stacked.)
wDrawCommand::
; Request destination address high byte
.destinationHigh
  ds 1 ; D601
; Request destination address low byte
.destinationLow
  ds 1 ; D602
; Request data length and mode.
; bits 0-5: data length,
; bits 6-7: copy mode (see DC_* constants)
.length
  ds 1 ; D603
; Request data
;
; There are $4F bytes reserved for data - except when drawing
; the dungeon minimap, where the end of the data is used as a temporary
; buffer to store the minimap tilemap.
.data
UNION
  ds $F4  ; D604 - D6F7
NEXTU
  ds $4D ; D604 - D651
; Temporary storage for the tilemap of the dungeon minimap.
wMinimapTilemap::
  ds $A7 ; D651 - D6F7
ENDU

; Animation stage during a switchable object animation.
;
; Incremented each frame, but may also be set manually to
; skip most of the animation and reach the final state directly.
;
; Values go from 1 to 9
wSwitchableObjectAnimationStage::
  ds 1 ; D6F8

; Unlabeled
wLinkStandingOnSwitchBlock::
  ds 1 ; D6F9

; Is there one or more switchable objects in the room
; See ROOM_SWITCHABLE_OBJECT_* constants
wRoomSwitchableObject::
  ds 1 ; D6FA

; State of switch blocks.
;
; Values:
;  0  blocks of kind A lowered, blocks of kind B raised
;  2  blocks of kind A raised, blocks of kind B lowered
wSwitchBlocksState::
  ds 1 ; D6FB

; TODO comment
wEnginePaused::
  ds 1 ; D6FC

; TODO comment
wLCDControl::
  ds 1 ; D6FD

; Index of a tileset that will by copied to VRAM on next vblank.
; See possible values at TilesetLoadHandlersTable
wTilesetToLoad::
  ds 1 ; D6FE

; Index of a tilemap that will be copied to VRAM on next vblank.
; See TILEMAP_* constants for possible values.
wBGMapToLoad::
  ds 1 ; D6FF

; Memory region reserved for map objects of the active room.
; Actual objects are surrounded by FF values (see wRoomObjects)
;
; When loading a new room, room data is read and decoded into this
; area.
;
; Notes on wram shiftability:
; - This area is also used in RAM bank 2, where it contains the object attributes.
; - wRoomObjectsArea must be $10-bytes aligned (otherwise various copy loops break)
;
; First section is FF values padding…
wRoomObjectsArea::
  ds $11 ; D700 - D710

; Start of the actual map objects for the active room (ignoring the surrounding FF values)
wRoomObjects::
  ds $EF ; D711 - D7FF

; World rooms status
; Each room is a byte combining ROOM_STATUS_* constants.
wOverworldRoomStatus::
  ds $100 ; D800 - D8FF

; TODO comment
wIndoorARoomStatus::
  ds $100 ; D900

; TODO comment
wIndoorBRoomStatus::
  ds $100 ; DA00

; TODO comment
wInventoryItems::
.BButtonSlot::
  ds 1 ; DB00

; TODO comment
.AButtonSlot::
  ds 1 ; DB01

; TODO comment
.subscreen
  ds INVENTORY_SLOT_COUNT - 2 ; DB02-DB0B

; TODO comment
wHasFlippers::
  ds 1 ; DB0C

; TODO comment
wHasMedicine::
  ds 1 ; DB0D

; Trade Sequence items.
; See TRADING_ITEM_* constants for possible values.
wTradeSequenceItem::
  ds 1 ; DB0E

; TODO comment
wSeashellsCount::
  ds 1 ; DB0F

; Unlabeled - Spacing byte used to check for dungeon map during InventoryDisplayLoop
wDB10::
  ds 1

; TODO comment
wHasTailKey::
  ds 1 ; DB11

; TODO comment
wHasAnglerKey::
  ds 1 ; DB12

; TODO comment
wHasFaceKey::
  ds 1 ; DB13

; TODO comment
wHasBirdKey::
  ds 1 ; DB14

; Golden Leaves count:
; 0-5 = number of Golden Leaves,
; 6 = Slime Key
wGoldenLeavesCount::
  ds 1 ; DB15

; Beginning of dungeon item flags.
; 5 bytes for each dungeon.
; For each dungeon:
; byte 0 = has map?,
; byte 1 = has compass?
; byte 2 = has stone slab?,
; byte 3 = has boss key?,
; byte 4 = small keys count
wDungeonItemFlags::
  ds $2D ; DB16 - DB42

; TODO comment
wPowerBraceletLevel::
  ds 1 ; DB43

; TODO comment
wShieldLevel::
  ds 1 ; DB44

; TODO comment
wArrowCount::
  ds 1 ; DB45

; Set to 1 when you steal from the shop.
; Set back to zero when the shopkeeper kills you.
wHasStolenFromShop::
  ds 1 ; DB46

; Unlabeled
wDB47::
  ds 1 ; DB47

; Tarin activity flag possible values:
; 0 = Zero at game start. Tarin hasn't been cured of Raccoon.
; 1 = Set to 1 as Tarin turns back into human form from the Magic Powder.
; 2 = Set to 2 after getting Instrument 2 and being ejected from the dungeon.
; primarily used by Tarin to determine what he's doing inside his house
wTarinFlag::
  ds 1 ; DB48

; $0111 means that the player has every song.
;   bit 0: has Frog's Song of the Soul
;   bit 1: has Manbo's Mambo
;   bit 2: has Ballad of the Wind Fish
wOcarinaSongFlags::
  ds 1 ; DB49

; Which song is selected (zero based)
wSelectedSongIndex::
  ds 1 ; DB4A

; 0 means that the player does not have the Toadstool
; 1 means that the player has the Toadstool
wHasToadstool::
  ds 1 ; DB4B

; TODO comment
wMagicPowderCount::
  ds 1 ; DB4C

; TODO comment
wBombCount::
  ds 1 ; DB4D

; Set to 1 when Link retrieves his sword on the beach
wSwordLevel::
  ds 1 ; DB4E

; The player's name
; Name is padded with $00 (spaces) to the max length (default length is 5)
wName::
  ds NAME_LENGTH ; DB4F - DB53

; Unlabeled
; some kind of map index entry
wDB54::
  ds 1 ; DB54

; Indicates if we have spoken with richard.
; 1 = indicates spoken with grandpa ulrira in his own house, but does not seem to be used anywhere.
; 2 = means spoken with richard, changes the telephone message.
wRichardSpokenFlag::
  ds 1 ; DB55

; Bow-Wow status.
; Values:
;  00 = not following Link,
;  01 = Bow-Wow is following Link,
;  80 = Bow-Wow has been kidnapped
wIsBowWowFollowingLink::
  ds 1 ; DB56

; Current file death count (first is low, second is high, third is unused)
wDeathCount::
  ds 3 ; DB57 DB58 DB59

; Amount of health ($08 = 1 heart)
wHealth::
  ds 1 ; DB5A

; Maximum number of hearts
wMaxHearts::
  ds 1 ; DB5B

; TODO comment
wHeartPiecesCount::
  ds 1 ; DB5C

; Higher digits of the player rupees count
wRupeeCountHigh::
  ds 1 ; DB5D

; Lower digits of the player rupees count
wRupeeCountLow::
  ds 1 ; DB5E

; Define Link's spawn position
; Used when loading a save file or after a game over
wSpawnLocationData::
; TODO comment
wSpawnIsIndoor::
  ds 1 ; DB5F

; TODO comment
wSpawnMapId::
  ds 1 ; DB60

; TODO comment
wSpawnMapRoom::
  ds 1 ; DB61

; If 0, will load the pre-defined save file
wSpawnPositionX::
  ds 1 ; DB62

; If 0, will load the pre-defined save file
wSpawnPositionY::
  ds 1 ; DB63

; TODO comment
wSpawnIndoorRoom::
  ds 1 ; DB64

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument1::
  ds 1 ; DB65

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument2::
  ds 1 ; DB66

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument3::
  ds 1 ; DB67

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument4::
  ds 1 ; DB68

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument5::
  ds 1 ; DB69

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument6::
  ds 1 ; DB6A

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: has instrument
; bit 2: is eagle's tower collapsed
; 0 = false
wHasInstrument7::
  ds 1 ; DB6B

; @TODO Dungeon 1-9 *flags*, not instrument checks
; bit 0: miniboss clear
; bit 1: set if true
; bit 2: (?)
; 0 = false
wHasInstrument8::
  ds 1 ; DB6C

; Unlabeled
wDB6D:
  ds 1 ; D86D

; TODO comment
wIsThief::
  ds 1 ; DB6E

; TODO comment
wWreckingBallRoom:
  ds 1 ; DB6F

; TODO comment
wWreckingBallPosX:
  ds 1 ; DB70

; TODO comment
wWreckingBallPosY:
  ds 1 ; DB71

; TODO comment
wNumberOfDungeon7PillarsDestroyed:
  ds 1 ; DB72

; TODO comment
wIsMarinFollowingLink::
  ds 1 ; DB73

; Whether Marin is in Animal Village
wIsMarinInAnimalVillage::
  ds 1 ; DB74

; Total number of medicine ever purchased from Crazy Tracy
wPurchasedMedicineCount::
  ds 1 ; DB75

; TODO comment
wMaxMagicPowder::
  ds 1 ; DB76

; Maximum number of bombs that Link can carry
wMaxBombs::
  ds 1 ; DB77

; TODO comment
wMaxArrows::
  ds 1 ; DB78

; TODO comment
wIsGhostFollowingLink::
  ds 1 ; DB79

; Zero: The ghost wants to go to House by the Bay
; Non-zero: ... to his grave in Kohilint Prairie
wGhostSeeksGrave::
  ds 1 ; DB7A

; TODO comment
wIsRoosterFollowingLink::
  ds 1 ; DB7B

; Offset in the WindFishEggMazeSequence table, set to a random value chosen from $00 $08 $10 $18
wWindFishEggMazeSequenceOffset:
  ds 1 ; D87C

; Stores the inventory item that you traded for the boomerang.
; Initially this value is zero, indicating no trade. But after you traded the boomerang
; back it will be INVENTORY_BOOMERANG
wBoomerangTradedItem::
  ds 1 ; DB7D

; Switches between 4 different hints for one of the kids throwing the ball
wKidSaveHintIndex::
  ds 1 ; DB7E

; Set to $01 or $02 if you handed over your trade sequence item to someone and have not gotten the next one yet.
; wTradeSequenceItem will still indicate where you are in the sequence, and wExchangingTradeSequenceItem will hide the item from your inventory menu.
wExchangingTradeSequenceItem::
  ds 1 ; DB7F

; Names of the saved files.
; (outside the area that is stored in the savegame)
wSaveSlotNames::

; Name of the file in save slot 1
wSaveSlot1Name::
  ds 5 ; DB80 - DB84

; Name of the file in save slot 2
wSaveSlot2Name::
  ds 5 ; DB85 - DB89

; Name of the file in save slot 3
wSaveSlot3Name::
  ds 5 ; DB8A - DB8E

; Higher digits of the amount of rupees to be added to your wallet (high digits)
wAddRupeeBufferHigh::
  ds 1 ; DB8F

; Amount of rupees to be added to your wallet (low digits)
wAddRupeeBufferLow::
  ds 1 ; DB90

; Amount of rupees to be removed from your wallet (high digits)
wSubstractRupeeBufferHigh::
  ds 1 ; DB91

; Amount of rupees to be removed from your wallet (low digits)
wSubstractRupeeBufferLow::
  ds 1 ; DB92

; Amount of health to be added to your health total (wHealth)
wAddHealthBuffer::
  ds 1 ; DB93

; Amount of health to be removed from your health total (wHealth)
wSubtractHealthBuffer::
  ds 1 ; DB94

; See GAMEPLAY_* constants for possible values
wGameplayType::
  ds 1 ; DB95

; Value depends on GameplayType: this can be a sequence index, or a frame counter.
wGameplaySubtype::
  ds 1 ; DB96

; BG grayscale palette (DMG only)
; Copied to rBGP on every frame.
wBGPalette::
  ds 1 ; DB97

; OBJ0 grayscale palette (DMG only)
; Copied to rOBP0 on every frame.
wOBJ0Palette::
  ds 1 ; DB98

; OBJ1 grayscale palette (DMG only)
; Copied to rOBP& on every frame.
wOBJ1Palette::
  ds 1 ; DB99

; TODO comment
wWindowY::
  ds 1 ; DB9A

; not used
wDB9A::
  ds 1

; Initial room of Link when loading a new map
wMapEntranceRoom::
  ds 1 ; DB9C

; Initial position of Link when loading a new map
wMapEntrancePositionX::
  ds 1 ; DB9D

; Initial position of Link when loading a new map
wMapEntrancePositionY::
  ds 1 ; DB9E

; not used
wDB9F::
  ds 4 ; DB9F - DBA2

; Selected index in the inventory menu
wInventorySelection::
  ds 1 ; DBA3

; not used
wDBA4::
  ds 1 ; DBA4

; 0 = the overworld
; 1 = interior maps (house, dungeons, etc)
wIsIndoor::
  ds 1 ; DBA5

; The currently selected save slot, or file menu item
;
; 0 = The first save file
; 1 = The second save file
; 2 = The third save file
; 3 = The COPY/ERASE file menu item
;     (see wIsFileSelectionArrowShifted)
wSaveSlot::
  ds 1 ; DBA6

; Bitfield that indicates which save files have been
; initialized/created, ie. the following values OR-ed together:
;
; 1 = The first save file has been initialized
; 2 = The second save file has been initialized
; 4 = The third save file has been initialized
wSaveFilesCount::
  ds 1 ; DBA7

; Unused
wDBA8::
  ds 1 ; DBA8

; The currently selected character in the name entry menu
wNameEntryCurrentChar::
  ds 1 ; DBA9

; The current character in the save slot name
wSaveSlotNameCharIndex::
  ds 1 ; DBAA

; Unused
wDBAB::
  ds 1 ; DBAB

; Unlabeled
wDBAC::
  ds 2 ; DBAC - DBAD

; TODO comment
wIndoorRoom::
  ds 1 ; DBAE

; TODO comment
wCurrentBank::
  ds 1 ; DBAF

; Layout of the dungeon map in the inventory.
; See INVENTORY_MINIMAP_* constants for values
wMinimapLayout::
  ds 1 ; DBB0

; The position at which Link entered on a map.
; (used for reseting Link's position after a fall)
wLinkMapEntryPositionX::
  ds 1 ; DBB1

; The position at which Link entered on a map.
; (used for reseting Link's position after a fall)
wLinkMapEntryPositionY::
  ds 1 ; DBB2

; not used
wDBB3::
  ds 1 ; DBB3

; Unlabeled
wDBB4::
  ds 1 ; DBB4

; The number of enemies killed, which is also used as an index into
; the wKillOrder array.
; Reset when loading a new indoor room, but not in the overworld,
; which can cause an overflow, which can result in the so called
; "Tunic Glitch" bug when 90 enemies are killed and wTunicType is
; overwritten.
wKillCount::
  ds 1 ; DBB5

; An array of enemy IDs in the order they were killed.
; Used by CheckKillInOrderTrigger (the TRIGGER_KILL_IN_ORDER puzzle
; in Bottle Grotto).
wKillOrder::
  ds $11 ; DBB6 - DBC6
.end:

; TODO comment
wInvincibilityCounter::
  ds 1 ; DBC7

; Initial position of Link when loading a new map
wMapEntrancePositionZ::
  ds 1

; TODO comment
wTorchesCount::
  ds 1 ; DBC9

; not used
wDBCA::
  ds 1 ; DBCA

; Physics flags of the object under Link when falling down.
; Also set by entities that make Link fall down, such as Facade's pits
; See OBJ_PHYSICS_* constants for possible values.
wLinkFallingDownObjectPhysics::
  ds 1 ; DBCB

; A table of five items flags for the current dungeon
; See also: wDungeonItemFlags
wCurrentDungeonItemFlags::
; TODO comment
wHasDungeonMap::
  ds 1 ; DBCC

; TODO comment
wHasDungeonCompass::
  ds 1 ; DBCD

; TODO comment
wHasDungeonStoneSlab::
  ds 1 ; DBCE

; TODO comment
wHasDungeonBossKey::
  ds 1 ; DBCF

; TODO comment
wSmallKeysCount::
  ds 1 ; DBD0

; Unlabeled
wDBD1::
  ds $2F ; DBD1 - DBFF

; TODO comment
wFile1DeathCountHigh::
  ds 1 ; DC00

; TODO comment
wFile1DeathCountLow::
  ds 1 ; DC01

; TODO comment
wFile2DeathCountHigh::
  ds 1 ; DC02

; TODO comment
wFile2DeathCountLow::
  ds 1 ; DC03

; TODO comment
wFile3DeathCountHigh::
  ds 1 ; DC04

; TODO comment
wFile3DeathCountLow::
  ds 1 ; DC05

; Amount of health for file 1, needs to be wFile1MaxHearts * 8 or the game crashes while drawing the file selection menu
wFile1Health::
  ds 1 ; DC06

; Amount of health for file 2, needs to be wFile2MaxHearts * 8 or the game crashes while drawing the file selection menu
wFile2Health::
  ds 1 ; DC07

; Amount of health for file 3, needs to be wFile3MaxHearts * 8 or the game crashes while drawing the file selection menu
wFile3Health::
  ds 1 ; DC08

; Amount of maximum hearts for file 1, used to draw the hearts on the file selection menu
wFile1MaxHearts::
  ds 1 ; DC09

; Amount of maximum hearts for file 2, used to draw the hearts on the file selection menu
wFile2MaxHearts::
  ds 1 ; DC0A

; Amount of maximum hearts for file 3, used to draw the hearts on the file selection menu
wFile3MaxHearts::
  ds 1 ; DC0B

; Photos 1-8 (bitfield)
wPhotos1::
  ds 1 ; DC0C

; Photos 9-12 (bitfield)
wPhotos2::
  ds 1 ; DC0D

; Unlabeled
wDC0E::
  ds 1 ; DC0E

; Tunic Type (GBC only):
; 0 = green,
; 1 = red,
; 2 = blue
;
; Other valid values (don't occur naturally, but can be set by the "Tunic Glitch" bug
; when wKillOrder overflows into this memory location):
; 3 = inverted red,
; 4 = inverted blue,
;
; Other values are also possible, but their effects will depend on the currently active
; palettes.
wTunicType::
  ds 1 ; DC0F

; The buffer containing the 8 background palettes follow. 8 bytes per palette.
wBGPal1::
  ds 8 ; DC10 - DC17
wBGPal2::
  ds 8 ; DC18 - DC1F
wBGPal3::
  ds 8 ; DC20 - DC27
wBGPal4::
  ds 8 ; DC28 - DC2F
wBGPal5::
  ds 8 ; DC30 - DC37
wBGPal6::
  ds 8 ; DC38 - DC3F
wBGPal7::
  ds 8 ; DC40 - DC47
wBGPal8::
  ds 8 ; DC48 - DC4F

; The buffer containing the 8 object palettes follow. 8 bytes per palette.
wObjPal1::
  ds 8 ; DC50 - DC57
wObjPal2::
  ds 8 ; DC58 - DC5F
wObjPal3::
  ds 8 ; DC60 - DC67
wObjPal4::
  ds 8 ; DC68 - DC6F
wObjPal5::
  ds 8 ; DC70 - DC77
wObjPal6::
  ds 8 ; DC78 - DC7F
wObjPal7::
  ds 8 ; DC80 - DC87
wObjPal8::
  ds 8 ; DC88 - DC8F

; This is a 2nd draw to VRAM command. See wDrawCommand for details.
; This draws to VRAM1 instead of VRAM0, used to update tile attributes on GBC.

; Size of all cumulated wDrawCommandsSize
; When 0, no wDrawCommand is executed on vblanks
wDrawCommandsVRAM1Size::
  ds 1 ; DC90

; Secondary wDrawCommand destination (higher byte)
wDrawCommandVRAM1::
.destinationHigh
  ds 1 ; DC91
; Secondary wDrawCommand destination (lower byte)
.destinationLow
  ds 1 ; DC92
; Secondary wDrawCommand data length and options
; bits 0-6: data length,
; bits 7-8: copy mode (see BG_COPY_MODE_* constants)
.length
  ds 1 ; DC93
; Secondary wDrawCommand data
.data
  ds $2C ; DC93 - DCBF

; Stores the 4 animated tiles for belts that are scrolled for the animation.
wAnimatedScrollingTilesStorage::
  ds $10 ; DCC0 - DCCE

.tile1::
  ds $10 ; DCD0 - DCDF

.tile2::
  ds $10 ; DCE0 - DCEF
.tile3::
  ds $10 ; DCF0 - DCFF

; Unused data?
  ds $D1 ; DD00 - DDD0

; Palette flags for copying palettes to hardware.
; bit 0: If set, copy background palette to hardware during vblank
; bit 1: If set, copy object palette to hardware during vblank
; bit 7: If set, do a partial copy specified by wPalettePartialCopyColorIndexStart and wPalettePartialCopyColorCount
wPaletteDataFlags::
  ds 1 ; DDD1

; Indicates that the palette for the given tile map should
; be loaded on the next render loop
wPaletteToLoadForTileMap::
  ds 1 ; DDD2

; Palete color index to start copying palette data from if bit 7 is set in wPaletteDataFlags
wPalettePartialCopyColorIndexStart::
  ds 1 ; DDD3

; Amount of colors to copy if bit 7 is set in wPaletteDataFlags
wPalettePartialCopyColorCount::
  ds 1 ; DDD4

; TODO comment
wPaletteUnknownE::
  ds 1 ; DDD5

; Whether the palette should change during a room transition
; - bit 7: Change from dark to light
; - bit 6: Change from light to dark
; - bits 5-0: What stage the transition is on
wBGPaletteTransitionEffect::
  ds 1 ; DDD6

; Unlabeled
wDDD7::
  ds 1 ; DDD7

; Unlabeled
wDDD8::
  ds 1 ; DDD8

; Number of tomb stones correctly pushed so far.
; Values:
; 00-04 = number of correct tomb stones.
; 80 = color dungon has been opened
wColorDungonCorrectTombStones::
  ds 1 ; DDD9

; Dungeon flags for the color dungeon (map/compass/stone beak/nightmare key/small keys)
; See also: wDungeonItemFlags
wColorDungeonItemFlags::
  ds 5 ; DDDA

; Unlabeled
wDDDF:: ; DDDF
  ds 1

; Color dungeon rooms status
; See wOverworldRoomStatus
wColorDungeonRoomStatus::
  ds $20 ; DDE0

; Unlabeled
wDE00::
  ds 1 ; DE00

; Configuration struct for performing a farcall
; See the Farcall function
wFarcallParams::
; TODO comment
wFarcallBank::
  ds 1 ; DE01

; TODO comment
wFarcallAdressHigh::
  ds 1 ; DE02

; TODO comment
wFarcallAdressLow::
  ds 1 ; DE03

; TODO comment
wFarcallReturnBank::
  ds 1 ; DE04

; Counter that blocks opening the photo album again too quickly after
; closing it.
; Starts at PHOTO_ALBUM_COOLDOWN ($18 by default) and counts down to 0
wPhotoAlbumCooldown:
  ds 1 ; DE05

; Some sort of counter.
; start at 0 and counts up to 0x08
wDE06:
  ds 1 ; DE06

; mirror of wDE06
wDE07:
  ds 1 ; DE07

; Some sort of counter.
; start at 0 and counts up to 0x10
wDE08:
  ds 1 ; DE08

; mirror of wDE08
wDE09:
  ds 1 ; DE09

; BG offset for inventory ?
wDE0A:
  ds 1 ; DE0A

; introduced in __PATCH_0__
; related to evil eagle boss fight
; maybe flag to play different music in dialog before fight.
wDE0B:
  ds 1 ; DE0B

; top of WRAM is used as Stack
wStack::
  ds $DFFF - @ + 1 ; DE04 - DFFF

; init puts the SP here
DEF wStackTop EQU $DFFF

section "WRAM Bank2", wramx[$D000], bank[2]

; TODO

; Something rombank and photographs related
DEF w2_D16A EQU $D16A

