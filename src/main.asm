; Root source file for the game.

; Definitions
include "constants/charmap.asm"
include "constants/constants.asm"

include "text/dialogue_table.asm"
include "text/dialogue.asm"
include "text/dialogue_dx.asm"

include "data/ascii_to_tile.asm"

; Utilities fonctions and ROM header
include "code/interrupts.asm"
include "code/header.asm"

; Sources
section "Main", rom0[$0150]
include "code/bank0.asm"

section "bank1",romx[$4000],bank[$01]
include "code/bank1.asm"

section "bank3",romx[$4000],bank[$03]
include "code/bank3.asm"

section "bank12",romx[$4000],bank[$0C]
incbin "gfx/characters/link_1.dmg.2bpp"
incbin "gfx/items/items_1.dmg.2bpp"
incbin "gfx/items/instruments.dmg.2bpp"
incbin "gfx/world/overworld_1.dmg.2bpp"
incbin "gfx/characters/link_2.dmg.2bpp"
incbin "gfx/world/animated_tiles.w32.dmg.2bpp"
incbin "gfx/world/minimap.dmg.2bpp"

section "bank13",romx[$4000],bank[$0D]
incbin "gfx/world/dungeons.dmg.2bpp"

section "bank14",romx[$4000],bank[$0E]
incbin "gfx/characters/npc_1.dmg.2bpp"

section "bank15",romx[$4000],bank[$0F]
incbin "gfx/menus/menu.dmg.2bpp"
incbin "gfx/intro/title.dmg.2bpp"
incbin "gfx/fonts/font.dmg.2bpp"
incbin "gfx/world/camera_shop.dmg.2bpp"
incbin "gfx/world/overworld_2.dmg.2bpp"

section "bank16",romx[$4000],bank[$10]
incbin "gfx/intro/clouds-top.dmg.2bpp"
incbin "gfx/intro/clouds-middle.dmg.2bpp"
incbin "gfx/intro/clouds-bottom.dmg.2bpp"
incbin "gfx/intro/waves.dmg.2bpp"
incbin "gfx/intro/intro.dmg.2bpp"
incbin "gfx/scenes/christine.dmg.2bpp"
incbin "gfx/scenes/marin_beach.dmg.2bpp"
incbin "gfx/fonts/font_large.dmg.2bpp"
incbin "gfx/scenes/relief.dmg.2bpp"
incbin "gfx/scenes/painting.dmg.2bpp"

section "bank17",romx[$4000],bank[$11]
incbin "gfx/characters/npc_2.dmg.2bpp"

section "bank18",romx[$4000],bank[$12]
incbin "gfx/characters/npc_3.dmg.2bpp"
incbin "gfx/characters/nightmare.dmg.2bpp"
incbin "gfx/characters/npc_4.dmg.2bpp"
incbin "gfx/items/items_2.dmg.2bpp"

section "bank19",romx[$4000],bank[$13]
incbin "gfx/ending/ending.dmg.2bpp"

section "bank41",romx[$4000],bank[$29]
incbin "gfx/photos/photo_nice_link.2bpp"
incbin "gfx/photos/photo_marin_cliff.2bpp"
incbin "gfx/photos/photo_marin_well.2bpp"
incbin "gfx/photos/photo_mabe.2bpp"

section "bank42",romx[$4000],bank[$2A]
incbin "gfx/photos/photo_ulrira.2bpp"
incbin "gfx/photos/photo_bow_wow.2bpp"
incbin "gfx/photos/photo_shop.2bpp"
incbin "gfx/photos/photo_fisherman.2bpp"

section "bank43",romx[$4000],bank[$2B]
incbin "gfx/photos/photo_zora.2bpp"
incbin "gfx/photos/photo_kanalet.2bpp"
incbin "gfx/photos/photo_ghost.2bpp"
incbin "gfx/photos/photo_bridge.2bpp"

section "bank44",romx[$4000],bank[$2C]
incbin "gfx/characters/link_1.cgb.2bpp"
incbin "gfx/items/items_1.cgb.2bpp"
incbin "gfx/items/instruments.cgb.2bpp"
incbin "gfx/world/overworld_1.cgb.2bpp"
incbin "gfx/characters/link_2.cgb.2bpp"
incbin "gfx/world/animated_tiles.w32.cgb.2bpp"
incbin "gfx/world/minimap.cgb.2bpp"

section "bank45",romx[$4000],bank[$2D]
incbin "gfx/world/dungeons.cgb.2bpp"

section "bank46",romx[$4000],bank[$2E]
incbin "gfx/characters/npc_1.cgb.2bpp"

section "bank47",romx[$4000],bank[$2F]
incbin "gfx/menus/menu.cgb.2bpp"
incbin "gfx/intro/title.cgb.2bpp"
incbin "gfx/fonts/font.cgb.2bpp"
incbin "gfx/world/camera_shop.cgb.2bpp"
incbin "gfx/world/overworld_2.cgb.2bpp"

section "bank48",romx[$4000],bank[$30]
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
incbin "gfx/fonts/font_large.cgb.2bpp"
incbin "gfx/scenes/relief.cgb.2bpp"
incbin "gfx/scenes/painting.cgb.2bpp"

section "bank49",romx[$4000],bank[$31]
incbin "gfx/characters/npc_2.cgb.2bpp"

section "bank50",romx[$4000],bank[$32]
incbin "gfx/characters/npc_3.cgb.2bpp"
incbin "gfx/characters/nightmare.cgb.2bpp"
incbin "gfx/characters/npc_4.cgb.2bpp"
incbin "gfx/items/items_2.cgb.2bpp"

section "bank51",romx[$4000],bank[$33]
incbin "gfx/ending/ending.cgb.2bpp"

section "bank52",romx[$4000],bank[$34]
incbin "gfx/menus/print.2bpp"

section "bank53",romx[$4000],bank[$35]
incbin "gfx/world/color_dungeon.2bpp"

section "bank56",romx[$4000],bank[$38]
incbin "gfx/cgb_misc.2bpp"

section "bank57",romx[$4000],bank[$39]
incbin "gfx/photos/photo_elements_1.2bpp"

section "bank58",romx[$4000],bank[$3A]
incbin "gfx/photos/photo_elements_2.2bpp"

section "bank59",romx[$4000],bank[$3B]
incbin "gfx/photos/photo_elements_3.2bpp"
incbin "gfx/photos/photo_dizzy_link.2bpp"

; Unused banks; make blank sections so they are filled with $00 instead of $ff to match
; the rom
section "bank62",romx[$4000],bank[$3E]
section "bank63",romx[$4000],bank[$3F]
