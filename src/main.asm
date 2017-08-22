; Root source file for the game.

; Include defines and utility functions
include "constants/constants.asm"
include "code/rst.asm"
include "code/header.asm"
include "labels.asm"

; Include sources
section "Main", rom0
include "bank0.asm"

section "bank1",romx,bank[$01]
include "bank1.asm"

section "bank2",romx,bank[$02]
incbin "../bin/banks/bank_02_8000.bin"

section "bank3",romx,bank[$03]
include "bank3.asm"

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
incbin "../bin/banks/bank_0C_30000.bin"

section "bank13",romx,bank[$0D]
incbin "../bin/banks/bank_0D_34000.bin"

section "bank14",romx,bank[$0E]
incbin "../bin/banks/bank_0E_38000.bin"

section "bank15",romx,bank[$0F]
incbin "../bin/banks/bank_0F_3C000.bin"

section "bank16",romx,bank[$10]
incbin "../bin/banks/bank_10_40000.bin"

section "bank17",romx,bank[$11]
incbin "../bin/banks/bank_11_44000.bin"

section "bank18",romx,bank[$12]
incbin "../bin/banks/bank_12_48000.bin"

section "bank19",romx,bank[$13]
incbin "../bin/banks/bank_13_4C000.bin"

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
incbin "../bin/banks/bank_29_A4000.bin"

section "bank42",romx,bank[$2A]
incbin "../bin/banks/bank_2A_A8000.bin"

section "bank43",romx,bank[$2B]
incbin "../bin/banks/bank_2B_AC000.bin"

section "bank44",romx,bank[$2C]
incbin "../bin/banks/bank_2C_B0000.bin"

section "bank45",romx,bank[$2D]
incbin "../bin/banks/bank_2D_B4000.bin"

section "bank46",romx,bank[$2E]
incbin "../bin/banks/bank_2E_B8000.bin"

section "bank47",romx,bank[$2F]
incbin "gfx/bank_2F.2bpp"

section "bank48",romx,bank[$30]
incbin "gfx/intro/clouds-top.2bpp"
incbin "gfx/intro/clouds-middle.2bpp"
incbin "gfx/intro/clouds-bottom.2bpp"
incbin "gfx/bank_30.2bpp"

section "bank49",romx,bank[$31]
incbin "../bin/banks/bank_31_C4000.bin"

section "bank50",romx,bank[$32]
incbin "../bin/banks/bank_32_C8000.bin"

section "bank51",romx,bank[$33]
incbin "../bin/banks/bank_33_CC000.bin"

section "bank52",romx,bank[$34]
incbin "../bin/banks/bank_34_D0000.bin"

section "bank53",romx,bank[$35]
incbin "../bin/banks/bank_35_D4000.bin"

section "bank54",romx,bank[$36]
incbin "../bin/banks/bank_36_D8000.bin"

section "bank55",romx,bank[$37]
incbin "../bin/banks/bank_37_DC000.bin"

section "bank56",romx,bank[$38]
incbin "../bin/banks/bank_38_E0000.bin"

section "bank57",romx,bank[$39]
incbin "../bin/banks/bank_39_E4000.bin"

section "bank58",romx,bank[$3A]
incbin "../bin/banks/bank_3A_E8000.bin"

section "bank59",romx,bank[$3B]
incbin "../bin/banks/bank_3B_EC000.bin"

section "bank60",romx,bank[$3C]
incbin "../bin/banks/bank_3C_F0000.bin"

section "bank61",romx,bank[$3D]
incbin "../bin/banks/bank_3D_F4000.bin"

; Unused banks; make blank sections so they are filled with $00 instead of $ff to match
; the rom
section "bank62",romx,bank[$3E]
section "bank63",romx,bank[$3F]
