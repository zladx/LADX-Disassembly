; Root source file for the game.

; Definitions
include "constants/constants.asm"

; Utilities fonctions and ROM header
include "code/macros.asm"
include "code/header.asm"

; Sources
section "Main", rom0[$0150]
include "code/bank0.asm"

section "bank1",romx[$4000],bank[$01]
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
include "code/entities/bank5.asm"

section "bank6",romx[$4000],bank[$06]
include "code/entities/bank6.asm"

section "bank7",romx[$4000],bank[$07]
include "code/entities/bank7.asm"

section "bank8",romx[$4000],bank[$08]
include "data/base_maps/indoor.asm"

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
Items1Tiles::
incbin "gfx/items/items_1.dmg.2bpp"
Items2Tiles::
incbin "gfx/items/items_2.dmg.2bpp"
SirenInstrumentsTiles::
incbin "gfx/items/instruments.dmg.2bpp"
Overworld1Tiles::
incbin "gfx/world/overworld_1.dmg.2bpp"
LinkCharacter2Tiles::
incbin "gfx/characters/link_2.dmg.2bpp"
PieceOfHeartMeterTiles::
incbin "gfx/items/piece_of_heart_meter.dmg.2bpp"
OcarinaSymbolsTiles::
incbin "gfx/items/ocarina_symbols.dmg.2bpp"
AnimatedTiles::
incbin "gfx/world/animated_tiles.w32.dmg.2bpp"
MinimapTiles::
incbin "gfx/world/minimap.dmg.2bpp"

section "bankOD",romx[$4000],bank[$0D]
Dungeons1Tiles::
incbin "gfx/world/dungeons_1.dmg.2bpp"
Dungeons2Tiles::
incbin "gfx/world/dungeons_2.dmg.2bpp"

section "bankOE",romx[$4000],bank[$0E]
NpcTilesDataStart::
Npc1Tiles::
incbin "gfx/characters/npc_1.dmg.2bpp"

section "bankOF",romx[$4000],bank[$0F]
MenuTiles::
incbin "gfx/menus/menu.dmg.2bpp"
incbin "gfx/intro/title.dmg.2bpp"
FontTiles::
incbin "gfx/fonts/font.dmg.2bpp"
incbin "gfx/world/camera_shop.dmg.2bpp"
incbin "gfx/world/overworld_2.dmg.2bpp"

section "bank10",romx[$4000],bank[$10]
incbin "gfx/intro/clouds-top.dmg.2bpp"
incbin "gfx/intro/clouds-middle.dmg.2bpp"
incbin "gfx/intro/clouds-bottom.dmg.2bpp"
incbin "gfx/intro/waves.dmg.2bpp"
incbin "gfx/intro/intro.dmg.2bpp"
incbin "gfx/scenes/christine.dmg.2bpp"
incbin "gfx/scenes/marin_beach.dmg.2bpp"
MarinBeachWavesTiles::
incbin "gfx/scenes/marin_beach_waves.dmg.2bpp"
incbin "gfx/fonts/font_large.dmg.2bpp"
incbin "gfx/scenes/relief.dmg.2bpp"
incbin "gfx/scenes/painting.dmg.2bpp"

section "bank11",romx[$4000],bank[$11]
Npc2Tiles::
incbin "gfx/characters/npc_2.dmg.2bpp"

section "bank12",romx[$4000],bank[$12]
Npc3Tiles::
incbin "gfx/characters/npc_3.dmg.2bpp"
incbin "gfx/characters/nightmare.dmg.2bpp"
incbin "gfx/characters/npc_4.dmg.2bpp"
incbin "gfx/items/items_3.dmg.2bpp"
DungeonMinimapTiles::
incbin "gfx/items/minimap_dmg.2bpp"

section "bank13",romx[$4000],bank[$13]
incbin "gfx/ending/ending.dmg.2bpp"

section "bank14",romx[$4000],bank[$14]
include "data/events/dungeons.asm"
include "data/maps/layouts.asm"
include "data/chests/dungeons.asm"
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
OverworldBaseMapDMG::
incbin "data/base_maps/overworld.dmg.bin"
OverworldBaseMapGBC::
incbin "data/base_maps/overworld.cgb.bin"
include "code/bank1A.asm"

section "bank1B",romx[$4000],bank[$1B]
include "code/audio/music_1.asm"
section "Music tracks section 1",romx[$5000],bank[$1B]
include "data/music/music_tracks_data_1.asm"

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
section "Music tracks section 2",romx[$5000],bank[$1E]
include "data/music/music_tracks_data_2.asm"

section "bank1F", romx[$4000], bank[$1F]
include "code/audio/sfx_entry_point.asm"
section "sfx pointers table", romx[$4100], bank[$1F]
include "data/sfx/pointers_table.asm"
include "code/audio/sfx.asm"

section "bank20",romx[$4000],bank[$20]
include "code/entities/_handlers_table.asm"
include "code/bank20.asm"

section "bank21",romx[$4000],bank[$21]
include "code/palettes.asm"

section "bank22",romx[$4000],bank[$22]
include "data/bg_attributes/overworld_a.asm"

section "bank23",romx[$4000],bank[$23]
include "data/bg_attributes/indoors_a.asm"

section "bank24",romx[$4000],bank[$24]
include "data/bg_attributes/indoors_b.asm"
include "code/background_colors.asm"
include "code/overworld_macros.asm"

section "bank25",romx[$4000],bank[$25]
include "data/bg_attributes/overworld_b.asm"

section "bank26",romx[$4000],bank[$26]
include "data/rooms_attributes/overworld_a.asm"

section "bank27",romx[$4000],bank[$27]
include "data/rooms_attributes/overworld_b.asm"
include "data/bg_attributes/overworld_c.asm"
include "code/bank27.asm"

section "bank28",romx[$4000],bank[$28]
include "src/code/photo_album.asm"
include "data/photo_album/background.asm"

section "bank29",romx[$4000],bank[$29]
incbin "gfx/photos/photo_nice_link.2bpp"
incbin "gfx/photos/photo_marin_cliff.2bpp"
incbin "gfx/photos/photo_marin_well.2bpp"
incbin "gfx/photos/photo_mabe.2bpp"

section "bank2A",romx[$4000],bank[$2A]
incbin "gfx/photos/photo_ulrira.2bpp"
incbin "gfx/photos/photo_bow_wow.2bpp"
incbin "gfx/photos/photo_shop.2bpp"
incbin "gfx/photos/photo_fisherman.2bpp"

section "bank2B",romx[$4000],bank[$2B]
incbin "gfx/photos/photo_zora.2bpp"
incbin "gfx/photos/photo_kanalet.2bpp"
incbin "gfx/photos/photo_ghost.2bpp"
incbin "gfx/photos/photo_bridge.2bpp"

section "bank2C",romx[$4000],bank[$2C]
incbin "gfx/characters/link_1.cgb.2bpp"
incbin "gfx/items/items_1.cgb.2bpp"
incbin "gfx/items/items_2.cgb.2bpp"
incbin "gfx/items/instruments.cgb.2bpp"
incbin "gfx/world/overworld_1.cgb.2bpp"
incbin "gfx/characters/link_2.cgb.2bpp"
incbin "gfx/items/piece_of_heart_meter.cgb.2bpp"
incbin "gfx/items/ocarina_symbols.cgb.2bpp"
incbin "gfx/world/animated_tiles.w32.cgb.2bpp"
incbin "gfx/world/minimap.cgb.2bpp"

section "bank2D",romx[$4000],bank[$2D]
incbin "gfx/world/dungeons.cgb.2bpp"

section "bank2E",romx[$4000],bank[$2E]
incbin "gfx/characters/npc_1.cgb.2bpp"

section "bank2F",romx[$4000],bank[$2F]
incbin "gfx/menus/menu.cgb.2bpp"
incbin "gfx/intro/title.cgb.2bpp"
FontTilesCGB::
incbin "gfx/fonts/font.cgb.2bpp"
incbin "gfx/world/camera_shop.cgb.2bpp"
incbin "gfx/world/overworld_2.cgb.2bpp"

section "bank30",romx[$4000],bank[$30]
incbin "gfx/intro/clouds-top.cgb.2bpp"
incbin "gfx/intro/clouds-middle.cgb.2bpp"
incbin "gfx/intro/clouds-bottom.cgb.2bpp"
incbin "gfx/intro/waves.cgb.2bpp"
incbin "gfx/intro/link_pic.cgb.2bpp"
incbin "gfx/intro/egg_top.cgb.2bpp"
incbin "gfx/intro/unused_1.cgb.2bpp"
incbin "gfx/intro/seafoam.cgb.2bpp"
incbin "gfx/intro/palm_trees.cgb.2bpp"
incbin "gfx/intro/mountain.cgb.2bpp"
incbin "gfx/intro/egg.cgb.2bpp"
incbin "gfx/intro/canopy.cgb.2bpp"
incbin "gfx/intro/sand.cgb.2bpp"
incbin "gfx/intro/copyright.cgb.2bpp"
incbin "gfx/intro/mountain_clouds.cgb.2bpp"
incbin "gfx/intro/unused_2.cgb.2bpp"
incbin "gfx/intro/waves_animation.cgb.2bpp"
incbin "gfx/intro/seafoam_animation.cgb.2bpp"
incbin "gfx/intro/marin.cgb.2bpp"
incbin "gfx/intro/intro.cgb.2bpp"
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
incbin "gfx/items/items_3.cgb.2bpp"
incbin "gfx/items/minimap_cgb.2bpp"

section "bank33",romx[$4000],bank[$33]
incbin "gfx/ending/ending.cgb.2bpp"

section "bank34",romx[$4000],bank[$34]
incbin "gfx/menus/print.2bpp"

section "bank35",romx[$4000],bank[$35]
ColorDungeonTiles::
incbin "gfx/world/color_dungeon.2bpp"

section "bank36",romx[$4000],bank[$36]
include "code/entities/bank36.asm"

section "bank37",romx[$4000],bank[$37]
include "code/photos.asm"

section "bank38",romx[$4000],bank[$38]
CgbMiscTiles::
incbin "gfx/cgb_misc.2bpp"
include "code/photos_animations.asm"

section "bank39",romx[$4000],bank[$39]
incbin "gfx/photos/photo_elements_1.2bpp"

section "bank3A",romx[$4000],bank[$3A]
incbin "gfx/photos/photo_elements_2.2bpp"

section "bank3B",romx[$4000],bank[$3B]
incbin "gfx/photos/photo_elements_3.2bpp"
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
