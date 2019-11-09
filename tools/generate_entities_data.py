#!/usr/bin/env python3
#
# Parse the ROM, and output asm files with the entities pointer tables and data.

import os
import argparse
from textwrap import dedent
from entities_parser import *

def BANK(bank_index):
    """Return the start address of a bank"""
    return bank_index * 0x4000

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
  'ARROW',
  'BOOMERANG',
  'BOMB',
  'HOOKSHOT_CHAIN',
  'HOOKSHOT_HIT',
  'LIFTABLE_ROCK',
  'PUSHED_BLOCK',
  'CHEST_WITH_ITEM',
  'MAGIC_POWDER_SPRINKLE',
  'OCTOROCK',
  'OCTOROCK_ROCK',
  'MOBLIN',
  'MOBLIN_ARROW',
  'TEKTITE',
  'LEEVER',
  'ARMOS_STATUE',
  'HIDING_GHINI',
  'GIANT_GHINI',
  'GHINI',
  'BROKEN_HEART_CONTAINER',
  'MOBLIN_SWORD',
  'ANTI_FAIRY',
  'SPARK_COUNTER_CLOCKWISE',
  'SPARK_CLOCKWISE',
  'POLS_VOICE',
  'KEESE',
  'STALFOS_AGGRESSIVE',
  'GEL',
  'MINI_GEL',
  'DISABLED',
  'STALFOS_EVASIVE',
  'GIBDO',
  'HARDHAT_BEETLE',
  'WIZROBE',
  'WIZROBE_PROJECTILE',
  'LIKE_LIKE',
  'IRON_MASK',
  'SMALL_EXPLOSION_ENEMY',
  'SMALL_EXPLOSION_ENEMY_2',
  'SPIKE_TRAP',
  'MIMIC',
  'MINI_MOLDORM',
  'LASER',
  'LASER_BEAM',
  'SPIKED_BEETLE',
  'DROPPABLE_HEART',
  'DROPPABLE_RUPEE',
  'DROPPABLE_FAIRY',
  'KEY_DROP_POINT',
  'SWORD',
  'ENTITY_32',
  'PIECE_OF_POWER',
  'GUARDIAN_ACORN',
  'HEART_PIECE',
  'HEART_CONTAINER',
  'DROPPABLE_ARROWS',
  'DROPPABLE_BOMBS',
  'INSTRUMENT_OF_THE_SIRENS',
  'SLEEPY_TOADSTOOL',
  'DROPPABLE_MAGIC_POWDER',
  'HIDING_SLIME_KEY',
  'DROPPABLE_SECRET_SEASHELL',
  'MARIN',
  'RACOON',
  'WITCH',
  'OWL_EVENT',
  'OWL_STATUE',
  'SEASHELL_MANSION_TREES',
  'YARNA_TALKING_BONES',
  'BOULDERS',
  'MOVING_BLOCK_LEFT_TOP',
  'MOVING_BLOCK_LEFT_BOTTOM',
  'MOVING_BLOCK_BOTTOM_LEFT',
  'MOVING_BLOCK_BOTTOM_RIGHT',
  'COLOR_DUNGEON_BOOK',
  'POT',
  'DISABLED',
  'SHOP_OWNER',
  'ENTITY_4E',
  'TRENDY_GAME_OWNER',
  'BOO_BUDDY',
  'KNIGHT',
  'TRACTOR_DEVICE',
  'TRACTOR_DEVICE_REVERSE',
  'FISHERMAN_FISHING_GAME',
  'BOUNCING_BOMBITE',
  'TIMER_BOMBITE',
  'PAIRODD',
  'ENTITY_58',
  'MOLDORM',
  'FACADE',
  'SLIME_EYE',
  'GENIE',
  'SLIME_EEL',
  'GHOMA',
  'MASTER_STALFOS',
  'DODONGO_SNAKE',
  'WARP',
  'HOT_HEAD',
  'EVIL_EAGLE',
  'ENTITY_64',
  'ANGLER_FISH',
  'CRYSTAL_SWITCH',
  'ENTITY_67',
  'ENTITY_68',
  'MOVING_BLOCK_MOVER',
  'RAFT_RAFT_OWNER',
  'TEXT_DEBUGGER',
  'CUCCO',
  'BOW_WOW',
  'BUTTERFLY',
  'DOG',
  'KID_70',
  'KID_71',
  'KID_72',
  'KID_73',
  'PAPAHLS_WIFE',
  'GRANDMA_ULRIRA',
  'MR_WRITE',
  'GRANDPA_ULRIRA',
  'YIP_YIP',
  'MADAM_MEOWMEOW',
  'CROW',
  'CRAZY_TRACY',
  'GIANT_GOPONGA_FLOWER',
  'GOPONGA_FLOWER_PROJECTILE',
  'GOPONGA_FLOWER',
  'TURTLE_ROCK_HEAD',
  'TELEPHONE',
  'ROLLING_BONES',
  'ROLLING_BONES_BAR',
  'DREAM_SHRINE_BED',
  'BIG_FAIRY',
  'MR_WRITES_BIRD',
  'FLOATING_ITEM',
  'DESERT_LANMOLA',
  'ARMOS_KNIGHT',
  'HINOX',
  'TILE_GLINT_SHOWN',
  'TILE_GLINT_HIDDEN',
  'ENTITY_8C',
  'ENTITY_8D',
  'CUE_BALL',
  'MASKED_MIMIC_GORIYA',
  'THREE_OF_A_KIND',
  'ANTI_KIRBY',
  'SMASHER',
  'MAD_BOMBER',
  'KANALET_BOMBABLE_WALL',
  'RICHARD',
  'RICHARD_FROG',
  'ENTITY_97',
  'HORSE_PIECE',
  'WATER_TEKTITE',
  'FLYING_TILES',
  'HIDING_GEL',
  'STAR',
  'LIFTABLE_STATUE',
  'FIREBALL_SHOOTER',
  'GOOMBA',
  'PEAHAT',
  'SNAKE',
  'PIRANHA_PLANT',
  'SIDE_VIEW_PLATFORM_HORIZONTAL',
  'SIDE_VIEW_PLATFORM_VERTICAL',
  'SIDE_VIEW_PLATFORM',
  'SIDE_VIEW_WEIGHTS',
  'SMASHABLE_PILLAR',
  'ENTITY_A8',
  'BLOOPER',
  'CHEEP_CHEEP_HORIZONTAL',
  'CHEEP_CHEEP_VERTICAL',
  'CHEEP_CHEEP_JUMPING',
  'KIKI_THE_MONKEY',
  'WINGED_OCTOROK',
  'TRADING_ITEM',
  'PINCER',
  'HOLE_FILLER',
  'BEETLE_SPAWNER',
  'HONEYCOMB',
  'TARIN',
  'BEAR',
  'PAPAHL',
  'MERMAID',
  'FISHERMAN_UNDER_BRIDGE',
  'BUZZ_BLOB',
  'BOMBER',
  'BUSH_CRAWLER',
  'GRIM_CREEPER',
  'VIRE',
  'BLAINO',
  'ZOMBIE',
  'MAZE_SIGNPOST',
  'MARIN_AT_THE_SHORE',
  'MARIN_AT_TAL_TAL_HEIGHTS',
  'MAMU_AND_FROGS',
  'WALRUS',
  'URCHIN',
  'SAND_CRAB',
  'MANBO_AND_FISHES',
  'BUNNY_CALLING_MARIN',
  'MUSICAL_NOTE',
  'MAD_BATTER',
  'ZORA',
  'FISH',
  'BANANAS_SCHULE_SALE',
  'MERMAID_STATUE',
  'SEASHELL_MANSION',
  'ANIMAL_D0',
  'ANIMAL_D1',
  'ANIMAL_D2',
  'BUNNY_D3',
  'ENTITY_D4',
  'ENTITY_D5',
  'SIDE_VIEW_POT',
  'THWIMP',
  'THWOMP',
  'THWOMP_RAMMABLE',
  'PODOBOO',
  'GIANT_BUBBLE',
  'FLYING_ROOSTER_EVENTS',
  'BOOK',
  'EGG_SONG_EVENT',
  'SWORD_BEAM',
  'MONKEY',
  'WITCH_RAT',
  'FLAME_SHOOTER',
  'POKEY',
  'MOBLIN_KING',
  'FLOATING_ITEM_2',
  'FINAL_NIGHTMARE',
  'KANALET_CASTLE_GATE_SWITCH',
  'ENDING_OWL_STAIR_CLIMBING',
  'COLOR_SHELL_RED',
  'COLOR_SHELL_GREEN',
  'COLOR_SHELL_BLUE',
  'COLOR_GHOUL_RED',
  'COLOR_GHOUL_GREEN',
  'COLOR_GHOUL_BLUE',
  'ROTOSWITCH_RED',
  'ROTOSWITCH_YELLOW',
  'ROTOSWITCH_BLUE',
  'FLYING_HOPPER_BOMBS',
  'HOPPER',
  'AVALAUNCH',
  'BOUNCING_BOULDER',
  'COLOR_GUARDIAN_BLUE',
  'COLOR_GUARDIAN_RED',
  'GIANT_BUZZ_BLOB',
  'HARDHIT_BEETLE',
  'PHOTOGRAPHER',
  'UNUSED',
  'UNUSED',
  'UNUSED',
  'UNUSED',
  'UNUSED'
]

def humanize(entity_type):
    type = entity_types[entity_type]
    if type.startswith('ENTITY'):
        return type
    else:
        return 'ENTITY_' + type

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
            asm += f"  db   ${entity.position:02X}, {humanize(entity.type)}\n"
        asm += "  db   ENTITIES_END\n\n"
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
