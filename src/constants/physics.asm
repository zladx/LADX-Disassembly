;
; Constants for the physics system
;

; Values for wCollisionType:
DEF COLLISION_TYPE_NONE         EQU $00
DEF COLLISION_TYPE_UP           EQU $01
DEF COLLISION_TYPE_DOWN         EQU $02
DEF COLLISION_TYPE_VERTICAL     EQU $03
DEF COLLISION_TYPE_LEFT         EQU $04
DEF COLLISION_TYPE_RIGHT        EQU $08
DEF COLLISION_TYPE_HORIZONTAL   EQU $0C
DEF COLLISION_TYPE_UNKNOWN_10   EQU $10

; Values for objects physic flags
; (See GetObjectPhysicsFlags)
;
; TODO: this list is incomplete, and the documentation may be inaccurate
DEF OBJ_PHYSICS_NONE               EQU $00 ; pass-through
DEF OBJ_PHYSICS_SOLID              EQU $01
DEF OBJ_PHYSICS_STAIRS             EQU $02
DEF OBJ_PHYSICS_DOOR               EQU $03
DEF OBJ_PHYSICS_OCEAN_SWITCH_BLOCK EQU $04 ; blocks enemies but not projectiles?
DEF OBJ_PHYSICS_SHALLOW_WATER      EQU $05
DEF OBJ_PHYSICS_GRASS              EQU $06 ; cuttable
DEF OBJ_PHYSICS_DEEP_WATER         EQU $07
DEF OBJ_PHYSICS_RAISED             EQU $08
DEF OBJ_PHYSICS_LOWERED            EQU $09
DEF OBJ_PHYSICS_WIDE_STAIRS        EQU $0A
DEF OBJ_PHYSICS_LAVA               EQU $0B
DEF OBJ_PHYSICS_LEDGE_OVERWORLD    EQU $10 ; jumpable, only downwards
DEF OBJ_PHYSICS_REMOVABLE_OBSTACLE EQU $30 ; bush/rock/keyblock/cracked block/sword-crystals
DEF OBJ_PHYSICS_PIT                EQU $50
DEF OBJ_PHYSICS_PIT_WARP           EQU $51 ; pit with warp to other room (D1 boss, D7)
DEF OBJ_PHYSICS_HOOKSHOTABLE       EQU $60 ; solid or dash-crystal
DEF OBJ_PHYSICS_DOOR_OPEN          EQU $70 ; open door/flip door
DEF OBJ_PHYSICS_FINE_COLLISION     EQU $80 ; for 8x8 tile collision. 0-3: side; 4-7: inward corner; 8-B: outward corner
DEF OBJ_PHYSICS_DOOR_CLOSED        EQU $90 ; 0-3: key door; 8: boss door; 9-C: bombable door/wall
DEF OBJ_PHYSICS_WATER_SIDESCROLL   EQU $B0
DEF OBJ_PHYSICS_LADDER_SIDESCROLL  EQU $B1
DEF OBJ_PHYSICS_KEYHOLE            EQU $C0
DEF OBJ_PHYSICS_LEDGE              EQU $D0 ; jumpable, 0-3: direction
DEF OBJ_PHYSICS_SPIKES             EQU $E0
DEF OBJ_PHYSICS_CONVEYOR           EQU $F0 ; but not rapids. 0-3: side; 4-7: diagonal
DEF OBJ_PHYSICS_UNUSED             EQU $FE
DEF OBJ_PHYSICS_TRACTOR_DEVICE     EQU $FF
