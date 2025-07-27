; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
RaisableBlockSpriteVariants::
    db $F8, OAM_GBC_PAL_0 | OAMF_PAL1
    db $FA, OAM_GBC_PAL_0 | OAMF_PAL1

RaisableBlockShiftedRightEntityHandler::
    ldh  a, [hActiveEntityState]                  ;; 06:4EA1 $F0 $F0
    and  a                                        ;; 06:4EA3 $A7
    jr   nz, .update                              ;; 06:4EA4 $20 $11

    ; Init
    ; (hActiveEntityState == 0)

    ; wEntitiesPosXTable += 8
    ld   hl, wEntitiesPosXTable                   ;; 06:4EA6 $21 $00 $C2
    add  hl, bc                                   ;; 06:4EA9 $09
    ld   a, [hl]                                  ;; 06:4EAA $7E
    add  $08                                      ;; 06:4EAB $C6 $08
    ld   [hl], a                                  ;; 06:4EAD $77
    ; wEntitiesPosZTable += 10
    ld   hl, wEntitiesPosZTable                   ;; 06:4EAE $21 $10 $C3
    add  hl, bc                                   ;; 06:4EB1 $09
    ld   [hl], $10                                ;; 06:4EB2 $36 $10
    jp   IncrementEntityState                     ;; 06:4EB4 $C3 $12 $3B

.update
    ld   de, RaisableBlockSpriteVariants          ;; 06:4EB7 $11 $9D $4E
    call RenderActiveEntitySpritesPair            ;; 06:4EBA $CD $C0 $3B

    call ReturnIfNonInteractive_06                ;; 06:4EBD $CD $C6 $64

    ldh  a, [hMovingBlockMoverState]              ;; 06:4EC0 $F0 $BA
    cp   $02                                      ;; 06:4EC2 $FE $02
    jr   z, .shoveLink                            ;; 06:4EC4 $28 $2C

    and  a                                        ;; 06:4EC6 $A7
    jr   z, .moverNotGrabbed                      ;; 06:4EC7 $28 $1A

    ; If the moving block mover is being pulled, raise the block into the air
    ld   hl, wEntitiesInertiaTable                ;; 06:4EC9 $21 $D0 $C3
    add  hl, bc                                   ;; 06:4ECC $09
    inc  [hl]                                     ;; 06:4ECD $34
    ld   a, [hl]                                  ;; 06:4ECE $7E
    cp   $0A                                      ;; 06:4ECF $FE $0A
    jr   nz, .return                              ;; 06:4ED1 $20 $0F

    ld   [hl], b                                  ;; 06:4ED3 $70

    ld   a, NOISE_SFX_RUMBLE                      ;; 06:4ED4 $3E $11
    ldh  [hNoiseSfx], a                           ;; 06:4ED6 $E0 $F4

    ld   hl, wEntitiesPosZTable                   ;; 06:4ED8 $21 $10 $C3
    add  hl, bc                                   ;; 06:4EDB $09
    ld   a, [hl]                                  ;; 06:4EDC $7E
    cp   $20                                      ;; 06:4EDD $FE $20
    jr   nc, .return                              ;; 06:4EDF $30 $01

    inc  [hl]                                     ;; 06:4EE1 $34

.return
    ret                                           ;; 06:4EE2 $C9

.moverNotGrabbed
    ld   hl, wEntitiesPosZTable                   ;; 06:4EE3 $21 $10 $C3
    add  hl, bc                                   ;; 06:4EE6 $09
    ld   a, [hl]                                  ;; 06:4EE7 $7E
    and  a                                        ;; 06:4EE8 $A7
    jr   z, .onGround                             ;; 06:4EE9 $28 $23
    
    ; If the moving block mover isn't grabbed, and the block is in the air, fall slowly
    ldh  a, [hFrameCounter]                       ;; 06:4EEB $F0 $E7
    and  $0F                                      ;; 06:4EED $E6 $0F
    jr   nz, .shoveLink                           ;; 06:4EEF $20 $01

    dec  [hl]                                     ;; 06:4EF1 $35

.shoveLink
    ld   a, [hl]                                  ;; 06:4EF2 $7E
    cp   $04                                      ;; 06:4EF3 $FE $04
    jr   nc, .shoveLinkEnd                        ;; 06:4EF5 $30 $16

    ; If the block hits Link while falling, shove him away
    call CheckLinkCollisionWithEnemy_trampoline   ;; 06:4EF7 $CD $5A $3B
    ret  nc                                       ;; 06:4EFA $D0

    ld   a, $08                                   ;; 06:4EFB $3E $08
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 06:4EFD $EA $3E $C1
    ld   a, $10                                   ;; 06:4F00 $3E $10
    call GetVectorTowardsLink_trampoline          ;; 06:4F02 $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ;; 06:4F05 $F0 $D7
    ldh  [hLinkSpeedY], a                         ;; 06:4F07 $E0 $9B
    ldh  a, [hMultiPurpose1]                      ;; 06:4F09 $F0 $D8
    ldh  [hLinkSpeedX], a                         ;; 06:4F0B $E0 $9A

.shoveLinkEnd
    ret                                           ;; 06:4F0D $C9

.onGround
    call CheckLinkCollisionWithEnemy_trampoline   ;; 06:4F0E $CD $5A $3B
    ret  nc                                       ;; 06:4F11 $D0

    jp   PushLinkOutOfEntity_06.forcePush         ;; 06:4F12 $C3 $1F $64

RaisableBlockShiftedDownEntityHandler::
    ldh  a, [hActiveEntityState]                  ;; 06:4F15 $F0 $F0
    and  a                                        ;; 06:4F17 $A7
    jp   nz, RaisableBlockShiftedRightEntityHandler.update ; 06:4F18 $C2 $B7 $4E

    ; Init
    ; (hActiveEntityState == 0)

    ; wEntitiesPosYTable += 8
    ld   hl, wEntitiesPosYTable                   ;; 06:4F1B $21 $10 $C2
    add  hl, bc                                   ;; 06:4F1E $09
    ld   a, [hl]                                  ;; 06:4F1F $7E
    add  $08                                      ;; 06:4F20 $C6 $08
    ld   [hl], a                                  ;; 06:4F22 $77
    ; wEntitiesPosZTable += 10
    ld   hl, wEntitiesPosZTable                   ;; 06:4F23 $21 $10 $C3
    add  hl, bc                                   ;; 06:4F26 $09
    ld   [hl], $10                                ;; 06:4F27 $36 $10
    jp   IncrementEntityState                     ;; 06:4F29 $C3 $12 $3B
