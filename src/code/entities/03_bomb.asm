BombSprite::
    db   $80, OAM_GBC_PAL_5 | OAMF_PAL1

ExplosionSpriteRect::
.variant0
    db -8, -8, $32, OAM_GBC_PAL_1 | OAMF_PAL0, -8,  0, $32, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db -8,  8, $32, OAM_GBC_PAL_1 | OAMF_PAL0, -8, 16, $32, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP 
    db  8, -8, $32, OAM_GBC_PAL_1 | OAMF_PAL0,  8,  0, $32, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db  8,  8, $32, OAM_GBC_PAL_1 | OAMF_PAL0,  8, 16, $32, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db -8, -8, $10, OAM_GBC_PAL_2 | OAMF_PAL0,                          -8,  0, $12, OAM_GBC_PAL_2 | OAMF_PAL0
    db -8,  8, $12, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP,             -8, 16, $10, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db  8, -8, $10, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP,              8,  0, $12, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_YFLIP
    db  8,  8, $12, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP, 8, 16, $10, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP | OAMF_YFLIP
.variant2
    db -4, -4, $30, OAM_GBC_PAL_1 | OAMF_PAL1, -4,  4, $30, OAM_GBC_PAL_1 | OAMF_PAL1 | OAMF_XFLIP
    db -4,  4, $30, OAM_GBC_PAL_1 | OAMF_PAL1, -4, 12, $30, OAM_GBC_PAL_1 | OAMF_PAL1 | OAMF_XFLIP
    db  4, -4, $30, OAM_GBC_PAL_1 | OAMF_PAL1,  4,  4, $30, OAM_GBC_PAL_1 | OAMF_PAL1 | OAMF_XFLIP
    db  4,  4, $30, OAM_GBC_PAL_1 | OAMF_PAL1,  4, 12, $30, OAM_GBC_PAL_1 | OAMF_PAL1 | OAMF_XFLIP
.variant3
    db -4, -4, $30, OAM_GBC_PAL_1 | OAMF_PAL0, -4,  4, $30, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db -4,  4, $30, OAM_GBC_PAL_1 | OAMF_PAL0, -4, 12, $30, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db  4, -4, $30, OAM_GBC_PAL_1 | OAMF_PAL0,  4,  4, $30, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP
    db  4,  4, $30, OAM_GBC_PAL_1 | OAMF_PAL0,  4, 12, $30, OAM_GBC_PAL_1 | OAMF_PAL0 | OAMF_XFLIP

RenderBombExplosion::
    ld   hl, wEntitiesSpriteVariantTable          ;; 03:65B0 $21 $B0 $C3
    add  hl, bc                                   ;; 03:65B3 $09
    ld   a, [hl]                                  ;; 03:65B4 $7E
    sla  a                                        ;; 03:65B5 $CB $27
    sla  a                                        ;; 03:65B7 $CB $27
    sla  a                                        ;; 03:65B9 $CB $27
    sla  a                                        ;; 03:65BB $CB $27
    sla  a                                        ;; 03:65BD $CB $27
    ld   e, a                                     ;; 03:65BF $5F
    ld   d, b                                     ;; 03:65C0 $50
    ld   hl, ExplosionSpriteRect                  ;; 03:65C1 $21 $30 $65
    add  hl, de                                   ;; 03:65C4 $19
    ld   c, $08                                   ;; 03:65C5 $0E $08
    jp   RenderActiveEntitySpritesRect            ;; 03:65C7 $C3 $E6 $3C

ExplosionSpriteVariantFrames::
    ; Indexed by transition counter to make the explosion animation
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01
    db   $02, $02, $02, $02, $03, $03, $03, $03

BombExplosionHandler:
    call BombExplosionVisuals                     ;; 03:65E2 $CD $50 $66
    call ReturnIfNonInteractive_03                ;; 03:65E5 $CD $78 $7F
    call GetEntityTransitionCountdown             ;; 03:65E8 $CD $05 $0C
    and  a                                        ;; 03:65EB $A7
IF __PATCH_0__
    jp   z, UnloadEntityAndReturn
ELSE
    jp   nz, .stayLoaded                          ;; 03:65EC $C2 $F2 $65

    jp   UnloadEntityAndReturn                    ;; 03:65EF $C3 $8D $3F
ENDC

.stayLoaded
    ; If explosion is from Tarin's transformation from a Racoon,
    ; return without damaging Link, entities or objects.
    ld   e, a                                     ;; 03:65F2 $5F
    ld   hl, wEntitiesPrivateState4Table          ;; 03:65F3 $21 $40 $C4
    add  hl, bc                                   ;; 03:65F6 $09
    ld   a, [hl]                                  ;; 03:65F7 $7E
    cp   $4C                                      ;; 03:65F8 $FE $4C
    ld   a, e                                     ;; 03:65FA $7B
    jp   z, .ret                                  ;; 03:65FB $CA $4F $66

    cp   $0E                                      ;; 03:65FE $FE $0E
    jr   c, .checkForDestroyableObjectEnd         ;; 03:6600 $38 $12

    cp   $17                                      ;; 03:6602 $FE $17
    jr   nc, .checkForDestroyableObjectEnd        ;; 03:6604 $30 $0E

    push af                                       ;; 03:6606 $F5
    sub  $0E                                      ;; 03:6607 $D6 $0E
    ld   e, a                                     ;; 03:6609 $5F
    ld   d, b                                     ;; 03:660A $50
    push de                                       ;; 03:660B $D5
    call CheckForBombDestroyableObjectBasic       ;; 03:660C $CD $F8 $68
    pop  de                                       ;; 03:660F $D1
    call CheckForBombDestroyableObjectPuzzle      ;; 03:6610 $CD $71 $67
    pop  af                                       ;; 03:6613 $F1

.checkForDestroyableObjectEnd
    cp   $12                                      ;; 03:6614 $FE $12
    jr   nz, .ret                                 ;; 03:6616 $20 $37

    ld   hl, wEntitiesPrivateState4Table          ;; 03:6618 $21 $40 $C4
    add  hl, bc                                   ;; 03:661B $09
    ld   a, [hl]                                  ;; 03:661C $7E
    and  a                                        ;; 03:661D $A7
    jr   nz, .enemyBomb                           ;; 03:661E $20 $05

    ; Link bomb
    call CheckExplosionInteractionWithEntities    ;; 03:6620 $CD $D9 $77
    jr   .enemyBombEnd                            ;; 03:6623 $18 $25

.enemyBomb
    ; Enemy bomb
    ldh  a, [hActiveEntityPosX]                   ;; 03:6625 $F0 $EE
    ld   hl, hLinkPositionX                       ;; 03:6627 $21 $98 $FF
    sub  [hl]                                     ;; 03:662A $96
    add  $18                                      ;; 03:662B $C6 $18
    cp   $30                                      ;; 03:662D $FE $30
    jr   nc, .enemyBombEnd                        ;; 03:662F $30 $19

    ldh  a, [hActiveEntityPosY]                   ;; 03:6631 $F0 $EF
    ld   hl, hLinkPositionY                       ;; 03:6633 $21 $99 $FF
    sub  [hl]                                     ;; 03:6636 $96
    add  $18                                      ;; 03:6637 $C6 $18
    cp   $30                                      ;; 03:6639 $FE $30
    jr   nc, .enemyBombEnd                        ;; 03:663B $30 $0D

    call ApplyLinkCollisionWithEnemy              ;; 03:663D $CD $D5 $6C
    ld   hl, hLinkSpeedX                          ;; 03:6640 $21 $9A $FF
    sla  [hl]                                     ;; 03:6643 $CB $26
    ld   hl, hLinkSpeedY                          ;; 03:6645 $21 $9B $FF
    sla  [hl]                                     ;; 03:6648 $CB $26

.enemyBombEnd
    ld   a, $04                                   ;; 03:664A $3E $04
    ld   [wSwordMoblinAlertingSoundCounter], a    ;; 03:664C $EA $02 $C5

.ret
    ret                                           ;; 03:664F $C9

BombExplosionVisuals::
    call GetEntityTransitionCountdown             ;; 03:6650 $CD $05 $0C
    ld   e, a                                     ;; 03:6653 $5F
    ld   d, b                                     ;; 03:6654 $50
    ld   hl, ExplosionSpriteVariantFrames         ;; 03:6655 $21 $CA $65
    add  hl, de                                   ;; 03:6658 $19
    ld   a, [hl]                                  ;; 03:6659 $7E
    call SetEntitySpriteVariant                   ;; 03:665A $CD $0C $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 03:665D $21 $40 $C3
    add  hl, bc                                   ;; 03:6660 $09
    ld   a, [hl]                                  ;; 03:6661 $7E
    and  ENTITY_PHYSICS_MASK                      ;; 03:6662 $E6 $F0
    or   $08                                      ;; 03:6664 $F6 $08
    ld   [hl], a                                  ;; 03:6666 $77
    call RenderBombExplosion                      ;; 03:6667 $CD $B0 $65
    ld   a, [wIsIndoor]                           ;; 03:666A $FA $A5 $DB
    and  a                                        ;; 03:666D $A7
    jr   z, .ret                                  ;; 03:666E $28 $1B

    ld   a, [wTransitionSequenceCounter]          ;; 03:6670 $FA $6B $C1
    cp   $04                                      ;; 03:6673 $FE $04
    ret  nz                                       ;; 03:6675 $C0

    ; On DMG, the background flashes between two palettes when a bomb explodes.
    ld   e, %11_10_01_00                          ;; 03:6676 $1E $E4
    ld   a, [wRoomTransitionState]                ;; 03:6678 $FA $24 $C1
    and  a                                        ;; 03:667B $A7
    jr   nz, .bgFlashing                          ;; 03:667C $20 $09

    call GetEntityTransitionCountdown             ;; 03:667E $CD $05 $0C
    and  $04                                      ;; 03:6681 $E6 $04
    jr   z, .bgFlashing                           ;; 03:6683 $28 $02

    ld   e, %10_00_01_00                          ;; 03:6685 $1E $84

.bgFlashing
    ld   hl, wBGPalette                           ;; 03:6687 $21 $97 $DB
    ld   [hl], e                                  ;; 03:668A $73
.ret
    ret                                           ;; 03:668B $C9

.smallExplosion
    ld   de, BombRightBeforeExplodingSprite       ;; 03:668C $11 $84 $54
    call RenderActiveEntitySpritesPair            ;; 03:668F $CD $C0 $3B
    call ReturnIfNonInteractive_03                ;; 03:6692 $CD $78 $7F
    ret                                           ;; 03:6695 $C9

BombEntityHandler::
    ; If bomb is outside of the screen, clear it.
    ldh  a, [hActiveEntityVisualPosY]             ;; 03:6696 $F0 $EC
    add  $10                                      ;; 03:6698 $C6 $10
    cp   SCRN_Y + $10                             ;; 03:669A $FE $A0
    jp   nc, UnloadEntity                         ;; 03:669C $D2 $8D $3F

    call GetEntityTransitionCountdown             ;; 03:669F $CD $05 $0C
    cp   $18                                      ;; 03:66A2 $FE $18
    jp   c, BombExplosionHandler                  ;; 03:66A4 $DA $E2 $65

    jr   nz, .notExploding                        ;; 03:66A7 $20 $04

    dec  [hl]                                     ;; 03:66A9 $35
    call PlayBombExplosionSfx                     ;; 03:66AA $CD $4B $0C

.notExploding
    ld   hl, wHasPlacedBomb                       ;; 03:66AD $21 $4E $C1
    inc  [hl]                                     ;; 03:66B0 $34
    cp   $22                                      ;; 03:66B1 $FE $22
    jr   c, BombExplosionVisuals.smallExplosion   ;; 03:66B3 $38 $D7

    cp   $48                                      ;; 03:66B5 $FE $48
    jr   nz, .skipStartFlashing                   ;; 03:66B7 $20 $06

    ld   hl, wEntitiesFlashCountdownTable         ;; 03:66B9 $21 $20 $C4
    add  hl, bc                                   ;; 03:66BC $09
    ld   [hl], $30                                ;; 03:66BD $36 $30

.skipStartFlashing
    call RenderBomb                               ;; 03:66BF $CD $11 $67
    call CheckForEntityFallingDownQuicksandHole   ;; 03:66C2 $CD $EA $5C
    call ReturnIfNonInteractive_03                ;; 03:66C5 $CD $78 $7F
    call BouncingEntityPhysics                    ;; 03:66C8 $CD $B3 $60
    ld   hl, wEntitiesPrivateCountdown2Table      ;; 03:66CB $21 $00 $C3
    add  hl, bc                                   ;; 03:66CE $09
    ld   [hl], $FF                                ;; 03:66CF $36 $FF
    call GetEntityPrivateCountdown1               ;; 03:66D1 $CD $00 $0C
    ld   hl, wEntitiesPrivateState4Table          ;; 03:66D4 $21 $40 $C4
    add  hl, bc                                   ;; 03:66D7 $09
    or   [hl]                                     ;; 03:66D8 $B6
    jr   nz, .BounceOffWalls                      ;; 03:66D9 $20 $1F

    ld   a, [wInventoryItems.BButtonSlot]         ;; 03:66DB $FA $00 $DB
    cp   INVENTORY_BOMBS                          ;; 03:66DE $FE $02
    jr   nz, .checkAButtonSlot                    ;; 03:66E0 $20 $08

    ldh  a, [hJoypadState]                        ;; 03:66E2 $F0 $CC
    and  J_B                                      ;; 03:66E4 $E6 $20
    jr   nz, .liftUp                              ;; 03:66E6 $20 $0F

    jr   .BounceOffWalls                          ;; 03:66E8 $18 $10

.checkAButtonSlot
    ld   a, [wInventoryItems.AButtonSlot]         ;; 03:66EA $FA $01 $DB
    cp   INVENTORY_BOMBS                          ;; 03:66ED $FE $02
    jr   nz, .BounceOffWalls                      ;; 03:66EF $20 $09

    ldh  a, [hJoypadState]                        ;; 03:66F1 $F0 $CC
    and  J_A                                      ;; 03:66F3 $E6 $10
    jr   z, .BounceOffWalls                       ;; 03:66F5 $28 $03

.liftUp
    call EntityGetLiftedUp                        ;; 03:66F7 $CD $35 $4E

; Also called from lifted entity handler
.BounceOffWalls:
    ld   hl, wEntitiesCollisionsTable             ;; 03:66FA $21 $A0 $C2
    add  hl, bc                                   ;; 03:66FD $09
    ld   a, [hl]                                  ;; 03:66FE $7E
    and  $03                                      ;; 03:66FF $E6 $03
    jr   z, .noCollisionX                         ;; 03:6701 $28 $03

    call EntityBounceOffWallX                     ;; 03:6703 $CD $34 $6B

.noCollisionX
    ldh  a, [hIsSideScrolling]                    ;; 03:6706 $F0 $F9
    and  a                                        ;; 03:6708 $A7
    ret  nz                                       ;; 03:6709 $C0

    ld   a, [hl]                                  ;; 03:670A $7E
    and  $0C                                      ;; 03:670B $E6 $0C
    ret  z                                        ;; 03:670D $C8

    jp   EntityBounceOffWallY                     ;; 03:670E $C3 $43 $6B

RenderBomb:: ; Also called from lifted item handler.
    ld   hl, hActiveEntityVisualPosY              ;; 03:6711 $21 $EC $FF
    inc  [hl]                                     ;; 03:6714 $34
    inc  [hl]                                     ;; 03:6715 $34
    ld   de, BombSprite                           ;; 03:6716 $11 $2E $65
    call RenderActiveEntitySprite                 ;; 03:6719 $CD $77 $3C
    jp   CopyEntityPositionToActivePosition       ;; 03:671C $C3 $8A $3D

; Added to bomb's x position to obtain the x position of the object to try to destroy.
; Indexed by transition countdown - 0x0E
BombObjectPuzzleDestroyingX::
    db   $F8, $08, $18
    db   $F8, $08, $18
    db   $F8, $08, $18

; Added to bomb's y position to obtain the y position of the object to try to destroy.
; Indexed by transition countdown - 0x0E
BombObjectPuzzleDestroyingY::
    db   $F8, $F8, $F8
    db   $08, $08, $08
    db   $18, $18, $18

; Unused?
db $48, $48, $00, $90, $00, $70, $38, $38

; Indexed by the indoors bombable wall's: physicsFlags - (OBJ_PHYSICS_DOOR_CLOSED | $09)
BombedWallObjects::
    db OBJECT_BOMBED_PASSAGE_VERTICAL
    db OBJECT_BOMBED_PASSAGE_VERTICAL
    db OBJECT_BOMBED_PASSAGE_HORIZONTAL
    db OBJECT_BOMBED_PASSAGE_HORIZONTAL

; Bombed passsage tiles.
; First row is for vertical passages; second row is for horizontal passages.
; Only the first four values of each are used, though?
BombedWallTilesIndexes::
    db   $72, $72, $73, $73, $04, $04, $04, $04
    db   $69, $79, $69, $79, $04, $04, $04, $04

; DMG cave entrance tiles.
BombedCaveDoorTilesIndexesDMG::
    db   $64, $66, $65, $67

; GBC cave entrance tiles.
BombedCaveDoorTilesIndexesGBC::
    db   $64, $66, $64, $66

; Room status for bombed walls.
; Indexed by the indoors bombable wall's: physicsFlags - (OBJ_PHYSICS_DOOR_CLOSED | $09)
BombedWallCurrentRoomStatus::
    db ROOM_STATUS_DOOR_OPEN_UP
    db ROOM_STATUS_DOOR_OPEN_DOWN
    db ROOM_STATUS_DOOR_OPEN_LEFT
    db ROOM_STATUS_DOOR_OPEN_RIGHT

; Room status for the equivalent bombed wall in the adjacent room.
; Indexed by the indoors bombable wall's: physicsFlags - (OBJ_PHYSICS_DOOR_CLOSED | $09)
BombedWallAdjacentRoomStatus::
    db ROOM_STATUS_DOOR_OPEN_DOWN
    db ROOM_STATUS_DOOR_OPEN_UP
    db ROOM_STATUS_DOOR_OPEN_RIGHT
    db ROOM_STATUS_DOOR_OPEN_LEFT

; Added to current indoor room to get the room on the other side of the bombed wall
; (to mark the other side as having been bombed too)
; Indexed by the indoors bombable wall's: physicsFlags - (OBJ_PHYSICS_DOOR_CLOSED | $09)
BombedWallAdjacentRoomMapPosDiff::
    db   -$08, $08, -$01, $01

; Rocky ground tiles (for after bombing the giant skull)
BombedGiantSkullTilesIndexes::
    db   $72, $73, $73, $72

; Unused?
    db $00, $00, $00, $00

; Each is added to [hIntersectedObjectLeft] to loop through each tile of the giant skull.
GiantSkullDiffFromPrevPositionX::
    db   $00, $10, $F0, $10

; Each is added to [hIntersectedObjectTop] to loop through each tile of the giant skull.
GiantSkullDiffFromPrevPositionY::
    db   $00, $00, $10, $00

; Check if we have a destroyable tile for the bomb.
; Only "puzzle" objects are checked here, that stay permanently open
;   Parameter: de, offset into x,y offset table for what tiles to check.
CheckForBombDestroyableObjectPuzzle::
    ldh  a, [hIsSideScrolling]                    ;; 03:6771 $F0 $F9
    and  a                                        ;; 03:6773 $A7
    jp   nz, .return                              ;; 03:6774 $C2 $E5 $68

    push bc                                       ;; 03:6777 $C5
    ld   hl, wEntitiesPosXTable                   ;; 03:6778 $21 $00 $C2
    add  hl, bc                                   ;; 03:677B $09
    ld   a, [hl]                                  ;; 03:677C $7E
    sub  $08                                      ;; 03:677D $D6 $08
    ld   hl, BombObjectPuzzleDestroyingX          ;; 03:677F $21 $1F $67
    add  hl, de                                   ;; 03:6782 $19
    add  [hl]                                     ;; 03:6783 $86
    and  $F0                                      ;; 03:6784 $E6 $F0
    ldh  [hIntersectedObjectLeft], a              ;; 03:6786 $E0 $CE
    swap a                                        ;; 03:6788 $CB $37
    ld   hl, wEntitiesPosYTable                   ;; 03:678A $21 $10 $C2
    add  hl, bc                                   ;; 03:678D $09
    ld   c, a                                     ;; 03:678E $4F
    ld   a, [hl]                                  ;; 03:678F $7E
    sub  $10                                      ;; 03:6790 $D6 $10
    ld   hl, BombObjectPuzzleDestroyingY          ;; 03:6792 $21 $28 $67
    add  hl, de                                   ;; 03:6795 $19
    add  [hl]                                     ;; 03:6796 $86
    and  $F0                                      ;; 03:6797 $E6 $F0
    ldh  [hIntersectedObjectTop], a               ;; 03:6799 $E0 $CD
    or   c                                        ;; 03:679B $B1
    ld   c, a                                     ;; 03:679C $4F
    ld   b, $00                                   ;; 03:679D $06 $00
    ld   hl, wRoomObjects                         ;; 03:679F $21 $11 $D7
    ld   a, h                                     ;; 03:67A2 $7C
    add  hl, bc                                   ;; 03:67A3 $09
    ld   h, a                                     ;; 03:67A4 $67
    ld   a, c                                     ;; 03:67A5 $79
    ldh  [hIndexOfObjectBelowLink], a             ;; 03:67A6 $E0 $E9
    ld   a, [hl]                                  ;; 03:67A8 $7E
    ldh  [hObjectUnderEntity], a                  ;; 03:67A9 $E0 $AF
    ld   e, a                                     ;; 03:67AB $5F
    cp   OBJECT_GIANT_SKULL_TL                    ;; 03:67AC $FE $BB
    jr   c, .giantSkullEnd                        ;; 03:67AE $38 $78

    cp   OBJECT_GIANT_SKULL_BR + 1                ;; 03:67B0 $FE $BF
    jr   nc, .giantSkullEnd                       ;; 03:67B2 $30 $74

    ld   a, [wIsIndoor]                           ;; 03:67B4 $FA $A5 $DB
    and  a                                        ;; 03:67B7 $A7
    jr   nz, .giantSkullEnd                       ;; 03:67B8 $20 $6E

    ; Destroy the giant skull.
    ld   a, JINGLE_PUZZLE_SOLVED                  ;; 03:67BA $3E $02
    ldh  [hJingle], a                             ;; 03:67BC $E0 $F2
    ldh  a, [hIntersectedObjectTop]               ;; 03:67BE $F0 $CD
    and  $E0                                      ;; 03:67C0 $E6 $E0
    ldh  [hIntersectedObjectTop], a               ;; 03:67C2 $E0 $CD
    ldh  a, [hIntersectedObjectLeft]              ;; 03:67C4 $F0 $CE
    and  $E0                                      ;; 03:67C6 $E6 $E0
    ldh  [hIntersectedObjectLeft], a              ;; 03:67C8 $E0 $CE
    ld   a, $03                                   ;; 03:67CA $3E $03
    call Spawn2x2RubbleEntities_trampoline        ;; 03:67CC $CD $A7 $0A
    ld   a, c                                     ;; 03:67CF $79
    and  $EE                                      ;; 03:67D0 $E6 $EE
    ld   c, a                                     ;; 03:67D2 $4F
    ld   hl, wRoomObjects                         ;; 03:67D3 $21 $11 $D7
    add  hl, bc                                   ;; 03:67D6 $09
    ld   a, OBJECT_ROCKY_GROUND                   ;; 03:67D7 $3E $09
    ld   [hl+], a                                 ;; 03:67D9 $22
    ld   [hl-], a                                 ;; 03:67DA $32
    ld   a, $83                                   ;; 03:67DB $3E $83
    call BackupObjectInRAM2                       ;; 03:67DD $CD $2F $0B
    inc  hl                                       ;; 03:67E0 $23
    ld   a, $83                                   ;; 03:67E1 $3E $83
    call BackupObjectInRAM2                       ;; 03:67E3 $CD $2F $0B
    dec  hl                                       ;; 03:67E6 $2B
    ld   a, l                                     ;; 03:67E7 $7D
    add  $10                                      ;; 03:67E8 $C6 $10
    ld   l, a                                     ;; 03:67EA $6F
    ld   a, OBJECT_ROCKY_GROUND                   ;; 03:67EB $3E $09
    ld   [hl+], a                                 ;; 03:67ED $22
    ld   [hl], a                                  ;; 03:67EE $77
    ld   [wDDD8], a                               ;; 03:67EF $EA $D8 $DD
    ld   a, $83                                   ;; 03:67F2 $3E $83
    call BackupObjectInRAM2                       ;; 03:67F4 $CD $2F $0B
    dec  hl                                       ;; 03:67F7 $2B
    ld   a, $83                                   ;; 03:67F8 $3E $83
    call BackupObjectInRAM2                       ;; 03:67FA $CD $2F $0B
    inc  hl                                       ;; 03:67FD $23
    ld   c, $03                                   ;; 03:67FE $0E $03
    ld   b, $00                                   ;; 03:6800 $06 $00

.loop
    call .updateRoomStatusAndDrawRockyGround      ;; 03:6802 $CD $22 $68
    ld   hl, GiantSkullDiffFromPrevPositionX      ;; 03:6805 $21 $69 $67
    add  hl, bc                                   ;; 03:6808 $09
    ld   a, [hl]                                  ;; 03:6809 $7E
    ld   hl, hIntersectedObjectLeft               ;; 03:680A $21 $CE $FF
    add  [hl]                                     ;; 03:680D $86
    ld   [hl], a                                  ;; 03:680E $77
    ld   hl, GiantSkullDiffFromPrevPositionY      ;; 03:680F $21 $6D $67
    add  hl, bc                                   ;; 03:6812 $09
    ld   a, [hl]                                  ;; 03:6813 $7E
    ld   hl, hIntersectedObjectTop                ;; 03:6814 $21 $CD $FF
    add  [hl]                                     ;; 03:6817 $86
    ld   [hl], a                                  ;; 03:6818 $77
    dec  c                                        ;; 03:6819 $0D
    ld   a, c                                     ;; 03:681A $79
    cp   $FF                                      ;; 03:681B $FE $FF
    jr   nz, .loop                                ;; 03:681D $20 $E3

    jp   .popBCAndReturn                          ;; 03:681F $C3 $E4 $68

.updateRoomStatusAndDrawRockyGround
    ld   de, BombedGiantSkullTilesIndexes         ;; 03:6822 $11 $61 $67
    jp   .updateRoomStatusAndDraw                 ;; 03:6825 $C3 $65 $68

.giantSkullEnd
    ld   a, [wIsIndoor]                           ;; 03:6828 $FA $A5 $DB
    ld   d, a                                     ;; 03:682B $57
    call GetObjectPhysicsFlags_trampoline         ;; 03:682C $CD $26 $2A
    sub  OBJ_PHYSICS_DOOR_CLOSED | $09            ;; 03:682F $D6 $99
    jp   c, .popBCAndReturn                       ;; 03:6831 $DA $E4 $68

    cp   $04                                      ;; 03:6834 $FE $04
    jp   nc, .popBCAndReturn                      ;; 03:6836 $D2 $E4 $68

    ; Destroy bombable doors/walls.
    ld   c, a                                     ;; 03:6839 $4F
    ld   a, JINGLE_PUZZLE_SOLVED                  ;; 03:683A $3E $02
    ldh  [hJingle], a                             ;; 03:683C $E0 $F2
    ld   a, [wIsIndoor]                           ;; 03:683E $FA $A5 $DB
    and  a                                        ;; 03:6841 $A7
    jr   nz, .indoorsBombableDoor                 ;; 03:6842 $20 $34

    ; Outdoors (cave entrance)
    pop  bc                                       ;; 03:6844 $C1
    ldh  a, [hIndexOfObjectBelowLink]             ;; 03:6845 $F0 $E9
    ld   e, a                                     ;; 03:6847 $5F
    ld   d, b                                     ;; 03:6848 $50
    ld   hl, wRoomObjects                         ;; 03:6849 $21 $11 $D7
    add  hl, de                                   ;; 03:684C $19
    ld   a, OBJECT_ROCKY_CAVE_DOOR                ;; 03:684D $3E $E1
    ld   [hl], a                                  ;; 03:684F $77
    ld   [wDDD8], a                               ;; 03:6850 $EA $D8 $DD
    ld   a, $83                                   ;; 03:6853 $3E $83
    call BackupObjectInRAM2                       ;; 03:6855 $CD $2F $0B
IF __OPTIMIZATIONS_3__
    ld   de, BombedCaveDoorTilesIndexesDMG
    ldh  a, [hIsGBC]
    and  a
    jr   z, .updateRoomStatusAndDraw
    ld   de, BombedCaveDoorTilesIndexesGBC
ELSE
    ldh  a, [hIsGBC]                              ;; 03:6858 $F0 $FE
    and  a                                        ;; 03:685A $A7
    jr   z, .isNotGBC                             ;; 03:685B $28 $05

    ld   de, BombedCaveDoorTilesIndexesGBC        ;; 03:685D $11 $51 $67
    jr   .updateRoomStatusAndDraw                 ;; 03:6860 $18 $03
.isNotGBC
    ld   de, BombedCaveDoorTilesIndexesDMG        ;; 03:6862 $11 $4D $67
ENDC

.updateRoomStatusAndDraw
    push de                                       ;; 03:6865 $D5
    ld   hl, wOverworldRoomStatus                 ;; 03:6866 $21 $00 $D8
    ldh  a, [hMapRoom]                            ;; 03:6869 $F0 $F6
    ld   e, a                                     ;; 03:686B $5F
    ld   d, $00                                   ;; 03:686C $16 $00
    add  hl, de                                   ;; 03:686E $19
    ld   a, [hl]                                  ;; 03:686F $7E
    or   OW_ROOM_STATUS_OPENED                    ;; 03:6870 $F6 $04
    ld   [hl], a                                  ;; 03:6872 $77
    ldh  [hRoomStatus], a                         ;; 03:6873 $E0 $F8
    jp   label_003_51F5                           ;; 03:6875 $C3 $F5 $51

.indoorsBombableDoor
    ; Set room status for current room.
    ld   hl, wIndoorARoomStatus                   ;; 03:6878 $21 $00 $D9
    ldh  a, [hMapRoom]                            ;; 03:687B $F0 $F6
    ld   e, a                                     ;; 03:687D $5F
    ld   d, $00                                   ;; 03:687E $16 $00
    ldh  a, [hMapId]                              ;; 03:6880 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 03:6882 $FE $FF
    jr   nz, .colorDungeonEnd                     ;; 03:6884 $20 $05

    ld   hl, wColorDungeonRoomStatus              ;; 03:6886 $21 $E0 $DD
    jr   .setRoomStatus                           ;; 03:6889 $18 $09

.colorDungeonEnd
    cp   MAP_UNKNOWN_1A                           ;; 03:688B $FE $1A
    jr   nc, .setRoomStatus                       ;; 03:688D $30 $05

    cp   MAP_EAGLES_TOWER                         ;; 03:688F $FE $06
    jr   c, .setRoomStatus                        ;; 03:6891 $38 $01

    inc  d                                        ;; 03:6893 $14

.setRoomStatus
    add  hl, de                                   ;; 03:6894 $19
    ld   e, l                                     ;; 03:6895 $5D
    ld   d, h                                     ;; 03:6896 $54
    ld   hl, BombedWallCurrentRoomStatus          ;; 03:6897 $21 $55 $67
    add  hl, bc                                   ;; 03:689A $09
    ld   a, [de]                                  ;; 03:689B $1A
    or   [hl]                                     ;; 03:689C $B6
    ld   [de], a                                  ;; 03:689D $12
    ldh  [hRoomStatus], a                         ;; 03:689E $E0 $F8

    ; Set room status for adjacent room.
    ld   hl, BombedWallAdjacentRoomMapPosDiff     ;; 03:68A0 $21 $5D $67
    add  hl, bc                                   ;; 03:68A3 $09
    ld   a, [wIndoorRoom]                         ;; 03:68A4 $FA $AE $DB
    add  [hl]                                     ;; 03:68A7 $86
    ld   e, a                                     ;; 03:68A8 $5F
    ld   d, $00                                   ;; 03:68A9 $16 $00
    call GetRoomStatusAddressForMapPosition_trampoline ;; 03:68AB $CD $C1 $2B
    ld   e, l                                     ;; 03:68AE $5D
    ld   d, h                                     ;; 03:68AF $54
    ld   hl, BombedWallAdjacentRoomStatus         ;; 03:68B0 $21 $59 $67
    add  hl, bc                                   ;; 03:68B3 $09
    ld   a, [de]                                  ;; 03:68B4 $1A
    or   [hl]                                     ;; 03:68B5 $B6
    ld   [de], a                                  ;; 03:68B6 $12
    ldh  a, [hIntersectedObjectLeft]              ;; 03:68B7 $F0 $CE
    swap a                                        ;; 03:68B9 $CB $37
    and  $0F                                      ;; 03:68BB $E6 $0F
    ld   e, a                                     ;; 03:68BD $5F
    ldh  a, [hIntersectedObjectTop]               ;; 03:68BE $F0 $CD
    and  $F0                                      ;; 03:68C0 $E6 $F0
    or   e                                        ;; 03:68C2 $B3
    ld   e, a                                     ;; 03:68C3 $5F
    ld   d, $00                                   ;; 03:68C4 $16 $00
    ld   hl, wRoomObjects                         ;; 03:68C6 $21 $11 $D7
    add  hl, de                                   ;; 03:68C9 $19
    ld   e, l                                     ;; 03:68CA $5D
    ld   d, h                                     ;; 03:68CB $54
    ld   hl, BombedWallObjects                    ;; 03:68CC $21 $39 $67
    add  hl, bc                                   ;; 03:68CF $09
    ld   a, [hl]                                  ;; 03:68D0 $7E
    ld   [de], a                                  ;; 03:68D1 $12
    ld   [wDDD8], a                               ;; 03:68D2 $EA $D8 $DD
    ld   a, c                                     ;; 03:68D5 $79
    and  $02                                      ;; 03:68D6 $E6 $02
    rla                                           ;; 03:68D8 $17
    rla                                           ;; 03:68D9 $17
    ld   c, a                                     ;; 03:68DA $4F
    ld   hl, BombedWallTilesIndexes               ;; 03:68DB $21 $3D $67
    add  hl, bc                                   ;; 03:68DE $09
    pop  bc                                       ;; 03:68DF $C1
    push hl                                       ;; 03:68E0 $E5
    jp   label_003_51F5                           ;; 03:68E1 $C3 $F5 $51

.popBCAndReturn
    pop  bc                                       ;; 03:68E4 $C1

.return
    ret                                           ;; 03:68E5 $C9

; Added to bomb's x position to obtain the x position of the object to try to destroy.
; Indexed by transition countdown - 0x0E
BombObjectBasicDestroyingX::
    db   $F8, $08, $18
    db   $F8, $08, $18
    db   $F8, $08, $18

; Added to bomb's y position to obtain the y position of the object to try to destroy.
; Indexed by transition countdown - 0x0E
BombObjectBasicDestroyingY::
    db   $F8, $F8, $F8
    db   $08, $08, $08
    db   $18, $18, $18

; Check if we have a destroyable tile for the bomb.
; Only "basic" objects are checked here, that reset after you leave the room.
;   Parameter: de, offset into x,y offset table for what tiles to check.
CheckForBombDestroyableObjectBasic::
    push bc                                       ;; 03:68F8 $C5
    ld   hl, BombObjectBasicDestroyingX           ;; 03:68F9 $21 $E6 $68
    add  hl, de                                   ;; 03:68FC $19
    ldh  a, [hActiveEntityPosX]                   ;; 03:68FD $F0 $EE
    add  [hl]                                     ;; 03:68FF $86
    sub  $08                                      ;; 03:6900 $D6 $08
    and  $F0                                      ;; 03:6902 $E6 $F0
    ldh  [hIntersectedObjectLeft], a              ;; 03:6904 $E0 $CE
    swap a                                        ;; 03:6906 $CB $37
    ld   c, a                                     ;; 03:6908 $4F
    ld   hl, BombObjectBasicDestroyingY           ;; 03:6909 $21 $EF $68
    add  hl, de                                   ;; 03:690C $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 03:690D $F0 $EC

    add  [hl]                                     ;; 03:690F $86
    sub  $10                                      ;; 03:6910 $D6 $10
    and  $F0                                      ;; 03:6912 $E6 $F0
    ldh  [hIntersectedObjectTop], a               ;; 03:6914 $E0 $CD
    or   c                                        ;; 03:6916 $B1
    ld   e, a                                     ;; 03:6917 $5F
    ld   hl, wRoomObjects                         ;; 03:6918 $21 $11 $D7
    add  hl, de                                   ;; 03:691B $19
    ld   a, h                                     ;; 03:691C $7C
    cp   HIGH(wRoomObjectsArea)                   ;; 03:691D $FE $D7
    jp   nz, .return                              ;; 03:691F $C2 $A0 $69

    ld   a, [wIsIndoor]                           ;; 03:6922 $FA $A5 $DB
    and  a                                        ;; 03:6925 $A7
    ld   a, [hl]                                  ;; 03:6926 $7E
    ldh  [hObjectUnderEntity], a                  ;; 03:6927 $E0 $AF
    jr   nz, .indoor                              ;; 03:6929 $20 $11

    ldh  [hMultiPurposeH], a                      ;; 03:692B $E0 $E9
    cp   OBJECT_TALL_GRASS                        ;; 03:692D $FE $0A
    jr   z, .bombedGrassOrBush                    ;; 03:692F $28 $33

    cp   OBJECT_BUSH_GROUND_STAIRS                ;; 03:6931 $FE $D3
    jr   z, .bombedGrassOrBush                    ;; 03:6933 $28 $2F

    cp   OBJECT_BUSH                              ;; 03:6935 $FE $5C
    jr   z, .bombedGrassOrBush                    ;; 03:6937 $28 $2B

    jp   .return                                  ;; 03:6939 $C3 $A0 $69

.indoor
    cp   OBJECT_BOMBABLE_BLOCK                    ;; 03:693C $FE $A9
    jp   nz, .return                              ;; 03:693E $C2 $A0 $69

    ld   hl, wIndoorARoomStatus                   ;; 03:6941 $21 $00 $D9
    ldh  a, [hMapRoom]                            ;; 03:6944 $F0 $F6
    ld   c, a                                     ;; 03:6946 $4F
    ld   b, $00                                   ;; 03:6947 $06 $00
    ldh  a, [hMapId]                              ;; 03:6949 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 03:694B $FE $FF
    jr   nz, .colorDungeonEnd                     ;; 03:694D $20 $05

    ld   hl, wColorDungeonRoomStatus              ;; 03:694F $21 $E0 $DD
    jr   .setRoomStatus                           ;; 03:6952 $18 $09

.colorDungeonEnd
    cp   MAP_INDOORS_B_END                        ;; 03:6954 $FE $1A
    jr   nc, .setRoomStatus                       ;; 03:6956 $30 $05

    cp   MAP_INDOORS_B_START                      ;; 03:6958 $FE $06
    jr   c, .setRoomStatus                        ;; 03:695A $38 $01

    inc  b                                        ;; 03:695C $04

.setRoomStatus
    add  hl, bc                                   ;; 03:695D $09
    ld   a, [hl]                                  ;; 03:695E $7E
    or   ROOM_STATUS_EVENT_3                      ;; 03:695F $F6 $40
    ld   [hl], a                                  ;; 03:6961 $77
    ldh  [hRoomStatus], a                         ;; 03:6962 $E0 $F8

.bombedGrassOrBush
    call RevealObjectUnderObject_trampoline       ;; 03:6964 $CD $78 $21

    ; When tall grass or a bush are bombed, spawn a bush entity for the visual effect.
    ld   a, ENTITY_LIFTABLE_ROCK                  ;; 03:6967 $3E $05
    call SpawnNewEntity                           ;; 03:6969 $CD $CA $64
    jr   c, .return                               ;; 03:696C $38 $32

    xor  a                                        ;; 03:696E $AF
    ld   [wLinkAttackStepAnimationCountdown], a   ;; 03:696F $EA $9B $C1

    ld   hl, wEntitiesPosXTable                   ;; 03:6972 $21 $00 $C2
    add  hl, de                                   ;; 03:6975 $19
    ldh  a, [hIntersectedObjectLeft]              ;; 03:6976 $F0 $CE
    add  $08                                      ;; 03:6978 $C6 $08
    ld   [hl], a                                  ;; 03:697A $77
    ld   hl, wEntitiesPosYTable                   ;; 03:697B $21 $10 $C2
    add  hl, de                                   ;; 03:697E $19
    ldh  a, [hIntersectedObjectTop]               ;; 03:697F $F0 $CD
    add  $10                                      ;; 03:6981 $C6 $10
    ld   [hl], a                                  ;; 03:6983 $77
    ld   hl, wEntitiesSpriteVariantTable          ;; 03:6984 $21 $B0 $C3
    add  hl, de                                   ;; 03:6987 $19
    ld   a, [wIsIndoor]                           ;; 03:6988 $FA $A5 $DB
    xor  $01                                      ;; 03:698B $EE $01
    ld   [hl], a                                  ;; 03:698D $77
    ldh  [hActiveEntitySpriteVariant], a          ;; 03:698E $E0 $F1
    ldh  a, [hMultiPurposeH]                      ;; 03:6990 $F0 $E9
    cp   OBJECT_TALL_GRASS                        ;; 03:6992 $FE $0A
    jr   nz, .makeInvisibleEnd                    ;; 03:6994 $20 $05

    ; If the bombed object is tall grass, make the bush entity invisible
    ld   a, $FF                                   ;; 03:6996 $3E $FF
    ld   [hl], a                                  ;; 03:6998 $77
    ldh  [hActiveEntitySpriteVariant], a          ;; 03:6999 $E0 $F1

.makeInvisibleEnd
    ld   c, e                                     ;; 03:699B $4B
    ld   b, d                                     ;; 03:699C $42
    call LiftableRockStartSmashingAnimation       ;; 03:699D $CD $E4 $53

.return
    pop  bc                                       ;; 03:69A0 $C1
    ret                                           ;; 03:69A1 $C9
