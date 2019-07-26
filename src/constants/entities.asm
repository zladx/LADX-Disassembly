; Values for wEntitiesStateTable
ENTITY_STATE_DISABLED   equ 0
ENTITY_STATE_DYING      equ 1
ENTITY_STATE_FALLING    equ 2
ENTITY_STATE_DESTROYING equ 3
ENTITY_STATE_INIT       equ 4
ENTITY_STATE_ACTIVE     equ 5
ENTITY_STATE_STUNNED    equ 6
ENTITY_STATE_LIFTED     equ 7
ENTITY_STATE_THROWN     equ 8

; Values for wEntitiesTypeTable
; (See also EntityPointersTable)
ENTITY_BOOMERANG         equ $01
ENTITY_BOMB              equ $02
ENTITY_FLAME             equ $04
ENTITY_LIFTABLE_ROCK     equ $05
ENTITY_SPIT_OBJECT       equ $07
ENTITY_GOLDEN_LEAF       equ $30
ENTITY_SWORD             equ $31
ENTITY_HEART_PIECE       equ $35
ENTITY_HEART_CONTAINER   equ $36
ENTITY_MUSHROOM          equ $3A
ENTITY_SEASHELL          equ $3D
ENTITY_TYPE_RAFT_MAN     equ $6A
