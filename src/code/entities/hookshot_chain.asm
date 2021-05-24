LinkDirectionToLinkAnimationState_3::
.right: db  LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_RIGHT
.left: db  LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_LEFT
.up:   db  LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_UP
.down:   db  LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_DOWN

HookshotChainEntityHandler::
    ld   a, [wLinkPlayingOcarinaCountdown]        ; $7BE3
    and  a                                        ; $7BE6: $A7
    jp   nz, ClearEntityStatusBank18              ; $7BE7: $C2 $08 $7F

    ld   a, $02                                   ; $7BEA: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $7BEC: $E0 $A1
    ld   [wC1A4], a                               ; $7BEE: $EA $A4 $C1
    ld   [wC1C6], a                               ; $7BF1: $EA $C6 $C1
    ld   a, c                                     ; $7BF4: $79
    inc  a                                        ; $7BF5: $3C
    ld   [wC1A6], a                               ; $7BF6: $EA $A6 $C1
    xor  a                                        ; $7BF9: $AF
    call ResetSpinAttack                                ; $7BFA: $CD $AF $0C
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $7BFD: $EA $3E $C1
    ldh  a, [hLinkDirection]                      ; $7C00: $F0 $9E
    ld   e, a                                     ; $7C02: $5F
    ld   d, $00                                   ; $7C03: $16 $00
    ld   hl, LinkDirectionToLinkAnimationState_3  ; $7C05: $21 $DF $7B
    add  hl, de                                   ; $7C08: $19
    ld   a, [hl]                                  ; $7C09: $7E
    ldh  [hLinkAnimationState], a                 ; $7C0A: $E0 $9D
    call func_018_7CC8                            ; $7C0C: $CD $C8 $7C
    call func_018_7DE8                            ; $7C0F: $CD $E8 $7D
    ldh  a, [hFrameCounter]                       ; $7C12: $F0 $E7
    and  $03                                      ; $7C14: $E6 $03
    jr   nz, jr_018_7C1C                          ; $7C16: $20 $04

    ld   a, $0B                                   ; $7C18: $3E $0B
    ldh  [hNoiseSfx], a                           ; $7C1A: $E0 $F4

jr_018_7C1C:
    ldh  a, [hActiveEntityState]                  ; $7C1C: $F0 $F0
    and  a                                        ; $7C1E: $A7
    jr   z, jr_018_7C39                           ; $7C1F: $28 $18

IF __PATCH_0__
    ld   hl, wEntitiesPosXTable
    add  hl, bc
    ldh  a, [hLinkPositionX]
    cp   [hl]
    jr   nz, jr_018_7C21

    ld   hl, wEntitiesPosYTable
    add  hl, bc
    ldh  a, [hLinkPositionY]
    cp   [hl]
    jr   z, jr_018_7C39
ENDC

jr_018_7C21:
    ld   a, $30                                   ; $7C21: $3E $30
    call GetVectorTowardsLink_trampoline          ; $7C23: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $7C26: $F0 $D7
    cpl                                           ; $7C28: $2F
    inc  a                                        ; $7C29: $3C
    ldh  [hLinkSpeedY], a                         ; $7C2A: $E0 $9B
    ldh  a, [hMultiPurpose1]                      ; $7C2C: $F0 $D8
    cpl                                           ; $7C2E: $2F
    inc  a                                        ; $7C2F: $3C
    ldh  [hLinkSpeedX], a                         ; $7C30: $E0 $9A
    push bc                                       ; $7C32: $C5
    call UpdateFinalLinkPosition                  ; $7C33: $CD $A8 $21
    pop  bc                                       ; $7C36: $C1
    jr   jr_018_7C46                              ; $7C37: $18 $0D

jr_018_7C39:
    call UpdateEntityPosWithSpeed_18              ; $7C39: $CD $5F $7E
    call GetEntityTransitionCountdown             ; $7C3C: $CD $05 $0C
    jr   nz, jr_018_7C54                          ; $7C3F: $20 $13

    ld   a, $30                                   ; $7C41: $3E $30
    call ApplyVectorTowardsLink_trampoline        ; $7C43: $CD $AA $3B

jr_018_7C46:
    call CheckLinkCollisionWithEnemy_trampoline   ; $7C46: $CD $5A $3B
    jr   nc, jr_018_7CAE                          ; $7C49: $30 $63

    xor  a                                        ; $7C4B: $AF
    ld   [wC1C6], a                               ; $7C4C: $EA $C6 $C1
    call ClearEntityStatusBank18                  ; $7C4F: $CD $08 $7F
    jr   jr_018_7CAE                              ; $7C52: $18 $5A

jr_018_7C54:
    ld   a, $06                                   ; $7C54: $3E $06
    ld   [wC19E], a                               ; $7C56: $EA $9E $C1
    call label_3B7B                               ; $7C59: $CD $7B $3B
    ld   hl, wEntitiesCollisionsTable             ; $7C5C: $21 $A0 $C2
    add  hl, bc                                   ; $7C5F: $09
    ld   a, [hl]                                  ; $7C60: $7E
    and  a                                        ; $7C61: $A7
    jr   nz, jr_018_7CAF                          ; $7C62: $20 $4B

    call label_3B23                               ; $7C64: $CD $23 $3B
    ld   a, [wIsIndoor]                           ; $7C67: $FA $A5 $DB
    and  a                                        ; $7C6A: $A7
    jr   z, jr_018_7CAE                           ; $7C6B: $28 $41

    call func_018_6493                            ; $7C6D: $CD $93 $64
    ld   hl, wEntitiesSpeedYTable                       ; $7C70: $21 $50 $C2
    add  hl, bc                                   ; $7C73: $09
    ld   a, [hl]                                  ; $7C74: $7E
    and  a                                        ; $7C75: $A7
    jr   z, jr_018_7CAE                           ; $7C76: $28 $36

    ld   e, $9E                                   ; $7C78: $1E $9E
    bit  7, a                                     ; $7C7A: $CB $7F
    jr   nz, jr_018_7C80                          ; $7C7C: $20 $02

    ld   e, $9F                                   ; $7C7E: $1E $9F

jr_018_7C80:
    ldh  a, [hObjectUnderEntity]                  ; $7C80: $F0 $AF
    cp   e                                        ; $7C82: $BB
    jr   nz, jr_018_7CAE                          ; $7C83: $20 $29

    ld   a, ENTITY_68                             ; $7C85: $3E $68
    call SpawnNewEntity_trampoline                ; $7C87: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                         ; $7C8A: $21 $00 $C2
    add  hl, de                                   ; $7C8D: $19
    ldh  a, [hSwordIntersectedAreaX]              ; $7C8E: $F0 $CE
    add  $08                                      ; $7C90: $C6 $08
    ld   [hl], a                                  ; $7C92: $77
    ld   hl, wEntitiesPosYTable                         ; $7C93: $21 $10 $C2
    add  hl, de                                   ; $7C96: $19
    ldh  a, [hSwordIntersectedAreaY]              ; $7C97: $F0 $CD
    add  $10                                      ; $7C99: $C6 $10
    ld   [hl], a                                  ; $7C9B: $77
    ldh  a, [hObjectUnderEntity]                  ; $7C9C: $F0 $AF
    cp   $9E                                      ; $7C9E: $FE $9E
    ld   a, $00                                   ; $7CA0: $3E $00
    jr   z, jr_018_7CA5                           ; $7CA2: $28 $01

    inc  a                                        ; $7CA4: $3C

jr_018_7CA5:
    ld   hl, wEntitiesDirectionTable              ; $7CA5: $21 $80 $C3
    add  hl, de                                   ; $7CA8: $19
    ld   [hl], a                                  ; $7CA9: $77
    call GetEntityTransitionCountdown             ; $7CAA: $CD $05 $0C
    ld   [hl], b                                  ; $7CAD: $70

jr_018_7CAE:
    ret                                           ; $7CAE: $C9

jr_018_7CAF:
    call GetEntityTransitionCountdown             ; $7CAF: $CD $05 $0C
    ld   [hl], b                                  ; $7CB2: $70
    ld   a, JINGLE_SWORD_POKING                   ; $7CB3: $3E $07
    ldh  [hJingle], a                             ; $7CB5: $E0 $F2
    ldh  a, [hActiveEntityPosX]                   ; $7CB7: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $7CB9: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $7CBB: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $7CBD: $E0 $D8
    ld   a, TRANSCIENT_VFX_SWORD_POKE             ; $7CBF: $3E $05
    jp   AddTranscientVfx                         ; $7CC1: $C3 $C7 $0C
