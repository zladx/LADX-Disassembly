;
; Pointers table to entity handlers
;

; First 2 bytes: memory address; third byte: bank id
entity_pointer: macro
    db LOW(\1), HIGH(\1), BANK(\1)
endm

entity_disabled: macro
    db $00, $00, $00
endm

; Table of entities handlers
; See ENTITY_* constants for values
;
; TODO: convert the remaining raw addresses to labels
EntityPointersTable::
._00 entity_pointer ArrowEntityHandler
._01 entity_pointer BoomerangEntityHandler
._02 entity_pointer BombEntityHandler
._03 entity_pointer HookshotChainEntityHandler
._04 entity_pointer HookshotHitEntityHandler
._05 entity_pointer LiftableRockEntityHandler
._06 entity_pointer PushedBlockEntityHandler
._07 entity_pointer ChestWithItemEntityHandler
._08 entity_pointer MagicPowderSprinkleEntityHandler
._09 entity_pointer OctorockEntityHandler
._0A entity_pointer OctorockRockEntityHandler
._0B entity_pointer MoblinEntityHandler
._0C entity_pointer MoblinArrowEntityHandler
._0D entity_pointer TektiteEntityHandler
._0E entity_pointer LeeverEntityHandler
._0F entity_pointer ArmosStatueEntityHandler
._10 entity_pointer HidingGhiniEntityHandler
._11 entity_pointer GiantGhiniEntityHandler
._12 entity_pointer GhiniEntityHandler
._13 entity_pointer HeartContainerTilesTable
._14 entity_pointer MoblinSwordEntityHandler ; $14
._15 entity_pointer AntiFairyEntityHandler
._16 entity_pointer SparkClockwiseEntityHandler
._17 entity_pointer SparkCounterClockwiseEntityHandler
._18 entity_pointer PolsVoiceEntityHandler ; $18
._19 entity_pointer KeeseEntityHandler
._1A entity_pointer StalfosAggressiveEntityHandler
._1B entity_pointer GelEntityHandler
._1C entity_pointer MiniGelEntityHandler ; $1C
._1D entity_disabled
._1E entity_pointer StalfosEvasiveEntityHandler
._1F entity_pointer GibdoEntityHandler
._20 entity_pointer HardHatBeetleEntityHandler ; $20
._21 entity_pointer WizrobeEntityHandler
._22 entity_pointer WizrobeProjectileEntityHandler
._23 entity_pointer LikeLikeEntityHandler
._24 entity_pointer IronMaskEntityHandler ; $24
._25 entity_pointer EntityDestructionData ; small exploding ennemy
._26 entity_pointer EntityDestructionData ; small exploding ennemy 2
._27 entity_pointer SpikeTrapEntityHandler
._28 entity_pointer MimicEntityHandler ; $28
._29 entity_pointer MiniMoldromEntityHandler
._2A entity_pointer LaserEntityHandler
._2B entity_pointer LaserBeamEntityHandler
._2C entity_pointer SpikedBeetleEntityHandler ; $2C
._2D entity_pointer DroppableHeartEntityHandler
._2E entity_pointer DroppableRupeeEntityHandler
._2F entity_pointer DroppableFairyEntityHandler
._30 entity_pointer KeyDropPointEntityHandler ; $30
._31 entity_pointer SwordEntityHandler
._32 entity_pointer Entity32Handler
._33 entity_pointer PieceOfPowerEntityHandler
._34 entity_pointer GuardianAcornEntityHandler ; $34
._35 entity_pointer HeartPieceEntityHandler
._36 entity_pointer HeartContainerEntityHandler
._37 entity_pointer DroppableArrowsEntityHandler
._38 entity_pointer DroppableBombsEntityHandler ; $38
._39 entity_pointer SirensInstrumentEntityHandler
._3A entity_pointer SleepyToadstoolEntityHandler
._3B entity_pointer DroppableMagicPowderEntityHandler
._3C entity_pointer HidingSlimeKeyEntityHandler ; $3C
._3D entity_pointer DroppableSeashellEntityHandler
._3E entity_pointer MarinEntityHandler
._3F entity_pointer RacoonEntityHandler
._40 entity_pointer WitchEntityHandler ; $40
._41 entity_pointer OwlEventEntityHandler
._42 entity_pointer OwlStatueEntityHandler
._43 entity_pointer SeashellMansionTreesEntityHandler
._44 entity_pointer YarnaTalkingBonesEntityHandler ; $44
._45 entity_pointer BouldersEntityHandler
._46 entity_pointer MovingBlockLeftTopEntityHandler
._47 entity_pointer MovingBlockLeftBottomEntityHandler
._48 entity_pointer MovingBlockBottomLeftEntityHandler ; $48
._49 entity_pointer MovingBlockBottomRightEntityHandler
._4A db $7F, $58, $36 ; entity_pointer Entity4AHandler
._4B entity_pointer PotEntityHandler
._4C entity_disabled
._4D entity_pointer ShopOwnerEntityHandler
._4E entity_pointer Disabled4EEntityHandler
._4F entity_pointer TrendyGameOwnerEntityHandler
._50 entity_pointer BooBuddyEntityHandler ; $50
._51 entity_pointer KnightEntityHandler
._52 entity_pointer TractorDeviceEntityHandler
._53 entity_pointer ReversedTractorDeviceEntityHandler
._54 entity_pointer FishermanFishingGameEntityHandler ; $54
._55 entity_pointer BouncingBombiteEntityHandler
._56 entity_pointer TimerBombiteEntityHandler
._57 entity_pointer PairoddEntityHandler
._58 entity_pointer Entity58Handler
._59 entity_pointer MoldormEntityHandler
._5A entity_pointer FacadeEntityHandler
._5B entity_pointer SlimeEyeEntityHandler
._5C entity_pointer GenieEntityHandler ; $5C
._5D entity_pointer SlimeEelEntityHandler
._5E entity_pointer GhomaEntityHandler
._5F entity_pointer MasterStalfosEntityHandler
._60 entity_pointer DodongoSnakeEntityHandler ; $60
._61 entity_pointer WarpEntityHandler
._62 entity_pointer HotHeadEntityHandler
._63 entity_pointer EvilEagleEntityHandler
._64 entity_pointer Entity64Handler ; $64
._65 entity_pointer AnglerFishEntityHandler
._66 entity_pointer CrystalSwitchEntityHandler
._67 entity_pointer Entity67Handler
._68 entity_pointer Entity68Handler ; $68
._69 entity_pointer MovingBlockMoverEntityHandler
._6A entity_pointer EntityRaftOwnerHandler
._6B entity_pointer TextDebuggerEntityHandler
._6C entity_pointer CucooEntityHandler ; $6C
._6D entity_pointer BowWowEntityHandler
._6E entity_pointer ButterflyEntityHandler
._6F entity_pointer DogEntityHandler
._70 entity_pointer Kid70EntityHandler ; $70
._71 entity_pointer Kid71EntityHandler
._72 entity_pointer Kid72EntityHandler
._73 entity_pointer Kid73EntityHandler
._74 entity_pointer PapahlsWifeEntityHandler ; $74
._75 entity_pointer GrandmaUlriraEntityHandler
._76 entity_pointer MrWriteEntityHandler
._77 entity_pointer GrandpaUlriraEntityHandler
._78 entity_pointer YipYipEntityHandler ; $78
._79 entity_pointer MadamMeowMeowEntityHandler
._7A entity_pointer CrowEntityHandler
._7B entity_pointer CrazyTracyEntityHandler
._7C entity_pointer GiantGopongaFlowerEntityHandler ; $7C
._7D entity_pointer GopongaProjectileEntityHandler
._7E entity_pointer GopongaFlowerEntityHandler
._7F entity_pointer TurtleRockHeadEntityHandler
._80 entity_pointer TelephoneEntityHandler ; $80
._81 entity_pointer RollingBonesEntityHandler
._82 entity_pointer RollingBonesBarEntityHandler
._83 entity_pointer DreamShrineBedEntityHandler
._84 entity_pointer BigFairyEntityHandler ; $84
._85 entity_pointer MrWriteBirdEntityHandler
._86 entity_pointer FloatingItemEntityHandler
._87 entity_pointer DesertLanmolaEntityHandler
._88 entity_pointer ArmosKnightEntityHandler ; $88
._89 entity_pointer HinoxEntityHandler
._8A db $1F, $6E, $36 ; entity_pointer Entity8AHandler
._8B db $1F, $6E, $36 ; entity_pointer Entity8BHandler
._8C entity_pointer Entity8CHandler ; $8C
._8D entity_pointer Entity8DHandler
._8E entity_pointer CueBallEntityHandler
._8F entity_pointer MaskedMimicGoriyaEntityHandler
._90 entity_pointer ThreeOfAKindEntityHandler ; $90
._91 entity_pointer AntiKirbyEntityHandler
._92 entity_pointer SmasherEntityHandler
._93 entity_pointer MadBomberEntityHandler
._94 entity_pointer KanaletBombableWallEntityHandler ; $94
._95 entity_pointer RichardEntityHandler
._96 entity_pointer RichardFrogEntityHandler
._97 entity_pointer Entity97Handler
._98 entity_pointer HorsePieceEntityHandler ; $98
._99 entity_pointer WaterTektiteEntityHandler
._9A entity_pointer FlyingTilesEntityHandler
._9B entity_pointer HidingGelEntityHandler
._9C entity_pointer StarEntityHandler ; $9C
._9D entity_pointer LiftableStatueEntityHandler
._9E entity_pointer FireballShooterEntityHandler
._9F entity_pointer GoombaEntityHandler
._A0 entity_pointer PeaHatEntityHandler ; $A0
._A1 entity_pointer SnakeEntityHandler
._A2 db $D5, $6E, $36 ; entity_pointer EntityA2Handler
._A3 entity_pointer SideViewPlatformHorizontalEntityHandler
._A4 entity_pointer SideViewPlatformVerticalEntityHandler ; $A4
._A5 entity_pointer SideViewPlatformEntityHandler
._A6 entity_pointer SideViewWeightsEntityHandler
._A7 entity_pointer SmashablePillarEntityHandler
._A8 entity_pointer EntityA8Handler ; $A8
._A9 entity_pointer BlooperEntityHandler
._AA entity_pointer CheepCheepHorizontalEntityHandler
._AB entity_pointer CheepCheepVerticalEntityHandler
._AC entity_pointer CheepCheepJumpingEntityHandler ; $AC
._AD entity_pointer KikiTheMonkeyEntityHandler
._AE entity_pointer WingedOctorockEntityHandler
._AF entity_pointer TradingItemEntityHandler
._B0 entity_pointer PincerEntityHandler ; $B0
._B1 entity_pointer HoleFillerEntityHandler
._B2 entity_pointer BeetleSpawnerEntityHandler
._B3 entity_pointer HoneycombEntityHandler
._B4 entity_pointer TarinEntityHandler ; $B4
._B5 entity_pointer BearEntityHandler
._B6 entity_pointer PapahlEntityHandler
._B7 entity_pointer MermaidEntityHandler
._B8 entity_pointer FishermanUnderBridgeEntityHandler ; $B8
._B9 entity_pointer BuzzBlobEntityHandler
._BA entity_pointer BomberEntityHandler
._BB entity_pointer BushCrawlerEntityHandler
._BC entity_pointer GrimCreeperEntityHandler ; $BC
._BD entity_pointer VireEntityHandler
._BE entity_pointer BlainoEntityHandler
._BF entity_pointer ZombieEntityHandler
._C0 entity_pointer MazeSignpostEntityHandler ; $C0
._C1 entity_pointer MarinAtTheShoreEntityHandler
._C2 entity_pointer MarinAtTalTalHeightsEntityHandler
._C3 entity_pointer MamuAndFrogsEntityHandler
._C4 entity_pointer WalrusEntityHandler ; $C4
._C5 entity_pointer UrchinEntityHandler
._C6 entity_pointer SandCrabEntityHandler
._C7 entity_pointer ManboAndFishesEntityHandler
._C8 entity_pointer BunnyCallingMarinEntityHandler ; $C8
._C9 entity_pointer MusicalNoteEntityHandler
._CA entity_pointer MadBatterEntityHandler
._CB entity_pointer ZoraEntityHandler
._CC entity_pointer FishEntityHandler ; $CC
._CD entity_pointer BananasSchuleSaleEntityHandler
._CE entity_pointer MermaidStatueEntityHandler
._CF entity_pointer SeashellMansionEntityHandler
._D0 entity_pointer AnimalD0EntityHandler ; $D0
._D1 entity_pointer AnimalD1EntityHandler
._D2 entity_pointer AnimalD2EntityHandler
._D3 entity_pointer BunnyD3EntityHandler
._D4 entity_pointer EntityD4Handler ; $D4
._D5 entity_pointer EntityD5Handler
._D6 entity_pointer SideViewPotEntityHandler
._D7 entity_pointer ThwimpEntityHandler
._D8 entity_pointer ThwompEntityHandler ; $D8
._D9 entity_pointer ThwompRammableEntityHandler
._DA entity_pointer PodobooEntityHandler
._DB entity_pointer GiantBubbleEntityHandler
._DC entity_pointer FlyingRoosterEventsEntityHandler ; $DC
._DD entity_pointer BookEntityHandler
._DE entity_pointer EggSongEventEntityHandler
._DF entity_pointer SwordBeamEntityHandler
._E0 entity_pointer MonkeyEntityHandler ; $E0
._E1 entity_pointer WitchRatEntityHandler
._E2 entity_pointer FlameShooterEntityHandler
._E3 entity_pointer PokeyEntityHandler
._E4 entity_pointer MoblinKingEntityHandler ; $E4
._E5 entity_pointer FloatingItem2EntityHandler
._E6 entity_pointer FinalNightmareEntityHandler
._E7 entity_pointer KanaletCastleGateSwitchEntityHandler
._E8 entity_pointer EndingOwlStairClimbingEntityHandler ; $E8
._E9 db $68, $66, $36 ; entity_pointer EntityE9Handler
._EA db $68, $66, $36 ; entity_pointer EntityEAHandler
._EB db $68, $66, $36 ; entity_pointer EntityEBHandler
._EC db $C9, $63, $36 ; entity_pointer EntityECHandler ; $EC
._ED db $C9, $63, $36 ; entity_pointer EntityEDHandler
._EE db $C9, $63, $36 ; entity_pointer EntityEEHandler
._EF db $41, $62, $36 ; entity_pointer EntityEFHandler
._F0 db $41, $62, $36 ; entity_pointer EntityF0Handler ; $F0
._F1 db $41, $62, $36 ; entity_pointer EntityF1Handler
._F2 db $A2, $5F, $36 ; entity_pointer EntityF2Handler
._F3 db $A2, $5F, $36 ; entity_pointer EntityF3Handler
._F4 db $F7, $5B, $36 ; entity_pointer EntityF4Handler ; $F4
._F5 db $5E, $5B, $36 ; entity_pointer EntityF5Handler
._F6 db $3F, $59, $36 ; entity_pointer EntityF6Handler
._F7 db $3F, $59, $36 ; entity_pointer EntityF7Handler
._F8 db $E2, $54, $36 ; entity_pointer EntityF8Handler ; $F8
._F9 db $B6, $4C, $36 ; entity_pointer EntityF9Handler
._FA db $12, $49, $36 ; entity_pointer EntityFAHandler
._FB db $F0, $EB, $5F ; unused
._FC db $50, $21, $00 ; unused
._FD db $40, $19, $19 ; unused
._FE db $19, $5E, $23 ; unused
._FF db $56, $23, $7E ; unused
.overflow db $6B, $62, $C9
