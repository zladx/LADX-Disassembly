; Indexed by hMapId, not just for dungeons, but for any indoor map.
DungeonFloorTilesPointers::
    db   HIGH(DungeonFloorATiles)
    db   HIGH(DungeonFloorGTiles)
    db   HIGH(DungeonFloorHTiles)
    db   HIGH(DungeonFloorKTiles)
    db   HIGH(DungeonFloorLTiles)
    db   HIGH(DungeonFloorHTiles)
    db   HIGH(DungeonFloorJTiles)
    db   HIGH(DungeonFloorITiles)
    db   HIGH(DungeonFloorETiles)
    db   HIGH(DungeonFloorATiles)
    db   HIGH(DungeonFloorBTiles)
    db   HIGH(DungeonFloorATiles)
    db   HIGH(DungeonFloorATiles)
    db   HIGH(DungeonFloorATiles)
    db   HIGH(DungeonFloorCTiles)
    db   HIGH(DungeonFloorCTiles)
    db   HIGH(DungeonFloorCTiles)
    db   HIGH(DungeonFloorBTiles)
    db   HIGH(DungeonFloorBTiles)
    db   HIGH(DungeonFloorDTiles)
    db   HIGH(DungeonFloorFTiles)
    db   HIGH(DungeonFloorHTiles)
    db   HIGH(DungeonFloorHTiles)
    db   $00
    db   $00
    db   $00
    db   $00
    db   $00
    db   $00
    db   HIGH(DungeonFloorCTiles)
    db   HIGH(DungeonFloorCTiles)
    db   HIGH(DungeonFloorBTiles)

DungeonWallsTilesPointers::
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsETiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsETiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsFTiles)
    db   HIGH(DungeonWallsDTiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsBTiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsCTiles)
    db   HIGH(DungeonWallsCTiles)
    db   HIGH(DungeonWallsCTiles)
    db   HIGH(DungeonWallsBTiles)
    db   HIGH(DungeonWallsCTiles)
    db   HIGH(DungeonWallsDTiles)
    db   HIGH(DungeonWallsATiles)
    db   HIGH(DungeonWallsBTiles)
    db   HIGH(DungeonWallsETiles)
    db   $00
    db   $00
    db   $00
    db   $00
    db   $00
    db   $00
    db   HIGH(DungeonWallsCTiles)
    db   HIGH(DungeonWallsCTiles)
    db   HIGH(DungeonWallsBTiles)

ColorDungeonWallsTilesPointers::
    db   HIGH(DungeonWallsDTiles) ; actually color dungeon walls

DungeonItemsTilesPointers::
    db   HIGH(DungeonItemsCTiles)
    db   HIGH(DungeonItemsCTiles)
    db   HIGH(DungeonItemsATiles)
    db   HIGH(DungeonItemsCTiles)
    db   HIGH(DungeonItemsCTiles)
    db   HIGH(DungeonItemsATiles)
    db   HIGH(DungeonItemsBTiles)
    db   HIGH(DungeonItemsCTiles)
    db   HIGH(DungeonItemsCTiles)
    db   HIGH(Npc3Tiles + $2300) ; TODO: add a proper label
    db   HIGH(DungeonItemsDTiles)
    db   $00
    db   $00
    db   $00
    db   HIGH(HouseAItemsTiles)
    db   HIGH(HouseAItemsTiles)
    db   HIGH(HouseAItemsTiles)
    db   HIGH(DungeonItemsDTiles)
    db   HIGH(HouseAItemsTiles)
    db   HIGH(DungeonItemsCTiles)
    db   HIGH(HouseBItemsTiles)
    db   HIGH(DungeonItemsDTiles)
    db   HIGH(DungeonItemsATiles)
    db   $00
    db   $00
    db   $00
    db   $00
    db   $00
    db   $00
    db   HIGH(HouseBItemsTiles)
    db   HIGH(HouseAItemsTiles)
    db   HIGH(DungeonItemsDTiles)

; Tuples of (address higher byte, bank index)
data_020_45EA::
    db   HIGH($5E00), BANK(DungeonsTilesCGB)
    db   HIGH($5E00), BANK(DungeonsTilesCGB)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($5E00), BANK(DungeonsTilesCGB)
    db   HIGH($5E00), BANK(DungeonsTilesCGB)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($5000), BANK(DungeonsTilesCGB)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($5000), BANK(DungeonsTilesCGB)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
    db   HIGH($6200), BANK(ColorDungeonTiles)
