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
include "code/bank14.asm"
include "text/dialog_1.asm"

section "bank15",romx[$4000],bank[$15]
include "code/entities/bank15.asm"

section "bank16",romx[$4000],bank[$16]
include "data/entities/pointers_table.asm"
include "data/entities/indoors_a.asm"
include "data/entities/indoors_b.asm"
include "data/entities/overworld.asm"
include "data/entities/color_dungeon.asm"
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
include "data/bg_attributes/overworld_pointers.asm"
include "data/bg_attributes/overworld_banks.asm"
include "code/map_loading.asm"
OverworldObjectsTilemapDMG::
include "data/objects_tilemaps/overworld.dmg.asm"
OverworldObjectsTilemapCGB::
include "data/objects_tilemaps/overworld.cgb.asm"
include "code/entities/anglers_tunnel_door.asm"

section "bank1B",romx[$4000],bank[$1B]
include "code/audio/music_1.asm"
section "Music tracks section 1B/2",romx[$5000],bank[$1B] ; TODO: organize these better
include "data/music/music_tracks_data_1b_2.asm"
section "Music tracks section 1B/3",romx[$7100],bank[$1B]
include "data/music/music_tracks_data_1b_3.asm"

section "bank1C",romx[$4000],bank[$1C]
db $01 ; Extra byte present in the original ROM
include "data/dialogs/dialog_pointers.asm"
include "data/ascii_to_tile.asm"
include "data/dialogs/dialog_banks.asm"
include "code/dialog_letters.asm"
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

section "bank20",romx[$4000],bank[$20]
include "code/entities/_handlers.asm"
include "code/bank20.asm"

section "bank21",romx[$4000],bank[$21]
include "code/palettes.asm"

section "bank22",romx[$4000],bank[$22]
include "data/bg_attributes/overworld_a.asm"

section "bank23",romx[$4000],bank[$23]
include "data/bg_attributes/indoors_a.asm"
include "code/bank23.asm"

section "bank24",romx[$4000],bank[$24]
include "data/bg_attributes/indoors_b.asm"
include "code/background_colors.asm"
include "code/overworld_macros.asm"

section "bank25",romx[$4000],bank[$25]
include "data/bg_attributes/overworld_b.asm"

section "bank26",romx[$4000],bank[$26]
include "data/rooms_gbc_overlays/overworld_a.asm"

section "bank27",romx[$4000],bank[$27]
include "data/rooms_gbc_overlays/overworld_b.asm"
include "data/bg_attributes/overworld_c.asm"
include "code/bank27.asm"

section "bank28",romx[$4000],bank[$28]
include "code/photo_album.asm"
include "data/photo_album/background.asm"

section "bank29",romx[$4000],bank[$29]
PhotoNiceLinkTiles:
incbin "gfx/photos/photo_nice_link.2bpp"
PhotoMarinCliffTiles:
incbin "gfx/photos/photo_marin_cliff.2bpp"
PhotoMarinWellTiles:
incbin "gfx/photos/photo_marin_well.2bpp"
PhotoMabeTiles:
incbin "gfx/photos/photo_mabe.2bpp"

section "bank2A",romx[$4000],bank[$2A]
PhotoUlriraTiles:
incbin "gfx/photos/photo_ulrira.2bpp"
PhotoBowWowTiles:
incbin "gfx/photos/photo_bow_wow.2bpp"
PhotoShopTiles:
incbin "gfx/photos/photo_shop.2bpp"
PhotoFishermanTiles:
incbin "gfx/photos/photo_fisherman.2bpp"

section "bank2B",romx[$4000],bank[$2B]
PhotoZoraTiles:
incbin "gfx/photos/photo_zora.2bpp"
PhotoKanaletTiles:
incbin "gfx/photos/photo_kanalet.2bpp"
PhotoGhostTiles:
incbin "gfx/photos/photo_ghost.2bpp"
PhotoBridgeTiles:
incbin "gfx/photos/photo_bridge.2bpp"

section "bank2C",romx[$4000],bank[$2C]
incbin "gfx/characters/link_1.cgb.2bpp"
incbin "gfx/characters/vfx.cgb.2bpp"
incbin "gfx/items/items_1.cgb.2bpp"
incbin "gfx/items/items_2.cgb.2bpp"
incbin "gfx/items/dungeon_keys.cgb.2bpp"
incbin "gfx/items/instruments.cgb.2bpp"
incbin "gfx/world/overworld_1.cgb.2bpp"
incbin "gfx/characters/link_2.cgb.2bpp"
incbin "gfx/items/piece_of_heart_meter.cgb.2bpp"
incbin "gfx/items/ocarina_symbols.cgb.2bpp"
incbin "gfx/world/animated_tiles.w32.cgb.2bpp"
incbin "gfx/world/minimap.cgb.2bpp"

section "bank2D",romx[$4000],bank[$2D]
DungeonsTilesCGB::
incbin "gfx/dungeons/dungeons.cgb.2bpp"

section "bank2E",romx[$4000],bank[$2E]
incbin "gfx/characters/npc_1.cgb.2bpp"

section "bank2F",romx[$4000],bank[$2F]
incbin "gfx/menus/menu.cgb.2bpp"
incbin "gfx/menus/save_menu.cgb.2bpp"
incbin "gfx/intro/title.cgb.2bpp"
incbin "gfx/fonts/font.cgb.2bpp"
incbin "gfx/world/overworld_2.cgb.2bpp"

section "bank30",romx[$4000],bank[$30]
incbin "gfx/intro/intro_1.cgb.2bpp"
incbin "gfx/intro/intro_2.cgb.2bpp"
incbin "gfx/intro/intro_3.cgb.2bpp"
incbin "gfx/scenes/christine.cgb.2bpp"
incbin "gfx/scenes/marin_beach.cgb.2bpp"
incbin "gfx/scenes/marin_beach_waves.cgb.2bpp"
incbin "gfx/fonts/font_large.cgb.2bpp"
incbin "gfx/scenes/relief.cgb.2bpp"
incbin "gfx/scenes/painting.cgb.2bpp"

section "bank31",romx[$4000],bank[$31]
incbin "gfx/characters/npc_2.cgb.2bpp"

section "bank32",romx[$4000],bank[$32]
incbin "gfx/characters/npc_3.cgb.2bpp"
incbin "gfx/characters/nightmare.cgb.2bpp"
incbin "gfx/characters/npc_4.cgb.2bpp"
incbin "gfx/items/dungeon_a.cgb.2bpp"
incbin "gfx/items/dungeon_b.cgb.2bpp"
incbin "gfx/items/dungeon_c.cgb.2bpp"
incbin "gfx/items/dungeon_d.cgb.2bpp"
incbin "gfx/items/house_a.cgb.2bpp"
incbin "gfx/items/house_b.cgb.2bpp"
incbin "gfx/items/dungeon_items.cgb.2bpp"
incbin "gfx/items/minimap_cgb.2bpp"

section "bank33",romx[$4000],bank[$33]
incbin "gfx/ending/ending_1.cgb.2bpp"
incbin "gfx/dungeons/eagles_tower_top_1.cgb.2bpp"
incbin "gfx/ending/ending_2.cgb.2bpp"
incbin "gfx/dungeons/eagles_tower_top_2.cgb.2bpp"

section "bank34",romx[$4000],bank[$34]
incbin "gfx/menus/print.2bpp"

section "bank35",romx[$4000],bank[$35]
ColorDungeonNpcTiles::
incbin "gfx/characters/color_dungeon.2bpp"
PrintUI1Tiles::
incbin "gfx/photos/print_ui_1.2bpp"
PrintUI2Tiles::
incbin "gfx/photos/print_ui_2.2bpp"
ColorDungeonTiles::
incbin "gfx/dungeons/color_dungeon.2bpp"
CameraShopIndoorTiles::
incbin "gfx/dungeons/camera_shop.2bpp"
PhotoAlbumTiles::
incbin "gfx/photos/photo_album.2bpp"
EndingCGBAltTiles::
incbin "gfx/ending/ending.cgb.alt.2bpp"

section "bank36",romx[$4000],bank[$36]
include "code/entities/bank36.asm"

section "bank37",romx[$4000],bank[$37]
include "code/photos.asm"

section "bank38",romx[$4000],bank[$38]
CgbMiscTiles::
incbin "gfx/cgb_misc.2bpp"
TitleDXTiles::
TitleDXTilesDMG::
incbin "gfx/intro/title_dx.dmg.2bpp"
TitleDXTilesCGB::
incbin "gfx/intro/title_dx.cgb.2bpp"
PhotoElementsTiles::
incbin "gfx/photos/photo_elements_4.2bpp"
include "code/photos_animations.asm"

section "bank39",romx[$4000],bank[$39]
incbin "gfx/photos/photo_elements_1.2bpp"

section "bank3A",romx[$4000],bank[$3A]
incbin "gfx/photos/photo_elements_2.2bpp"

section "bank3B",romx[$4000],bank[$3B]
incbin "gfx/photos/photo_elements_3.2bpp"
PhotoDizzyLinkTiles:
incbin "gfx/photos/photo_dizzy_link.2bpp"

section "bank3C",romx[$4000],bank[$3C]
SGBFrameTilesA:
include "data/super_gameboy/frame_tiles_a.asm"
SGBFrameTilesB:
include "data/super_gameboy/frame_tiles_b.asm"
SGBFrameTilemap:
include "data/super_gameboy/frame_tilemap.asm"
include "data/super_gameboy/frame_palette_1.asm"
include "data/super_gameboy/frame_palette_2.asm"
include "data/super_gameboy/frame_palette_3.asm"
include "data/super_gameboy/commands.asm"
include "code/super_gameboy.asm"

section "bank3D",romx[$4000],bank[$3D]
include "code/photos_bg.asm"

; Unused banks; make blank sections so they are filled with $00 instead of $ff to match
; the rom
section "bank3E",romx[$4000],bank[$3E]
section "bank3F",romx[$4000],bank[$3F]
