# 2D Zelda AI Agent 环境需求细化与实施计划

## 目标

以当前 `LADX-Disassembly` 反汇编工程为第一落地点，快速构造一个适合 AI Agent 和强化学习训练使用的 2D Zelda 模拟器环境 wrapper。第一版目标游戏是《塞尔达传说：梦见岛 DX》（LADX），但状态抽象、动作抽象和模拟器后端接口必须为未来扩展到 SNES 上的 Zelda 3 / ALTTP 保留兼容空间。这里的 ALTTP 指 *The Legend of Zelda: A Link to the Past*，也就是 Zelda 3。

核心产物应是一个 Python 包，提供最常用的强化学习环境 API：`gymnasium.Env`。Gymnasium 当前 `step()` 返回 `(observation, reward, terminated, truncated, info)`，`reset()` 返回 `(observation, info)`，`info` 用于携带调试、指标和隐藏状态；这正好适合作为奖励函数所需的结构化游戏状态出口。参考：<https://gymnasium.farama.org/api/env/>

第一版底层模拟器建议优先使用 PyBoy。PyBoy 支持 Python 内嵌运行 Game Boy / Game Boy Color ROM，提供按键输入、逐帧 `tick()`、屏幕数组、读写内存、`.sym` 符号文件、save/load state 等能力，适合把当前反汇编工程生成的 ROM 和符号表接入 RL 环境。参考：<https://docs.pyboy.dk/>

未来扩展到 Zelda 3 / ALTTP 时，不应推翻上层 API。应新增一个 SNES backend，例如 BizHawk/Lua bridge、Snes9x bridge 或 Libretro/RetroArch bridge，只要它实现同一套 `EmulatorBackend`、`StateExtractor` 和 `MemoryMap` 接口即可。

## 当前代码库可复用信息

当前工程是 RGBDS 风格的 LADX DX 反汇编项目：

- `Makefile` 可构建 `azle.gbc` 等版本，并通过 `rgblink -n $*.sym` 生成调试符号。
- `src/constants/memory/wram.asm`、`src/constants/memory/hram.asm`、`src/constants/memory/sram.asm` 已经定义大量运行时状态地址。
- `src/constants/entities.asm` 定义实体类型、实体状态、实体物理 flag。
- `src/constants/inventory.asm` 定义道具 ID 和 inventory slot 数量。
- `src/constants/maps.asm`、`src/constants/rooms.asm` 定义 map / room 常量。
- `tools/lib/map_parser.py`、`tools/generate_map_data.py` 能解析 ROM 静态地图和房间对象数据。
- `tools/lib/entities_parser.py`、`tools/generate_entities_data.py` 能解析各房间初始实体列表。

这些信息允许我们把“静态地图元数据”和“运行时内存状态”分开处理：静态地图来自 ROM/parser，运行时状态来自模拟器内存。

## 跨游戏设计原则

第一版虽然只实现 LADX，但不要把环境设计成“LADX 专用脚本”。需要分清三层：

- `zelda_env.core`: 与游戏无关的 Gymnasium 环境、动作抽象、episode 控制、reward hook、trajectory recorder。
- `zelda_env.backends`: 与模拟器有关的按键、逐帧推进、屏幕读取、内存读取、save/load state。
- `zelda_env.games`: 与具体游戏有关的 memory map、常量表、状态提取器、静态地图解析器。

状态 schema 使用稳定的通用字段名，具体游戏地址只出现在 `games/ladx/*` 或未来的 `games/alttp/*` 中。例如，LADX 的 `wHealth` 和 ALTTP 的 `$7EF36D` 都应映射成 `state.player.health.current`，而不是让 reward 函数直接依赖 ROM 内存标签。

第一版包名建议使用中性名称，例如 `zelda_env`，并通过注册 ID 暴露具体游戏：

- `Zelda-LADX-v0`
- 未来：`Zelda-ALTTP-v0`

## 需求细化

### 1. 强化学习 API

新增通用 Python 环境类和 LADX 具体注册入口，例如：

```python
class ZeldaEnv(gymnasium.Env):
    metadata = {"render_modes": ["rgb_array", "human"], "render_fps": 60}
```

必要接口：

- `__init__(game, backend, rom_path, state_path=None, render_mode=None, frame_skip=4, ...)`
- `reset(seed=None, options=None) -> (observation, info)`
- `step(action) -> (observation, reward, terminated, truncated, info)`
- `render() -> np.ndarray | None`
- `close()`

动作空间建议第一版使用 `spaces.Discrete`，每个 action 映射到一组逻辑按键组合。逻辑按键应使用跨平台名称，而不是直接绑定 Game Boy 或 SNES 控制器：

- `NOOP`
- 方向：`UP`、`DOWN`、`LEFT`、`RIGHT`
- 主动作键：`A`、`B`
- 菜单键：`START`、`SELECT`
- 常用组合：方向 + `A`，方向 + `B`

后续可扩展为 `MultiBinary(n)`，允许 Agent 直接控制底层平台的完整按键集合。对 LADX，底层是 8 个 Game Boy 按键；对 ALTTP，底层会增加 `X`、`Y`、`L`、`R`。环境层只暴露逻辑动作，backend 负责把逻辑动作翻译成平台按键。

观测空间第一版必须只向 agent 暴露像素输入：

- `pixels`: `Box(0, 255, shape=(144, 160, 3 or 4), dtype=np.uint8)`

语义状态不得进入 `observation`，只通过 `info["state"]` 返回，用于调试、分析、奖励函数和课程设计。这样训练时 agent 只看画面，奖励函数仍能读取可解释的地图、sprite、玩家、道具和进度状态。后续可以增加 debug-only wrapper 从 `info["state"]` 派生 feature observation，但不作为默认训练接口。

### 2. 可解释状态字典 `info["state"]`

每次 `reset()` 和 `step()` 都应返回可 JSON 序列化的 `info`。这个字典是语义状态出口，不是 agent observation：

```python
info = {
    "state": {
        "meta": {...},
        "world": {...},
        "player": {...},
        "inventory": {...},
        "progress": {...},
        "entities": [...],
        "room": {...},
        "effects": {...},
        "flags": {...},
        "raw": {...}
    },
    "reward_terms": {...},
    "events": {...}
}
```

建议字段：

顶层字段需要跨 LADX 和 ALTTP 稳定：

- `meta`: 游戏、平台、backend、frame、ROM 版本、state schema 版本。
- `world`: 当前 map/room/area、室内外、滚屏、视角、楼层、地图分布摘要。
- `player`: Link 的位置、速度、方向、动作状态、生命、魔法/能力资源。
- `inventory`: 装备、道具、消耗品、当前按键装备。
- `progress`: 长期剧情/地牢/收集进度。
- `entities`: 活跃实体/sprite/object slot 列表。
- `room`: 当前房间运行时对象、静态地图对象、初始实体、tile/object grid。
- `effects`: 短期 buff/debuff、无敌、击退、蓄力、特殊模式。
- `flags`: 其他游戏特定 flag。
- `raw`: 原始内存快照或关键原始字段，便于调试。

#### `state.meta`

LADX 第一版字段：

- `game`: `"ladx"`
- `platform`: `"gbc"`
- `backend`: `"pyboy"`
- `schema_version`: 1
- `frame`: `hFrameCounter` 或 backend 累计帧数
- `rom_path`
- `sym_path`

未来 ALTTP 可使用：

- `game`: `"alttp"`
- `platform`: `"snes"`
- `backend`: `"bizhawk"` / `"snes9x"` / `"libretro"`

#### `state.world`

- `is_indoor`: `wIsIndoor`
- `map_id`: `hMapId`
- `map_id_name`: 由 `src/constants/maps.asm` 解析
- `room`: `hMapRoom`
- `room_name`: 由 `src/constants/rooms.asm` 解析
- `indoor_room`: `wIndoorRoom`
- `room_status`: `hRoomStatus`
- `is_side_scrolling`: `hIsSideScrolling`
- `scroll_x`: `hBaseScrollX`
- `scroll_y`: `hBaseScrollY`

ALTTP 对应字段应映射到同名通用字段，例如 `$1B` 可映射到 `is_indoor`，`$A0` 可映射到 dungeon room，`$8A` / `$0700` 可映射到 overworld area/screen。

#### `state.player`

- `x`: `hLinkPositionX`
- `y`: `hLinkPositionY`
- `final_x`: `hLinkFinalPositionX`
- `final_y`: `hLinkFinalPositionY`
- `z`: `hLinkPositionZ`
- `speed_x`: `hLinkSpeedX`
- `speed_y`: `hLinkSpeedY`
- `velocity_z`: `hLinkVelocityZ`
- `direction`: `hLinkDirection`
- `motion_state`: `wLinkMotionState`
- `animation_state`: `hLinkAnimationState`
- `ground_status`: `wLinkGroundStatus`
- `physics_modifier`: `hLinkPhysicsModifier`
- `interactive_motion_blocked`: `hLinkInteractiveMotionBlocked`
- `room_position`: `hLinkRoomPosition`
- `final_room_position`: `hLinkFinalRoomPosition`
- `health.current`: `wHealth`
- `health.max`: `wMaxHearts`
- `magic.current`: LADX 中默认 `None`，ALTTP 中可映射到 `$7EF36E`
- `resources.magic_powder`: `wMagicPowderCount`

#### `state.inventory`

- `items`: `wInventoryItems`，长度 `INVENTORY_SLOT_COUNT`
- `b_button_item`: `wInventoryItems.BButtonSlot`
- `a_button_item`: `wInventoryItems.AButtonSlot`
- `has_flippers`: `wHasFlippers`
- `has_medicine`: `wHasMedicine`
- `trade_sequence_item`: `wTradeSequenceItem`
- `seashells`: `wSeashellsCount`
- `keys`: `wHasTailKey`、`wHasAnglerKey`、`wHasFaceKey`、`wHasBirdKey`
- `golden_leaves_or_slime_key`: `wGoldenLeavesCount`
- `power_bracelet_level`: `wPowerBraceletLevel`
- `shield_level`: `wShieldLevel`
- `sword_level`: `wSwordLevel`
- `arrows`: `wArrowCount`
- `bombs`: `wBombCount`
- `magic_powder`: `wMagicPowderCount`
- `max_magic_powder`: `wMaxMagicPowder`
- `max_bombs`: `wMaxBombs`
- `max_arrows`: `wMaxArrows`
- `ocarina_song_flags`: `wOcarinaSongFlags`
- `selected_song_index`: `wSelectedSongIndex`
- `boomerang_traded_item`: `wBoomerangTradedItem`

说明：LADX 没有 ALTTP 那种常规魔法槽。为了跨游戏兼容，`state.player.magic.current` 在 LADX 中应为 `None`，同时把 `magic_powder`、`magic_rod` 等放到 `inventory` 和 `player.resources`。ALTTP 后续可以把 `$7EF36E` 映射到 `state.player.magic.current`，把魔法消耗减半/四分之一映射到 `effects.magic_cost_modifier`。

#### `state.progress`

- `health`: `wHealth`，单位为 `$08 = 1 heart`
- `max_hearts`: `wMaxHearts`
- `heart_pieces`: `wHeartPiecesCount`
- `rupees`: 由 `wRupeeCountHigh`、`wRupeeCountLow` 合成
- `death_count`: `wDeathCount`
- `instruments`: `wHasInstrument1` 到 `wHasInstrument8`
- `dungeon_item_flags`: `wDungeonItemFlags`
- `current_dungeon_items`: `wCurrentDungeonItemFlags`
- `small_keys`: `wSmallKeysCount`
- `tunic_type`: 若使用 DX 扩展状态，应纳入 `wTunicType`
- `photos`: 若需要完成度奖励，应纳入 `wPhotos1`、`wPhotos2`

#### `state.effects`

需要从内存变量中抽取短期状态和计时器：

- `invincibility_counter`: `wInvincibilityCounter`
- `piece_of_power` / `guardian_acorn`: 需要进一步定位对应 RAM 标签或实体/计时器逻辑
- `is_gel_clinging`: `wIsGelClingingToLink`
- `slow_walking_speed`: `hLinkSlowWalkingSpeed`
- `is_using_spin_attack`: `wIsUsingSpinAttack`
- `sword_charge`: `wSwordCharge`
- `is_using_shield`: `wIsUsingShield`
- `is_carrying_lifted_object`: `wIsCarryingLiftedObject`
- `screen_shake_countdown`: `wScreenShakeCountdown`
- `magic_cost_modifier`: LADX 默认 `None`，ALTTP 可映射半魔法/四分之一魔法状态

#### `state.entities`

活跃实体最大数量由 LADX 的 `MAX_ENTITIES EQU $10` 定义。ALTTP 的 sprite object model 同样是 16 个 sprite slot，因此通用实体 schema 应按 16 slot 设计，但不要把字段命名成 `wEntities*`。运行时实体是 SoA 表结构，应合成 slot 列表：

```python
{
    "slot": 0,
    "enabled": true,
    "type": 9,
    "type_name": "ENTITY_OCTOROK",
    "status": 5,
    "status_name": "ENTITY_STATUS_ACTIVE",
    "x": 80,
    "y": 64,
    "z": 0,
    "speed_x": 0,
    "speed_y": 0,
    "speed_z": 0,
    "direction": 1,
    "health": 2,
    "state": 0,
    "state_name": null,
    "sprite_variant": 0,
    "room": 0x92,
    "physics_flags": 0x81,
    "hitbox_flags": 0x04,
    "ground_status": 0,
    "private": {
        "state1": 0,
        "state2": 0,
        "state3": 0,
        "state4": 0,
        "state5": 0,
        "countdown1": 0,
        "countdown2": 0,
        "countdown3": 0,
        "transition_countdown": 0,
        "slow_transition_countdown": 0
    }
}
```

LADX 主要来源：

- `wEntitiesPosXTable`
- `wEntitiesPosYTable`
- `wEntitiesPosZTable`
- `wEntitiesSpeedXTable`
- `wEntitiesSpeedYTable`
- `wEntitiesSpeedZTable`
- `wEntitiesStatusTable`
- `wEntitiesStateTable`
- `wEntitiesTypeTable`
- `wEntitiesHealthTable`
- `wEntitiesDirectionTable`
- `wEntitiesRoomTable`
- `wEntitiesPhysicsFlagsTable`
- `wEntitiesHitboxFlagsTable`
- `wEntitiesSpriteVariantTable`
- `wEntitiesGroundStatusTable`
- `wEntitiesPrivateState*Table`
- `wEntitiesPrivateCountdown*Table`

ALTTP 后续可映射到同一 schema：

- `$0D00/$0D10/$0D20/$0D30`: sprite Y/X 低高字节
- `$0D40/$0D50`: sprite Y/X velocity
- `$0DD0`: sprite state
- `$0E20`: sprite type
- `$0E40`: 可见性/OAM slot/harmless flag
- `$0E50`: sprite HP
- `$0E60`: shadow/attack immunity 等 flags
- `$0F20`: floor selector
- `$0F60`: hitbox settings
- `$0F70`: height

#### `state.room`

运行时房间对象和静态地图数据都要提供：

- `objects_runtime`: 从 `wRoomObjects` 读取当前房间解码后的对象缓存
- `objects_area_raw`: 从 `wRoomObjectsArea` 读取含 padding 的原始区域
- `static_room`: 用 `tools/lib/map_parser.py` 从 ROM 解析出来的房间 header、template、floor tile、objects
- `static_entities`: 用 `tools/lib/entities_parser.py` 从 ROM 解析出来的本房间初始实体
- `room_status_sets`: 从 `wOverworldRoomStatus`、`wIndoorARoomStatus`、`wIndoorBRoomStatus`、`wColorDungeonRoomStatus` 读取进度状态

ALTTP 后续需要将 dungeon room event words、overworld event bytes、Map16/Map8 tile buffers 映射到同一字段，而不是新增另一套 reward-facing 字段。

### 3. 符号解析

不要在状态提取器中散落硬编码地址。实现一套通用 `MemoryMap`：

- LADX 使用 `SymbolTable`，优先读取 `azle.sym`。
- ALTTP 使用 `AddressTable`，初期可由 `Zelda 3 Compendium` 整理出的 YAML/JSON 地址表驱动。
- 两者都导出统一字段路径，例如 `player.x`、`entities.type`、`inventory.items`。

LADX 第一版 `SymbolTable`：

- 读取 `azle.sym`。
- 支持 `symbol -> address` 查找。
- 支持 label 别名和局部 label，例如 `wInventoryItems.BButtonSlot`。
- 若 `.sym` 缺失，提供从 `src/constants/memory/*.asm` 解析 `ds` 定义的 fallback，但第一优先级仍是构建产物 `.sym`。

第一版必须验证这些关键符号能解析：

- `hLinkPositionX`
- `hLinkPositionY`
- `hMapRoom`
- `hMapId`
- `wEntitiesStatusTable`
- `wEntitiesTypeTable`
- `wInventoryItems`
- `wHealth`
- `wRoomObjects`

### 4. 模拟器后端抽象

建议新增 `zelda_env/backends/base.py`：

```python
class EmulatorBackend(Protocol):
    platform: str
    buttons: tuple[str, ...]

    def reset(self) -> None: ...
    def close(self) -> None: ...
    def press(self, buttons: set[str]) -> None: ...
    def release_all(self) -> None: ...
    def advance(self, frames: int) -> None: ...
    def read_u8(self, address: int) -> int: ...
    def read_u16(self, address: int, *, endian: str = "little") -> int: ...
    def read_bytes(self, address: int, length: int) -> bytes: ...
    def save_state(self) -> bytes: ...
    def load_state(self, data: bytes) -> None: ...
    def screen_rgb(self) -> np.ndarray: ...
```

LADX 第一版新增 `zelda_env/backends/pyboy_backend.py`：

- 用 `PyBoy(rom_path, window="null", symbols=sym_path, cgb=True)` 初始化。
- `press_buttons(buttons)`：释放上一帧按键，按下本 step 的按键组合。
- `advance(frames)`：调用 `pyboy.tick()` 多帧。
- `read_u8(symbol_or_addr)`、`read_bytes(symbol_or_addr, length)`。
- `save_state()` / `load_state()`：用于 deterministic reset 和 curriculum 起点。
- `screen_rgb()`：从 `pyboy.screen.ndarray` 提取 RGB/RGBA。

未来 ALTTP backend 只需要实现同一接口。SNES backend 的注意点：

- 地址空间是 24-bit，例如 `$7E0020`、`$7EF36D`。
- SNES controller 按键多于 GB，需要动作映射层做平台适配。
- save state 格式由 emulator 决定，环境层只把它当 opaque bytes/path。

### 5. 奖励函数接口

环境本身提供默认奖励函数，但要允许用户注入：

```python
RewardFn = Callable[[dict, dict, int], tuple[float, dict]]
```

参数：

- `prev_info`
- `info`
- `action`

返回：

- `reward`
- `reward_terms`

默认奖励第一版只做保守基线：

- 新房间探索奖励
- 生命损失惩罚
- 死亡惩罚
- 关键物品/心/乐器/钥匙进度奖励
- step penalty 防止原地不动

复杂奖励由用户基于 `info["state"]` 自定义。

### 6. Episode 终止与截断

`terminated`：

- Link 死亡或进入 Game Over。
- 达成用户设定目标，例如获得某道具、进入某房间、获得乐器。

`truncated`：

- 达到 `max_episode_steps`。
- 长时间没有位置、房间或进度变化。
- 模拟器状态异常或卡在不可交互流程超过阈值。

### 7. 目录结构建议

```text
zelda_env/
  __init__.py
  env.py
  actions.py
  rewards.py
  wrappers.py
  backends/
    __init__.py
    base.py
    pyboy_backend.py
    snes_backend.py        # future placeholder
  games/
    __init__.py
    ladx/
      __init__.py
      constants.py
      memory_map.py
      symbols.py
      state_extractor.py
      static_data.py
    alttp/
      __init__.py
      memory_map.py        # future
      state_extractor.py   # future
  py.typed
tests/
  test_ladx_symbols.py
  test_ladx_state_extractor.py
  test_backend_contract.py
  test_env_api.py
  fixtures/
docs/
  ai_agent_env_plan.md
```

### 8. 实施计划

#### Phase 0: 构建和依赖确认

- 安装或确认 `rgbds`、Python 依赖、PyBoy、Gymnasium。
- 运行 `make build` 生成 `azle.gbc` 和 `azle.sym`。
- 记录 ROM 文件路径、符号文件路径、版本选择策略。
- 确认包结构采用 `zelda_env`，不是 `ladx_env`，避免后续 ALTTP 迁移时改公开 API。

验收：

- `azle.gbc` 存在。
- `azle.sym` 存在。
- PyBoy 能以 headless 模式启动 ROM。
- `Zelda-LADX-v0` 能作为第一版环境 ID 设计目标。

#### Phase 1: 通用状态 schema、LADX 符号表与常量解析

- 定义 `state.meta/world/player/inventory/progress/entities/room/effects/flags/raw` schema。
- 定义 `MemoryMap` 配置格式，让 LADX 和未来 ALTTP 可以共享 extractor 框架。
- 实现 `.sym` parser。
- 实现 ASM `DEF NAME EQU value` 常量解析，用于实体名、状态名、道具名、地图名。
- 建立 `games/ladx/memory_map.py` 中的高层字段配置。

验收：

- 能通过 symbol 读取 `hMapRoom`、`hLinkPositionX`、`wHealth`。
- 实体类型 ID 能转换为 `ENTITY_*` 名称。
- `wHealth` 能映射到 `state.player.health.current`，而不是只暴露为 LADX 原始名。

#### Phase 2: Backend contract 与 PyBoy 后端封装

- 定义 `EmulatorBackend` 协议。
- 封装初始化、按键、逐帧 tick、屏幕读取、内存读取、save/load state。
- 支持 `frame_skip`。
- 支持用户提供的 `initial_state_path`，让训练从跳过标题/建档后的状态开始。
- 支持生成初始 save state 的 setup script，用固定输入流程或内存初始化创建可复用起点。
- 动作层使用逻辑动作，再映射到 PyBoy 的 Game Boy 按键。

验收：

- 单元测试能加载一个 state，执行 action，读取屏幕和内存。
- setup script 能生成一个可被 `reset()` 复用的初始 state。
- repeated reset 能回到相同核心状态。
- `test_backend_contract.py` 可复用给未来 SNES backend。

#### Phase 3: 运行时状态提取

- 实现 `GameStateExtractor.extract() -> dict`。
- 先覆盖 `meta`、`world`、`player`、`inventory`、`progress`。
- 再覆盖 16 槽实体列表。
- 最后覆盖 `room`、`effects`、`raw`。

验收：

- `info["state"]` 可 `json.dumps()`。
- 在同一 save state 下连续提取稳定。
- Link 坐标、血量、房间号与已知内存地址一致。
- reward 函数只依赖通用字段路径，不需要直接读 `w*` 或 `h*` 字段。

#### Phase 4: 静态地图数据接入

- 复用 `tools/lib/map_parser.py` 解析 ROM 中房间对象。
- 复用 `tools/lib/entities_parser.py` 解析房间初始实体。
- 增加缓存，避免每 step 重新解析 ROM。
- 把当前 `map_id + room` 对应的静态对象和初始实体挂到 `state.room`。

验收：

- 当前房间能返回静态 objects。
- 当前房间能返回初始 entity list。
- 静态数据解析只在初始化或缓存 miss 时发生。

#### Phase 5: Gymnasium 环境

- 实现通用 `ZeldaEnv` 和 LADX 注册入口。
- 定义 `action_space`、pixel-only `observation_space`、`metadata`。
- 实现 `reset()`、`step()`、`render()`、`close()`。
- 注册环境 ID，例如 `Zelda-LADX-v0`。

验收：

- `gymnasium.utils.env_checker.check_env(env)` 通过。
- `env.reset()`、随机 action `env.step()` 可运行 1000 步。
- 每步返回可解释且可 JSON 序列化的 `info["state"]`。
- `observation` 只包含 pixels，不包含语义 feature。
- 构造函数能显式接收 `game="ladx"` 和 `backend="pyboy"`。

#### Phase 6: 奖励与 wrappers

- 实现默认奖励函数。
- 支持用户传入自定义 reward function。
- 增加 wrapper：
  - `FrameStack`
  - `ResizeObservation`
  - `GrayScaleObservation`
  - `InfoStateRecorder`
  - `DebugFeatureObservationWrapper`，只用于诊断，不作为默认训练接口

验收：

- 默认奖励 terms 可解释。
- 用户能基于 `info["state"]` 写奖励函数。
- wrapper 后仍符合 Gymnasium API。

#### Phase 7: 测试与示例

- 添加 smoke test。
- 添加一个随机 agent 示例。
- 添加一个基于 `info` 的简单探索奖励示例。
- 添加一个保存轨迹为 JSONL 的脚本。
- 添加一份 `docs/state_schema.md`，说明通用字段与 LADX 内存字段的映射，并预留 ALTTP 映射列。

验收：

- `pytest` 通过。
- 示例能启动环境并打印结构化状态。
- JSONL 中包含每步 action、reward、state 摘要。

## 主要风险与待确认问题

- ROM 文件版权：仓库可构建 ROM，但训练环境应只引用本地用户提供/构建的 ROM，不应分发 ROM。
- 标题画面和建档流程：RL 训练通常应从预制 save state 开始，需要同时支持用户提供 state 和脚本生成 state。
- `.sym` 局部 label：RGBDS 符号文件对局部 label 的表示需要实际构建后确认。
- Buff 字段：`Piece of Power`、`Guardian Acorn` 等短期效果需要继续追踪对应 RAM 标签或逻辑代码。
- `wTunicType`、`wPhotos1`、`wPhotos2` 在当前摘读片段中由 SRAM 注释提及，但仍需在 WRAM 定义中确认具体地址。
- 地图碰撞/可达性：第一版可返回 object/tile 数据；若要做规划型奖励，后续需要把 object id 转换成 collision/semantic grid。
- 跨平台状态命名：如果第一版把字段暴露得过于 LADX 化，未来 ALTTP 会被迫维护两套 reward 函数。因此第一版必须把 LADX 原始字段放入 `raw`，主要 reward-facing 字段使用通用 schema。
- SNES backend 不确定性：BizHawk、Snes9x、Libretro 的 Python 控制方式、save state 格式和 headless 能力不同，后续需要单独选型。
- 地址来源不同：LADX 可以使用 `.sym`，ALTTP 初期更可能使用人工整理的地址表；`MemoryMap` 必须同时支持符号和绝对地址。

## 第一版最小可用范围

第一版建议只承诺：

- `gymnasium.Env` API。
- PyBoy headless 后端。
- pixel-only observation。
- `info["state"]` 包含通用字段 `meta`、`world`、`player`、`inventory`、`progress`、`entities`。
- 支持从用户提供的 save state reset。
- 支持用 setup script 生成初始 save state。
- 默认 reward 很薄，主要让用户自定义奖励。
- 包结构、backend contract、state schema 预留 ALTTP/SNES 扩展点。

地图语义化、完整 effects 解释、全量剧情 flag 命名、复杂 curriculum 可以放到后续版本。
