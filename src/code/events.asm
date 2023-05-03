;
; Handling triggers and effects for room events
;

; Checks for common triggers resolution,
; and execute the effect of the active room event (if needed)
ExecuteRoomTriggersAndEffects::
    ld   a, [wRoomEvent]                          ; $5D4F: $FA $8E $C1
    and  a                                        ; $5D52: $A7
    jp   z, MakeEffectObjectAppear.return         ; $5D53: $CA $02 $5E

    call CheckTriggersResolution                  ; $5D56: $CD $9F $5F

    ld   a, [wRoomEvent]                          ; $5D59: $FA $8E $C1
    and  EVENT_EFFECT_MASK                        ; $5D5C: $E6 $E0
    srl  a                                        ; $5D5E: $CB $3F
    srl  a                                        ; $5D60: $CB $3F
    srl  a                                        ; $5D62: $CB $3F
    srl  a                                        ; $5D64: $CB $3F
    srl  a                                        ; $5D66: $CB $3F
    JP_TABLE                                      ; $5D68: $C7
._00 dw Events.return
._20 dw OpenLockedDoorsEffectHandler
._40 dw KillAllEnemiesEffectHandler
._60 dw RevealChestEffectHandler
._80 dw DropKeyEffectHandler
._A0 dw RevealStairwayEffectHandler
._C0 dw ClearMidbossEffectHandler
._E0 dw DropFairyEffectHandler

KillAllEnemiesEffectHandler::
    call EventEffectGuard                         ; $5D79

    ld   c, $0F                                   ; $5D7C: $0E $0F
    ld   b, $00                                   ; $5D7E: $06 $00

    ; Enumerate all entities
.forEachEntity
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5D80: $21 $40 $C3
    add  hl, bc                                   ; $5D83: $09
    ld   a, [hl]                                  ; $5D84: $7E
    and  ENTITY_PHYSICS_HARMLESS                  ; $5D85: $E6 $80
    jr   nz, .continue                            ; $5D87: $20 $1

    ; If the entity is active…
    ld   hl, wEntitiesStatusTable                 ; $5D89: $21 $80 $C2
    add  hl, bc                                   ; $5D8C: $09
    ld   a, [hl]                                  ; $5D8D: $7E
    cp   ENTITY_STATUS_ACTIVE                     ; $5D8E: $FE $05
    jr   c, .continue                             ; $5D90: $38 $1

    ; make the entity explode
    ld   [hl], $01                                ; $5D92: $36 $01
    ld   hl, wEntitiesPrivateCountdown3Table      ; $5D94: $21 $80 $C4
    add  hl, bc                                   ; $5D97: $09
    ld   [hl], $1F                                ; $5D98: $36 $1F
    ld   hl, wEntitiesPhysicsFlagsTable           ; $5D9A: $21 $40 $C3
    add  hl, bc                                   ; $5D9D: $09
    ld   a, [hl]                                  ; $5D9E: $7E
    and  ENTITY_PHYSICS_MASK                      ; $5D9F: $E6 $F0
    ; Set the entity's sprite count to 2
    or   2                                        ; $5DA1: $F6 $02
    ld   [hl], a                                  ; $5DA3: $77
    ld   a, NOISE_SFX_ENEMY_DESTROYED             ; $5DA4: $3E $13
    ldh  [hNoiseSfx], a                           ; $5DA6: $E0 $F4

.continue
    dec  c                                        ; $5DA8: $0D
    ld   a, c                                     ; $5DA9: $79
    cp   $FF                                      ; $5DAA: $FE $FF
    jr   nz, .forEachEntity                       ; $5DAC: $20 $D2

    ret                                           ; $5DAE: $C9

; Ensures that an event's effect will be executed once, and only once.
;
; If the room has not cleared, or the event effect has already been executed,
; return to the parent of the caller (thus skipping the rest of the handler).
;
; Otherwise, mark the effect as executed, and return normally.
EventEffectGuard::
    ; If the room has not been cleared yet…
    ldh  a, [hRoomStatus]                         ; $5DAF: $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ; $5DB1: $E6 $10
    jr   nz, .returnToParent                      ; $5DB3: $20 $0B

    ; … and the room event effect has not been executed yet…
    ld   a, [wRoomEventEffectExecuted]            ; $5DB5: $FA $8F $C1
    and  a                                        ; $5DB8: $A7
    jr   z, .returnToParent                       ; $5DB9: $28 $05

    ; Clear the room event
    xor  a                                        ; $5DBB: $AF
    ld   [wRoomEvent], a                          ; $5DBC: $EA $8E $C1
    ret                                           ; $5DBF: $C9

.returnToParent
    ; Pop the caller return address.
    ; The next value to be popped will be the parent caller
    ; address, thus returning to the parent of the parent early.
    pop  af                                       ; $5DC0: $F1
    ret                                           ; $5DC1: $C9

DropFairyEffectHandler::
    call EventEffectGuard                         ; $5DC2: $CD $AF $5D

    ld   a, ENTITY_DROPPABLE_FAIRY                ; $5DC5: $3E $2F
    call SpawnNewEntity_trampoline                ; $5DC7: $CD $86 $3B

    ld   hl, wEntitiesPosXTable                   ; $5DCA: $21 $00 $C2
    add  hl, de                                   ; $5DCD: $19
    ld   [hl], $88                                ; $5DCE: $36 $88

    ld   hl, wEntitiesPosYTable                   ; $5DD0: $21 $10 $C2
    add  hl, de                                   ; $5DD3: $19
    ld   [hl], $30                                ; $5DD4: $36 $30

    ld   hl, wEntitiesDropTimerTable              ; $5DD6: $21 $50 $C4
    add  hl, de                                   ; $5DD9: $19
    ld   [hl], $80                                ; $5DDA: $36 $80

    ld   a, $88                                   ; $5DDC: $3E $88
    ldh  [hMultiPurpose0], a                      ; $5DDE: $E0 $D7
    ld   a, $30                                   ; $5DE0: $3E $30
    ldh  [hMultiPurpose1], a                      ; $5DE2: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $5DE4: $3E $02
    jp   MakeEffectObjectAppear                   ; $5DE6: $C3 $F6 $5D

RevealStairwayEffectHandler::
    call EventEffectGuard                         ; $5DE9: $CD $AF $5D

    ld   a, $88                                   ; $5DEC: $3E $88
    ldh  [hMultiPurpose0], a                      ; $5DEE: $E0 $D7
    ld   a, $20                                   ; $5DF0: $3E $20
    ldh  [hMultiPurpose1], a                      ; $5DF2: $E0 $D8
    ld   a, TRANSCIENT_VFX_STAIRS_APPEARS         ; $5DF4: $3E $04

MakeEffectObjectAppear::
    call AddTranscientVfx                         ; $5DF6: $CD $C7 $0C

    ; Mark the room as cleared
    call GetRoomStatusAddress                     ; $5DF9: $CD $9F $5B
    ld   a, [hl]                                  ; $5DFC: $7E
    or   ROOM_STATUS_EVENT_1                      ; $5DFD: $F6 $10
    ld   [hl], a                                  ; $5DFF: $77
    ldh  [hRoomStatus], a                         ; $5E00: $E0 $F8

.return
    ret                                           ; $5E02: $C9

DropKeyEffectHandler::
    call EventEffectGuard                         ; $5E03: $CD $AF $5D
    ldh  a, [hMapRoom]                            ; $5E06: $F0 $F6
    cp   ROOM_OW_ANGLERS_TUNNEL                      ; Is this room 69? (Angler's Tunnel)
    jr   nz, .jr_5E15                          ; If not, skip ahead...

    ; Mark the room as cleared
    call GetRoomStatusAddress                     ; This is the room where the key falls into
    ld   a, [hl]                                  ; a hole in the floor, making it fall into
    or   ROOM_STATUS_EVENT_1        ; a sidescrolling room.
    ld   [hl], a                                  ; Since that room handles the key now,
    ldh  [hRoomStatus], a                         ; mark this one.

.jr_5E15
    jp   label_002_5425                           ; $5E15: $C3 $25 $54

; Open locked doors, and make the teleport point appear.
; @FIXME Actually checks if the miniboss has been defeated.
; Has nothing to do with actually clearing the miniboss.
ClearMidbossEffectHandler::
    ldh  a, [hMapId]                              ; $5E18: $F0 $F7
    ld   e, a                                     ; $5E1A: $5F
    ld   d, $00                                   ; $5E1B: $16 $00
    ld   hl, wHasInstrument1                      ; $5E1D: $21 $65 $DB
    add  hl, de                                   ; $5E20: $19
    ld   a, [hl]                                  ; $5E21: $7E
    and  $01                                      ; $5E22: $E6 $01
    ret  nz                                       ; $5E24: $C0

; Open all the locked doors of the room
OpenLockedDoorsEffectHandler::
    ld   a, [wC190]                               ; $5E25: $FA $90 $C1
    and  a                                        ; $5E28: $A7
    jr   nz, .jr_5E2E                             ; $5E29: $20 $03

    call func_002_5E7B                            ; $5E2B: $CD $7B $5E

.jr_5E2E
    ld   a, [wRoomEventEffectExecuted]            ; $5E2E: $FA $8F $C1
    and  a                                        ; $5E31: $A7
    ret  z                                        ; $5E32: $C8

    ld   a, [wRoomEvent]                          ; $5E33: $FA $8E $C1
    cp   TRIGGER_KILL_ALL_ENEMIES | EFFECT_CLEAR_MIDBOSS ; $5E36: $FE $C1
    jr   nz, jr_002_5E6A                          ; $5E38: $20 $30

    ldh  a, [hMapId]                         ; @TODO This sets the miniboss killed flag.
    ld   e, a                                     ; $5E3C: $5F
    ld   d, $00                                   ; $5E3D: $16 $00
    ld   hl, wHasInstrument1                      ; $5E3F: $21 $65 $DB
    add  hl, de                                   ; $5E42: $19
    ld   a, [hl]                                  ; $5E43: $7E
    or   $01                                      ; $5E44: $F6 $01
    ld   [hl], a                                  ; $5E46: $77
    ld   d, $00                                   ; $5E47: $16 $00
    ldh  a, [hMapRoom]                            ; $5E49: $F0 $F6
    ld   e, a                                     ; $5E4B: $5F
    ld   hl, wIndoorARoomStatus                   ; $5E4C: $21 $00 $D9
    ldh  a, [hMapId]                              ; $5E4F: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $5E51: $FE $FF
    jr   nz, .jr_5E5A                             ; $5E53: $20 $05

    ld   hl, wColorDungeonRoomStatus              ; $5E55: $21 $E0 $DD
    jr   jr_002_5E63                              ; $5E58: $18 $09

.jr_5E5A
    cp   $1A                                      ; $5E5A: $FE $1A
    jr   nc, jr_002_5E63                          ; $5E5C: $30 $05

    cp   $06                                      ; $5E5E: $FE $06
    jr   c, jr_002_5E63                           ; $5E60: $38 $01

    inc  d                                        ; $5E62: $14

jr_002_5E63:
    add  hl, de                                   ; $5E63: $19
    set  5, [hl]                                  ; $5E64: $CB $EE
    ld   a, JINGLE_DUNGEON_WARP_APPEAR            ; $5E66: $3E $1B
    ldh  [hJingle], a                             ; $5E68: $E0 $F2

jr_002_5E6A:
    ld   a, [wC190]                               ; $5E6A: $FA $90 $C1
    and  a                                        ; $5E6D: $A7
    ret  z                                        ; $5E6E: $C8

    xor  a                                        ; $5E6F: $AF
    ld   [wRoomEvent], a                          ; $5E70: $EA $8E $C1
    ld   a, $01                                   ; $5E73: $3E $01
    ld   [wC18C], a                               ; $5E75: $EA $8C $C1
    jp   EnqueueDoorUnlockedSfx                   ; $5E78: $C3 $20 $54

func_002_5E7B::
    ldh  a, [hLinkPositionX]                      ; $5E7B: $F0 $98
    sub  $11                                      ; $5E7D: $D6 $11
    cp   $7E                                      ; $5E7F: $FE $7E
    jr   nc, .return                              ; $5E81: $30 $1F

    ldh  a, [hLinkPositionY]                      ; $5E83: $F0 $99
    sub  $16                                      ; $5E85: $D6 $16
    cp   $5E                                      ; $5E87: $FE $5E
    jr   nc, .return                              ; $5E89: $30 $17

    ld   a, [wRoomEventEffectExecuted]            ; $5E8B: $FA $8F $C1
    and  a                                        ; $5E8E: $A7
    jr   nz, .return                              ; $5E8F: $20 $11

    ld   a, $01                                   ; $5E91: $3E $01
    ld   [wC18D], a                               ; $5E93: $EA $8D $C1
    ld   [wC190], a                               ; $5E96: $EA $90 $C1
    ld   a, $04                                   ; $5E99: $3E $04
    ld   [wC111], a                               ; $5E9B: $EA $11 $C1
    ld   a, WAVE_SFX_BOSS_DEATH_CRY               ; $5E9E: $3E $10
    ldh  [hNoiseSfx], a                           ; $5EA0: $E0 $F4

.return
    ret                                           ; $5EA2: $C9

Data_002_5EA3::
    db $60, $70, $61, $71

Data_002_5EA7::
    db $60, $70, $60, $70

RevealChestEffectHandler::
    call EventEffectGuard                         ; $5EAB: $CD $AF $5D
    ld   a, $88                                   ; $5EAE: $3E $88
    ldh  [hMultiPurpose0], a                      ; $5EB0: $E0 $D7
    ldh  a, [hLinkPositionY]                      ; $5EB2: $F0 $99
    sub  $30                                      ; $5EB4: $D6 $30
    add  $08                                      ; $5EB6: $C6 $08
    cp   $10                                      ; $5EB8: $FE $10
    jr   nc, .jr_5ECA                             ; $5EBA: $30 $0E

    ldh  a, [hLinkPositionX]                      ; $5EBC: $F0 $98
    sub  $88                                      ; $5EBE: $D6 $88
    add  $10                                      ; $5EC0: $C6 $10
    cp   $20                                      ; $5EC2: $FE $20
    jr   nc, .jr_5ECA                             ; $5EC4: $30 $04

    ld   a, $40                                   ; $5EC6: $3E $40
    jr   jr_002_5ECC                              ; $5EC8: $18 $02

.jr_5ECA
    ld   a, $30                                   ; $5ECA: $3E $30

jr_002_5ECC:
    ldh  [hMultiPurpose1], a                      ; $5ECC: $E0 $D8
    ld   a, TRANSCIENT_VFX_CHEST_APPEARS          ; $5ECE: $3E $03
    jp   AddTranscientVfx                         ; $5ED0: $C3 $C7 $0C

func_002_5ED3::
    ldh  a, [hLinkPositionY]                      ; $5ED3: $F0 $99
    sub  $30                                      ; $5ED5: $D6 $30
    add  $08                                      ; $5ED7: $C6 $08
    cp   $10                                      ; $5ED9: $FE $10
    jr   nc, .jr_5EEB                             ; $5EDB: $30 $0E

    ldh  a, [hLinkPositionX]                      ; $5EDD: $F0 $98
    sub  $88                                      ; $5EDF: $D6 $88
    add  $10                                      ; $5EE1: $C6 $10
    cp   $20                                      ; $5EE3: $FE $20
    jr   nc, .jr_5EEB                             ; $5EE5: $30 $04

    ld   a, $30                                   ; $5EE7: $3E $30
    jr   jr_002_5EED                              ; $5EE9: $18 $02

.jr_5EEB
    ld   a, $20                                   ; $5EEB: $3E $20

jr_002_5EED:
    ldh  [hIntersectedObjectTop], a               ; $5EED: $E0 $CD
    ld   a, $80                                   ; $5EEF: $3E $80
    ldh  [hIntersectedObjectLeft], a              ; $5EF1: $E0 $CE
    swap a                                        ; $5EF3: $CB $37
    and  $0F                                      ; $5EF5: $E6 $0F
    ld   e, a                                     ; $5EF7: $5F
    ldh  a, [hIntersectedObjectTop]               ; $5EF8: $F0 $CD
    and  $F0                                      ; $5EFA: $E6 $F0
    or   e                                        ; $5EFC: $B3
    ld   e, a                                     ; $5EFD: $5F
    ld   d, $00                                   ; $5EFE: $16 $00
    ld   hl, wRoomObjects                         ; $5F00: $21 $11 $D7
    add  hl, de                                   ; $5F03: $19
    ld   a, $A0                                   ; $5F04: $3E $A0
    ld   [hl], a                                  ; $5F06: $77
    ld   [wDDD8], a                               ; $5F07: $EA $D8 $DD
    call label_2887                               ; $5F0A: $CD $87 $28
    ld   a, [wDrawCommandsSize]                   ; $5F0D: $FA $00 $D6
    ld   e, a                                     ; $5F10: $5F
    ld   d, $00                                   ; $5F11: $16 $00
    ld   hl, wDrawCommand                         ; $5F13: $21 $01 $D6
    add  hl, de                                   ; $5F16: $19
    add  $0A                                      ; $5F17: $C6 $0A
    ld   [wDrawCommandsSize], a                   ; $5F19: $EA $00 $D6
    ld   de, Data_002_5EA3                        ; $5F1C: $11 $A3 $5E
    ldh  a, [hIsGBC]                              ; $5F1F: $F0 $FE
    and  a                                        ; $5F21: $A7
    jr   z, label_002_5F27                        ; $5F22: $28 $03

    ld   de, Data_002_5EA7                        ; $5F24: $11 $A7 $5E

label_002_5F27:
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $5F27: $F0 $CF
    ld   [hl+], a                                 ; $5F29: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $5F2A: $F0 $D0
    ld   [hl+], a                                 ; $5F2C: $22
    ld   a, $81                                   ; $5F2D: $3E $81
    ld   [hl+], a                                 ; $5F2F: $22
    ld   a, [de]                                  ; $5F30: $1A
    inc  de                                       ; $5F31: $13
    ld   [hl+], a                                 ; $5F32: $22
    ld   a, [de]                                  ; $5F33: $1A
    inc  de                                       ; $5F34: $13
    ld   [hl+], a                                 ; $5F35: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $5F36: $F0 $CF
    ld   [hl+], a                                 ; $5F38: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $5F39: $F0 $D0
    inc  a                                        ; $5F3B: $3C
    ld   [hl+], a                                 ; $5F3C: $22
    ld   a, $81                                   ; $5F3D: $3E $81
    ld   [hl+], a                                 ; $5F3F: $22
    ld   a, [de]                                  ; $5F40: $1A
    inc  de                                       ; $5F41: $13
    ld   [hl+], a                                 ; $5F42: $22
    ld   a, [de]                                  ; $5F43: $1A
    ld   [hl+], a                                 ; $5F44: $22
    xor  a                                        ; $5F45: $AF
    ld   [hl], a                                  ; $5F46: $77
    ldh  a, [hIsGBC]                              ; $5F47: $F0 $FE
    and  a                                        ; $5F49: $A7
    jr   z, .ret_5F53                             ; $5F4A: $28 $07

    push bc                                       ; $5F4C: $C5
    ld   a, $02                                   ; $5F4D: $3E $02
    call func_91D                                 ; $5F4F: $CD $1D $09
    pop  bc                                       ; $5F52: $C1

.ret_5F53
    ret                                           ; $5F53: $C9

Data_002_5F54::
    db $6A, $7A, $6B, $7B, $00, $00, $00, $00

func_002_5F5C::
    ld   a, STAIRCASE_INACTIVE                    ; $5F5C: $3E $01
    ldh  [hStaircase], a                          ; $5F5E: $E0 $AC
    ld   a, $10                                   ; $5F60: $3E $10
    ldh  [hIntersectedObjectTop], a               ; $5F62: $E0 $CD
    add  $10                                      ; $5F64: $C6 $10
    ldh  [hStaircasePosY], a                      ; $5F66: $E0 $AE
    ld   a, $80                                   ; $5F68: $3E $80
    ldh  [hIntersectedObjectLeft], a              ; $5F6A: $E0 $CE
    add  $08                                      ; $5F6C: $C6 $08
    ldh  [hStaircasePosX], a                      ; $5F6E: $E0 $AD
    swap a                                        ; $5F70: $CB $37
    and  $0F                                      ; $5F72: $E6 $0F
    ld   e, a                                     ; $5F74: $5F
    ldh  a, [hIntersectedObjectTop]               ; $5F75: $F0 $CD
    and  $F0                                      ; $5F77: $E6 $F0
    or   e                                        ; $5F79: $B3
    ld   e, a                                     ; $5F7A: $5F
    ld   d, $00                                   ; $5F7B: $16 $00
    ld   hl, wRoomObjects                         ; $5F7D: $21 $11 $D7
    add  hl, de                                   ; $5F80: $19
    ld   a, $BE                                   ; $5F81: $3E $BE
    ld   [hl], a                                  ; $5F83: $77
    ld   [wDDD8], a                               ; $5F84: $EA $D8 $DD
    call label_2887                               ; $5F87: $CD $87 $28
    ld   a, [wDrawCommandsSize]                   ; $5F8A: $FA $00 $D6
    ld   e, a                                     ; $5F8D: $5F
    ld   d, $00                                   ; $5F8E: $16 $00
    ld   hl, wDrawCommand                         ; $5F90: $21 $01 $D6
    add  hl, de                                   ; $5F93: $19
    add  $0A                                      ; $5F94: $C6 $0A
    ld   [wDrawCommandsSize], a                   ; $5F96: $EA $00 $D6
    ld   de, Data_002_5F54                        ; $5F99: $11 $54 $5F
    jp   label_002_5F27                           ; $5F9C: $C3 $27 $5F

; Check if some triggers has been resolved.
;
; Some trigger are marked as resolved directly by their respective
; entities. There function checks for all the other triggers.
CheckTriggersResolution::
    ; hMultiPurpose0 = event trigger
    and  EVENT_TRIGGER_MASK                       ; $5F9F: $E6 $1F
    ldh  [hMultiPurpose0], a                      ; $5FA1: $E0 $D7
    dec  a                                        ; $5FA3: $3D
    JP_TABLE                                      ; $5FA4: $C7
._01 dw CheckKillEnemiesTrigger
._02 dw Events.return
._03 dw CheckStepOnButtonTrigger
._04 dw Events.return
._05 dw CheckLightTorchesTrigger
._06 dw CheckKillInOrderTrigger
._07 dw Events.return
._08 dw CheckKillEnemiesTrigger
._09 dw Events.return
._0A dw CheckKillSidescrollBossTrigger
._0B dw Events.return
._0C dw Events.return
._0D dw Events.return
._0E dw Events.return
._0F dw Events.return
._10 dw CheckAnswerTunicsTrigger

Events::
.return
    ret                                           ; $5FC5: $C9

CheckKillSidescrollBossTrigger::
    ldh  a, [hMapId]                              ; $5FC6: $F0 $F7
    cp   MAP_EAGLES_TOWER                         ; $5FC8: $FE $06
    jr   nz, .jr_5FD1                             ; $5FCA: $20 $05

    ld   a, [wIndoorBRoomStatus + $E8]            ; $5FCC: $FA $E8 $DA
    jr   jr_002_5FD4                              ; $5FCF: $18 $03

.jr_5FD1
    ld   a, [wIndoorARoomStatus + $FF]            ; $5FD1: $FA $FF $D9

jr_002_5FD4:
    and  $20                                      ; $5FD4: $E6 $20
    jp   nz, MarkTriggerAsResolved                ; $5FD6: $C2 $60 $0C

    ret                                           ; $5FD9: $C9

CheckLightTorchesTrigger::
    ld   a, [wC1A2]                               ; $5FDA: $FA $A2 $C1
    cp   $02                                      ; $5FDD: $FE $02
    jp   z, MarkTriggerAsResolved                 ; $5FDF: $CA $60 $0C

    ret                                           ; $5FE2: $C9

CheckStepOnButtonTrigger::
    ld   a, [wSwitchButtonPressed]                ; $5FE3: $FA $CB $C1
    and  a                                        ; $5FE6: $A7
    jp   nz, MarkTriggerAsResolved                ; $5FE7: $C2 $60 $0C

    ret                                           ; $5FEA: $C9

CheckKillInOrderTrigger::
    ld   c, $00                                   ; $5FEB: $0E $00
    ld   hl, wKillOrder                           ; $5FED: $21 $B6 $DB

.loop_5FF0
    ld   a, [hl+]                                 ; $5FF0: $2A
    cp   c                                        ; $5FF1: $B9
    ret  nz                                       ; $5FF2: $C0

    inc  c                                        ; $5FF3: $0C
    ld   a, c                                     ; $5FF4: $79
    cp   $03                                      ; $5FF5: $FE $03
    jr   nz, .loop_5FF0                           ; $5FF7: $20 $F7

    jp   MarkTriggerAsResolved                    ; $5FF9: $C3 $60 $0C

; Check for both TRIGGER_KILL_ALL_ENEMIES and TRIGGER_KILL_SPECIALS
CheckKillEnemiesTrigger::
    ld   c, MAX_ENTITIES - 1                      ; $5FFC: $0E $0F
    ld   b, $00                                   ; $5FFE: $06 $00

    ; Enumerate all entities, from $0F to 0
.loopOverEntities
    ld   hl, wEntitiesStatusTable                 ; $6000: $21 $80 $C2
    add  hl, bc                                   ; $6003: $09
    ld   a, [hl]                                  ; $6004: $7E

    ; If the entity is none or disabled, continue with the next entity
    and  a                                        ; $6005: $A7
    jr   z, .continue                             ; $6006: $28 $09

    ; If the entity is active, and not excluded from the "Kill all" trigger,
    ; then the trigger is not resolved: return immediately.
    ld   hl, wEntitiesOptions1Table               ; $6008: $21 $30 $C4
    add  hl, bc                                   ; $600B: $09
    ld   a, [hl]                                  ; $600C: $7E
    and  ENTITY_OPT1_EXCLUDED_FROM_KILL_ALL       ; $600D: $E6 $02
    jr   z, .return                               ; $600F: $28 $1B

    ; Loop until all entities are enumerated
.continue
    dec  c                                        ; $6011: $0D
    ld   a, c                                     ; $6012: $79
    cp   -1                                       ; $6013: $FE $FF
    jr   nz, .loopOverEntities                    ; $6015: $20 $E9

    ; We enumerated all entities, and all of them are either disabled
    ; or excluded from the "Kill all" trigger: the trigger might be
    ; resolved.

    ; If the trigger is not TRIGGER_KILL_SPECIALS, then the trigger is resolved.
    ldh  a, [hMultiPurpose0]                      ; $6017: $F0 $D7
    cp   TRIGGER_KILL_SPECIALS                    ; $6019: $FE $08
    jr   nz, .triggerSatisfied                    ; $601B: $20 $0C

    ; If wD460 == 0, don't mark the trigger as resolved.
    ld   a, [wD460]                               ; $601D: $FA $60 $D4
    and  a                                        ; $6020: $A7
    jr   z, .return                               ; $6021: $28 $09

    ; If the trigger was already resolved, don't mark it as resolved again.
    ld   a, [wEnemyWasKilled]                     ; $6023: $FA $13 $C1
    and  a                                        ; $6026: $A7
    jr   nz, .return                              ; $6027: $20 $03

.triggerSatisfied
    jp   MarkTriggerAsResolved                    ; $6029: $C3 $60 $0C

.return
    ret                                           ; $602C: $C9

CheckAnswerTunicsTrigger::
    ; If the effect has already been executed, return.
    ld   a, [wRoomEventEffectExecuted]            ; $602D: $FA $8F $C1
    and  a                                        ; $6030: $A7
    ret  nz                                       ; $6031: $C0

    xor  a                                        ; $6032: $AF
    ldh  [hMultiPurpose0], a                      ; $6033: $E0 $D7
    ld   de, $00                                  ; $6035: $11 $00 $00
    ldh  a, [hMapRoom]                            ; $6038: $F0 $F6
    cp   UNKNOWN_ROOM_12                          ; $603A: $FE $12
    jr   z, jr_002_609B                           ; $603C: $28 $5D

jr_002_603E:
    ld   hl, wEntitiesTypeTable                   ; $603E: $21 $A0 $C3
    add  hl, de                                   ; $6041: $19
    ld   a, [hl]                                  ; $6042: $7E
    cp   $EF                                      ; $6043: $FE $EF
    jr   z, .jr_604F                              ; $6045: $28 $08

    cp   $F0                                      ; $6047: $FE $F0
    jr   z, .jr_604F                              ; $6049: $28 $04

    cp   $F1                                      ; $604B: $FE $F1
    jr   nz, jr_002_6064                          ; $604D: $20 $15

.jr_604F
    ld   hl, wEntitiesStatusTable                 ; $604F: $21 $80 $C2
    add  hl, de                                   ; $6052: $19
    ld   a, [hl]                                  ; $6053: $7E
    and  a                                        ; $6054: $A7
    jr   z, jr_002_6064                           ; $6055: $28 $0D

    ld   hl, wEntitiesSpriteVariantTable          ; $6057: $21 $B0 $C3
    add  hl, de                                   ; $605A: $19
    ld   a, [hl]                                  ; $605B: $7E
    cp   $08                                      ; $605C: $FE $08
    jr   nz, jr_002_6064                          ; $605E: $20 $04

    ld   hl, hMultiPurpose0                       ; $6060: $21 $D7 $FF
    inc  [hl]                                     ; $6063: $34

jr_002_6064:
    inc  e                                        ; $6064: $1C
    ld   a, e                                     ; $6065: $7B
    and  $0F                                      ; $6066: $E6 $0F
    jr   nz, jr_002_603E                          ; $6068: $20 $D4

    ld   e, $09                                   ; $606A: $1E $09
    ldh  a, [hMapRoom]                            ; $606C: $F0 $F6
    cp   UNKNOWN_ROOM_0A                          ; $606E: $FE $0A
    jr   z, .jr_6074                              ; $6070: $28 $02

    ld   e, $04                                   ; $6072: $1E $04

.jr_6074
    ldh  a, [hMultiPurpose0]                      ; $6074: $F0 $D7
    cp   e                                        ; $6076: $BB
    ret  nz                                       ; $6077: $C0

    call MarkTriggerAsResolved                    ; $6078: $CD $60 $0C
    ldh  a, [hMapRoom]                            ; $607B: $F0 $F6
    cp   ROOM_OW_MARIN_BRIDGE                     ; $607D: $FE $08
    ret  z                                        ; $607F: $C8
    cp   UNKNOWN_ROOM_0A                          ; $6080: $FE $0A
    jr   nz, .jr_6098                             ; $6082: $20 $14

    call EventEffectGuard                         ; $6084: $CD $AF $5D
    call OpenLockedDoorsEffectHandler             ; $6087: $CD $25 $5E
    ld   hl, wColorDungeonRoomStatus              ; $608A: $21 $E0 $DD
    ldh  a, [hMapRoom]                            ; $608D: $F0 $F6
    ld   e, a                                     ; $608F: $5F
    ld   d, $00                                   ; $6090: $16 $00
    add  hl, de                                   ; $6092: $19
    ld   a, [hl]                                  ; $6093: $7E
    or   $10                                      ; $6094: $F6 $10
    ld   [hl], a                                  ; $6096: $77
    ret                                           ; $6097: $C9

.jr_6098
    jp   RevealChestEffectHandler                 ; $6098: $C3 $AB $5E

jr_002_609B:
    ld   hl, wEntitiesTypeTable                   ; $609B: $21 $A0 $C3
    add  hl, de                                   ; $609E: $19
    ld   a, [hl]                                  ; $609F: $7E
    cp   $F6                                      ; $60A0: $FE $F6
    jr   z, .jr_60A8                              ; $60A2: $28 $04

    cp   $F7                                      ; $60A4: $FE $F7
    jr   nz, jr_002_60BD                          ; $60A6: $20 $15

.jr_60A8
    ld   hl, wEntitiesStatusTable                 ; $60A8: $21 $80 $C2
    add  hl, de                                   ; $60AB: $19
    ld   a, [hl]                                  ; $60AC: $7E
    and  a                                        ; $60AD: $A7
    jr   z, jr_002_60BD                           ; $60AE: $28 $0D

    ld   hl, wEntitiesStateTable                  ; $60B0: $21 $90 $C2
    add  hl, de                                   ; $60B3: $19
    ld   a, [hl]                                  ; $60B4: $7E
    cp   $04                                      ; $60B5: $FE $04
    jr   nz, jr_002_60BD                          ; $60B7: $20 $04

    ld   hl, hMultiPurpose0                       ; $60B9: $21 $D7 $FF
    inc  [hl]                                     ; $60BC: $34

jr_002_60BD:
    inc  e                                        ; $60BD: $1C
    ld   a, e                                     ; $60BE: $7B
    and  $0F                                      ; $60BF: $E6 $0F
    jr   nz, jr_002_609B                          ; $60C1: $20 $D8

    ldh  a, [hMultiPurpose0]                      ; $60C3: $F0 $D7
    cp   $02                                      ; $60C5: $FE $02
    ret  nz                                       ; $60C7: $C0

    call MarkTriggerAsResolved                    ; $60C8: $CD $60 $0C
    call EventEffectGuard                         ; $60CB: $CD $AF $5D

    ; Mark the room as completed
    call GetRoomStatusAddress                     ; $60CE: $CD $9F $5B
    ld   a, [hl]                                  ; $60D1: $7E
    or   ROOM_STATUS_EVENT_1                      ; $60D2: $F6 $10
    ld   [hl], a                                  ; $60D4: $77
    ldh  [hRoomStatus], a                         ; $60D5: $E0 $F8

    ret                                           ; $60D7: $C9
