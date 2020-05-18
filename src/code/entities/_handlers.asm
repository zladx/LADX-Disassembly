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

; First 2 bytes: memory address; third byte: bank id
entity_pointer: macro
    db LOW(\1), HIGH(\1), BANK(\1)
endm

entity_disabled: macro
    db $00, $00, $00
endm

; Table of entities handlers
; See ENTITY_* constants for values
EntityHandlersTable::
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
._25 entity_pointer EntityExplosionDisplayList ; small exploding ennemy
._26 entity_pointer EntityExplosionDisplayList ; small exploding ennemy 2
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
._4A entity_pointer ColorDungeonBookEntityHandler
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
._58 entity_pointer PairoddProjectileEntityHandler
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
._64 entity_pointer SouthFaceShrineDoorEntityHandler ; $64
._65 entity_pointer AnglerFishEntityHandler
._66 entity_pointer CrystalSwitchEntityHandler
._67 entity_pointer Entity67Handler
._68 entity_pointer Entity68Handler ; $68
._69 entity_pointer MovingBlockMoverEntityHandler
._6A entity_pointer EntityRaftOwnerHandler
._6B entity_pointer TextDebuggerEntityHandler
._6C entity_pointer CuccoEntityHandler ; $6C
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
._8A entity_pointer TileGlintShownEntityHandler
._8B entity_pointer TileGlintHiddenEntityHandler
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
._A2 entity_pointer PiranhaPlantEntityHandler
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
._D4 entity_pointer GhostEntityHandler ; $D4
._D5 entity_pointer RoosterEntityHandler
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
._E9 entity_pointer ColorShellRedEntityHandler
._EA entity_pointer ColorShellGreenEntityHandler
._EB entity_pointer ColorShellBlueEntityHandler
._EC entity_pointer ColorGhoulRedEntityHandler ; $EC
._ED entity_pointer ColorGhoulGreenEntityHandler
._EE entity_pointer ColorGhoulBlueEntityHandler
._EF entity_pointer RotoswitchRedEntityHandler
._F0 entity_pointer RotoswitchYellowEntityHandler ; $F0
._F1 entity_pointer RotoswitchBlueEntityHandler
._F2 entity_pointer FlyingHopperBombsEntityHandler
._F3 entity_pointer HopperEntityHandler
._F4 entity_pointer AvalaunchEntityHandler ; $F4
._F5 entity_pointer BouncingBoulderEntityHandler
._F6 entity_pointer ColorGuardianBlueEntityHandler
._F7 entity_pointer ColorGuardianRedEntityHandler
._F8 entity_pointer GiantBuzzBlobEntityHandler ; $F8
._F9 entity_pointer HardhitBeetleEntityHandler
._FA entity_pointer PhotographerEntityHandler
._FB db $F0, $EB, $5F ; unused
._FC db $50, $21, $00 ; unused
._FD db $40, $19, $19 ; unused
._FE db $19, $5E, $23 ; unused
._FF db $56, $23, $7E ; unused
.overflow db $6B, $62, $C9

func_020_4303::
    ld   a, [$C5A0]                               ; $4303: $FA $A0 $C5
    ld   [$C5A1], a                               ; $4306: $EA $A1 $C5
    xor  a                                        ; $4309: $AF
    ld   [$C5A0], a                               ; $430A: $EA $A0 $C5
    ld   [wC10C], a                               ; $430D: $EA $0C $C1
    ldh  [hFFB2], a                               ; $4310: $E0 $B2
    ld   [wC117], a                               ; $4312: $EA $17 $C1
    ld   [$C19D], a                               ; $4315: $EA $9D $C1
    ld   [$C147], a                               ; $4318: $EA $47 $C1
    ld   [wLiftedEntityType], a                   ; $431B: $EA $A8 $C5
    ld   [$D45E], a                               ; $431E: $EA $5E $D4
    ret                                           ; $4321: $C9

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
._1B dw   EntityInitGel
._1C dw   EntityInitWithRandomDirection
._1D dw   EntityInitWizrobe
._1E dw   IncrementEntityState
._1F dw   IncrementEntityState
._20 dw   EntityInitWithRandomDirection
._21 dw   EntityInitWizrobe
._22 dw   EntityInitWithRandomDirection
._23 dw   IncrementEntityState
._24 dw   EntityInitWithRandomDirection
._25 dw   EntityInitSmallExplosion
._26 dw   EntityInitSmallExplosion
._27 dw   EntityInitWithRandomDirection
._28 dw   EntityInitWithRandomDirection
._29 dw   label_3DAB
._2A dw   EntityInitWithRandomDirection
._2B dw   EntityInitWithRandomDirection
._2C dw   EntityInitWithRandomDirection
._2D dw   EntityInitPermanentDroppable
._2E dw   EntityInitTemporaryDroppable
._2F dw   EntityInitTemporaryDroppable
._30 dw   EntityInitKeyDropPoint
._31 dw   EntityInitSword
._32 dw   EntityInitTemporaryDroppable
._33 dw   EntityInitTemporaryDroppable
._34 dw   EntityInitTemporaryDroppable
._35 dw   EntityInitNoop
._36 dw   EntityInitTemporaryDroppable
._37 dw   EntityInitTemporaryDroppable
._38 dw   EntityInitTemporaryDroppable
._39 dw   EntityInitWithShiftedXPosition
._3A dw   EntityInitNoop
._3B dw   EntityInitPermanentDroppable
._3C dw   EntityInitPermanentDroppable
._3D dw   EntityInitSecretSeashell
._3E dw   EntityInitMarin
._3F dw   EntityInitRacoon
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
._B4 dw   EntityInitTarin
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
    ldh  a, [hActiveEntityType]                     ; $4518: $F0 $EB
    ld   e, a                                     ; $451A: $5F
    ld   d, $00                                   ; $451B: $16 $00
    ld   hl, EntityInitHandlersTable                        ; $451D: $21 $22 $43
    sla  e                                        ; $4520: $CB $23
    rl   d                                        ; $4522: $CB $12
    add  hl, de                                   ; $4524: $19
    ld   e, [hl]                                  ; $4525: $5E
    inc  hl                                       ; $4526: $23
    ld   d, [hl]                                  ; $4527: $56
    push de                                       ; $4528: $D5
    pop  hl                                       ; $4529: $E1
    ret                                           ; $452A: $C9
