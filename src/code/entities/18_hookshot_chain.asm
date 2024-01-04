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
    call ResetSpinAttack                          ; $7BFA: $CD $AF $0C
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $7BFD: $EA $3E $C1
    ldh  a, [hLinkDirection]                      ; $7C00: $F0 $9E
    ld   e, a                                     ; $7C02: $5F
    ld   d, $00                                   ; $7C03: $16 $00
    ld   hl, LinkDirectionToLinkAnimationState_3  ; $7C05: $21 $DF $7B
    add  hl, de                                   ; $7C08: $19
    ld   a, [hl]                                  ; $7C09: $7E
    ldh  [hLinkAnimationState], a                 ; $7C0A: $E0 $9D
    call func_018_7CC8                            ; $7C0C: $CD $C8 $7C
    call ReturnIfNonInteractive_18                ; $7C0F: $CD $E8 $7D
    ldh  a, [hFrameCounter]                       ; $7C12: $F0 $E7
    and  $03                                      ; $7C14: $E6 $03
    jr   nz, .jr_7C1C                             ; $7C16: $20 $04

    ld   a, NOISE_SFX_HOOKSHOT                    ; $7C18: $3E $0B
    ldh  [hNoiseSfx], a                           ; $7C1A: $E0 $F4

.jr_7C1C
    ldh  a, [hActiveEntityState]                  ; $7C1C: $F0 $F0
    and  a                                        ; $7C1E: $A7
    jr   z, jr_018_7C39                           ; $7C1F: $28 $18

IF __PATCH_0__
    ld   hl, wEntitiesPosXTable
    add  hl, bc
    ldh  a, [hLinkPositionX]
    cp   [hl]
    jr   nz, .jr_7C21

    ld   hl, wEntitiesPosYTable
    add  hl, bc
    ldh  a, [hLinkPositionY]
    cp   [hl]
    jr   z, jr_018_7C39
ENDC

.jr_7C21
    ld   a, $30                                   ; $7C21: $3E $30
    call GetVectorTowardsLink_trampoline          ; $7C23: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $7C26: $F0 $D7
    cpl                                           ; $7C28: $2F
    inc  a                                        ; $7C29: $3C
    ldh  [hLinkVelocityY], a                      ; $7C2A: $E0 $9B
    ldh  a, [hMultiPurpose1]                      ; $7C2C: $F0 $D8
    cpl                                           ; $7C2E: $2F
    inc  a                                        ; $7C2F: $3C
    ldh  [hLinkVelocityX], a                      ; $7C30: $E0 $9A
    push bc                                       ; $7C32: $C5
    call UpdateFinalLinkPosition                  ; $7C33: $CD $A8 $21
    pop  bc                                       ; $7C36: $C1
    jr   jr_018_7C46                              ; $7C37: $18 $0D

jr_018_7C39:
    call UpdateEntityPosWithVelocity_18           ; $7C39: $CD $5F $7E
    call GetEntityTransitionCountdown             ; $7C3C: $CD $05 $0C
    jr   nz, jr_018_7C54                          ; $7C3F: $20 $13

    ld   a, $30                                   ; $7C41: $3E $30
    call ApplyVectorTowardsLink_trampoline        ; $7C43: $CD $AA $3B

jr_018_7C46:
    call CheckLinkCollisionWithEnemy_trampoline   ; $7C46: $CD $5A $3B
    jr   nc, ret_018_7CAE                         ; $7C49: $30 $63

    xor  a                                        ; $7C4B: $AF
    ld   [wC1C6], a                               ; $7C4C: $EA $C6 $C1
    call ClearEntityStatusBank18                  ; $7C4F: $CD $08 $7F
    jr   ret_018_7CAE                             ; $7C52: $18 $5A

jr_018_7C54:
    ld   a, $06                                   ; $7C54: $3E $06
    ld   [wC19E], a                               ; $7C56: $EA $9E $C1
    call label_3B7B                               ; $7C59: $CD $7B $3B
    ld   hl, wEntitiesCollisionsTable             ; $7C5C: $21 $A0 $C2
    add  hl, bc                                   ; $7C5F: $09
    ld   a, [hl]                                  ; $7C60: $7E
    and  a                                        ; $7C61: $A7
    jr   nz, jr_018_7CAF                          ; $7C62: $20 $4B

    call DefaultEntityPhysics_trampoline          ; $7C64: $CD $23 $3B
    ld   a, [wIsIndoor]                           ; $7C67: $FA $A5 $DB
    and  a                                        ; $7C6A: $A7
    jr   z, ret_018_7CAE                          ; $7C6B: $28 $41

    call func_018_6493                            ; $7C6D: $CD $93 $64
    ld   hl, wEntitiesVelocityYTable              ; $7C70: $21 $50 $C2
    add  hl, bc                                   ; $7C73: $09
    ld   a, [hl]                                  ; $7C74: $7E
    and  a                                        ; $7C75: $A7
    jr   z, ret_018_7CAE                          ; $7C76: $28 $36

    ld   e, $9E                                   ; $7C78: $1E $9E
    bit  7, a                                     ; $7C7A: $CB $7F
    jr   nz, .jr_7C80                             ; $7C7C: $20 $02

    ld   e, $9F                                   ; $7C7E: $1E $9F

.jr_7C80
    ldh  a, [hObjectUnderEntity]                  ; $7C80: $F0 $AF
    cp   e                                        ; $7C82: $BB
    jr   nz, ret_018_7CAE                         ; $7C83: $20 $29

    ld   a, ENTITY_HOOKSHOT_BRIDGE                ; $7C85: $3E $68
    call SpawnNewEntity_trampoline                ; $7C87: $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ; $7C8A: $21 $00 $C2
    add  hl, de                                   ; $7C8D: $19
    ldh  a, [hIntersectedObjectLeft]              ; $7C8E: $F0 $CE
    add  $08                                      ; $7C90: $C6 $08
    ld   [hl], a                                  ; $7C92: $77
    ld   hl, wEntitiesPosYTable                   ; $7C93: $21 $10 $C2
    add  hl, de                                   ; $7C96: $19
    ldh  a, [hIntersectedObjectTop]               ; $7C97: $F0 $CD
    add  $10                                      ; $7C99: $C6 $10
    ld   [hl], a                                  ; $7C9B: $77
    ldh  a, [hObjectUnderEntity]                  ; $7C9C: $F0 $AF
    cp   $9E                                      ; $7C9E: $FE $9E
    ld   a, $00                                   ; $7CA0: $3E $00
    jr   z, .jr_7CA5                              ; $7CA2: $28 $01

    inc  a                                        ; $7CA4: $3C

.jr_7CA5
    ld   hl, wEntitiesDirectionTable              ; $7CA5: $21 $80 $C3
    add  hl, de                                   ; $7CA8: $19
    ld   [hl], a                                  ; $7CA9: $77
    call GetEntityTransitionCountdown             ; $7CAA: $CD $05 $0C
    ld   [hl], b                                  ; $7CAD: $70

ret_018_7CAE:
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

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HookshotChainSpriteVariants::
.variant0
    db $36, OAM_GBC_PAL_0 | OAMF_PAL0
    db $36, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

func_018_7CC8::
    ld   de, HookshotChainSpriteVariants          ; $7CC8: $11 $C4 $7C
    call RenderActiveEntitySpritesPair            ; $7CCB: $CD $C0 $3B
    ldh  a, [hActiveEntityPosX]                   ; $7CCE: $F0 $EE
    ld   hl, hLinkPositionX                       ; $7CD0: $21 $98 $FF
    sub  [hl]                                     ; $7CD3: $96
    sra  a                                        ; $7CD4: $CB $2F
    sra  a                                        ; $7CD6: $CB $2F
    ldh  [hMultiPurpose0], a                      ; $7CD8: $E0 $D7
    ldh  [hMultiPurpose2], a                      ; $7CDA: $E0 $D9
    ldh  a, [hActiveEntityPosY]                   ; $7CDC: $F0 $EF
    ld   hl, hLinkPositionY                       ; $7CDE: $21 $99 $FF
    sub  [hl]                                     ; $7CE1: $96
    sra  a                                        ; $7CE2: $CB $2F
    sra  a                                        ; $7CE4: $CB $2F
    ldh  [hMultiPurpose1], a                      ; $7CE6: $E0 $D8
    ldh  [hMultiPurpose3], a                      ; $7CE8: $E0 $DA
    ld   a, [wOAMNextAvailableSlot]               ; $7CEA: $FA $C0 $C3
    ld   e, a                                     ; $7CED: $5F
    ld   d, $00                                   ; $7CEE: $16 $00
    ld   hl, wDynamicOAMBuffer                    ; $7CF0: $21 $30 $C0
    add  hl, de                                   ; $7CF3: $19
    ld   e, l                                     ; $7CF4: $5D
    ld   d, h                                     ; $7CF5: $54
    ld   a, $03                                   ; $7CF6: $3E $03

jr_018_7CF8:
    ldh  [hMultiPurpose4], a                      ; $7CF8: $E0 $DB
    ld   hl, hFrameCounter                        ; $7CFA: $21 $E7 $FF
    xor  [hl]                                     ; $7CFD: $AE
    and  $01                                      ; $7CFE: $E6 $01
    jr   nz, .jr_7D09                             ; $7D00: $20 $07

    ldh  a, [hLinkPositionY]                      ; $7D02: $F0 $99
    ld   hl, hMultiPurpose1                       ; $7D04: $21 $D8 $FF
    add  [hl]                                     ; $7D07: $86
    ld   [de], a                                  ; $7D08: $12

.jr_7D09
    inc  de                                       ; $7D09: $13
    ldh  a, [hLinkPositionX]                      ; $7D0A: $F0 $98
    ld   hl, hMultiPurpose0                       ; $7D0C: $21 $D7 $FF
    add  [hl]                                     ; $7D0F: $86
    add  $04                                      ; $7D10: $C6 $04
    ld   [de], a                                  ; $7D12: $12
    inc  de                                       ; $7D13: $13
    ld   a, $24                                   ; $7D14: $3E $24
    ld   [de], a                                  ; $7D16: $12
    inc  de                                       ; $7D17: $13
    ld   a, $00                                   ; $7D18: $3E $00
    ld   [de], a                                  ; $7D1A: $12
    inc  de                                       ; $7D1B: $13
    ldh  a, [hMultiPurpose0]                      ; $7D1C: $F0 $D7
    ld   hl, hMultiPurpose2                       ; $7D1E: $21 $D9 $FF
    add  [hl]                                     ; $7D21: $86
    ldh  [hMultiPurpose0], a                      ; $7D22: $E0 $D7
    ldh  a, [hMultiPurpose1]                      ; $7D24: $F0 $D8
    ld   hl, hMultiPurpose3                       ; $7D26: $21 $DA $FF
    add  [hl]                                     ; $7D29: $86
    ldh  [hMultiPurpose1], a                      ; $7D2A: $E0 $D8
    ldh  a, [hMultiPurpose4]                      ; $7D2C: $F0 $DB
    dec  a                                        ; $7D2E: $3D
    jr   nz, jr_018_7CF8                          ; $7D2F: $20 $C7

    ld   a, $03                                   ; $7D31: $3E $03
    jp   func_015_7964_trampoline                 ; $7D33: $C3 $A0 $3D
