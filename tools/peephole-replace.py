#!/usr/bin/env python3
#
# Replace numeric values with labeled constants, using pattern matching.
#
# Usage:
#  1. add a new PeepholeRule to the array,
#  2. run the script.

import re
import os
from enum import IntFlag

class PeepholeRule:
    """
    Defines a multi-line input with a searchable pattern, and a way to
    retrieve a replacement value when the pattern is found.

    input: an array of successive lines to match, with a searchable pattern.
           The pattern is @ for an hex digit (optionally prefixed by '$').
           Several numbers can be matched (e.g. $@@@@).
    replacements: an Hash or lambda providing a replacement for the value matched.
    """
    def __init__(self, input, replacements):
        self.input = input
        self.rules = []
        self.replacements = replacements
        for line in input.split("\n"):
            line = line.strip()
            if not line:
                continue
            line = re.escape(line).replace(" ", " +")
            line = re.sub(r"(\\\$)?@+", r"([\$]?[A-F0-9]+)\\b", line)
            self.rules.append(re.compile(line))

    def process(self, lines):
        for index, line in enumerate(lines):
            if self.rules[0].search(line):
                found = True
                for rule_index, rule in enumerate(self.rules):
                    if not rule.search(lines[index+rule_index]):
                        found = False
                        break
                if not found:
                    continue
                for rule_index, rule in enumerate(self.rules):
                    m = rule.search(lines[index+rule_index])
                    if m.groups():
                        value = int(m.group(1).replace('$', ''), 16)
                        replacement = self.replacements(value) if callable(self.replacements) else self.replacements.get(value)
                        if replacement:
                            line = lines[index+rule_index]
                            line = line[:m.start(1)] + replacement + line[m.start(1) + len(m.group(1)):]
                            # Fix spaces alignment
                            replacement_len_delta = len(replacement) - len(m.group(1))
                            line = re.sub(f"[ ]{{{replacement_len_delta}}}; ", "; ", line)
                            # Print log
                            print(lines[index+rule_index])
                            print(" -> ")
                            print(line)
                            lines[index+rule_index] = line
                        else:
                            print(f"Replacement value missing for: {m.group(1)}:{self.input}")

ENTITY_OPT1_BITS = {
    7: "ENTITY_OPT1_B_IS_BOSS",
    6: "ENTITY_OPT1_B_SWORD_CLINK_OFF",
    5: "ENTITY_OPT1_B_ALLOW_OUT_OF_BOUNDS",
    4: "ENTITY_OPT1_B_NO_GROUND_INTERACTION",
    3: "ENTITY_OPT1_B_SPLASH_IN_WATER",
    2: "ENTITY_OPT1_B_IS_MINI_BOSS",
    1: "ENTITY_OPT1_B_EXCLUDED_FROM_KILL_ALL",
    0: "ENTITY_OPT1_B_NO_WALL_COLLISION"
}

class EntityOpt1Flag(IntFlag):
    ENTITY_OPT1_IS_BOSS                = 0x80
    ENTITY_OPT1_SWORD_CLINK_OFF        = 0x40
    ENTITY_OPT1_ALLOW_OUT_OF_BOUNDS    = 0x20
    ENTITY_OPT1_NO_GROUND_INTERACTION       = 0x10
    ENTITY_OPT1_SPLASH_IN_WATER        = 0x08
    ENTITY_OPT1_IS_MINI_BOSS           = 0x04
    ENTITY_OPT1_EXCLUDED_FROM_KILL_ALL = 0x02
    ENTITY_OPT1_NO_WALL_COLLISION         = 0x01
    ENTITY_OPT1_NONE                   = 0x00

class RoomStatusFlag(IntFlag):
    ROOM_STATUS_NONE            = 0x00
    ROOM_STATUS_DOOR_OPEN_RIGHT = 0x01
    ROOM_STATUS_DOOR_OPEN_LEFT  = 0x02
    ROOM_STATUS_DOOR_OPEN_UP    = 0x04
    ROOM_STATUS_DOOR_OPEN_DOWN  = 0x08
    ROOM_STATUS_EVENT_1         = 0x10
    ROOM_STATUS_EVENT_2         = 0x20
    ROOM_STATUS_EVENT_3         = 0x40
    ROOM_STATUS_VISITED         = 0x80

def flags_from_enum(enum_value):
    """
    Returns the string representation of an enum value.
    Example:
      enum_value = EntityOpt1Flag($C0)
      flags_from_enum(enum_value) # -> "ENTITY_OPT1_IS_BOSS|ENTITY_OPT1_SWORD_CLINK_OFF"                               ; $6902: $36 $C0
    """
    return str(enum_value).replace(f"{type(enum_value).__name__}.", '')


def read_enum(filename, prefix):
    result = {}
    basepath = os.path.dirname(__file__)
    for line in open(os.path.join(basepath, "..", "src", filename), "rt"):
        line = line.strip()
        if ';' in line:
            line = line[:line.find(';')]
        if line.startswith(prefix):
            if " equ " in line:
                line = line.split(" equ ")
                value = line[0].strip()
                key = line[1].strip()
                if key.startswith('$'):
                    key = int(key[1:], 16)
                    result[key] = value
    return result


rules = [
    PeepholeRule("""
        ldh a, [hMapId]
        cp $@@
    """, {
        0x00: "MAP_TAIL_CAVE",
        0x01: "MAP_BOTTLE_GROTTO",
        0x02: "MAP_KEY_CAVERN",
        0x03: "MAP_ANGLERS_TUNNEL",
        0x04: "MAP_CATFISHS_MAW",
        0x05: "MAP_FACE_SHRINE",
        0x06: "MAP_EAGLES_TOWER",
        0x07: "MAP_TURTLE_ROCK",
        0x08: "MAP_WINDFISHS_EGG",
        0x09: "MAP_09_UNUSED",
        0x0A: "MAP_CAVE_B",
        0x0B: "MAP_DUNGEON_G1",
        0x0C: "MAP_EAGLES_TOWER_ALT",
        0x0D: "MAP_DUNGEON_G3",
        0x0E: "MAP_SHOP",
        0x0F: "MAP_MINIGAME",
        0x10: "MAP_HOUSE",
        0x11: "MAP_CAVE_C",
        0x12: "MAP_DOGHOUSE",
        0x13: "MAP_DREAM_SHRINE",
        0x14: "MAP_KANALET",
        0x15: "MAP_BOWWOW_HIDEOUT",
        0x16: "MAP_S_FACE_SHRINE",
        0x17: "MAP_UNKNOWN_17",
        0x18: "MAP_UNKNOWN_18",
        0x19: "MAP_UNKNOWN_19",
        0x1A: "MAP_UNKNOWN_1A",
        0x1B: "MAP_UNKNOWN_1B",
        0x1C: "MAP_UNKNOWN_1C",
        0x1D: "MAP_LIBRARY",
        0x1E: "MAP_GHOST_HOUSE",
        0x1F: "MAP_CAVE_WATER",
        0xFF: "MAP_COLOR_DUNGEON"
    }),
    PeepholeRule("""
        ld a, $@@
        call SpawnNewEntity_trampoline
    """, {
        0x00: "ENTITY_ARROW",
        0x01: "ENTITY_BOOMERANG",
        0x02: "ENTITY_BOMB",
        0x03: "ENTITY_HOOKSHOT_CHAIN",
        0x04: "ENTITY_MAGIC_ROD_FIREBALL",
        0x05: "ENTITY_LIFTABLE_ROCK",
        0x06: "ENTITY_PUSHED_BLOCK",
        0x07: "ENTITY_CHEST_WITH_ITEM",
        0x08: "ENTITY_MAGIC_POWDER_SPRINKLE",
        0x09: "ENTITY_OCTOROK",
        0x0A: "ENTITY_OCTOROK_ROCK",
        0x0B: "ENTITY_MOBLIN",
        0x0C: "ENTITY_MOBLIN_ARROW",
        0x0D: "ENTITY_TEKTITE",
        0x0E: "ENTITY_LEEVER",
        0x0F: "ENTITY_ARMOS_STATUE",
        0x10: "ENTITY_HIDING_GHINI",
        0x11: "ENTITY_GIANT_GHINI",
        0x12: "ENTITY_GHINI",
        0x13: "ENTITY_BROKEN_HEART_CONTAINER",
        0x14: "ENTITY_MOBLIN_SWORD",
        0x15: "ENTITY_ANTI_FAIRY",
        0x16: "ENTITY_SPARK_COUNTER_CLOCKWISE",
        0x17: "ENTITY_SPARK_CLOCKWISE",
        0x18: "ENTITY_POLS_VOICE",
        0x19: "ENTITY_KEESE",
        0x1A: "ENTITY_STALFOS_AGGRESSIVE",
        0x1B: "ENTITY_ZOL",
        0x1C: "ENTITY_GEL",
        0x1D: "ENTITY_DISABLED",
        0x1E: "ENTITY_STALFOS_EVASIVE",
        0x1F: "ENTITY_GIBDO",
        0x20: "ENTITY_HARDHAT_BEETLE",
        0x21: "ENTITY_WIZROBE",
        0x22: "ENTITY_WIZROBE_PROJECTILE",
        0x23: "ENTITY_LIKE_LIKE",
        0x24: "ENTITY_IRON_MASK",
        0x25: "ENTITY_SMALL_EXPLOSION_ENEMY",
        0x26: "ENTITY_SMALL_EXPLOSION_ENEMY_2",
        0x27: "ENTITY_SPIKE_TRAP",
        0x28: "ENTITY_MIMIC",
        0x29: "ENTITY_MINI_MOLDORM",
        0x2A: "ENTITY_LASER",
        0x2B: "ENTITY_LASER_BEAM",
        0x2C: "ENTITY_SPIKED_BEETLE",
        0x2D: "ENTITY_DROPPABLE_HEART",
        0x2E: "ENTITY_DROPPABLE_RUPEE",
        0x2F: "ENTITY_DROPPABLE_FAIRY",
        0x30: "ENTITY_KEY_DROP_POINT",
        0x31: "ENTITY_SWORD_SHIELD_PICKUP",
        0x32: "ENTITY_IRON_MASKS_MASK",
        0x33: "ENTITY_PIECE_OF_POWER",
        0x34: "ENTITY_GUARDIAN_ACORN",
        0x35: "ENTITY_HEART_PIECE",
        0x36: "ENTITY_HEART_CONTAINER",
        0x37: "ENTITY_DROPPABLE_ARROWS",
        0x38: "ENTITY_DROPPABLE_BOMBS",
        0x39: "ENTITY_INSTRUMENT_OF_THE_SIRENS",
        0x3A: "ENTITY_SLEEPY_TOADSTOOL",
        0x3B: "ENTITY_DROPPABLE_MAGIC_POWDER",
        0x3C: "ENTITY_HIDING_SLIME_KEY",
        0x3D: "ENTITY_DROPPABLE_SECRET_SEASHELL",
        0x3E: "ENTITY_MARIN",
        0x3F: "ENTITY_TARIN",
        0x40: "ENTITY_WITCH",
        0x41: "ENTITY_OWL_EVENT",
        0x42: "ENTITY_OWL_STATUE",
        0x43: "ENTITY_SEASHELL_MANSION_TREES",
        0x44: "ENTITY_YARNA_TALKING_BONES",
        0x45: "ENTITY_BOULDERS",
        0x46: "ENTITY_MOVING_BLOCK_LEFT_TOP",
        0x47: "ENTITY_MOVING_BLOCK_LEFT_BOTTOM",
        0x48: "ENTITY_MOVING_BLOCK_BOTTOM_LEFT",
        0x49: "ENTITY_MOVING_BLOCK_BOTTOM_RIGHT",
        0x4A: "ENTITY_COLOR_DUNGEON_BOOK",
        0x4B: "ENTITY_POT",
        0x4C: "ENTITY_DISABLED",
        0x4D: "ENTITY_SHOP_OWNER",
        0x4E: "ENTITY_4D",
        0x4F: "ENTITY_TRENDY_GAME_OWNER",
        0x50: "ENTITY_BOO_BUDDY",
        0x51: "ENTITY_KNIGHT",
        0x52: "ENTITY_TRACTOR_DEVICE",
        0x53: "ENTITY_TRACTOR_DEVICE_REVERSE",
        0x54: "ENTITY_FISHERMAN_FISHING_GAME",
        0x55: "ENTITY_BOUNCING_BOMBITE",
        0x56: "ENTITY_TIMER_BOMBITE",
        0x57: "ENTITY_PAIRODD",
        0x58: "ENTITY_PAIRODD_PROJECTILE",
        0x59: "ENTITY_MOLDORM",
        0x5A: "ENTITY_FACADE",
        0x5B: "ENTITY_SLIME_EYE",
        0x5C: "ENTITY_GENIE",
        0x5D: "ENTITY_SLIME_EEL",
        0x5E: "ENTITY_GHOMA",
        0x5F: "ENTITY_MASTER_STALFOS",
        0x60: "ENTITY_DODONGO_SNAKE",
        0x61: "ENTITY_WARP",
        0x62: "ENTITY_HOT_HEAD",
        0x63: "ENTITY_EVIL_EAGLE",
        0x64: "ENTITY_SOUTH_FACE_SHRINE_DOOR",
        0x65: "ENTITY_ANGLER_FISH",
        0x66: "ENTITY_CRYSTAL_SWITCH",
        0x67: "ENTITY_67",
        0x68: "ENTITY_HOOKSHOT_BRIDGE",
        0x69: "ENTITY_MOVING_BLOCK_MOVER",
        0x6A: "ENTITY_RAFT_RAFT_OWNER",
        0x6B: "ENTITY_TEXT_DEBUGGER",
        0x6C: "ENTITY_CUCCO",
        0x6D: "ENTITY_BOW_WOW",
        0x6E: "ENTITY_BUTTERFLY",
        0x6F: "ENTITY_DOG",
        0x70: "ENTITY_KID_70",
        0x71: "ENTITY_KID_71",
        0x72: "ENTITY_KID_72",
        0x73: "ENTITY_KID_73",
        0x74: "ENTITY_PAPAHLS_WIFE",
        0x75: "ENTITY_GRANDMA_ULRIRA",
        0x76: "ENTITY_MR_WRITE",
        0x77: "ENTITY_GRANDPA_ULRIRA",
        0x78: "ENTITY_YIP_YIP",
        0x79: "ENTITY_MADAM_MEOWMEOW",
        0x7A: "ENTITY_CROW",
        0x7B: "ENTITY_CRAZY_TRACY",
        0x7C: "ENTITY_GIANT_GOPONGA_FLOWER",
        0x7D: "ENTITY_GOPONGA_FLOWER_PROJECTILE",
        0x7E: "ENTITY_GOPONGA_FLOWER",
        0x7F: "ENTITY_TURTLE_ROCK_HEAD",
        0x80: "ENTITY_TELEPHONE",
        0x81: "ENTITY_ROLLING_BONES",
        0x82: "ENTITY_ROLLING_BONES_BAR",
        0x83: "ENTITY_DREAM_SHRINE_BED",
        0x84: "ENTITY_BIG_FAIRY",
        0x85: "ENTITY_MR_WRITES_BIRD",
        0x86: "ENTITY_FLOATING_ITEM",
        0x87: "ENTITY_DESERT_LANMOLA",
        0x88: "ENTITY_ARMOS_KNIGHT",
        0x89: "ENTITY_HINOX",
        0x8A: "ENTITY_TILE_GLINT_SHOWN",
        0x8B: "ENTITY_TILE_GLINT_HIDDEN",
        0x8C: "ENTITY_RAISABLE_BLOCK_SHIFTED_RIGHT",
        0x8D: "ENTITY_RAISABLE_BLOCK_SHIFTED_DOWN",
        0x8E: "ENTITY_CUE_BALL",
        0x8F: "ENTITY_MASKED_MIMIC_GORIYA",
        0x90: "ENTITY_THREE_OF_A_KIND",
        0x91: "ENTITY_ANTI_KIRBY",
        0x92: "ENTITY_SMASHER",
        0x93: "ENTITY_MAD_BOMBER",
        0x94: "ENTITY_KANALET_BOMBABLE_WALL",
        0x95: "ENTITY_RICHARD",
        0x96: "ENTITY_RICHARD_FROG",
        0x97: "ENTITY_DIVABLE_WATER",
        0x98: "ENTITY_HORSE_PIECE",
        0x99: "ENTITY_WATER_TEKTITE",
        0x9A: "ENTITY_FLYING_TILES",
        0x9B: "ENTITY_HIDING_ZOL",
        0x9C: "ENTITY_STAR",
        0x9D: "ENTITY_LIFTABLE_STATUE",
        0x9E: "ENTITY_FIREBALL_SHOOTER",
        0x9F: "ENTITY_GOOMBA",
        0xA0: "ENTITY_PEAHAT",
        0xA1: "ENTITY_SNAKE",
        0xA2: "ENTITY_PIRANHA_PLANT",
        0xA3: "ENTITY_SIDE_VIEW_PLATFORM_HORIZONTAL",
        0xA4: "ENTITY_SIDE_VIEW_PLATFORM_VERTICAL",
        0xA5: "ENTITY_SIDE_VIEW_PLATFORM",
        0xA6: "ENTITY_SIDE_VIEW_WEIGHTS",
        0xA7: "ENTITY_SMASHABLE_PILLAR",
        0xA8: "ENTITY_WRECKING_BALL",
        0xA9: "ENTITY_BLOOPER",
        0xAA: "ENTITY_CHEEP_CHEEP_HORIZONTAL",
        0xAB: "ENTITY_CHEEP_CHEEP_VERTICAL",
        0xAC: "ENTITY_CHEEP_CHEEP_JUMPING",
        0xAD: "ENTITY_KIKI_THE_MONKEY",
        0xAE: "ENTITY_WINGED_OCTOROK",
        0xAF: "ENTITY_TRADING_ITEM",
        0xB0: "ENTITY_PINCER",
        0xB1: "ENTITY_HOLE_FILLER",
        0xB2: "ENTITY_BEETLE_SPAWNER",
        0xB3: "ENTITY_HONEYCOMB",
        0xB4: "ENTITY_TARIN_BEEKEEPER",
        0xB5: "ENTITY_BEAR",
        0xB6: "ENTITY_PAPAHL",
        0xB7: "ENTITY_MERMAID",
        0xB8: "ENTITY_FISHERMAN_UNDER_BRIDGE",
        0xB9: "ENTITY_BUZZ_BLOB",
        0xBA: "ENTITY_BOMBER",
        0xBB: "ENTITY_BUSH_CRAWLER",
        0xBC: "ENTITY_GRIM_CREEPER",
        0xBD: "ENTITY_VIRE",
        0xBE: "ENTITY_BLAINO",
        0xBF: "ENTITY_ZOMBIE",
        0xC0: "ENTITY_MAZE_SIGNPOST",
        0xC1: "ENTITY_MARIN_AT_THE_SHORE",
        0xC2: "ENTITY_MARIN_AT_TAL_TAL_HEIGHTS",
        0xC3: "ENTITY_MAMU_AND_FROGS",
        0xC4: "ENTITY_WALRUS",
        0xC5: "ENTITY_URCHIN",
        0xC6: "ENTITY_SAND_CRAB",
        0xC7: "ENTITY_MANBO_AND_FISHES",
        0xC8: "ENTITY_BUNNY_CALLING_MARIN",
        0xC9: "ENTITY_MUSICAL_NOTE",
        0xCA: "ENTITY_MAD_BATTER",
        0xCB: "ENTITY_ZORA",
        0xCC: "ENTITY_FISH",
        0xCD: "ENTITY_BANANAS_SCHULE_SALE",
        0xCE: "ENTITY_MERMAID_STATUE",
        0xCF: "ENTITY_SEASHELL_MANSION",
        0xD0: "ENTITY_ANIMAL_D0",
        0xD1: "ENTITY_ANIMAL_D1",
        0xD2: "ENTITY_ANIMAL_D2",
        0xD3: "ENTITY_BUNNY_D3",
        0xD4: "ENTITY_GHOST",
        0xD5: "ENTITY_ROOSTER",
        0xD6: "ENTITY_SIDE_VIEW_POT",
        0xD7: "ENTITY_THWIMP",
        0xD8: "ENTITY_THWOMP",
        0xD9: "ENTITY_THWOMP_RAMMABLE",
        0xDA: "ENTITY_PODOBOO",
        0xDB: "ENTITY_GIANT_BUBBLE",
        0xDC: "ENTITY_FLYING_ROOSTER_EVENTS",
        0xDD: "ENTITY_BOOK",
        0xDE: "ENTITY_EGG_SONG_EVENT",
        0xDF: "ENTITY_SWORD_BEAM",
        0xE0: "ENTITY_MONKEY",
        0xE1: "ENTITY_WITCH_RAT",
        0xE2: "ENTITY_FLAME_SHOOTER",
        0xE3: "ENTITY_POKEY",
        0xE4: "ENTITY_MOBLIN_KING",
        0xE5: "ENTITY_FLOATING_ITEM_2",
        0xE6: "ENTITY_FINAL_NIGHTMARE",
        0xE7: "ENTITY_KANALET_CASTLE_GATE_SWITCH",
        0xE8: "ENTITY_ENDING_OWL_STAIR_CLIMBING",
        0xE9: "ENTITY_COLOR_SHELL_RED",
        0xEA: "ENTITY_COLOR_SHELL_GREEN",
        0xEB: "ENTITY_COLOR_SHELL_BLUE",
        0xEC: "ENTITY_COLOR_GHOUL_RED",
        0xED: "ENTITY_COLOR_GHOUL_GREEN",
        0xEE: "ENTITY_COLOR_GHOUL_BLUE",
        0xEF: "ENTITY_ROTOSWITCH_RED",
        0xF0: "ENTITY_ROTOSWITCH_YELLOW",
        0xF1: "ENTITY_ROTOSWITCH_BLUE",
        0xF2: "ENTITY_FLYING_HOPPER_BOMBS",
        0xF3: "ENTITY_HOPPER",
        0xF4: "ENTITY_AVALAUNCH",
        0xF5: "ENTITY_BOUNCING_BOULDER",
        0xF6: "ENTITY_COLOR_GUARDIAN_BLUE",
        0xF7: "ENTITY_COLOR_GUARDIAN_RED",
        0xF8: "ENTITY_GIANT_BUZZ_BLOB",
        0xF9: "ENTITY_HARDHIT_BEETLE",
        0xFA: "ENTITY_PHOTOGRAPHER",
        0xFF: "ENTITY_NONE",
    }),
    PeepholeRule("""
        ld   hl, wEntitiesOptions1Table
        add  hl, de
        set  @, [hl]
    """, ENTITY_OPT1_BITS),
    PeepholeRule("""
        ld   hl, wEntitiesOptions1Table
        add  hl, bc
        set  @, [hl]
    """, ENTITY_OPT1_BITS),
    PeepholeRule("""
        ld   hl, wEntitiesOptions1Table
        add  hl, bc
        res  @, [hl]
    """, ENTITY_OPT1_BITS),
    PeepholeRule("""
        ld   hl, wEntitiesOptions1Table
        add  hl, bc
        res  @, [hl]
    """, ENTITY_OPT1_BITS),
    PeepholeRule("""
        ld   hl, wEntitiesOptions1Table
        add  hl, de
        ld   [hl], $@@
    """, lambda value: flags_from_enum(EntityOpt1Flag(value))),
    PeepholeRule("""
        ld   hl, wEntitiesOptions1Table
        add  hl, bc
        ld   [hl], $@@
    """, lambda value: flags_from_enum(EntityOpt1Flag(value))),
     PeepholeRule("""
        ldh  a, [hRoomStatus]
        and  $@@
    """, lambda value: flags_from_enum(RoomStatusFlag(value))),
     PeepholeRule("""
        or  $@@
        ld   [hl], a
        ldh  [hRoomStatus], a
    """, lambda value: flags_from_enum(RoomStatusFlag(value))),

     PeepholeRule("""
        ld   a, $@@
        ldh  [hJingle], a
    """, read_enum("constants/sfx.asm", "JINGLE_")),
     PeepholeRule("""
        ld   a, $@@
        ldh  [hWaveSfx], a
    """, read_enum("constants/sfx.asm", "WAVE_SFX_")),
     PeepholeRule("""
        ld   a, $@@
        ldh  [hNoiseSfx], a
    """, read_enum("constants/sfx.asm", "NOISE_SFX_")),

     PeepholeRule("""
        ld   hl, hJingle
        ld   [hl], $@@
    """, read_enum("constants/sfx.asm", "JINGLE_")),
     PeepholeRule("""
        ld   hl, hWaveSfx
        ld   [hl], $@@
    """, read_enum("constants/sfx.asm", "WAVE_SFX_")),
     PeepholeRule("""
        ld   hl, hNoiseSfx
        ld   [hl], $@@
    """, read_enum("constants/sfx.asm", "NOISE_SFX_")),
]

basepath = os.path.dirname(__file__)
for path, paths, files in os.walk(os.path.join(basepath, "..", "src")):
    for file in files:
        if file.endswith(".asm"):
            content = open(os.path.join(path, file), "rt").read().split("\n")
            for rule in rules:
                rule.process(content)
            open(os.path.join(path, file), "wt").write("\n".join(content))
