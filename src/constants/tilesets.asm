; World tilesets
; Each tileset is shared by 2x2 adjacent rooms.
; $OF means "don't change"

W_TILESET_KEEP               equ $0F

W_TILESET_CAMERA_SHOP        equs "HIGH(OverworldCameraShopTiles) - $40"
W_TILESET_TURTLE_ROCK        equs "HIGH(OverworldTurtleRockTiles) - $40"
W_TILESET_SEASHELL_MANSION   equs "HIGH(OverworldSeashellMansionTiles) - $40"
W_TILESET_MYSTERIOUS_WOODS   equs "HIGH(OverworldMysteriousWoodsTiles) - $40"
W_TILESET_BEACH              equs "HIGH(OverworldBeachTiles) - $40"
W_TILESET_PRAIRIE_STONE_HEAD equs "HIGH(OverworldPrairieStoneHeadTiles) - $40"
W_TILESET_MABE_VILLAGE       equs "HIGH(OverworldMabeVillageTiles) - $40"
W_TILESET_KANALET_CASTLE     equs "HIGH(OverworldKanaletCastleTiles) - $40"
W_TILESET_FACE_SHRINE        equs "HIGH(OverworldFaceShrineTiles) - $40"
W_TILESET_YARNA_DESERT       equs "HIGH(OverworldYarnaDesertTiles) - $40"
W_TILESET_PRAIRIE_SOUTH      equs "HIGH(OverworldPrairieSouthTiles) - $40"
W_TILESET_EAGLES_TOWER       equs "HIGH(OverworldEaglesTowerTiles) - $40"
W_TILESET_RAFTING_GAME       equs "HIGH(OverworldRaftingGameTiles) - $40"
W_TILESET_ANGLERS_TUNNEL     equs "HIGH(OverworldAnglersTunnelTiles) - $40"
W_TILESET_GOPONGO_SWAMP      equs "HIGH(OverworldGopongoSwampTiles) - $40"
W_TILESET_GRAVEYARD          equs "HIGH(OverworldGraveyardTiles) - $40"
W_TILESET_MARTHAS_BAY        equs "HIGH(OverworldMarthasBayTiles) - $40"
W_TILESET_EGG                equs "HIGH(OverworldEggTiles) - $40"
W_TILESET_TARAMANCH_MIDDLE   equs "HIGH(OverworldTaramanchMiddleTiles) - $40"

W_TILESET_INDOOR_00       equs "HIGH(Indoor00Tiles - IndoorTiles)"
W_TILESET_INDOOR_01       equs "HIGH(Indoor01Tiles - IndoorTiles)"
W_TILESET_INDOOR_02       equs "HIGH(Indoor02Tiles - IndoorTiles)"
W_TILESET_INDOOR_03       equs "HIGH(Indoor03Tiles - IndoorTiles)"
W_TILESET_INDOOR_04       equs "HIGH(Indoor04Tiles - IndoorTiles)"
W_TILESET_INDOOR_05       equs "HIGH(Indoor05Tiles - IndoorTiles)"
W_TILESET_INDOOR_06       equs "HIGH(Indoor06Tiles - IndoorTiles)"
W_TILESET_INDOOR_07       equs "HIGH(Indoor07Tiles - IndoorTiles)"
W_TILESET_INDOOR_08       equs "HIGH(Indoor08Tiles - IndoorTiles)"
W_TILESET_INDOOR_09       equs "HIGH(Indoor09Tiles - IndoorTiles)"
W_TILESET_INDOOR_0A       equs "HIGH(Indoor0ATiles - IndoorTiles)"
W_TILESET_INDOOR_0B       equs "HIGH(Indoor0BTiles - IndoorTiles)"
W_TILESET_INDOOR_0C       equs "HIGH(Indoor0CTiles - IndoorTiles)"
W_TILESET_INDOOR_0D       equs "HIGH(Indoor0DTiles - IndoorTiles)"
W_TILESET_INDOOR_0E       equs "HIGH(Indoor0ETiles - IndoorTiles)"
W_TILESET_INDOOR_0F       equs "HIGH(Indoor0FTiles - IndoorTiles)"

W_TILESET_INDOOR_17       equs "HIGH(Indoor17Tiles - IndoorTiles)"
W_TILESET_INDOOR_18       equs "HIGH(Indoor18Tiles - IndoorTiles)"
W_TILESET_INDOOR_19       equs "HIGH(Indoor19Tiles - IndoorTiles)"
W_TILESET_WINDFISH_FLOOR   equs "HIGH(WindfishFloorTiles - IndoorTiles)"

W_TILESET_NO_UPDATE          equ $FF
