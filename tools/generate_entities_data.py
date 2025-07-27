#!/usr/bin/env python3
#
# Parse the ROM, and output asm files with the entities pointer tables and data.

import os
import argparse
from textwrap import dedent
from lib.entities_parser import *
from lib.utils import BANK

entities_descriptors = [
    EntitiesTableDescriptor(
        name = 'overworld',
        address = BANK(0x16) + 0x000,
        length = 0x200,
        entities = EntitiesDescriptor(
            address = BANK(0x16) + 0x1186,
            length = 0x4DE
        )
    ),
    EntitiesTableDescriptor(
        name = 'indoors_a',
        address = BANK(0x16) + 0x200,
        length = 0x200,
        entities = EntitiesDescriptor(
            address = BANK(0x16) + 0x0640,
            length = 0x664
        )
    ),
    EntitiesTableDescriptor(
        name = 'indoors_b',
        address = BANK(0x16) + 0x400,
        length = 0x200,
        entities = EntitiesDescriptor(
            address = BANK(0x16) + 0x0CA4,
            length = 0x4E2
        )
    ),
    EntitiesTableDescriptor(
        name = 'color_dungeon',
        address = BANK(0x16) + 0x600,
        length = 0x40,
        entities = EntitiesDescriptor(
            address = BANK(0x16) + 0x1664,
            length = 0x9D
        )
    )
]

# See code/constants/entities.asm
entity_types = [
  'ENTITY_ARROW',
  'ENTITY_BOOMERANG',
  'ENTITY_BOMB',
  'ENTITY_HOOKSHOT_CHAIN',
  'ENTITY_MAGIC_ROD_FIREBALL',
  'ENTITY_LIFTABLE_ROCK',
  'ENTITY_PUSHED_BLOCK',
  'ENTITY_CHEST_WITH_ITEM',
  'ENTITY_MAGIC_POWDER_SPRINKLE',
  'ENTITY_OCTOROK',
  'ENTITY_OCTOROK_ROCK',
  'ENTITY_MOBLIN',
  'ENTITY_MOBLIN_ARROW',
  'ENTITY_TEKTITE',
  'ENTITY_LEEVER',
  'ENTITY_ARMOS_STATUE',
  'ENTITY_HIDING_GHINI',
  'ENTITY_GIANT_GHINI',
  'ENTITY_GHINI',
  'ENTITY_BROKEN_HEART_CONTAINER',
  'ENTITY_MOBLIN_SWORD',
  'ENTITY_ANTI_FAIRY',
  'ENTITY_SPARK_COUNTER_CLOCKWISE',
  'ENTITY_SPARK_CLOCKWISE',
  'ENTITY_POLS_VOICE',
  'ENTITY_KEESE',
  'ENTITY_STALFOS_AGGRESSIVE',
  'ENTITY_ZOL',
  'ENTITY_GEL',
  'DISABLED',
  'ENTITY_STALFOS_EVASIVE',
  'ENTITY_GIBDO',
  'ENTITY_HARDHAT_BEETLE',
  'ENTITY_WIZROBE',
  'ENTITY_WIZROBE_PROJECTILE',
  'ENTITY_LIKE_LIKE',
  'ENTITY_IRON_MASK',
  'ENTITY_SMALL_EXPLOSION_ENEMY',
  'ENTITY_SMALL_EXPLOSION_ENEMY_2',
  'ENTITY_SPIKE_TRAP',
  'ENTITY_MIMIC',
  'ENTITY_MINI_MOLDORM',
  'ENTITY_LASER',
  'ENTITY_LASER_BEAM',
  'ENTITY_SPIKED_BEETLE',
  'ENTITY_DROPPABLE_HEART',
  'ENTITY_DROPPABLE_RUPEE',
  'ENTITY_DROPPABLE_FAIRY',
  'ENTITY_KEY_DROP_POINT',
  'ENTITY_SWORD_SHIELD_PICKUP',
  'ENTITY_IRON_MASKS_MASK',
  'ENTITY_PIECE_OF_POWER',
  'ENTITY_GUARDIAN_ACORN',
  'ENTITY_HEART_PIECE',
  'ENTITY_HEART_CONTAINER',
  'ENTITY_DROPPABLE_ARROWS',
  'ENTITY_DROPPABLE_BOMBS',
  'ENTITY_INSTRUMENT_OF_THE_SIRENS',
  'ENTITY_SLEEPY_TOADSTOOL',
  'ENTITY_DROPPABLE_MAGIC_POWDER',
  'ENTITY_HIDING_SLIME_KEY',
  'ENTITY_DROPPABLE_SECRET_SEASHELL',
  'ENTITY_MARIN',
  'ENTITY_TARIN',
  'ENTITY_WITCH',
  'ENTITY_OWL_EVENT',
  'ENTITY_OWL_STATUE',
  'ENTITY_SEASHELL_MANSION_TREES',
  'ENTITY_YARNA_TALKING_BONES',
  'ENTITY_BOULDERS',
  'ENTITY_MOVING_BLOCK_LEFT_TOP',
  'ENTITY_MOVING_BLOCK_LEFT_BOTTOM',
  'ENTITY_MOVING_BLOCK_BOTTOM_LEFT',
  'ENTITY_MOVING_BLOCK_BOTTOM_RIGHT',
  'ENTITY_COLOR_DUNGEON_BOOK',
  'ENTITY_POT',
  'DISABLED',
  'ENTITY_SHOP_OWNER',
  'ENTITY_4E',
  'ENTITY_TRENDY_GAME_OWNER',
  'ENTITY_BOO_BUDDY',
  'ENTITY_KNIGHT',
  'ENTITY_TRACTOR_DEVICE',
  'ENTITY_TRACTOR_DEVICE_REVERSE',
  'ENTITY_FISHERMAN_FISHING_GAME',
  'ENTITY_BOUNCING_BOMBITE',
  'ENTITY_TIMER_BOMBITE',
  'ENTITY_PAIRODD',
  'ENTITY_PAIRODD_PROJECTILE',
  'ENTITY_MOLDORM',
  'ENTITY_FACADE',
  'ENTITY_SLIME_EYE',
  'ENTITY_GENIE',
  'ENTITY_SLIME_EEL',
  'ENTITY_GHOMA',
  'ENTITY_MASTER_STALFOS',
  'ENTITY_DODONGO_SNAKE',
  'ENTITY_WARP',
  'ENTITY_HOT_HEAD',
  'ENTITY_EVIL_EAGLE',
  'ENTITY_SOUTH_FACE_SHRINE_DOOR',
  'ENTITY_ANGLER_FISH',
  'ENTITY_CRYSTAL_SWITCH',
  'ENTITY_67',
  'ENTITY_HOOKSHOT_BRIDGE',
  'ENTITY_MOVING_BLOCK_MOVER',
  'ENTITY_RAFT_RAFT_OWNER',
  'ENTITY_TEXT_DEBUGGER',
  'ENTITY_CUCCO',
  'ENTITY_BOW_WOW',
  'ENTITY_BUTTERFLY',
  'ENTITY_DOG',
  'ENTITY_KID_70',
  'ENTITY_KID_71',
  'ENTITY_KID_72',
  'ENTITY_KID_73',
  'ENTITY_PAPAHLS_WIFE',
  'ENTITY_GRANDMA_ULRIRA',
  'ENTITY_MR_WRITE',
  'ENTITY_GRANDPA_ULRIRA',
  'ENTITY_YIP_YIP',
  'ENTITY_MADAM_MEOWMEOW',
  'ENTITY_CROW',
  'ENTITY_CRAZY_TRACY',
  'ENTITY_GIANT_GOPONGA_FLOWER',
  'ENTITY_GOPONGA_FLOWER_PROJECTILE',
  'ENTITY_GOPONGA_FLOWER',
  'ENTITY_TURTLE_ROCK_HEAD',
  'ENTITY_TELEPHONE',
  'ENTITY_ROLLING_BONES',
  'ENTITY_ROLLING_BONES_BAR',
  'ENTITY_DREAM_SHRINE_BED',
  'ENTITY_BIG_FAIRY',
  'ENTITY_MR_WRITES_BIRD',
  'ENTITY_FLOATING_ITEM',
  'ENTITY_DESERT_LANMOLA',
  'ENTITY_ARMOS_KNIGHT',
  'ENTITY_HINOX',
  'ENTITY_TILE_GLINT_SHOWN',
  'ENTITY_TILE_GLINT_HIDDEN',
  'ENTITY_RAISABLE_BLOCK_SHIFTED_RIGHT',
  'ENTITY_RAISABLE_BLOCK_SHIFTED_DOWN',
  'ENTITY_CUE_BALL',
  'ENTITY_MASKED_MIMIC_GORIYA',
  'ENTITY_THREE_OF_A_KIND',
  'ENTITY_ANTI_KIRBY',
  'ENTITY_SMASHER',
  'ENTITY_MAD_BOMBER',
  'ENTITY_KANALET_BOMBABLE_WALL',
  'ENTITY_RICHARD',
  'ENTITY_RICHARD_FROG',
  'ENTITY_DIVABLE_WATER',
  'ENTITY_HORSE_PIECE',
  'ENTITY_WATER_TEKTITE',
  'ENTITY_FLYING_TILES',
  'ENTITY_HIDING_ZOL',
  'ENTITY_STAR',
  'ENTITY_LIFTABLE_STATUE',
  'ENTITY_FIREBALL_SHOOTER',
  'ENTITY_GOOMBA',
  'ENTITY_PEAHAT',
  'ENTITY_SNAKE',
  'ENTITY_PIRANHA_PLANT',
  'ENTITY_SIDE_VIEW_PLATFORM_HORIZONTAL',
  'ENTITY_SIDE_VIEW_PLATFORM_VERTICAL',
  'ENTITY_SIDE_VIEW_PLATFORM',
  'ENTITY_SIDE_VIEW_WEIGHTS',
  'ENTITY_SMASHABLE_PILLAR',
  'ENTITY_A8',
  'ENTITY_BLOOPER',
  'ENTITY_CHEEP_CHEEP_HORIZONTAL',
  'ENTITY_CHEEP_CHEEP_VERTICAL',
  'ENTITY_CHEEP_CHEEP_JUMPING',
  'ENTITY_KIKI_THE_MONKEY',
  'ENTITY_WINGED_OCTOROK',
  'ENTITY_TRADING_ITEM',
  'ENTITY_PINCER',
  'ENTITY_HOLE_FILLER',
  'ENTITY_BEETLE_SPAWNER',
  'ENTITY_HONEYCOMB',
  'ENTITY_TARIN_BEEKEEPER',
  'ENTITY_BEAR',
  'ENTITY_PAPAHL',
  'ENTITY_MERMAID',
  'ENTITY_FISHERMAN_UNDER_BRIDGE',
  'ENTITY_BUZZ_BLOB',
  'ENTITY_BOMBER',
  'ENTITY_BUSH_CRAWLER',
  'ENTITY_GRIM_CREEPER',
  'ENTITY_VIRE',
  'ENTITY_BLAINO',
  'ENTITY_ZOMBIE',
  'ENTITY_MAZE_SIGNPOST',
  'ENTITY_MARIN_AT_THE_SHORE',
  'ENTITY_MARIN_AT_TAL_TAL_HEIGHTS',
  'ENTITY_MAMU_AND_FROGS',
  'ENTITY_WALRUS',
  'ENTITY_URCHIN',
  'ENTITY_SAND_CRAB',
  'ENTITY_MANBO_AND_FISHES',
  'ENTITY_BUNNY_CALLING_MARIN',
  'ENTITY_MUSICAL_NOTE',
  'ENTITY_MAD_BATTER',
  'ENTITY_ZORA',
  'ENTITY_FISH',
  'ENTITY_BANANAS_SCHULE_SALE',
  'ENTITY_MERMAID_STATUE',
  'ENTITY_SEASHELL_MANSION',
  'ENTITY_ANIMAL_D0',
  'ENTITY_ANIMAL_D1',
  'ENTITY_ANIMAL_D2',
  'ENTITY_BUNNY_D3',
  'ENTITY_GHOST',
  'ENTITY_ROOSTER',
  'ENTITY_SIDE_VIEW_POT',
  'ENTITY_THWIMP',
  'ENTITY_THWOMP',
  'ENTITY_THWOMP_RAMMABLE',
  'ENTITY_PODOBOO',
  'ENTITY_GIANT_BUBBLE',
  'ENTITY_FLYING_ROOSTER_EVENTS',
  'ENTITY_BOOK',
  'ENTITY_EGG_SONG_EVENT',
  'ENTITY_SWORD_BEAM',
  'ENTITY_MONKEY',
  'ENTITY_WITCH_RAT',
  'ENTITY_FLAME_SHOOTER',
  'ENTITY_POKEY',
  'ENTITY_MOBLIN_KING',
  'ENTITY_FLOATING_ITEM_2',
  'ENTITY_FINAL_NIGHTMARE',
  'ENTITY_KANALET_CASTLE_GATE_SWITCH',
  'ENTITY_ENDING_OWL_STAIR_CLIMBING',
  'ENTITY_COLOR_SHELL_RED',
  'ENTITY_COLOR_SHELL_GREEN',
  'ENTITY_COLOR_SHELL_BLUE',
  'ENTITY_COLOR_GHOUL_RED',
  'ENTITY_COLOR_GHOUL_GREEN',
  'ENTITY_COLOR_GHOUL_BLUE',
  'ENTITY_ROTOSWITCH_RED',
  'ENTITY_ROTOSWITCH_YELLOW',
  'ENTITY_ROTOSWITCH_BLUE',
  'ENTITY_FLYING_HOPPER_BOMBS',
  'ENTITY_HOPPER',
  'ENTITY_AVALAUNCH',
  'ENTITY_BOUNCING_BOULDER',
  'ENTITY_COLOR_GUARDIAN_BLUE',
  'ENTITY_COLOR_GUARDIAN_RED',
  'ENTITY_GIANT_BUZZ_BLOB',
  'ENTITY_HARDHIT_BEETLE',
  'ENTITY_PHOTOGRAPHER',
  'UNUSED',
  'UNUSED',
  'UNUSED',
  'UNUSED',
  'UNUSED'
]

def to_camel_case(snake_str):
    """Convert a string from snake_case to CamelCase"""
    return ''.join(w.title() for w in snake_str.split('_'))

class PointersTableFormatter:
    @classmethod
    def to_asm(cls, table_name):
        return f"{to_camel_case(table_name)}EntitiesPointersTable::\n"

class PointerFormatter:
    @classmethod
    def to_asm(cls, table_name, pointer):
        room_label = "{}{:02X}".format(to_camel_case(table_name), pointer.index)
        return f"  dw    {room_label}Entities  ; ${pointer.address:04X}\n"

class EntitiesListFormatter:
    @classmethod
    def to_asm(cls, list, table_name, pointers):
        asm = ""
        for pointer in pointers:
            room_label = "{}{:02X}".format(to_camel_case(table_name), pointer.index)
            asm += f"{room_label}Entities::\n"

        for entity in list.entities:
            asm += f"  entity ${entity.vertical:01X}, ${entity.horizontal:01X}, {entity_types[entity.type]}\n"
        asm += "  entities_end\n\n"
        return asm


if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument("rompath", nargs="?", metavar="rompath", type=str)
    arg_parser.add_argument("target", nargs="?", metavar="target", type=str)

    args = arg_parser.parse_args()
    rom_path = args.rompath or 'Zelda.gbc'
    target_dir = args.target or os.path.join('src', 'data', 'entities')
    disclaimer = "; File generated automatically by `tools/generate_entities_data.py`\n\n"

    pointers_file = open(os.path.join(target_dir, 'pointers_table' + '.asm'), 'w')
    pointers_file.write(disclaimer)

    for entities_descriptor in entities_descriptors:
        # Parse entities table and lists
        entities_table_parser = EntitiesTableParser(rom_path, entities_descriptor)
        pointers_file.write(PointersTableFormatter.to_asm(entities_table_parser.name))

        # Append to the pointers file
        for index, pointer in enumerate(entities_table_parser.pointers):
            pointers_file.write(PointerFormatter.to_asm(entities_table_parser.name, pointer))
        pointers_file.write("\n")

        # Write entities
        entities_file = open(os.path.join(target_dir, entities_table_parser.name + '.asm'), 'w')
        entities_file.write(disclaimer)

        for index, list in enumerate(entities_table_parser.entities_lists):
            pointers = entities_table_parser.pointers_for_list(list)
            entities_file.write(EntitiesListFormatter.to_asm(list, entities_table_parser.name, pointers))

        entities_file.close()

    pointers_file.close()
