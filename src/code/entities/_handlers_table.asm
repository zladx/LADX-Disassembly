;
; Pointers table to entity handlers
;

; First 2 bytes: memory address; third byte: bank id
entity_pointer: macro
    db LOW(\1), HIGH(\1), BANK(\1)
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
._08 db $66, $79, $18 ; entity_pointer Entity08Handler
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
._14 entity_pointer MagicPowderSprinkleEntityHandler ; $14
._15 entity_pointer AntiFairyEntityHandler
._16 entity_pointer SparkClockwiseEntityHandler
._17 entity_pointer SparkCounterClockwiseEntityHandler
._18 entity_pointer PolsVoiceEntityHandler ; $18
._19 entity_pointer KeeseEntityHandler
._1A entity_pointer StalfosAggressiveEntityHandler
._1B entity_pointer GelEntityHandler
._1C entity_pointer MiniGelEntityHandler ; $1C
._1D db $00, $00, $00 ; (disabled)
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
._28 db $AF, $6A, $19 ; entity_pointer Entity28Handler ; $28
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
._42 db $7A, $5E, $18 ; entity_pointer Entity42Handler
._43 entity_pointer SeashellMansionTreesEntityHandler
._44 entity_pointer YarnaTalkingBonesEntityHandler ; $44
._45 entity_pointer BouldersEntityHandler
._46 entity_pointer MovingBlockLeftTopEntityHandler
._47 entity_pointer MovingBlockLeftBottomEntityHandler
._48 entity_pointer MovingBlockBottomLeftEntityHandler ; $48
._49 entity_pointer MovingBlockBottomRightEntityHandler
._4A db $7F, $58, $36 ; entity_pointer Entity4AHandler
._4B entity_pointer PotEntityHandler
._4C db $00, $00, $00 ; disabled
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
._61 db $11, $42, $19 ; entity_pointer Entity61Handler
._62 entity_pointer HotHeadEntityHandler
._63 entity_pointer EvilEagleEntityHandler
._64 db $E9, $5D, $18 ; entity_pointer Entity64Handler ; $64
._65 entity_pointer AnglerFishEntityHandler
._66 entity_pointer CrystalSwitchEntityHandler
._67 entity_pointer Entity67Handler
._68 entity_pointer Entity68Handler ; $68
._69 db $CE, $53, $18 ; entity_pointer Entity69Handler
._6A entity_pointer EntityRaftOwnerHandler
._6B db $85, $5D, $18 ; entity_pointer Entity6BHandler
._6C entity_pointer CucooEntityHandler ; $6C
._6D entity_pointer BowWowEntityHandler
._6E entity_pointer ButterflyEntityHandler
._6F db $DA, $48, $19 ; entity_pointer Entity6FHandler
._70 entity_pointer Kid70EntityHandler ; $70
._71 entity_pointer Kid71EntityHandler
._72 entity_pointer Kid72EntityHandler
._73 entity_pointer Kid73EntityHandler
._74 db $47, $4E, $18 ; entity_pointer Entity74Handler ; $74
._75 db $17, $4D, $18 ; entity_pointer Entity75Handler
._76 db $9D, $4B, $18 ; entity_pointer Entity76Handler
._77 entity_pointer GrandpaUlriraEntityHandler
._78 entity_pointer YipYipEntityHandler ; $78
._79 entity_pointer MadamMeowMeowEntityHandler
._7A entity_pointer CrowEntityHandler
._7B entity_pointer CrazyTracyEntityHandler
._7C entity_pointer GiantGopongaFlowerEntityHandler ; $7C
._7D entity_pointer GopongaProjectileEntityHandler
._7E entity_pointer GopongaFlowerEntityHandler
._7F db $01, $73, $18 ; entity_pointer Entity7FHandler
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
._8F db $BC, $47, $19 ; entity_pointer Entity8FHandler
._90 entity_pointer ThreeOfAKindEntityHandler ; $90
._91 entity_pointer AntiKirbyEntityHandler
._92 entity_pointer SmasherEntityHandler
._93 entity_pointer MadBomberEntityHandler
._94 entity_pointer KanaletBombableWallEntityHandler ; $94
._95 entity_pointer RichardEntityHandler
._96 db $C0, $5B, $19 ; entity_pointer Entity96Handler
._97 db $47, $48, $19 ; entity_pointer Entity97Handler
._98 entity_pointer HorsePieceEntityHandler ; $98
._99 entity_pointer WaterTektiteEntityHandler
._9A entity_pointer FlyingTilesEntityHandler
._9B entity_pointer HidingGelEntityHandler
._9C entity_pointer StarEntityHandler ; $9C
._9D db $22, $40, $19 ; entity_pointer Entity9DHandler
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
._AA db $54, $6B, $19 ; entity_pointer EntityAAHandler
._AB db $54, $6B, $19 ; entity_pointer EntityABHandler
._AC db $C7, $6B, $19 ; entity_pointer EntityACHandler ; $AC
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
._B7 entity_pointer FishermanUnderBridgeEntityHandler
._B8 entity_pointer BuzzBlobEntityHandler ; $B8
._B9 db $59, $77, $18 ; entity_pointer EntityB9Handler
._BA db $21, $78, $18 ; entity_pointer EntityBAHandler
._BB entity_pointer BushCrawlerEntityHandler
._BC db $D6, $6F, $18 ; entity_pointer EntityBCHandler ; $BC
._BD db $FC, $69, $18 ; entity_pointer EntityBDHandler
._BE db $CC, $64, $18 ; entity_pointer EntityBEHandler
._BF db $8D, $63, $18 ; entity_pointer EntityBFHandler
._C0 db $92, $62, $18 ; entity_pointer EntityC0Handler ; $C0
._C1 db $8A, $61, $18 ; entity_pointer EntityC1Handler
._C2 db $D7, $5E, $18 ; entity_pointer EntityC2Handler
._C3 db $00, $40, $18 ; entity_pointer EntityC3Handler
._C4 db $01, $55, $18 ; entity_pointer EntityC4Handler ; $C4
._C5 entity_pointer UrchinEntityHandler
._C6 entity_pointer SandCrabEntityHandler
._C7 db $00, $45, $18 ; entity_pointer EntityC7Handler
._C8 db $A6, $52, $18 ; entity_pointer EntityC8Handler ; $C8
._C9 entity_pointer MusicalNoteEntityHandler
._CA db $DD, $4E, $18 ; entity_pointer EntityCAHandler
._CB db $D4, $49, $18 ; entity_pointer EntityCBHandler
._CC entity_pointer FishEntityHandler ; $CC
._CD db $11, $6F, $19 ; entity_pointer EntityCDHandler
._CE db $38, $49, $18 ; entity_pointer EntityCEHandler
._CF db $BC, $71, $19 ; entity_pointer EntityCFHandler
._D0 entity_pointer AnimalD0EntityHandler ; $D0
._D1 entity_pointer AnimalD1EntityHandler
._D2 db $6B, $52, $18 ; entity_pointer EntityD2Handler
._D3 db $D8, $51, $18 ; entity_pointer EntityD3Handler
._D4 db $18, $5E, $19 ; entity_pointer EntityD4Handler ; $D4
._D5 db $DC, $59, $19 ; entity_pointer EntityD5Handler
._D6 db $DD, $58, $19 ; entity_pointer EntityD6Handler
._D7 db $C5, $56, $19 ; entity_pointer EntityD7Handler
._D8 db $B4, $57, $19 ; entity_pointer EntityD8Handler ; $D8
._D9 db $8B, $55, $19 ; entity_pointer EntityD9Handler
._DA db $F0, $53, $19 ; entity_pointer EntityDAHandler
._DB db $90, $53, $19 ; entity_pointer EntityDBHandler
._DC db $BD, $51, $19 ; entity_pointer EntityDCHandler ; $DC
._DD entity_pointer BookEntityHandler
._DE db $CB, $4A, $19 ; entity_pointer EntityDEHandler
._DF db $24, $45, $19 ; entity_pointer EntityDFHandler
._E0 entity_pointer MonkeyEntityHandler ; $E0
._E1 entity_pointer WitchRatEntityHandler
._E2 entity_pointer FlameShooterEntityHandler
._E3 entity_pointer PokeyEntityHandler
._E4 entity_pointer MoblinKingEntityHandler ; $E4
._E5 entity_pointer FloatingItem2EntityHandler
._E6 entity_pointer FinalNightmareEntityHandler
._E7 entity_pointer KanaletCastleGateSwitchEntityHandler
._E8 db $87, $7A, $17 ; entity_pointer EntityE8Handler ; $E8
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
._FB db $F0, $EB, $5F ; entity_pointer EntityFBHandler
._FC db $50, $21, $00 ; entity_pointer EntityFCHandler ; $FC
._FD db $40, $19, $19 ; entity_pointer EntityFDHandler
._FE db $19, $5E, $23 ; entity_pointer EntityFEHandler ; $FE Unused - Points to a byte with $DB which isn't a valid instruction
._FF db $56, $23, $7E ; entity_pointer EntityFFHandler ; $FF
.overflow db $6B, $62, $C9
