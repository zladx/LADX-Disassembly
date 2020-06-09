; Root source file for the game.

; Build options
include "options.asm"

; Definitions
include "constants/constants.asm"

; Utilities fonctions and ROM header
include "code/macros.asm"
include "code/header.asm"

; For audio
include "code/audio_macros.asm"

; Sources
section "Main", rom0[$0150]
include "code/bank0.asm"

section "bank1",romx[$4000],bank[$01]
include "code/file_save_screen.asm"
include "code/game_over.asm"
include "code/world_handler.asm"
include "code/bank1.asm"

section "bank2",romx[$4000],bank[$02]
include "code/bank2.asm"

section "bank3",romx[$4000],bank[$03]
include "data/entities/physics_flags.asm"
include "data/entities/hitbox_flags.asm"
include "data/entities/health_groups.asm"
include "code/entities/bank3.asm"

section "bank4",romx[$4000],bank[$04]
include "code/entities/bank4.asm"

section "bank5",romx[$4000],bank[$05]
include "code/entities/bow_wow.asm"
include "code/entities/cucco.asm"
include "code/entities/witch.asm"
include "code/entities/racoon.asm"
include "code/entities/marin.asm"
include "code/entities/raft_owner.asm"
include "code/entities/entity_67.asm"
include "code/entities/angler_fish.asm"
include "code/entities/evil_eagle.asm"
include "code/entities/hot_head.asm"
include "code/entities/dodongo_snake.asm"
include "code/entities/slime_eel.asm"
include "code/entities/ghoma.asm"
include "code/entities/musical_note.asm"
include "code/entities/animal_d0.asm"

section "bank6",romx[$4000],bank[$06]
include "code/entities/bank6.asm"

section "bank7",romx[$4000],bank[$07]
include "code/entities/bank7.asm"

section "bank8",romx[$4000],bank[$08]
IndoorObjectsTilemapDMG::
include "data/objects_tilemaps/indoor.dmg.asm"
IndoorObjectsTilemapCGB::
include "data/objects_tilemaps/indoor.cgb.asm"
ColorDungeonObjectsTilemap::
include "data/objects_tilemaps/color_dungeon.asm"
include "data/objects/physics.asm"
include "data/backgrounds/background_tile_commands.asm"

; Maps and dialogs
section "bank9",romx[$4000],bank[$09]
OverworldRoomPointers::
include "data/maps/overworld.asm"
OverworldRoomsFirstHalf::
include "data/rooms/overworld_a.asm"
section "bank9 text",romx[$6700],bank[$09]
include "text/dialog_dx.asm"

section "bank0A", romx[$4000], bank[$0A]
IndoorsARoomPointers::
include "data/maps/indoors_a.asm"
IndoorsARooms::
include "data/rooms/indoors_a.asm"
ColorDungeonRoomPointers::
include "data/maps/color_dungeon.asm"
ColorDungeonRooms::
include "data/rooms/color_dungeon.asm"

section "bank0B", romx[$4000], bank[$0B]
IndoorsBRoomPointers::
include "data/maps/indoors_b.asm"
IndoorsBRooms::
include "data/rooms/indoors_b.asm"

section "bank0C",romx[$4000],bank[$0C]
LinkCharacterTiles::
incbin "gfx/characters/link_1.dmg.2bpp"
CharacterVfxTiles::
incbin "gfx/characters/vfx.dmg.2bpp"
Items1Tiles::
incbin "gfx/items/items_1.dmg.2bpp"
InventoryEquipmentItemsTiles::
incbin "gfx/items/items_2.dmg.2bpp"
DungeonKeysTiles::
incbin "gfx/items/dungeon_keys.dmg.2bpp"
SirenInstrumentsTiles::
incbin "gfx/items/instruments.dmg.2bpp"
Overworld1Tiles::
incbin "gfx/world/overworld_1.dmg.2bpp"
OverworldLandscapeTiles::
incbin "gfx/world/overworld_landscape.dmg.2bpp"
LinkCharacter2Tiles::
incbin "gfx/characters/link_2.dmg.2bpp"
PieceOfHeartMeterTiles::
incbin "gfx/items/piece_of_heart_meter.dmg.2bpp"
OcarinaSymbolsTiles::
incbin "gfx/items/ocarina_symbols.dmg.2bpp"
AnimatedTiles::
incbin "gfx/world/animated_tiles.w32.dmg.2bpp"
WorldMapTiles::
incbin "gfx/world/minimap.dmg.2bpp"

section "bankOD",romx[$4000],bank[$0D]
DungeonsTiles::
DungeonWallsATiles::
incbin "gfx/dungeons/walls_a.dmg.2bpp"
Dungeons1Tiles::
incbin "gfx/dungeons/doors.dmg.2bpp"
DungeonWallsBTiles::
incbin "gfx/dungeons/walls_b.dmg.2bpp"
DungeonWallsCTiles::
incbin "gfx/dungeons/walls_c.dmg.2bpp"
DungeonWallsDTiles::
incbin "gfx/dungeons/walls_d.dmg.2bpp"
DungeonFloorATiles::
incbin "gfx/dungeons/floor_a.dmg.2bpp"
DungeonFloorBTiles::
incbin "gfx/dungeons/floor_b.dmg.2bpp"
DungeonFloorCTiles::
incbin "gfx/dungeons/floor_c.dmg.2bpp"
DungeonFloorDTiles::
incbin "gfx/dungeons/floor_d.dmg.2bpp"
Dungeons2Tiles::
incbin "gfx/dungeons/dungeons_2.dmg.2bpp"
DungeonFloorETiles::
incbin "gfx/dungeons/floor_e.dmg.2bpp"
DungeonFloorFTiles::
incbin "gfx/dungeons/floor_f.dmg.2bpp"
DungeonFloorGTiles::
incbin "gfx/dungeons/floor_g.dmg.2bpp"
DungeonFloorHTiles::
incbin "gfx/dungeons/floor_h.dmg.2bpp"
DungeonFloorITiles::
incbin "gfx/dungeons/floor_i.dmg.2bpp"
DungeonFloorJTiles::
incbin "gfx/dungeons/floor_j.dmg.2bpp"
DungeonFloorKTiles::
incbin "gfx/dungeons/floor_k.dmg.2bpp"
Dungeons3Tiles::
incbin "gfx/dungeons/dungeons_3.dmg.2bpp"
WindfishFloorTiles::
incbin "gfx/dungeons/windfish_floor.dmg.2bpp"
DungeonFloorLTiles::
incbin "gfx/dungeons/floor_l.dmg.2bpp"
DungeonWallsETiles::
incbin "gfx/dungeons/walls_e.dmg.2bpp"
DungeonWallsFTiles::
incbin "gfx/dungeons/walls_f.dmg.2bpp"
DungeonSideview1Tiles::
incbin "gfx/dungeons/sideview_1.dmg.2bpp"
DungeonSideview2Tiles::
incbin "gfx/dungeons/sideview_2.dmg.2bpp"

section "bankOE",romx[$4000],bank[$0E]
NpcTilesDataStart::
Npc1Tiles::
incbin "gfx/characters/npc_1.dmg.2bpp"

section "bankOF",romx[$4000],bank[$0F]
MenuTiles::
incbin "gfx/menus/menu.dmg.2bpp"
SaveMenuTiles::
incbin "gfx/menus/save_menu.dmg.2bpp"
TitleLogoTitles::
incbin "gfx/intro/title.dmg.2bpp"
FontTiles::
incbin "gfx/fonts/font.dmg.2bpp"
Overworld2Tiles::
incbin "gfx/world/overworld_2.dmg.2bpp"

section "bank10",romx[$4000],bank[$10]
IntroTiles::
Intro1Tiles::
incbin "gfx/intro/intro_1.dmg.2bpp"
Intro2Tiles::
incbin "gfx/intro/intro_2.dmg.2bpp"
Intro3Tiles::
incbin "gfx/intro/intro_3.dmg.2bpp"
StaticPicturesTiles::
ChristineTiles::
incbin "gfx/scenes/christine.dmg.2bpp"
MarinBeachTiles::
incbin "gfx/scenes/marin_beach.dmg.2bpp"
MarinBeachWavesTiles::
incbin "gfx/scenes/marin_beach_waves.dmg.2bpp"
FontLargeTiles::
incbin "gfx/fonts/font_large.dmg.2bpp"
ReliefTiles::
incbin "gfx/scenes/relief.dmg.2bpp"
PaintingTiles::
incbin "gfx/scenes/painting.dmg.2bpp"

section "bank11",romx[$4000],bank[$11]
Npc2Tiles::
incbin "gfx/characters/npc_2.dmg.2bpp"

section "bank12",romx[$4000],bank[$12]
Npc3Tiles::
incbin "gfx/characters/npc_3.dmg.2bpp"
NightmareTiles::
incbin "gfx/characters/nightmare.dmg.2bpp"
Npc4Tiles::
incbin "gfx/characters/npc_4.dmg.2bpp"
DungeonItemsTiles::
DungeonItemsATiles::
incbin "gfx/items/dungeon_a.dmg.2bpp"
DungeonItemsBTiles::
incbin "gfx/items/dungeon_b.dmg.2bpp"
DungeonItemsCTiles::
incbin "gfx/items/dungeon_c.dmg.2bpp"
DungeonItemsDTiles::
incbin "gfx/items/dungeon_d.dmg.2bpp"
HouseAItemsTiles::
incbin "gfx/items/house_a.dmg.2bpp"
HouseBItemsTiles::
incbin "gfx/items/house_b.dmg.2bpp"
InventoryDungeonItemsTiles::
incbin "gfx/items/dungeon_items.dmg.2bpp"
DungeonMinimapTiles::
incbin "gfx/items/minimap_dmg.2bpp"

section "bank13",romx[$4000],bank[$13]
EndingTiles::
EndingTiles1::
incbin "gfx/ending/ending_1.dmg.2bpp"
EaglesTowerTop1Tiles::
incbin "gfx/dungeons/eagles_tower_top_1.dmg.2bpp"
EndingTiles2::
incbin "gfx/ending/ending_2.dmg.2bpp"
EaglesTowerTop2Tiles::
incbin "gfx/dungeons/eagles_tower_top_2.dmg.2bpp"

section "bank14",romx[$4000],bank[$14]
include "data/events/dungeons.asm"
include "data/maps/layouts.asm"
include "data/chests/chests.asm"
section "bank14 chests",romx[$5000],bank[$14]
include "code/bank14.asm"
section "bank14 text",romx[$5C00],bank[$14]
include "text/dialog_1.asm"

section "bank15",romx[$4000],bank[$15]
include "code/entities/bank15.asm"

section "bank16",romx[$4000],bank[$16]
include "data/entities/pointers_table.asm"
include "data/entities/indoors_a.asm"
include "data/entities/indoors_b.asm"
include "data/entities/overworld.asm"
include "data/entities/color_dungeon.asm"
section "bank16 test",romx[$5700],bank[$16]
include "text/dialog_2.asm"

section "bank17",romx[$4000],bank[$17]
include "code/credits.asm"

section "bank18",romx[$4000],bank[$18]
include "code/entities/bank18.asm"

section "bank19",romx[$4000],bank[$19]
include "code/entities/bank19.asm"

section "bank1A",romx[$4000],bank[$1A]
OverworldRoomsSecondHalf::
include "data/rooms/overworld_b.asm"
; include "code/map_loading.asm"
OverworldObjectsTilemapDMG::
; include "data/objects_tilemaps/overworld.dmg.asm"
OverworldObjectsTilemapCGB::
; include "data/objects_tilemaps/overworld.cgb.asm"
; include "code/entities/anglers_tunnel_door.asm"
AnglersTunnelDoorEntityHandler:

section "bank1B",romx[$4000],bank[$1B]
include "code/audio/music_1.asm"
section "Music tracks section 1B/2",romx[$5000],bank[$1B] ; TODO: organize these better
include "data/music/music_tracks_data_1b_2.asm"
; section "Music tracks section 1B/3",romx[$7100],bank[$1B]
; include "data/music/music_tracks_data_1b_3.asm"

section "bank1C",romx[$4000],bank[$1C]
db $01 ; Extra byte present in the original ROM
include "data/dialogs/dialog_pointers.asm"
include "data/ascii_to_tile.asm"
include "data/dialogs/dialog_banks.asm"
section "bank1C dialog",romx[$4a00],bank[$1C]
include "text/dialog_3.asm"

section "bank1D", romx[$4000], bank[$1D]
include "text/dialog_4.asm"

section "bank1E", romx[$4000], bank[$1E]
include "code/audio/music_2.asm"
section "Music tracks section 1E/2",romx[$5000],bank[$1E]
include "data/music/music_tracks_data_1e_2.asm"
section "Music tracks section 1E/3",romx[$7000],bank[$1E]
include "data/music/music_tracks_data_1e_3.asm"

section "bank1F", romx[$4000], bank[$1F]
include "code/audio/sfx_entry_point.asm"
section "sfx pointers table", romx[$4100], bank[$1F]
include "data/sfx/pointers_table.asm"
include "code/audio/sfx.asm"
OverworldBGAttributesPointers:
OverworldBGAttributesBanks:
func_020_7D7C:
func_020_7BA5:
func_027_74E3:
func_027_73C7:
func_027_734B:
func_027_7306:
func_027_72E4:
func_027_7660:
func_027_774C:
func_020_7C26:
func_020_78ED:
func_023_7E95:
func_027_782E:
func_027_7854:
CreditsBGMaps:
._00
._01
._02
._03
._04
._05
func_020_7D1C:
func_021_53F3:
CameraShopIndoorTiles:
func_020_4A76:
func_020_54F5:
func_020_49BA:
ConfigureAnimatedTilesCopy:
PhotoAlbumTiles:
func_020_6C4F:
func_020_563B:
func_020_55CA:
func_020_6C7A:
func_021_53CF:
func_038_7830:
DungeonItemsTilesPointers:
func_020_5570:
func_020_49D9:
PlayBoomerangSfx:
EndingCGBAltTiles:
DungeonFloorTilesPointers:
TitleDXTilesCGB:
DungeonWallsTilesPointers:
CgbMiscTiles:
ColorDungeonWallsTilesPointers:
TitleDXTiles:
ColorDungeonTiles:
PhotoElementsTiles:
TitleDXTilesDMG:
func_020_475A:
ResetRoomVariables:
func_020_4303:
LoadRoomPalettes:
func_021_53B6:
func_036_6D4D:
LoadRoomObjectsAttributes:
ApplyOverworldObjectMacro:
EntityHandlersTable:
LoadTileset23:
LoadTileset22:
func_020_6352:
LoadTileset0E:
func_020_5C9C:
EntityInitGenie:
func_021_5355:
InventoryEntryPoint:
ColorDungeonNpcTiles:
func_020_4AB3:
func_020_4C47:
func_020_4BFF:

func_020_4B81:
func_020_4B4A:

func_020_48CA:
func_036_725A:
LoadBGPalettes:
func_20_4B1F:

PhotosEntryPoint:
PhotoAlbumEntryPoint:
data_020_763B:
data_020_73F3:
data_020_70D3:
OverworldTilesetsTable:
ColorDungeonTilesetsTable:
func_020_6AC1
PositionTitleScreenSprites
IndoorsTilesetsTable:
IndoorsBGAttributesA
IndoorsBGAttributesB
LoadBGMapAttributes
ColorDungeonBGAttributes
ClearWRAMBank5
ApplyFadeToWhite_GBC
SuperGameBoyInit
ClearBGMap0Attributes
LoadPaletteForTilemap
TilesetTables:
PrinterInterruptSerial
PrinterInterruptVBlank
func_020_6E50:
CopyPalettesToHardware
GetTilemapHandlerAddress
func_020_6BDC
GetBGCopyRequest
func_038_785A
LoadFileMenuBG
func_036_72BA
ReplaceObjects56and57
func_020_6BA4
GetColorDungeonTilesAddress
func_020_6A30
LoadPhotoBgMap:
func_036_7161:
CheckPushedTombStone
CopyLinkTunicPalette
GetEntityInitHandler
func_036_505F
func_020_6D0E
func_036_4F9B
func_020_4874
func_020_6D52
func_036_4F68
func_020_4954
func_036_705A
func_036_70D6:
func_036_703E
func_036_4BE8
func_024_5C1A
func_036_4A4C:

func_036_4A77:

func_014_50C3
label_014_5067
jr_014_50B2
func_002_4E48
func_002_4E2C

func_002_4DFC
