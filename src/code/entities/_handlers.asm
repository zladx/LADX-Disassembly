;
; Pointer tables to:
; - entity handlers
; - entity initialization handlers
;

; -----------------------------------------------------------------
;
; Entity handlers
;
; -----------------------------------------------------------------

; Table of entities handlers
; See ENTITY_* constants for values
EntityHandlersTable::
._00 far_pointer ArrowEntityHandler
._01 far_pointer BoomerangEntityHandler
._02 far_pointer BombEntityHandler
._03 far_pointer HookshotChainEntityHandler
._04 far_pointer MagicRodFireballEntityHandler
._05 far_pointer LiftableRockEntityHandler
._06 far_pointer PushedBlockEntityHandler
._07 far_pointer ChestWithItemEntityHandler
._08 far_pointer MagicPowderSprinkleEntityHandler
._09 far_pointer OctorokEntityHandler
._0A far_pointer OctorokRockEntityHandler
._0B far_pointer MoblinEntityHandler
._0C far_pointer MoblinArrowEntityHandler
._0D far_pointer TektiteEntityHandler
._0E far_pointer LeeverEntityHandler
._0F far_pointer ArmosStatueEntityHandler
._10 far_pointer HidingGhiniEntityHandler
._11 far_pointer GiantGhiniEntityHandler
._12 far_pointer GhiniEntityHandler
._13 far_pointer HeartContainerSpriteVariants
._14 far_pointer MoblinSwordEntityHandler ; $14
._15 far_pointer AntiFairyEntityHandler
._16 far_pointer SparkClockwiseEntityHandler
._17 far_pointer SparkCounterClockwiseEntityHandler
._18 far_pointer PolsVoiceEntityHandler ; $18
._19 far_pointer KeeseEntityHandler
._1A far_pointer StalfosAggressiveEntityHandler
._1B far_pointer ZolEntityHandler
._1C far_pointer GelEntityHandler ; $1C
._1D far_pointer_null
._1E far_pointer StalfosEvasiveEntityHandler
._1F far_pointer GibdoEntityHandler
._20 far_pointer HardHatBeetleEntityHandler ; $20
._21 far_pointer WizrobeEntityHandler
._22 far_pointer WizrobeProjectileEntityHandler
._23 far_pointer LikeLikeEntityHandler
._24 far_pointer IronMaskEntityHandler ; $24
._25 far_pointer EntityExplosionSpriteVariants ; small exploding ennemy
._26 far_pointer EntityExplosionSpriteVariants ; small exploding ennemy 2
._27 far_pointer SpikeTrapEntityHandler
._28 far_pointer MimicEntityHandler ; $28
._29 far_pointer MiniMoldormEntityHandler
._2A far_pointer LaserEntityHandler
._2B far_pointer LaserBeamEntityHandler
._2C far_pointer SpikedBeetleEntityHandler ; $2C
._2D far_pointer DroppableHeartEntityHandler
._2E far_pointer DroppableRupeeEntityHandler
._2F far_pointer DroppableFairyEntityHandler
._30 far_pointer KeyDropPointEntityHandler ; $30
._31 far_pointer SwordShieldPickableEntityHandler
._32 far_pointer IronMasksMaskEntityHandler
._33 far_pointer PieceOfPowerEntityHandler
._34 far_pointer GuardianAcornEntityHandler ; $34
._35 far_pointer HeartPieceEntityHandler
._36 far_pointer HeartContainerEntityHandler
._37 far_pointer DroppableArrowsEntityHandler
._38 far_pointer DroppableBombsEntityHandler ; $38
._39 far_pointer SirensInstrumentEntityHandler
._3A far_pointer SleepyToadstoolEntityHandler
._3B far_pointer DroppableMagicPowderEntityHandler
._3C far_pointer HidingSlimeKeyEntityHandler ; $3C
._3D far_pointer DroppableSeashellEntityHandler
._3E far_pointer MarinEntityHandler
._3F far_pointer TarinEntityHandler
._40 far_pointer WitchEntityHandler ; $40
._41 far_pointer OwlEventEntityHandler
._42 far_pointer OwlStatueEntityHandler
._43 far_pointer SeashellMansionTreesEntityHandler
._44 far_pointer YarnaTalkingBonesEntityHandler ; $44
._45 far_pointer BouldersEntityHandler
._46 far_pointer MovingBlockLeftTopEntityHandler
._47 far_pointer MovingBlockLeftBottomEntityHandler
._48 far_pointer MovingBlockBottomLeftEntityHandler ; $48
._49 far_pointer MovingBlockBottomRightEntityHandler
._4A far_pointer ColorDungeonBookEntityHandler
._4B far_pointer PotEntityHandler
._4C far_pointer_null
._4D far_pointer ShopOwnerEntityHandler
._4E far_pointer Disabled4EEntityHandler
._4F far_pointer TrendyGameOwnerEntityHandler
._50 far_pointer BooBuddyEntityHandler ; $50
._51 far_pointer KnightEntityHandler
._52 far_pointer TractorDeviceEntityHandler
._53 far_pointer ReversedTractorDeviceEntityHandler
._54 far_pointer FishermanFishingGameEntityHandler ; $54
._55 far_pointer BouncingBombiteEntityHandler
._56 far_pointer TimerBombiteEntityHandler
._57 far_pointer PairoddEntityHandler
._58 far_pointer PairoddProjectileEntityHandler
._59 far_pointer MoldormEntityHandler
._5A far_pointer FacadeEntityHandler
._5B far_pointer SlimeEyeEntityHandler
._5C far_pointer GenieEntityHandler ; $5C
._5D far_pointer SlimeEelEntityHandler
._5E far_pointer GhomaEntityHandler
._5F far_pointer MasterStalfosEntityHandler
._60 far_pointer DodongoSnakeEntityHandler ; $60
._61 far_pointer WarpEntityHandler
._62 far_pointer HotHeadEntityHandler
._63 far_pointer EvilEagleEntityHandler
._64 far_pointer SouthFaceShrineDoorEntityHandler ; $64
._65 far_pointer AnglerFishEntityHandler
._66 far_pointer CrystalSwitchEntityHandler
._67 far_pointer Entity67Handler
._68 far_pointer HookshotBridgeHandler
._69 far_pointer MovingBlockMoverEntityHandler
._6A far_pointer EntityRaftOwnerHandler
._6B far_pointer TextDebuggerEntityHandler
._6C far_pointer CuccoEntityHandler ; $6C
._6D far_pointer BowWowEntityHandler
._6E far_pointer ButterflyEntityHandler
._6F far_pointer DogEntityHandler
._70 far_pointer Kid70EntityHandler ; $70
._71 far_pointer Kid71EntityHandler
._72 far_pointer Kid72EntityHandler
._73 far_pointer Kid73EntityHandler
._74 far_pointer PapahlsWifeEntityHandler ; $74
._75 far_pointer GrandmaUlriraEntityHandler
._76 far_pointer MrWriteEntityHandler
._77 far_pointer GrandpaUlriraEntityHandler
._78 far_pointer YipYipEntityHandler ; $78
._79 far_pointer MadamMeowMeowEntityHandler
._7A far_pointer CrowEntityHandler
._7B far_pointer CrazyTracyEntityHandler
._7C far_pointer GiantGopongaFlowerEntityHandler ; $7C
._7D far_pointer GopongaProjectileEntityHandler
._7E far_pointer GopongaFlowerEntityHandler
._7F far_pointer TurtleRockHeadEntityHandler
._80 far_pointer TelephoneEntityHandler ; $80
._81 far_pointer RollingBonesEntityHandler
._82 far_pointer RollingBonesBarEntityHandler
._83 far_pointer DreamShrineBedEntityHandler
._84 far_pointer BigFairyEntityHandler ; $84
._85 far_pointer MrWriteBirdEntityHandler
._86 far_pointer FloatingItemEntityHandler
._87 far_pointer DesertLanmolaEntityHandler
._88 far_pointer ArmosKnightEntityHandler ; $88
._89 far_pointer HinoxEntityHandler
._8A far_pointer TileGlintShownEntityHandler
._8B far_pointer TileGlintHiddenEntityHandler
._8C far_pointer RaisableBlockShiftedRightEntityHandler ; unused
._8D far_pointer RaisableBlockShiftedDownEntityHandler ; unused
._8E far_pointer CueBallEntityHandler
._8F far_pointer MaskedMimicGoriyaEntityHandler
._90 far_pointer ThreeOfAKindEntityHandler ; $90
._91 far_pointer AntiKirbyEntityHandler
._92 far_pointer SmasherEntityHandler
._93 far_pointer MadBomberEntityHandler
._94 far_pointer KanaletBombableWallEntityHandler ; $94
._95 far_pointer RichardEntityHandler
._96 far_pointer RichardFrogEntityHandler
._97 far_pointer DivableWaterEntityHandler
._98 far_pointer HorsePieceEntityHandler ; $98
._99 far_pointer WaterTektiteEntityHandler
._9A far_pointer FlyingTilesEntityHandler
._9B far_pointer HidingZolEntityHandler
._9C far_pointer StarEntityHandler ; $9C
._9D far_pointer LiftableStatueEntityHandler
._9E far_pointer FireballShooterEntityHandler
._9F far_pointer GoombaEntityHandler
._A0 far_pointer PeaHatEntityHandler ; $A0
._A1 far_pointer SnakeEntityHandler
._A2 far_pointer PiranhaPlantEntityHandler
._A3 far_pointer SideViewPlatformHorizontalEntityHandler
._A4 far_pointer SideViewPlatformVerticalEntityHandler ; $A4
._A5 far_pointer SideViewPlatformEntityHandler
._A6 far_pointer SideViewWeightsEntityHandler
._A7 far_pointer SmashablePillarEntityHandler
._A8 far_pointer WreckingBallEntityHandler ; $A8
._A9 far_pointer BlooperEntityHandler
._AA far_pointer CheepCheepHorizontalEntityHandler
._AB far_pointer CheepCheepVerticalEntityHandler
._AC far_pointer CheepCheepJumpingEntityHandler ; $AC
._AD far_pointer KikiTheMonkeyEntityHandler
._AE far_pointer WingedOctorokEntityHandler
._AF far_pointer TradingItemEntityHandler
._B0 far_pointer PincerEntityHandler ; $B0
._B1 far_pointer HoleFillerEntityHandler
._B2 far_pointer BeetleSpawnerEntityHandler
._B3 far_pointer HoneycombEntityHandler
._B4 far_pointer TarinBeekeeperEntityHandler ; $B4
._B5 far_pointer BearEntityHandler
._B6 far_pointer PapahlEntityHandler
._B7 far_pointer MermaidEntityHandler
._B8 far_pointer FishermanUnderBridgeEntityHandler ; $B8
._B9 far_pointer BuzzBlobEntityHandler
._BA far_pointer BomberEntityHandler
._BB far_pointer BushCrawlerEntityHandler
._BC far_pointer GrimCreeperEntityHandler ; $BC
._BD far_pointer VireEntityHandler
._BE far_pointer BlainoEntityHandler
._BF far_pointer ZombieEntityHandler
._C0 far_pointer MazeSignpostEntityHandler ; $C0
._C1 far_pointer MarinAtTheShoreEntityHandler
._C2 far_pointer MarinAtTalTalHeightsEntityHandler
._C3 far_pointer MamuAndFrogsEntityHandler
._C4 far_pointer WalrusEntityHandler ; $C4
._C5 far_pointer UrchinEntityHandler
._C6 far_pointer SandCrabEntityHandler
._C7 far_pointer ManboAndFishesEntityHandler
._C8 far_pointer BunnyCallingMarinEntityHandler ; $C8
._C9 far_pointer MusicalNoteEntityHandler
._CA far_pointer MadBatterEntityHandler
._CB far_pointer ZoraEntityHandler
._CC far_pointer FishEntityHandler ; $CC
._CD far_pointer BananasSchuleSaleEntityHandler
._CE far_pointer MermaidStatueEntityHandler
._CF far_pointer SeashellMansionEntityHandler
._D0 far_pointer AnimalD0EntityHandler ; $D0
._D1 far_pointer AnimalD1EntityHandler
._D2 far_pointer AnimalD2EntityHandler
._D3 far_pointer BunnyD3EntityHandler
._D4 far_pointer GhostEntityHandler ; $D4
._D5 far_pointer RoosterEntityHandler
._D6 far_pointer SideViewPotEntityHandler
._D7 far_pointer ThwimpEntityHandler
._D8 far_pointer ThwompEntityHandler ; $D8
._D9 far_pointer ThwompRammableEntityHandler
._DA far_pointer PodobooEntityHandler
._DB far_pointer GiantBubbleEntityHandler
._DC far_pointer FlyingRoosterEventsEntityHandler ; $DC
._DD far_pointer BookEntityHandler
._DE far_pointer EggSongEventEntityHandler
._DF far_pointer SwordBeamEntityHandler
._E0 far_pointer MonkeyEntityHandler ; $E0
._E1 far_pointer WitchRatEntityHandler
._E2 far_pointer FlameShooterEntityHandler
._E3 far_pointer PokeyEntityHandler
._E4 far_pointer MoblinKingEntityHandler ; $E4
._E5 far_pointer FloatingItem2EntityHandler
._E6 far_pointer FinalNightmareEntityHandler
._E7 far_pointer KanaletCastleGateSwitchEntityHandler
._E8 far_pointer EndingOwlStairClimbingEntityHandler ; $E8
._E9 far_pointer ColorShellRedEntityHandler
._EA far_pointer ColorShellGreenEntityHandler
._EB far_pointer ColorShellBlueEntityHandler
._EC far_pointer ColorGhoulRedEntityHandler ; $EC
._ED far_pointer ColorGhoulGreenEntityHandler
._EE far_pointer ColorGhoulBlueEntityHandler
._EF far_pointer RotoswitchRedEntityHandler
._F0 far_pointer RotoswitchYellowEntityHandler ; $F0
._F1 far_pointer RotoswitchBlueEntityHandler
._F2 far_pointer FlyingHopperBombsEntityHandler
._F3 far_pointer HopperEntityHandler
._F4 far_pointer AvalaunchEntityHandler ; $F4
._F5 far_pointer BouncingBoulderEntityHandler
._F6 far_pointer ColorGuardianBlueEntityHandler
._F7 far_pointer ColorGuardianRedEntityHandler
._F8 far_pointer GiantBuzzBlobEntityHandler ; $F8
._F9 far_pointer HardhitBeetleEntityHandler
._FA far_pointer PhotographerEntityHandler
._FB db $F0, $EB, $5F ; unused
._FC db $50, $21, $00 ; unused
._FD db $40, $19, $19 ; unused
._FE db $19, $5E, $23 ; unused
._FF db $56, $23, $7E ; unused
.overflow db $6B, $62, $C9

func_020_4303::
    ld   a, [wC5A0]                               ;; 20:4303 $FA $A0 $C5
    ld   [wC5A1], a                               ;; 20:4306 $EA $A1 $C5
    xor  a                                        ;; 20:4309 $AF
    ld   [wC5A0], a                               ;; 20:430A $EA $A0 $C5
    ld   [wShouldGetLostInMysteriousWoods], a     ;; 20:430D $EA $0C $C1
    ldh  [hLinkSlowWalkingSpeed], a               ;; 20:4310 $E0 $B2
    ld   [wIsGelClingingToLink], a                ;; 20:4312 $EA $17 $C1
    ld   [wC19D], a                               ;; 20:4315 $EA $9D $C1
    ld   [wC147], a                               ;; 20:4318 $EA $47 $C1
    ld   [wLiftedEntityType], a                   ;; 20:431B $EA $A8 $C5
    ld   [wD45E], a                               ;; 20:431E $EA $5E $D4
    ret                                           ;; 20:4321 $C9

; -----------------------------------------------------------------
;
; Entity initialization handlers
;
; -----------------------------------------------------------------

EntityInitHandlersTable::
._00 dw   EntityInitWithRandomDirection
._01 dw   EntityInitWithRandomDirection
._02 dw   EntityInitWithRandomDirection
._03 dw   EntityInitWithRandomDirection
._04 dw   EntityInitWithRandomDirection
._05 dw   EntityInitWithRandomDirection
._06 dw   EntityInitPushedBlock
._07 dw   EntityInitChestWithItem
._08 dw   EntityInitWithRandomDirection
._09 dw   EntityInitWithCountdown
._0A dw   EntityInitWithRandomDirection
._0B dw   EntityInitWithCountdown
._0C dw   EntityInitWithRandomDirection
._0D dw   EntityInitWithRandomDirection
._0E dw   EntityInitLeever
._0F dw   EntityInitWithRandomDirection
._10 dw   EntityInitGhini
._11 dw   EntityInitGhini
._12 dw   EntityInitGhini
._13 dw   EntityInitBrokenHeartContainer
._14 dw   EntityInitMoblinSword
._15 dw   EntityInitWithRandomSpeed
._16 dw   EntityInitSparkCounterClockwise
._17 dw   EntityInitSparkClockwise
._18 dw   EntityInitWithRandomDirection
._19 dw   EntityInitWithRandomDirection
._1A dw   EntityInitWithRandomDirection
._1B dw   EntityInitZol
._1C dw   EntityInitWithRandomDirection
._1D dw   EntityInitWizrobe
._1E dw   IncrementEntityState
._1F dw   IncrementEntityState
._20 dw   EntityInitWithRandomDirection
._21 dw   EntityInitWizrobe
._22 dw   EntityInitWithRandomDirection
._23 dw   IncrementEntityState
._24 dw   EntityInitWithRandomDirection
._25 dw   EntityExplosionSpriteVariants
._26 dw   EntityExplosionSpriteVariants
._27 dw   EntityInitWithRandomDirection
._28 dw   EntityInitWithRandomDirection
._29 dw   EntityInitMiniMoldorm_trampoline
._2A dw   EntityInitWithRandomDirection
._2B dw   EntityInitWithRandomDirection
._2C dw   EntityInitWithRandomDirection
._2D dw   EntityInitDiggableBushOrPotDroppable
._2E dw   EntityInitTreeOrPotDroppable
._2F dw   EntityInitTreeOrPotDroppable
._30 dw   EntityInitKeyDropPoint
._31 dw   EntityInitSword
._32 dw   EntityInitTreeOrPotDroppable
._33 dw   EntityInitTreeOrPotDroppable
._34 dw   EntityInitTreeOrPotDroppable
._35 dw   EntityInitNoop
._36 dw   EntityInitTreeOrPotDroppable
._37 dw   EntityInitTreeOrPotDroppable
._38 dw   EntityInitTreeOrPotDroppable
._39 dw   EntityInitWithShiftedXPosition
._3A dw   EntityInitNoop
._3B dw   EntityInitDiggableBushOrPotDroppable
._3C dw   EntityInitDiggableBushOrPotDroppable
._3D dw   EntityInitSecretSeashell
._3E dw   EntityInitMarin
._3F dw   EntityInitTarin
._40 dw   EntityInitWitch
._41 dw   EntityInitOwlEvent
._42 dw   EntityInitWithRandomDirection
._43 dw   EntityInitWithShiftedXPosition
._44 dw   EntityInitNoop
._45 dw   EntityInitNoop
._46 dw   EntityInitNoop
._47 dw   EntityInitNoop
._48 dw   EntityInitNoop
._49 dw   EntityInitNoop
._4A dw   EntityInitColorDungeonBook
._4B dw   EntityInitWithRandomDirection
._4C dw   EntityInitWithRandomDirection
._4D dw   EntityInitShopOwner
._4E dw   EntityInitWithRandomDirection
._4F dw   EntityInitStoreOwner
._50 dw   EntityInitWithRandomDirection
._51 dw   EntityInitWithRandomDirection
._52 dw   EntityInitWithRandomDirection
._53 dw   EntityInitWithRandomDirection
._54 dw   EntityInitStoreOwner
._55 dw   EntityInitWithRandomDirection
._56 dw   EntityInitWithRandomDirection
._57 dw   EntityInitWithRandomDirection
._58 dw   EntityInitWithRandomDirection
._59 dw   EntityInitMoldorm_trampoline
._5A dw   EntityInitFacade_trampoline
._5B dw   EntityInitSlimeEye_trampoline
._5C dw   EntityInitGenie_trampoline
._5D dw   EntityInitSlimeEel_trampoline
._5E dw   EntityInitWithRandomDirection
._5F dw   EntityInitWithRandomDirection
._60 dw   EntityInitDodongoSnake_trampoline
._61 dw   EntityInitWarp
._62 dw   EntityInitHotHead_trampoline
._63 dw   EntityInitEvilEagle_trampoline
._64 dw   EntityInitSouthFaceShrineDoor
._65 dw   Entity67Handler_trampoline
._66 dw   EntityInitWithRandomDirection
._67 dw   EntityInitNoop
._68 dw   EntityInitNoop
._69 dw   EntityInitMovingBlockMover
._6A dw   EntityInitRaftRaftOwner
._6B dw   EntityInitNoop
._6C dw   EntityInitNoop
._6D dw   EntityInitBowWow
._6E dw   EntityInitNoop
._6F dw   EntityInitNoop
._70 dw   EntityInitNpcFacingDown
._71 dw   EntityInitKid71
._72 dw   EntityInitKid72
._73 dw   EntityInitNpcFacingDown
._74 dw   EntityInitNpcFacingDown
._75 dw   EntityInitNpcFacingDown
._76 dw   EntityInitMrWrite
._77 dw   EntityInitNpcFacingDown
._78 dw   EntityInitNoop
._79 dw   EntityInitMadamMeowMeow
._7A dw   EntityInitNoop
._7B dw   EntityInitNpcFacingDown
._7C dw   EntityInitWithShiftedPosition
._7D dw   EntityInitNoop
._7E dw   EntityInitNoop
._7F dw   EntityInitNoop
._80 dw   EntityInitTelephone
._81 dw   EntityInitNoop
._82 dw   EntityInitNoop
._83 dw   EntityInitDreamShrineBed
._84 dw   EntityInitBigFairy
._85 dw   EntityInitNoop
._86 dw   EntityInitFloatingItem
._87 dw   EntityInitDesertLanmola
._88 dw   EntityInitNoop
._89 dw   EntityInitNoop
._8A dw   EntityInitNoop
._8B dw   EntityInitNoop
._8C dw   EntityInitNoop
._8D dw   EntityInitNoop
._8E dw   EntityInitWithShiftedPosition
._8F dw   EntityInitNoop
._90 dw   EntityInitNoop
._91 dw   EntityInitAntiKirby
._92 dw   EntityInitNoop
._93 dw   EntityInitNoop
._94 dw   EntityInitNoop
._95 dw   EntityInitRichard
._96 dw   EntityInitNoop
._97 dw   EntityInitNoop
._98 dw   EntityInitHorsePiece
._99 dw   EntityInitNoop
._9A dw   EntityInitNoop
._9B dw   EntityInitNoop
._9C dw   EntityInitWithRandomSpeed
._9D dw   EntityInitNoop
._9E dw   EntityInitFireballShooter
._9F dw   EntityInitNoop
._A0 dw   EntityInitNoop
._A1 dw   EntityInitSnake
._A2 dw   EntityInitNoop
._A3 dw   EntityInitNoop
._A4 dw   EntityInitSideViewPlatformVertical
._A5 dw   EntityInitNoop
._A6 dw   EntityInitNoop
._A7 dw   EntityInitNoop
._A8 dw   EntityInitNoop
._A9 dw   EntityInitNoop
._AA dw   EntityInitNoop
._AB dw   EntityInitNoop
._AC dw   EntityInitNoop
._AD dw   EntityInitKikiTheMonkey
._AE dw   EntityInitWithRandomDirection
._AF dw   EntityInitTradingItem
._B0 dw   EntityInitNoop
._B1 dw   EntityInitNoop
._B2 dw   EntityInitNoop
._B3 dw   EntityInitWithShiftedPosition
._B4 dw   EntityInitTarinBeekeeper
._B5 dw   EntityInitNoop
._B6 dw   EntityInitNoop
._B7 dw   EntityInitNoop
._B8 dw   EntityInitFishermanUnderBridge
._B9 dw   EntityInitNoop
._BA dw   EntityInitBomber
._BB dw   EntityInitBushCrawler
._BC dw   EntityInitWithShiftedPosition
._BD dw   EntityInitNoop
._BE dw   EntityInitNoop
._BF dw   EntityInitNoop
._C0 dw   EntityInitNoop
._C1 dw   EntityInitMarinAtTheShore
._C2 dw   EntityInitMarinAtTalTalHeights
._C3 dw   EntityInitNoop
._C4 dw   EntityInitNoop
._C5 dw   EntityInitNoop
._C6 dw   EntityInitNoop
._C7 dw   EntityInitNoop
._C8 dw   EntityInitNoop
._C9 dw   EntityInitNoop
._CA dw   EntityInitNoop
._CB dw   EntityInitZora
._CC dw   EntityInitNoop
._CD dw   EntityInitNoop
._CE dw   EntityInitNoop
._CF dw   EntityInitNoop
._D0 dw   EntityInitNoop
._D1 dw   EntityInitNoop
._D2 dw   EntityInitNoop
._D3 dw   EntityInitNoop
._D4 dw   EntityInitNoop
._D5 dw   EntityInitNoop
._D6 dw   EntityInitNoop
._D7 dw   EntityInitNoop
._D8 dw   EntityInitNoop
._D9 dw   EntityInitNoop
._DA dw   EntityInitNoop
._DB dw   EntityInitWithRandomSpeed
._DC dw   EntityInitNoop
._DD dw   EntityInitNoop
._DE dw   EntityInitNoop
._DF dw   EntityInitNoop
._E0 dw   EntityInitNoop
._E1 dw   EntityInitNoop
._E2 dw   EntityInitNoop
._E3 dw   EntityInitNoop
._E4 dw   EntityInitNoop
._E5 dw   EntityInitFloatingItem2
._E6 dw   EntityInitFinalNightmare
._E7 dw   EntityInitNoop
._E8 dw   EntityInitNoop
._E9 dw   EntityInitWithRandomDirection
._EA dw   EntityInitWithRandomDirection
._EB dw   EntityInitWithRandomDirection
._EC dw   EntityInitWithRightDirection
._ED dw   EntityInitWithRightDirection
._EE dw   EntityInitWithRightDirection
._EF dw   EntityInitRotoswitchRed
._F0 dw   EntityInitRotoswitchYellow
._F1 dw   EntityInitRotoswitchBlue
._F2 dw   EntityInitFlyingHopperBombs
._F3 dw   EntityInitHopper
._F4 dw   EntityInitAvalaunch
._F5 dw   EntityInitNoop
._F6 dw   EntityInitColorGuardianBlue
._F7 dw   EntityInitColorGuardianRed
._F8 dw   EntityInitGiantBuzzBlob
._F9 dw   EntityInitHardHitBeetle
._FA dw   EntityInitNoop

; Retrieve the address of the initialization handler of a given entity.
; Input:
;   hActiveEntityType
; Returns:
;   de   an address
GetEntityInitHandler::
    ldh  a, [hActiveEntityType]                   ;; 20:4518 $F0 $EB
    ld   e, a                                     ;; 20:451A $5F
    ld   d, $00                                   ;; 20:451B $16 $00
    ld   hl, EntityInitHandlersTable              ;; 20:451D $21 $22 $43
    sla  e                                        ;; 20:4520 $CB $23
    rl   d                                        ;; 20:4522 $CB $12
    add  hl, de                                   ;; 20:4524 $19
    ld   e, [hl]                                  ;; 20:4525 $5E
    inc  hl                                       ;; 20:4526 $23
    ld   d, [hl]                                  ;; 20:4527 $56
    push de                                       ;; 20:4528 $D5
    pop  hl                                       ;; 20:4529 $E1
    ret                                           ;; 20:452A $C9
