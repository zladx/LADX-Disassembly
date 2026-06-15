# Zelda Environment State Schema

The agent observation is pixels only. Semantic state is returned through
`info["state"]` for reward functions, diagnostics, curriculum design, and
trajectory analysis.

## Top-Level Sections

- `meta`: game, platform, backend, frame, ROM version, schema version.
- `world`: map, room, area, indoor/outdoor status, scroll, view mode, floor.
- `player`: Link position, velocity, direction, action state, health, magic/resources.
- `inventory`: equipped items, owned items, consumables, capacities.
- `progress`: long-term quest, dungeon, collection, and save-file progress.
- `entities`: active sprite/entity slots normalized into per-slot dictionaries.
- `room`: runtime room object cache, static room objects, initial static entities.
- `effects`: short-term buffs, debuffs, timers, invincibility, charge states.
- `flags`: game-specific flags that are useful but not yet promoted to stable fields.
- `raw`: raw or near-raw memory values for debugging and schema evolution.

## LADX Mapping

- `player.x`: `hLinkPositionX`
- `player.y`: `hLinkPositionY`
- `player.health.current`: `wHealth`
- `player.health.max`: `wMaxHearts`
- `player.magic.current`: `None`
- `player.resources.magic_powder`: `wMagicPowderCount`
- `world.map_id`: `hMapId`
- `world.room`: `hMapRoom`
- `world.is_indoor`: `wIsIndoor`
- `inventory.items`: `wInventoryItems`
- `entities[*].type`: `wEntitiesTypeTable[slot]`
- `entities[*].status`: `wEntitiesStatusTable[slot]`
- `entities[*].x`: `wEntitiesPosXTable[slot]`
- `entities[*].y`: `wEntitiesPosYTable[slot]`
- `room.objects_runtime`: `wRoomObjects`

## ALTTP Compatibility Target

ALTTP means *The Legend of Zelda: A Link to the Past* / Zelda 3. Future SNES
support should map its documented RAM addresses into the same public schema:

- `player.x`: `$7E0022`
- `player.y`: `$7E0020`
- `player.health.current`: `$7EF36D`
- `player.magic.current`: `$7EF36E`
- `entities[*].type`: `$0E20[slot]`
- `entities[*].status`: `$0DD0[slot]`
- `entities[*].x`: `$0D10/$0D30[slot]`
- `entities[*].y`: `$0D00/$0D20[slot]`

ALTTP-specific fields should start in `flags` or `raw` before being promoted to
stable reward-facing paths.

