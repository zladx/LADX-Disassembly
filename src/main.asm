; Root source file for the game.

; Definitions
include "constants/charmap.asm"
include "constants/constants.asm"

; Utilities fonctions and ROM header
include "code/interrupts.asm"
include "code/header.asm"

; Sources
section "Main", rom0
include "code/bank0.asm"

section "bank1",romx,bank[$01]
include "code/bank1.asm"

section "bank2",romx,bank[$02]
incbin "../bin/banks/bank_02_8000.bin"

section "bank3",romx,bank[$03]
include "code/bank3.asm"

section "bank4",romx,bank[$04]
incbin "../bin/banks/bank_04_10000.bin"

section "bank5",romx,bank[$05]
incbin "../bin/banks/bank_05_14000.bin"

section "bank6",romx,bank[$06]
incbin "../bin/banks/bank_06_18000.bin"

section "bank7",romx,bank[$07]
incbin "../bin/banks/bank_07_1C000.bin"

section "bank8",romx,bank[$08]
incbin "../bin/banks/bank_08_20000.bin"

section "bank9",romx,bank[$09]
incbin "../bin/banks/bank_09_24000.bin"

section "bank10",romx,bank[$0A]
incbin "../bin/banks/bank_0A_28000.bin"

section "bank11",romx,bank[$0B]
incbin "../bin/banks/bank_0B_2C000.bin"

section "bank12",romx,bank[$0C]
incbin "gfx/characters/link_1.dmg.2bpp"
incbin "gfx/items/items_1.dmg.2bpp"
incbin "gfx/items/instruments.dmg.2bpp"
incbin "gfx/world/overworld_1.dmg.2bpp"
incbin "gfx/characters/link_2.dmg.2bpp"
incbin "gfx/world/animated_tiles.w32.dmg.2bpp"
incbin "gfx/world/minimap.dmg.2bpp"

section "bank13",romx,bank[$0D]
incbin "gfx/world/dungeons.dmg.2bpp"

section "bank14",romx,bank[$0E]
incbin "gfx/characters/npc_1.dmg.2bpp"

section "bank15",romx,bank[$0F]
incbin "gfx/menus/menu.dmg.2bpp"
incbin "gfx/intro/title.dmg.2bpp"
incbin "gfx/fonts/font.dmg.2bpp"
incbin "gfx/world/camera_shop.dmg.2bpp"
incbin "gfx/world/overworld_2.dmg.2bpp"

section "bank16",romx,bank[$10]
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

section "bank17",romx,bank[$11]
incbin "gfx/characters/npc_2.dmg.2bpp"

section "bank18",romx,bank[$12]
incbin "gfx/characters/npc_3.dmg.2bpp"
incbin "gfx/characters/nightmare.dmg.2bpp"
incbin "gfx/characters/npc_4.dmg.2bpp"
incbin "gfx/items/items_2.dmg.2bpp"

section "bank19",romx,bank[$13]
incbin "gfx/ending/ending.dmg.2bpp"

section "bank20",romx,bank[$14]
incbin "../bin/banks/bank_14_50000.bin"

section "bank21",romx,bank[$15]
incbin "../bin/banks/bank_15_54000.bin"

section "bank22",romx,bank[$16]
incbin "../bin/banks/bank_16_58000.bin"

section "bank23",romx,bank[$17]
incbin "../bin/banks/bank_17_5C000.bin"

section "bank24",romx,bank[$18]
incbin "../bin/banks/bank_18_60000.bin"

section "bank25",romx,bank[$19]
incbin "../bin/banks/bank_19_64000.bin"

section "bank26",romx,bank[$1A]
incbin "../bin/banks/bank_1A_68000.bin"

section "bank27",romx,bank[$1B]
incbin "../bin/banks/bank_1B_6C000.bin"

section "bank28",romx,bank[$1C]
incbin "../bin/banks/bank_1C_70000.bin"

section "bank29",romx,bank[$1D]
incbin "../bin/banks/bank_1D_74000.bin"

section "bank30",romx,bank[$1E]
incbin "../bin/banks/bank_1E_78000.bin"

section "bank31",romx,bank[$1F]
incbin "../bin/banks/bank_1F_7C000.bin"

section "bank32",romx,bank[$20]
incbin "../bin/banks/bank_20_80000.bin"

section "bank33",romx,bank[$21]
incbin "../bin/banks/bank_21_84000.bin"

section "bank34",romx,bank[$22]
incbin "../bin/banks/bank_22_88000.bin"

section "bank35",romx,bank[$23]
incbin "../bin/banks/bank_23_8C000.bin"

section "bank36",romx,bank[$24]
incbin "../bin/banks/bank_24_90000.bin"

section "bank37",romx,bank[$25]
incbin "../bin/banks/bank_25_94000.bin"

section "bank38",romx,bank[$26]
incbin "../bin/banks/bank_26_98000.bin"

section "bank39",romx,bank[$27]
incbin "../bin/banks/bank_27_9C000.bin"

section "bank40",romx,bank[$28]
incbin "../bin/banks/bank_28_A0000.bin"

section "bank41",romx,bank[$29]
incbin "gfx/photos/photo_nice_link.2bpp"
incbin "gfx/photos/photo_marin_cliff.2bpp"
incbin "gfx/photos/photo_marin_well.2bpp"
incbin "gfx/photos/photo_mabe.2bpp"

section "bank42",romx,bank[$2A]
incbin "gfx/photos/photo_ulrira.2bpp"
incbin "gfx/photos/photo_bow_wow.2bpp"
incbin "gfx/photos/photo_shop.2bpp"
incbin "gfx/photos/photo_fisherman.2bpp"

section "bank43",romx,bank[$2B]
incbin "gfx/photos/photo_zora.2bpp"
incbin "gfx/photos/photo_kanalet.2bpp"
incbin "gfx/photos/photo_ghost.2bpp"
incbin "gfx/photos/photo_bridge.2bpp"

section "bank44",romx,bank[$2C]
incbin "gfx/characters/link_1.cgb.2bpp"
incbin "gfx/items/items_1.cgb.2bpp"
incbin "gfx/items/instruments.cgb.2bpp"
incbin "gfx/world/overworld_1.cgb.2bpp"
incbin "gfx/characters/link_2.cgb.2bpp"
incbin "gfx/world/animated_tiles.w32.cgb.2bpp"
incbin "gfx/world/minimap.cgb.2bpp"

section "bank45",romx,bank[$2D]
incbin "gfx/world/dungeons.cgb.2bpp"

section "bank46",romx,bank[$2E]
incbin "gfx/characters/npc_1.cgb.2bpp"

section "bank47",romx,bank[$2F]
incbin "gfx/menus/menu.cgb.2bpp"
incbin "gfx/intro/title.cgb.2bpp"
incbin "gfx/fonts/font.cgb.2bpp"
incbin "gfx/world/camera_shop.cgb.2bpp"
incbin "gfx/world/overworld_2.cgb.2bpp"

section "bank48",romx,bank[$30]
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

section "bank49",romx,bank[$31]
incbin "gfx/characters/npc_2.cgb.2bpp"

section "bank50",romx,bank[$32]
incbin "gfx/characters/npc_3.cgb.2bpp"
incbin "gfx/characters/nightmare.cgb.2bpp"
incbin "gfx/characters/npc_4.cgb.2bpp"
incbin "gfx/items/items_2.cgb.2bpp"

section "bank51",romx,bank[$33]
incbin "gfx/ending/ending.cgb.2bpp"

section "bank52",romx,bank[$34]
incbin "gfx/menus/print.2bpp"

section "bank53",romx,bank[$35]
incbin "gfx/world/color_dungeon.2bpp"

section "bank54",romx,bank[$36]
incbin "../bin/banks/bank_36_D8000.bin"

section "bank55",romx,bank[$37]
incbin "../bin/banks/bank_37_DC000.bin"

section "bank56",romx,bank[$38]
incbin "gfx/cgb_misc.2bpp"

section "bank57",romx,bank[$39]
incbin "gfx/photos/photo_elements_1.2bpp"

section "bank58",romx,bank[$3A]
incbin "gfx/photos/photo_elements_2.2bpp"

section "bank59",romx,bank[$3B]
incbin "gfx/photos/photo_elements_3.2bpp"
incbin "gfx/photos/photo_dizzy_link.2bpp"

section "bank60",romx,bank[$3C]
incbin "../bin/banks/bank_3C_F0000.bin"

section "bank61",romx,bank[$3D]
incbin "../bin/banks/bank_3D_F4000.bin"

; Unused banks; make blank sections so they are filled with $00 instead of $ff to match
; the rom
section "bank62",romx,bank[$3E]
section "bank63",romx,bank[$3F]
