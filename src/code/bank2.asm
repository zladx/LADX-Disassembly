; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

include "code/audio/select_music_track.asm"

SpawnChestWithItem::
    push bc                                       ;; 02:41D0 $C5

    ld   a, ENTITY_CHEST_WITH_ITEM                ;; 02:41D1 $3E $07
    call SpawnNewEntity_trampoline                ;; 02:41D3 $CD $86 $3B
    jr   c, .return                               ;; 02:41D6 $38 $22

    ld   hl, wEntitiesStatusTable                 ;; 02:41D8 $21 $80 $C2
    add  hl, de                                   ;; 02:41DB $19
    dec  [hl]                                     ;; 02:41DC $35
    ldh  a, [hIntersectedObjectLeft]              ;; 02:41DD $F0 $CE
    and  $F0                                      ;; 02:41DF $E6 $F0
    add  $08                                      ;; 02:41E1 $C6 $08
    ld   hl, wEntitiesPosXTable                   ;; 02:41E3 $21 $00 $C2
    add  hl, de                                   ;; 02:41E6 $19
    ld   [hl], a                                  ;; 02:41E7 $77
    ldh  a, [hIntersectedObjectTop]               ;; 02:41E8 $F0 $CD
    and  $F0                                      ;; 02:41EA $E6 $F0
    add  $10                                      ;; 02:41EC $C6 $10
    ld   hl, wEntitiesPosYTable                   ;; 02:41EE $21 $10 $C2
    add  hl, de                                   ;; 02:41F1 $19
    ld   [hl], a                                  ;; 02:41F2 $77
    ld   hl, wEntitiesSpriteVariantTable          ;; 02:41F3 $21 $B0 $C3
    add  hl, de                                   ;; 02:41F6 $19
    ldh  a, [hMultiPurpose8]                      ;; 02:41F7 $F0 $DF
    ld   [hl], a                                  ;; 02:41F9 $77

.return
    pop  bc                                       ;; 02:41FA $C1
    ret                                           ;; 02:41FB $C9

UseOcarina::
    ld   hl, wIsLinkInTheAir                      ;; 02:41FC $21 $46 $C1
    ld   a, [wLinkPlayingOcarinaCountdown]        ;; 02:41FF $FA $66 $C1
    or   [hl]                                     ;; 02:4202 $B6
    ld   hl, wC1A4                                ;; 02:4203 $21 $A4 $C1
    or   [hl]                                     ;; 02:4206 $B6
    ret  nz                                       ;; 02:4207 $C0

    ld   [wC5A4], a                               ;; 02:4208 $EA $A4 $C5
    ld   [wC5A5], a                               ;; 02:420B $EA $A5 $C5
    call CopyLinkFinalPositionToPosition          ;; 02:420E $CD $BE $0C
    ld   a, [wOcarinaSongFlags]                   ; Do we have any songs available?
    and  $07                                      ;
    jr   z, jr_002_4241                           ; If no, play the tone-deaf notes

    ld   a, [wSelectedSongIndex]                  ;; 02:4218 $FA $4A $DB
    cp   $01                                      ;; 02:421B $FE $01
    jr   z, .jr_422D                              ;; 02:421D $28 $0E

    cp   $02                                      ;; 02:421F $FE $02
    jr   z, jr_002_4237                           ;; 02:4221 $28 $14

    ld   a, $DC                                   ;; 02:4223 $3E $DC
    ld   [wLinkPlayingOcarinaCountdown], a        ;; 02:4225 $EA $66 $C1
    ld   a, WAVE_SFX_OCARINA_BALLAD               ;; 02:4228 $3E $09
    ldh  [hWaveSfx], a                            ;; 02:422A $E0 $F3
    ret                                           ;; 02:422C $C9

.jr_422D
    ld   a, $D0                                   ;; 02:422D $3E $D0
    ld   [wLinkPlayingOcarinaCountdown], a        ;; 02:422F $EA $66 $C1
    ld   a, WAVE_SFX_OCARINA_MAMBO                ;; 02:4232 $3E $0B
    ldh  [hWaveSfx], a                            ;; 02:4234 $E0 $F3
    ret                                           ;; 02:4236 $C9

jr_002_4237:
    ld   a, $BB                                   ;; 02:4237 $3E $BB
    ld   [wLinkPlayingOcarinaCountdown], a        ;; 02:4239 $EA $66 $C1
    ld   a, WAVE_SFX_OCARINA_FROG                 ;; 02:423C $3E $0A
    ldh  [hWaveSfx], a                            ;; 02:423E $E0 $F3
    ret                                           ;; 02:4240 $C9

jr_002_4241:
    ld   a, $D0                                   ;; 02:4241 $3E $D0
    ld   [wLinkPlayingOcarinaCountdown], a        ;; 02:4243 $EA $66 $C1
    ld   a, WAVE_SFX_OCARINA_NOSONG               ;; 02:4246 $3E $15
    ldh  [hWaveSfx], a                            ;; 02:4248 $E0 $F3
    ret                                           ;; 02:424A $C9

    ret                                           ;; 02:424B $C9

HookshotChainSpeedX::
.right: db   HOOKSHOT_CHAIN_SPEED
.left:  db  -HOOKSHOT_CHAIN_SPEED
.up:    db  0
.down:  db  0

HookshotChainSpeedY::
.right: db  0
.left:  db  0
.up:    db  -HOOKSHOT_CHAIN_SPEED
.down:  db   HOOKSHOT_CHAIN_SPEED

FireHookshot::
IF __PATCH_0__
    ld   a, [wIsLinkPushing]
    and  a
    ret  nz
ENDC

    ld   a, [wIsLinkInTheAir]                     ;; 02:4254 $FA $46 $C1
    and  a                                        ;; 02:4257 $A7
IF __OPTIMIZATIONS_1__
    ret  nz
ELSE
    jr   nz, .return                              ;; 02:4258 $20 $2C
ENDC

    ld   a, ENTITY_HOOKSHOT_CHAIN                 ;; 02:425A $3E $03
    call SpawnPlayerProjectile                    ;; 02:425C $CD $2F $14
IF __OPTIMIZATIONS_1__
    ret  c
ELSE
    jr   c, .return                               ;; 02:425F $38 $25
ENDC

    ld   hl, wEntitiesTransitionCountdownTable    ;; 02:4261 $21 $E0 $C2
    add  hl, de                                   ;; 02:4264 $19
    ld   [hl], $2A                                ;; 02:4265 $36 $2A
    ld   hl, wEntitiesSpriteVariantTable          ;; 02:4267 $21 $B0 $C3
    add  hl, de                                   ;; 02:426A $19
    xor  a                                        ;; 02:426B $AF
    ld   [hl], a                                  ;; 02:426C $77

    ldh  a, [hLinkDirection]                      ;; 02:426D $F0 $9E
    ld   c, a                                     ;; 02:426F $4F
    ld   b, $00                                   ;; 02:4270 $06 $00

    ld   hl, HookshotChainSpeedX                  ;; 02:4272 $21 $4C $42
    add  hl, bc                                   ;; 02:4275 $09
    ld   a, [hl]                                  ;; 02:4276 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 02:4277 $21 $40 $C2
    add  hl, de                                   ;; 02:427A $19
    ld   [hl], a                                  ;; 02:427B $77

    ld   hl, HookshotChainSpeedY                  ;; 02:427C $21 $50 $42
    add  hl, bc                                   ;; 02:427F $09
    ld   a, [hl]                                  ;; 02:4280 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 02:4281 $21 $50 $C2
    add  hl, de                                   ;; 02:4284 $19
    ld   [hl], a                                  ;; 02:4285 $77

IF __PATCH_0__
    ld   a, [wLinkMotionState]
    ld   [wD463], a
ENDC

.return
    ret                                           ;; 02:4286 $C9

; Main handler for LINK_MOTION_DEFAULT.
;
; Applies physics, motion, animations and all
LinkMotionDefault::
    ; Decrement wIsShootingArrow if not already zero
    ld   a, [wIsShootingArrow]                    ;; 02:4287 $FA $4C $C1
    and  a                                        ;; 02:428A $A7
    jr   z, .decrementShootingArrowEnd            ;; 02:428B $28 $04
    dec  a                                        ;; 02:428D $3D
    ld   [wIsShootingArrow], a                    ;; 02:428E $EA $4C $C1
.decrementShootingArrowEnd

    ; Decrement wC1C4 if not already zero
    ld   a, [wC1C4]                               ;; 02:4291 $FA $C4 $C1
    and  a                                        ;; 02:4294 $A7
    jr   z, .decrementC1C4End                     ;; 02:4295 $28 $04
    dec  a                                        ;; 02:4297 $3D
    ld   [wC1C4], a                               ;; 02:4298 $EA $C4 $C1
.decrementC1C4End

    ; Decrement wBombArrowCooldown if not already zero
    ld   a, [wBombArrowCooldown]                  ;; 02:429B $FA $C0 $C1
    and  a                                        ;; 02:429E $A7
    jr   z, .bombArrowCooldownDecrementEnd        ;; 02:429F $28 $04
    dec  a                                        ;; 02:42A1 $3D
    ld   [wBombArrowCooldown], a                  ;; 02:42A2 $EA $C0 $C1
.bombArrowCooldownDecrementEnd

    call func_002_436C                            ;; 02:42A5 $CD $6C $43

    ; Decrement wC16E if not already zero
    ld   a, [wC16E]                               ;; 02:42A8 $FA $6E $C1
    and  a                                        ;; 02:42AB $A7
    jr   z, .wC16EEnd                             ;; 02:42AC $28 $04
    dec  a                                        ;; 02:42AE $3D
    ld   [wC16E], a                               ;; 02:42AF $EA $6E $C1
.wC16EEnd

    ldh  a, [hLinkInteractiveMotionBlocked]       ;; 02:42B2 $F0 $A1
    cp   $02                                      ;; 02:42B4 $FE $02
    jr   nz, .interactiveMotionBlockedEnd         ;; 02:42B6 $20 $0F

    xor  a                                        ;; 02:42B8 $AF
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 02:42B9 $E0 $A1
    ldh  [hLinkSpeedX], a                         ;; 02:42BB $E0 $9A
    ldh  [hLinkSpeedY], a                         ;; 02:42BD $E0 $9B
    ldh  [hLinkVelocityZ], a                      ;; 02:42BF $E0 $A3
    call LinkPlayingOcarinaHandler                ;; 02:42C1 $CD $16 $4A
    jp   func_002_753A                            ;; 02:42C4 $C3 $3A $75
.interactiveMotionBlockedEnd

    call UpdateLinkWalkingAnimation               ;; 02:42C7 $CD $50 $1A

    xor  a                                        ;; 02:42CA $AF
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 02:42CB $E0 $A1

    call label_1F69_trampoline                    ;; 02:42CD $CD $61 $1F
    call CheckItemsToUse                          ;; 02:42D0 $CD $77 $11
    call ApplyLinkGroundMotion                    ;; 02:42D3 $CD $ED $44
    call func_002_434A                            ;; 02:42D6 $CD $4A $43
    call UpdateLinkAnimation                      ;; 02:42D9 $CD $8C $47
    call func_002_4B49                            ;; 02:42DC $CD $49 $4B
    call ApplyLinkMotionState                     ;; 02:42DF $CD $94 $17
    call func_002_4338                            ;; 02:42E2 $CD $38 $43
    call LinkPlayingOcarinaHandler                ;; 02:42E5 $CD $16 $4A

    ld   a, [wRoomTransitionState]                ;; 02:42E8 $FA $24 $C1
    and  a                                        ;; 02:42EB $A7
    jr   nz, .return                              ;; 02:42EC $20 $27

    ld   a, [wSwordAnimationState]                ;; 02:42EE $FA $37 $C1
    ld   [wC16A], a                               ;; 02:42F1 $EA $6A $C1
    cp   SWORD_ANIMATION_STATE_HOLDING            ;; 02:42F4 $FE $05
    jr   nz, .lowerSword                          ;; 02:42F6 $20 $1E

    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:42F8 $FA $4A $C1
    and  a                                        ;; 02:42FB $A7
    jr   nz, .resetSwordCharge                    ;; 02:42FC $20 $35

    ; sword animation state = SWORD_ANIMATION_STATE_NONE
    xor  a                                        ;; 02:42FE $AF
    ld   [wSwordAnimationState], a                ;; 02:42FF $EA $37 $C1
    ld   a, [wSwordCharge]                        ;; 02:4302 $FA $22 $C1
    cp   MAX_SWORD_CHARGE                         ;; 02:4305 $FE $28
    jr   z, .return                               ;; 02:4307 $28 $0C
    ; increment sword charge
    inc  a                                        ;; 02:4309 $3C
    ld   [wSwordCharge], a                        ;; 02:430A $EA $22 $C1
    ; if not fully loaded return
    cp   MAX_SWORD_CHARGE                         ;; 02:430D $FE $28
    jr   nz, .return                              ;; 02:430F $20 $04
    ; play fully charged jingle
    ld   a, JINGLE_CHARGING_SWORD                 ;; 02:4311 $3E $04
    ldh  [hJingle], a                             ;; 02:4313 $E0 $F2

.return
    ret                                           ;; 02:4315 $C9

.lowerSword
    ; If approaching an NPC, lower sword
    ld   a, [wItemUsageContext]                   ;; 02:4316 $FA $AD $C1
    cp   ITEM_USAGE_NEAR_NPC                      ;; 02:4319 $FE $01
    jr   z, .resetSwordCharge                     ;; 02:431B $28 $16
    ; if sword not fully charged reset it
    ld   a, [wSwordCharge]                        ;; 02:431D $FA $22 $C1
    cp   MAX_SWORD_CHARGE                         ;; 02:4320 $FE $28
    jr   nz, .resetSwordCharge                    ;; 02:4322 $20 $0F
    ; TODO: comment
    ld   a, [wC16E]                               ;; 02:4324 $FA $6E $C1
    and  a                                        ;; 02:4327 $A7
    jr   nz, .return2                             ;; 02:4328 $20 $0D
    ; load wIsUsingSpinAttack with max value to track spin progress
    ld   a, USING_SPIN_ATTACK_MAX                 ;; 02:432A $3E $20
    ld   [wIsUsingSpinAttack], a                  ;; 02:432C $EA $21 $C1
    ; play spin attack sound
    ld   a, NOISE_SFX_SPIN_ATTACK                 ;; 02:432F $3E $03
    ldh  [hNoiseSfx], a                           ;; 02:4331 $E0 $F4

.resetSwordCharge
    ; set sword charge back to 0
    xor  a                                        ;; 02:4333 $AF
    ld   [wSwordCharge], a                        ;; 02:4334 $EA $22 $C1

.return2
    ret                                           ;; 02:4337 $C9

func_002_4338::
    ld   a, [wIsCarryingLiftedObject]             ;; 02:4338 $FA $5C $C1
    cp   $02                                      ;; 02:433B $FE $02
    jr   c, .ret_4345                             ;; 02:433D $38 $06

    ldh  [hLinkAnimationState], a                 ;; 02:433F $E0 $9D
    ld   a, $01                                   ;; 02:4341 $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 02:4343 $E0 $A1

.ret_4345
    ret                                           ;; 02:4345 $C9

; conversion table from view direction to animation state
DirectionToLinkAnimationState::
.right: db  LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_RIGHT    ;; 02:4346 $11
.left:  db  LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_LEFT     ;; 02:4346 $10
.up:    db  LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_UP       ;; 02:4346 $0F
.down:  db  LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_DOWN     ;; 02:4346 $0E

func_002_434A::
    ld   a, [wLinkAttackStepAnimationCountdown]   ;; 02:434A $FA $9B $C1
    and  ATTACK_STEP_DURATION_MASK                ;; 02:434D $E6 $7F
    jr   z, .jr_4367                              ;; 02:434F $28 $16

    ld   a, [wLinkAttackStepAnimationCountdown]   ;; 02:4351 $FA $9B $C1
    dec  a                                        ;; 02:4354 $3D
    ld   [wLinkAttackStepAnimationCountdown], a   ;; 02:4355 $EA $9B $C1
    and  ATTACK_STEP_DURATION_MASK                ;; 02:4358 $E6 $7F

    ldh  a, [hLinkDirection]                      ;; 02:435A $F0 $9E
    ld   e, a                                     ;; 02:435C $5F
    ld   d, $00                                   ;; 02:435D $16 $00
    ld   hl, DirectionToLinkAnimationState        ;; 02:435F $21 $46 $43
    add  hl, de                                   ;; 02:4362 $19
    ld   a, [hl]                                  ;; 02:4363 $7E
    ldh  [hLinkAnimationState], a                 ;; 02:4364 $E0 $9D
    ret                                           ;; 02:4366 $C9

.jr_4367
    xor  a                                        ;; 02:4367 $AF
    ld   [wLinkAttackStepAnimationCountdown], a   ;; 02:4368 $EA $9B $C1
    ret                                           ;; 02:436B $C9

func_002_436C::
    ldh  a, [hIsSideScrolling]                    ;; 02:436C $F0 $F9
    and  a                                        ;; 02:436E $A7
    jr   z, jr_002_43BA                           ;; 02:436F $28 $49

    ld   a, [wFreeMovementMode]                   ;; 02:4371 $FA $7B $C1
    and  a                                        ;; 02:4374 $A7
    jr   nz, jr_002_43BA                          ;; 02:4375 $20 $43

    ; Side-scrolling code
    jp   jp_002_68B7                              ;; 02:4377 $C3 $B7 $68

; Only used in debug free movement mode?
;
; Inputs:
;   e : sequence count
MoveLinkToPressedButtonDirection::
    ; e = ([hPressedButtonsMask] & 0xF) | e
    ldh  a, [hPressedButtonsMask]                 ;; 02:437A $F0 $CB
    and  $0F                                      ;; 02:437C $E6 $0F
    or   e                                        ;; 02:437E $B3
    ld   e, a                                     ;; 02:437F $5F
    ; hLinkSpeedX = [HorizontalIncrementForLinkPosition + de]
    ld   hl, HorizontalIncrementForLinkPosition   ;; 02:4380 $21 $C5 $48
    add  hl, de                                   ;; 02:4383 $19
    ld   a, [hl]                                  ;; 02:4384 $7E
    ldh  [hLinkSpeedX], a                         ;; 02:4385 $E0 $9A
    ; hLinkSpeedY = [VerticalIncrementForLinkPosition + de]
    ld   hl, VerticalIncrementForLinkPosition     ;; 02:4387 $21 $E5 $48
    add  hl, de                                   ;; 02:438A $19
    ld   a, [hl]                                  ;; 02:438B $7E
    ldh  [hLinkSpeedY], a                         ;; 02:438C $E0 $9B
    ret                                           ;; 02:438E $C9

func_002_438F::
    ldh  a, [hPressedButtonsMask]                 ;; 02:438F $F0 $CB
    and  $0F                                      ;; 02:4391 $E6 $0F
    or   e                                        ;; 02:4393 $B3
    ld   e, a                                     ;; 02:4394 $5F
    ld   hl, HorizontalIncrementForLinkPosition   ;; 02:4395 $21 $C5 $48
    add  hl, de                                   ;; 02:4398 $19
    ld   a, [hl]                                  ;; 02:4399 $7E
    ld   hl, hLinkSpeedX                          ;; 02:439A $21 $9A $FF
    sub  [hl]                                     ;; 02:439D $96
    jr   z, .jr_43A7                              ;; 02:439E $28 $07

    inc  [hl]                                     ;; 02:43A0 $34
    bit  7, a                                     ;; 02:43A1 $CB $7F
    jr   z, .jr_43A7                              ;; 02:43A3 $28 $02

    dec  [hl]                                     ;; 02:43A5 $35
    dec  [hl]                                     ;; 02:43A6 $35

.jr_43A7
    ld   hl, VerticalIncrementForLinkPosition     ;; 02:43A7 $21 $E5 $48
    add  hl, de                                   ;; 02:43AA $19
    ld   a, [hl]                                  ;; 02:43AB $7E
    ld   hl, hLinkSpeedY                          ;; 02:43AC $21 $9B $FF
    sub  [hl]                                     ;; 02:43AF $96
    jr   z, .ret_43B9                             ;; 02:43B0 $28 $07

    inc  [hl]                                     ;; 02:43B2 $34
    bit  7, a                                     ;; 02:43B3 $CB $7F
    jr   z, .ret_43B9                             ;; 02:43B5 $28 $02

    dec  [hl]                                     ;; 02:43B7 $35
    dec  [hl]                                     ;; 02:43B8 $35

.ret_43B9
    ret                                           ;; 02:43B9 $C9

jr_002_43BA:
    ld   a, [wIndoorRoom]                         ;; 02:43BA $FA $AE $DB
    ld   [wD46B], a                               ;; 02:43BD $EA $6B $D4
    call func_002_44C2                            ;; 02:43C0 $CD $C2 $44
    ldh  a, [hLinkPositionZ]                      ;; 02:43C3 $F0 $A2
    and  a                                        ;; 02:43C5 $A7
    jr   nz, .jr_43CE                             ;; 02:43C6 $20 $06

    ldh  a, [hLinkInteractiveMotionBlocked]       ;; 02:43C8 $F0 $A1
    and  a                                        ;; 02:43CA $A7
    jp   nz, label_002_44B5                       ;; 02:43CB $C2 $B5 $44

.jr_43CE
    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:43CE $FA $4A $C1
    and  a                                        ;; 02:43D1 $A7
    jr   z, jr_002_4402                           ;; 02:43D2 $28 $2E

    ldh  a, [hJoypadState]                        ;; 02:43D4 $F0 $CC
    and  J_RIGHT | J_LEFT | J_UP | J_DOWN         ;; 02:43D6 $E6 $0F
    jr   z, .jr_43E6                              ;; 02:43D8 $28 $0C

    ld   e, a                                     ;; 02:43DA $5F
    ld   d, $00                                   ;; 02:43DB $16 $00
    ld   hl, JoypadToLinkDirection                ;; 02:43DD $21 $05 $49
    add  hl, de                                   ;; 02:43E0 $19
    ldh  a, [hLinkDirection]                      ;; 02:43E1 $F0 $9E
    cp   [hl]                                     ;; 02:43E3 $BE
    jr   nz, jr_002_43F4                          ;; 02:43E4 $20 $0E

.jr_43E6
    ld   a, [wConsecutiveStepsCount]              ;; 02:43E6 $FA $20 $C1
    add  $02                                      ;; 02:43E9 $C6 $02
    ld   [wConsecutiveStepsCount], a              ;; 02:43EB $EA $20 $C1
    call DisplayTransientVfxForLinkRunning        ;; 02:43EE $CD $56 $17
    jp   label_002_4464                           ;; 02:43F1 $C3 $64 $44

jr_002_43F4:
    ld   [wC199+1], a                             ;; 02:43F4 $EA $9A $C1
    ld   a, [wC199]                               ;; 02:43F7 $FA $99 $C1
    add  $0C                                      ;; 02:43FA $C6 $0C
    ld   [wC199], a                               ;; 02:43FC $EA $99 $C1
    call ResetSpinAttack                          ;; 02:43FF $CD $AF $0C

jr_002_4402:
    ld   a, [wIsLinkInTheAir]                     ;; 02:4402 $FA $46 $C1
    and  a                                        ;; 02:4405 $A7
IF __OPTIMIZATIONS_1__
    jr   nz, label_002_4464
ELSE
    jp   nz, label_002_4464                       ;; 02:4406 $C2 $64 $44
ENDC

    ld   e, $00                                   ;; 02:4409 $1E $00
    ld   d, $00                                   ;; 02:440B $16 $00
    ld   a, [wActivePowerUp]                      ;; 02:440D $FA $7C $D4
    cp   ACTIVE_POWER_UP_PIECE_OF_POWER           ;; 02:4410 $FE $01
    jr   nz, .jr_4416                             ;; 02:4412 $20 $02

    ld   e, $10                                   ;; 02:4414 $1E $10

.jr_4416
    ld   a, [wFreeMovementMode]                   ;; 02:4416 $FA $7B $C1
    and  a                                        ;; 02:4419 $A7
    jr   .jr_4427                                 ;; 02:441A $18 $0B

    ldh  a, [hMapId]                              ;; 02:441C $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 02:441E $FE $FF
    jr   nz, .jr_4427                             ;; 02:4420 $20 $05

    call func_002_438F                            ;; 02:4422 $CD $8F $43
    jr   jr_002_442A                              ;; 02:4425 $18 $03

.jr_4427
    call MoveLinkToPressedButtonDirection         ;; 02:4427 $CD $7A $43

jr_002_442A:
    ld   a, [wFreeMovementMode]                   ;; 02:442A $FA $7B $C1
    and  a                                        ;; 02:442D $A7
    jr   z, .jr_443A                              ;; 02:442E $28 $0A

    ld   hl, hLinkSpeedX                          ;; 02:4430 $21 $9A $FF
    sla  [hl]                                     ;; 02:4433 $CB $26
    ld   hl, hLinkSpeedY                          ;; 02:4435 $21 $9B $FF
    sla  [hl]                                     ;; 02:4438 $CB $26

.jr_443A
    ld   a, e                                     ;; 02:443A $7B
    and  $0F                                      ;; 02:443B $E6 $0F
    ld   e, a                                     ;; 02:443D $5F
    jr   z, jr_002_4459                           ;; 02:443E $28 $19

    ; Increment wConsecutiveStepsCount
    ld   hl, wConsecutiveStepsCount               ;; 02:4440 $21 $20 $C1
    inc  [hl]                                     ;; 02:4443 $34

    ld   hl, JoypadToLinkDirection                ;; 02:4444 $21 $05 $49
    add  hl, de                                   ;; 02:4447 $19
    ld   a, [hl]                                  ;; 02:4448 $7E
    cp   $0F                                      ;; 02:4449 $FE $0F
    jr   z, label_002_4464                        ;; 02:444B $28 $17

    ld   e, a                                     ;; 02:444D $5F
    ld   a, [wC16E]                               ;; 02:444E $FA $6E $C1
    and  a                                        ;; 02:4451 $A7
    ld   a, e                                     ;; 02:4452 $7B
    jr   nz, .jr_4457                             ;; 02:4453 $20 $02

    ldh  [hLinkDirection], a                      ;; 02:4455 $E0 $9E

.jr_4457
    jr   label_002_4464                           ;; 02:4457 $18 $0B

jr_002_4459:
    ld   a, [wPegasusBootsChargeMeter]            ;; 02:4459 $FA $4B $C1
    and  a                                        ;; 02:445C $A7
    jr   nz, label_002_4464                       ;; 02:445D $20 $05

    ; Reset wConsecutiveStepsCount to its default value
    ld   a, $07                                   ;; 02:445F $3E $07
    ld   [wConsecutiveStepsCount], a              ;; 02:4461 $EA $20 $C1

label_002_4464:
    ld   e, $03                                   ;; 02:4464 $1E $03
    ld   a, [wIsGelClingingToLink]                ;; 02:4466 $FA $17 $C1
    and  a                                        ;; 02:4469 $A7
    jr   nz, jr_002_44A2                          ;; 02:446A $20 $36

    ld   e, $01                                   ;; 02:446C $1E $01
    ld   a, [wIsCarryingLiftedObject]             ;; 02:446E $FA $5C $C1
    and  a                                        ;; 02:4471 $A7
    jr   z, .jr_4481                              ;; 02:4472 $28 $0D

    ld   a, [wLiftedEntityType]                   ;; 02:4474 $FA $A8 $C5
    cp   ENTITY_ROOSTER                           ;; 02:4477 $FE $D5
    jr   nz, .jr_4481                             ;; 02:4479 $20 $06

    ld   a, [wIsLinkInTheAir]                     ;; 02:447B $FA $46 $C1
    and  a                                        ;; 02:447E $A7
    jr   nz, jr_002_44A2                          ;; 02:447F $20 $21

.jr_4481
    ldh  a, [hLinkSlowWalkingSpeed]               ;; 02:4481 $F0 $B2
    and  a                                        ;; 02:4483 $A7
    jr   nz, jr_002_44A2                          ;; 02:4484 $20 $1C

    ld   hl, wLinkGroundStatus                    ;; 02:4486 $21 $1F $C1
    ld   a, [hl]                                  ;; 02:4489 $7E
    and  a                                        ;; 02:448A $A7
    jr   z, func_002_44AD                         ;; 02:448B $28 $20

    cp   $07                                      ;; 02:448D $FE $07
    jr   nz, jr_002_44A9                          ;; 02:448F $20 $18

    ld   a, [wFreeMovementMode]                   ;; 02:4491 $FA $7B $C1
    and  a                                        ;; 02:4494 $A7
    jr   nz, func_002_44AD                        ;; 02:4495 $20 $16

    ld   e, $01                                   ;; 02:4497 $1E $01
    ld   a, [wPitSlippingCounter]                 ;; 02:4499 $FA $BB $C1
    cp   PIT_MAX_SLIPPING                         ;; 02:449C $FE $18
    jr   c, jr_002_44A2                           ;; 02:449E $38 $02

    ld   e, $07                                   ;; 02:44A0 $1E $07

jr_002_44A2:
    ldh  a, [hFrameCounter]                       ;; 02:44A2 $F0 $E7
    and  e                                        ;; 02:44A4 $A3
    jr   nz, label_002_44B5                       ;; 02:44A5 $20 $0E

    jr   func_002_44AD                            ;; 02:44A7 $18 $04

jr_002_44A9:
    ldh  a, [hFrameCounter]                       ;; 02:44A9 $F0 $E7
    and  [hl]                                     ;; 02:44AB $A6
    ret  z                                        ;; 02:44AC $C8

func_002_44AD::
    ld   a, [wInventoryAppearing]                 ;; 02:44AD $FA $4F $C1
    and  a                                        ;; 02:44B0 $A7
    ret  nz                                       ;; 02:44B1 $C0

    call UpdateFinalLinkPosition                  ;; 02:44B2 $CD $A8 $21

label_002_44B5:
    ld   a, [wLinkGroundStatus]                   ;; 02:44B5 $FA $1F $C1
    ld   [wC130], a                               ;; 02:44B8 $EA $30 $C1
    xor  a                                        ;; 02:44BB $AF
    ld   [wLinkGroundStatus], a                   ;; 02:44BC $EA $1F $C1
    jp   CheckPositionForMapTransition            ;; 02:44BF $C3 $75 $6C

func_002_44C2::
    ld   a, [wIgnoreLinkCollisionsCountdown]      ;; 02:44C2 $FA $3E $C1
    and  a                                        ;; 02:44C5 $A7
    ret  z                                        ;; 02:44C6 $C8

    dec  a                                        ;; 02:44C7 $3D
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 02:44C8 $EA $3E $C1
    call UpdateFinalLinkPosition                  ;; 02:44CB $CD $A8 $21
    call CheckPositionForMapTransition            ;; 02:44CE $CD $75 $6C
    ld   a, [wCollisionType]                      ;; 02:44D1 $FA $33 $C1
    and  a                                        ;; 02:44D4 $A7
    jr   z, jr_002_44E3                           ;; 02:44D5 $28 $0C

    and  $03                                      ;; 02:44D7 $E6 $03
    jr   z, .jr_44E0                              ;; 02:44D9 $28 $05

    xor  a                                        ;; 02:44DB $AF
    ldh  [hLinkSpeedY], a                         ;; 02:44DC $E0 $9B
    jr   jr_002_44E3                              ;; 02:44DE $18 $03

.jr_44E0
    xor  a                                        ;; 02:44E0 $AF
    ldh  [hLinkSpeedX], a                         ;; 02:44E1 $E0 $9A

jr_002_44E3:
    pop  af                                       ;; 02:44E3 $F1
    jp   ApplyLinkMotionState                     ;; 02:44E4 $C3 $94 $17

Data_002_44E7::
    db   0, -16, 16, 0, -1, 1

; If on the ground, update Link speed from gravity and joypad input.
ApplyLinkGroundMotion::
    ld   a, [wIsLinkInTheAir]                     ;; 02:44ED $FA $46 $C1
    and  a                                        ;; 02:44F0 $A7
    jp   z, .return                               ;; 02:44F1 $CA $AC $45

    ldh  a, [hIsSideScrolling]                    ;; 02:44F4 $F0 $F9
    and  a                                        ;; 02:44F6 $A7
    jp   nz, .return                              ;; 02:44F7 $C2 $AC $45

.noChecks
    call func_21E1                                ;; 02:44FA $CD $E1 $21

    ; hLinkVelocityZ = hLinkVelocityZ - 2
    ldh  a, [hLinkVelocityZ]                      ;; 02:44FD $F0 $A3
    sub  $02                                      ;; 02:44FF $D6 $02
    ldh  [hLinkVelocityZ], a                      ;; 02:4501 $E0 $A3

    ld   a, -1                                    ;; 02:4503 $3E $FF
    ld   [wConsecutiveStepsCount], a              ;; 02:4505 $EA $20 $C1

    ld   a, [wC10A]                               ;; 02:4508 $FA $0A $C1
    ld   hl, wIsRunningWithPegasusBoots           ;; 02:450B $21 $4A $C1
    or   [hl]                                     ;; 02:450E $B6
    jr   nz, .joypadVerticalEnd                   ;; 02:450F $20 $52

    ld   a, [wD475]                               ;; 02:4511 $FA $75 $D4
    and  a                                        ;; 02:4514 $A7
    jr   nz, .jr_002_451E                         ;; 02:4515 $20 $07

    ld   a, [wItemUsageContext]                   ;; 02:4517 $FA $AD $C1
    cp   ITEM_USAGE_ON_RAFT                       ;; 02:451A $FE $80
    jr   nz, .jr_002_4523                         ;; 02:451C $20 $05

.jr_002_451E
    call ClearLinkPositionIncrement               ;; 02:451E $CD $8E $17
    jr   .joypadVerticalEnd                       ;; 02:4521 $18 $40

.jr_002_4523
    ;
    ; Move Link to the direction pressed on the Joypad
    ;

    ldh  a, [hPressedButtonsMask]                 ;; 02:4523 $F0 $CB
    and  J_RIGHT | J_LEFT                         ;; 02:4525 $E6 $03
    jr   z, .joypadHorizontalEnd                  ;; 02:4527 $28 $19

    ld   e, a                                     ;; 02:4529 $5F
    ld   d, $00                                   ;; 02:452A $16 $00
    ld   hl, Data_002_68B1                        ;; 02:452C $21 $B1 $68
    add  hl, de                                   ;; 02:452F $19
    ldh  a, [hLinkSpeedX]                         ;; 02:4530 $F0 $9A
    sub  [hl]                                     ;; 02:4532 $96

    jr   z, .joypadHorizontalEnd                  ;; 02:4533 $28 $0D
    ld   e, $01                                   ;; 02:4535 $1E $01
    bit  7, a                                     ;; 02:4537 $CB $7F
    jr   nz, .jr_002_453D                         ;; 02:4539 $20 $02
    ld   e, $FF                                   ;; 02:453B $1E $FF
.jr_002_453D

    ldh  a, [hLinkSpeedX]                         ;; 02:453D $F0 $9A
    add  e                                        ;; 02:453F $83
    ldh  [hLinkSpeedX], a                         ;; 02:4540 $E0 $9A
.joypadHorizontalEnd

    ; If [hPressedButtonsMask] & J_UP | J_DOWN…
    ldh  a, [hPressedButtonsMask]                 ;; 02:4542 $F0 $CB
    rra                                           ;; 02:4544 $1F
    rra                                           ;; 02:4545 $1F
    and  $03                                      ;; 02:4546 $E6 $03
    jr   z, .joypadVerticalEnd                    ;; 02:4548 $28 $19

    ld   e, a                                     ;; 02:454A $5F
    ld   d, $00                                   ;; 02:454B $16 $00
    ld   hl, Data_002_44E7                        ;; 02:454D $21 $E7 $44
    add  hl, de                                   ;; 02:4550 $19
    ldh  a, [hLinkSpeedY]                         ;; 02:4551 $F0 $9B
    sub  [hl]                                     ;; 02:4553 $96

    jr   z, .joypadVerticalEnd                    ;; 02:4554 $28 $0D
    ld   e, +1                                    ;; 02:4556 $1E $01
    bit  7, a                                     ;; 02:4558 $CB $7F
    jr   nz, .jr_002_455E                         ;; 02:455A $20 $02
    ld   e, -1                                    ;; 02:455C $1E $FF
.jr_002_455E

    ldh  a, [hLinkSpeedY]                         ;; 02:455E $F0 $9B
    add  e                                        ;; 02:4560 $83
    ldh  [hLinkSpeedY], a                         ;; 02:4561 $E0 $9B
.joypadVerticalEnd

    ldh  a, [hLinkPositionZ]                      ;; 02:4563 $F0 $A2
    and  a                                        ;; 02:4565 $A7
    jr   z, .jr_002_456C                          ;; 02:4566 $28 $04

    and  $80                                      ;; 02:4568 $E6 $80
    jr   z, .return                               ;; 02:456A $28 $40

.jr_002_456C
    call ResetPegasusBoots                        ;; 02:456C $CD $B6 $0C
    ldh  [hLinkPositionZ], a                      ;; 02:456F $E0 $A2
    ld   [wC149], a                               ;; 02:4571 $EA $49 $C1
    ldh  [hLinkVelocityZ], a                      ;; 02:4574 $E0 $A3
    ld   [wIsLinkInTheAir], a                     ;; 02:4576 $EA $46 $C1
    ld   [wC152], a                               ;; 02:4579 $EA $52 $C1
    ld   [wC153], a                               ;; 02:457C $EA $53 $C1
    ld   [wC10A], a                               ;; 02:457F $EA $0A $C1
    ldh  a, [hLinkPositionY]                      ;; 02:4582 $F0 $99
    cp   $88                                      ;; 02:4584 $FE $88
    jr   nc, .return                              ;; 02:4586 $30 $24

    call ApplyLinkGroundPhysics                   ;; 02:4588 $CD $BD $75

    ldh  a, [hObjectUnderLink]                    ;; 02:458B $F0 $B8
    cp   $61                                      ;; 02:458D $FE $61
    jr   z, .return                               ;; 02:458F $28 $1B

    ld   a, [wLinkObjectPhysics]                  ;; 02:4591 $FA $81 $C1
    cp   OBJ_PHYSICS_SHALLOW_WATER                ;; 02:4594 $FE $05
    jr   z, shallowWaterVfx                       ;; 02:4596 $28 $15

    cp   OBJ_PHYSICS_DEEP_WATER                   ;; 02:4598 $FE $07
    jr   z, .return                               ;; 02:459A $28 $10

    cp   OBJ_PHYSICS_LAVA                         ;; 02:459C $FE $0B
    jr   z, .return                               ;; 02:459E $28 $0C

    cp   OBJ_PHYSICS_PIT                          ;; 02:45A0 $FE $50
    jr   z, .return                               ;; 02:45A2 $28 $08

    cp   OBJ_PHYSICS_PIT_WARP                     ;; 02:45A4 $FE $51
    jr   z, .return                               ;; 02:45A6 $28 $04

    ld   a, NOISE_SFX_FOOTSTEP                    ;; 02:45A8 $3E $07
    ldh  [hNoiseSfx], a                           ;; 02:45AA $E0 $F4

.return
    ret                                           ;; 02:45AC $C9

shallowWaterVfx:
    ldh  a, [hLinkPositionY]                      ;; 02:45AD $F0 $99
    ldh  [hMultiPurpose1], a                      ;; 02:45AF $E0 $D8
    ldh  a, [hLinkPositionX]                      ;; 02:45B1 $F0 $98
    ldh  [hMultiPurpose0], a                      ;; 02:45B3 $E0 $D7
    ld   a, JINGLE_WATER_SPLASH                   ;; 02:45B5 $3E $0E
    ldh  [hJingle], a                             ;; 02:45B7 $E0 $F2
    ld   a, TRANSCIENT_VFX_PEGASUS_SPLASH         ;; 02:45B9 $3E $0C
    jp   AddTranscientVfx                         ;; 02:45BB $C3 $C7 $0C

; 0 = True
; every other value = False
; values are used also in wC140
LinkDirectionToStaticSwordCollitionCheckNeeded::
    db   $00, $00, $08, $06
    db   $00, $06, $00, $00
    db   $08, $0A, $00, $0A
    db   $00, $00, $08, $10
    db   $00, $10, $00, $00
    db   $08, $08, $00, $08

; convert the direction link is facing to wC141
LinkDirectionTo_wC141::
    db   $00, $00, $05, $0A, $00, $0A, $00, $00, $05, $0A, $00, $0A, $00, $00, $05, $08
    db   $00, $08, $00, $00, $05, $08, $00, $08

; convert the direction link is facing to an offset used in calculation
LinkDirectionToOffset::
    db   $00, $00, $08, $08, $00, $08, $00, $00, $08, $08, $00, $08, $00, $00, $08, $08
    db   $00, $08, $00, $00, $08, $08, $00, $08

; convert the direction link is facing to wC143
LinkDirectionTo_wC143::
    db   $00, $00, $05, $08, $00, $08, $00, $00, $05, $08, $00, $08, $00, $00, $05, $08
    db   $00, $08, $00, $00, $05, $08, $00, $08

; convert the direction link is facing to sword direction
LinkDirectionToSwordDirection::
    ;   right                           left                        up                               down
    db  SWORD_DIRECTION_RIGHT,          SWORD_DIRECTION_TOP,        SWORD_DIRECTION_RIGHT_TOP,       SWORD_DIRECTION_RIGHT
    db  SWORD_DIRECTION_RIGHT_BOTTOM,   SWORD_DIRECTION_RIGHT,      SWORD_DIRECTION_RIGHT,           SWORD_DIRECTION_TOP
    db  SWORD_DIRECTION_LEFT_TOP,       SWORD_DIRECTION_LEFT,       SWORD_DIRECTION_LEFT_BOTTOM,     SWORD_DIRECTION_LEFT
    db  SWORD_DIRECTION_RIGHT,          SWORD_DIRECTION_RIGHT,      SWORD_DIRECTION_RIGHT_TOP,       SWORD_DIRECTION_TOP
    db  SWORD_DIRECTION_LEFT_TOP,       SWORD_DIRECTION_TOP,        SWORD_DIRECTION_RIGHT,           SWORD_DIRECTION_LEFT
    db  SWORD_DIRECTION_LEFT_BOTTOM,    SWORD_DIRECTION_BOTTOM,     SWORD_DIRECTION_RIGHT_BOTTOM,    SWORD_DIRECTION_BOTTOM

; convert the sowrd direction to link animation state
LinkDirectionToLinkAnimationState1::
    ;   right                                       left                                        up                                          down
    db  LINK_ANIMATION_STATE_STANDING_DOWN,         LINK_ANIMATION_STATE_UNKNOWN_18,            LINK_ANIMATION_STATE_UNKNOWN_19,            LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_RIGHT
    db  LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_RIGHT,  LINK_ANIMATION_STATE_HIDDEN,             LINK_ANIMATION_STATE_STANDING_DOWN,         LINK_ANIMATION_STATE_UNKNOWN_16
    db  LINK_ANIMATION_STATE_UNKNOWN_17,            LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_LEFT,   LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_LEFT,   LINK_ANIMATION_STATE_HIDDEN
    db  LINK_ANIMATION_STATE_STANDING_DOWN,         LINK_ANIMATION_STATE_UNKNOWN_14,            LINK_ANIMATION_STATE_UNKNOWN_15,            LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_UP
    db  LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_UP,     LINK_ANIMATION_STATE_HIDDEN,             LINK_ANIMATION_STATE_STANDING_DOWN,         LINK_ANIMATION_STATE_UNKNOWN_12
    db  LINK_ANIMATION_STATE_UNKNOWN_13,            LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_DOWN,   LINK_ANIMATION_STATE_HOOKSHOT_CHAIN_DOWN,   LINK_ANIMATION_STATE_HIDDEN

; convert the direction link is facing to wC13A
LinkDirectionTo_wC13A::
    db   $00, $00, $0D, $13, $10, $0B, $00, $F8, $F3, $ED, $F0, $F5, $00, $10, $0D, $F8
    db   $F5, $F8, $00, $F0, $F3, $00, $0C, $00

; convert the direction link is facing to wC139
LinkDirectionTo_wC139::
    db   $00, $F0, $F3, $00, $0C, $00, $00, $F0, $F3, $00, $0C, $00, $00, $F8, $F3, $F0
    db   $F3, $F5, $00, $00, $0D, $10, $0D, $0D

; convert the direction link is facing to wC13C
LinkDirectionTo_wC13C::
    db   $00, $00, $00, $03, $03, $00, $00, $00, $00, $FD, $FD, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00

; convert the direction link is facing to wC13B
LinkDirectionTo_wC13B::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $FD
    db   $FD, $00, $00, $00, $00, $03, $03

; convert the sword animation state to an unknown variable
SwordAnimationStateToUnknow::
    db   $00, $03, $03, $08, $01, $01, $01, $01

; convert an unknown value to links animation state
UnkownToLinkStateTable::
    db  LINK_ANIMATION_STATE_UNKNOWN_61,    LINK_ANIMATION_STATE_UNKNOWN_62,    LINK_ANIMATION_STATE_UNKNOWN_63,    LINK_ANIMATION_STATE_STANDING_DOWN
    db  LINK_ANIMATION_STATE_JUMPING_1,     LINK_ANIMATION_STATE_JUMPING_2,     LINK_ANIMATION_STATE_JUMPING_3,     LINK_ANIMATION_STATE_STANDING_DOWN
    db  LINK_ANIMATION_STATE_UNKNOWN_67,    LINK_ANIMATION_STATE_UNKNOWN_68,    LINK_ANIMATION_STATE_UNKNOWN_69,    LINK_ANIMATION_STATE_STANDING_DOWN
    db  LINK_ANIMATION_STATE_UNKNOWN_64,    LINK_ANIMATION_STATE_UNKNOWN_65,    LINK_ANIMATION_STATE_UNKNOWN_66,    LINK_ANIMATION_STATE_STANDING_DOWN

; convert the frame counter to link direction
FrameCounterToLinkDirection::
    db   DIRECTION_RIGHT, DIRECTION_DOWN, DIRECTION_LEFT, DIRECTION_UP

; convert the direction link is facing to sword animation state
LinkDirectionToSwordAnimationState::
    ;   right                               left                                 up                                     down                                ; spin attack progress
    db  SWORD_ANIMATION_STATE_SWING_MIDDLE, SWORD_ANIMATION_STATE_SWING_START,   SWORD_ANIMATION_STATE_SWING_MIDDLE,    SWORD_ANIMATION_STATE_SWING_START   ; 0°
    db  SWORD_ANIMATION_STATE_SWING_MIDDLE, SWORD_ANIMATION_STATE_SWING_START,   SWORD_ANIMATION_STATE_SWING_MIDDLE,    SWORD_ANIMATION_STATE_SWING_END     ; 45°
    db  SWORD_ANIMATION_STATE_SWING_MIDDLE, SWORD_ANIMATION_STATE_SWING_END,     SWORD_ANIMATION_STATE_SWING_MIDDLE,    SWORD_ANIMATION_STATE_SWING_START   ; 90°
    db  SWORD_ANIMATION_STATE_SWING_MIDDLE, SWORD_ANIMATION_STATE_SWING_END,     SWORD_ANIMATION_STATE_SWING_MIDDLE,    SWORD_ANIMATION_STATE_SWING_END     ; 135°
    db  SWORD_ANIMATION_STATE_SWING_MIDDLE, SWORD_ANIMATION_STATE_SWING_START,   SWORD_ANIMATION_STATE_SWING_MIDDLE,    SWORD_ANIMATION_STATE_SWING_END     ; 180°
    db  SWORD_ANIMATION_STATE_SWING_MIDDLE, SWORD_ANIMATION_STATE_SWING_END,     SWORD_ANIMATION_STATE_SWING_MIDDLE,    SWORD_ANIMATION_STATE_SWING_END     ; 225°
    db  SWORD_ANIMATION_STATE_SWING_MIDDLE, SWORD_ANIMATION_STATE_SWING_END,     SWORD_ANIMATION_STATE_SWING_MIDDLE,    SWORD_ANIMATION_STATE_SWING_END     ; 270°
    db  SWORD_ANIMATION_STATE_SWING_MIDDLE, SWORD_ANIMATION_STATE_SWING_START,   SWORD_ANIMATION_STATE_SWING_MIDDLE,    SWORD_ANIMATION_STATE_SWING_END     ; 315°

; convert the relative direction link is facing to absolute direction link is facing
LinkDirectionToAbsolute::
    ;   right               left                up                   down               ; spin attack progress
    db  DIRECTION_RIGHT,    DIRECTION_UP,       DIRECTION_UP,        DIRECTION_LEFT     ;  0°
    db  DIRECTION_LEFT,     DIRECTION_DOWN,     DIRECTION_DOWN,      DIRECTION_RIGHT    ;  45°
    db  DIRECTION_LEFT,     DIRECTION_UP,       DIRECTION_UP,        DIRECTION_RIGHT    ;  90°
    db  DIRECTION_RIGHT,    DIRECTION_DOWN,     DIRECTION_DOWN,      DIRECTION_LEFT     ;  135°
    db  DIRECTION_UP,       DIRECTION_RIGHT,    DIRECTION_RIGHT,     DIRECTION_DOWN     ;  180°
    db  DIRECTION_DOWN,     DIRECTION_LEFT,     DIRECTION_LEFT,      DIRECTION_UP       ;  225°
    db  DIRECTION_DOWN,     DIRECTION_LEFT,     DIRECTION_LEFT,      DIRECTION_UP       ;  270°
    db  DIRECTION_UP,       DIRECTION_RIGHT,    DIRECTION_RIGHT,     DIRECTION_DOWN     ;  315°

UpdateSpinAttackAnimation::
    dec  a                                        ;; 02:4709 $3D
    ld   [wIsUsingSpinAttack], a                  ;; 02:470A $EA $21 $C1
    ; motion blocked during spin attack
    ld   hl, hLinkInteractiveMotionBlocked        ;; 02:470D $21 $A1 $FF
    ld   [hl], TRUE                               ;; 02:4710 $36 $01
    srl  a                                        ;; 02:4712 $CB $3F
    srl  a                                        ;; 02:4714 $CB $3F
    ld   e, a                                     ;; 02:4716 $5F
    ld   d, $00                                   ;; 02:4717 $16 $00
    ; convert Links direction to sword animation state
    ldh  a, [hLinkDirection]                      ;; 02:4719 $F0 $9E
    sla  a                                        ;; 02:471B $CB $27
    sla  a                                        ;; 02:471D $CB $27
    sla  a                                        ;; 02:471F $CB $27
    ; e = (hLinkDirection<<3) + (wIsUsingSpinAttack >> 2)
    ; de = absolute direction in sword spin attack 0° -> 315° in 45° interval
    add  e                                        ;; 02:4721 $83
    ld   e, a                                     ;; 02:4722 $5F
    ld   hl, LinkDirectionToSwordAnimationState   ;; 02:4723 $21 $C9 $46
    add  hl, de                                   ;; 02:4726 $19
    ld   a, [hl]                                  ;; 02:4727 $7E
    ld   [wSwordAnimationState], a                ;; 02:4728 $EA $37 $C1
    ld   hl, LinkDirectionToAbsolute              ;; 02:472B $21 $E9 $46
    add  hl, de                                   ;; 02:472E $19
    ; back up link direction
    ldh  a, [hLinkDirection]                      ;; 02:472F $F0 $9E
    push af                                       ;; 02:4731 $F5
    ; link direction = absolute direcetion in spin attack
    ld   a, [hl]                                  ;; 02:4732 $7E
    ldh  [hLinkDirection], a                      ;; 02:4733 $E0 $9E
    ; update sword direction to be absolute
    call label_002_4827                           ;; 02:4735 $CD $27 $48
    ; recover link direction
    pop  af                                       ;; 02:4738 $F1
    ldh  [hLinkDirection], a                      ;; 02:4739 $E0 $9E
    ldh  a, [hFrameCounter]                       ;; 02:473B $F0 $E7
    and  $03                                      ;; 02:473D $E6 $03
    jr   nz, .jr_4745                             ;; 02:473F $20 $04

    ld   hl, wIsUsingSpinAttack                   ;; 02:4741 $21 $21 $C1
    dec  [hl]                                     ;; 02:4744 $35

.jr_4745
    ld   a, [wIsUsingSpinAttack]                  ;; 02:4745 $FA $21 $C1
    and  a                                        ;; 02:4748 $A7
    jp   z, label_002_48B0                        ;; 02:4749 $CA $B0 $48

    rla                                           ;; 02:474C $17
    jp   c, label_002_48B0                        ;; 02:474D $DA $B0 $48

    ldh  a, [hLinkPositionX]                      ;; 02:4750 $F0 $98
    add  $08                                      ;; 02:4752 $C6 $08
    ld   [wC140], a                               ;; 02:4754 $EA $40 $C1
    ld   a, $18                                   ;; 02:4757 $3E $18
    ld   [wC141], a                               ;; 02:4759 $EA $41 $C1
    ld   [wC143], a                               ;; 02:475C $EA $43 $C1
    ld   a, [wC145]                               ;; 02:475F $FA $45 $C1
    add  $08                                      ;; 02:4762 $C6 $08
    ld   [wC142], a                               ;; 02:4764 $EA $42 $C1
    ; enable sword collision for next 1/8 of spin as well
    ld   [wSwordCollisionEnabled], a              ;; 02:4767 $EA $B0 $C5
    ret                                           ;; 02:476A $C9

label_002_476B:
    dec  a                                        ;; 02:476B $3D
    ld   [wC16D], a                               ;; 02:476C $EA $6D $C1
    jp   z, label_002_48B0                        ;; 02:476F $CA $B0 $48

    ld   hl, wC16E                                ;; 02:4772 $21 $6E $C1
    ld   [hl], $04                                ;; 02:4775 $36 $04
    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:4777 $FA $4A $C1
    and  a                                        ;; 02:477A $A7
    jr   nz, .jr_4781                             ;; 02:477B $20 $04

    ld   a, $01                                   ;; 02:477D $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 02:477F $E0 $A1

.jr_4781
    ld   a, SWORD_ANIMATION_STATE_SWING_MIDDLE    ;; 02:4781 $3E $03
    ld   [wSwordAnimationState], a                ;; 02:4783 $EA $37 $C1
    jp   label_002_4827                           ;; 02:4786 $C3 $27 $48

jr_002_4789:
    jp   label_002_4827                           ;; 02:4789 $C3 $27 $48

; Update various automatic animations applied to Link: rotation, sword motion, etc.
UpdateLinkAnimation::
    ld   a, [wD475]                               ;; 02:478C $FA $75 $D4
    and  a                                        ;; 02:478F $A7
    jr   z, .rotateEnd                            ;; 02:4790 $28 $11
    ; rotate Link every 4th frame clockwise
    ldh  a, [hFrameCounter]                       ;; 02:4792 $F0 $E7
    ; hFrameCounter/4
    rra                                           ;; 02:4794 $1F
    rra                                           ;; 02:4795 $1F
    ; only 4 values needed for direction
    and  $03                                      ;; 02:4796 $E6 $03
    ld   e, a                                     ;; 02:4798 $5F
    ld   d, $00                                   ;; 02:4799 $16 $00
    ; translate to Link's view direction
    ld   hl, FrameCounterToLinkDirection          ;; 02:479B $21 $C5 $46
    add  hl, de                                   ;; 02:479E $19
    ld   a, [hl]                                  ;; 02:479F $7E
    ldh  [hLinkDirection], a                      ;; 02:47A0 $E0 $9E
    ret                                           ;; 02:47A2 $C9
.rotateEnd

    ; if link is in the air, jump to .jr_002_47E0
    ld   a, [wIsLinkInTheAir]                     ;; 02:47A3 $FA $46 $C1
    cp   TRUE                                     ;; 02:47A6 $FE $01
    jr   nz, .jr_002_47E0                         ;; 02:47A8 $20 $36

    ld   a, [wC3CF]                               ;; 02:47AA $FA $CF $C3
    ; if in sword animation, jump to .jr_002_47E0
    ld   hl, wSwordAnimationState                 ;; 02:47AD $21 $37 $C1
    or   [hl]                                     ;; 02:47B0 $B6
    jr   nz, .jr_002_47E0                         ;; 02:47B1 $20 $2D

    ldh  a, [hLinkDirection]                      ;; 02:47B3 $F0 $9E
    rla                                           ;; 02:47B5 $17
    rla                                           ;; 02:47B6 $17
    and  $0C                                      ;; 02:47B7 $E6 $0C
    ld   c, a                                     ;; 02:47B9 $4F
    ld   b, $00                                   ;; 02:47BA $06 $00
    ld   a, [wC152]                               ;; 02:47BC $FA $52 $C1
    cp   $03                                      ;; 02:47BF $FE $03
    jr   nc, .jr_002_47E0                         ;; 02:47C1 $30 $1D

    ld   e, a                                     ;; 02:47C3 $5F
    ld   d, $00                                   ;; 02:47C4 $16 $00
    ld   hl, UnkownToLinkStateTable               ;; 02:47C6 $21 $B5 $46
    add  hl, de                                   ;; 02:47C9 $19
    add  hl, bc                                   ;; 02:47CA $09
    ld   a, [hl]                                  ;; 02:47CB $7E
    ldh  [hLinkAnimationState], a                 ;; 02:47CC $E0 $9D
    ld   a, [wC153]                               ;; 02:47CE $FA $53 $C1
    inc  a                                        ;; 02:47D1 $3C
    ld   [wC153], a                               ;; 02:47D2 $EA $53 $C1
    and  $07                                      ;; 02:47D5 $E6 $07
    jr   nz, .jr_002_47E0                         ;; 02:47D7 $20 $07

    ld   a, [wC152]                               ;; 02:47D9 $FA $52 $C1
    inc  a                                        ;; 02:47DC $3C
    ld   [wC152], a                               ;; 02:47DD $EA $52 $C1

.jr_002_47E0

    ld   a, [wIsUsingSpinAttack]                  ;; 02:47E0 $FA $21 $C1
    and  a                                        ;; 02:47E3 $A7
    jp   nz, UpdateSpinAttackAnimation            ;; 02:47E4 $C2 $09 $47

    ld   a, [wC16D]                               ;; 02:47E7 $FA $6D $C1
    and  a                                        ;; 02:47EA $A7
    jp   nz, label_002_476B                       ;; 02:47EB $C2 $6B $47

    ; return if wSwordAnimationState == SWORD_ANIMATION_STATE_NONE
    ld   a, [wSwordAnimationState]                ;; 02:47EE $FA $37 $C1
    and  a                                        ;; 02:47F1 $A7
    ret  z                                        ;; 02:47F2 $C8

    ld   hl, wC16E                                ;; 02:47F3 $21 $6E $C1
    ld   [hl], $04                                ;; 02:47F6 $36 $04
    ld   a, [wSwordAnimationState]                ;; 02:47F8 $FA $37 $C1
    cp   SWORD_ANIMATION_STATE_HOLDING            ;; 02:47FB $FE $05
    jr   nc, jr_002_4789                          ;; 02:47FD $30 $8A

    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:47FF $FA $4A $C1
    and  a                                        ;; 02:4802 $A7
    jr   nz, .jr_002_4809                         ;; 02:4803 $20 $04
    ld   a, $01                                   ;; 02:4805 $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 02:4807 $E0 $A1
.jr_002_4809

    ld   a, [wC138]                               ;; 02:4809 $FA $38 $C1
    and  a                                        ;; 02:480C $A7
    jr   nz, .jr_002_4823                         ;; 02:480D $20 $14
    ; go to next sword animation state
    ld   a, [wSwordAnimationState]                ;; 02:480F $FA $37 $C1
    inc  a                                        ;; 02:4812 $3C
    ; save new sword animation state
    ld   [wSwordAnimationState], a                ;; 02:4813 $EA $37 $C1
    ; if at the end of swinging jump to label_002_48B0
    cp   SWORD_ANIMATION_STATE_SWING_END          ;; 02:4816 $FE $04
    jp   z, label_002_48B0                        ;; 02:4818 $CA $B0 $48

    ld   c, a                                     ;; 02:481B $4F
    ld   b, $00                                   ;; 02:481C $06 $00
    ld   hl, SwordAnimationStateToUnknow          ;; 02:481E $21 $AD $46
    add  hl, bc                                   ;; 02:4821 $09
    ld   a, [hl]                                  ;; 02:4822 $7E
.jr_002_4823
    dec  a                                        ;; 02:4823 $3D
    ld   [wC138], a                               ;; 02:4824 $EA $38 $C1

label_002_4827:
    ; convert link direction to sword direction and move to next sword animation state
    ld   hl, wSwordAnimationState                 ;; 02:4827 $21 $37 $C1
    ldh  a, [hLinkDirection]                      ;; 02:482A $F0 $9E
    ld   e, a                                     ;; 02:482C $5F
    sla  a                                        ;; 02:482D $CB $27
    sla  a                                        ;; 02:482F $CB $27
    add  e                                        ;; 02:4831 $83
    add  e                                        ;; 02:4832 $83
    add  [hl]                                     ;; 02:4833 $86
    ld   c, a                                     ;; 02:4834 $4F
    ld   b, $00                                   ;; 02:4835 $06 $00
    ld   hl, LinkDirectionToSwordDirection        ;; 02:4837 $21 $1E $46
    add  hl, bc                                   ;; 02:483A $09
    ld   a, [hl]                                  ;; 02:483B $7E
    ld   [wSwordDirection], a                     ;; 02:483C $EA $36 $C1
    ; if value is not LINK_ANIMATION_STATE_HIDDEN then update hLinkAnimationState
    ld   hl, LinkDirectionToLinkAnimationState1   ;; 02:483F $21 $36 $46
    add  hl, bc                                   ;; 02:4842 $09
    ld   a, [hl]                                  ;; 02:4843 $7E
    cp   LINK_ANIMATION_STATE_HIDDEN              ;; 02:4844 $FE $FF
    jr   z, .noUpdate                             ;; 02:4846 $28 $02
    ldh  [hLinkAnimationState], a                 ;; 02:4848 $E0 $9D

.noUpdate:
    ld   hl, LinkDirectionTo_wC13A                ;; 02:484A $21 $4E $46
    add  hl, bc                                   ;; 02:484D $09
    ld   a, [hl]                                  ;; 02:484E $7E
    ld   [wC13A], a                               ;; 02:484F $EA $3A $C1
    ld   hl, LinkDirectionTo_wC139                ;; 02:4852 $21 $66 $46
    add  hl, bc                                   ;; 02:4855 $09
    ld   a, [hl]                                  ;; 02:4856 $7E
    ld   [wC139], a                               ;; 02:4857 $EA $39 $C1
    ld   hl, LinkDirectionTo_wC13C                ;; 02:485A $21 $7E $46
    add  hl, bc                                   ;; 02:485D $09
    ld   a, [hl]                                  ;; 02:485E $7E
    ld   [wC13C], a                               ;; 02:485F $EA $3C $C1
    ld   hl, LinkDirectionTo_wC13B                ;; 02:4862 $21 $96 $46
    add  hl, bc                                   ;; 02:4865 $09
    ld   a, [hl]                                  ;; 02:4866 $7E
    ld   [wC13B], a                               ;; 02:4867 $EA $3B $C1
    ld   hl, LinkDirectionToStaticSwordCollitionCheckNeeded ;; 02:486A $21 $BE $45
    add  hl, bc                                   ;; 02:486D $09
    ld   a, [hl]                                  ;; 02:486E $7E
    and  a                                        ;; 02:486F $A7
    jr   z, .checkStaticSwordCollision            ;; 02:4870 $28 $3B

    ld   a, [wIsUsingShield]                      ;; 02:4872 $FA $5B $C1
    and  a                                        ;; 02:4875 $A7
    jr   z, .noShieldUsed                         ;; 02:4876 $28 $06

    ldh  a, [hFrameCounter]                       ;; 02:4878 $F0 $E7
    and  $01                                      ;; 02:487A $E6 $01
    jr   nz, .checkStaticSwordCollision           ;; 02:487C $20 $2F

.noShieldUsed:
    ld   a, [wC13A]                               ;; 02:487E $FA $3A $C1
    add  [hl]                                     ;; 02:4881 $86
    ld   hl, hLinkPositionX                       ;; 02:4882 $21 $98 $FF
    add  [hl]                                     ;; 02:4885 $86
    ld   [wC140], a                               ;; 02:4886 $EA $40 $C1
    ld   hl, LinkDirectionTo_wC141                ;; 02:4889 $21 $D6 $45
    add  hl, bc                                   ;; 02:488C $09
    ld   a, [hl]                                  ;; 02:488D $7E
    ld   [wC141], a                               ;; 02:488E $EA $41 $C1
    ; wC142 = [LinkDirectionToOffset + hLinkDirection] + wC139 + [wC145]
    ld   a, [wC139]                               ;; 02:4891 $FA $39 $C1
    ld   hl, LinkDirectionToOffset                ;; 02:4894 $21 $EE $45
    add  hl, bc                                   ;; 02:4897 $09
    add  [hl]                                     ;; 02:4898 $86
    ld   hl, wC145                                ;; 02:4899 $21 $45 $C1
    add  [hl]                                     ;; 02:489C $86
    ld   [wC142], a                               ;; 02:489D $EA $42 $C1
    ld   hl, LinkDirectionTo_wC143                ;; 02:48A0 $21 $06 $46
    add  hl, bc                                   ;; 02:48A3 $09
    ld   a, [hl]                                  ;; 02:48A4 $7E
    ld   [wC143], a                               ;; 02:48A5 $EA $43 $C1
    ; enable sword collision
    ld   a, $01                                   ;; 02:48A8 $3E $01
    ld   [wSwordCollisionEnabled], a              ;; 02:48AA $EA $B0 $C5

.checkStaticSwordCollision:
    jp   CheckStaticSwordCollision_trampoline     ;; 02:48AD $C3 $A7 $15

label_002_48B0:
    xor  a                                        ;; 02:48B0 $AF
    ld   [wC1AC], a                               ;; 02:48B1 $EA $AC $C1
    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:48B4 $FA $4A $C1
    and  a                                        ;; 02:48B7 $A7
    jr   nz, .return                              ;; 02:48B8 $20 $0A

    ; wSwordAnimationState = SWORD_ANIMATION_STATE_NONE
    xor  a                                        ;; 02:48BA $AF
    ld   [wSwordAnimationState], a                ;; 02:48BB $EA $37 $C1
    ld   [wC16A], a                               ;; 02:48BE $EA $6A $C1
    ld   [wIsUsingSpinAttack], a                  ;; 02:48C1 $EA $21 $C1

.return:
    ret                                           ;; 02:48C4 $C9

HorizontalIncrementForLinkPosition::
    ; First 16 entries are for normal walking, next 16 are for walking with piece of power
    ;    Index by J_RIGHT|J_LEFT|J_UP|J_DOWN part of the hJoypadState.
    db   $00, $10, $F0, $00, $00, $0C, $F4, $00, $00, $0C, $F4, $00, $00, $00, $00, $00
    db   $00, $14, $EC, $00, $00, $0F, $F1, $00, $00, $0F, $F1, $00, $00, $00, $00, $00

VerticalIncrementForLinkPosition::
    ; First 16 entries are for normal walking, next 16 are for walking with piece of power
    ;    Index by J_RIGHT|J_LEFT|J_UP|J_DOWN part of the hJoypadState.
    db   $00, $00, $00, $00, $F0, $F4, $F4, $00, $10, $0C, $0C, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $EC, $F1, $F1, $00, $14, $0F, $0F, $00, $00, $00, $00, $00

; Convert joypad input to Link's direction of view
;    Index by J_RIGHT|J_LEFT|J_UP|J_DOWN part of the hJoypadState.
JoypadToLinkDirection::
.none:        db  DIRECTION_KEEP
.right:       db  DIRECTION_RIGHT
.left:        db  DIRECTION_LEFT
.rightLeft:   db  DIRECTION_KEEP
.up:          db  DIRECTION_UP
.upRight:     db  DIRECTION_KEEP
.upLeft:      db  DIRECTION_KEEP
.upRightLeft: db  DIRECTION_KEEP
.down:        db  DIRECTION_DOWN
.downRight:   db  DIRECTION_KEEP
.downLeft:    db  DIRECTION_KEEP

;
; hLinkAnimationState values for Link walking animation.
;
; Animation lists are indexed by direction.
; Each list ordered as:
;   Right, Right-alt, Left, Left-alt, Top, Top-alt, Bottom, Bottom-alt
;
LinkAnimationsLists::

; Normal walking animation
LinkAnimationsList_WalkingNoShield::
        ;  standing                             walking
.right: db LINK_ANIMATION_STATE_STANDING_RIGHT, LINK_ANIMATION_STATE_WALKING_RIGHT
.left:  db LINK_ANIMATION_STATE_STANDING_LEFT,  LINK_ANIMATION_STATE_WALKING_LEFT
.up:    db LINK_ANIMATION_STATE_STANDING_UP,    LINK_ANIMATION_STATE_WALKING_UP
.down:  db LINK_ANIMATION_STATE_STANDING_DOWN,  LINK_ANIMATION_STATE_WALKING_DOWN

; Walking animation with shield
LinkAnimationsList_WalkCarryingDefaultShield::
        ;  standing                                    walking
.right: db LINK_ANIMATION_STATE_STANDING_SHIELD_RIGHT, LINK_ANIMATION_STATE_WALKING_SHIELD_RIGHT
.left:  db LINK_ANIMATION_STATE_STANDING_LEFT,         LINK_ANIMATION_STATE_WALKING_LEFT
.up:    db LINK_ANIMATION_STATE_STANDING_SHIELD_UP,    LINK_ANIMATION_STATE_WALKING_SHIELD_UP
.down:  db LINK_ANIMATION_STATE_STANDING_SHIELD_DOWN,  LINK_ANIMATION_STATE_WALKING_SHIELD_DOWN

LinkAnimationsList_WalkUsingDefaultShield::
        ;  standing                                        walking
.right: db LINK_ANIMATION_STATE_STANDING_SHIELD_USE_RIGHT, LINK_ANIMATION_STATE_WALKING_SHIELD_USE_RIGHT
.left:  db LINK_ANIMATION_STATE_STANDING_SHIELD_USE_LEFT,  LINK_ANIMATION_STATE_WALKING_SHIELD_USE_LEFT
.up:    db LINK_ANIMATION_STATE_STANDING_SHIELD_USE_UP,    LINK_ANIMATION_STATE_WALKING_SHIELD_USE_UP
.down:  db LINK_ANIMATION_STATE_STANDING_SHIELD_USE_DOWN,  LINK_ANIMATION_STATE_WALKING_SHIELD_USE_DOWN

LinkAnimationsList_WalkCarryingMirrorShield::
        ;  standing                                           walking
.right: db LINK_ANIMATION_STATE_STANDING_MIRROR_SHIELD_RIGHT, LINK_ANIMATION_STATE_WALKING_MIRROR_SHIELD_RIGHT
.left:  db LINK_ANIMATION_STATE_STANDING_LEFT,                LINK_ANIMATION_STATE_WALKING_LEFT
.up:    db LINK_ANIMATION_STATE_STANDING_SHIELD_UP,           LINK_ANIMATION_STATE_WALKING_SHIELD_UP
.down:  db LINK_ANIMATION_STATE_STANDING_SHIELD_DOWN,         LINK_ANIMATION_STATE_WALKING_SHIELD_DOWN

LinkAnimationsList_WalkUsingMirrorShield::
        ;  standing                                              walking
.right: db LINK_ANIMATION_STATE_STANDING_SHIELD_USE_RIGHT,       LINK_ANIMATION_STATE_WALKING_SHIELD_USE_RIGHT
.left:  db LINK_ANIMATION_STATE_STANDING_SHIELD_USE_LEFT,        LINK_ANIMATION_STATE_WALKING_SHIELD_USE_LEFT
.up:    db LINK_ANIMATION_STATE_STANDING_MIRROR_SHIELD_USE_UP,   LINK_ANIMATION_STATE_WALKING_MIRROR_SHIELD_USE_UP
.down:  db LINK_ANIMATION_STATE_STANDING_MIRROR_SHIELD_USE_DOWN, LINK_ANIMATION_STATE_WALKING_MIRROR_SHIELD_USE_DOWN

LinkAnimationsList_PushingObject::
        ;  standing                                     walking
.right: db LINK_ANIMATION_STATE_STANDING_PUSHING_RIGHT, LINK_ANIMATION_STATE_WALKING_PUSHING_RIGHT
.left:  db LINK_ANIMATION_STATE_STANDING_PUSHING_LEFT,  LINK_ANIMATION_STATE_WALKING_PUSHING_LEFT
.up:    db LINK_ANIMATION_STATE_STANDING_PUSHING_UP,    LINK_ANIMATION_STATE_WALKING_PUSHING_UP
.down:  db LINK_ANIMATION_STATE_STANDING_PUSHING_DOWN,  LINK_ANIMATION_STATE_WALKING_PUSHING_DOWN

LinkAnimationsList_LiftingObject::
        ;  standing                                     walking
.right: db LINK_ANIMATION_STATE_STANDING_LIFTING_RIGHT, LINK_ANIMATION_STATE_WALKING_LIFTING_RIGHT
.left:  db LINK_ANIMATION_STATE_STANDING_LIFTING_LEFT,  LINK_ANIMATION_STATE_WALKING_LIFTING_LEFT
.up:    db LINK_ANIMATION_STATE_STANDING_LIFTING_UP,    LINK_ANIMATION_STATE_WALKING_LIFTING_UP
.down:  db LINK_ANIMATION_STATE_STANDING_LIFTING_DOWN,  LINK_ANIMATION_STATE_WALKING_LIFTING_DOWN

; Swimming 1
Data_002_4948::
        ;  hold position                               ; moving
.right: db LINK_ANIMATION_STATE_HOLD_SWIMMING_1_RIGHT, LINK_ANIMATION_STATE_MOVING_SWIMMING_1_RIGHT
.left:  db LINK_ANIMATION_STATE_HOLD_SWIMMING_1_LEFT,  LINK_ANIMATION_STATE_MOVING_SWIMMING_1_LEFT
.up:    db LINK_ANIMATION_STATE_HOLD_SWIMMING_1_UP,    LINK_ANIMATION_STATE_MOVING_SWIMMING_1_UP
.down:  db LINK_ANIMATION_STATE_HOLD_SWIMMING_1_DOWN,  LINK_ANIMATION_STATE_MOVING_SWIMMING_1_DOWN

; Swimming 2
Data_002_4950::
.right: db LINK_ANIMATION_STATE_HOLD_SWIMMING_2, LINK_ANIMATION_STATE_MOVING_SWIMMING_2
.left:  db LINK_ANIMATION_STATE_HOLD_SWIMMING_2, LINK_ANIMATION_STATE_MOVING_SWIMMING_2
.up:    db LINK_ANIMATION_STATE_HOLD_SWIMMING_2, LINK_ANIMATION_STATE_MOVING_SWIMMING_2
.down:  db LINK_ANIMATION_STATE_HOLD_SWIMMING_2, LINK_ANIMATION_STATE_MOVING_SWIMMING_2

LinkAnimationsList_WalkSideScrolling::
        ;  standing ?                                           walking ?
.right: db LINK_ANIMATION_STATE_STANDING_SIDE_SCROLL_RIGHT_UP,  LINK_ANIMATION_STATE_WALKING_SIDE_SCROLL_RIGHT_UP
.left:  db LINK_ANIMATION_STATE_STANDING_SIDE_SCROLL_LEFT_DOWN, LINK_ANIMATION_STATE_WALKING_SIDE_SCROLL_LEFT_DOWN
.up:    db LINK_ANIMATION_STATE_STANDING_SIDE_SCROLL_RIGHT_UP,  LINK_ANIMATION_STATE_WALKING_SIDE_SCROLL_RIGHT_UP
.down:  db LINK_ANIMATION_STATE_STANDING_SIDE_SCROLL_LEFT_DOWN, LINK_ANIMATION_STATE_WALKING_SIDE_SCROLL_LEFT_DOWN

LinkMotionUnstuckingHandler::
    ld   a, $02                                   ;; 02:4960 $3E $02
    ld   [wC1C4], a                               ;; 02:4962 $EA $C4 $C1
    ldh  a, [hLinkPhysicsModifier]                ;; 02:4965 $F0 $9C
    and  a                                        ;; 02:4967 $A7
    jr   nz, jr_002_49AA                          ;; 02:4968 $20 $40

    ldh  a, [hLinkPositionY]                      ;; 02:496A $F0 $99
    add  $10                                      ;; 02:496C $C6 $10
    ldh  [hLinkPositionY], a                      ;; 02:496E $E0 $99
    ldh  [hLinkFinalPositionY], a                 ;; 02:4970 $E0 $A0
    ldh  a, [hLinkPositionZ]                      ;; 02:4972 $F0 $A2
    add  $10                                      ;; 02:4974 $C6 $10
    ldh  [hLinkPositionZ], a                      ;; 02:4976 $E0 $A2

.loop_4978
    ld   a, $FF                                   ;; 02:4978 $3E $FF
    ldh  [hLinkSpeedY], a                         ;; 02:497A $E0 $9B
    xor  a                                        ;; 02:497C $AF
    ldh  [hLinkSpeedX], a                         ;; 02:497D $E0 $9A
    ldh  a, [hLinkPositionY]                      ;; 02:497F $F0 $99
    add  $08                                      ;; 02:4981 $C6 $08
    ldh  [hLinkPositionY], a                      ;; 02:4983 $E0 $99
    ldh  [hLinkFinalPositionY], a                 ;; 02:4985 $E0 $A0
    ldh  a, [hLinkPositionZ]                      ;; 02:4987 $F0 $A2
    add  $08                                      ;; 02:4989 $C6 $08
    ldh  [hLinkPositionZ], a                      ;; 02:498B $E0 $A2
    call BackgroundCollisionHandler               ;; 02:498D $CD $45 $6E
    ldh  a, [hObjectUnderEntity]                  ;; 02:4990 $F0 $AF
    cp   $E1                                      ;; 02:4992 $FE $E1
    jr   z, .loop_4978                            ;; 02:4994 $28 $E2

    cp   $61                                      ;; 02:4996 $FE $61
    jr   z, .jr_49A0                              ;; 02:4998 $28 $06

    ld   a, [wCollisionType]                      ;; 02:499A $FA $33 $C1
    and  a                                        ;; 02:499D $A7
    jr   nz, .loop_4978                           ;; 02:499E $20 $D8

.jr_49A0
    ld   a, $01                                   ;; 02:49A0 $3E $01
    ldh  [hLinkPhysicsModifier], a                ;; 02:49A2 $E0 $9C
    ldh  a, [hLinkPositionY]                      ;; 02:49A4 $F0 $99
    sub  $03                                      ;; 02:49A6 $D6 $03
    ldh  [hLinkPositionY], a                      ;; 02:49A8 $E0 $99

jr_002_49AA:
    call ApplyLinkGroundMotion.noChecks           ;; 02:49AA $CD $FA $44
    ldh  a, [hLinkPositionZ]                      ;; 02:49AD $F0 $A2
    and  a                                        ;; 02:49AF $A7
    jr   nz, .jr_49B6                             ;; 02:49B0 $20 $04

    xor  a                                        ;; 02:49B2 $AF
    ld   [wLinkMotionState], a                    ;; 02:49B3 $EA $1C $C1

.jr_49B6
    ld   a, $01                                   ;; 02:49B6 $3E $01
    ld   [wIsLinkInTheAir], a                     ;; 02:49B8 $EA $46 $C1
    call CheckItemsToUse                          ;; 02:49BB $CD $77 $11
    call UpdateLinkAnimation                      ;; 02:49BE $CD $8C $47
    ld   a, [wSwordAnimationState]                ;; 02:49C1 $FA $37 $C1
    ld   [wC16A], a                               ;; 02:49C4 $EA $6A $C1
    jp   ApplyLinkMotionState                     ;; 02:49C7 $C3 $94 $17

Data_002_49CA::
    db   $01, $00, $01, $00, $00, $01, $00, $01, $01, $01, $00, $00, $00, $00, $01, $01
    db   $01, $00, $01, $00, $00, $01, $00, $01, $01, $01, $00, $00, $00, $00, $01, $01
    db   $00, $01, $01, $01, $01, $00, $01, $01, $01, $01, $00, $01, $01, $01, $01, $00
    db   $01, $00, $00, $00, $00, $01, $00, $00, $00, $00, $01, $00, $00, $00, $00, $01
    db   $00, $01, $01, $00, $01, $00, $00, $01

Data_002_4A12::
    db   $08, $F8

Data_002_4A14::
    db   $06, $01

LinkPlayingOcarinaHandler::
    ld   a, [wLinkPlayingOcarinaCountdown]        ;; 02:4A16 $FA $66 $C1
    and  a                                        ;; 02:4A19 $A7
    ret  z                                        ;; 02:4A1A $C8

IF __PATCH_0__
    ld   a, [wLinkMotionState]
    cp   LINK_MOTION_SWIMMING
    jr   nz, .endIfSwimming

    xor  a
    ld   [wLinkPlayingOcarinaCountdown], a
    ldh  [hWaveSfx], a
    ret
.endIfSwimming

    ld a, [wLinkPlayingOcarinaCountdown]
ENDC

    ld   hl, hLinkInteractiveMotionBlocked        ;; 02:4A1B $21 $A1 $FF
    ld   [hl], $02                                ;; 02:4A1E $36 $02
    cp   $FF                                      ;; 02:4A20 $FE $FF
    jr   nz, jr_002_4A7C                          ;; 02:4A22 $20 $58

    ld   a, [wD210]                               ;; 02:4A24 $FA $10 $D2
    add  $01                                      ;; 02:4A27 $C6 $01
    ld   [wD210], a                               ;; 02:4A29 $EA $10 $D2
    ld   a, [wD211]                               ;; 02:4A2C $FA $11 $D2
    adc  $00                                      ;; 02:4A2F $CE $00
    ld   [wD211], a                               ;; 02:4A31 $EA $11 $D2
    cp   $08                                      ;; 02:4A34 $FE $08
    jr   nz, .jr_4A53                             ;; 02:4A36 $20 $1B

    ld   a, [wD210]                               ;; 02:4A38 $FA $10 $D2
    cp   $D0                                      ;; 02:4A3B $FE $D0
    jr   nz, .jr_4A53                             ;; 02:4A3D $20 $14

    xor  a                                        ;; 02:4A3F $AF
    ld   [wLinkPlayingOcarinaCountdown], a        ;; 02:4A40 $EA $66 $C1
    ld   [wC167], a                               ;; 02:4A43 $EA $67 $C1
    ld   a, $03                                   ;; 02:4A46 $3E $03
    ld   [wC5A3], a                               ;; 02:4A48 $EA $A3 $C5
    ld   a, [wD465]                               ;; 02:4A4B $FA $65 $D4
    cp   $47                                      ;; 02:4A4E $FE $47
    ret  z                                        ;; 02:4A50 $C8

    jr   jr_002_4A6C                              ;; 02:4A51 $18 $19

.jr_4A53
    ld   a, [wD465]                               ;; 02:4A53 $FA $65 $D4
    cp   $47                                      ;; 02:4A56 $FE $47
    jr   z, jr_002_4A7A                           ;; 02:4A58 $28 $20

    ldh  a, [hJoypadState]                        ;; 02:4A5A $F0 $CC
    and  J_A | J_B                                ;; 02:4A5C $E6 $30
    jr   z, jr_002_4A7A                           ;; 02:4A5E $28 $1A

    xor  a                                        ;; 02:4A60 $AF
    ld   [wLinkPlayingOcarinaCountdown], a        ;; 02:4A61 $EA $66 $C1
    ld   [wC167], a                               ;; 02:4A64 $EA $67 $C1
    ld   a, $03                                   ;; 02:4A67 $3E $03
    ld   [wC5A3], a                               ;; 02:4A69 $EA $A3 $C5

jr_002_4A6C:
    ld   a, [wD461]                               ;; 02:4A6C $FA $61 $D4
    ld   e, a                                     ;; 02:4A6F $5F
    ld   d, b                                     ;; 02:4A70 $50
    ld   hl, wEntitiesStateTable                  ;; 02:4A71 $21 $90 $C2
    add  hl, de                                   ;; 02:4A74 $19
    ld   [hl], $00                                ;; 02:4A75 $36 $00
    jp   label_27DD                               ;; 02:4A77 $C3 $DD $27

jr_002_4A7A:
    jr   jr_002_4AD1                              ;; 02:4A7A $18 $55

jr_002_4A7C:
    call ClearLinkPositionIncrement               ;; 02:4A7C $CD $8E $17
    call ResetSpinAttack                          ;; 02:4A7F $CD $AF $0C
    ld   hl, wLinkPlayingOcarinaCountdown         ;; 02:4A82 $21 $66 $C1
    dec  [hl]                                     ;; 02:4A85 $35
    jr   nz, jr_002_4AD1                          ;; 02:4A86 $20 $49

    ld   a, [wIsMarinFollowingLink]               ;; 02:4A88 $FA $73 $DB
    and  a                                        ;; 02:4A8B $A7
    jr   z, .jr_4AA2                              ;; 02:4A8C $28 $14

    ld   a, [wSelectedSongIndex]                  ;; 02:4A8E $FA $4A $DB
    cp   $01                                      ;; 02:4A91 $FE $01
    jr   z, jr_002_4AB2                           ;; 02:4A93 $28 $1D

    ld   a, [wIsIndoor]                           ;; 02:4A95 $FA $A5 $DB
    and  a                                        ;; 02:4A98 $A7
    jr   nz, jr_002_4AB2                          ;; 02:4A99 $20 $17

    call_open_dialog Dialog277                    ;; 02:4A9B
    jr   jr_002_4AB2                              ;; 02:4AA0 $18 $10

.jr_4AA2
    ld   a, [wOcarinaSongFlags]                   ;; 02:4AA2 $FA $49 $DB
    and  a                                        ;; 02:4AA5 $A7
    jr   nz, jr_002_4AB2                          ;; 02:4AA6 $20 $0A

    call_open_dialog Dialog08E                    ;; 02:4AA8
    xor  a                                        ;; 02:4AAD $AF
    ld   [wC167], a                               ;; 02:4AAE $EA $67 $C1
    ret                                           ;; 02:4AB1 $C9

jr_002_4AB2:
    xor  a                                        ;; 02:4AB2 $AF
    ld   [wC167], a                               ;; 02:4AB3 $EA $67 $C1
    ld   a, [wSelectedSongIndex]                  ;; 02:4AB6 $FA $4A $DB
    cp   $01                                      ;; 02:4AB9 $FE $01
    jr   nz, .ret_4AD0                            ;; 02:4ABB $20 $13

    ld   a, TRANSITION_GFX_MANBO_IN               ;; 02:4ABD $3E $02
    ld   [wTransitionGfx], a                      ;; 02:4ABF $EA $7F $C1
    xor  a                                        ;; 02:4AC2 $AF
    ld   [wTransitionGfxFrameCount], a            ;; 02:4AC3 $EA $80 $C1
    ld   [wTransitionSequenceCounter], a          ;; 02:4AC6 $EA $6B $C1
    ld   [wC16C], a                               ;; 02:4AC9 $EA $6C $C1
    ld   a, JINGLE_MANBO_WARP                     ;; 02:4ACC $3E $2C
    ldh  [hJingle], a                             ;; 02:4ACE $E0 $F2

.ret_4AD0
    ret                                           ;; 02:4AD0 $C9

jr_002_4AD1:
    ld   a, [wC5A4]                               ;; 02:4AD1 $FA $A4 $C5
    inc  a                                        ;; 02:4AD4 $3C
    ld   [wC5A4], a                               ;; 02:4AD5 $EA $A4 $C5
    cp   $38                                      ;; 02:4AD8 $FE $38
    jr   c, .jr_4AE8                              ;; 02:4ADA $38 $0C

    xor  a                                        ;; 02:4ADC $AF
    ld   [wC5A4], a                               ;; 02:4ADD $EA $A4 $C5
    ld   a, [wC5A5]                               ;; 02:4AE0 $FA $A5 $C5
    xor  $01                                      ;; 02:4AE3 $EE $01
    ld   [wC5A5], a                               ;; 02:4AE5 $EA $A5 $C5

.jr_4AE8
    ld   a, [wC5A5]                               ;; 02:4AE8 $FA $A5 $C5
    ld   e, LINK_ANIMATION_STATE_UNKNOWN_75       ;; 02:4AEB $1E $75
    and  a                                        ;; 02:4AED $A7
    jr   nz, .jr_4AF1                             ;; 02:4AEE $20 $01
    inc  e                                        ;; 02:4AF0 $1C

.jr_4AF1
    ld   a, e                                     ;; 02:4AF1 $7B
    ldh  [hLinkAnimationState], a                 ;; 02:4AF2 $E0 $9D
    ld   a, $02                                   ;; 02:4AF4 $3E $02
    ld   [wC167], a                               ;; 02:4AF6 $EA $67 $C1
    ld   [wC111], a                               ;; 02:4AF9 $EA $11 $C1
    ld   a, [wLinkPlayingOcarinaCountdown]        ;; 02:4AFC $FA $66 $C1
    cp   $10                                      ;; 02:4AFF $FE $10
    ret  c                                        ;; 02:4B01 $D8

    ld   a, [wC5A4]                               ;; 02:4B02 $FA $A4 $C5
    cp   $14                                      ;; 02:4B05 $FE $14
    jr   nz, .ret_4B40                            ;; 02:4B07 $20 $37

    ld   a, ENTITY_MUSICAL_NOTE                   ;; 02:4B09 $3E $C9
    call SpawnNewEntity_trampoline                ;; 02:4B0B $CD $86 $3B
    jr   c, .ret_4B40                             ;; 02:4B0E $38 $30

    ldh  a, [hLinkPositionY]                      ;; 02:4B10 $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 02:4B12 $21 $10 $C2
    add  hl, de                                   ;; 02:4B15 $19
    sub  $08                                      ;; 02:4B16 $D6 $08
    ld   [hl], a                                  ;; 02:4B18 $77
    ld   a, [wC5A5]                               ;; 02:4B19 $FA $A5 $C5
    ld   c, a                                     ;; 02:4B1C $4F
    ld   b, d                                     ;; 02:4B1D $42
    ld   hl, Data_002_4A12                        ;; 02:4B1E $21 $12 $4A
    add  hl, bc                                   ;; 02:4B21 $09
    ldh  a, [hLinkPositionX]                      ;; 02:4B22 $F0 $98
    add  [hl]                                     ;; 02:4B24 $86
    ld   hl, wEntitiesPosXTable                   ;; 02:4B25 $21 $00 $C2
    add  hl, de                                   ;; 02:4B28 $19
    ld   [hl], a                                  ;; 02:4B29 $77
    ld   hl, Data_002_4A14                        ;; 02:4B2A $21 $14 $4A
    add  hl, bc                                   ;; 02:4B2D $09
    ld   a, [hl]                                  ;; 02:4B2E $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 02:4B2F $21 $40 $C2
    add  hl, de                                   ;; 02:4B32 $19
    ld   [hl], a                                  ;; 02:4B33 $77
    ld   hl, wEntitiesSpeedYTable                 ;; 02:4B34 $21 $50 $C2
    add  hl, de                                   ;; 02:4B37 $19
    ld   [hl], $FC                                ;; 02:4B38 $36 $FC
    ld   hl, wEntitiesInertiaTable                ;; 02:4B3A $21 $D0 $C3
    add  hl, de                                   ;; 02:4B3D $19
    ld   [hl], $40                                ;; 02:4B3E $36 $40

.ret_4B40
    ret                                           ;; 02:4B40 $C9

LinkDirectionToLinkAnimationState2::
    db   $71, $72, $6F, $70, $73, $74, $6D, $6E

func_002_4B49::
    ld   a, [wLinkUsingShovel]                    ;; 02:4B49 $FA $C7 $C1
    and  a                                        ;; 02:4B4C $A7
    jr   z, .return                               ;; 02:4B4D $28 $70

    ldh  a, [hMapId]                              ;; 02:4B4F $F0 $F7
    cp   MAP_WINDFISHS_EGG                        ;; 02:4B51 $FE $08
    jr   nz, .jr_002_4B64                         ;; 02:4B53 $20 $0F

    ld   a, [wFinalNightmareForm]                 ;; 02:4B55 $FA $19 $D2
    cp   $02                                      ;; 02:4B58 $FE $02
    jr   nz, .jr_002_4B64                         ;; 02:4B5A $20 $08

    call func_020_4B4A_trampoline                 ;; 02:4B5C $CD $4B $13
    ; enable sword collision
    ld   a, $01                                   ;; 02:4B5F $3E $01
    ld   [wSwordCollisionEnabled], a              ;; 02:4B61 $EA $B0 $C5

.jr_002_4B64
    ld   hl, hLinkInteractiveMotionBlocked        ;; 02:4B64 $21 $A1 $FF
    ld   [hl], $01                                ;; 02:4B67 $36 $01
    call ClearLinkPositionIncrement               ;; 02:4B69 $CD $8E $17
    ; a = 0
    ; reset sword parameter
    ld   [wSwordAnimationState], a                ;; 02:4B6C $EA $37 $C1
    ld   [wIsUsingSpinAttack], a                  ;; 02:4B6F $EA $21 $C1
    ld   [wSwordCharge], a                        ;; 02:4B72 $EA $22 $C1
    ld   a, [wLinkUsingShovelTimer]               ;; 02:4B75 $FA $C8 $C1
    inc  a                                        ;; 02:4B78 $3C
    ld   [wLinkUsingShovelTimer], a               ;; 02:4B79 $EA $C8 $C1
    cp   $10                                      ;; 02:4B7C $FE $10
    jr   nz, .jr_002_4B85                         ;; 02:4B7E $20 $05

    push af                                       ;; 02:4B80 $F5
    call func_002_4BC8                            ;; 02:4B81 $CD $C8 $4B
    pop  af                                       ;; 02:4B84 $F1

.jr_002_4B85
    cp   $18                                      ;; 02:4B85 $FE $18
    jr   nz, .jr_002_4BA9                         ;; 02:4B87 $20 $20

    ld   a, [wLinkUsingShovel]                    ;; 02:4B89 $FA $C7 $C1
    cp   $02                                      ;; 02:4B8C $FE $02
    jr   nz, .jr_002_4BA1                         ;; 02:4B8E $20 $11

    ld   a, [wIsMarinFollowingLink]               ;; 02:4B90 $FA $73 $DB
    and  a                                        ;; 02:4B93 $A7
    jr   z, .jr_002_4BA1                          ;; 02:4B94 $28 $0B

    ld   a, [wDialogState]                        ;; 02:4B96 $FA $9F $C1
    and  a                                        ;; 02:4B99 $A7
    jr   nz, .jr_002_4BA1                         ;; 02:4B9A $20 $05

    call_open_dialog Dialog279                    ;; 02:4B9C

.jr_002_4BA1
    xor  a                                        ;; 02:4BA1 $AF
    ld   [wLinkUsingShovel], a                    ;; 02:4BA2 $EA $C7 $C1
    ld   [wC1AC], a                               ;; 02:4BA5 $EA $AC $C1
    ret                                           ;; 02:4BA8 $C9

.jr_002_4BA9
    rra                                           ;; 02:4BA9 $1F
    rra                                           ;; 02:4BAA $1F
    rra                                           ;; 02:4BAB $1F
    rra                                           ;; 02:4BAC $1F
    and  $01                                      ;; 02:4BAD $E6 $01
    ld   e, a                                     ;; 02:4BAF $5F
    ldh  a, [hLinkDirection]                      ;; 02:4BB0 $F0 $9E
    sla  a                                        ;; 02:4BB2 $CB $27
    add  e                                        ;; 02:4BB4 $83
    ld   e, a                                     ;; 02:4BB5 $5F
    ld   d, $00                                   ;; 02:4BB6 $16 $00
    ld   hl, LinkDirectionToLinkAnimationState2   ;; 02:4BB8 $21 $41 $4B
    add  hl, de                                   ;; 02:4BBB $19
    ld   a, [hl]                                  ;; 02:4BBC $7E
    ldh  [hLinkAnimationState], a                 ;; 02:4BBD $E0 $9D

.return:
    ret                                           ;; 02:4BBF $C9

; Convert the view direction of Link to an index offset in X direction.
; used for sword collision detection
LinkDirectionToAdjacentTileIndexX::
.right: db  $14
.left:  db  $FC
.up:    db  $08
.down:  db  $08

; Convert the view direction of Link to an index offset in Y direction.
; used for sword collision detection
LinkDirectionToAdjacentTileIndexY::
.right: db  $0A
.left:  db  $0A
.up:    db  $FC
.down:  db  $14

func_002_4BC8::
    call func_002_4D20                            ;; 02:4BC8 $CD $20 $4D
    ret  c                                        ;; 02:4BCB $D8

    ld   a, $02                                   ;; 02:4BCC $3E $02
    ld   [wLinkUsingShovel], a                    ;; 02:4BCE $EA $C7 $C1
    jp   label_002_4C92                           ;; 02:4BD1 $C3 $92 $4C

func_002_4BD4::
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 02:4BD4 $F0 $CF
    ld   [hl+], a                                 ;; 02:4BD6 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 02:4BD7 $F0 $D0
    ld   [hl+], a                                 ;; 02:4BD9 $22
    ld   a, $81                                   ;; 02:4BDA $3E $81
    ld   [hl+], a                                 ;; 02:4BDC $22
    ld   a, [wIsIndoor]                           ;; 02:4BDD $FA $A5 $DB
    and  a                                        ;; 02:4BE0 $A7
    jr   z, .jr_4BFA                              ;; 02:4BE1 $28 $17

    ld   a, $04                                   ;; 02:4BE3 $3E $04
    ld   [hl+], a                                 ;; 02:4BE5 $22
    ld   a, $06                                   ;; 02:4BE6 $3E $06
    ld   [hl+], a                                 ;; 02:4BE8 $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 02:4BE9 $F0 $CF
    ld   [hl+], a                                 ;; 02:4BEB $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 02:4BEC $F0 $D0
    inc  a                                        ;; 02:4BEE $3C
    ld   [hl+], a                                 ;; 02:4BEF $22
    ld   a, $81                                   ;; 02:4BF0 $3E $81
    ld   [hl+], a                                 ;; 02:4BF2 $22
    ld   a, $05                                   ;; 02:4BF3 $3E $05
    ld   [hl+], a                                 ;; 02:4BF5 $22
    ld   a, $07                                   ;; 02:4BF6 $3E $07
    jr   jr_002_4C0F                              ;; 02:4BF8 $18 $15

.jr_4BFA
    ld   a, $6A                                   ;; 02:4BFA $3E $6A
    ld   [hl+], a                                 ;; 02:4BFC $22
    ld   a, $7A                                   ;; 02:4BFD $3E $7A
    ld   [hl+], a                                 ;; 02:4BFF $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 02:4C00 $F0 $CF
    ld   [hl+], a                                 ;; 02:4C02 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 02:4C03 $F0 $D0
    inc  a                                        ;; 02:4C05 $3C
    ld   [hl+], a                                 ;; 02:4C06 $22
    ld   a, $81                                   ;; 02:4C07 $3E $81
    ld   [hl+], a                                 ;; 02:4C09 $22
    ld   a, $6B                                   ;; 02:4C0A $3E $6B
    ld   [hl+], a                                 ;; 02:4C0C $22
    ld   a, $7B                                   ;; 02:4C0D $3E $7B

jr_002_4C0F:
    ld   [hl+], a                                 ;; 02:4C0F $22
    ld   a, $00                                   ;; 02:4C10 $3E $00
    ld   [hl+], a                                 ;; 02:4C12 $22
    ret                                           ;; 02:4C13 $C9

func_002_4C14::
    push de                                       ;; 02:4C14 $D5
    push hl                                       ;; 02:4C15 $E5
    ld   hl, wDrawCommandVRAM1                    ;; 02:4C16 $21 $91 $DC
    ld   a, [wDrawCommandsVRAM1Size]              ;; 02:4C19 $FA $90 $DC
    ld   e, a                                     ;; 02:4C1C $5F
    add  $0A                                      ;; 02:4C1D $C6 $0A
    ld   [wDrawCommandsVRAM1Size], a              ;; 02:4C1F $EA $90 $DC
    add  hl, de                                   ;; 02:4C22 $19
    ld   e, l                                     ;; 02:4C23 $5D
    ld   d, h                                     ;; 02:4C24 $54
    pop  hl                                       ;; 02:4C25 $E1
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 02:4C26 $F0 $CF
    ld   [hl+], a                                 ;; 02:4C28 $22
    ld   [de], a                                  ;; 02:4C29 $12
    inc  de                                       ;; 02:4C2A $13
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 02:4C2B $F0 $D0
    ld   [hl+], a                                 ;; 02:4C2D $22
    ld   [de], a                                  ;; 02:4C2E $12
    inc  de                                       ;; 02:4C2F $13
    ld   a, $81                                   ;; 02:4C30 $3E $81
    ld   [hl+], a                                 ;; 02:4C32 $22
    ld   [de], a                                  ;; 02:4C33 $12
    inc  de                                       ;; 02:4C34 $13
    ld   a, [wIsIndoor]                           ;; 02:4C35 $FA $A5 $DB
    and  a                                        ;; 02:4C38 $A7
    jr   z, .jr_4C64                              ;; 02:4C39 $28 $29

    ld   a, $04                                   ;; 02:4C3B $3E $04
    ld   [hl+], a                                 ;; 02:4C3D $22
    ld   a, $06                                   ;; 02:4C3E $3E $06
    ld   [hl+], a                                 ;; 02:4C40 $22
    ld   a, $05                                   ;; 02:4C41 $3E $05
    ld   [de], a                                  ;; 02:4C43 $12
    inc  de                                       ;; 02:4C44 $13
    ld   [de], a                                  ;; 02:4C45 $12
    inc  de                                       ;; 02:4C46 $13
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 02:4C47 $F0 $CF
    ld   [hl+], a                                 ;; 02:4C49 $22
    ld   [de], a                                  ;; 02:4C4A $12
    inc  de                                       ;; 02:4C4B $13
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 02:4C4C $F0 $D0
    inc  a                                        ;; 02:4C4E $3C
    ld   [hl+], a                                 ;; 02:4C4F $22
    ld   [de], a                                  ;; 02:4C50 $12
    inc  de                                       ;; 02:4C51 $13
    ld   a, $81                                   ;; 02:4C52 $3E $81
    ld   [hl+], a                                 ;; 02:4C54 $22
    ld   [de], a                                  ;; 02:4C55 $12
    inc  de                                       ;; 02:4C56 $13
    ld   a, $05                                   ;; 02:4C57 $3E $05
    ld   [hl+], a                                 ;; 02:4C59 $22
    ld   a, $05                                   ;; 02:4C5A $3E $05
    ld   [de], a                                  ;; 02:4C5C $12
    inc  de                                       ;; 02:4C5D $13
    ld   [de], a                                  ;; 02:4C5E $12
    inc  de                                       ;; 02:4C5F $13
    ld   a, $07                                   ;; 02:4C60 $3E $07
    jr   jr_002_4C8B                              ;; 02:4C62 $18 $27

.jr_4C64
    ld   a, $6A                                   ;; 02:4C64 $3E $6A
    ld   [hl+], a                                 ;; 02:4C66 $22
    ld   a, $7A                                   ;; 02:4C67 $3E $7A
    ld   [hl+], a                                 ;; 02:4C69 $22
    ld   a, $03                                   ;; 02:4C6A $3E $03
    ld   [de], a                                  ;; 02:4C6C $12
    inc  de                                       ;; 02:4C6D $13
    ld   [de], a                                  ;; 02:4C6E $12
    inc  de                                       ;; 02:4C6F $13
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 02:4C70 $F0 $CF
    ld   [hl+], a                                 ;; 02:4C72 $22
    ld   [de], a                                  ;; 02:4C73 $12
    inc  de                                       ;; 02:4C74 $13
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 02:4C75 $F0 $D0
    inc  a                                        ;; 02:4C77 $3C
    ld   [hl+], a                                 ;; 02:4C78 $22
    ld   [de], a                                  ;; 02:4C79 $12
    inc  de                                       ;; 02:4C7A $13
    ld   a, $81                                   ;; 02:4C7B $3E $81
    ld   [hl+], a                                 ;; 02:4C7D $22
    ld   [de], a                                  ;; 02:4C7E $12
    inc  de                                       ;; 02:4C7F $13
    ld   a, $6B                                   ;; 02:4C80 $3E $6B
    ld   [hl+], a                                 ;; 02:4C82 $22
    ld   a, $03                                   ;; 02:4C83 $3E $03
    ld   [de], a                                  ;; 02:4C85 $12
    inc  de                                       ;; 02:4C86 $13
    ld   [de], a                                  ;; 02:4C87 $12
    inc  de                                       ;; 02:4C88 $13
    ld   a, $7B                                   ;; 02:4C89 $3E $7B

jr_002_4C8B:
    ld   [hl+], a                                 ;; 02:4C8B $22
    ld   a, $00                                   ;; 02:4C8C $3E $00
    ld   [hl+], a                                 ;; 02:4C8E $22
    ld   [de], a                                  ;; 02:4C8F $12
    pop  de                                       ;; 02:4C90 $D1
    ret                                           ;; 02:4C91 $C9

label_002_4C92:
    ldh  a, [hMultiPurpose1]                      ;; 02:4C92 $F0 $D8
    ld   e, a                                     ;; 02:4C94 $5F
    ld   d, $00                                   ;; 02:4C95 $16 $00
    ld   hl, wRoomObjects                         ;; 02:4C97 $21 $11 $D7
    add  hl, de                                   ;; 02:4C9A $19
    ld   [hl], OBJECT_SHOVEL_HOLE                 ;; 02:4C9B $36 $CC
    ld   a, $82                                   ;; 02:4C9D $3E $82
    call BackupObjectInRAM2                       ;; 02:4C9F $CD $2F $0B
    call label_2887                               ;; 02:4CA2 $CD $87 $28
    ld   hl, wDrawCommand                         ;; 02:4CA5 $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ;; 02:4CA8 $FA $00 $D6
    ld   e, a                                     ;; 02:4CAB $5F
    add  $0A                                      ;; 02:4CAC $C6 $0A
    ld   [wDrawCommandsSize], a                   ;; 02:4CAE $EA $00 $D6
    ld   d, $00                                   ;; 02:4CB1 $16 $00
    add  hl, de                                   ;; 02:4CB3 $19
    ldh  a, [hIsGBC]                              ;; 02:4CB4 $F0 $FE
    and  a                                        ;; 02:4CB6 $A7
    jr   nz, .jr_4CBE                             ;; 02:4CB7 $20 $05

    call func_002_4BD4                            ;; 02:4CB9 $CD $D4 $4B
    jr   jr_002_4CC1                              ;; 02:4CBC $18 $03

.jr_4CBE
    call func_002_4C14                            ;; 02:4CBE $CD $14 $4C

jr_002_4CC1:
    call GetRandomByte                            ;; 02:4CC1 $CD $0D $28
    and  $07                                      ;; 02:4CC4 $E6 $07
    jr   nz, ret_002_4D1F                         ;; 02:4CC6 $20 $57

    ld   a, [wIsIndoor]                           ;; 02:4CC8 $FA $A5 $DB
    and  a                                        ;; 02:4CCB $A7
    jr   nz, .jr_4CD3                             ;; 02:4CCC $20 $05

    ldh  a, [hMapRoom]                            ;; 02:4CCE $F0 $F6
    cp   ROOM_OW_EAGLES_TOWER                     ;; 02:4CD0 $FE $0E
    ret  z                                        ;; 02:4CD2 $C8

.jr_4CD3
    call GetRandomByte                            ;; 02:4CD3 $CD $0D $28
    rra                                           ;; 02:4CD6 $1F
    ld   a, ENTITY_DROPPABLE_RUPEE                ;; 02:4CD7 $3E $2E
    jr   nc, .randomDropEnd                       ;; 02:4CD9 $30 $02
    ld   a, ENTITY_DROPPABLE_HEART                ;; 02:4CDB $3E $2D
.randomDropEnd

    call SpawnNewEntity_trampoline                ;; 02:4CDD $CD $86 $3B
    jr   c, ret_002_4D1F                          ;; 02:4CE0 $38 $3D

    ld   hl, wEntitiesPosXTable                   ;; 02:4CE2 $21 $00 $C2
    add  hl, de                                   ;; 02:4CE5 $19
    ldh  a, [hIntersectedObjectLeft]              ;; 02:4CE6 $F0 $CE
    add  $08                                      ;; 02:4CE8 $C6 $08
    ld   [hl], a                                  ;; 02:4CEA $77
    ld   hl, wEntitiesPosYTable                   ;; 02:4CEB $21 $10 $C2
    add  hl, de                                   ;; 02:4CEE $19
    ldh  a, [hIntersectedObjectTop]               ;; 02:4CEF $F0 $CD
    add  $10                                      ;; 02:4CF1 $C6 $10
    ld   [hl], a                                  ;; 02:4CF3 $77
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 02:4CF4 $21 $50 $C4
    add  hl, de                                   ;; 02:4CF7 $19
    ld   [hl], $80                                ;; 02:4CF8 $36 $80
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 02:4CFA $21 $F0 $C2
    add  hl, de                                   ;; 02:4CFD $19
    ld   [hl], $18                                ;; 02:4CFE $36 $18
    ld   hl, wEntitiesSpeedZTable                 ;; 02:4D00 $21 $20 $C3
    add  hl, de                                   ;; 02:4D03 $19
    ld   [hl], $20                                ;; 02:4D04 $36 $20
    ld   c, e                                     ;; 02:4D06 $4B
    ld   b, d                                     ;; 02:4D07 $42
    ld   a, $0C                                   ;; 02:4D08 $3E $0C
    call ApplyVectorTowardsLink_trampoline        ;; 02:4D0A $CD $AA $3B
    ldh  a, [hMultiPurpose0]                      ;; 02:4D0D $F0 $D7
    cpl                                           ;; 02:4D0F $2F
    inc  a                                        ;; 02:4D10 $3C
    ld   hl, wEntitiesSpeedYTable                 ;; 02:4D11 $21 $50 $C2
    add  hl, bc                                   ;; 02:4D14 $09
    ld   [hl], a                                  ;; 02:4D15 $77
    ldh  a, [hMultiPurpose1]                      ;; 02:4D16 $F0 $D8
    cpl                                           ;; 02:4D18 $2F
    inc  a                                        ;; 02:4D19 $3C
    ld   hl, wEntitiesSpeedXTable                 ;; 02:4D1A $21 $40 $C2
    add  hl, bc                                   ;; 02:4D1D $09
    ld   [hl], a                                  ;; 02:4D1E $77

ret_002_4D1F:
    ret                                           ;; 02:4D1F $C9

func_002_4D20::
    ; jump to .done if one or more is true:
    ;   - Link carry somethin
    ;   - Link is in the air
    ;   - Link is in motion
    ;   - screen scrolling is happening
    ld   a, [wIsCarryingLiftedObject]             ;; 02:4D20 $FA $5C $C1
    ld   hl, hLinkPositionZ                       ;; 02:4D23 $21 $A2 $FF
    or   [hl]                                     ;; 02:4D26 $B6
    ld   hl, wLinkMotionState                     ;; 02:4D27 $21 $1C $C1
    or   [hl]                                     ;; 02:4D2A $B6
    ld   hl, hIsSideScrolling                     ;; 02:4D2B $21 $F9 $FF
    or   [hl]                                     ;; 02:4D2E $B6
    jp   nz, .done                                ;; 02:4D2F $C2 $95 $4D

    ldh  a, [hLinkDirection]                      ;; 02:4D32 $F0 $9E
    ld   e, a                                     ;; 02:4D34 $5F
    ld   d, $00                                   ;; 02:4D35 $16 $00
    ld   hl, LinkDirectionToAdjacentTileIndexX    ;; 02:4D37 $21 $C0 $4B
    add  hl, de                                   ;; 02:4D3A $19
    ldh  a, [hLinkPositionX]                      ;; 02:4D3B $F0 $98
    add  [hl]                                     ;; 02:4D3D $86
    sub  $08                                      ;; 02:4D3E $D6 $08
    and  $F0                                      ;; 02:4D40 $E6 $F0
    ldh  [hIntersectedObjectLeft], a              ;; 02:4D42 $E0 $CE
    swap a                                        ;; 02:4D44 $CB $37
    ld   c, a                                     ;; 02:4D46 $4F
    ld   hl, LinkDirectionToAdjacentTileIndexY    ;; 02:4D47 $21 $C4 $4B
    add  hl, de                                   ;; 02:4D4A $19
    ldh  a, [hLinkPositionY]                      ;; 02:4D4B $F0 $99
    add  [hl]                                     ;; 02:4D4D $86
    sub  $10                                      ;; 02:4D4E $D6 $10
    and  $F0                                      ;; 02:4D50 $E6 $F0
    ldh  [hIntersectedObjectTop], a               ;; 02:4D52 $E0 $CD
    or   c                                        ;; 02:4D54 $B1
    ld   e, a                                     ;; 02:4D55 $5F
    ldh  [hMultiPurpose1], a                      ;; 02:4D56 $E0 $D8
    ld   hl, wRoomObjects                         ;; 02:4D58 $21 $11 $D7
    add  hl, de                                   ;; 02:4D5B $19
    ld   a, h                                     ;; 02:4D5C $7C
    cp   $D7                                      ;; 02:4D5D $FE $D7
    jp   nz, .done                                ;; 02:4D5F $C2 $95 $4D

    ld   a, [hl]                                  ;; 02:4D62 $7E
    ldh  [hMultiPurpose0], a                      ;; 02:4D63 $E0 $D7
    ld   e, a                                     ;; 02:4D65 $5F
    ld   a, [wIsIndoor]                           ;; 02:4D66 $FA $A5 $DB
    ld   d, a                                     ;; 02:4D69 $57
    call GetObjectPhysicsFlags_trampoline         ;; 02:4D6A $CD $26 $2A
    cp   $00                                      ;; 02:4D6D $FE $00
    jr   nz, .done                                ;; 02:4D6F $20 $24

    ld   a, d                                     ;; 02:4D71 $7A
    and  a                                        ;; 02:4D72 $A7
    jr   nz, .jr_4D8D                             ;; 02:4D73 $20 $18

    ldh  a, [hMultiPurpose0]                      ;; 02:4D75 $F0 $D7
    cp   $0C                                      ;; 02:4D77 $FE $0C
    jr   z, .done                                 ;; 02:4D79 $28 $1A

    cp   $0D                                      ;; 02:4D7B $FE $0D
    jr   z, .done                                 ;; 02:4D7D $28 $16

    cp   $0C                                      ;; 02:4D7F $FE $0C
    jr   z, .done                                 ;; 02:4D81 $28 $12

    cp   $0D                                      ;; 02:4D83 $FE $0D
    jr   z, .done                                 ;; 02:4D85 $28 $0E

    cp   $B9                                      ;; 02:4D87 $FE $B9
    jr   z, .done                                 ;; 02:4D89 $28 $0A

    jr   .jr_002_4D93                             ;; 02:4D8B $18 $06

.jr_4D8D
    ldh  a, [hMultiPurpose0]                      ;; 02:4D8D $F0 $D7
    cp   $05                                      ;; 02:4D8F $FE $05
    jr   nz, .done                                ;; 02:4D91 $20 $02

.jr_002_4D93
    and  a                                        ;; 02:4D93 $A7
    ret                                           ;; 02:4D94 $C9

.done
    scf                                           ;; 02:4D95 $37
    ret                                           ;; 02:4D96 $C9

label_002_4D97:
    ldh  a, [hMultiPurpose0]                      ;; 02:4D97 $F0 $D7
    ldh  [hIntersectedObjectLeft], a              ;; 02:4D99 $E0 $CE
    swap a                                        ;; 02:4D9B $CB $37
    and  $0F                                      ;; 02:4D9D $E6 $0F
    ld   e, a                                     ;; 02:4D9F $5F
    ldh  a, [hMultiPurpose1]                      ;; 02:4DA0 $F0 $D8
    ldh  [hIntersectedObjectTop], a               ;; 02:4DA2 $E0 $CD
    and  $F0                                      ;; 02:4DA4 $E6 $F0
    or   e                                        ;; 02:4DA6 $B3
    ld   e, a                                     ;; 02:4DA7 $5F
    ld   d, $00                                   ;; 02:4DA8 $16 $00
    ld   hl, wRoomObjects                         ;; 02:4DAA $21 $11 $D7
    add  hl, de                                   ;; 02:4DAD $19
    ld   [hl], $AE                                ;; 02:4DAE $36 $AE
    call label_2887                               ;; 02:4DB0 $CD $87 $28
    ldh  a, [hIsGBC]                              ;; 02:4DB3 $F0 $FE
    and  a                                        ;; 02:4DB5 $A7
    jr   z, .jr_4DCB                              ;; 02:4DB6 $28 $13

    push bc                                       ;; 02:4DB8 $C5
    ld   c, $AE                                   ;; 02:4DB9 $0E $AE
    ld   b, $00                                   ;; 02:4DBB $06 $00
    sla  c                                        ;; 02:4DBD $CB $21
    rl   b                                        ;; 02:4DBF $CB $10
    sla  c                                        ;; 02:4DC1 $CB $21
    rl   b                                        ;; 02:4DC3 $CB $10
    ld   a, $02                                   ;; 02:4DC5 $3E $02
    call func_91D.jp_92E                          ;; 02:4DC7 $CD $2E $09
    pop  bc                                       ;; 02:4DCA $C1

.jr_4DCB
    ld   hl, wDrawCommand                         ;; 02:4DCB $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ;; 02:4DCE $FA $00 $D6
    ld   e, a                                     ;; 02:4DD1 $5F
    add  $0A                                      ;; 02:4DD2 $C6 $0A
    ld   [wDrawCommandsSize], a                   ;; 02:4DD4 $EA $00 $D6
    ld   d, $00                                   ;; 02:4DD7 $16 $00
    add  hl, de                                   ;; 02:4DD9 $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 02:4DDA $F0 $CF
    ld   [hl+], a                                 ;; 02:4DDC $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 02:4DDD $F0 $D0
    ld   [hl+], a                                 ;; 02:4DDF $22
    ld   a, $81                                   ;; 02:4DE0 $3E $81
    ld   [hl+], a                                 ;; 02:4DE2 $22
    ld   a, $76                                   ;; 02:4DE3 $3E $76
    ld   [hl+], a                                 ;; 02:4DE5 $22
    ld   a, $77                                   ;; 02:4DE6 $3E $77
    ld   [hl+], a                                 ;; 02:4DE8 $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 02:4DE9 $F0 $CF
    ld   [hl+], a                                 ;; 02:4DEB $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 02:4DEC $F0 $D0
    inc  a                                        ;; 02:4DEE $3C
    ld   [hl+], a                                 ;; 02:4DEF $22
    ld   a, $81                                   ;; 02:4DF0 $3E $81
    ld   [hl+], a                                 ;; 02:4DF2 $22
    ld   a, $76                                   ;; 02:4DF3 $3E $76
    ld   [hl+], a                                 ;; 02:4DF5 $22
    ld   a, $77                                   ;; 02:4DF6 $3E $77
    ld   [hl+], a                                 ;; 02:4DF8 $22
    ld   [hl], $00                                ;; 02:4DF9 $36 $00
    ret                                           ;; 02:4DFB $C9

; Tunic-related code (see wDC50)
func_002_4DFC::
    push bc                                       ;; 02:4DFC $C5
    push de                                       ;; 02:4DFD $D5
    ld   hl, wObjPal1                             ;; 02:4DFE $21 $50 $DC
    ld   c, $00                                   ;; 02:4E01 $0E $00
    di                                            ;; 02:4E03 $F3

    ; Copy 8 bytes from 01:DC50 to 02:DC50
.loop
    xor  a                                        ;; 02:4E04 $AF
    ldh  [rSVBK], a                               ;; 02:4E05 $E0 $70
    ld   b, [hl]                                  ;; 02:4E07 $46
    ld   a, $02                                   ;; 02:4E08 $3E $02
    ldh  [rSVBK], a                               ;; 02:4E0A $E0 $70
    ld   a, b                                     ;; 02:4E0C $78
    ld   [hl], a                                  ;; 02:4E0D $77
    inc  hl                                       ;; 02:4E0E $23
    inc  c                                        ;; 02:4E0F $0C
    ld   a, c                                     ;; 02:4E10 $79
    cp   $08                                      ;; 02:4E11 $FE $08
    jr   c, .loop                                 ;; 02:4E13 $38 $EF

    xor  a                                        ;; 02:4E15 $AF
    ldh  [rSVBK], a                               ;; 02:4E16 $E0 $70
    ei                                            ;; 02:4E18 $FB
    pop  de                                       ;; 02:4E19 $D1
    pop  bc                                       ;; 02:4E1A $C1
    ret                                           ;; 02:4E1B $C9

Data_002_4E1C::
    db   $FF, $47, $00, $00, $0C, $39, $76, $5E, $FF, $47, $00, $00, $67, $28, $76, $5E

func_002_4E2C::
    push bc                                       ;; 02:4E2C $C5
    di                                            ;; 02:4E2D $F3
    ld   hl, Data_002_4E1C                        ;; 02:4E2E $21 $1C $4E
    add  hl, de                                   ;; 02:4E31 $19
    ld   de, wObjPal8                             ;; 02:4E32 $11 $88 $DC
    ld   c, $00                                   ;; 02:4E35 $0E $00

.loop_4E37
    ld   a, [hl+]                                 ;; 02:4E37 $2A
    ld   [de], a                                  ;; 02:4E38 $12
    inc  de                                       ;; 02:4E39 $13
    inc  c                                        ;; 02:4E3A $0C
    ld   a, c                                     ;; 02:4E3B $79
    cp   $08                                      ;; 02:4E3C $FE $08
    jr   c, .loop_4E37                            ;; 02:4E3E $38 $F7

    ei                                            ;; 02:4E40 $FB
    ld   a, $02                                   ;; 02:4E41 $3E $02
    ld   [wPaletteDataFlags], a                   ;; 02:4E43 $EA $D1 $DD
    pop  bc                                       ;; 02:4E46 $C1
    ret                                           ;; 02:4E47 $C9

; Copy data from RAM bank 2 to RAM bank 0
func_002_4E48::
    di                                            ;; 02:4E48 $F3
    ld   hl, wObjPal8                             ;; 02:4E49 $21 $88 $DC
    ld   e, $00                                   ;; 02:4E4C $1E $00

.loop
    ld   a, $02                                   ;; 02:4E4E $3E $02
    ldh  [rSVBK], a                               ;; 02:4E50 $E0 $70
    ld   b, [hl]                                  ;; 02:4E52 $46
    xor  a                                        ;; 02:4E53 $AF
    ldh  [rSVBK], a                               ;; 02:4E54 $E0 $70
    ld   a, b                                     ;; 02:4E56 $78
    ld   [hl], a                                  ;; 02:4E57 $77
    inc  hl                                       ;; 02:4E58 $23
    inc  e                                        ;; 02:4E59 $1C
    ld   a, e                                     ;; 02:4E5A $7B
    cp   $08                                      ;; 02:4E5B $FE $08
    jr   c, .loop                                 ;; 02:4E5D $38 $EF

    ei                                            ;; 02:4E5F $FB
    ld   a, $02                                   ;; 02:4E60 $3E $02
    ld   [wPaletteDataFlags], a                   ;; 02:4E62 $EA $D1 $DD
    ret                                           ;; 02:4E65 $C9

LinkRevolvingDoorAnimation::
    db  LINK_ANIMATION_STATE_REVOLVING_DOOR_1
    db  LINK_ANIMATION_STATE_REVOLVING_DOOR_2
    db  LINK_ANIMATION_STATE_REVOLVING_DOOR_3
    db  LINK_ANIMATION_STATE_REVOLVING_DOOR_4
    db  LINK_ANIMATION_STATE_REVOLVING_DOOR_4
    db  LINK_ANIMATION_STATE_REVOLVING_DOOR_5
    db  LINK_ANIMATION_STATE_REVOLVING_DOOR_3

LinkMotionRevolvingDoorHandler::
    ld   a, $10                                   ;; 02:4E6D $3E $10
    ldh  [hLinkPositionY], a                      ;; 02:4E6F $E0 $99
    ld   a, $50                                   ;; 02:4E71 $3E $50
    ldh  [hLinkPositionX], a                      ;; 02:4E73 $E0 $98
    ld   [wC167], a                               ;; 02:4E75 $EA $67 $C1
    ld   a, [wLinkAnimationFrame]                 ;; 02:4E78 $FA $98 $C1
    push af                                       ;; 02:4E7B $F5
    ld   d, $00                                   ;; 02:4E7C $16 $00
    ld   e, $08                                   ;; 02:4E7E $1E $08
    cp   $18                                      ;; 02:4E80 $FE $18
    jr   z, .jr_4E95                              ;; 02:4E82 $28 $11

    ld   e, $00                                   ;; 02:4E84 $1E $00
    cp   $28                                      ;; 02:4E86 $FE $28
    jr   z, .jr_4E95                              ;; 02:4E88 $28 $0B

    and  a                                        ;; 02:4E8A $A7
    jr   nz, jr_002_4E9D                          ;; 02:4E8B $20 $10

    ldh  a, [hIsGBC]                              ;; 02:4E8D $F0 $FE
    and  a                                        ;; 02:4E8F $A7
    jr   z, jr_002_4E9D                           ;; 02:4E90 $28 $0B

    call func_002_4DFC                            ;; 02:4E92 $CD $FC $4D

.jr_4E95
    ldh  a, [hIsGBC]                              ;; 02:4E95 $F0 $FE
    and  a                                        ;; 02:4E97 $A7
    jr   z, jr_002_4E9D                           ;; 02:4E98 $28 $03

    call func_002_4E2C                            ;; 02:4E9A $CD $2C $4E

jr_002_4E9D:
    pop  af                                       ;; 02:4E9D $F1
    rra                                           ;; 02:4E9E $1F
    rra                                           ;; 02:4E9F $1F
    rra                                           ;; 02:4EA0 $1F

.jr_4EA1
    and  $07                                      ;; 02:4EA1 $E6 $07
    ld   e, a                                     ;; 02:4EA3 $5F
    ld   d, $00                                   ;; 02:4EA4 $16 $00
    ld   hl, LinkRevolvingDoorAnimation           ;; 02:4EA6 $21 $66 $4E
    add  hl, de                                   ;; 02:4EA9 $19
    ld   a, [hl]                                  ;; 02:4EAA $7E
    ldh  [hLinkAnimationState], a                 ;; 02:4EAB $E0 $9D
    ld   a, [wLinkAnimationFrame]                 ;; 02:4EAD $FA $98 $C1
    inc  a                                        ;; 02:4EB0 $3C
    ld   [wLinkAnimationFrame], a                 ;; 02:4EB1 $EA $98 $C1
    cp   $38                                      ;; 02:4EB4 $FE $38
    jr   c, .jr_4EC4                              ;; 02:4EB6 $38 $0C

    ld   a, $FB                                   ;; 02:4EB8 $3E $FB
    ldh  [hLinkPositionY], a                      ;; 02:4EBA $E0 $99
    ld   a, DIRECTION_UP                          ;; 02:4EBC $3E $02
    ldh  [hLinkDirection], a                      ;; 02:4EBE $E0 $9E
    ld   a, LINK_ANIMATION_STATE_STANDING_UP      ;; 02:4EC0 $3E $04
    ldh  [hLinkAnimationState], a                 ;; 02:4EC2 $E0 $9D

.jr_4EC4
    ld   a, [wLinkAnimationFrame]                 ;; 02:4EC4 $FA $98 $C1
    cp   $48                                      ;; 02:4EC7 $FE $48
    jr   nz, ret_002_4EEF                         ;; 02:4EC9 $20 $24

    ldh  a, [hIsGBC]                              ;; 02:4ECB $F0 $FE
    and  a                                        ;; 02:4ECD $A7
    jr   z, .jr_4ED3                              ;; 02:4ECE $28 $03

    call func_002_4E48                            ;; 02:4ED0 $CD $48 $4E

.jr_4ED3
    ld   a, $02                                   ;; 02:4ED3 $3E $02
    ld   [wRoomTransitionDirection], a            ;; 02:4ED5 $EA $25 $C1
    ld   a, $01                                   ;; 02:4ED8 $3E $01
    ld   [wRoomTransitionState], a                ;; 02:4EDA $EA $24 $C1

func_002_4EDD::
    xor  a                                        ;; 02:4EDD $AF
    ld   [wLinkAnimationFrame], a                 ;; 02:4EDE $EA $98 $C1
    ld   [wC167], a                               ;; 02:4EE1 $EA $67 $C1

IF !__PATCH_0__
    ld   [wBGPaletteTransitionEffect], a          ;; 02:4EE4 $EA $D6 $DD
    ld   [wDDD7], a                               ;; 02:4EE7 $EA $D7 $DD
ENDC

    ld   a, LINK_MOTION_DEFAULT                   ;; 02:4EEA $3E $00
    ld   [wLinkMotionState], a                    ;; 02:4EEC $EA $1C $C1

ret_002_4EEF:
    ret                                           ;; 02:4EEF $C9

Data_002_4EF0::
    db   $00, $08, $F8, $00, $00, $06, $FA, $00, $00, $06, $FA, $00, $00, $00, $00, $00

Data_002_4F00::
    db   $00, $10, $F0, $00, $00, $0C, $F4, $00, $00, $0C, $F4, $00, $00, $00, $00, $00

Data_002_4F10::
    db   $00, $00, $00, $00, $F8, $FA, $FA, $00, $08, $06, $06, $00, $00, $00, $00, $00

Data_002_4F20::
    db   $00, $00, $00, $00, $F0, $F4, $F4, $00, $10, $0C, $0C, $00, $00, $00, $00, $00

LinkMotionSwimmingHandler::
IF __PATCH_0__
    ld   a, [wLinkPlayingOcarinaCountdown]
    and  a
    jr   z, .ifCountdownIsZero

    xor  a
    ld   [wLinkPlayingOcarinaCountdown], a
    ld   [wC167], a
.ifCountdownIsZero
ENDC

    ld   a, [wFreeMovementMode]                   ;; 02:4F30 $FA $7B $C1
    and  a                                        ;; 02:4F33 $A7
    jr   z, .jr_4F3C                              ;; 02:4F34 $28 $06

    ld   a, LINK_MOTION_DEFAULT                   ;; 02:4F36 $3E $00
    ld   [wLinkMotionState], a                    ;; 02:4F38 $EA $1C $C1
    ret                                           ;; 02:4F3B $C9

.jr_4F3C
    call ResetSpinAttack                          ;; 02:4F3C $CD $AF $0C
    ; a = 0
    ; reset all states after spin attack
    ldh  [hLinkPositionZ], a                      ;; 02:4F3F $E0 $A2
    ld   [wIsLinkInTheAir], a                     ;; 02:4F41 $EA $46 $C1
    ld   [wLinkAttackStepAnimationCountdown], a   ;; 02:4F44 $EA $9B $C1
    ld   [wSwordAnimationState], a                ;; 02:4F47 $EA $37 $C1
    ld   [wC16A], a                               ;; 02:4F4A $EA $6A $C1
    ld   [wC16D], a                               ;; 02:4F4D $EA $6D $C1

    ld   a, [wIndoorRoom]                         ;; 02:4F50 $FA $AE $DB
    ld   [wD46B], a                               ;; 02:4F53 $EA $6B $D4
    ld   hl, wDialogState                         ;; 02:4F56 $21 $9F $C1
    ldh  a, [hLinkInteractiveMotionBlocked]       ;; 02:4F59 $F0 $A1
    or   [hl]                                     ;; 02:4F5B $B6
    jp   z, label_002_4F6D                        ;; 02:4F5C $CA $6D $4F

    call ClearLinkPositionIncrement               ;; 02:4F5F $CD $8E $17
    ldh  a, [hLinkInteractiveMotionBlocked]       ;; 02:4F62 $F0 $A1
    and  a                                        ;; 02:4F64 $A7
    jr   z, .jr_4F6A                              ;; 02:4F65 $28 $03

    xor  a                                        ;; 02:4F67 $AF
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 02:4F68 $E0 $A1

.jr_4F6A
    jp   UpdateLinkWalkingAnimation               ;; 02:4F6A $C3 $50 $1A

label_002_4F6D:
    ; If pressing B…
    ldh  a, [hJoypadState]                        ;; 02:4F6D $F0 $CC
    and  J_B                                      ;; 02:4F6F $E6 $20
    jr   z, .divingEnd                            ;; 02:4F71 $28 $13
    ; …toggle diving on or off
    ldh  a, [hLinkPhysicsModifier]                ;; 02:4F73 $F0 $9C
    xor  $01                                      ;; 02:4F75 $EE $01
    ; If the player actually dived…
    ldh  [hLinkPhysicsModifier], a                ;; 02:4F77 $E0 $9C
    jr   z, .divingEnd                            ;; 02:4F79 $28 $0B
    ; … configure the diving duration
    ld   a, $A0                                   ;; 02:4F7B $3E $A0
    ldh  [hLinkCountdown], a                      ;; 02:4F7D $E0 $B7
    ldh  a, [hLinkPositionY]                      ;; 02:4F7F $F0 $99
    sub  $03                                      ;; 02:4F81 $D6 $03
    call func_002_5928                            ;; 02:4F83 $CD $28 $59
.divingEnd

    ld   a, [wC183]                               ;; 02:4F86 $FA $83 $C1
    and  a                                        ;; 02:4F89 $A7
    jr   z, .jr_4F92                              ;; 02:4F8A $28 $06

    dec  a                                        ;; 02:4F8C $3D
    ld   [wC183], a                               ;; 02:4F8D $EA $83 $C1
    jr   jr_002_4FA1                              ;; 02:4F90 $18 $0F

.jr_4F92
    ldh  a, [hJoypadState]                        ;; 02:4F92 $F0 $CC
    and  J_A                                      ;; 02:4F94 $E6 $10
    jr   z, jr_002_4FA1                           ;; 02:4F96 $28 $09

    ld   a, JINGLE_SWIM                           ;; 02:4F98 $3E $0F
    ldh  [hJingle], a                             ;; 02:4F9A $E0 $F2
    ld   a, $20                                   ;; 02:4F9C $3E $20
    ld   [wC183], a                               ;; 02:4F9E $EA $83 $C1

jr_002_4FA1:
    ldh  a, [hFrameCounter]                       ;; 02:4FA1 $F0 $E7
    and  $01                                      ;; 02:4FA3 $E6 $01
    jr   nz, jr_002_5005                          ;; 02:4FA5 $20 $5E

    ldh  a, [hPressedButtonsMask]                 ;; 02:4FA7 $F0 $CB
    and  $0F                                      ;; 02:4FA9 $E6 $0F
    ld   e, a                                     ;; 02:4FAB $5F
    ld   d, $00                                   ;; 02:4FAC $16 $00
    ld   hl, Data_002_4EF0                        ;; 02:4FAE $21 $F0 $4E
    ld   a, [wC183]                               ;; 02:4FB1 $FA $83 $C1
    cp   $10                                      ;; 02:4FB4 $FE $10
    jr   c, .jr_4FBB                              ;; 02:4FB6 $38 $03

    ld   hl, Data_002_4F00                        ;; 02:4FB8 $21 $00 $4F

.jr_4FBB
    add  hl, de                                   ;; 02:4FBB $19
    ld   a, [hl]                                  ;; 02:4FBC $7E
    ld   hl, hLinkSpeedX                          ;; 02:4FBD $21 $9A $FF
    sub  [hl]                                     ;; 02:4FC0 $96
    jr   z, .jr_4FCA                              ;; 02:4FC1 $28 $07

    inc  [hl]                                     ;; 02:4FC3 $34
    bit  7, a                                     ;; 02:4FC4 $CB $7F
    jr   z, .jr_4FCA                              ;; 02:4FC6 $28 $02

    dec  [hl]                                     ;; 02:4FC8 $35
    dec  [hl]                                     ;; 02:4FC9 $35

.jr_4FCA
    ld   hl, Data_002_4F10                        ;; 02:4FCA $21 $10 $4F
    ld   a, [wC183]                               ;; 02:4FCD $FA $83 $C1
    cp   $10                                      ;; 02:4FD0 $FE $10
    jr   c, .jr_4FD7                              ;; 02:4FD2 $38 $03

    ld   hl, Data_002_4F20                        ;; 02:4FD4 $21 $20 $4F

.jr_4FD7
    add  hl, de                                   ;; 02:4FD7 $19
    ld   a, [hl]                                  ;; 02:4FD8 $7E
    ld   hl, hLinkSpeedY                          ;; 02:4FD9 $21 $9B $FF
    sub  [hl]                                     ;; 02:4FDC $96
    jr   z, .jr_4FE6                              ;; 02:4FDD $28 $07

    inc  [hl]                                     ;; 02:4FDF $34
    bit  7, a                                     ;; 02:4FE0 $CB $7F
    jr   z, .jr_4FE6                              ;; 02:4FE2 $28 $02

    dec  [hl]                                     ;; 02:4FE4 $35
    dec  [hl]                                     ;; 02:4FE5 $35

.jr_4FE6
    ldh  a, [hLinkSpeedX]                         ;; 02:4FE6 $F0 $9A
    or   [hl]                                     ;; 02:4FE8 $B6
    ld   hl, hLinkPhysicsModifier                 ;; 02:4FE9 $21 $9C $FF
    or   [hl]                                     ;; 02:4FEC $B6
    jr   z, .jr_4FF5                              ;; 02:4FED $28 $06

    ld   hl, wConsecutiveStepsCount               ;; 02:4FEF $21 $20 $C1
    inc  [hl]                                     ;; 02:4FF2 $34
    jr   jr_002_4FFA                              ;; 02:4FF3 $18 $05

.jr_4FF5
    ld   a, $03                                   ;; 02:4FF5 $3E $03
    ld   [wConsecutiveStepsCount], a              ;; 02:4FF7 $EA $20 $C1

jr_002_4FFA:
    ld   hl, JoypadToLinkDirection                ;; 02:4FFA $21 $05 $49
    add  hl, de                                   ;; 02:4FFD $19
    ld   a, [hl]                                  ;; 02:4FFE $7E
    cp   $0F                                      ;; 02:4FFF $FE $0F
    jr   z, jr_002_5005                           ;; 02:5001 $28 $02

    ldh  [hLinkDirection], a                      ;; 02:5003 $E0 $9E

jr_002_5005:
    call UpdateLinkWalkingAnimation               ;; 02:5005 $CD $50 $1A
    ldh  a, [hLinkInteractiveMotionBlocked]       ;; 02:5008 $F0 $A1
    and  a                                        ;; 02:500A $A7
    jr   z, .jr_5012                              ;; 02:500B $28 $05

    xor  a                                        ;; 02:500D $AF
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 02:500E $E0 $A1
    jr   jr_002_5015                              ;; 02:5010 $18 $03

.jr_5012
    call func_002_44AD                            ;; 02:5012 $CD $AD $44

jr_002_5015:
    call func_002_753A                            ;; 02:5015 $CD $3A $75
    ldh  a, [hLinkPhysicsModifier]                ;; 02:5018 $F0 $9C
    and  a                                        ;; 02:501A $A7
    jr   z, .return                               ;; 02:501B $28 $5C

    ldh  a, [hLinkCountdown]                      ;; 02:501D $F0 $B7
    and  a                                        ;; 02:501F $A7
    jr   nz, .jr_002_5024                         ;; 02:5020 $20 $02

    ldh  [hLinkPhysicsModifier], a                ;; 02:5022 $E0 $9C

.jr_002_5024
    ;
    ; Spawn a piece of heart hidden in water if needed
    ;

    ldh  a, [hMapId]                              ;; 02:5024 $F0 $F7
    and  a                                        ;; 02:5026 $A7
    jr   z, .overworld                            ;; 02:5027 $28 $0C

    cp   MAP_CAVE_WATER                           ;; 02:5029 $FE $1F
    jr   nz, .jr_002_507A                         ;; 02:502B $20 $4D

    ldh  a, [hMapRoom]                            ;; 02:502D $F0 $F6
    cp   ROOM_INDOOR_A_WATER_FLOODED_GROTTO       ;; 02:502F $FE $F2
    jr   nz, .return                              ;; 02:5031 $20 $46

    jr   .roomHasSunkPieceOfHeart                 ;; 02:5033 $18 $06

.overworld
    ldh  a, [hMapRoom]                            ;; 02:5035 $F0 $F6
    cp   ROOM_OW_KANALET_MOAT_HEARTPIECE          ;; 02:5037 $FE $78
    jr   nz, .return                              ;; 02:5039 $20 $3E

.roomHasSunkPieceOfHeart
    ldh  a, [hLinkPositionY]                      ;; 02:503B $F0 $99
    sub  $50                                      ;; 02:503D $D6 $50
    add  $08                                      ;; 02:503F $C6 $08
    cp   $10                                      ;; 02:5041 $FE $10
    jr   nc, .done                                ;; 02:5043 $30 $5D

    ldh  a, [hLinkPositionX]                      ;; 02:5045 $F0 $98
    sub  $58                                      ;; 02:5047 $D6 $58
    add  $08                                      ;; 02:5049 $C6 $08
    cp   $10                                      ;; 02:504B $FE $10
    jr   nc, .done                                ;; 02:504D $30 $53

    ld   hl, hRoomStatus                          ;; 02:504F $21 $F8 $FF
    bit  5, [hl]                                  ;; 02:5052 $CB $6E
    jr   nz, .return                              ;; 02:5054 $20 $23

    set  5, [hl]                                  ;; 02:5056 $CB $EE
    ld   a, ENTITY_HEART_PIECE                    ;; 02:5058 $3E $35
    call SpawnNewEntity_trampoline                ;; 02:505A $CD $86 $3B
    jr   c, .return                               ;; 02:505D $38 $1A

    ldh  a, [hLinkPositionX]                      ;; 02:505F $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 02:5061 $21 $00 $C2
    add  hl, de                                   ;; 02:5064 $19
    ld   [hl], a                                  ;; 02:5065 $77
    ldh  a, [hLinkPositionY]                      ;; 02:5066 $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 02:5068 $21 $10 $C2
    add  hl, de                                   ;; 02:506B $19
    ld   [hl], a                                  ;; 02:506C $77
    ld   hl, wEntitiesPosZTable                   ;; 02:506D $21 $10 $C3
    add  hl, de                                   ;; 02:5070 $19
    ld   [hl], $03                                ;; 02:5071 $36 $03
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 02:5073 $21 $40 $C3
    add  hl, de                                   ;; 02:5076 $19
    res  ENTITY_PHYSICS_B_SHADOW, [hl]            ;; 02:5077 $CB $A6

.return
    ret                                           ;; 02:5079 $C9

.jr_002_507A
    ldh  a, [hMapRoom]                            ;; 02:507A $F0 $F6
    cp   UNKNOWN_ROOM_8D                          ;; 02:507C $FE $8D
    jr   nz, .done                                ;; 02:507E $20 $22

    ldh  a, [hLinkPositionY]                      ;; 02:5080 $F0 $99
    sub  $50                                      ;; 02:5082 $D6 $50
    add  $08                                      ;; 02:5084 $C6 $08
    cp   $10                                      ;; 02:5086 $FE $10
    jr   nc, .done                                ;; 02:5088 $30 $18

    ldh  a, [hLinkPositionX]                      ;; 02:508A $F0 $98
    sub  $58                                      ;; 02:508C $D6 $58
    add  $08                                      ;; 02:508E $C6 $08
    cp   $10                                      ;; 02:5090 $FE $10
    jr   nc, .done                                ;; 02:5092 $30 $0E

    ldh  a, [hLinkPositionX]                      ;; 02:5094 $F0 $98
    ld   [wWarp0DestinationX], a                  ;; 02:5096 $EA $04 $D4
    ld   a, [wLinkMotionState]                    ;; 02:5099 $FA $1C $C1
    ld   [wD463], a                               ;; 02:509C $EA $63 $D4
    jp   ApplyMapFadeOutTransitionWithNoise       ;; 02:509F $C3 $7D $0C

.done
    ret                                           ;; 02:50A2 $C9

LinkMotionUnknownHandler::
    ld   a, $01                                   ;; 02:50A3 $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 02:50A5 $E0 $A1
    call UpdateFinalLinkPosition                  ;; 02:50A7 $CD $A8 $21
    call func_21E1                                ;; 02:50AA $CD $E1 $21
    ldh  a, [hLinkPositionX]                      ;; 02:50AD $F0 $98
    and  $F0                                      ;; 02:50AF $E6 $F0
    cp   $E0                                      ;; 02:50B1 $FE $E0
    jr   z, .jr_50BA                              ;; 02:50B3 $28 $05

    ldh  a, [hLinkPositionZ]                      ;; 02:50B5 $F0 $A2
    cp   $78                                      ;; 02:50B7 $FE $78
    ret  c                                        ;; 02:50B9 $D8

.jr_50BA
    call ApplyMapFadeOutTransition                ;; 02:50BA $CD $83 $0C
    call ClearLinkPositionIncrement               ;; 02:50BD $CD $8E $17
    ldh  [hLinkPositionZ], a                      ;; 02:50C0 $E0 $A2
    ldh  [hLinkVelocityZ], a                      ;; 02:50C2 $E0 $A3
    ld   a, $70                                   ;; 02:50C4 $3E $70
    ld   [wMapEntrancePositionZ], a               ;; 02:50C6 $EA $C8 $DB
    ret                                           ;; 02:50C9 $C9

LinkFallingDownAnimation::
    db  LINK_ANIMATION_STATE_FALLING_PIT_1
    db  LINK_ANIMATION_STATE_FALLING_PIT_2
    db  LINK_ANIMATION_STATE_FALLING_PIT_3
    db  LINK_ANIMATION_STATE_FALLING_PIT_3
    db  LINK_ANIMATION_STATE_HIDDEN
    db  LINK_ANIMATION_STATE_HIDDEN
    db  LINK_ANIMATION_STATE_HIDDEN
    db  LINK_ANIMATION_STATE_HIDDEN
    db  LINK_ANIMATION_STATE_HIDDEN
    db  LINK_ANIMATION_STATE_HIDDEN

LinkMotionFallingDownHandler::
    ld   a, $01                                   ;; 02:50D4 $3E $01
    ld   [wC167], a                               ;; 02:50D6 $EA $67 $C1
    ld   a, [wLinkAnimationFrame]                 ;; 02:50D9 $FA $98 $C1
    inc  a                                        ;; 02:50DC $3C
    ld   [wLinkAnimationFrame], a                 ;; 02:50DD $EA $98 $C1
    rra                                           ;; 02:50E0 $1F
    rra                                           ;; 02:50E1 $1F
    rra                                           ;; 02:50E2 $1F
    rra                                           ;; 02:50E3 $1F
    nop                                           ;; 02:50E4 $00
    and  $0F                                      ;; 02:50E5 $E6 $0F
    cp   $06                                      ;; 02:50E7 $FE $06
    jr   z, .jr_50F6                              ;; 02:50E9 $28 $0B

    ld   e, a                                     ;; 02:50EB $5F
    ld   d, $00                                   ;; 02:50EC $16 $00
    ld   hl, LinkFallingDownAnimation             ;; 02:50EE $21 $CA $50
    add  hl, de                                   ;; 02:50F1 $19
    ld   a, [hl]                                  ;; 02:50F2 $7E
    ldh  [hLinkAnimationState], a                 ;; 02:50F3 $E0 $9D
    ret                                           ;; 02:50F5 $C9

.jr_50F6
    ; reset sword parameter
    xor  a                                        ;; 02:50F6 $AF
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 02:50F7 $EA $3E $C1
    ld   [wIsUsingSpinAttack], a                  ;; 02:50FA $EA $21 $C1
    ld   [wSwordCharge], a                        ;; 02:50FD $EA $22 $C1
    call func_002_52D6                            ;; 02:5100 $CD $D6 $52
    ld   a, [wIsIndoor]                           ;; 02:5103 $FA $A5 $DB
    and  a                                        ;; 02:5106 $A7
    jr   nz, jr_002_512B                          ;; 02:5107 $20 $22

    ; overworld warp hole rooms
    ldh  a, [hMapRoom]                            ;; 02:5109 $F0 $F6
    cp   ROOM_OW_TURTLE_ROCK_WARP_HOLE            ;; 02:510B $FE $01
    jr   z, .jr_511B                              ;; 02:510D $28 $0C
    cp   ROOM_OW_UKUKU_PRAIRIE_WARP_HOLE          ;; 02:510F $FE $95
    jr   z, .jr_511B                              ;; 02:5111 $28 $08
    cp   ROOM_OW_WATERFALL_WARP_HOLE              ;; 02:5113 $FE $2C
    jr   z, .jr_511B                              ;; 02:5115 $28 $04
    cp   ROOM_OW_ANIMAL_VILLAGE_WARP_HOLE         ;; 02:5117 $FE $EC
    jr   nz, jr_002_512B                          ;; 02:5119 $20 $10

.jr_511B
    ld   a, LINK_MOTION_TELEPORT                  ;; 02:511B $3E $09
    ld   [wLinkMotionState], a                    ;; 02:511D $EA $1C $C1
    ; Set teleport animation duration
    ld   a, $40                                   ;; 02:5120 $3E $40
    ldh  [hLinkCountdown], a                      ;; 02:5122 $E0 $B7
    xor  a                                        ;; 02:5124 $AF
    ldh  [hLinkPhysicsModifier], a                ;; 02:5125 $E0 $9C
    dec  a                                        ;; 02:5127 $3D
    ldh  [hLinkAnimationState], a                 ;; 02:5128 $E0 $9D
    ret                                           ;; 02:512A $C9

jr_002_512B:
    ld   a, [wLinkFallingDownObjectPhysics]       ;; 02:512B $FA $CB $DB
    cp   OBJ_PHYSICS_PIT                          ;; 02:512E $FE $50
    jr   z, jr_002_516A                           ;; 02:5130 $28 $38

    cp   OBJ_PHYSICS_TRACTOR_DEVICE               ;; 02:5132 $FE $FF
    jr   z, jr_002_5155                           ;; 02:5134 $28 $1F

    ld   a, [wWarp0MapCategory]                   ;; 02:5136 $FA $01 $D4
    cp   $02                                      ;; 02:5139 $FE $02
    jr   nz, .jr_5145                             ;; 02:513B $20 $08

    ldh  a, [hLinkPositionY]                      ;; 02:513D $F0 $99
    ld   [wWarp0DestinationX], a                  ;; 02:513F $EA $04 $D4
    xor  a                                        ;; 02:5142 $AF
    jr   jr_002_515C                              ;; 02:5143 $18 $17

.jr_5145
    ldh  a, [hLinkPositionX]                      ;; 02:5145 $F0 $98
    and  $F0                                      ;; 02:5147 $E6 $F0
    add  $08                                      ;; 02:5149 $C6 $08
    ld   [wWarp0DestinationX], a                  ;; 02:514B $EA $04 $D4
    ldh  a, [hLinkPositionY]                      ;; 02:514E $F0 $99
    and  $F0                                      ;; 02:5150 $E6 $F0
    ld   [wWarp0DestinationY], a                  ;; 02:5152 $EA $05 $D4

jr_002_5155:
    ld   a, $01                                   ;; 02:5155 $3E $01
    ld   [wD475], a                               ;; 02:5157 $EA $75 $D4
    ld   a, $70                                   ;; 02:515A $3E $70

jr_002_515C:
    ld   [wMapEntrancePositionZ], a               ;; 02:515C $EA $C8 $DB
    call ClearLinkPositionIncrement               ;; 02:515F $CD $8E $17
    ldh  [hLinkVelocityZ], a                      ;; 02:5162 $E0 $A3
    ld   [wIsLinkInTheAir], a                     ;; 02:5164 $EA $46 $C1
    jp   ApplyMapFadeOutTransition                ;; 02:5167 $C3 $83 $0C

jr_002_516A:
    ld   a, [wIsIndoor]                           ;; 02:516A $FA $A5 $DB
    and  a                                        ;; 02:516D $A7
    jr   nz, .jr_5176                             ;; 02:516E $20 $06

    ldh  a, [hMapRoom]                            ;; 02:5170 $F0 $F6
    cp   UNKNOWN_ROOM_1E                          ;; 02:5172 $FE $1E
    jr   z, jr_002_5155                           ;; 02:5174 $28 $DF

.jr_5176
    ldh  a, [hMapId]                              ;; 02:5176 $F0 $F7
    cp   MAP_CAVE_B                               ;; 02:5178 $FE $0A
    jr   nz, jr_002_51AC                          ;; 02:517A $20 $30

    ldh  a, [hMapRoom]                            ; Underworld 2:
    cp   ROOM_INDOOR_B_MOUNTAIN_CAVE_ROOM_1       ; caves in the mountains where falling in a pit will spit you out of a waterfall
    jr   z, .WaterfallWarp                        ;
    cp   ROOM_INDOOR_B_MOUNTAIN_CAVE_ROOM_2       ;; 02:5182 $FE $7B
    jr   z, .WaterfallWarp                        ;; 02:5184 $28 $08
    cp   ROOM_INDOOR_B_MOUNTAIN_CAVE_ROOM_3       ;; 02:5186 $FE $7C
    jr   z, .WaterfallWarp                        ;; 02:5188 $28 $04
    cp   ROOM_INDOOR_B_MOUNTAIN_CAVE_ROOM_4       ;; 02:518A $FE $7D
    jr   nz, jr_002_51AC                          ;; 02:518C $20 $1E

.WaterfallWarp
    ld   a, $00                                   ;; 02:518E $3E $00
    ld   hl, wWarp0MapCategory                    ;; 02:5190 $21 $01 $D4
    ld   [hl+], a                                 ;; 02:5193 $22
    ld   a, $00                                   ;; 02:5194 $3E $00
    ld   [hl+], a                                 ;; 02:5196 $22
    ld   a, $1A                                   ;; 02:5197 $3E $1A
    ld   [hl+], a                                 ;; 02:5199 $22
    ld   a, $68                                   ;; 02:519A $3E $68
    ld   [hl+], a                                 ;; 02:519C $22
    ld   a, $56                                   ;; 02:519D $3E $56
    ld   [hl+], a                                 ;; 02:519F $22
    ld   a, $24                                   ;; 02:51A0 $3E $24
    ld   [wMapEntrancePositionZ], a               ;; 02:51A2 $EA $C8 $DB
    ld   a, DIRECTION_DOWN                        ;; 02:51A5 $3E $03
    ldh  [hLinkDirection], a                      ;; 02:51A7 $E0 $9E
    jp   ApplyMapFadeOutTransition                ;; 02:51A9 $C3 $83 $0C

jr_002_51AC:
    call label_002_52B9                           ;; 02:51AC $CD $B9 $52
    ld   a, [wSubtractHealthBuffer]               ;; 02:51AF $FA $94 $DB
    add  $04                                      ;; 02:51B2 $C6 $04
    ld   [wSubtractHealthBuffer], a               ;; 02:51B4 $EA $94 $DB
    xor  a                                        ;; 02:51B7 $AF
    ld   [wC167], a                               ;; 02:51B8 $EA $67 $C1
    ret                                           ;; 02:51BB $C9

HandleGotItemA::
    ld   a, [wDialogGotItemCountdown]             ;; 02:51BC $FA $AA $C1
    cp   $2E                                      ;; 02:51BF $FE $2E
    jr   nz, HandleGotItemB                       ;; 02:51C1 $20 $04

    ld   a, JINGLE_GOT_POWER_UP                   ;; 02:51C3 $3E $17
    ldh  [hJingle], a                             ;; 02:51C5 $E0 $F2

HandleGotItemB::
    call ResetSpinAttack                          ;; 02:51C7 $CD $AF $0C
    ; a = 0
    ; reset all states after spin attack
    ld   [wC16A], a                               ;; 02:51CA $EA $6A $C1
    ld   [wSwordAnimationState], a                ;; 02:51CD $EA $37 $C1
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 02:51D0 $EA $3E $C1
    call ApplyLinkMotionState                     ;; 02:51D3 $CD $94 $17
    call func_21E1                                ;; 02:51D6 $CD $E1 $21
    ldh  a, [hLinkVelocityZ]                      ;; 02:51D9 $F0 $A3
    sub  $02                                      ;; 02:51DB $D6 $02
    ldh  [hLinkVelocityZ], a                      ;; 02:51DD $E0 $A3
    ldh  a, [hLinkPositionZ]                      ;; 02:51DF $F0 $A2
    and  $80                                      ;; 02:51E1 $E6 $80
    jr   z, .jr_51ED                              ;; 02:51E3 $28 $08

    xor  a                                        ;; 02:51E5 $AF
    ldh  [hLinkPositionZ], a                      ;; 02:51E6 $E0 $A2
    ld   [wC149], a                               ;; 02:51E8 $EA $49 $C1
    ldh  [hLinkVelocityZ], a                      ;; 02:51EB $E0 $A3

.jr_51ED
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_6B       ;; 02:51ED $3E $6B
    ldh  [hLinkAnimationState], a                 ;; 02:51EF $E0 $9D
    ld   bc, wLinkOAMBuffer+$10                   ;; 02:51F1 $01 $10 $C0
    ldh  a, [hLinkPositionY]                      ;; 02:51F4 $F0 $99
    ld   hl, hLinkPositionZ                       ;; 02:51F6 $21 $A2 $FF
    sub  [hl]                                     ;; 02:51F9 $96
    ld   hl, wC13B                                ;; 02:51FA $21 $3B $C1
    add  [hl]                                     ;; 02:51FD $86
    sub  $10                                      ;; 02:51FE $D6 $10
    ldh  [hMultiPurpose0], a                      ;; 02:5200 $E0 $D7
    ld   a, [wDialogGotItem]                      ;; 02:5202 $FA $A9 $C1
    cp   DIALOG_GOT_PIECE_OF_POWER                ;; 02:5205 $FE $01
    jr   z, jr_002_524F                           ;; 02:5207 $28 $46

    ldh  a, [hMultiPurpose0]                      ;; 02:5209 $F0 $D7
    add  $02                                      ;; 02:520B $C6 $02
    ld   [bc], a                                  ;; 02:520D $02
    inc  bc                                       ;; 02:520E $03
    ldh  a, [hLinkPositionX]                      ;; 02:520F $F0 $98
    add  $00                                      ;; 02:5211 $C6 $00
    ld   [bc], a                                  ;; 02:5213 $02
    inc  bc                                       ;; 02:5214 $03
    ld   a, [wDialogGotItem]                      ;; 02:5215 $FA $A9 $C1
    ld   e, $AE                                   ;; 02:5218 $1E $AE
    cp   DIALOG_GOT_GUARDIAN_ACORN                ;; 02:521A $FE $05
    jr   z, .jr_522F                              ;; 02:521C $28 $11

    ld   e, $8E                                   ;; 02:521E $1E $8E
    cp   DIALOG_GOT_MAGIC_POWDER                  ;; 02:5220 $FE $03
    jr   z, jr_002_5244                           ;; 02:5222 $28 $20

    cp   DIALOG_GOT_ROD                           ;; 02:5224 $FE $04
    jr   nz, jr_002_5234                          ;; 02:5226 $20 $0C

    ld   e, $8C                                   ;; 02:5228 $1E $8C
    call func_002_524A                            ;; 02:522A $CD $4A $52
    jr   jr_002_5237                              ;; 02:522D $18 $08

.jr_522F
    call func_002_523A                            ;; 02:522F $CD $3A $52
    jr   jr_002_5237                              ;; 02:5232 $18 $03

jr_002_5234:
    call func_002_523F                            ;; 02:5234 $CD $3F $52

jr_002_5237:
    inc  bc                                       ;; 02:5237 $03
    ld   [bc], a                                  ;; 02:5238 $02
    ret                                           ;; 02:5239 $C9

func_002_523A::
    ld   a, e                                     ;; 02:523A $7B
    ld   [bc], a                                  ;; 02:523B $02
    ld   a, $14                                   ;; 02:523C $3E $14
    ret                                           ;; 02:523E $C9

func_002_523F::
    ld   a, e                                     ;; 02:523F $7B
    ld   [bc], a                                  ;; 02:5240 $02
    ld   a, $14                                   ;; 02:5241 $3E $14
    ret                                           ;; 02:5243 $C9

jr_002_5244:
    ld   a, e                                     ;; 02:5244 $7B
    ld   [bc], a                                  ;; 02:5245 $02
    ld   a, $16                                   ;; 02:5246 $3E $16
    jr   jr_002_5237                              ;; 02:5248 $18 $ED

func_002_524A::
    ld   a, e                                     ;; 02:524A $7B
    ld   [bc], a                                  ;; 02:524B $02
    ld   a, $10                                   ;; 02:524C $3E $10
    ret                                           ;; 02:524E $C9

jr_002_524F:
    ldh  a, [hLinkPositionX]                      ;; 02:524F $F0 $98
    sub  $08                                      ;; 02:5251 $D6 $08
    ldh  [hMultiPurpose1], a                      ;; 02:5253 $E0 $D8
    ldh  a, [hFrameCounter]                       ;; 02:5255 $F0 $E7
    rla                                           ;; 02:5257 $17
    rla                                           ;; 02:5258 $17
    and  $10                                      ;; 02:5259 $E6 $10
    ldh  [hMultiPurpose3], a                      ;; 02:525B $E0 $DA
    xor  a                                        ;; 02:525D $AF
    ld   h, a                                     ;; 02:525E $67
    ld   l, a                                     ;; 02:525F $6F
    ld   a, $06                                   ;; 02:5260 $3E $06
    ldh  [hMultiPurpose2], a                      ;; 02:5262 $E0 $D9
    jp   func_1819                                ;; 02:5264 $C3 $19 $18

LinkMotionRecoverHandler::
    call ResetSpinAttack                          ;; 02:5267 $CD $AF $0C
    call ClearLinkPositionIncrement               ;; 02:526A $CD $8E $17
    ldh  a, [hLinkCountdown]                      ;; 02:526D $F0 $B7
    and  a                                        ;; 02:526F $A7
    jr   nz, jr_002_529F                          ;; 02:5270 $20 $2D
    ld   [wC167], a                               ;; 02:5272 $EA $67 $C1

    ldh  a, [hLinkPhysicsModifier]                ;; 02:5275 $F0 $9C
    cp   $06                                      ;; 02:5277 $FE $06
    jr   nz, .reduceHealthEnd                     ;; 02:5279 $20 $08
    ld   a, [wSubtractHealthBuffer]               ;; 02:527B $FA $94 $DB
    add  $04                                      ;; 02:527E $C6 $04
    ld   [wSubtractHealthBuffer], a               ;; 02:5280 $EA $94 $DB
.reduceHealthEnd

    ; Clear hLinkPhysicsModifier
    xor  a                                        ;; 02:5283 $AF
    ldh  [hLinkPhysicsModifier], a                ;; 02:5284 $E0 $9C

    ; If on Angler's Tunnel entrance room…
    ld   a, [wIsIndoor]                           ;; 02:5286 $FA $A5 $DB
    and  a                                        ;; 02:5289 $A7
    jr   nz, .anglersTunnelEntranceEnd            ;; 02:528A $20 $10

    ldh  a, [hMapRoom]                            ;; 02:528C $F0 $F6
    cp   ROOM_OW_ANGLERS_TUNNEL_ENTRANCE          ;; 02:528E $FE $2B
    jr   nz, .anglersTunnelEntranceEnd            ;; 02:5290 $20 $0A

    ; … position Link at a specific location
    ld   a, $48                                   ;; 02:5292 $3E $48
    ld   [wLinkMapEntryPositionX], a              ;; 02:5294 $EA $B1 $DB
    ld   a, $30                                   ;; 02:5297 $3E $30
    ld   [wLinkMapEntryPositionY], a              ;; 02:5299 $EA $B2 $DB
.anglersTunnelEntranceEnd

    jp   label_002_52B9                           ;; 02:529C $C3 $B9 $52

jr_002_529F:
    ld   e, LINK_ANIMATION_STATE_HIDDEN           ;; 02:529F $1E $FF
    ldh  a, [hLinkCountdown]                      ;; 02:52A1 $F0 $B7
    cp   $30                                      ;; 02:52A3 $FE $30
    jr   c, .jr_002_52B5                          ;; 02:52A5 $38 $0E

    ld   e, LINK_ANIMATION_STATE_HOLD_SWIMMING_2  ;; 02:52A7 $1E $4E
    cp   $40                                      ;; 02:52A9 $FE $40
    jr   c, .jr_002_52B5                          ;; 02:52AB $38 $08

    jr   nz, .jr_002_52B3                         ;; 02:52AD $20 $04

    ld   a, NOISE_SFX_SPIN_ATTACK                 ;; 02:52AF $3E $03
    ldh  [hWaveSfx], a                            ;; 02:52B1 $E0 $F3

.jr_002_52B3
    ld   e, LINK_ANIMATION_STATE_HOLD_SWIMMING_1_DOWN ;; 02:52B3 $1E $4C

.jr_002_52B5
    ld   a, e                                     ;; 02:52B5 $7B
    ldh  [hLinkAnimationState], a                 ;; 02:52B6 $E0 $9D
    ret                                           ;; 02:52B8 $C9

label_002_52B9:
    ld   a, $40                                   ;; 02:52B9 $3E $40
    ld   [wInvincibilityCounter], a               ;; 02:52BB $EA $C7 $DB
    ld   a, [wLinkMapEntryPositionX]              ;; 02:52BE $FA $B1 $DB
    ldh  [hLinkPositionX], a                      ;; 02:52C1 $E0 $98
    ldh  [hLinkFinalPositionX], a                 ;; 02:52C3 $E0 $9F
    ld   a, [wLinkMapEntryPositionY]              ;; 02:52C5 $FA $B2 $DB
    ldh  [hLinkPositionY], a                      ;; 02:52C8 $E0 $99
    ldh  [hLinkFinalPositionY], a                 ;; 02:52CA $E0 $A0
    ld   hl, hLinkPositionZ                       ;; 02:52CC $21 $A2 $FF
    sub  [hl]                                     ;; 02:52CF $96
    ld   [wC145], a                               ;; 02:52D0 $EA $45 $C1
    call func_002_4EDD                            ;; 02:52D3 $CD $DD $4E

func_002_52D6::
    ldh  a, [hStaircase]                          ;; 02:52D6 $F0 $AC
    and  a                                        ;; 02:52D8 $A7
    jr   z, .return                               ;; 02:52D9 $28 $04

    ld   a, STAIRCASE_INACTIVE                    ;; 02:52DB $3E $01
    ldh  [hStaircase], a                          ;; 02:52DD $E0 $AC

.return
    ret                                           ;; 02:52DF $C9

; convert Link's view direction to ???
LinkDirectionTohMultiPurpose1::
    ;   right   left    up      down
    db  $0D,    $F3,    $00,    $FF
    db  $08,    $F8,    $0C,    $F5

; convert Link's view direction to ???
LinkDirectionTohMultiPurpose0::
    ;   right   left    up      down
    db  $00,    $00,    $F3,    $0E
    db  $F3,    $F3,    $FC,    $00

; convert Link's view direction to ???
LinkDirectionTohMultiPurpose2_3::
    ;   right       left        up          down
    db  $06, $08,   $08, $06,   $04, $FF,   $FF, $04
    db  $04, $FF,   $FF, $04,   $06, $08,   $08, $06

; convert Link's view direction to ???
LinkDirectionTohMultiPurpose4_5::
    ;   right       left        up          down
    db  $02, $02,   $22, $22,   $22, $02,   $02, $42
    db  $22, $02,   $02, $22,   $02, $02,   $22, $22

label_002_5310::
    ; TODO label and also add row comment for data above
    ld   a, [wLinkAttackStepAnimationCountdown]   ;; 02:5310 $FA $9B $C1
    and  ATTACK_STEP_DURATION_MASK                ;; 02:5313 $E6 $7F
    cp   $08                                      ;; 02:5315 $FE $08
    ldh  a, [hLinkDirection]                      ;; 02:5317 $F0 $9E
    jr   c, .skipOffset                           ;; 02:5319 $38 $02

    add  $04                                      ;; 02:531B $C6 $04

.skipOffset
    ld   e, a                                     ;; 02:531D $5F
    ld   d, $00                                   ;; 02:531E $16 $00
    ld   hl, LinkDirectionTohMultiPurpose0        ;; 02:5320 $21 $E8 $52
    add  hl, de                                   ;; 02:5323 $19
    ld   a, [hl]                                  ;; 02:5324 $7E
    ldh  [hMultiPurpose0], a                      ;; 02:5325 $E0 $D7
    ld   hl, LinkDirectionTohMultiPurpose1        ;; 02:5327 $21 $E0 $52
    add  hl, de                                   ;; 02:532A $19
    ld   a, [hl]                                  ;; 02:532B $7E
    ldh  [hMultiPurpose1], a                      ;; 02:532C $E0 $D8
    sla  e                                        ;; 02:532E $CB $23
    ld   hl, LinkDirectionTohMultiPurpose2_3      ;; 02:5330 $21 $F0 $52
    add  hl, de                                   ;; 02:5333 $19
    ld   a, [hl+]                                 ;; 02:5334 $2A
    ldh  [hMultiPurpose2], a                      ;; 02:5335 $E0 $D9
    ld   a, [hl]                                  ;; 02:5337 $7E
    ldh  [hMultiPurpose3], a                      ;; 02:5338 $E0 $DA
    ld   hl, LinkDirectionTohMultiPurpose4_5      ;; 02:533A $21 $00 $53
    add  hl, de                                   ;; 02:533D $19
    ld   a, [hl+]                                 ;; 02:533E $2A
    ldh  [hMultiPurpose4], a                      ;; 02:533F $E0 $DB
    ld   a, [hl]                                  ;; 02:5341 $7E
    ldh  [hMultiPurpose5], a                      ;; 02:5342 $E0 $DC
    ld   de, wLinkOAMBuffer+$10                   ;; 02:5344 $11 $10 $C0
    ld   bc, wLinkOAMBuffer+$14                   ;; 02:5347 $01 $14 $C0
    ld   a, [wC145]                               ;; 02:534A $FA $45 $C1
    ld   hl, wC13B                                ;; 02:534D $21 $3B $C1
    add  [hl]                                     ;; 02:5350 $86
    ld   hl, hMultiPurpose0                       ;; 02:5351 $21 $D7 $FF
    add  [hl]                                     ;; 02:5354 $86
    ld   [hl], a                                  ;; 02:5355 $77
    ldh  a, [hMultiPurpose2]                      ;; 02:5356 $F0 $D9
    cp   $FF                                      ;; 02:5358 $FE $FF
    jr   z, .jr_535E                              ;; 02:535A $28 $02

    ld   a, [hl]                                  ;; 02:535C $7E
    ld   [de], a                                  ;; 02:535D $12

.jr_535E::
    ldh  a, [hMultiPurpose3]                      ;; 02:535E $F0 $DA
    cp   $FF                                      ;; 02:5360 $FE $FF
    jr   z, .jr_5366                              ;; 02:5362 $28 $02

    ld   a, [hl]                                  ;; 02:5364 $7E
    ld   [bc], a                                  ;; 02:5365 $02

.jr_5366::
    inc  de                                       ;; 02:5366 $13
    inc  bc                                       ;; 02:5367 $03
    ldh  a, [hMultiPurpose1]                      ;; 02:5368 $F0 $D8
    ld   hl, hLinkPositionX                       ;; 02:536A $21 $98 $FF
    add  [hl]                                     ;; 02:536D $86
    ld   [de], a                                  ;; 02:536E $12
    add  $08                                      ;; 02:536F $C6 $08
    ld   [bc], a                                  ;; 02:5371 $02
    inc  de                                       ;; 02:5372 $13
    inc  bc                                       ;; 02:5373 $03
    ldh  a, [hMultiPurpose2]                      ;; 02:5374 $F0 $D9
    ld   [de], a                                  ;; 02:5376 $12
    ldh  a, [hMultiPurpose3]                      ;; 02:5377 $F0 $DA
    ld   [bc], a                                  ;; 02:5379 $02
    inc  de                                       ;; 02:537A $13
    inc  bc                                       ;; 02:537B $03
    ldh  a, [hMultiPurpose4]                      ;; 02:537C $F0 $DB
    ld   [de], a                                  ;; 02:537E $12
    ldh  a, [hMultiPurpose5]                      ;; 02:537F $F0 $DC
    ld   [bc], a                                  ;; 02:5381 $02
    ret                                           ;; 02:5382 $C9

LinkDirectionToEntitiesPositionX::
.right: db   4
.left:  db  -4
.up:    db  -4
.down:  db   4

LinkDirectionToEntitiesPositionY::
.right: db   4
.left:  db   4
.up:    db  -4
.down:  db   4

label_002_538B:
    ldh  a, [hLinkDirection]                      ;; 02:538B $F0 $9E
    ld   c, a                                     ;; 02:538D $4F
    ld   b, $00                                   ;; 02:538E $06 $00
    ld   hl, LinkDirectionToEntitiesPositionX     ;; 02:5390 $21 $83 $53
    add  hl, bc                                   ;; 02:5393 $09
    ldh  a, [hLinkPositionX]                      ;; 02:5394 $F0 $98
    add  [hl]                                     ;; 02:5396 $86
    ld   hl, wEntitiesPosXTable                   ;; 02:5397 $21 $00 $C2
    add  hl, de                                   ;; 02:539A $19
    ld   [hl], a                                  ;; 02:539B $77
    ld   hl, LinkDirectionToEntitiesPositionY     ;; 02:539C $21 $87 $53
    add  hl, bc                                   ;; 02:539F $09
    ldh  a, [hLinkPositionY]                      ;; 02:53A0 $F0 $99
    add  [hl]                                     ;; 02:53A2 $86
    ld   hl, wEntitiesPosYTable                   ;; 02:53A3 $21 $10 $C2
    add  hl, de                                   ;; 02:53A6 $19
    ld   [hl], a                                  ;; 02:53A7 $77
    ld   hl, wEntitiesSpriteVariantTable          ;; 02:53A8 $21 $B0 $C3
    add  hl, de                                   ;; 02:53AB $19
    ld   [hl], d                                  ;; 02:53AC $72
    jp   label_140F                               ;; 02:53AD $C3 $0F $14

; Try to open a locked door with a small key
TryOpenLockedDoor::
    push bc                                       ;; 02:53B0 $C5
    push de                                       ;; 02:53B1 $D5
    ldh  a, [hMultiPurposeG]                      ;; 02:53B2 $F0 $E8
    cp   $40                                      ;; 02:53B4 $FE $40
    jr   z, .spawnPushedBlock                     ;; 02:53B6 $28 $43

    ; If the player doesn't have a small key for this dungeon,
    ; return.
    ld   a, [wSmallKeysCount]                     ;; 02:53B8 $FA $D0 $DB
    and  a                                        ;; 02:53BB $A7
    jr   z, .return                               ;; 02:53BC $28 $5F

    ;
    ; Open locked door with a small key
    ;

    ; Decrease the player small key count
    dec  a                                        ;; 02:53BE $3D
    ld   [wSmallKeysCount], a                     ;; 02:53BF $EA $D0 $DB
    call SynchronizeDungeonsItemFlags_trampoline  ;; 02:53C2 $CD $02 $28
    call EnqueueDoorUnlockedSfx                   ;; 02:53C5 $CD $20 $54

    ; Mark the room as opened
    call GetRoomStatusAddress                     ;; 02:53C8 $CD $9F $5B
    ld   a, [hl]                                  ;; 02:53CB $7E
    or   ROOM_STATUS_EVENT_3                      ;; 02:53CC $F6 $40
    ld   [hl], a                                  ;; 02:53CE $77
    ldh  [hRoomStatus], a                         ;; 02:53CF $E0 $F8
    ldh  a, [hMultiPurpose4]                      ;; 02:53D1 $F0 $DB
    and  $F0                                      ;; 02:53D3 $E6 $F0
    ldh  [hIntersectedObjectLeft], a              ;; 02:53D5 $E0 $CE
    swap a                                        ;; 02:53D7 $CB $37
    ld   e, a                                     ;; 02:53D9 $5F
    ldh  a, [hMultiPurpose5]                      ;; 02:53DA $F0 $DC
    and  $F0                                      ;; 02:53DC $E6 $F0
    ldh  [hIntersectedObjectTop], a               ;; 02:53DE $E0 $CD
    or   e                                        ;; 02:53E0 $B3
    ld   e, a                                     ;; 02:53E1 $5F
    ld   d, $00                                   ;; 02:53E2 $16 $00

    call func_014_5526_trampoline                 ;; 02:53E4 $CD $78 $21
    ldh  a, [hIntersectedObjectLeft]              ;; 02:53E7 $F0 $CE
    add  $08                                      ;; 02:53E9 $C6 $08
    ldh  [hMultiPurpose0], a                      ;; 02:53EB $E0 $D7
    ldh  a, [hIntersectedObjectTop]               ;; 02:53ED $F0 $CD
    add  $10                                      ;; 02:53EF $C6 $10
    ldh  [hMultiPurpose1], a                      ;; 02:53F1 $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ;; 02:53F3 $3E $02
    call AddTranscientVfx                         ;; 02:53F5 $CD $C7 $0C
    jp   .return                                  ;; 02:53F8 $C3 $1D $54

.spawnPushedBlock
    ld   a, ENTITY_PUSHED_BLOCK                   ;; 02:53FB $3E $06
    call SpawnNewEntity_trampoline                ;; 02:53FD $CD $86 $3B
    jr   c, .return                               ;; 02:5400 $38 $1B

    ld   hl, wEntitiesStatusTable                 ;; 02:5402 $21 $80 $C2
    add  hl, de                                   ;; 02:5405 $19
    dec  [hl]                                     ;; 02:5406 $35
    ldh  a, [hMultiPurpose4]                      ;; 02:5407 $F0 $DB
    and  $F0                                      ;; 02:5409 $E6 $F0
    add  $08                                      ;; 02:540B $C6 $08
    ld   hl, wEntitiesPosXTable                   ;; 02:540D $21 $00 $C2
    add  hl, de                                   ;; 02:5410 $19
    ld   [hl], a                                  ;; 02:5411 $77
    ldh  a, [hMultiPurpose5]                      ;; 02:5412 $F0 $DC
    and  $F0                                      ;; 02:5414 $E6 $F0
    add  $10                                      ;; 02:5416 $C6 $10
    ld   hl, wEntitiesPosYTable                   ;; 02:5418 $21 $10 $C2
    add  hl, de                                   ;; 02:541B $19
    ld   [hl], a                                  ;; 02:541C $77

.return
    pop  de                                       ;; 02:541D $D1
    pop  bc                                       ;; 02:541E $C1
    ret                                           ;; 02:541F $C9

EnqueueDoorUnlockedSfx::
    ld   a, NOISE_SFX_DOOR_UNLOCKED               ;; 02:5420 $3E $04
    ldh  [hNoiseSfx], a                           ;; 02:5422 $E0 $F4
    ret                                           ;; 02:5424 $C9

label_002_5425:
    push bc                                       ;; 02:5425 $C5
    ldh  a, [hMapId]                              ;; 02:5426 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 02:5428 $FE $FF
    ld   a, ENTITY_KEY_DROP_POINT                 ;; 02:542A $3E $30
    jr   z, .spawnEntity                          ;; 02:542C $28 $0A

    ldh  a, [hMapId]                              ;; 02:542E $F0 $F7
    cp   MAP_CAVE_B                               ;; 02:5430 $FE $0A
    ld   a, ENTITY_KEY_DROP_POINT                 ;; 02:5432 $3E $30
    jr   c, .spawnEntity                          ;; 02:5434 $38 $02
    ld   a, ENTITY_HIDING_SLIME_KEY               ;; 02:5436 $3E $3C

.spawnEntity
    call SpawnNewEntity_trampoline                ;; 02:5438 $CD $86 $3B
    jr   c, jr_002_546F                           ;; 02:543B $38 $32

    ld   hl, wEntitiesPosXTable                   ;; 02:543D $21 $00 $C2
    add  hl, de                                   ;; 02:5440 $19
    ld   [hl], $28                                ;; 02:5441 $36 $28
    ldh  a, [hMapId]                              ;; 02:5443 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 02:5445 $FE $FF
    jr   nz, .jr_5453                             ;; 02:5447 $20 $0A

    ld   [hl], $48                                ;; 02:5449 $36 $48
    ldh  a, [hMapRoom]                            ;; 02:544B $F0 $F6
    cp   ROOM_OW_MARIN_BRIDGE                     ;; 02:544D $FE $08
    jr   nz, .jr_5453                             ;; 02:544F $20 $02

    ld   [hl], $58                                ;; 02:5451 $36 $58

.jr_5453
    ld   hl, wEntitiesPosYTable                   ;; 02:5453 $21 $10 $C2
    add  hl, de                                   ;; 02:5456 $19
    ld   [hl], $3C                                ;; 02:5457 $36 $3C
    ldh  a, [hMapId]                              ;; 02:5459 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 02:545B $FE $FF
    jr   nz, .jr_5469                             ;; 02:545D $20 $0A

    ld   [hl], $3C                                ;; 02:545F $36 $3C
    ldh  a, [hMapRoom]                            ;; 02:5461 $F0 $F6
    cp   ROOM_OW_MARIN_BRIDGE                     ;; 02:5463 $FE $08
    jr   nz, .jr_5469                             ;; 02:5465 $20 $02

    ld   [hl], $3C                                ;; 02:5467 $36 $3C

.jr_5469
    ld   hl, wEntitiesPosZTable                   ;; 02:5469 $21 $10 $C3
    add  hl, de                                   ;; 02:546C $19
    ld   [hl], $70                                ;; 02:546D $36 $70

jr_002_546F:
    pop  bc                                       ;; 02:546F $C1
    ret                                           ;; 02:5470 $C9

;
; POI: https://tcrf.net/The_Legend_of_Zelda:_Link%27s_Awakening#Pre-set_Warps
; A list of room ID and submaps for use with the dummied-out B + SELECT warp code.
; Many of these make no sense - it's likely this was forgotten about early on,
; and suggests the maps were shuffled around at one point
;
; List of warps:
; Bottle Grotto   $30  - The darkened room 1N1W from the entrance. Spawns you between two traps.
; Bottle Grotto   $33  - The first room with crystal switches, 1N1E of the entrance.
; Catfish's Maw   $81  - On top of a Stalfos in the room you need to make a square with blocks in.
; Tail Cave       $01  - The bottom room of the left edge of the map (with the staircase)
; Bottle Grotto   $28  - Hinox miniboss room.
; Key Cavern      $56  - The + shape room with 4 locked doors.
; Angler's Tunnel $68  - Nondescript room
; Catfish's Maw   $87  - Nondescript room
; Face Shrine     $B3  - You spawn in a row of solid statues and can only move south
; Eagle's Tower   $E6  - The interesting parts: Eagle's Tower takes up rooms $01~$2E,
;                        on the second underworld (201-22E)! Possibly done before
;                        Eagle's Tower was moved to the second underworld area?
;                        Failing to find you the game dumps you in some side-view area
; Turtle Rock     $0A  - Turtle Rock occupies $30-$6B. Failing to find this room on
;                        the submap, the game dumps you off the map, in room $00
;
DebugWarpRooms::
    db   $30    ; MAP_BOTTLE_GROTTO
    db   $33    ; MAP_BOTTLE_GROTTO
    db   $81    ; MAP_CATFISHS_MAW
    db   $01    ; MAP_TAIL_CAVE
    db   $28    ; MAP_BOTTLE_GROTTO
    db   $56    ; MAP_KEY_CAVERN
    db   $68    ; MAP_ANGLERS_TUNNEL
    db   $87    ; MAP_CATFISHS_MAW
    db   $B3    ; MAP_FACE_SHRINE
    db   $E6    ; MAP_EAGLES_TOWER
    db   $0A    ; MAP_TURTLE_ROCK

DebugWarpMaps::
    db   MAP_BOTTLE_GROTTO
    db   MAP_BOTTLE_GROTTO
    db   MAP_CATFISHS_MAW
    db   MAP_TAIL_CAVE
    db   MAP_BOTTLE_GROTTO
    db   MAP_KEY_CAVERN
    db   MAP_ANGLERS_TUNNEL
    db   MAP_CATFISHS_MAW
    db   MAP_FACE_SHRINE
    db   MAP_EAGLES_TOWER
    db   MAP_TURTLE_ROCK

label_002_5487:
    xor  a                                        ;; 02:5487 $AF
    ld   [wIndoorARoomStatus], a                  ;; 02:5488 $EA $00 $D9
    ld   [wIndoorBRoomStatus], a                  ;; 02:548B $EA $00 $DA
    ld   a, [wDialogCooldown]                     ;; 02:548E $FA $34 $C1
    and  a                                        ;; 02:5491 $A7
    jr   z, .decrementPhotoAlbumCooldown          ;; 02:5492 $28 $04

    dec  a                                        ;; 02:5494 $3D
    ld   [wDialogCooldown], a                     ;; 02:5495 $EA $34 $C1

.decrementPhotoAlbumCooldown
    ld   a, [wPhotoAlbumCooldown]                 ;; 02:5498 $FA $05 $DE
    and  a                                        ;; 02:549B $A7
    jr   z, .jr_54A2                              ;; 02:549C $28 $04

    dec  a                                        ;; 02:549E $3D
    ld   [wPhotoAlbumCooldown], a                 ;; 02:549F $EA $05 $DE

.jr_54A2
    ldh  a, [hPressedButtonsMask]                 ;; 02:54A2 $F0 $CB
    and  J_B                                      ;; 02:54A4 $E6 $20

.jr_54A6
    jr   z, renderTranscientVFXs                  ;; 02:54A6 $28 $3C

    ldh  a, [hJoypadState]                        ;; 02:54A8 $F0 $CC
    and  J_SELECT                               ; POI: Debug tool to warp around to various places
    jr   renderTranscientVFXs                   ; when holding B and pushing SELECT
    ;jr   z, renderTranscientVFXs               ; Should be this

    ld   a, $01                                   ;; 02:54AE $3E $01
    ld   [wWarp0MapCategory], a                   ;; 02:54B0 $EA $01 $D4
    ld   a, [wDebugWarpIndex]                     ;; 02:54B3 $FA $79 $D4
    ld   e, a                                     ;; 02:54B6 $5F
    inc  a                                        ;; 02:54B7 $3C
    cp   $0B                                      ;; 02:54B8 $FE $0B
    jr   c, .jr_54BD                              ;; 02:54BA $38 $01

    xor  a                                        ;; 02:54BC $AF

.jr_54BD
    ld   [wDebugWarpIndex], a                     ;; 02:54BD $EA $79 $D4
    ld   d, $00                                   ;; 02:54C0 $16 $00
    ld   hl, DebugWarpRooms                       ;; 02:54C2 $21 $71 $54
    add  hl, de                                   ;; 02:54C5 $19
    ld   a, [hl]                                  ;; 02:54C6 $7E
    ld   [wWarp0Room], a                          ;; 02:54C7 $EA $03 $D4
    ld   hl, DebugWarpMaps                        ;; 02:54CA $21 $7C $54
    add  hl, de                                   ;; 02:54CD $19
    ld   a, [hl]                                  ;; 02:54CE $7E
    ld   [wWarp0Map], a                           ;; 02:54CF $EA $02 $D4
    ld   a, $50                                   ;; 02:54D2 $3E $50
    ld   [wWarp0DestinationX], a                  ;; 02:54D4 $EA $04 $D4
    ld   a, $70                                   ;; 02:54D7 $3E $70
    ld   [wWarp0DestinationY], a                  ;; 02:54D9 $EA $05 $D4
    ld   hl, hJingle                              ;; 02:54DC $21 $F2 $FF
    ld   [hl], JINGLE_PUZZLE_SOLVED               ;; 02:54DF $36 $02
    jp   ApplyMapFadeOutTransitionWithNoise       ;; 02:54E1 $C3 $7D $0C

renderTranscientVFXs:
    ld   b, $00                                   ;; 02:54E4 $06 $00
    ld   c, $0F                                   ;; 02:54E6 $0E $0F

    ; For each transcient vfx…
.transcientVFXsLoop
    ld   a, c                                     ;; 02:54E8 $79
    ld   [wActiveEntityIndex], a                  ;; 02:54E9 $EA $23 $C1

    ; If the VFX type is not zero, render it.
    ld   hl, wTranscientVfxTypeTable              ;; 02:54EC $21 $10 $C5
    add  hl, bc                                   ;; 02:54EF $09
    ld   a, [hl]                                  ;; 02:54F0 $7E
    and  a                                        ;; 02:54F1 $A7
    jr   z, .renderEnd                            ;; 02:54F2 $28 $03
    call RenderTranscientVfx                      ;; 02:54F4 $CD $67 $55
.renderEnd

    dec  c                                        ;; 02:54F7 $0D
    ld   a, c                                     ;; 02:54F8 $79
    cp   -1                                       ;; 02:54F9 $FE $FF
    jr   nz, .transcientVFXsLoop                  ;; 02:54FB $20 $EB

    ld   a, [wRoomTransitionState]                ;; 02:54FD $FA $24 $C1
    and  a                                        ;; 02:5500 $A7
    jr   nz, .return                              ;; 02:5501 $20 $26

    ldh  a, [hStaircase]                          ;; 02:5503 $F0 $AC
    and  a                                        ;; 02:5505 $A7
    jr   z, .return                               ;; 02:5506 $28 $21

    cp   STAIRCASE_INACTIVE                       ;; 02:5508 $FE $01
    jr   nz, staircaseIsActive                    ;; 02:550A $20 $1E

    ;
    ; If the player left an inactive staircase, mark it as active
    ;

    ld   hl, hStaircasePosX                       ;; 02:550C $21 $AD $FF
    ldh  a, [hLinkPositionX]                      ;; 02:550F $F0 $98
    sub  [hl]                                     ;; 02:5511 $96
    add  $06                                      ;; 02:5512 $C6 $06
    cp   $0C                                      ;; 02:5514 $FE $0C
    jr   nc, .makeStaircaseActive                 ;; 02:5516 $30 $0C

    ld   hl, hStaircasePosY                       ;; 02:5518 $21 $AE $FF
    ldh  a, [hLinkPositionY]                      ;; 02:551B $F0 $99
    sub  [hl]                                     ;; 02:551D $96
    add  $06                                      ;; 02:551E $C6 $06
    cp   $0C                                      ;; 02:5520 $FE $0C
    jr   c, .return                               ;; 02:5522 $38 $05

.makeStaircaseActive
    ; hStaircase = STAIRCASE_ACTIVE
    ldh  a, [hStaircase]                          ;; 02:5524 $F0 $AC
    inc  a                                        ;; 02:5526 $3C
    ldh  [hStaircase], a                          ;; 02:5527 $E0 $AC

.return
    ret                                           ;; 02:5529 $C9

staircaseIsActive:
    ; Don't trigger staircase when jumping over it
    ldh  a, [hLinkPositionZ]                      ;; 02:552A $F0 $A2
    and  a                                        ;; 02:552C $A7
    jr   nz, .return                              ;; 02:552D $20 $37

    ; Don't trigger staircase if not over it
    ld   hl, hStaircasePosX                       ;; 02:552F $21 $AD $FF
    ldh  a, [hLinkPositionX]                      ;; 02:5532 $F0 $98
    sub  [hl]                                     ;; 02:5534 $96
    add  $05                                      ;; 02:5535 $C6 $05
    cp   $0A                                      ;; 02:5537 $FE $0A
    jr   nc, .return                              ;; 02:5539 $30 $2B

    ld   hl, hStaircasePosY                       ;; 02:553B $21 $AE $FF
    ldh  a, [hLinkPositionY]                      ;; 02:553E $F0 $99
    sub  [hl]                                     ;; 02:5540 $96
    add  $05                                      ;; 02:5541 $C6 $05
    cp   $0A                                      ;; 02:5543 $FE $0A
    jr   nc, .return                              ;; 02:5545 $30 $1F

    ; Don't trigger staircase when carrying an object
    ld   a, [wIsCarryingLiftedObject]             ;; 02:5547 $FA $5C $C1
    and  a                                        ;; 02:554A $A7
    jr   nz, .return                              ;; 02:554B $20 $19

    ; Don't trigger staircase when color dungeon entrance is not open
    ldh  a, [hMapRoom]                            ;; 02:554D $F0 $F6
    cp   ROOM_OW_COLOR_DUNGEON_ENTRANCE           ;; 02:554F $FE $77
    jr   nz, .colorDungeonEnd                     ;; 02:5551 $20 $0D

    ld   a, [wIsIndoor]                           ;; 02:5553 $FA $A5 $DB
    and  a                                        ;; 02:5556 $A7
    jr   nz, .colorDungeonEnd                     ;; 02:5557 $20 $07

    ld   a, [wColorDungonCorrectTombStones]       ;; 02:5559 $FA $D9 $DD
    cp   $80                                      ;; 02:555C $FE $80
    jr   nz, .return                              ;; 02:555E $20 $06
.colorDungeonEnd

    ; Trigger staircase warp
    call ApplyMapFadeOutTransitionWithSound       ;; 02:5560 $CD $89 $0C
    xor  a                                        ;; 02:5563 $AF
    ldh  [hStaircase], a                          ;; 02:5564 $E0 $AC

.return
    ret                                           ;; 02:5566 $C9

; Render a transcient visual effet.
; Inputs:
;   bc   effect index
RenderTranscientVfx::
    push af                                       ;; 02:5567 $F5
    ld   a, [wRoomTransitionState]                ;; 02:5568 $FA $24 $C1
    and  a                                        ;; 02:556B $A7
    jr   nz, .removeVfx                           ;; 02:556C $20 $0E

    ld   hl, wTranscientVfxCountdownTable         ;; 02:556E $21 $20 $C5
    add  hl, bc                                   ;; 02:5571 $09
    ld   a, [hl]                                  ;; 02:5572 $7E
    and  a                                        ;; 02:5573 $A7
    jr   z, .render                               ;; 02:5574 $28 $09

    ; Decrement the vfx countdown
    dec  a                                        ;; 02:5576 $3D
    ld   [hl], a                                  ;; 02:5577 $77
    ldh  [hMultiPurpose0], a                      ;; 02:5578 $E0 $D7
    ; if the VFX countdown reached zero, remove the effect
    jr   nz, .render                              ;; 02:557A $20 $03

.removeVfx
    call ClearTranscientVfx                       ;; 02:557C $CD $E6 $58

.render
    pop  af                                       ;; 02:557F $F1
    dec  a                                        ;; 02:5580 $3D
    JP_TABLE
._01 dw RenderTranscientWaterSplash               ;; 02:5582
._02 dw RenderTranscientPoof                      ;; 02:5584
._03 dw RenderTranscientPoof                      ;; 02:5586
._04 dw RenderTranscientPoof                      ;; 02:5588
._05 dw RenderTranscientSwordPoke                 ;; 02:558A
._06 dw RenderTranscientLaserBeam                 ;; 02:558C
._07 dw RenderTranscientMovingSparkle             ;; 02:558E
._08 dw RenderTranscientSmoke                     ;; 02:5590
._09 dw RenderTranscientRumble                    ;; 02:5592
._0A dw RenderTranscientLavaSplash                ;; 02:5594
._0B dw RenderTranscientPegasusDust               ;; 02:5596
._0C dw RenderTranscientPegasusSplash             ;; 02:5598
._0D dw RenderTranscientSwordBeam                 ;; 02:559A


Data_002_559C::
    db   $00, $00, $08, $20, $00, $08, $06, $20, $00, $00, $06, $00, $00, $08, $08, $00
    db   $00, $04, $04, $40, $00, $04, $04, $40, $00, $04, $04, $00, $00, $04, $04, $00

Data_002_55BC::
    db   $00, $00, $08, $30, $00, $08, $06, $30, $00, $00, $06, $10, $00, $08, $08, $10
    db   $00, $04, $04, $50, $00, $04, $04, $50, $00, $04, $04, $10, $00, $04, $04, $10

RenderTranscientSwordBeam::
    ldh  a, [hFrameCounter]                       ;; 02:55DC $F0 $E7
    xor  c                                        ;; 02:55DE $A9
    and  $01                                      ;; 02:55DF $E6 $01
    ret  z                                        ;; 02:55E1 $C8

    call func_002_58D0                            ;; 02:55E2 $CD $D0 $58
    ld   hl, wC590                                ;; 02:55E5 $21 $90 $C5
    add  hl, bc                                   ;; 02:55E8 $09
    ld   a, [hl]                                  ;; 02:55E9 $7E
    rla                                           ;; 02:55EA $17
    rla                                           ;; 02:55EB $17
    rla                                           ;; 02:55EC $17
    and  $F8                                      ;; 02:55ED $E6 $F8

.jr_55EF
    ld   e, a                                     ;; 02:55EF $5F
    ld   d, b                                     ;; 02:55F0 $50
    ld   hl, Data_002_559C                        ;; 02:55F1 $21 $9C $55
    ldh  a, [hFrameCounter]                       ;; 02:55F4 $F0 $E7
    and  $02                                      ;; 02:55F6 $E6 $02
    jr   z, .jr_55FD                              ;; 02:55F8 $28 $03

    ld   hl, Data_002_55BC                        ;; 02:55FA $21 $BC $55

.jr_55FD
    jp   label_002_583A                           ;; 02:55FD $C3 $3A $58

Data_002_5600::
    db   $F8, $00, $08

Data_002_5603::
    db   $10, $6C, $6E, $6E

Data_002_5607::
    db   $6C, $00, $00, $20, $20

RenderTranscientLavaSplash::
    call func_002_58D0                            ;; 02:560C $CD $D0 $58
    ld   a, [wOAMNextAvailableSlot]               ;; 02:560F $FA $C0 $C3
    ld   e, a                                     ;; 02:5612 $5F
    ld   d, $00                                   ;; 02:5613 $16 $00
    ld   hl, wDynamicOAMBuffer                    ;; 02:5615 $21 $30 $C0
    add  hl, de                                   ;; 02:5618 $19
    ld   e, l                                     ;; 02:5619 $5D
    ld   d, h                                     ;; 02:561A $54
    push bc                                       ;; 02:561B $C5
    ld   c, $04                                   ;; 02:561C $0E $04

.loop_561E
    ldh  a, [hMultiPurpose1]                      ;; 02:561E $F0 $D8
    ld   [de], a                                  ;; 02:5620 $12
    inc  de                                       ;; 02:5621 $13
    ldh  a, [hMultiPurpose2]                      ;; 02:5622 $F0 $D9
    ld   hl, Data_002_5600 - 1                    ;; 02:5624 $21 $FF $55
    add  hl, bc                                   ;; 02:5627 $09
    add  [hl]                                     ;; 02:5628 $86
    ld   [de], a                                  ;; 02:5629 $12
    inc  de                                       ;; 02:562A $13
    ld   hl, Data_002_5603                        ;; 02:562B $21 $03 $56
    add  hl, bc                                   ;; 02:562E $09
    ld   a, [hl]                                  ;; 02:562F $7E
    ld   [de], a                                  ;; 02:5630 $12
    inc  de                                       ;; 02:5631 $13
    ld   hl, Data_002_5607                        ;; 02:5632 $21 $07 $56
    add  hl, bc                                   ;; 02:5635 $09
    ld   a, [hl]                                  ;; 02:5636 $7E
    ld   [de], a                                  ;; 02:5637 $12
    inc  de                                       ;; 02:5638 $13
    dec  c                                        ;; 02:5639 $0D
    jr   nz, .loop_561E                           ;; 02:563A $20 $E2

    pop  bc                                       ;; 02:563C $C1
    ld   a, $04                                   ;; 02:563D $3E $04
    jp   label_002_58F5                           ;; 02:563F $C3 $F5 $58

Data_002_5642::
    db   $7E, $1F, $0C, $1F

RenderTranscientRumble::
    ld   a, $02                                   ;; 02:5646 $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 02:5648 $E0 $A1
    ld   [wC167], a                               ;; 02:564A $EA $67 $C1
    xor  a                                        ;; 02:564D $AF
    ld   [wScreenShakeHorizontal], a              ;; 02:564E $EA $55 $C1
    ldh  a, [hMultiPurpose0]                      ;; 02:5651 $F0 $D7
    cp   $02                                      ;; 02:5653 $FE $02
    jr   nc, .jr_565B                             ;; 02:5655 $30 $04

    ld   hl, wC167                                ;; 02:5657 $21 $67 $C1
    ld   [hl], b                                  ;; 02:565A $70

.jr_565B
    cp   $DE                                      ;; 02:565B $FE $DE
    jr   nz, .jr_5664                             ;; 02:565D $20 $05

    call EnqueueDoorUnlockedSfx                   ;; 02:565F $CD $20 $54
    ld   a, $DE                                   ;; 02:5662 $3E $DE

.jr_5664
    cp   $A0                                      ;; 02:5664 $FE $A0
    jr   nz, .jr_566D                             ;; 02:5666 $20 $05

    ld   hl, hNoiseSfx                            ;; 02:5668 $21 $F4 $FF
    ld   [hl], NOISE_SFX_OPEN_KEY_CAVERN          ;; 02:566B $36 $2A

.jr_566D
    cp   $0A                                      ;; 02:566D $FE $0A
    jr   nz, .jr_5678                             ;; 02:566F $20 $07

    ld   a, $50                                   ;; 02:5671 $3E $50
    ld   [wNextWorldMusicTrackCountdown], a       ;; 02:5673 $EA $AF $C5
    ld   a, $0A                                   ;; 02:5676 $3E $0A

.jr_5678
    cp   $20                                      ;; 02:5678 $FE $20
    jr   c, jr_002_568C                           ;; 02:567A $38 $10

    cp   $9C                                      ;; 02:567C $FE $9C
    ret  nc                                       ;; 02:567E $D0

    ld   e, $01                                   ;; 02:567F $1E $01
    and  $04                                      ;; 02:5681 $E6 $04
    jr   z, .jr_5687                              ;; 02:5683 $28 $02

    ld   e, $FE                                   ;; 02:5685 $1E $FE

.jr_5687
    ld   a, e                                     ;; 02:5687 $7B
    ld   [wScreenShakeHorizontal], a              ;; 02:5688 $EA $55 $C1
    ret                                           ;; 02:568B $C9

jr_002_568C:
    and  $0F                                      ;; 02:568C $E6 $0F
    cp   $08                                      ;; 02:568E $FE $08
    jp   nz, label_002_5707                       ;; 02:5690 $C2 $07 $57

    ldh  a, [hMultiPurpose0]                      ;; 02:5693 $F0 $D7
    rra                                           ;; 02:5695 $1F
    rra                                           ;; 02:5696 $1F
    rra                                           ;; 02:5697 $1F
    and  $02                                      ;; 02:5698 $E6 $02
    ld   e, a                                     ;; 02:569A $5F
    ld   d, b                                     ;; 02:569B $50
    ld   hl, Data_002_5642                        ;; 02:569C $21 $42 $56
    add  hl, de                                   ;; 02:569F $19
    ld   a, [hl+]                                 ;; 02:56A0 $2A
    ldh  [hMultiPurpose0], a                      ;; 02:56A1 $E0 $D7
    ld   a, [hl]                                  ;; 02:56A3 $7E
    ldh  [hMultiPurpose1], a                      ;; 02:56A4 $E0 $D8
    ld   a, $60                                   ;; 02:56A6 $3E $60
    ldh  [hIntersectedObjectLeft], a              ;; 02:56A8 $E0 $CE
    ldh  a, [hMapRoom]                            ;; 02:56AA $F0 $F6
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ;; 02:56AC $FE $B5
    ld   a, $10                                   ;; 02:56AE $3E $10
    jr   nz, .jr_56B8                             ;; 02:56B0 $20 $06

    ld   a, $60                                   ;; 02:56B2 $3E $60
    ldh  [hIntersectedObjectLeft], a              ;; 02:56B4 $E0 $CE
    ld   a, $10                                   ;; 02:56B6 $3E $10

.jr_56B8
    ldh  [hIntersectedObjectTop], a               ;; 02:56B8 $E0 $CD
    call label_2887                               ;; 02:56BA $CD $87 $28
    ld   a, [wDrawCommandsSize]                   ;; 02:56BD $FA $00 $D6
    ld   e, a                                     ;; 02:56C0 $5F
    ld   d, b                                     ;; 02:56C1 $50
    ld   hl, wDrawCommand                         ;; 02:56C2 $21 $01 $D6
    add  hl, de                                   ;; 02:56C5 $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 02:56C6 $F0 $CF
    ld   [hl+], a                                 ;; 02:56C8 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 02:56C9 $F0 $D0
    ld   [hl+], a                                 ;; 02:56CB $22
    ld   a, $41                                   ;; 02:56CC $3E $41
    ld   [hl+], a                                 ;; 02:56CE $22
    ldh  a, [hMultiPurpose0]                      ;; 02:56CF $F0 $D7
    ld   [hl+], a                                 ;; 02:56D1 $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 02:56D2 $F0 $CF
    ld   [hl+], a                                 ;; 02:56D4 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 02:56D5 $F0 $D0
    add  $20                                      ;; 02:56D7 $C6 $20
    ld   [hl+], a                                 ;; 02:56D9 $22
    ld   a, $41                                   ;; 02:56DA $3E $41
    ld   [hl+], a                                 ;; 02:56DC $22
    ldh  a, [hMultiPurpose1]                      ;; 02:56DD $F0 $D8
    ld   [hl+], a                                 ;; 02:56DF $22
    ld   [hl], b                                  ;; 02:56E0 $70
    ld   a, e                                     ;; 02:56E1 $7B
    add  $08                                      ;; 02:56E2 $C6 $08
    ld   [wDrawCommandsSize], a                   ;; 02:56E4 $EA $00 $D6
    ld   hl, wTranscientVfxCountdownTable         ;; 02:56E7 $21 $20 $C5
    add  hl, bc                                   ;; 02:56EA $09
    ld   a, [hl]                                  ;; 02:56EB $7E
    cp   $08                                      ;; 02:56EC $FE $08
    jr   nz, label_002_5707                       ;; 02:56EE $20 $17

    ld   hl, wRoomObjectsArea + $27               ;; 02:56F0 $21 $27 $D7
    ldh  a, [hMapRoom]                            ;; 02:56F3 $F0 $F6
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ;; 02:56F5 $FE $B5
    jr   nz, .jr_56FC                             ;; 02:56F7 $20 $03

    ld   hl, wRoomObjectsArea + $27               ;; 02:56F9 $21 $27 $D7

.jr_56FC
    ld   [hl], $E3                                ;; 02:56FC $36 $E3
    ld   a, $82                                   ;; 02:56FE $3E $82
    call BackupObjectInRAM2                       ;; 02:5700 $CD $2F $0B
    ld   a, JINGLE_DUNGEON_OPENED                 ;; 02:5703 $3E $23
    ldh  [hJingle], a                             ;; 02:5705 $E0 $F2

label_002_5707:
    ret                                           ;; 02:5707 $C9

Data_002_5708::
    db   $00, $04, $24, $01, $00, $04, $24, $01, $00, $00, $1E, $01, $00, $08, $1E, $61

RenderTranscientPegasusDust::
    call func_002_58D0                            ;; 02:5718 $CD $D0 $58
    ldh  a, [hMultiPurpose0]                      ;; 02:571B $F0 $D7
    and  $08                                      ;; 02:571D $E6 $08
    ld   d, $00                                   ;; 02:571F $16 $00
    ld   e, a                                     ;; 02:5721 $5F
    ld   hl, Data_002_5708                        ;; 02:5722 $21 $08 $57
    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:5725 $FA $4A $C1
    and  a                                        ;; 02:5728 $A7
    jp   nz, label_002_583A                       ;; 02:5729 $C2 $3A $58

    add  hl, de                                   ;; 02:572C $19
    ld   de, wOAMBuffer                           ;; 02:572D $11 $00 $C0
    call label_002_5854                           ;; 02:5730 $CD $54 $58
    jp   label_002_5854                           ;; 02:5733 $C3 $54 $58

Data_002_5736::
    db   $00, $00, $1E, $01, $00, $08, $1E, $61, $00, $00, $30, $01, $00, $08, $30, $61

RenderTranscientSmoke::
    call func_002_58D0                            ;; 02:5746 $CD $D0 $58
    ldh  a, [hMultiPurpose0]                      ;; 02:5749 $F0 $D7
    and  $08                                      ;; 02:574B $E6 $08
    ld   d, $00                                   ;; 02:574D $16 $00
    ld   e, a                                     ;; 02:574F $5F
    ld   hl, Data_002_5736                        ;; 02:5750 $21 $36 $57
    jp   label_002_583A                           ;; 02:5753 $C3 $3A $58

Data_002_5756::
    db   $01, $FF, $01, $FF

Data_002_575A::
    db   $01, $01, $FF, $FF

RenderTranscientMovingSparkle::
    ldh  a, [hMultiPurpose0]                      ;; 02:575E $F0 $D7
    cp   $0A                                      ;; 02:5760 $FE $0A
    jr   c, .jr_5780                              ;; 02:5762 $38 $1C

    ld   hl, wC590                                ;; 02:5764 $21 $90 $C5
    add  hl, bc                                   ;; 02:5767 $09
    ld   e, [hl]                                  ;; 02:5768 $5E
    ld   d, b                                     ;; 02:5769 $50
    ld   hl, Data_002_5756                        ;; 02:576A $21 $56 $57
    add  hl, de                                   ;; 02:576D $19
    ld   a, [hl]                                  ;; 02:576E $7E
    ld   hl, wTranscientVfxPosXTable              ;; 02:576F $21 $30 $C5
    add  hl, bc                                   ;; 02:5772 $09
    add  [hl]                                     ;; 02:5773 $86
    ld   [hl], a                                  ;; 02:5774 $77
    ld   hl, Data_002_575A                        ;; 02:5775 $21 $5A $57
    add  hl, de                                   ;; 02:5778 $19
    ld   a, [hl]                                  ;; 02:5779 $7E
    ld   hl, wTranscientVfxPosYTable              ;; 02:577A $21 $40 $C5
    add  hl, bc                                   ;; 02:577D $09
    add  [hl]                                     ;; 02:577E $86
    ld   [hl], a                                  ;; 02:577F $77

.jr_5780
    call func_002_58D0                            ;; 02:5780 $CD $D0 $58
    push bc                                       ;; 02:5783 $C5
    ld   c, $3A                                   ;; 02:5784 $0E $3A
    ldh  a, [hMultiPurpose0]                      ;; 02:5786 $F0 $D7
    cp   $07                                      ;; 02:5788 $FE $07
    jr   nc, .jr_578E                             ;; 02:578A $30 $02

    ld   c, $3C                                   ;; 02:578C $0E $3C

.jr_578E
    ld   a, [wOAMNextAvailableSlot]               ;; 02:578E $FA $C0 $C3
    ld   e, a                                     ;; 02:5791 $5F
    ld   d, $00                                   ;; 02:5792 $16 $00
    ld   hl, wDynamicOAMBuffer                    ;; 02:5794 $21 $30 $C0
    add  hl, de                                   ;; 02:5797 $19
    ldh  a, [hMultiPurpose1]                      ;; 02:5798 $F0 $D8
    ld   [hl+], a                                 ;; 02:579A $22
    ldh  a, [hMultiPurpose2]                      ;; 02:579B $F0 $D9
    ld   [hl+], a                                 ;; 02:579D $22
    ld   a, c                                     ;; 02:579E $79
    ld   [hl+], a                                 ;; 02:579F $22
    xor  a                                        ;; 02:57A0 $AF
    ld   [hl+], a                                 ;; 02:57A1 $22
    ldh  a, [hMultiPurpose1]                      ;; 02:57A2 $F0 $D8
    ld   [hl+], a                                 ;; 02:57A4 $22
    ldh  a, [hMultiPurpose2]                      ;; 02:57A5 $F0 $D9
    add  $08                                      ;; 02:57A7 $C6 $08
    ld   [hl+], a                                 ;; 02:57A9 $22
    ld   a, c                                     ;; 02:57AA $79
    ld   [hl+], a                                 ;; 02:57AB $22
    ld   [hl], $20                                ;; 02:57AC $36 $20
    pop  bc                                       ;; 02:57AE $C1
    ld   a, $02                                   ;; 02:57AF $3E $02
    jp   label_002_58F5                           ;; 02:57B1 $C3 $F5 $58

RenderTranscientLaserBeam::
    call func_002_58D0                            ;; 02:57B4 $CD $D0 $58
    ld   a, [wOAMNextAvailableSlot]               ;; 02:57B7 $FA $C0 $C3
    ld   e, a                                     ;; 02:57BA $5F

.jr_57BB
    ld   d, $00                                   ;; 02:57BB $16 $00
    ld   hl, wDynamicOAMBuffer                    ;; 02:57BD $21 $30 $C0
    add  hl, de                                   ;; 02:57C0 $19
    ldh  a, [hMultiPurpose1]                      ;; 02:57C1 $F0 $D8
    ld   [hl+], a                                 ;; 02:57C3 $22
    ldh  a, [hMultiPurpose2]                      ;; 02:57C4 $F0 $D9
    ld   [hl+], a                                 ;; 02:57C6 $22
    ld   a, $24                                   ;; 02:57C7 $3E $24
    ld   [hl+], a                                 ;; 02:57C9 $22
    ldh  a, [hFrameCounter]                       ;; 02:57CA $F0 $E7
    xor  c                                        ;; 02:57CC $A9
    rl   a                                        ;; 02:57CD $CB $17
    rl   a                                        ;; 02:57CF $CB $17
    rl   a                                        ;; 02:57D1 $CB $17
    rl   a                                        ;; 02:57D3 $CB $17
    and  $10                                      ;; 02:57D5 $E6 $10
    ld   [hl], a                                  ;; 02:57D7 $77
    ld   a, $01                                   ;; 02:57D8 $3E $01
    jp   label_002_58F5                           ;; 02:57DA $C3 $F5 $58

Data_002_57DD::
    db   $00, $FF, $3C, $00, $00, $07, $3C, $20, $00, $FF, $3A, $00, $00, $07, $3A, $20

RenderTranscientSwordPoke::
    call func_002_58D0                            ;; 02:57ED $CD $D0 $58
    ldh  a, [hMultiPurpose0]                      ;; 02:57F0 $F0 $D7
    and  $08                                      ;; 02:57F2 $E6 $08
    ld   d, $00                                   ;; 02:57F4 $16 $00
    ld   e, a                                     ;; 02:57F6 $5F
    ld   hl, Data_002_57DD                        ;; 02:57F7 $21 $DD $57
    jp   label_002_583A                           ;; 02:57FA $C3 $3A $58

Data_002_57FD::
    db   $F6, $FE, $18, $00, $F8, $0A, $18, $20, $FC, $00, $18, $00, $FE, $08, $18, $20

Data_002_580D::
    db   $00, $FA, $18, $00, $00, $0E, $18, $20, $02, $FC, $18, $00, $02, $0C, $18, $20

RenderTranscientPegasusSplash::
    call func_002_58D0                            ;; 02:581D $CD $D0 $58
    ld   hl, Data_002_580D                        ;; 02:5820 $21 $0D $58
    jr   jr_002_5833                              ;; 02:5823 $18 $0E

RenderTranscientWaterSplash::
    call func_002_58D0                            ;; 02:5825 $CD $D0 $58
    ld   a, [wC1A7]                               ;; 02:5828 $FA $A7 $C1
    cp   $02                                      ;; 02:582B $FE $02

.jr_582D
    jp   z, label_002_5877                        ;; 02:582D $CA $77 $58

    ld   hl, Data_002_57FD                        ;; 02:5830 $21 $FD $57

jr_002_5833:
    ldh  a, [hMultiPurpose0]                      ;; 02:5833 $F0 $D7
    and  $08                                      ;; 02:5835 $E6 $08
    ld   e, a                                     ;; 02:5837 $5F
    ld   d, $00                                   ;; 02:5838 $16 $00

label_002_583A:
    add  hl, de                                   ;; 02:583A $19
    push hl                                       ;; 02:583B $E5
    ld   a, [wOAMNextAvailableSlot]               ;; 02:583C $FA $C0 $C3
    ld   e, a                                     ;; 02:583F $5F
    ld   d, $00                                   ;; 02:5840 $16 $00
    ld   hl, wDynamicOAMBuffer                    ;; 02:5842 $21 $30 $C0
    add  hl, de                                   ;; 02:5845 $19
    ld   e, l                                     ;; 02:5846 $5D
    ld   d, h                                     ;; 02:5847 $54
    pop  hl                                       ;; 02:5848 $E1
    call label_002_5854                           ;; 02:5849 $CD $54 $58
    call label_002_5854                           ;; 02:584C $CD $54 $58
    ld   a, $02                                   ;; 02:584F $3E $02
    jp   label_002_58F5                           ;; 02:5851 $C3 $F5 $58

label_002_5854:
    ldh  a, [hMultiPurpose1]                      ;; 02:5854 $F0 $D8
    add  [hl]                                     ;; 02:5856 $86
    ld   [de], a                                  ;; 02:5857 $12
    inc  hl                                       ;; 02:5858 $23
    inc  de                                       ;; 02:5859 $13
    ldh  a, [hMultiPurpose2]                      ;; 02:585A $F0 $D9
    add  [hl]                                     ;; 02:585C $86
    ld   [de], a                                  ;; 02:585D $12
    inc  hl                                       ;; 02:585E $23
    inc  de                                       ;; 02:585F $13
    ld   a, [hl+]                                 ;; 02:5860 $2A
    ld   [de], a                                  ;; 02:5861 $12
    inc  de                                       ;; 02:5862 $13
    ld   a, [hl+]                                 ;; 02:5863 $2A
    ld   [de], a                                  ;; 02:5864 $12
    inc  de                                       ;; 02:5865 $13
    ret                                           ;; 02:5866 $C9

Data_002_5867::
    db   $00, $00, $7A, $00, $00, $08, $7A, $20, $00, $00, $78, $00, $00, $08, $78, $20

label_002_5877:
    ldh  a, [hMultiPurpose0]                      ;; 02:5877 $F0 $D7
    and  $08                                      ;; 02:5879 $E6 $08
    ld   d, $00                                   ;; 02:587B $16 $00
    ld   e, a                                     ;; 02:587D $5F
    ld   hl, Data_002_5867                        ;; 02:587E $21 $67 $58
    jp   label_002_583A                           ;; 02:5881 $C3 $3A $58

Data_002_5884::
    db   $00, $00, $32, $01, $00, $08, $32, $21, $00, $00, $32, $01, $00, $08, $32, $21
    db   $00, $00, $30, $01, $00, $08, $30, $21, $00, $00, $30, $01, $00, $08, $30, $21

RenderTranscientPoof::
    call func_002_58D0                            ;; 02:58A4 $CD $D0 $58
    ldh  a, [hMultiPurpose0]                      ;; 02:58A7 $F0 $D7
    cp   $04                                      ;; 02:58A9 $FE $04
    jr   nz, .jr_58BB                             ;; 02:58AB $20 $0E

    ld   hl, wTranscientVfxTypeTable              ;; 02:58AD $21 $10 $C5
    add  hl, bc                                   ;; 02:58B0 $09
    ld   a, [hl]                                  ;; 02:58B1 $7E
    cp   $03                                      ;; 02:58B2 $FE $03
    jr   nz, .jr_58BB                             ;; 02:58B4 $20 $05

    call func_002_5ED3                            ;; 02:58B6 $CD $D3 $5E
    jr   jr_002_58C2                              ;; 02:58B9 $18 $07

.jr_58BB
    cp   $04                                      ;; 02:58BB $FE $04
    jr   nz, jr_002_58C2                          ;; 02:58BD $20 $03

    call func_002_5F5C                            ;; 02:58BF $CD $5C $5F

jr_002_58C2:
    ldh  a, [hMultiPurpose0]                      ;; 02:58C2 $F0 $D7
    rla                                           ;; 02:58C4 $17
    and  $18                                      ;; 02:58C5 $E6 $18
    ld   d, $00                                   ;; 02:58C7 $16 $00
    ld   e, a                                     ;; 02:58C9 $5F
    ld   hl, Data_002_5884                        ;; 02:58CA $21 $84 $58
    jp   label_002_583A                           ;; 02:58CD $C3 $3A $58

func_002_58D0::
    ld   hl, wTranscientVfxPosYTable              ;; 02:58D0 $21 $40 $C5
    add  hl, bc                                   ;; 02:58D3 $09
    ld   a, [hl]                                  ;; 02:58D4 $7E
    ldh  [hMultiPurpose1], a                      ;; 02:58D5 $E0 $D8
    cp   $88                                      ;; 02:58D7 $FE $88
    jr   nc, ClearTranscientVfx                   ;; 02:58D9 $30 $0B

    ld   hl, wTranscientVfxPosXTable              ;; 02:58DB $21 $30 $C5
    add  hl, bc                                   ;; 02:58DE $09
    ld   a, [hl]                                  ;; 02:58DF $7E
    ldh  [hMultiPurpose2], a                      ;; 02:58E0 $E0 $D9
    cp   $A8                                      ;; 02:58E2 $FE $A8
    jr   c, ret_002_58EC                          ;; 02:58E4 $38 $06

; Remove a transcient vfx from the effects table.
ClearTranscientVfx::
    ld   hl, wTranscientVfxTypeTable              ;; 02:58E6 $21 $10 $C5
    add  hl, bc                                   ;; 02:58E9 $09
    xor  a                                        ;; 02:58EA $AF
    ld   [hl], a                                  ;; 02:58EB $77

ret_002_58EC:
    ret                                           ;; 02:58EC $C9

Data_002_58ED::
    db   $00, $08, $10, $18, $20, $28, $30, $38

label_002_58F5:
    sla  a                                        ;; 02:58F5 $CB $27
    sla  a                                        ;; 02:58F7 $CB $27
    ld   e, a                                     ;; 02:58F9 $5F
    ld   a, [wOAMNextAvailableSlot]               ;; 02:58FA $FA $C0 $C3
    add  e                                        ;; 02:58FD $83
    cp   $60                                      ;; 02:58FE $FE $60
    jr   c, .jr_5904                              ;; 02:5900 $38 $02

    sub  $60                                      ;; 02:5902 $D6 $60

.jr_5904
    ld   [wOAMNextAvailableSlot], a               ;; 02:5904 $EA $C0 $C3
    ld   a, [wC3C1]                               ;; 02:5907 $FA $C1 $C3
    add  e                                        ;; 02:590A $83
    ld   [wC3C1], a                               ;; 02:590B $EA $C1 $C3
    cp   $60                                      ;; 02:590E $FE $60
    jr   c, ret_002_5925                          ;; 02:5910 $38 $13

    ldh  a, [hFrameCounter]                       ;; 02:5912 $F0 $E7
    ld   hl, wActiveEntityIndex                   ;; 02:5914 $21 $23 $C1
    add  [hl]                                     ;; 02:5917 $86
    and  $07                                      ;; 02:5918 $E6 $07
    ld   e, a                                     ;; 02:591A $5F

.jr_591B
    ld   d, $00                                   ;; 02:591B $16 $00
    ld   hl, Data_002_58ED                        ;; 02:591D $21 $ED $58
    add  hl, de                                   ;; 02:5920 $19
    ld   a, [hl]                                  ;; 02:5921 $7E
    ld   [wOAMNextAvailableSlot], a               ;; 02:5922 $EA $C0 $C3

ret_002_5925:
    ret                                           ;; 02:5925 $C9

func_002_5926::
    ldh  a, [hLinkPositionY]                      ;; 02:5926 $F0 $99

func_002_5928::
    ldh  [hMultiPurpose1], a                      ;; 02:5928 $E0 $D8
    ldh  a, [hLinkPositionX]                      ;; 02:592A $F0 $98
    ldh  [hMultiPurpose0], a                      ;; 02:592C $E0 $D7
    ld   a, JINGLE_WATER_SPLASH                   ;; 02:592E $3E $0E
    ldh  [hJingle], a                             ;; 02:5930 $E0 $F2
    ld   a, TRANSCIENT_VFX_WATER_SPLASH           ;; 02:5932 $3E $01
    jp   AddTranscientVfx                         ;; 02:5934 $C3 $C7 $0C

Data_002_5937::
    db   $FE, $FD, $FB, $F7

; Execute active room events, and do some other stuff
label_002_593B:
    ; If not dialog, no subscreen, no map transition, return
    ld   hl, wDialogState                         ;; 02:593B $21 $9F $C1
    ld   a, [wRoomTransitionState]                ;; 02:593E $FA $24 $C1
    or   [hl]                                     ;; 02:5941 $B6
    ld   hl, wInventoryAppearing                  ;; 02:5942 $21 $4F $C1
    or   [hl]                                     ;; 02:5945 $B6
    jr   nz, .return                              ;; 02:5946 $20 $1F

    ; If not indoor, return
    ld   a, [wIsIndoor]                           ;; 02:5948 $FA $A5 $DB
    and  a                                        ;; 02:594B $A7
    jr   z, .return                               ;; 02:594C $28 $19

    call ExecuteRoomTriggersAndEffects            ;; 02:594E $CD $4F $5D
    ld   a, [wC188]                               ;; 02:5951 $FA $88 $C1
    and  a                                        ;; 02:5954 $A7
    jr   z, .jr_002_5968                          ;; 02:5955 $28 $11

    cp   $02                                      ;; 02:5957 $FE $02
    ld   a, $01                                   ;; 02:5959 $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 02:595B $E0 $A1
    jr   z, .jr_002_5964                          ;; 02:595D $28 $05

    call func_002_5A7B                            ;; 02:595F $CD $7B $5A
    jr   .return                                  ;; 02:5962 $18 $03

.jr_002_5964
    call func_002_5C04                            ;; 02:5964 $CD $04 $5C

.return
    ret                                           ;; 02:5967 $C9

.jr_002_5968
    ld   a, [wC18C]                               ;; 02:5968 $FA $8C $C1
    and  a                                        ;; 02:596B $A7
    jr   z, .jr_002_599D                          ;; 02:596C $28 $2F

    ld   e, $03                                   ;; 02:596E $1E $03
    ld   a, [wC18A]                               ;; 02:5970 $FA $8A $C1
    ld   c, a                                     ;; 02:5973 $4F

.jr_002_5974
    inc  e                                        ;; 02:5974 $1C
    ld   a, e                                     ;; 02:5975 $7B
    cp   $08                                      ;; 02:5976 $FE $08
    jr   z, .jr_002_5998                          ;; 02:5978 $28 $1E

    srl  c                                        ;; 02:597A $CB $39
    jr   nc, .jr_002_5974                         ;; 02:597C $30 $F6

    ld   d, $00                                   ;; 02:597E $16 $00
    ld   hl, (Data_002_5937 - 4)                  ;; 02:5980 $21 $33 $59
    add  hl, de                                   ;; 02:5983 $19
    ld   a, [wC18A]                               ;; 02:5984 $FA $8A $C1
    and  [hl]                                     ;; 02:5987 $A6
    ld   [wC18A], a                               ;; 02:5988 $EA $8A $C1
    ld   a, e                                     ;; 02:598B $7B
    ld   [wC189], a                               ;; 02:598C $EA $89 $C1
    xor  a                                        ;; 02:598F $AF
    ld   [wDBAC], a                               ;; 02:5990 $EA $AC $DB
    inc  a                                        ;; 02:5993 $3C
    ld   [wC188], a                               ;; 02:5994 $EA $88 $C1
    ret                                           ;; 02:5997 $C9

.jr_002_5998
    xor  a                                        ;; 02:5998 $AF
    ld   [wC18C], a                               ;; 02:5999 $EA $8C $C1
    ret                                           ;; 02:599C $C9

.jr_002_599D
    ld   a, [wC18D]                               ;; 02:599D $FA $8D $C1
    and  a                                        ;; 02:59A0 $A7
    jr   nz, .jr_002_59A4                         ;; 02:59A1 $20 $01

    ret                                           ;; 02:59A3 $C9

.jr_002_59A4
    ld   e, $03                                   ;; 02:59A4 $1E $03
    ld   a, [wC18B]                               ;; 02:59A6 $FA $8B $C1
    ld   c, a                                     ;; 02:59A9 $4F

.loop
    inc  e                                        ;; 02:59AA $1C
    ld   a, e                                     ;; 02:59AB $7B
    cp   $08                                      ;; 02:59AC $FE $08
    jr   z, .jr_002_59CF                          ;; 02:59AE $28 $1F

    srl  c                                        ;; 02:59B0 $CB $39
    jr   nc, .loop                                ;; 02:59B2 $30 $F6

    ld   d, $00                                   ;; 02:59B4 $16 $00
    ld   hl, (Data_002_5937 - 4)                  ;; 02:59B6 $21 $33 $59
    add  hl, de                                   ;; 02:59B9 $19
    ld   a, [wC18B]                               ;; 02:59BA $FA $8B $C1
    and  [hl]                                     ;; 02:59BD $A6
    ld   [wC18B], a                               ;; 02:59BE $EA $8B $C1
    ld   a, e                                     ;; 02:59C1 $7B
    ld   [wC189], a                               ;; 02:59C2 $EA $89 $C1
    ld   a, $02                                   ;; 02:59C5 $3E $02
    ld   [wC188], a                               ;; 02:59C7 $EA $88 $C1
    xor  a                                        ;; 02:59CA $AF
    ld   [wDBAC], a                               ;; 02:59CB $EA $AC $DB
    ret                                           ;; 02:59CE $C9

.jr_002_59CF
    xor  a                                        ;; 02:59CF $AF
    ld   [wC18D], a                               ;; 02:59D0 $EA $8D $C1
    ret                                           ;; 02:59D3 $C9

Data_002_59D4::
    db   $50

Data_002_59D5::
    db   $51, $13, $12, $11, $10, $42, $43, $45, $13, $55, $11, $12, $46, $10, $56, $58
    db   $59, $13, $12, $11, $10, $4A, $4B, $4D, $13, $5D, $11, $12, $4E, $10, $5E, $02
    db   $03, $13, $12, $11, $10, $13, $12, $11, $10, $13, $12, $12, $13, $10, $11, $12
    db   $13, $10, $11, $11, $10, $13, $12, $11, $10, $13, $12, $12, $13, $10, $11, $12
    db   $13, $10, $11, $11, $10, $13, $12

Data_002_5A1C::
    db   $08, $08, $00, $00, $08, $08, $00, $00, $08, $08, $08, $00, $00, $08, $08, $00
    db   $00, $08

Data_002_5A2E::
    db   $00, $00, $08, $08, $00, $00, $08, $08, $00, $08, $08, $10, $10, $08, $08, $10
    db   $10, $08

Data_002_5A40::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $10, $10, $01, $01, $10, $10

Data_002_5A50::
    db   $43, $8C, $09, $0B, $43, $8C, $09, $0B, $44, $08, $0A, $0C, $44, $08, $0A, $0C

Data_002_5A60::
    db   $04, $08, $02, $01, $04, $08, $02, $01, $04

Data_002_5A69::
    db   $F8, $08, $FF, $01, $F8, $08, $FF, $01, $F8

Data_002_5A72::
    db   $08, $04, $01, $02, $08, $04, $01, $02, $08

func_002_5A7B::
    ld   e, $00                                   ;; 02:5A7B $1E $00
    ld   d, e                                     ;; 02:5A7D $53
    ld   c, e                                     ;; 02:5A7E $4B
    ld   b, e                                     ;; 02:5A7F $43
    xor  a                                        ;; 02:5A80 $AF
    ldh  [hMultiPurposeC], a                      ;; 02:5A81 $E0 $E3
    ldh  [hMultiPurposeE], a                      ;; 02:5A83 $E0 $E5
    ld   a, [wC189]                               ;; 02:5A85 $FA $89 $C1
    ld   c, a                                     ;; 02:5A88 $4F
    and  a                                        ;; 02:5A89 $A7
    jr   z, jr_002_5A95                           ;; 02:5A8A $28 $09

    xor  a                                        ;; 02:5A8C $AF

.loop_5A8D
    add  $04                                      ;; 02:5A8D $C6 $04
    ld   e, a                                     ;; 02:5A8F $5F
    ld   d, $00                                   ;; 02:5A90 $16 $00
    dec  c                                        ;; 02:5A92 $0D
    jr   nz, .loop_5A8D                           ;; 02:5A93 $20 $F8

jr_002_5A95:
    ld   hl, Data_002_5A1C                        ;; 02:5A95 $21 $1C $5A
    ld   a, [wC189]                               ;; 02:5A98 $FA $89 $C1
    ld   c, a                                     ;; 02:5A9B $4F
    ld   b, $00                                   ;; 02:5A9C $06 $00
    add  hl, bc                                   ;; 02:5A9E $09
    ld   a, [hl]                                  ;; 02:5A9F $7E
    ld   hl, wC1D0                                ;; 02:5AA0 $21 $D0 $C1
    add  hl, bc                                   ;; 02:5AA3 $09
    add  [hl]                                     ;; 02:5AA4 $86
    ldh  [hIntersectedObjectLeft], a              ;; 02:5AA5 $E0 $CE

label_002_5AA7:
    ld   hl, Data_002_5A2E                        ;; 02:5AA7 $21 $2E $5A
    ldh  a, [hMultiPurposeC]                      ;; 02:5AAA $F0 $E3
    ld   c, a                                     ;; 02:5AAC $4F
    add  hl, bc                                   ;; 02:5AAD $09
    ld   a, [wC189]                               ;; 02:5AAE $FA $89 $C1
    ld   c, a                                     ;; 02:5AB1 $4F
    add  hl, bc                                   ;; 02:5AB2 $09
    ld   a, [hl]                                  ;; 02:5AB3 $7E
    ld   hl, wC1E0                                ;; 02:5AB4 $21 $E0 $C1
    add  hl, bc                                   ;; 02:5AB7 $09
    add  [hl]                                     ;; 02:5AB8 $86
    ldh  [hIntersectedObjectTop], a               ;; 02:5AB9 $E0 $CD
    push de                                       ;; 02:5ABB $D5
    call label_2887                               ;; 02:5ABC $CD $87 $28
    pop  de                                       ;; 02:5ABF $D1
    ldh  a, [hMultiPurposeC]                      ;; 02:5AC0 $F0 $E3
    and  a                                        ;; 02:5AC2 $A7
    jr   z, .jr_5AC7                              ;; 02:5AC3 $28 $02

    inc  de                                       ;; 02:5AC5 $13
    inc  de                                       ;; 02:5AC6 $13

.jr_5AC7
    ldh  a, [hIsGBC]                              ;; 02:5AC7 $F0 $FE
    and  a                                        ;; 02:5AC9 $A7
    jr   z, .jr_5AD5                              ;; 02:5ACA $28 $09

    push de                                       ;; 02:5ACC $D5
    ld   a, $02                                   ;; 02:5ACD $3E $02
    ld   b, $00                                   ;; 02:5ACF $06 $00
    call func_999                                 ;; 02:5AD1 $CD $99 $09
    pop  de                                       ;; 02:5AD4 $D1

.jr_5AD5
    ld   a, [wDrawCommandsSize]                   ;; 02:5AD5 $FA $00 $D6
    ld   c, a                                     ;; 02:5AD8 $4F
    ld   b, $00                                   ;; 02:5AD9 $06 $00
    add  $05                                      ;; 02:5ADB $C6 $05
    ld   [wDrawCommandsSize], a                   ;; 02:5ADD $EA $00 $D6
    ld   hl, wDrawCommand                         ;; 02:5AE0 $21 $01 $D6
    add  hl, bc                                   ;; 02:5AE3 $09
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 02:5AE4 $F0 $CF
    ld   [hl+], a                                 ;; 02:5AE6 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 02:5AE7 $F0 $D0
    ld   [hl+], a                                 ;; 02:5AE9 $22
    ld   a, $01                                   ;; 02:5AEA $3E $01
    ld   [hl+], a                                 ;; 02:5AEC $22
    push hl                                       ;; 02:5AED $E5
    ld   hl, Data_002_59D4                        ;; 02:5AEE $21 $D4 $59
    add  hl, de                                   ;; 02:5AF1 $19
    ld   a, [hl]                                  ;; 02:5AF2 $7E
    pop  hl                                       ;; 02:5AF3 $E1
    ld   [hl+], a                                 ;; 02:5AF4 $22
    push hl                                       ;; 02:5AF5 $E5
    ld   hl, Data_002_59D5                        ;; 02:5AF6 $21 $D5 $59
    add  hl, de                                   ;; 02:5AF9 $19
    ld   a, [hl]                                  ;; 02:5AFA $7E
    pop  hl                                       ;; 02:5AFB $E1
    ld   [hl], a                                  ;; 02:5AFC $77
    ldh  a, [hMultiPurposeC]                      ;; 02:5AFD $F0 $E3
    and  a                                        ;; 02:5AFF $A7
    jr   nz, .jr_5B09                             ;; 02:5B00 $20 $07

    ld   a, $09                                   ;; 02:5B02 $3E $09
    ldh  [hMultiPurposeC], a                      ;; 02:5B04 $E0 $E3
    jp   label_002_5AA7                           ;; 02:5B06 $C3 $A7 $5A

.jr_5B09
    xor  a                                        ;; 02:5B09 $AF
    inc  hl                                       ;; 02:5B0A $23
    ld   [hl], a                                  ;; 02:5B0B $77
    ld   a, [wDBAC]                               ;; 02:5B0C $FA $AC $DB
    add  $01                                      ;; 02:5B0F $C6 $01
    ld   [wDBAC], a                               ;; 02:5B11 $EA $AC $DB
    ld   a, [wDBAC]                               ;; 02:5B14 $FA $AC $DB
    cp   $08                                      ;; 02:5B17 $FE $08
    jr   nc, .jr_5B1C                             ;; 02:5B19 $30 $01

    ret                                           ;; 02:5B1B $C9

.jr_5B1C
    ldh  a, [hMultiPurposeE]                      ;; 02:5B1C $F0 $E5
    and  a                                        ;; 02:5B1E $A7
    jr   nz, .jr_5B31                             ;; 02:5B1F $20 $10

    xor  a                                        ;; 02:5B21 $AF
    ldh  [hMultiPurposeC], a                      ;; 02:5B22 $E0 $E3
    ld   a, e                                     ;; 02:5B24 $7B
    add  $24                                      ;; 02:5B25 $C6 $24
    ld   e, a                                     ;; 02:5B27 $5F
    ld   d, $00                                   ;; 02:5B28 $16 $00
    ldh  [hMultiPurposeE], a                      ;; 02:5B2A $E0 $E5
    dec  de                                       ;; 02:5B2C $1B
    dec  de                                       ;; 02:5B2D $1B
    jp   label_002_5AA7                           ;; 02:5B2E $C3 $A7 $5A

.jr_5B31
    xor  a                                        ;; 02:5B31 $AF
    ld   [wC188], a                               ;; 02:5B32 $EA $88 $C1
    ld   [wC1A8], a                               ;; 02:5B35 $EA $A8 $C1
    xor  a                                        ;; 02:5B38 $AF
    ldh  [hMultiPurposeE], a                      ;; 02:5B39 $E0 $E5
    ld   a, [wC189]                               ;; 02:5B3B $FA $89 $C1
    ld   c, a                                     ;; 02:5B3E $4F
    ld   b, $00                                   ;; 02:5B3F $06 $00
    ld   hl, wC1F0                                ;; 02:5B41 $21 $F0 $C1
    add  hl, bc                                   ;; 02:5B44 $09
    ld   a, [hl]                                  ;; 02:5B45 $7E
    ldh  [hMultiPurpose0], a                      ;; 02:5B46 $E0 $D7
    ld   a, c                                     ;; 02:5B48 $79
    and  $07                                      ;; 02:5B49 $E6 $07
    ld   c, a                                     ;; 02:5B4B $4F

.loop_5B4C
    ld   hl, Data_002_5A40                        ;; 02:5B4C $21 $40 $5A
    add  hl, bc                                   ;; 02:5B4F $09
    ld   a, [hl]                                  ;; 02:5B50 $7E
    ld   hl, hMultiPurpose0                       ;; 02:5B51 $21 $D7 $FF
    add  [hl]                                     ;; 02:5B54 $86
    ld   e, a                                     ;; 02:5B55 $5F
    ld   d, $00                                   ;; 02:5B56 $16 $00
    ld   hl, Data_002_5A50                        ;; 02:5B58 $21 $50 $5A
    add  hl, bc                                   ;; 02:5B5B $09
    ld   a, [hl]                                  ;; 02:5B5C $7E
    ld   hl, wRoomObjects                         ;; 02:5B5D $21 $11 $D7
    add  hl, de                                   ;; 02:5B60 $19
    ld   [hl], a                                  ;; 02:5B61 $77
    ldh  a, [hMultiPurposeE]                      ;; 02:5B62 $F0 $E5
    and  a                                        ;; 02:5B64 $A7
    jr   nz, .jr_5B6F                             ;; 02:5B65 $20 $08

    ld   a, c                                     ;; 02:5B67 $79
    add  $08                                      ;; 02:5B68 $C6 $08
    ldh  [hMultiPurposeE], a                      ;; 02:5B6A $E0 $E5
    ld   c, a                                     ;; 02:5B6C $4F
    jr   .loop_5B4C                               ;; 02:5B6D $18 $DD

.jr_5B6F
    call GetRoomStatusAddress                     ;; 02:5B6F $CD $9F $5B
    ld   c, l                                     ;; 02:5B72 $4D
    ld   b, h                                     ;; 02:5B73 $44
    ld   a, [wC189]                               ;; 02:5B74 $FA $89 $C1
    ld   e, a                                     ;; 02:5B77 $5F
    ld   d, $00                                   ;; 02:5B78 $16 $00
    ld   hl, Data_002_5A60                        ;; 02:5B7A $21 $60 $5A
    add  hl, de                                   ;; 02:5B7D $19
    ld   a, [bc]                                  ;; 02:5B7E $0A
    or   [hl]                                     ;; 02:5B7F $B6
    ld   [bc], a                                  ;; 02:5B80 $02
    ldh  [hRoomStatus], a                         ;; 02:5B81 $E0 $F8
    ld   hl, Data_002_5A69                        ;; 02:5B83 $21 $69 $5A
    add  hl, de                                   ;; 02:5B86 $19
    ld   a, [wIndoorRoom]                         ;; 02:5B87 $FA $AE $DB
    add  [hl]                                     ;; 02:5B8A $86
    ld   e, a                                     ;; 02:5B8B $5F
    call label_2BC1                               ;; 02:5B8C $CD $C1 $2B
    ld   c, l                                     ;; 02:5B8F $4D
    ld   b, h                                     ;; 02:5B90 $44
    ld   a, [wC189]                               ;; 02:5B91 $FA $89 $C1
    ld   e, a                                     ;; 02:5B94 $5F
    ld   d, $00                                   ;; 02:5B95 $16 $00
    ld   hl, Data_002_5A72                        ;; 02:5B97 $21 $72 $5A
    add  hl, de                                   ;; 02:5B9A $19
    ld   a, [bc]                                  ;; 02:5B9B $0A
    or   [hl]                                     ;; 02:5B9C $B6
    ld   [bc], a                                  ;; 02:5B9D $02
    ret                                           ;; 02:5B9E $C9

; Retrieve the address of the status flags for the current room.
; Returns the address in hl.
GetRoomStatusAddress::
    ld   hl, wOverworldRoomStatus                 ;; 02:5B9F $21 $00 $D8
    ldh  a, [hMapRoom]                            ;; 02:5BA2 $F0 $F6
    ld   e, a                                     ;; 02:5BA4 $5F

    ; If is indoor…
    ld   a, [wIsIndoor]                           ;; 02:5BA5 $FA $A5 $DB
    ld   d, a                                     ;; 02:5BA8 $57
    and  a                                        ;; 02:5BA9 $A7
    jr   z, .computeAddress                       ;; 02:5BAA $28 $16

    ; If is color dungeon…
    ldh  a, [hMapId]                              ;; 02:5BAC $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 02:5BAE $FE $FF
    jr   nz, .regularDungeon                      ;; 02:5BB0 $20 $07

    ld   d, $00                                   ;; 02:5BB2 $16 $00
    ld   hl, wColorDungeonRoomStatus              ;; 02:5BB4 $21 $E0 $DD
    jr   .computeAddress                          ;; 02:5BB7 $18 $09

.regularDungeon
    ; If the map uses rooms in the indoors_b rooms group…
    cp   MAP_INDOORS_B_END                        ;; 02:5BB9 $FE $1A
    jr   nc, .computeAddress                      ;; 02:5BBB $30 $05
    cp   MAP_INDOORS_B_START                      ;; 02:5BBD $FE $06
    jr   c, .computeAddress                       ;; 02:5BBF $38 $01
    ; d += 1
    inc  d                                        ;; 02:5BC1 $14

.computeAddress
    add  hl, de                                   ;; 02:5BC2 $19
    ret                                           ;; 02:5BC3 $C9

Data_002_5BC4::
    db   $58

Data_002_5BC5::
    db   $59, $13, $12, $11, $10, $4A, $4B, $4D, $13, $5D, $11, $12, $4E, $10, $5E, $40
    db   $41, $58, $59, $4A, $4B, $52, $53, $44, $4D, $54, $5D

Data_002_5BE0::
    db   $4E, $47, $5E, $57, $08, $08, $00, $00

Data_002_5BE8::
    db   $08, $08, $00, $00, $00, $00, $08, $08, $08, $08, $10, $10

Data_002_5BF4::
    db   $00, $00, $00, $00, $01, $01, $10, $10

Data_002_5BFC::
    db   $35, $37, $39, $3B, $36, $38, $3A, $3C

func_002_5C04::
    ld   e, $00                                   ;; 02:5C04 $1E $00
    ld   d, e                                     ;; 02:5C06 $53
    ld   c, e                                     ;; 02:5C07 $4B
    ld   b, e                                     ;; 02:5C08 $43
    xor  a                                        ;; 02:5C09 $AF
    ldh  [hMultiPurposeC], a                      ;; 02:5C0A $E0 $E3
    ldh  [hMultiPurposeD], a                      ;; 02:5C0C $E0 $E4
    ldh  [hMultiPurposeE], a                      ;; 02:5C0E $E0 $E5
    ld   a, [wC189]                               ;; 02:5C10 $FA $89 $C1
    sub  $04                                      ;; 02:5C13 $D6 $04
    jr   z, jr_002_5C21                           ;; 02:5C15 $28 $0A

    ld   c, a                                     ;; 02:5C17 $4F
    xor  a                                        ;; 02:5C18 $AF

.loop_5C19
    add  $04                                      ;; 02:5C19 $C6 $04
    ld   e, a                                     ;; 02:5C1B $5F
    ld   d, $00                                   ;; 02:5C1C $16 $00
    dec  c                                        ;; 02:5C1E $0D
    jr   nz, .loop_5C19                           ;; 02:5C1F $20 $F8

jr_002_5C21:
    ld   hl, Data_002_5BE0                        ;; 02:5C21 $21 $E0 $5B
    ld   a, [wC189]                               ;; 02:5C24 $FA $89 $C1
    ld   c, a                                     ;; 02:5C27 $4F
    ld   b, $00                                   ;; 02:5C28 $06 $00
    add  hl, bc                                   ;; 02:5C2A $09
    ld   a, [hl]                                  ;; 02:5C2B $7E
    ld   hl, wC1D0                                ;; 02:5C2C $21 $D0 $C1
    add  hl, bc                                   ;; 02:5C2F $09
    add  [hl]                                     ;; 02:5C30 $86
    ldh  [hIntersectedObjectLeft], a              ;; 02:5C31 $E0 $CE

label_002_5C33:
    ld   hl, Data_002_5BE8                        ;; 02:5C33 $21 $E8 $5B
    ldh  a, [hMultiPurposeC]                      ;; 02:5C36 $F0 $E3
    ld   c, a                                     ;; 02:5C38 $4F
    add  hl, bc                                   ;; 02:5C39 $09
    ld   a, [wC189]                               ;; 02:5C3A $FA $89 $C1
    ld   c, a                                     ;; 02:5C3D $4F
    add  hl, bc                                   ;; 02:5C3E $09
    ld   a, [hl]                                  ;; 02:5C3F $7E
    ld   hl, wC1E0                                ;; 02:5C40 $21 $E0 $C1
    add  hl, bc                                   ;; 02:5C43 $09
    add  [hl]                                     ;; 02:5C44 $86
    ldh  [hIntersectedObjectTop], a               ;; 02:5C45 $E0 $CD
    ld   a, [wLinkMapEntryPositionY]              ;; 02:5C47 $FA $B2 $DB
    sub  $10                                      ;; 02:5C4A $D6 $10
    ld   hl, hIntersectedObjectTop                ;; 02:5C4C $21 $CD $FF
    sub  [hl]                                     ;; 02:5C4F $96
    add  $10                                      ;; 02:5C50 $C6 $10
    cp   $20                                      ;; 02:5C52 $FE $20
    jr   nc, .jr_5C6F                             ;; 02:5C54 $30 $19

    ld   a, [wLinkMapEntryPositionX]              ;; 02:5C56 $FA $B1 $DB
    sub  $08                                      ;; 02:5C59 $D6 $08
    ld   hl, hIntersectedObjectLeft               ;; 02:5C5B $21 $CE $FF
    sub  [hl]                                     ;; 02:5C5E $96
    add  $10                                      ;; 02:5C5F $C6 $10
    cp   $20                                      ;; 02:5C61 $FE $20
    jr   nc, .jr_5C6F                             ;; 02:5C63 $30 $0A

    ldh  a, [hLinkPositionX]                      ;; 02:5C65 $F0 $98
    ld   [wLinkMapEntryPositionX], a              ;; 02:5C67 $EA $B1 $DB
    ldh  a, [hLinkPositionY]                      ;; 02:5C6A $F0 $99
    ld   [wLinkMapEntryPositionY], a              ;; 02:5C6C $EA $B2 $DB

.jr_5C6F
    push de                                       ;; 02:5C6F $D5
    call label_2887                               ;; 02:5C70 $CD $87 $28
    pop  de                                       ;; 02:5C73 $D1
    ldh  a, [hMultiPurposeC]                      ;; 02:5C74 $F0 $E3
    and  a                                        ;; 02:5C76 $A7
    jr   z, .jr_5C7B                              ;; 02:5C77 $28 $02

    inc  de                                       ;; 02:5C79 $13
    inc  de                                       ;; 02:5C7A $13

.jr_5C7B
    ldh  a, [hIsGBC]                              ;; 02:5C7B $F0 $FE
    and  a                                        ;; 02:5C7D $A7
    jr   z, .jr_5C89                              ;; 02:5C7E $28 $09

    push de                                       ;; 02:5C80 $D5
    ld   a, $02                                   ;; 02:5C81 $3E $02
    ld   b, $01                                   ;; 02:5C83 $06 $01
    call func_999                                 ;; 02:5C85 $CD $99 $09
    pop  de                                       ;; 02:5C88 $D1

.jr_5C89
    ld   a, [wDrawCommandsSize]                   ;; 02:5C89 $FA $00 $D6
    ld   c, a                                     ;; 02:5C8C $4F
    ld   b, $00                                   ;; 02:5C8D $06 $00
    add  $05                                      ;; 02:5C8F $C6 $05
    ld   [wDrawCommandsSize], a                   ;; 02:5C91 $EA $00 $D6
    ld   hl, wDrawCommand                         ;; 02:5C94 $21 $01 $D6
    add  hl, bc                                   ;; 02:5C97 $09
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 02:5C98 $F0 $CF
    ld   [hl+], a                                 ;; 02:5C9A $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 02:5C9B $F0 $D0
    ld   [hl+], a                                 ;; 02:5C9D $22
    ld   a, $01                                   ;; 02:5C9E $3E $01
    ld   [hl+], a                                 ;; 02:5CA0 $22
    push hl                                       ;; 02:5CA1 $E5
    ld   hl, Data_002_5BC4                        ;; 02:5CA2 $21 $C4 $5B
    add  hl, de                                   ;; 02:5CA5 $19
    ld   a, [hl]                                  ;; 02:5CA6 $7E
    pop  hl                                       ;; 02:5CA7 $E1
    ld   [hl+], a                                 ;; 02:5CA8 $22
    push hl                                       ;; 02:5CA9 $E5
    ld   hl, Data_002_5BC5                        ;; 02:5CAA $21 $C5 $5B
    add  hl, de                                   ;; 02:5CAD $19
    ld   a, [hl]                                  ;; 02:5CAE $7E
    pop  hl                                       ;; 02:5CAF $E1
    ld   [hl], a                                  ;; 02:5CB0 $77
    ldh  a, [hMultiPurposeC]                      ;; 02:5CB1 $F0 $E3
    and  a                                        ;; 02:5CB3 $A7
    jr   nz, .jr_5CBD                             ;; 02:5CB4 $20 $07

    ld   a, $04                                   ;; 02:5CB6 $3E $04
    ldh  [hMultiPurposeC], a                      ;; 02:5CB8 $E0 $E3
    jp   label_002_5C33                           ;; 02:5CBA $C3 $33 $5C

.jr_5CBD
    xor  a                                        ;; 02:5CBD $AF
    inc  hl                                       ;; 02:5CBE $23
    ld   [hl], a                                  ;; 02:5CBF $77
    ld   a, [wDBAC]                               ;; 02:5CC0 $FA $AC $DB
    add  $01                                      ;; 02:5CC3 $C6 $01
    ld   [wDBAC], a                               ;; 02:5CC5 $EA $AC $DB
    ld   a, [wDBAC]                               ;; 02:5CC8 $FA $AC $DB
    cp   $08                                      ;; 02:5CCB $FE $08
    jr   nc, .jr_5CD0                             ;; 02:5CCD $30 $01

    ret                                           ;; 02:5CCF $C9

.jr_5CD0
    ldh  a, [hMultiPurposeE]                      ;; 02:5CD0 $F0 $E5
    and  a                                        ;; 02:5CD2 $A7
    jr   nz, .jr_5CE5                             ;; 02:5CD3 $20 $10

    xor  a                                        ;; 02:5CD5 $AF
    ldh  [hMultiPurposeC], a                      ;; 02:5CD6 $E0 $E3
    ld   a, e                                     ;; 02:5CD8 $7B
    add  $10                                      ;; 02:5CD9 $C6 $10
    ld   e, a                                     ;; 02:5CDB $5F
    ld   d, $00                                   ;; 02:5CDC $16 $00
    ldh  [hMultiPurposeE], a                      ;; 02:5CDE $E0 $E5
    dec  de                                       ;; 02:5CE0 $1B
    dec  de                                       ;; 02:5CE1 $1B
    jp   label_002_5C33                           ;; 02:5CE2 $C3 $33 $5C

.jr_5CE5
    xor  a                                        ;; 02:5CE5 $AF
    ld   [wC188], a                               ;; 02:5CE6 $EA $88 $C1
    ld   [wC1A8], a                               ;; 02:5CE9 $EA $A8 $C1
    xor  a                                        ;; 02:5CEC $AF
    ldh  [hMultiPurposeE], a                      ;; 02:5CED $E0 $E5
    ld   a, [wC189]                               ;; 02:5CEF $FA $89 $C1
    sub  $04                                      ;; 02:5CF2 $D6 $04
    ld   c, a                                     ;; 02:5CF4 $4F
    ld   b, $00                                   ;; 02:5CF5 $06 $00
    ld   hl, wC1F4                                ;; 02:5CF7 $21 $F4 $C1
    add  hl, bc                                   ;; 02:5CFA $09
    ld   a, [hl]                                  ;; 02:5CFB $7E
    ldh  [hMultiPurpose0], a                      ;; 02:5CFC $E0 $D7

.loop_5CFE
    ld   hl, Data_002_5BF4                        ;; 02:5CFE $21 $F4 $5B
    add  hl, bc                                   ;; 02:5D01 $09
    ld   a, [hl]                                  ;; 02:5D02 $7E
    ld   hl, hMultiPurpose0                       ;; 02:5D03 $21 $D7 $FF
    add  [hl]                                     ;; 02:5D06 $86
    ld   e, a                                     ;; 02:5D07 $5F
    ld   d, $00                                   ;; 02:5D08 $16 $00
    ld   hl, Data_002_5BFC                        ;; 02:5D0A $21 $FC $5B
    add  hl, bc                                   ;; 02:5D0D $09
    ld   a, [hl]                                  ;; 02:5D0E $7E
    ld   hl, wRoomObjects                         ;; 02:5D0F $21 $11 $D7
    add  hl, de                                   ;; 02:5D12 $19
    ld   [hl], a                                  ;; 02:5D13 $77
    ldh  a, [hMultiPurposeE]                      ;; 02:5D14 $F0 $E5
    and  a                                        ;; 02:5D16 $A7
    jr   nz, .jr_5D21                             ;; 02:5D17 $20 $08

    ld   a, c                                     ;; 02:5D19 $79
    add  $04                                      ;; 02:5D1A $C6 $04
    ldh  [hMultiPurposeE], a                      ;; 02:5D1C $E0 $E5
    ld   c, a                                     ;; 02:5D1E $4F
    jr   .loop_5CFE                               ;; 02:5D1F $18 $DD

.jr_5D21
    ld   hl, wOverworldRoomStatus                 ;; 02:5D21 $21 $00 $D8
    ld   a, [wIsIndoor]                           ;; 02:5D24 $FA $A5 $DB
    and  a                                        ;; 02:5D27 $A7
    jr   z, .jr_5D36                              ;; 02:5D28 $28 $0C

    ld   hl, wIndoorARoomStatus                   ;; 02:5D2A $21 $00 $D9
    ldh  a, [hMapId]                              ;; 02:5D2D $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 02:5D2F $FE $FF
    jr   nz, .jr_5D36                             ;; 02:5D31 $20 $03

    ld   hl, wColorDungeonRoomStatus              ;; 02:5D33 $21 $E0 $DD

.jr_5D36
    ldh  a, [hMapRoom]                            ;; 02:5D36 $F0 $F6
    ld   e, a                                     ;; 02:5D38 $5F
    ld   d, $00                                   ;; 02:5D39 $16 $00
    add  hl, de                                   ;; 02:5D3B $19
    push hl                                       ;; 02:5D3C $E5
    ld   a, [wC189]                               ;; 02:5D3D $FA $89 $C1
    ld   e, a                                     ;; 02:5D40 $5F
    ld   d, $00                                   ;; 02:5D41 $16 $00
    ld   hl, Data_002_5A60                        ;; 02:5D43 $21 $60 $5A
    add  hl, de                                   ;; 02:5D46 $19
    ld   a, [hl]                                  ;; 02:5D47 $7E
    cpl                                           ;; 02:5D48 $2F
    pop  hl                                       ;; 02:5D49 $E1
    and  [hl]                                     ;; 02:5D4A $A6
    ld   [hl], a                                  ;; 02:5D4B $77
    ldh  [hRoomStatus], a                         ;; 02:5D4C $E0 $F8
    ret                                           ;; 02:5D4E $C9

include "code/events.asm"

; Clamp the item count to a maximum value
; Inputs:
;   hl   address of maximum item count
;   de   address of current item count
ClampItemCount::
    ; If [de] >= [hl]…
    ld   a, [de]                                  ;; 02:60D8 $1A
    cp   [hl]                                     ;; 02:60D9 $BE
    jr   c, .return                               ;; 02:60DA $38 $02
    ; … [de] = [hl]
    ld   a, [hl]                                  ;; 02:60DC $7E
    ld   [de], a                                  ;; 02:60DD $12
.return
    inc  hl                                       ;; 02:60DE $23
    ret                                           ;; 02:60DF $C9

func_002_60E0::
    ; Clamp items count
    ld   hl, wMaxMagicPowder                      ;; 02:60E0 $21 $76 $DB
    ld   de, wMagicPowderCount                    ;; 02:60E3 $11 $4C $DB
    call ClampItemCount                           ;; 02:60E6 $CD $D8 $60
    ld   de, wBombCount                           ;; 02:60E9 $11 $4D $DB
    call ClampItemCount                           ;; 02:60EC $CD $D8 $60
    ld   de, wArrowCount                          ;; 02:60EF $11 $45 $DB
    call ClampItemCount                           ;; 02:60F2 $CD $D8 $60

    ; If Link is not interactive, return
    ld   a, [wLinkMotionState]                    ;; 02:60F5 $FA $1C $C1
    cp   LINK_MOTION_TYPE_NON_INTERACTIVE         ;; 02:60F8 $FE $02
    ret  nc                                       ;; 02:60FA $D0

    ld   a, [wDialogState]                        ;; 02:60FB $FA $9F $C1
    and  a                                        ;; 02:60FE $A7
    jp   nz, label_002_61E7.inventoryFullyClosed2 ;; 02:60FF $C2 $F5 $61

    ld   a, [wRoomTransitionState]                ;; 02:6102 $FA $24 $C1
    and  a                                        ;; 02:6105 $A7
    ret  nz                                       ;; 02:6106 $C0

    ; Handles subscreen transition state
    ld   a, [wInventoryAppearing]
    and  a                                        ;; 02:610A $A7
    jp   nz, .scrollSubscreen                     ;; 02:610B $C2 $A9 $61

    ; Checks if map should be opened
    ldh  a, [hPressedButtonsMask]
    and  J_SELECT                                 ;; 02:6110 $E6 $40
    jp   nz, label_002_61E7                       ;; 02:6112 $C2 $E7 $61

    ; Checks if subscreen should be opened?
    ldh  a, [hJoypadState]
    and  J_START                                  ;; 02:6117 $E6 $80
    jp   z, label_002_61E7                        ;; 02:6119 $CA $E7 $61

    ld   a, [wWindowY]                            ;; 02:611C $FA $9A $DB
IF __PATCH_0__
    cp   $00
ELSE
    and  a                                        ;; 02:611F $A7
ENDC
    jr   z, .jr_613D                              ;; 02:6120 $28 $1B

    ld   a, [wD464]                               ;; 02:6122 $FA $64 $D4
    and  a                                        ;; 02:6125 $A7
    jp   nz, label_002_61E7                       ;; 02:6126 $C2 $E7 $61

    ld   a, [wC167]                               ;; 02:6129 $FA $67 $C1
    and  a                                        ;; 02:612C $A7
    jp   nz, label_002_61E7                       ;; 02:612D $C2 $E7 $61

    ldh  a, [hLinkInteractiveMotionBlocked]       ;; 02:6130 $F0 $A1
    cp   $02                                      ;; 02:6132 $FE $02
    jp   z, label_002_61E7                        ;; 02:6134 $CA $E7 $61

    ldh  a, [hLinkAnimationState]                 ;; 02:6137 $F0 $9D
    inc  a                                        ;; 02:6139 $3C
    jp   z, label_002_61E7                        ;; 02:613A $CA $E7 $61

.jr_613D
    ld   a, [wOcarinaMenuOpen]                    ;; 02:613D $FA $B5 $C1
    ld   hl, wOcarinaMenuOpening                  ;; 02:6140 $21 $B8 $C1
    or   [hl]                                     ;; 02:6143 $B6
    ld   hl, wOcarinaMenuClosing                  ;; 02:6144 $21 $B9 $C1
    or   [hl]                                     ;; 02:6147 $B6
    jp   nz, label_002_61E7                       ;; 02:6148 $C2 $E7 $61

    ld   a, $01                                   ;; 02:614B $3E $01
    ld   [wInventoryAppearing], a                 ;; 02:614D $EA $4F $C1
    ld   [wInventoryShouldScroll], a              ;; 02:6150 $EA $51 $C1
    ld   a, JINGLE_CLOSE_INVENTORY                ;; 02:6153 $3E $12
    ldh  [hJingle], a                             ;; 02:6155 $E0 $F2
    ld   a, [wSubscreenScrollIncrement]           ;; 02:6157 $FA $50 $C1
    ; Two's complement; flip wSubscreenScrollIncrement
    ; from 8 ($08) to -8 ($F8) or vice versa
    cpl                                           ;; 02:615A $2F
    inc  a                                        ;; 02:615B $3C
    ld   [wSubscreenScrollIncrement], a           ;; 02:615C $EA $50 $C1
    ; Check if wSubscreenScrollIncrement is now positive, ie. the subscreen
    ; should scroll down (ie. it should close). This will never
    ; be true in DX, because when the subscreen is open
    ; we will never be at this point! Instead, it sets wGameplayType
    ; here and handles the rest of the subscreen with
    ; InventoryHandler.
    and  $80                                      ; POI: Zeroing this restores the scroll up/down subscreen????
    jr   z, .subscreenClosing                     ;; 02:6161 $28 $3C

    ; Subscreen should open
    xor  a                                        ;; 02:6163 $AF
    ld   [wTransitionSequenceCounter], a          ;; 02:6164 $EA $6B $C1
    ld   [wC16C], a                               ;; 02:6167 $EA $6C $C1
    ldh  [hPressedButtonsMask], a                 ;; 02:616A $E0 $CB
    ldh  [hJoypadState], a                        ;; 02:616C $E0 $CC
    ; Set wGameplaySubtype to GAMEPLAY_INVENTORY_INITIAL
    ; which means that after this subroutine returns,
    ; InventoryHandler will take care of the rest of the
    ; steps needed to open the subscreen
    ld   [wGameplaySubtype], a                    ;; 02:616E $EA $96 $DB
    ld   a, GAMEPLAY_INVENTORY                    ;; 02:6171 $3E $0C
    ld   [wGameplayType], a                       ;; 02:6173 $EA $95 $DB
    ld   a, JINGLE_OPEN_INVENTORY                 ;; 02:6176 $3E $11
    ldh  [hJingle], a                             ;; 02:6178 $E0 $F2
    xor  a                                        ;; 02:617A $AF
    ld   [wInventoryShouldScroll], a              ;; 02:617B $EA $51 $C1
    ld   a, $0B                                   ;; 02:617E $3E $0B
    ld   [wC154], a                               ;; 02:6180 $EA $54 $C1
    ld   a, [wIsIndoor]                           ;; 02:6183 $FA $A5 $DB
    and  a                                        ;; 02:6186 $A7
    ld   a, TILESET_LOAD_INVENTORY                ;; 02:6187 $3E $07
    ; Partially determines if subscreen dungeon map should be drawn
    jr   z, .loadTileSet

    ldh  a, [hMapId]                              ;; 02:618B $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 02:618D $FE $FF
    jr   z, .loadMiniMap                          ;; 02:618F $28 $06

    cp   MAP_WINDFISHS_EGG                        ;; 02:6191 $FE $08
    ld   a, TILESET_LOAD_INVENTORY                ;; 02:6193 $3E $07
    jr   nc, .loadTileSet                         ;; 02:6195 $30 $05

.loadMiniMap
    call LoadMinimap                              ;; 02:6197 $CD $09 $67
    ld   a, TILESET_LOAD_DUNGEON_MINIMAP          ;; 02:619A $3E $02

.loadTileSet
    ldh  [hNeedsUpdatingBGTiles], a               ;; 02:619C $E0 $90
    ret                                           ;; 02:619E $C9

.subscreenClosing:
    ; Subscreen should close
    ; This code is never executed on DX, handled by
    ; InventoryHandler instead
    ld   a, $07                                   ;; 02:619F $3E $07
    ldh  [hVolumeRight], a                        ;; 02:61A1 $E0 $A9
    ld   a, $70                                   ;; 02:61A3 $3E $70
    ldh  [hVolumeLeft], a                         ;; 02:61A5 $E0 $AA
    pop  af                                       ;; 02:61A7 $F1
    ret                                           ;; 02:61A8 $C9

; Actually scroll the subscreen
.scrollSubscreen:
    ld   a, [wInventoryShouldScroll]              ;; 02:61A9 $FA $51 $C1
    and  a                                        ;; 02:61AC $A7
    jr   nz, jr_002_61C6                          ;; 02:61AD $20 $17

    ld   a, [wDrawCommand]                        ;; 02:61AF $FA $01 $D6
    and  a                                        ;; 02:61B2 $A7
    jr   nz, .jr_61B9                             ;; 02:61B3 $20 $04

    ld   hl, wInventoryShouldScroll               ;; 02:61B5 $21 $51 $C1
    inc  [hl]                                     ;; 02:61B8 $34

.jr_61B9
    pop  af                                       ;; 02:61B9 $F1

func_002_61BA::
    call func_002_755B                            ;; 02:61BA $CD $5B $75
    call ApplyLinkMotionState.skipInitialCall     ;; 02:61BD $CD $97 $17
    call DrawLinkSpriteAndReturn                  ;; 02:61C0 $CD $2E $1D
    jp   AnimateEntitiesAndRestoreBank02          ;; 02:61C3 $C3 $05 $0F

jr_002_61C6:
    ; Get the increment value for the scrolling subscreen
    ; and apply it to wWindowY
    ld   a, [wSubscreenScrollIncrement]           ;; 02:61C6 $FA $50 $C1
    ld   hl, wWindowY                             ;; 02:61C9 $21 $9A $DB
    add  [hl]                                     ;; 02:61CC $86
    ld   [hl], a                                  ;; 02:61CD $77
    ; Is the window/subscreen now at the bottom of the screen?
    cp   $80                                      ;; 02:61CE $FE $80
    jr   z, .subscreenClosed                      ;; 02:61D0 $28 $0C

    ; Is the window/subscreen now at the top of the screen?
    cp   $00                                      ;; 02:61D2 $FE $00
    jr   nz, .subscreenScrolling                  ;; 02:61D4 $20 $0E

    ; Subscreen fully open:
    ld   a, $03                                   ;; 02:61D6 $3E $03
    ldh  [hVolumeRight], a                        ;; 02:61D8 $E0 $A9
    ld   a, $30                                   ;; 02:61DA $3E $30
    ldh  [hVolumeLeft], a                         ;; 02:61DC $E0 $AA

.subscreenClosed
    xor  a                                        ;; 02:61DE $AF
    ld   [wInventoryAppearing], a                 ;; 02:61DF $EA $4F $C1
    jr   label_002_61E7                      ; .inventoryNotScrolling                           ;; 02:61E2 $18 $03

.subscreenScrolling:
    call func_002_61BA                            ;; 02:61E4 $CD $BA $61

;.inventoryNotScrolling:
label_002_61E7:
    ld   a, [wWindowY]                            ;; 02:61E7 $FA $9A $DB
    cp   $80                                      ;; 02:61EA $FE $80
    jr   z, .inventoryFullyClosed2                ;; 02:61EC $28 $07

    ld   a, [wInventoryAppearing]                 ;; 02:61EE $FA $4F $C1
    and  a                                        ;; 02:61F1 $A7
    jr   nz, .inventoryScrolling2                 ;; 02:61F2 $20 $00

.inventoryScrolling2
    pop  af                                       ;; 02:61F4 $F1

.inventoryFullyClosed2:
    ld   a, [wDialogState]                        ;; 02:61F5 $FA $9F $C1
    and  ~DIALOG_BOX_BOTTOM_FLAG                  ;; 02:61F8 $E6 $7F
    jr   z, .dialogClosed                         ;; 02:61FA $28 $07

    cp   DIALOG_END                               ;; 02:61FC $FE $0C
    jr   z, .dialogClosed                         ;; 02:61FE $28 $03

    cp   DIALOG_CHOICE                            ;; 02:6200 $FE $0D
    ret  nz                                       ;; 02:6202 $C0

.dialogClosed
    call UpdateRupeesCount                        ;; 02:6203 $CD $09 $62
    jp   UpdateHealth                             ;; 02:6206 $C3 $17 $63

; Decrement the rupees count and play the associated sound effect
UpdateRupeesCount::
    ld   hl, wDrawCommandsSize                    ;; 02:6209 $21 $00 $D6
    ldh  a, [hFrameCounter]                       ;; 02:620C $F0 $E7
    and  $01                                      ;; 02:620E $E6 $01
    or   [hl]                                     ;; 02:6210 $B6
    ret  nz                                       ;; 02:6211 $C0

    ld   hl, wC3CE                                ;; 02:6212 $21 $CE $C3
    ld   a, [hl]                                  ;; 02:6215 $7E
    and  a                                        ;; 02:6216 $A7
    jr   z, .C3CENotZero                          ;; 02:6217 $28 $02

    dec  [hl]                                     ;; 02:6219 $35
    ret                                           ;; 02:621A $C9
.C3CENotZero

    ld   hl, wAddRupeeBufferHigh                  ;; 02:621B $21 $8F $DB
    ld   a, [wAddRupeeBufferLow]                  ;; 02:621E $FA $90 $DB
    or   [hl]                                     ;; 02:6221 $B6
    jr   z, .jr_002_6274                          ;; 02:6222 $28 $50

    ld   a, WAVE_SFX_RUPEE                        ;; 02:6224 $3E $05
    ldh  [hWaveSfx], a                            ;; 02:6226 $E0 $F3
    ld   a, [wAddRupeeBufferLow]                  ;; 02:6228 $FA $90 $DB
    ld   e, a                                     ;; 02:622B $5F
    ld   a, [wAddRupeeBufferHigh]                 ;; 02:622C $FA $8F $DB
    sla  e                                        ;; 02:622F $CB $23
    rla                                           ;; 02:6231 $17
    sla  e                                        ;; 02:6232 $CB $23
    rla                                           ;; 02:6234 $17
    sla  e                                        ;; 02:6235 $CB $23
    rla                                           ;; 02:6237 $17
    inc  a                                        ;; 02:6238 $3C
    cp   $0A                                      ;; 02:6239 $FE $0A
    jr   c, .noReinitTo9                          ;; 02:623B $38 $02

    ld   a, $09                                   ;; 02:623D $3E $09
.noReinitTo9

    ld   e, a                                     ;; 02:623F $5F
    ld   a, [wAddRupeeBufferLow]                  ;; 02:6240 $FA $90 $DB
    sub  e                                        ;; 02:6243 $93
    ld   [wAddRupeeBufferLow], a                  ;; 02:6244 $EA $90 $DB
    ld   a, [hl]                                  ;; 02:6247 $7E
    sbc  $00                                      ;; 02:6248 $DE $00
    ld   [hl], a                                  ;; 02:624A $77
    ld   a, [wRupeeCountLow]                      ;; 02:624B $FA $5E $DB
    add  e                                        ;; 02:624E $83
    daa                                           ;; 02:624F $27
    ld   [wRupeeCountLow], a                      ;; 02:6250 $EA $5E $DB
    ld   a, [wRupeeCountHigh]                     ;; 02:6253 $FA $5D $DB
    adc  $00                                      ;; 02:6256 $CE $00
    daa                                           ;; 02:6258 $27
    ld   [wRupeeCountHigh], a                     ;; 02:6259 $EA $5D $DB
    cp   $10                                      ;; 02:625C $FE $10
    jr   c, .rupeesLessThan16                     ;; 02:625E $38 $11

    ld   a, $09                                   ;; 02:6260 $3E $09
    ld   [wRupeeCountHigh], a                     ;; 02:6262 $EA $5D $DB
    ld   a, $99                                   ;; 02:6265 $3E $99
    ld   [wRupeeCountLow], a                      ;; 02:6267 $EA $5E $DB
    xor  a                                        ;; 02:626A $AF
    ld   [wAddRupeeBufferHigh], a                 ;; 02:626B $EA $8F $DB
    ld   [wAddRupeeBufferLow], a                  ;; 02:626E $EA $90 $DB
.rupeesLessThan16

    call LoadRupeesDigits                         ;; 02:6271 $CD $CE $62

.jr_002_6274
    ld   hl, wSubstractRupeeBufferHigh            ;; 02:6274 $21 $91 $DB
    ld   a, [wSubstractRupeeBufferLow]            ;; 02:6277 $FA $92 $DB
    or   [hl]                                     ;; 02:627A $B6
    ret  z                                        ;; 02:627B $C8

    ld   a, NOISE_SFX_CUT_GRASS                   ;; 02:627C $3E $05
    ldh  [hWaveSfx], a                            ;; 02:627E $E0 $F3
    ld   a, [wSubstractRupeeBufferLow]            ;; 02:6280 $FA $92 $DB
    ld   e, a                                     ;; 02:6283 $5F
    ld   a, [wSubstractRupeeBufferHigh]           ;; 02:6284 $FA $91 $DB
    sla  e                                        ;; 02:6287 $CB $23
    rla                                           ;; 02:6289 $17
    sla  e                                        ;; 02:628A $CB $23
    rla                                           ;; 02:628C $17
    sla  e                                        ;; 02:628D $CB $23
    rla                                           ;; 02:628F $17
    inc  a                                        ;; 02:6290 $3C
    cp   $0A                                      ;; 02:6291 $FE $0A
    jr   c, .rupeesNot0A                          ;; 02:6293 $38 $02
    ld   a, $09                                   ;; 02:6295 $3E $09
.rupeesNot0A

    ; If wRupeeCountLow == 0 || wRupeeCountHigh == 0, return
    ld   e, a                                     ;; 02:6297 $5F
    ld   a, [wSubstractRupeeBufferLow]            ;; 02:6298 $FA $92 $DB
    sub  e                                        ;; 02:629B $93
    ld   [wSubstractRupeeBufferLow], a            ;; 02:629C $EA $92 $DB
    ld   a, [hl]                                  ;; 02:629F $7E
    sbc  $00                                      ;; 02:62A0 $DE $00
    ld   [hl], a                                  ;; 02:62A2 $77
    ld   a, [wRupeeCountLow]                      ;; 02:62A3 $FA $5E $DB
    ld   hl, wRupeeCountHigh                      ;; 02:62A6 $21 $5D $DB
    or   [hl]                                     ;; 02:62A9 $B6
    ret  z                                        ;; 02:62AA $C8

    ld   a, [wRupeeCountLow]                      ;; 02:62AB $FA $5E $DB
    sub  e                                        ;; 02:62AE $93
    daa                                           ;; 02:62AF $27
    ld   [wRupeeCountLow], a                      ;; 02:62B0 $EA $5E $DB
    ld   a, [wRupeeCountHigh]                     ;; 02:62B3 $FA $5D $DB
    sbc  $00                                      ;; 02:62B6 $DE $00
    daa                                           ;; 02:62B8 $27
    ld   [wRupeeCountHigh], a                     ;; 02:62B9 $EA $5D $DB
    jr   nc, .resetEnd                            ;; 02:62BC $30 $0D

    ; Reset rupees counters
    xor  a                                        ;; 02:62BE $AF
    ld   [wRupeeCountHigh], a                     ;; 02:62BF $EA $5D $DB
    ld   [wRupeeCountLow], a                      ;; 02:62C2 $EA $5E $DB
    ld   [wSubstractRupeeBufferHigh], a           ;; 02:62C5 $EA $91 $DB
    ld   [wSubstractRupeeBufferLow], a            ;; 02:62C8 $EA $92 $DB
.resetEnd

    jp   LoadRupeesDigits                         ;; 02:62CB $C3 $CE $62

; Load the rupees digit tiles for the current rupees count
LoadRupeesDigits::
    ld   a, [wDrawCommandsSize]                   ;; 02:62CE $FA $00 $D6
    ld   e, a                                     ;; 02:62D1 $5F
    ld   d, $00                                   ;; 02:62D2 $16 $00
    add  $06                                      ;; 02:62D4 $C6 $06
    ld   [wDrawCommandsSize], a                   ;; 02:62D6 $EA $00 $D6
    ld   hl, wDrawCommand                         ;; 02:62D9 $21 $01 $D6
    add  hl, de                                   ;; 02:62DC $19
    ld   a, $9C                                   ;; 02:62DD $3E $9C
    ld   [hl+], a                                 ;; 02:62DF $22
    ld   a, $2A                                   ;; 02:62E0 $3E $2A
    ld   [hl+], a                                 ;; 02:62E2 $22
    ld   a, $02                                   ;; 02:62E3 $3E $02
    ld   [hl+], a                                 ;; 02:62E5 $22
    push hl                                       ;; 02:62E6 $E5
    ld   a, [wRupeeCountHigh]                     ;; 02:62E7 $FA $5D $DB
    and  $0F                                      ;; 02:62EA $E6 $0F
    ld   e, a                                     ;; 02:62EC $5F
    add  $B0                                      ;; 02:62ED $C6 $B0
    pop  hl                                       ;; 02:62EF $E1
    ld   [hl+], a                                 ;; 02:62F0 $22
    push hl                                       ;; 02:62F1 $E5
    ld   a, [wRupeeCountLow]                      ;; 02:62F2 $FA $5E $DB
    swap a                                        ;; 02:62F5 $CB $37
    and  $0F                                      ;; 02:62F7 $E6 $0F
    add  $B0                                      ;; 02:62F9 $C6 $B0
    pop  hl                                       ;; 02:62FB $E1
    ld   [hl+], a                                 ;; 02:62FC $22
    push hl                                       ;; 02:62FD $E5
    ld   a, [wRupeeCountLow]                      ;; 02:62FE $FA $5E $DB
    and  $0F                                      ;; 02:6301 $E6 $0F
    add  $B0                                      ;; 02:6303 $C6 $B0
    pop  hl                                       ;; 02:6305 $E1
    ld   [hl+], a                                 ;; 02:6306 $22
    db   $3E                                      ;; 02:6307 $3E

; Table that defines what counts as low health when having XX max hearts.
ThresholdLowHealthTable::
    db   $00 ;  0 max hearts
    db   $22 ;  1 max hearts
    db   $C9 ;  2 max hearts
    db   $05 ;  3 max hearts
    db   $05 ;  4 max hearts
    db   $05 ;  5 max hearts
    db   $09 ;  6 max hearts
    db   $09 ;  7 max hearts
    db   $09 ;  8 max hearts
    db   $11 ;  9 max hearts
    db   $11 ; 10 max hearts
    db   $11 ; 11 max hearts
    db   $19 ; 12 max hearts
    db   $19 ; 13 max hearts
    db   $19 ; 14 max hearts

UpdateHealth:
    ; $wIsOnLowHeath = False
    xor  a                                        ;; 02:6317 $AF
    ld   [wIsOnLowHeath], a                       ;; 02:6318 $EA $63 $C1
    ; de = 0x00 | $wMaxHearts
    ld   a, [wMaxHearts]                          ;; 02:631B $FA $5B $DB
    ld   e, a                                     ;; 02:631E $5F
    ld   d, $00                                   ;; 02:631F $16 $00
    ; if wHealth is above threshold skip low health section
    ld   hl, ThresholdLowHealthTable              ;; 02:6321 $21 $08 $63
    add  hl, de                                   ;; 02:6324 $19
    ld   a, [wHealth]                             ;; 02:6325 $FA $5A $DB
    cp   [hl]                                     ;; 02:6328 $BE
    jr   nc, .increaseHealth                      ;; 02:6329 $30 $17

    ; $wIsOnLowHealth = True
    ld   a, TRUE                                  ;; 02:632B $3E $01
    ld   [wIsOnLowHeath], a                       ;; 02:632D $EA $63 $C1
    ; if $wTimeToNextLowHealthSFX == 0 play low hearts sound
    ld   a, [wTimeToNextLowHealthSFX]             ;; 02:6330 $FA $10 $C1
    dec  a                                        ;; 02:6333 $3D
    ; could be easier done with jr c, .savewTimeToNextLowHealthSFX
    cp   $FF                                      ;; 02:6334 $FE $FF
    jr   nz, .savewTimeToNextLowHealthSFX         ;; 02:6336 $20 $07
    ; play low hearts sound
    ld   a, LOW_HEALTH_SFX_PAUSE                  ;; 02:6338 $3E $30
    ld   hl, hWaveSfx                             ;; 02:633A $21 $F3 $FF
    ld   [hl], WAVE_SFX_LOW_HEARTS                ;; 02:633D $36 $04

.savewTimeToNextLowHealthSFX:
    ; if $wTimeToNextLowHealthSFX > 0: $wTimeToNextLowHealthSFX -= 1
    ; else:                           $wTimeToNextLowHealthSFX  = LOW_HEALTH_PEEP_PAUSE
    ld   [wTimeToNextLowHealthSFX], a             ;; 02:633F $EA $10 $C1

.increaseHealth:
    ; return if even frame
    ldh  a, [hFrameCounter]                       ;; 02:6342 $F0 $E7
    and  $01                                      ;; 02:6344 $E6 $01
    jr   z, .return2                              ;; 02:6346 $28 $5A
    ; return if background copy was not executed yet
    ld   a, [wDrawCommandsSize]                   ;; 02:6348 $FA $00 $D6
    and  a                                        ;; 02:634B $A7
    jr   nz, .return2                             ;; 02:634C $20 $54
    ; if no health has to be added go to health reduce section
    ld   a, [wAddHealthBuffer]                    ;; 02:634E $FA $93 $DB
    and  a                                        ;; 02:6351 $A7
    jr   z, .reduceHealth                         ;; 02:6352 $28 $31
    ; decrease $wAddHealthBuffer
    dec  a                                        ;; 02:6354 $3D
    ld   [wAddHealthBuffer], a                    ;; 02:6355 $EA $93 $DB
    ; cap $wMaxHearts at $0E
    ld   a, [wMaxHearts]                          ;; 02:6358 $FA $5B $DB
    cp   $0F                                      ;; 02:635B $FE $0F
    jr   c, .skipSetMaxHeartsCap                  ;; 02:635D $38 $02
    ld   a, $0E                                   ;; 02:635F $3E $0E

.skipSetMaxHeartsCap:
    ; e = $wMaxHearts * 8
    sla  a                                        ;; 02:6361 $CB $27
    sla  a                                        ;; 02:6363 $CB $27
    sla  a                                        ;; 02:6365 $CB $27
    ld   e, a                                     ;; 02:6367 $5F
    ; if not all full health => increase health
    ld   a, [wHealth]                             ;; 02:6368 $FA $5A $DB
    cp   e                                        ;; 02:636B $BB
    jr   nz, .incrementHealth                     ;; 02:636C $20 $06
    ; reset $wAddHealthBuffer to 0
    xor  a                                        ;; 02:636E $AF
    ld   [wAddHealthBuffer], a                    ;; 02:636F $EA $93 $DB
    jr   .reduceHealth                            ;; 02:6372 $18 $11

.incrementHealth:
    ; increment $wHealth by 1
    inc  a                                        ;; 02:6374 $3C
    ld   [wHealth], a                             ;; 02:6375 $EA $5A $DB
    ; if one heart is filled up play picked up sound
    and  ONE_HEART-1                              ;; 02:6378 $E6 $07
    cp   ONE_HEART-2                              ;; 02:637A $FE $06
    jr   nz, .skipPickupSound                     ;; 02:637C $20 $04
    ld   a, WAVE_SFX_HEART_PICKED_UP              ;; 02:637E $3E $06
    ldh  [hWaveSfx], a                            ;; 02:6380 $E0 $F3

.skipPickupSound:
    jp   LoadHeartsCount                          ;; 02:6382 $C3 $14 $64

.reduceHealth:
    ; return if health will not be reudced
    ld   a, [wSubtractHealthBuffer]               ;; 02:6385 $FA $94 $DB
    and  a                                        ;; 02:6388 $A7
    jr   z, .return2                              ;; 02:6389 $28 $17
    ; decrement the buffer
    dec  a                                        ;; 02:638B $3D
    ld   [wSubtractHealthBuffer], a               ;; 02:638C $EA $94 $DB
    ; if $wHealth != 0 decrement it
    ld   a, [wHealth]                             ;; 02:638F $FA $5A $DB
    and  a                                        ;; 02:6392 $A7
    jr   z, .skipDecrementHealth                  ;; 02:6393 $28 $04
    dec  a                                        ;; 02:6395 $3D
    ld   [wHealth], a                             ;; 02:6396 $EA $5A $DB

.skipDecrementHealth:
    call LoadHeartsCount                          ;; 02:6399 $CD $14 $64
    ; return if player has health
    ld   a, [wHealth]                             ;; 02:639C $FA $5A $DB
    and  a                                        ;; 02:639F $A7
    jr   z, .noHealth                             ;; 02:63A0 $28 $01

.return2:
    ret                                           ;; 02:63A2 $C9

.noHealth:
    ; return if player has no medicine
    ld   a, [wHasMedicine]                        ;; 02:63A3 $FA $0D $DB
    and  a                                        ;; 02:63A6 $A7
    jr   z, .return                               ;; 02:63A7 $28 $55
    ; consume one medicine
    dec  a                                        ;; 02:63A9 $3D
    ld   [wHasMedicine], a                        ;; 02:63AA $EA $0D $DB
    ; add one heart to the $wHealth
    ld   a, ONE_HEART                             ;; 02:63AD $3E $08
    ld   [wHealth], a                             ;; 02:63AF $EA $5A $DB
    ; add 16 hearts to the wAddHealthBuffer
    ld   a, [wAddHealthBuffer]                    ;; 02:63B2 $FA $93 $DB
    add  ONE_HEART*16                             ;; 02:63B5 $C6 $80
    ld   [wAddHealthBuffer], a                    ;; 02:63B7 $EA $93 $DB
    ; make player invincible so no damage can be taken some time
    ld   a, DAMAGE_COOLDOWN_TIME                  ;; 02:63BA $3E $A0
    ld   [wInvincibilityCounter], a               ;; 02:63BC $EA $C7 $DB
    ; TODO: comment what is going one here
    ld   a, [wDrawCommandsSize]                   ;; 02:63BF $FA $00 $D6
    ld   e, a                                     ;; 02:63C2 $5F
    ld   d, $00                                   ;; 02:63C3 $16 $00
    add  $04                                      ;; 02:63C5 $C6 $04
    ld   [wDrawCommandsSize], a                   ;; 02:63C7 $EA $00 $D6
    ld   hl, wDrawCommand                             ; POI: Updates (old) medicine counter on the subscreen
    add  hl, de                                   ;; 02:63CD $19
    ld   a, $9C                                   ;; 02:63CE $3E $9C
    ld   [hl+], a                                 ;; 02:63D0 $22
    ld   a, $93                                   ;; 02:63D1 $3E $93
    ld   [hl+], a                                 ;; 02:63D3 $22
    ld   a, $00                                   ;; 02:63D4 $3E $00
    ld   [hl+], a                                 ;; 02:63D6 $22
    ld   a, [wHasMedicine]                        ;; 02:63D7 $FA $0D $DB
    add  $B0                                      ;; 02:63DA $C6 $B0
    cp   $B0                                      ;; 02:63DC $FE $B0
    jr   z, .jr_002_63E4                          ;; 02:63DE $28 $04

    ld   [hl+], a                                 ;; 02:63E0 $22
    xor  a                                        ;; 02:63E1 $AF
    ld   [hl], a                                  ;; 02:63E2 $77
    ret                                           ;; 02:63E3 $C9

.jr_002_63E4
    ld   a, $7F                                   ;; 02:63E4 $3E $7F
    ld   [hl+], a                                 ;; 02:63E6 $22
    ld   a, $9C                                   ;; 02:63E7 $3E $9C
    ld   [hl+], a                                 ;; 02:63E9 $22
    ld   a, $72                                   ;; 02:63EA $3E $72
    ld   [hl+], a                                 ;; 02:63EC $22
    ld   a, $C1                                   ;; 02:63ED $3E $C1
    ld   [hl+], a                                 ;; 02:63EF $22
    ld   a, $7F                                   ;; 02:63F0 $3E $7F
    ld   [hl+], a                                 ;; 02:63F2 $22
    xor  a                                        ;; 02:63F3 $AF
    ld   [hl], a                                  ;; 02:63F4 $77
    ld   a, [wDrawCommandsSize]                   ;; 02:63F5 $FA $00 $D6
    add  $04                                      ;; 02:63F8 $C6 $04
    ld   [wDrawCommandsSize], a                   ;; 02:63FA $EA $00 $D6
    ret                                           ;; 02:63FD $C9

.return:
    ret                                           ;; 02:63FE $C9

Data_002_63FF::
    db   $9C, $0D, $06, $7F, $7F, $7F, $7F, $7F, $7F, $7F, $9C, $2D, $06, $7F, $7F, $7F
    db   $7F, $7F, $7F, $7F, $00

LoadHeartsCount::
    ld   a, [wDrawCommandsSize]                   ;; 02:6414 $FA $00 $D6
    ld   e, a                                     ;; 02:6417 $5F
    ld   d, $00                                   ;; 02:6418 $16 $00
    add  $14                                      ;; 02:641A $C6 $14
    ld   [wDrawCommandsSize], a                   ;; 02:641C $EA $00 $D6
    ld   hl, wDrawCommand                         ;; 02:641F $21 $01 $D6
    add  hl, de                                   ;; 02:6422 $19
    push de                                       ;; 02:6423 $D5
    ld   bc, Data_002_63FF                        ;; 02:6424 $01 $FF $63
    ld   e, $15                                   ;; 02:6427 $1E $15

.loop
    ld   a, [bc]                                  ;; 02:6429 $0A
    inc  bc                                       ;; 02:642A $03
    ld   [hl+], a                                 ;; 02:642B $22
    dec  e                                        ;; 02:642C $1D
    jr   nz, .loop                                ;; 02:642D $20 $FA

    nop                                           ;; 02:642F $00
    nop                                           ;; 02:6430 $00
    nop                                           ;; 02:6431 $00
    nop                                           ;; 02:6432 $00
    pop  de                                       ;; 02:6433 $D1
    ld   hl, wDrawCommand.data                    ;; 02:6434 $21 $04 $D6
    add  hl, de                                   ;; 02:6437 $19
    ld   c, $00                                   ;; 02:6438 $0E $00
    ld   a, [wHealth]                             ;; 02:643A $FA $5A $DB
    and  a                                        ;; 02:643D $A7
    jr   z, jr_002_6462                           ;; 02:643E $28 $22

    ldh  [hMultiPurpose0], a                      ;; 02:6440 $E0 $D7

jr_002_6442:
    ldh  a, [hMultiPurpose0]                      ;; 02:6442 $F0 $D7
    sub  $08                                      ;; 02:6444 $D6 $08
    ldh  [hMultiPurpose0], a                      ;; 02:6446 $E0 $D7
    jr   c, jr_002_6459                           ;; 02:6448 $38 $0F

    ld   a, $A9                                   ;; 02:644A $3E $A9
    ld   [hl+], a                                 ;; 02:644C $22
    inc  c                                        ;; 02:644D $0C
    ld   a, c                                     ;; 02:644E $79
    cp   $07                                      ;; 02:644F $FE $07
    jr   nz, .jr_6457                             ;; 02:6451 $20 $04

    ld   a, l                                     ;; 02:6453 $7D
    add  $03                                      ;; 02:6454 $C6 $03
    ld   l, a                                     ;; 02:6456 $6F

.jr_6457
    jr   jr_002_6442                              ;; 02:6457 $18 $E9

jr_002_6459:
    add  $08                                      ;; 02:6459 $C6 $08
    jr   z, jr_002_6462                           ;; 02:645B $28 $05

    ld   a, $CE                                   ;; 02:645D $3E $CE
    ld   [hl+], a                                 ;; 02:645F $22
    jr   jr_002_646B                              ;; 02:6460 $18 $09

jr_002_6462:
    ld   a, [wMaxHearts]                          ;; 02:6462 $FA $5B $DB
    cp   c                                        ;; 02:6465 $B9
    jr   z, jr_002_6477                           ;; 02:6466 $28 $0F

    ld   a, $CD                                   ;; 02:6468 $3E $CD
    ld   [hl+], a                                 ;; 02:646A $22

jr_002_646B:
    inc  c                                        ;; 02:646B $0C
    ld   a, c                                     ;; 02:646C $79
    cp   $07                                      ;; 02:646D $FE $07
    jr   nz, .jr_6475                             ;; 02:646F $20 $04

    ld   a, l                                     ;; 02:6471 $7D
    add  $03                                      ;; 02:6472 $C6 $03
    ld   l, a                                     ;; 02:6474 $6F

.jr_6475
    jr   jr_002_6462                              ;; 02:6475 $18 $EB

jr_002_6477:
    ret                                           ;; 02:6477 $C9

    and  a                                        ;; 02:6478 $A7

MinimapsTable::
include "data/minimaps.asm"
include "code/minimap.asm"

Data_002_68AB::
    db   $00, $08, $F8

Data_002_68AE::
    db   $00, $F0, $10

Data_002_68B1::
    db   $00, $10, $F0

Data_002_68B4::
    db   $FF, $00, $01

; Side-scrolling collisions
jp_002_68B7::
    ; Return if Link is not in the air, and it's interactive motion is blocked.
    ld   a, [wIsLinkInTheAir]                     ;; 02:68B7 $FA $46 $C1
    and  a                                        ;; 02:68BA $A7
    jr   nz, .notInTheAirEnd                      ;; 02:68BB $20 $0A

    ldh  a, [hLinkInteractiveMotionBlocked]       ;; 02:68BD $F0 $A1
    cp   $01                                      ;; 02:68BF $FE $01
    jr   z, .return                               ;; 02:68C1 $28 $20

    cp   $02                                      ;; 02:68C3 $FE $02
    jr   z, .return                               ;; 02:68C5 $28 $1C
.notInTheAirEnd

    ld   a, [wIgnoreLinkCollisionsCountdown]      ;; 02:68C7 $FA $3E $C1
    and  a                                        ;; 02:68CA $A7
    jr   z, .ignoreCollisionsEnd                  ;; 02:68CB $28 $17

    ; Decrement wIgnoreLinkCollisionsCountdown
    dec  a                                        ;; 02:68CD $3D
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 02:68CE $EA $3E $C1

    call UpdateFinalLinkPosition                  ;; 02:68D1 $CD $A8 $21
    call CheckPositionForMapTransition            ;; 02:68D4 $CD $75 $6C

    ; If Link is ???, increment its vertical speed
    ldh  a, [hLinkPhysicsModifier]                ;; 02:68D7 $F0 $9C
    cp   $02                                      ;; 02:68D9 $FE $02
    jr   z, .return                               ;; 02:68DB $28 $06
    ldh  a, [hLinkSpeedY]                         ;; 02:68DD $F0 $9B
    add  $03                                      ;; 02:68DF $C6 $03
    ldh  [hLinkSpeedY], a                         ;; 02:68E1 $E0 $9B

.return
    ret                                           ;; 02:68E3 $C9

.ignoreCollisionsEnd

    ldh  a, [hLinkPhysicsModifier]                ;; 02:68E4 $F0 $9C
    JP_TABLE                                      ;; 02:68E6
._00 dw LinkSideScrollingPhysicsHandler           ;; 02:68E7
._01 dw LinkSideScrollingLadderPhysicsHandler     ;; 02:68E9
._02 dw LinkSideScrollingDivingPhysicsHandler     ;; 02:68EB

Data_002_68ED::
    db   $00, $08, $F8, $00, $00, $06, $FA, $00, $00, $06, $FA, $00, $00, $00, $00, $00

Data_002_68FD::
    db   $00, $00, $00, $00, $F8, $FA, $FA, $00, $08, $06, $06, $00, $00, $00, $00, $00

Data_002_690D::
    db   $00, $00, $01

LinkSideScrollingDivingPhysicsHandler::
    ldh  a, [hMapId]                              ;; 02:6910 $F0 $F7
    cp   MAP_TURTLE_ROCK                          ;; 02:6912 $FE $07
    jr   nz, .lavaEnd                             ;; 02:6914 $20 $15

    ; Water is lava!
    call label_002_7719                           ;; 02:6916 $CD $19 $77
    ld   a, [wSubtractHealthBuffer]               ;; 02:6919 $FA $94 $DB
    add  $04                                      ;; 02:691C $C6 $04
    ld   [wSubtractHealthBuffer], a               ;; 02:691E $EA $94 $DB
    ld   a, WAVE_SFX_LINK_HURT                    ;; 02:6921 $3E $03
    ldh  [hWaveSfx], a                            ;; 02:6923 $E0 $F3
    ld   a, $80                                   ;; 02:6925 $3E $80
    ld   [wInvincibilityCounter], a               ;; 02:6927 $EA $C7 $DB
    ret                                           ;; 02:692A $C9

.lavaEnd

    ld   a, [wHasFlippers]                        ;; 02:692B $FA $0C $DB
    and  a                                        ;; 02:692E $A7
    jp   z, label_002_7719                        ;; 02:692F $CA $19 $77

    ld   hl, hLinkDirection                       ;; 02:6932 $21 $9E $FF
    res  1, [hl]                                  ;; 02:6935 $CB $8E
    call ResetPegasusBoots                        ;; 02:6937 $CD $B6 $0C
    ld   [wIsLinkInTheAir], a                     ;; 02:693A $EA $46 $C1
    ldh  a, [hFrameCounter]                       ;; 02:693D $F0 $E7
    and  $01                                      ;; 02:693F $E6 $01
    jr   nz, jr_002_696E                          ;; 02:6941 $20 $2B

    ldh  a, [hPressedButtonsMask]                 ;; 02:6943 $F0 $CB
    and  $0F                                      ;; 02:6945 $E6 $0F
    ld   e, a                                     ;; 02:6947 $5F
    ld   d, $00                                   ;; 02:6948 $16 $00
    ld   hl, Data_002_68ED                        ;; 02:694A $21 $ED $68
    add  hl, de                                   ;; 02:694D $19
    ld   a, [hl]                                  ;; 02:694E $7E
    ld   hl, hLinkSpeedX                          ;; 02:694F $21 $9A $FF
    sub  [hl]                                     ;; 02:6952 $96
    jr   z, .jr_695C                              ;; 02:6953 $28 $07

    inc  [hl]                                     ;; 02:6955 $34
    bit  7, a                                     ;; 02:6956 $CB $7F
    jr   z, .jr_695C                              ;; 02:6958 $28 $02

    dec  [hl]                                     ;; 02:695A $35
    dec  [hl]                                     ;; 02:695B $35

.jr_695C
    ld   hl, Data_002_68FD                        ;; 02:695C $21 $FD $68
    add  hl, de                                   ;; 02:695F $19
    ld   a, [hl]                                  ;; 02:6960 $7E
    ld   hl, hLinkSpeedY                          ;; 02:6961 $21 $9B $FF
    sub  [hl]                                     ;; 02:6964 $96
    jr   z, jr_002_696E                           ;; 02:6965 $28 $07

    inc  [hl]                                     ;; 02:6967 $34
    bit  7, a                                     ;; 02:6968 $CB $7F
    jr   z, jr_002_696E                           ;; 02:696A $28 $02

    dec  [hl]                                     ;; 02:696C $35
    dec  [hl]                                     ;; 02:696D $35

jr_002_696E:
    ld   hl, wConsecutiveStepsCount               ;; 02:696E $21 $20 $C1
    inc  [hl]                                     ;; 02:6971 $34
    ldh  a, [hPressedButtonsMask]                 ;; 02:6972 $F0 $CB
    and  $03                                      ;; 02:6974 $E6 $03
    jr   z, .jr_6982                              ;; 02:6976 $28 $0A

    ld   e, a                                     ;; 02:6978 $5F
    ld   d, $00                                   ;; 02:6979 $16 $00
    ld   hl, Data_002_690D                        ;; 02:697B $21 $0D $69
    add  hl, de                                   ;; 02:697E $19
    ld   a, [hl]                                  ;; 02:697F $7E
    ldh  [hLinkDirection], a                      ;; 02:6980 $E0 $9E

.jr_6982
    call UpdateFinalLinkPosition                  ;; 02:6982 $CD $A8 $21
    call CheckPositionForMapTransition            ;; 02:6985 $CD $75 $6C
    ld   a, [wInventoryAppearing]                 ;; 02:6988 $FA $4F $C1
    and  a                                        ;; 02:698B $A7
    ret  nz                                       ;; 02:698C $C0

    ldh  a, [hMultiPurpose0]                      ;; 02:698D $F0 $D7
    cp   $B0                                      ;; 02:698F $FE $B0
    jr   z, jr_002_699E                           ;; 02:6991 $28 $0B

    cp   $B1                                      ;; 02:6993 $FE $B1
    jr   nz, .jr_699B                             ;; 02:6995 $20 $04

    ld   a, $01                                   ;; 02:6997 $3E $01
    jr   jr_002_699C                              ;; 02:6999 $18 $01

.jr_699B
    xor  a                                        ;; 02:699B $AF

jr_002_699C:
    ldh  [hLinkPhysicsModifier], a                ;; 02:699C $E0 $9C

jr_002_699E:
    jp   func_002_6B56                            ;; 02:699E $C3 $56 $6B

LinkSideScrollingLadderPhysicsHandler::
    call ResetPegasusBoots                        ;; 02:69A1 $CD $B6 $0C
    ld   [wIsLinkInTheAir], a                     ;; 02:69A4 $EA $46 $C1
    ld   [wC153], a                               ;; 02:69A7 $EA $53 $C1
    ld   [wC152], a                               ;; 02:69AA $EA $52 $C1
    ldh  a, [hPressedButtonsMask]                 ;; 02:69AD $F0 $CB
    and  $03                                      ;; 02:69AF $E6 $03
    ld   e, a                                     ;; 02:69B1 $5F
    ld   d, $00                                   ;; 02:69B2 $16 $00
    ld   hl, Data_002_68AB                        ;; 02:69B4 $21 $AB $68
    add  hl, de                                   ;; 02:69B7 $19
    ld   a, [hl]                                  ;; 02:69B8 $7E
    ldh  [hLinkSpeedX], a                         ;; 02:69B9 $E0 $9A
    ldh  a, [hPressedButtonsMask]                 ;; 02:69BB $F0 $CB
    rra                                           ;; 02:69BD $1F
    rra                                           ;; 02:69BE $1F
    and  $03                                      ;; 02:69BF $E6 $03
    ld   e, a                                     ;; 02:69C1 $5F
    ld   hl, Data_002_68AE                        ;; 02:69C2 $21 $AE $68
    add  hl, de                                   ;; 02:69C5 $19
    ld   a, [hl]                                  ;; 02:69C6 $7E
    ldh  [hLinkSpeedY], a                         ;; 02:69C7 $E0 $9B
    ld   a, $02                                   ;; 02:69C9 $3E $02
    ldh  [hLinkDirection], a                      ;; 02:69CB $E0 $9E
    ldh  a, [hPressedButtonsMask]                 ;; 02:69CD $F0 $CB
    and  $0F                                      ;; 02:69CF $E6 $0F
    jr   z, .jr_69D7                              ;; 02:69D1 $28 $04

    ld   hl, wConsecutiveStepsCount               ;; 02:69D3 $21 $20 $C1
    inc  [hl]                                     ;; 02:69D6 $34

.jr_69D7
    call UpdateFinalLinkPosition                  ;; 02:69D7 $CD $A8 $21
    call CheckPositionForMapTransition            ;; 02:69DA $CD $75 $6C
    ld   a, [wInventoryAppearing]                 ;; 02:69DD $FA $4F $C1
    and  a                                        ;; 02:69E0 $A7
    ret  nz                                       ;; 02:69E1 $C0

    ldh  a, [hMultiPurpose0]                      ;; 02:69E2 $F0 $D7
    cp   $B1                                      ;; 02:69E4 $FE $B1
    jr   z, jr_002_69F3                           ;; 02:69E6 $28 $0B

    cp   $B0                                      ;; 02:69E8 $FE $B0
    jr   nz, .jr_69F0                             ;; 02:69EA $20 $04

    ld   a, $02                                   ;; 02:69EC $3E $02
    jr   jr_002_69F1                              ;; 02:69EE $18 $01

.jr_69F0
    xor  a                                        ;; 02:69F0 $AF

jr_002_69F1:
    ldh  [hLinkPhysicsModifier], a                ;; 02:69F1 $E0 $9C

jr_002_69F3:
    call func_002_6B56                            ;; 02:69F3 $CD $56 $6B
    ld   a, [wCollisionType]                      ;; 02:69F6 $FA $33 $C1
    and  COLLISION_TYPE_RIGHT                     ;; 02:69F9 $E6 $08
    jr   z, .ret_6A00                             ;; 02:69FB $28 $03

    xor  a                                        ;; 02:69FD $AF
    ldh  [hLinkPhysicsModifier], a                ;; 02:69FE $E0 $9C

.ret_6A00
    ret                                           ;; 02:6A00 $C9

LinkSideScrollingPhysicsHandler::
    ldh  a, [hMapId]                              ;; 02:6A01 $F0 $F7
    cp   MAP_EAGLES_TOWER                         ;; 02:6A03 $FE $06
    jr   nz, .jr_6A24                             ;; 02:6A05 $20 $1D

    ldh  a, [hMapRoom]                            ;; 02:6A07 $F0 $F6
    cp   UNKNOWN_ROOM_F8                          ;; 02:6A09 $FE $F8
    jr   nz, .jr_6A24                             ;; 02:6A0B $20 $17

    ld   a, [wIsLinkInTheAir]                     ;; 02:6A0D $FA $46 $C1
    and  a                                        ;; 02:6A10 $A7
    jr   nz, .jr_6A24                             ;; 02:6A11 $20 $11

    ldh  a, [hLinkPositionX]                      ;; 02:6A13 $F0 $98
    sub  $46                                      ;; 02:6A15 $D6 $46
    add  $04                                      ;; 02:6A17 $C6 $04
    cp   $08                                      ;; 02:6A19 $FE $08
    jr   nc, .jr_6A24                             ;; 02:6A1B $30 $07

    ldh  a, [hJoypadState]                        ;; 02:6A1D $F0 $CC
    and  J_UP                                     ;; 02:6A1F $E6 $04
    jp   nz, ApplyMapFadeOutTransitionWithNoise   ;; 02:6A21 $C2 $7D $0C

.jr_6A24
    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:6A24 $FA $4A $C1
    and  a                                        ;; 02:6A27 $A7
    jr   z, jr_002_6A4C                           ;; 02:6A28 $28 $22

    ldh  a, [hJoypadState]                        ;; 02:6A2A $F0 $CC
    and  J_RIGHT | J_LEFT | J_UP | J_DOWN         ;; 02:6A2C $E6 $0F
    jr   nz, .jr_6A3E                             ;; 02:6A2E $20 $0E

    ld   a, [wConsecutiveStepsCount]              ;; 02:6A30 $FA $20 $C1
    add  $02                                      ;; 02:6A33 $C6 $02
    ld   [wConsecutiveStepsCount], a              ;; 02:6A35 $EA $20 $C1
    call DisplayTransientVfxForLinkRunning        ;; 02:6A38 $CD $56 $17
    jp   label_002_6ADB                           ;; 02:6A3B $C3 $DB $6A

.jr_6A3E
    ld   [wC199+1], a                             ;; 02:6A3E $EA $9A $C1
    ld   a, [wC199]                               ;; 02:6A41 $FA $99 $C1
    add  $0C                                      ;; 02:6A44 $C6 $0C
    ld   [wC199], a                               ;; 02:6A46 $EA $99 $C1
    call ResetSpinAttack                          ;; 02:6A49 $CD $AF $0C

jr_002_6A4C:
    ld   a, [wC147]                               ;; 02:6A4C $FA $47 $C1
    and  a                                        ;; 02:6A4F $A7
    jr   nz, jr_002_6A94                          ;; 02:6A50 $20 $42

    ld   a, [wCollisionType]                      ;; 02:6A52 $FA $33 $C1
    and  COLLISION_TYPE_RIGHT                     ;; 02:6A55 $E6 $08
    jr   nz, jr_002_6A94                          ;; 02:6A57 $20 $3B

    ld   a, [wIsLinkInTheAir]                     ;; 02:6A59 $FA $46 $C1
    and  a                                        ;; 02:6A5C $A7
    jr   nz, .jr_6A64                             ;; 02:6A5D $20 $05

    ld   a, $01                                   ;; 02:6A5F $3E $01
    ld   [wIsLinkInTheAir], a                     ;; 02:6A61 $EA $46 $C1

.jr_6A64
    ld   a, $0A                                   ;; 02:6A64 $3E $0A
    ld   [wConsecutiveStepsCount], a              ;; 02:6A66 $EA $20 $C1
    ldh  a, [hLinkSpeedX]                         ;; 02:6A69 $F0 $9A
    and  a                                        ;; 02:6A6B $A7
    jr   z, .jr_6A73                              ;; 02:6A6C $28 $05

    rlca                                          ;; 02:6A6E $07
    and  $01                                      ;; 02:6A6F $E6 $01
    ldh  [hLinkDirection], a                      ;; 02:6A71 $E0 $9E

.jr_6A73
    ldh  a, [hPressedButtonsMask]                 ;; 02:6A73 $F0 $CB
    and  J_RIGHT | J_LEFT                         ;; 02:6A75 $E6 $03
    jr   z, jr_002_6A92                           ;; 02:6A77 $28 $19

    ld   e, a                                     ;; 02:6A79 $5F
    ld   d, $00                                   ;; 02:6A7A $16 $00
    ld   hl, Data_002_68B1                        ;; 02:6A7C $21 $B1 $68
    add  hl, de                                   ;; 02:6A7F $19
    ldh  a, [hLinkSpeedX]                         ;; 02:6A80 $F0 $9A
    sub  [hl]                                     ;; 02:6A82 $96
    jr   z, jr_002_6A92                           ;; 02:6A83 $28 $0D

    ld   e, $01                                   ;; 02:6A85 $1E $01
    bit  7, a                                     ;; 02:6A87 $CB $7F
    jr   nz, .jr_6A8D                             ;; 02:6A89 $20 $02

    ld   e, $FF                                   ;; 02:6A8B $1E $FF

.jr_6A8D
    ldh  a, [hLinkSpeedX]                         ;; 02:6A8D $F0 $9A
    add  e                                        ;; 02:6A8F $83
    ldh  [hLinkSpeedX], a                         ;; 02:6A90 $E0 $9A

jr_002_6A92:
    jr   label_002_6ADB                           ;; 02:6A92 $18 $47

jr_002_6A94:
    ld   a, [wIsLinkInTheAir]                     ;; 02:6A94 $FA $46 $C1
    and  a                                        ;; 02:6A97 $A7
    jr   z, .jr_6AAA                              ;; 02:6A98 $28 $10

    ld   a, NOISE_SFX_FOOTSTEP                    ;; 02:6A9A $3E $07
    ldh  [hNoiseSfx], a                           ;; 02:6A9C $E0 $F4
    call ResetPegasusBoots                        ;; 02:6A9E $CD $B6 $0C
    ld   [wIsLinkInTheAir], a                     ;; 02:6AA1 $EA $46 $C1
    ld   [wC152], a                               ;; 02:6AA4 $EA $52 $C1
    ld   [wC153], a                               ;; 02:6AA7 $EA $53 $C1

.jr_6AAA
    ldh  a, [hPressedButtonsMask]                 ;; 02:6AAA $F0 $CB
    and  J_RIGHT | J_LEFT                         ;; 02:6AAC $E6 $03
    ld   e, a                                     ;; 02:6AAE $5F
    ld   d, $00                                   ;; 02:6AAF $16 $00
    ld   hl, Data_002_68B1                        ;; 02:6AB1 $21 $B1 $68
    add  hl, de                                   ;; 02:6AB4 $19
    ld   a, [hl]                                  ;; 02:6AB5 $7E
    ldh  [hLinkSpeedX], a                         ;; 02:6AB6 $E0 $9A
    ld   hl, Data_002_68B4                        ;; 02:6AB8 $21 $B4 $68
    add  hl, de                                   ;; 02:6ABB $19
    ld   a, [hl]                                  ;; 02:6ABC $7E
    cp   $FF                                      ;; 02:6ABD $FE $FF
    jr   z, jr_002_6AD1                           ;; 02:6ABF $28 $10

    ld   e, a                                     ;; 02:6AC1 $5F
    ld   a, [wC16E]                               ;; 02:6AC2 $FA $6E $C1
    and  a                                        ;; 02:6AC5 $A7
    jr   nz, .jr_6ACB                             ;; 02:6AC6 $20 $03

    ld   a, e                                     ;; 02:6AC8 $7B
    ldh  [hLinkDirection], a                      ;; 02:6AC9 $E0 $9E

.jr_6ACB
    ld   hl, wConsecutiveStepsCount               ;; 02:6ACB $21 $20 $C1
    inc  [hl]                                     ;; 02:6ACE $34
    jr   label_002_6ADB                           ;; 02:6ACF $18 $0A

jr_002_6AD1:
    ld   a, [wPegasusBootsChargeMeter]            ;; 02:6AD1 $FA $4B $C1
    and  a                                        ;; 02:6AD4 $A7
    jr   nz, label_002_6ADB                       ;; 02:6AD5 $20 $04

    xor  a                                        ;; 02:6AD7 $AF
    ld   [wConsecutiveStepsCount], a              ;; 02:6AD8 $EA $20 $C1

label_002_6ADB:
    ; if wSwordAnimationState != SWORD_ANIMATION_STATE_NONE jump to .jr_6AE6
    ld   a, [wSwordAnimationState]                ;; 02:6ADB $FA $37 $C1
    and  a                                        ;; 02:6ADE $A7
    jr   nz, .jr_6AE6                             ;; 02:6ADF $20 $05

    ldh  a, [hLinkInteractiveMotionBlocked]       ;; 02:6AE1 $F0 $A1
    and  a                                        ;; 02:6AE3 $A7
    jr   nz, jr_002_6AFC                          ;; 02:6AE4 $20 $16

.jr_6AE6
    call UpdateFinalLinkPosition                  ;; 02:6AE6 $CD $A8 $21
    ld   hl, hLinkDirection                       ;; 02:6AE9 $21 $9E $FF
    ldh  a, [hPressedButtonsMask]                 ;; 02:6AEC $F0 $CB
    and  J_RIGHT | J_LEFT | J_UP | J_DOWN         ;; 02:6AEE $E6 $0F
    cp   J_UP                                     ;; 02:6AF0 $FE $04
    jr   nz, .jr_6AF6                             ;; 02:6AF2 $20 $02

    ld   [hl], $02                                ;; 02:6AF4 $36 $02

.jr_6AF6
    cp   J_DOWN                                   ;; 02:6AF6 $FE $08
    jr   nz, jr_002_6AFC                          ;; 02:6AF8 $20 $02

    ld   [hl], $03                                ;; 02:6AFA $36 $03

jr_002_6AFC:
    call CheckPositionForMapTransition            ;; 02:6AFC $CD $75 $6C
    ld   a, [wInventoryAppearing]                 ;; 02:6AFF $FA $4F $C1
    and  a                                        ;; 02:6B02 $A7
    ret  nz                                       ;; 02:6B03 $C0

    ldh  a, [hMultiPurpose0]                      ;; 02:6B04 $F0 $D7
    cp   $B1                                      ;; 02:6B06 $FE $B1
    jr   z, jr_002_6B2A                           ;; 02:6B08 $28 $20

    cp   $B0                                      ;; 02:6B0A $FE $B0
    jr   nz, jr_002_6B34                          ;; 02:6B0C $20 $26

    ld   a, [wCollisionType]                      ;; 02:6B0E $FA $33 $C1
    and  a                                        ;; 02:6B11 $A7
    jr   nz, jr_002_6B26                          ;; 02:6B12 $20 $12

    ld   a, [wInvincibilityCounter]               ;; 02:6B14 $FA $C7 $DB
    and  a                                        ;; 02:6B17 $A7
    jr   nz, .jr_6B1F                             ;; 02:6B18 $20 $05

    ld   a, $02                                   ;; 02:6B1A $3E $02
    call func_002_5926                            ;; 02:6B1C $CD $26 $59

.jr_6B1F
    ld   a, $04                                   ;; 02:6B1F $3E $04
    ldh  [hLinkSpeedY], a                         ;; 02:6B21 $E0 $9B
    xor  a                                        ;; 02:6B23 $AF
    ldh  [hLinkSpeedX], a                         ;; 02:6B24 $E0 $9A

jr_002_6B26:
    ld   a, $02                                   ;; 02:6B26 $3E $02
    jr   jr_002_6B32                              ;; 02:6B28 $18 $08

jr_002_6B2A:
    ldh  a, [hPressedButtonsMask]                 ;; 02:6B2A $F0 $CB
    and  $0C                                      ;; 02:6B2C $E6 $0C
    jr   z, jr_002_6B34                           ;; 02:6B2E $28 $04

    ld   a, $01                                   ;; 02:6B30 $3E $01

jr_002_6B32:
    ldh  [hLinkPhysicsModifier], a                ;; 02:6B32 $E0 $9C

jr_002_6B34:
    ld   hl, hLinkSpeedY                          ;; 02:6B34 $21 $9B $FF
    ld   a, [hl]                                  ;; 02:6B37 $7E
    sub  $40                                      ;; 02:6B38 $D6 $40
    and  $80                                      ;; 02:6B3A $E6 $80
    jr   z, func_002_6B56                         ;; 02:6B3C $28 $18

    inc  [hl]                                     ;; 02:6B3E $34
    ldh  a, [hLinkSpeedY]                         ;; 02:6B3F $F0 $9B
    and  $80                                      ;; 02:6B41 $E6 $80
    jr   z, jr_002_6B55                           ;; 02:6B43 $28 $10

    ld   e, $20                                   ;; 02:6B45 $1E $20
    ld   a, [wInventoryItems.BButtonSlot]         ;; 02:6B47 $FA $00 $DB
    cp   INVENTORY_ROCS_FEATHER                   ;; 02:6B4A $FE $0A
    jr   z, .jr_6B50                              ;; 02:6B4C $28 $02

    ld   e, $10                                   ;; 02:6B4E $1E $10

.jr_6B50
    ldh  a, [hPressedButtonsMask]                 ;; 02:6B50 $F0 $CB
    and  e                                        ;; 02:6B52 $A3
    jr   nz, func_002_6B56                        ;; 02:6B53 $20 $01

jr_002_6B55:
    inc  [hl]                                     ;; 02:6B55 $34

func_002_6B56::
    ret                                           ;; 02:6B56 $C9

AddedCollisionType::
    db  COLLISION_TYPE_UP
    db  COLLISION_TYPE_DOWN
    db  COLLISION_TYPE_LEFT
    db  COLLISION_TYPE_RIGHT
    db  COLLISION_TYPE_UNKNOWN_10

Data_002_6B5C::
    db   $0B, $05, $08, $08, $08

Data_002_6B61::
    db   $08, $08, $04, $10, $0B

label_002_6B66:
    ld   c, $04                                   ;; 02:6B66 $0E $04
    ld   b, $00                                   ;; 02:6B68 $06 $00
    call func_002_6C2F                            ;; 02:6B6A $CD $2F $6C
    ldh  a, [hMultiPurpose1]                      ;; 02:6B6D $F0 $D8
    ldh  [hMultiPurpose0], a                      ;; 02:6B6F $E0 $D7
    xor  a                                        ;; 02:6B71 $AF
    ld   [wCollisionType], a                      ;; 02:6B72 $EA $33 $C1
    ld   c, $00                                   ;; 02:6B75 $0E $00
    ldh  a, [hLinkSpeedX]                         ;; 02:6B77 $F0 $9A
    and  a                                        ;; 02:6B79 $A7
    jr   z, jr_002_6BA2                           ;; 02:6B7A $28 $26

    and  $80                                      ;; 02:6B7C $E6 $80
    jr   z, .jr_6B81                              ;; 02:6B7E $28 $01

    inc  c                                        ;; 02:6B80 $0C

.jr_6B81
    call func_002_6C2F                            ;; 02:6B81 $CD $2F $6C
    ldh  a, [hObjectUnderEntity]                  ;; 02:6B84 $F0 $AF
    cp   OBJECT_FROZEN_BLOCK                      ;; 02:6B86 $FE $8A
    jr   nz, .jr_6B99                             ;; 02:6B88 $20 $0F

    ld   a, [wC5A6]                               ;; 02:6B8A $FA $A6 $C5
    and  a                                        ;; 02:6B8D $A7
    jr   nz, .jr_6B99                             ;; 02:6B8E $20 $09

    inc  a                                        ;; 02:6B90 $3C
    ld   [wC5A6], a                               ;; 02:6B91 $EA $A6 $C5
    call_open_dialog Dialog051                    ;; 02:6B94

.jr_6B99
    ldh  a, [hObjectUnderEntity]                  ;; 02:6B99 $F0 $AF
    cp   $FF                                      ;; 02:6B9B $FE $FF
    jr   nz, jr_002_6BA2                          ;; 02:6B9D $20 $03

    call func_002_6C69                            ;; 02:6B9F $CD $69 $6C

jr_002_6BA2:
    ld   c, $02                                   ;; 02:6BA2 $0E $02
    ldh  a, [hLinkSpeedY]                         ;; 02:6BA4 $F0 $9B
    and  a                                        ;; 02:6BA6 $A7
    and  $80                                      ;; 02:6BA7 $E6 $80
    jr   nz, .jr_6BAC                             ;; 02:6BA9 $20 $01

    inc  c                                        ;; 02:6BAB $0C

.jr_6BAC
    call func_002_6C2F                            ;; 02:6BAC $CD $2F $6C
    ldh  a, [hLinkSpeedY]                         ;; 02:6BAF $F0 $9B
    and  $80                                      ;; 02:6BB1 $E6 $80
    jr   nz, .jr_6BD1                             ;; 02:6BB3 $20 $1C

    ldh  a, [hPressedButtonsMask]                 ;; 02:6BB5 $F0 $CB
    and  $08                                      ;; 02:6BB7 $E6 $08
    jr   nz, .jr_6BD1                             ;; 02:6BB9 $20 $16

    ldh  a, [hDungeonFloorTile]                   ;; 02:6BBB $F0 $E9
    and  $0F                                      ;; 02:6BBD $E6 $0F
    cp   $03                                      ;; 02:6BBF $FE $03
    jr   nc, .jr_6BD1                             ;; 02:6BC1 $30 $0E

    ldh  a, [hObjectUnderEntity]                  ;; 02:6BC3 $F0 $AF
    cp   $62                                      ;; 02:6BC5 $FE $62
    jr   z, jr_002_6BD8                           ;; 02:6BC7 $28 $0F

    cp   $64                                      ;; 02:6BC9 $FE $64
    jr   z, jr_002_6BD8                           ;; 02:6BCB $28 $0B

    cp   $66                                      ;; 02:6BCD $FE $66
    jr   z, jr_002_6BD8                           ;; 02:6BCF $28 $07

.jr_6BD1
    ld   a, [wCollisionType]                      ;; 02:6BD1 $FA $33 $C1
    and  COLLISION_TYPE_RIGHT                     ;; 02:6BD4 $E6 $08
    jr   z, jr_002_6BEB                           ;; 02:6BD6 $28 $13

jr_002_6BD8:
    ; add collision type COLLISION_TYPE_RIGHT
    ld   a, [wCollisionType]                      ;; 02:6BD8 $FA $33 $C1
    or   COLLISION_TYPE_RIGHT                     ;; 02:6BDB $F6 $08
    ld   [wCollisionType], a                      ;; 02:6BDD $EA $33 $C1
    xor  a                                        ;; 02:6BE0 $AF
    ldh  [hLinkSpeedY], a                         ;; 02:6BE1 $E0 $9B
    ldh  a, [hLinkPositionY]                      ;; 02:6BE3 $F0 $99
    and  $F0                                      ;; 02:6BE5 $E6 $F0
    add  $00                                      ;; 02:6BE7 $C6 $00
    ldh  [hLinkPositionY], a                      ;; 02:6BE9 $E0 $99

jr_002_6BEB:
    ld   a, [wCollisionType]                      ;; 02:6BEB $FA $33 $C1
    and  COLLISION_TYPE_LEFT                      ;; 02:6BEE $E6 $04
    jr   z, .jr_6BF6                              ;; 02:6BF0 $28 $04

    ldh  a, [hLinkFinalPositionY]                 ;; 02:6BF2 $F0 $A0
    ldh  [hLinkPositionY], a                      ;; 02:6BF4 $E0 $99

.jr_6BF6
    ld   a, [wCollisionType]                      ;; 02:6BF6 $FA $33 $C1
    and  COLLISION_TYPE_VERTICAL                  ;; 02:6BF9 $E6 $03
    ret  z                                        ;; 02:6BFB $C8

    ldh  a, [hLinkFinalPositionX]                 ;; 02:6BFC $F0 $9F
    ldh  [hLinkPositionX], a                      ;; 02:6BFE $E0 $98
    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:6C00 $FA $4A $C1
    and  a                                        ;; 02:6C03 $A7
    ret  z                                        ;; 02:6C04 $C8

    call ResetSpinAttack                          ;; 02:6C05 $CD $AF $0C
    ldh  a, [hLinkSpeedX]                         ;; 02:6C08 $F0 $9A
    cpl                                           ;; 02:6C0A $2F
    inc  a                                        ;; 02:6C0B $3C
    sra  a                                        ;; 02:6C0C $CB $2F
    sra  a                                        ;; 02:6C0E $CB $2F
    ldh  [hLinkSpeedX], a                         ;; 02:6C10 $E0 $9A
    ld   a, $E8                                   ;; 02:6C12 $3E $E8
    ldh  [hLinkSpeedY], a                         ;; 02:6C14 $E0 $9B
    call UpdateFinalLinkPosition                  ;; 02:6C16 $CD $A8 $21
    call CheckPositionForMapTransition            ;; 02:6C19 $CD $75 $6C
    ld   a, $20                                   ;; 02:6C1C $3E $20
    ld   [wScreenShakeCountdown], a               ;; 02:6C1E $EA $57 $C1
    ldh  a, [hLinkDirection]                      ;; 02:6C21 $F0 $9E
    and  DIRECTION_VERTICAL_MASK                  ;; 02:6C23 $E6 $02
    sla  a                                        ;; 02:6C25 $CB $27
    ld   [wC158], a                               ;; 02:6C27 $EA $58 $C1
    ld   a, JINGLE_STRONG_BUMP                    ;; 02:6C2A $3E $0B
    ldh  [hJingle], a                             ;; 02:6C2C $E0 $F2
    ret                                           ;; 02:6C2E $C9

func_002_6C2F::
    ld   hl, Data_002_6B5C                        ;; 02:6C2F $21 $5C $6B
    add  hl, bc                                   ;; 02:6C32 $09
    ldh  a, [hLinkPositionX]                      ;; 02:6C33 $F0 $98
    sub  $08                                      ;; 02:6C35 $D6 $08
    add  [hl]                                     ;; 02:6C37 $86
    swap a                                        ;; 02:6C38 $CB $37
    and  $0F                                      ;; 02:6C3A $E6 $0F
    ld   e, a                                     ;; 02:6C3C $5F
    ld   hl, Data_002_6B61                        ;; 02:6C3D $21 $61 $6B
    add  hl, bc                                   ;; 02:6C40 $09
    ldh  a, [hLinkPositionY]                      ;; 02:6C41 $F0 $99
    add  [hl]                                     ;; 02:6C43 $86
    sub  $10                                      ;; 02:6C44 $D6 $10
    ldh  [hDungeonFloorTile], a                   ;; 02:6C46 $E0 $E9
    and  $F0                                      ;; 02:6C48 $E6 $F0
    or   e                                        ;; 02:6C4A $B3
    ld   e, a                                     ;; 02:6C4B $5F
    ld   d, $00                                   ;; 02:6C4C $16 $00
    ld   hl, wRoomObjects                         ;; 02:6C4E $21 $11 $D7
    ld   a, h                                     ;; 02:6C51 $7C
    add  hl, de                                   ;; 02:6C52 $19
    ld   h, a                                     ;; 02:6C53 $67
    ld   a, [hl]                                  ;; 02:6C54 $7E
    ldh  [hObjectUnderEntity], a                  ;; 02:6C55 $E0 $AF
    ld   e, a                                     ;; 02:6C57 $5F
    ld   a, [wIsIndoor]                           ;; 02:6C58 $FA $A5 $DB
    ld   d, a                                     ;; 02:6C5B $57
    call GetObjectPhysicsFlags_trampoline         ;; 02:6C5C $CD $26 $2A
    ldh  [hMultiPurpose1], a                      ;; 02:6C5F $E0 $D8
    cp   $60                                      ;; 02:6C61 $FE $60
    jr   z, func_002_6C69                         ;; 02:6C63 $28 $04

    cp   $01                                      ;; 02:6C65 $FE $01
    jr   nz, ret_002_6C74                         ;; 02:6C67 $20 $0B

func_002_6C69::
    ld   hl, AddedCollisionType                   ;; 02:6C69 $21 $57 $6B
    add  hl, bc                                   ;; 02:6C6C $09
    ld   a, [wCollisionType]                      ;; 02:6C6D $FA $33 $C1
    or   [hl]                                     ;; 02:6C70 $B6
    ld   [wCollisionType], a                      ;; 02:6C71 $EA $33 $C1

ret_002_6C74:
    ret                                           ;; 02:6C74 $C9

; Check Link's position, and initiate a map or room transition if needed
CheckPositionForMapTransition::
    ; If a dialog or the inventory is visible, return
    ; (without even checking for ledge jump)
    ld   a, [wDialogState]                        ;; 02:6C75 $FA $9F $C1
    ld   hl, wInventoryAppearing                  ;; 02:6C78 $21 $4F $C1
    or   [hl]                                     ;; 02:6C7B $B6
    ret  nz                                       ;; 02:6C7C $C0

    ;
    ; Kanalet Castle underground special case
    ;

    ; If on MAP_CAVE_WATER…
    ldh  a, [hMapId]                              ;; 02:6C7D $F0 $F7
    cp   MAP_CAVE_WATER                           ;; 02:6C7F $FE $1F
    jr   nz, .kanaletEnd                          ;; 02:6C81 $20 $16

    ; … and not side-scrolling…
    ldh  a, [hIsSideScrolling]                    ;; 02:6C83 $F0 $F9
    and  a                                        ;; 02:6C85 $A7
    jr   z, .kanaletEnd                           ;; 02:6C86 $28 $11

    ; … and room is $EB…
    ldh  a, [hMapRoom]                            ;; 02:6C88 $F0 $F6
    cp   UNKNOWN_ROOM_EB                          ;; 02:6C8A $FE $EB
    jr   z, .doBoundsCheck                        ;; 02:6C8C $28 $04

    ; … or $EC…
    cp   UNKNOWN_ROOM_EC                          ;; 02:6C8E $FE $EC
    jr   nz, .kanaletEnd                          ;; 02:6C90 $20 $07

.doBoundsCheck
    ; This map exit is not at the map edge – but a bit below.
    ; Do a specific position check.

    ; If Link is on the top of the ladder…
    ldh  a, [hLinkPositionY]                      ;; 02:6C92 $F0 $99
    cp   $2C                                      ;; 02:6C94 $FE $2C

    ; … exit the map.
    jp   c, ApplyMapFadeOutTransitionWithNoise    ;; 02:6C96 $DA $7D $0C
.kanaletEnd

    ;
    ; Establish if Link is on any edge of the room
    ;

    ; If Link is at the top of the room, TOP
    ld   e, DIRECTION_UP                          ;; 02:6C99 $1E $02
    ldh  a, [hLinkPositionY]                      ;; 02:6C9B $F0 $99
    cp   $0C                                      ;; 02:6C9D $FE $0C
    jr   c, .verticalTransition                   ;; 02:6C9F $38 $15

    ; If Link is at the bottom, DOWN
    inc  e                                        ;; 02:6CA1 $1C
    cp   $84                                      ;; 02:6CA2 $FE $84
    jr   nc, .verticalTransition                  ;; 02:6CA4 $30 $10

    ; If Link is on the left, LEFT
    ld   e, DIRECTION_LEFT                        ;; 02:6CA6 $1E $01
    ldh  a, [hLinkPositionX]                      ;; 02:6CA8 $F0 $98
    cp   $04                                      ;; 02:6CAA $FE $04
    jr   c, .horizontalTransition                 ;; 02:6CAC $38 $65

    ; If Link is on the right, RIGHT
    dec  e                                        ;; 02:6CAE $1D
    cp   $9C                                      ;; 02:6CAF $FE $9C
    jr   nc, .horizontalTransition                ;; 02:6CB1 $30 $60

    ; Link is not on any edge of the room: return
    jp   .return                                  ;; 02:6CB3 $C3 $09 $6E

.verticalTransition

    ;
    ; Hack for two rooms without standard exit point
    ;

    ; If not in a side-scrolling room…
    ldh  a, [hIsSideScrolling]                    ;; 02:6CB6 $F0 $F9
    and  a                                        ;; 02:6CB8 $A7
    jr   nz, .isSideScrolling                     ;; 02:6CB9 $20 $16

    ; … and on CAVE_E map…
    ldh  a, [hMapId]                              ;; 02:6CBB $F0 $F7
    cp   MAP_CAVE_WATER                           ;; 02:6CBD $FE $1F
    jp   nz, .manualEntryPointsEnd                ;; 02:6CBF $C2 $5C $6D

    ; … and room is $F5 (Goriya's room)…
    ldh  a, [hMapRoom]                            ;; 02:6CC2 $F0 $F6
    cp   ROOM_INDOOR_A_GORIYA                     ;; 02:6CC4 $FE $F5
    jp   z, ApplyMapFadeOutTransitionWithNoise    ;; 02:6CC6 $CA $7D $0C

    ; … or room is $F2 (Water-flooded grotto)…
    cp   ROOM_INDOOR_A_WATER_FLOODED_GROTTO       ;; 02:6CC9 $FE $F2
    jp   nz, .manualEntryPointsEnd                ;; 02:6CCB $C2 $5C $6D

    ; … exit the map directly.
    jp   ApplyMapFadeOutTransitionWithNoise       ;; 02:6CCE $C3 $7D $0C

.isSideScrolling
    ;
    ; Side-scrolling rooms exit points
    ;

    ldh  a, [hMapRoom]                            ;; 02:6CD1 $F0 $F6
    cp   ROOM_INDOOR_B_EAGLES_TOWER_BOSS          ;; 02:6CD3 $FE $E8
    jp   z, .manualEntryPointsEnd                 ;; 02:6CD5 $CA $5C $6D
    cp   UNKNOWN_ROOM_F8                          ;; 02:6CD8 $FE $F8
    jp   z, .manualEntryPointsEnd                 ;; 02:6CDA $CA $5C $6D
    cp   ROOM_INDOOR_B_MANBO                      ;; 02:6CDD $FE $FD
    jr   z, .jr_002_6D00                          ;; 02:6CDF $28 $1F
    cp   ROOM_INDOOR_A_CATFISHS_MAW_WATER_HOLE    ;; 02:6CE1 $FE $A3
    jp   z, ApplyMapFadeOutTransitionWithNoise    ;; 02:6CE3 $CA $7D $0C
    cp   UNKNOWN_ROOM_C0                          ;; 02:6CE6 $FE $C0
    jp   z, ApplyMapFadeOutTransitionWithNoise    ;; 02:6CE8 $CA $7D $0C
    cp   UNKNOWN_ROOM_C1                          ;; 02:6CEB $FE $C1
    jp   z, ApplyMapFadeOutTransitionWithNoise    ;; 02:6CED $CA $7D $0C
    cp   UNKNOWN_ROOM_FF                          ;; 02:6CF0 $FE $FF
    jr   nz, .jr_002_6D0A                         ;; 02:6CF2 $20 $16

    ldh  a, [hLinkPositionY]                      ;; 02:6CF4 $F0 $99
    cp   $50                                      ;; 02:6CF6 $FE $50
    jr   nc, .jr_002_6D00                         ;; 02:6CF8 $30 $06

    ld   a, [wEntitiesStatusTable]                ;; 02:6CFA $FA $80 $C2
    and  a                                        ;; 02:6CFD $A7
    jr   z, .manualEntryPointsEnd                 ;; 02:6CFE $28 $5C

.jr_002_6D00
    ldh  a, [hLinkFinalPositionY]                 ;; 02:6D00 $F0 $A0
    ldh  [hLinkPositionY], a                      ;; 02:6D02 $E0 $99
    xor  a                                        ;; 02:6D04 $AF
    ldh  [hLinkSpeedY], a                         ;; 02:6D05 $E0 $9B
    jp   .return                                  ;; 02:6D07 $C3 $09 $6E

.jr_002_6D0A
    ldh  a, [hLinkPhysicsModifier]                ;; 02:6D0A $F0 $9C
    cp   $02                                      ;; 02:6D0C $FE $02
    jr   z, .manualEntryPointsEnd                 ;; 02:6D0E $28 $4C

    jp   ApplyMapFadeOutTransitionWithNoise       ;; 02:6D10 $C3 $7D $0C

.horizontalTransition
    ; hLinkPositionX = hLinkFinalPositionX
    ldh  a, [hLinkFinalPositionX]                 ;; 02:6D13 $F0 $9F
    ldh  [hLinkPositionX], a                      ;; 02:6D15 $E0 $98

    ; Clear hLinkSpeedX
    xor  a                                        ;; 02:6D17 $AF
    ldh  [hLinkSpeedX], a                         ;; 02:6D18 $E0 $9A

    ; If in a side-scrolling room…
    ldh  a, [hIsSideScrolling]                    ;; 02:6D1A $F0 $F9
    and  a                                        ;; 02:6D1C $A7
    jr   z, .manualEntryPointsEnd                 ;; 02:6D1D $28 $3D

    ;
    ; Side-scrolling rooms exit points
    ;
    ldh  a, [hMapRoom]                            ;; 02:6D1F $F0 $F6
    cp   ROOM_INDOOR_B_FISHERMAN_UNDER_BRIDGE     ;; 02:6D21 $FE $F5
    jp   z, ApplyMapFadeOutTransition             ;; 02:6D23 $CA $83 $0C
    cp   ROOM_INDOOR_B_MANBO                      ;; 02:6D26 $FE $FD
    jp   z, ApplyMapFadeOutTransition             ;; 02:6D28 $CA $83 $0C
    cp   ROOM_INDOOR_B_SEASHELL_MANSION           ;; 02:6D2B $FE $E9
    jp   z, ApplyMapFadeOutTransitionWithNoise    ;; 02:6D2D $CA $7D $0C
    cp   ROOM_INDOOR_B_EAGLES_TOWER_BOSS          ;; 02:6D30 $FE $E8
    jp   z, .return                               ;; 02:6D32 $CA $09 $6E
    cp   UNKNOWN_ROOM_F8                          ;; 02:6D35 $FE $F8
    jp   z, .return                               ;; 02:6D37 $CA $09 $6E
    cp   UNKNOWN_ROOM_EF                          ;; 02:6D3A $FE $EF
    jp   z, .return                               ;; 02:6D3C $CA $09 $6E
    cp   UNKNOWN_ROOM_FF                          ;; 02:6D3F $FE $FF
    jp   z, .return                               ;; 02:6D41 $CA $09 $6E
    cp   UNKNOWN_ROOM_C0                          ;; 02:6D44 $FE $C0
    jr   nz, .jr_002_6D51                         ;; 02:6D46 $20 $09

    ldh  a, [hLinkPositionX]                      ;; 02:6D48 $F0 $98
    cp   $30                                      ;; 02:6D4A $FE $30
    jp   c, .return                               ;; 02:6D4C $DA $09 $6E

    jr   .manualEntryPointsEnd                    ;; 02:6D4F $18 $0B

.jr_002_6D51
    cp   $C1                                      ;; 02:6D51 $FE $C1
    jr   nz, .manualEntryPointsEnd                ;; 02:6D53 $20 $07

    ldh  a, [hLinkPositionX]                      ;; 02:6D55 $F0 $98
    cp   $50                                      ;; 02:6D57 $FE $50
    jp   nc, .return                              ;; 02:6D59 $D2 $09 $6E

.manualEntryPointsEnd

    call CopyLinkFinalPositionToPosition          ;; 02:6D5C $CD $BE $0C

    ld   a, [wLinkObjectPhysics]                  ;; 02:6D5F $FA $81 $C1
    cp   OBJ_PHYSICS_PIT                          ;; 02:6D62 $FE $50
    jp   z, clearIncrementAndReturn               ;; 02:6D64 $CA $0C $6E

    cp   OBJ_PHYSICS_PIT_WARP                     ;; 02:6D67 $FE $51
    jp   z, clearIncrementAndReturn               ;; 02:6D69 $CA $0C $6E

    ld   a, [wLinkGroundStatus]                   ;; 02:6D6C $FA $1F $C1
    cp   GROUND_STATUS_PIT                        ;; 02:6D6F $FE $07
    jp   z, clearIncrementAndReturn               ;; 02:6D71 $CA $0C $6E

    ld   a, [wLinkMotionState]                    ;; 02:6D74 $FA $1C $C1
    cp   LINK_MOTION_FALLING_DOWN                 ;; 02:6D77 $FE $06
    jp   z, clearIncrementAndReturn               ;; 02:6D79 $CA $0C $6E

    ldh  a, [hIsSideScrolling]                    ;; 02:6D7C $F0 $F9
    and  a                                        ;; 02:6D7E $A7
    jr   nz, .jr_002_6D88                         ;; 02:6D7F $20 $07

    ld   a, [wIsLinkInTheAir]                     ;; 02:6D81 $FA $46 $C1
    and  a                                        ;; 02:6D84 $A7
    jp   nz, clearIncrementAndReturn              ;; 02:6D85 $C2 $0C $6E

.jr_002_6D88
    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:6D88 $FA $4A $C1
    and  a                                        ;; 02:6D8B $A7
    jr   nz, .jr_002_6D94                         ;; 02:6D8C $20 $06

    ld   a, [wC16D]                               ;; 02:6D8E $FA $6D $C1
    and  a                                        ;; 02:6D91 $A7
    jr   nz, clearIncrementAndReturn              ;; 02:6D92 $20 $78

.jr_002_6D94
    ld   a, [wIgnoreLinkCollisionsCountdown]      ;; 02:6D94 $FA $3E $C1
    ld   hl, wScreenShakeCountdown                ;; 02:6D97 $21 $57 $C1
    or   [hl]                                     ;; 02:6D9A $B6
    jr   nz, clearIncrementAndReturn              ;; 02:6D9B $20 $6F

    ldh  a, [hLinkPositionY]                      ;; 02:6D9D $F0 $99
    cp   $88                                      ;; 02:6D9F $FE $88
    jr   nc, .initiateRoomTransition              ;; 02:6DA1 $30 $29

    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:6DA3 $FA $4A $C1
    ld   hl, hIsSideScrolling                     ;; 02:6DA6 $21 $F9 $FF
    or   [hl]                                     ;; 02:6DA9 $B6
    ld   hl, hLinkSlowWalkingSpeed                ;; 02:6DAA $21 $B2 $FF
    or   [hl]                                     ;; 02:6DAD $B6
    jr   nz, .initiateRoomTransition              ;; 02:6DAE $20 $1C

    ldh  a, [hPressedButtonsMask]                 ;; 02:6DB0 $F0 $CB
    and  $0F                                      ;; 02:6DB2 $E6 $0F
    jr   z, clearIncrementAndReturn               ;; 02:6DB4 $28 $56

    and  $03                                      ;; 02:6DB6 $E6 $03
    jr   z, .jr_002_6DBE                          ;; 02:6DB8 $28 $04

    dec  a                                        ;; 02:6DBA $3D
    cp   e                                        ;; 02:6DBB $BB
    jr   z, .initiateRoomTransition               ;; 02:6DBC $28 $0E

.jr_002_6DBE
    ldh  a, [hPressedButtonsMask]                 ;; 02:6DBE $F0 $CB
    rra                                           ;; 02:6DC0 $1F
    rra                                           ;; 02:6DC1 $1F
    and  $03                                      ;; 02:6DC2 $E6 $03
    jr   z, clearIncrementAndReturn               ;; 02:6DC4 $28 $46

    dec  a                                        ;; 02:6DC6 $3D
    add  $02                                      ;; 02:6DC7 $C6 $02
    cp   e                                        ;; 02:6DC9 $BB
    jr   nz, clearIncrementAndReturn              ;; 02:6DCA $20 $40

.initiateRoomTransition
    ;
    ; Special case for (Eagle's Tower boss)
    ;

    ; If room is $E8 (Eagle's Tower boss)…
    ldh  a, [hMapRoom]                            ;; 02:6DCC $F0 $F6
    cp   ROOM_INDOOR_B_EAGLES_TOWER_BOSS          ;; 02:6DCE $FE $E8
    jr   nz, .eagleTowerBossEnd                   ;; 02:6DD0 $20 $12

    ; … and map is not CAVE_E…
    ldh  a, [hMapId]                              ;; 02:6DD2 $F0 $F7
    cp   MAP_CAVE_WATER                           ;; 02:6DD4 $FE $1F
    jr   z, .eagleTowerBossEnd                    ;; 02:6DD6 $28 $0C

    ; … and is indoor…
    ld   a, [wIsIndoor]                           ;; 02:6DD8 $FA $A5 $DB
    and  a                                        ;; 02:6DDB $A7
    jr   z, .eagleTowerBossEnd                    ;; 02:6DDC $28 $06

    ; … reset scrollX to zero.
    xor  a                                        ;; 02:6DDE $AF
    ld   [wScrollXOffset], a                      ;; 02:6DDF $EA $BF $C1
    ldh  [rSCX], a                                ;; 02:6DE2 $E0 $43
.eagleTowerBossEnd

    ;
    ; Configure a new room transition
    ;

    ; Set the direction
    ld   a, e                                     ;; 02:6DE4 $7B
    ld   [wRoomTransitionDirection], a            ;; 02:6DE5 $EA $25 $C1

    ; Set the initial state
    ld   a, ROOM_TRANSITION_LOAD_ROOM             ;; 02:6DE8 $3E $01
    ld   [wRoomTransitionState], a                ;; 02:6DEA $EA $24 $C1

    ; Clear some state before the transition
    xor  a                                        ;; 02:6DED $AF
    ld   [wPegasusBootsChargeMeter], a            ;; 02:6DEE $EA $4B $C1
    ld   [wIsUsingSpinAttack], a                  ;; 02:6DF1 $EA $21 $C1
    ld   [wIsRunningWithPegasusBoots], a          ;; 02:6DF4 $EA $4A $C1
    ld   [wC188], a                               ;; 02:6DF7 $EA $88 $C1
IF __PATCH_0__
    ld   [wBGPaletteTransitionEffect], a
    ld   [wDDD7], a
ENDC

    ; If Link's Y position >= $88…
    ldh  a, [hLinkPositionY]                      ;; 02:6DFA $F0 $99
    cp   $88                                      ;; 02:6DFC $FE $88
    jr   c, .return                               ;; 02:6DFE $38 $09

    ; … reset some more position variables.
    ld   a, $02                                   ;; 02:6E00 $3E $02
    ld   [wIsLinkInTheAir], a                     ;; 02:6E02 $EA $46 $C1
    ld   a, $08                                   ;; 02:6E05 $3E $08
    ldh  [hLinkPositionZ], a                      ;; 02:6E07 $E0 $A2

.return
    jp   BackgroundCollisionHandler               ;; 02:6E09 $C3 $45 $6E

clearIncrementAndReturn::
    call ClearLinkPositionIncrement               ;; 02:6E0C $CD $8E $17
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 02:6E0F $EA $3E $C1
    jp   BackgroundCollisionHandler               ;; 02:6E12 $C3 $45 $6E

; The following 16 bytes are coordinates of points on Link's sprite
; used for collision detection with tiles. The coordinates are
; measured in pixels from the top left corner of Link's 16 by 16 pixel
; sprite. The first 8 bytes are x coordinates, the other 8 bytes are y
; coordinates. The first two points are for case when Link is moving up,
; the next two for moving right, the next two for moving down and the
; last two for moving left.
LinkCollisionPointsX::
.up    db 06, 09
.right db 11, 11
.down  db 06, 09
.left  db 04, 04

LinkCollisionPointsY::
.up    db 06, 06
.right db 09, 12
.down  db 15, 15
.left  db 09, 12

; Offsets into the above table for moving down ($04) and up ($00).
Data_002_6E25::
    db   $04, $00

; Offsets into the above table for moving right ($02) and left ($06).
Data_002_6E27::
    db   $02, $06

Data_002_6E29::
    db   $01, $02, $04, $08, $01, $02, $04, $08

LinkDirectionCompareDirection::
    db  DIRECTION_UP,       DIRECTION_UP
    db  DIRECTION_RIGHT,    DIRECTION_RIGHT
    db  DIRECTION_DOWN,     DIRECTION_DOWN
    db  DIRECTION_LEFT,     DIRECTION_LEFT

; Adjustment values for Link's position in case of collision with a solid tile.
Data_002_6E39::
    db   0, 1, -1, 0

Data_002_6E3D::
    db   $10, $F0, $00, $00

Data_002_6E41::
    db   $00, $00, $F0, $10

; Check for collisions between Link and background tiles.
BackgroundCollisionHandler::
    ; Skip this collision handler if Link is performing a ledge jump
    ; or if the game is in free movement mode.
    ld   hl, wC10A                                ;; 02:6E45 $21 $0A $C1
    ld   a, [wFreeMovementMode]                   ;; 02:6E48 $FA $7B $C1
    or   [hl]                                     ;; 02:6E4B $B6
    ret  nz                                       ;; 02:6E4C $C0

    ldh  a, [hIsSideScrolling]                    ;; 02:6E4D $F0 $F9
    and  a                                        ;; 02:6E4F $A7
    jr   z, .jr_6E55                              ;; 02:6E50 $28 $03

    jp   label_002_6B66                           ;; 02:6E52 $C3 $66 $6B

; Check if Link has vertical speed and if he is moving up or down.
; bc = offset into the table of Link's collision points
; ($04 if Link is moving down, $00 if Link is moving up).
.jr_6E55
    xor  a                                        ;; 02:6E55 $AF
    ld   [wCollisionType], a                      ;; 02:6E56 $EA $33 $C1
    ldh  a, [hLinkSpeedY]                         ;; 02:6E59 $F0 $9B
    cp   $00                                      ;; 02:6E5B $FE $00
    jr   z, jr_002_6EDD                           ;; 02:6E5D $28 $7E

    ld   e, $03                                   ;; 02:6E5F $1E $03
    rla                                           ;; 02:6E61 $17
    ld   bc, Data_002_6E25                        ;; 02:6E62 $01 $25 $6E
    jr   nc, .jr_6E69                             ;; 02:6E65 $30 $02

    dec  e                                        ;; 02:6E67 $1D
    inc  bc                                       ;; 02:6E68 $03

.jr_6E69
    ld   a, e                                     ;; 02:6E69 $7B
    ldh  [hMultiPurposeC], a                      ;; 02:6E6A $E0 $E3
    ld   e, $02                                   ;; 02:6E6C $1E $02
    ld   a, [bc]                                  ;; 02:6E6E $0A
    ld   c, a                                     ;; 02:6E6F $4F
    ld   b, $00                                   ;; 02:6E70 $06 $00

; Loop over Link's two collision points to check collision with tiles.
; This is the case where Link is moving vertically.
.loop_6E72
    push de                                       ;; 02:6E72 $D5
    push bc                                       ;; 02:6E73 $C5
    call ApplyCollisionWithObject                 ;; 02:6E74 $CD $2C $6F
    pop  bc                                       ;; 02:6E77 $C1
    pop  de                                       ;; 02:6E78 $D1
    inc  bc                                       ;; 02:6E79 $03
    dec  e                                        ;; 02:6E7A $1D
    jr   nz, .loop_6E72                           ;; 02:6E7B $20 $F5

    ldh  a, [hLinkSpeedY]                         ;; 02:6E7D $F0 $9B
    and  $80                                      ;; 02:6E7F $E6 $80
    jr   nz, jr_002_6EC6                          ;; 02:6E81 $20 $43

    ld   a, [wIsIndoor]                           ;; 02:6E83 $FA $A5 $DB
    and  a                                        ;; 02:6E86 $A7
    jr   nz, jr_002_6EC6                          ;; 02:6E87 $20 $3D

    ldh  a, [hObjectUnderEntity]                  ;; 02:6E89 $F0 $AF
    cp   $E9                                      ;; 02:6E8B $FE $E9
    jr   nz, jr_002_6EC6                          ;; 02:6E8D $20 $37

    ld   a, [wHasFlippers]                        ;; 02:6E8F $FA $0C $DB
    and  a                                        ;; 02:6E92 $A7
    jr   z, jr_002_6EC6                           ;; 02:6E93 $28 $31

    ld   a, [wLiftedEntityType]                   ;; 02:6E95 $FA $A8 $C5
    cp   ENTITY_ROOSTER                           ;; 02:6E98 $FE $D5
    jr   z, jr_002_6EC6                           ;; 02:6E9A $28 $2A

    ld   a, [wLinkMotionState]                    ;; 02:6E9C $FA $1C $C1
    cp   LINK_MOTION_UNSTUCKING                   ;; 02:6E9F $FE $02
    jr   z, jr_002_6EDD                           ;; 02:6EA1 $28 $3A

    ld   a, JINGLE_FALL_DOWN                      ;; 02:6EA3 $3E $08
    ldh  [hJingle], a                             ;; 02:6EA5 $E0 $F2
    jr   jr_002_6EB5                              ;; 02:6EA7 $18 $0C

func_002_6EA9::
    ld   a, JINGLE_FALL_DOWN                      ;; 02:6EA9 $3E $08
    ldh  [hJingle], a                             ;; 02:6EAB $E0 $F2

func_002_6EAD::
    ldh  a, [hLinkPositionX]                      ;; 02:6EAD $F0 $98
    and  $F0                                      ;; 02:6EAF $E6 $F0
    add  $08                                      ;; 02:6EB1 $C6 $08
    ldh  [hLinkPositionX], a                      ;; 02:6EB3 $E0 $98

jr_002_6EB5:
    ld   a, LINK_MOTION_UNSTUCKING                ;; 02:6EB5 $3E $02
    ld   [wLinkMotionState], a                    ;; 02:6EB7 $EA $1C $C1

    xor  a                                        ;; 02:6EBA $AF
    ldh  [hLinkPhysicsModifier], a                ;; 02:6EBB $E0 $9C

    ldh  a, [hLinkPositionY]                      ;; 02:6EBD $F0 $99
    sub  $08                                      ;; 02:6EBF $D6 $08
    ldh  [hLinkPositionY], a                      ;; 02:6EC1 $E0 $99
    jp   ResetPegasusBoots                        ;; 02:6EC3 $C3 $B6 $0C

; Vertical collision smoothening: Link has moved (vertically) into
; the corner of a solid block. Set his y position to the previous
; y position and instead adjust his x position so that he moves away
; from the block he walked into.
jr_002_6EC6:
    ld   a, [wCollisionType]                      ;; 02:6EC6 $FA $33 $C1
    and  COLLISION_TYPE_VERTICAL                  ;; 02:6EC9 $E6 $03
    jr   z, jr_002_6EDD                           ;; 02:6ECB $28 $10

    ld   e, a                                     ;; 02:6ECD $5F
    ld   d, $00                                   ;; 02:6ECE $16 $00
    ld   hl, Data_002_6E39                        ;; 02:6ED0 $21 $39 $6E
    add  hl, de                                   ;; 02:6ED3 $19
    ldh  a, [hLinkPositionX]                      ;; 02:6ED4 $F0 $98
    add  [hl]                                     ;; 02:6ED6 $86
    ldh  [hLinkPositionX], a                      ;; 02:6ED7 $E0 $98
    ldh  a, [hLinkFinalPositionY]                 ;; 02:6ED9 $F0 $A0
    ldh  [hLinkPositionY], a                      ;; 02:6EDB $E0 $99

jr_002_6EDD:
    ldh  a, [hLinkSpeedX]                         ;; 02:6EDD $F0 $9A
    cp   $00                                      ;; 02:6EDF $FE $00
    jr   z, jr_002_6F1C                           ;; 02:6EE1 $28 $39

    ld   e, $00                                   ;; 02:6EE3 $1E $00
    rla                                           ;; 02:6EE5 $17
    ld   bc, Data_002_6E27                        ;; 02:6EE6 $01 $27 $6E
    jr   nc, .jr_6EED                             ;; 02:6EE9 $30 $02

    inc  e                                        ;; 02:6EEB $1C
    inc  bc                                       ;; 02:6EEC $03

.jr_6EED
    ld   a, e                                     ;; 02:6EED $7B
    ldh  [hMultiPurposeC], a                      ;; 02:6EEE $E0 $E3
    ld   e, $02                                   ;; 02:6EF0 $1E $02
    ld   a, [bc]                                  ;; 02:6EF2 $0A
    ld   c, a                                     ;; 02:6EF3 $4F
    ld   b, $00                                   ;; 02:6EF4 $06 $00

; Loop over Link's two collision points to check collision with tiles.
; This is the case where Link is moving horizontally.
.loop_6EF6
    push de                                       ;; 02:6EF6 $D5
    push bc                                       ;; 02:6EF7 $C5
    call ApplyCollisionWithObject                 ;; 02:6EF8 $CD $2C $6F
    pop  bc                                       ;; 02:6EFB $C1
    pop  de                                       ;; 02:6EFC $D1
    inc  bc                                       ;; 02:6EFD $03
    dec  e                                        ;; 02:6EFE $1D
    jr   nz, .loop_6EF6                           ;; 02:6EFF $20 $F5

; Horizontal collision smoothening: Link has moved (horizontally) into
; the corner of a solid block. Set his x position to the previous
; x position and instead adjust his y position so that he moves away
; from the block he walked into.
    ld   a, [wCollisionType]                      ;; 02:6F01 $FA $33 $C1
    and  COLLISION_TYPE_HORIZONTAL                ;; 02:6F04 $E6 $0C
    jr   z, jr_002_6F1C                           ;; 02:6F06 $28 $14

    srl  a                                        ;; 02:6F08 $CB $3F
    srl  a                                        ;; 02:6F0A $CB $3F
    ld   e, a                                     ;; 02:6F0C $5F
    ld   d, $00                                   ;; 02:6F0D $16 $00
    ld   hl, Data_002_6E39                        ;; 02:6F0F $21 $39 $6E
    add  hl, de                                   ;; 02:6F12 $19
    ldh  a, [hLinkPositionY]                      ;; 02:6F13 $F0 $99
    add  [hl]                                     ;; 02:6F15 $86
    ldh  [hLinkPositionY], a                      ;; 02:6F16 $E0 $99
    ldh  a, [hLinkFinalPositionX]                 ;; 02:6F18 $F0 $9F
    ldh  [hLinkPositionX], a                      ;; 02:6F1A $E0 $98

jr_002_6F1C:
    ld   a, [wCollisionType]                      ;; 02:6F1C $FA $33 $C1
    and  a                                        ;; 02:6F1F $A7
    jr   nz, .jr_6F25                             ;; 02:6F20 $20 $03

    ld   [wC1C3], a                               ;; 02:6F22 $EA $C3 $C1

.jr_6F25
    jp   label_002_74AD                           ;; 02:6F25 $C3 $AD $74

Data_002_6F28::
    db   $01, $02, $04, $08

; Handle collision between a collision point of Link's sprite and the
; tile below that pixel.
;
; Input:
;   bc   direction of the collision relative to Link
ApplyCollisionWithObject::
    ; Get the tile under the collision point.
    ld   hl, LinkCollisionPointsX                 ;; 02:6F2C $21 $15 $6E
    add  hl, bc                                   ;; 02:6F2F $09
    ldh  a, [hLinkPositionX]                      ;; 02:6F30 $F0 $98
    sub  $08                                      ;; 02:6F32 $D6 $08
    add  [hl]                                     ;; 02:6F34 $86
    ldh  [hMultiPurpose4], a                      ;; 02:6F35 $E0 $DB
    swap a                                        ;; 02:6F37 $CB $37
    and  $0F                                      ;; 02:6F39 $E6 $0F
    ld   e, a                                     ;; 02:6F3B $5F
    ld   hl, LinkCollisionPointsY                 ;; 02:6F3C $21 $1D $6E
    add  hl, bc                                   ;; 02:6F3F $09
    ldh  a, [hLinkPositionY]                      ;; 02:6F40 $F0 $99
    add  [hl]                                     ;; 02:6F42 $86
    sub  $10                                      ;; 02:6F43 $D6 $10
    ldh  [hMultiPurpose5], a                      ;; 02:6F45 $E0 $DC
    and  $F0                                      ;; 02:6F47 $E6 $F0
    or   e                                        ;; 02:6F49 $B3
    ld   e, a                                     ;; 02:6F4A $5F
    ldh  [hDungeonFloorTile], a                   ;; 02:6F4B $E0 $E9

    ; Get the colliding object
    ld   d, $00                                   ;; 02:6F4D $16 $00
    ld   hl, wRoomObjects                         ;; 02:6F4F $21 $11 $D7
    ld   a, h                                     ;; 02:6F52 $7C
    add  hl, de                                   ;; 02:6F53 $19
    ld   h, a                                     ;; 02:6F54 $67
    ld   a, [hl]                                  ;; 02:6F55 $7E
    ldh  [hObjectUnderEntity], a                  ;; 02:6F56 $E0 $AF
    ld   e, a                                     ;; 02:6F58 $5F

    ; Get the physics flags for the tile type and compare
    ; them against a list of different values.
    ld   a, [wIsIndoor]                           ;; 02:6F59 $FA $A5 $DB
    ld   d, a                                     ;; 02:6F5C $57
    call GetObjectPhysicsFlags_trampoline         ;; 02:6F5D $CD $26 $2A
    ldh  [hMultiPurposeD], a                      ;; 02:6F60 $E0 $E4
    and  a                                        ;; 02:6F62 $A7
    jp   z, label_002_7461                        ;; 02:6F63 $CA $61 $74

    cp   OBJ_PHYSICS_SOLID                        ;; 02:6F66 $FE $01
    jp   z, ApplyCollisionWithSolid               ;; 02:6F68 $CA $77 $72

    cp   OBJ_PHYSICS_STAIRS                       ;; 02:6F6B $FE $02
    jp   z, ApplyCollisionWithStairs              ;; 02:6F6D $CA $60 $72

    cp   OBJ_PHYSICS_DOOR                         ;; 02:6F70 $FE $03
    jp   z, ApplyCollisionWithDoor                ;; 02:6F72 $CA $BB $71

    cp   OBJ_PHYSICS_LEDGE_OVERWORLD              ;; 02:6F75 $FE $10
    jp   z, ApplyCollisionWithLedge               ;; 02:6F77 $CA $9C $71

    cp   OBJ_PHYSICS_OCEAN_SWITCH_BLOCK           ;; 02:6F7A $FE $04
    jp   z, ApplyCollisionWithOceanOrSwitchBlock  ;; 02:6F7C $CA $3D $72

    cp   OBJ_PHYSICS_REMOVABLE_OBSTACLE           ;; 02:6F7F $FE $30
    jp   z, ApplyCollisionWithSolid               ;; 02:6F81 $CA $77 $72

    cp   OBJ_PHYSICS_HOOKSHOTABLE                 ;; 02:6F84 $FE $60
    jp   z, ApplyCollisionWithSolid               ;; 02:6F86 $CA $77 $72

    cp   OBJ_PHYSICS_WIDE_STAIRS                  ;; 02:6F89 $FE $0A
    jp   z, ApplyCollisionWithStairs              ;; 02:6F8B $CA $60 $72

    cp   OBJ_PHYSICS_TRACTOR_DEVICE               ;; 02:6F8E $FE $FF
    jp   z, label_002_7461                        ;; 02:6F90 $CA $61 $74

    cp   OBJ_PHYSICS_SPIKES                       ;; 02:6F93 $FE $E0
    jp   z, label_002_7461                        ;; 02:6F95 $CA $61 $74

    cp   OBJ_PHYSICS_CONVEYOR                     ;; 02:6F98 $FE $F0
    jp   nc, label_002_7461                       ;; 02:6F9A $D2 $61 $74

    cp   OBJ_PHYSICS_KEYHOLE                      ;; 02:6F9D $FE $C0
    jp   nz, label_002_7045                       ;; 02:6F9F $C2 $45 $70

    ldh  a, [hLinkDirection]                      ;; 02:6FA2 $F0 $9E
    cp   DIRECTION_UP                             ;; 02:6FA4 $FE $02
    jp   nz, label_002_703B                       ;; 02:6FA6 $C2 $3B $70

    ldh  a, [hRoomStatus]                         ;; 02:6FA9 $F0 $F8
    bit  OW_ROOM_STATUS_FLAG_CHANGED, a           ;; 02:6FAB $CB $67
    jp   nz, label_002_703B                       ;; 02:6FAD $C2 $3B $70

    ldh  a, [hMapRoom]                            ;; 02:6FB0 $F0 $F6
    cp   ROOM_OW_EAGLES_TOWER                     ; L7 Eagle's Tower overworld entrance
    jr   nz, .jr_6FBD                             ;; 02:6FB4 $20 $07

    ld   a, [wHasBirdKey]                         ;; 02:6FB6 $FA $14 $DB
    ld_dialog_low e, Dialog233 ; "Bird Keyhole"   ;; 02:6FB9 $1E $33
    jr   jr_002_6FC6                              ;; 02:6FBB $18 $09

.jr_6FBD
    cp   ROOM_OW_FACE_SHRINE_ENTRANCE             ;; 02:6FBD $FE $8C
    jr   nz, jr_002_6FE3                          ;; 02:6FBF $20 $22

    ld   a, [wHasFaceKey]                         ;; 02:6FC1 $FA $13 $DB
    ld_dialog_low e, Dialog234 ; "Face Keyhole"   ;; 02:6FC4 $1E $34

jr_002_6FC6:
    and  a                                        ;; 02:6FC6 $A7
    jr   z, jr_002_703E                           ;; 02:6FC7 $28 $75

    ldh  a, [hMapRoom]                            ;; 02:6FC9 $F0 $F6
    cp   ROOM_OW_FACE_SHRINE_ENTRANCE             ; L6 Face Shrine overworld entrance
    jr   nz, .jr_6FD4                             ;; 02:6FCD $20 $05

    call label_27F2                               ;; 02:6FCF $CD $F2 $27
    jr   jr_002_6FD7                              ;; 02:6FD2 $18 $03

.jr_6FD4
    call EnqueueDoorUnlockedSfx                   ;; 02:6FD4 $CD $20 $54

jr_002_6FD7:
    ld   a, ENTITY_MIMIC                          ;; 02:6FD7 $3E $28
    call SpawnNewEntity_trampoline                ;; 02:6FD9 $CD $86 $3B

    ld   hl, wEntitiesPrivateState2Table          ;; 02:6FDC $21 $C0 $C2
    add  hl, de                                   ;; 02:6FDF $19
    inc  [hl]                                     ;; 02:6FE0 $34
    jr   jr_002_702C                              ;; 02:6FE1 $18 $49

jr_002_6FE3:
    cp   ROOM_OW_ANGLERS_TUNNEL_ENTRANCE          ;; 02:6FE3 $FE $2B
    jr   nz, .jr_6FFE                             ;; 02:6FE5 $20 $17

    ld   a, [wHasAnglerKey]                       ;; 02:6FE7 $FA $12 $DB
    and  a                                        ;; 02:6FEA $A7
    ld_dialog_low e, Dialog232 ; "Angler Keyhole" ;; 02:6FEB $1E $32
    jr   z, jr_002_703E                           ;; 02:6FED $28 $4F

    call label_27F2                               ;; 02:6FEF $CD $F2 $27

    ld   a, ENTITY_MASTER_STALFOS                 ;; 02:6FF2 $3E $5F
    call SpawnNewEntity_trampoline                ;; 02:6FF4 $CD $86 $3B

    ld   hl, wEntitiesPrivateState4Table          ;; 02:6FF7 $21 $40 $C4
    add  hl, de                                   ;; 02:6FFA $19
    dec  [hl]                                     ;; 02:6FFB $35
    jr   jr_002_702C                              ;; 02:6FFC $18 $2E

.jr_6FFE
    cp   ROOM_OW_KEY_CAVERN_ENTRANCE              ;; 02:6FFE $FE $B5
    jr   nz, .jr_700D                             ;; 02:7000 $20 $0B

    ld   a, [wGoldenLeavesCount]                  ;; 02:7002 $FA $15 $DB
    cp   SLIME_KEY                                ;; 02:7005 $FE $06
    ld_dialog_low e, Dialog231 ; "Slime Keyhole"  ;; 02:7007 $1E $31
    jr   nz, jr_002_703E                          ;; 02:7009 $20 $33

    jr   jr_002_7015                              ;; 02:700B $18 $08

.jr_700D
    ld   a, [wHasTailKey]                         ;; 02:700D $FA $11 $DB
    and  a                                        ;; 02:7010 $A7
    ld_dialog_low e, Dialog230 ; "Tail Keyhole"   ;; 02:7011 $1E $30
    jr   z, jr_002_703E                           ;; 02:7013 $28 $29

jr_002_7015:
    ; Schedule deep rumble animation
    ldh  a, [hLinkPositionY]                      ;; 02:7015 $F0 $99
    ldh  [hMultiPurpose1], a                      ;; 02:7017 $E0 $D8
    ldh  a, [hLinkPositionX]                      ;; 02:7019 $F0 $98
    ldh  [hMultiPurpose0], a                      ;; 02:701B $E0 $D7
    ld   a, TRANSCIENT_VFX_RUMBLE                 ;; 02:701D $3E $09
    call AddTranscientVfx                         ;; 02:701F $CD $C7 $0C
    ld   [hl], $DF                                ;; 02:7022 $36 $DF
    ld   a, $DF                                   ;; 02:7024 $3E $DF
    ld   [wC111], a                               ;; 02:7026 $EA $11 $C1
    call label_27F2                               ;; 02:7029 $CD $F2 $27

jr_002_702C:
    ld   hl, wOverworldRoomStatus                 ;; 02:702C $21 $00 $D8
    ldh  a, [hMapRoom]                            ;; 02:702F $F0 $F6
    ld   e, a                                     ;; 02:7031 $5F
    ld   d, $00                                   ;; 02:7032 $16 $00
    add  hl, de                                   ;; 02:7034 $19
    ld   a, [hl]                                  ;; 02:7035 $7E
    or   ROOM_STATUS_EVENT_1                      ;; 02:7036 $F6 $10
    ld   [hl], a                                  ;; 02:7038 $77
    ldh  [hRoomStatus], a                         ;; 02:7039 $E0 $F8

label_002_703B:
    jp   ApplyCollisionWithSolid                  ;; 02:703B $C3 $77 $72

jr_002_703E:
    ld   a, e                                     ;; 02:703E $7B
    call OpenDialogInTable2AndClearIncrement      ;; 02:703F $CD $04 $75
    jp   ApplyCollisionWithSolid                  ;; 02:7042 $C3 $77 $72

label_002_7045:
    ldh  a, [hObjectUnderEntity]                  ;; 02:7045 $F0 $AF
    cp   $DB                                      ;; 02:7047 $FE $DB
    jr   nz, .jr_7053                             ;; 02:7049 $20 $08

    ld   a, [wLinkMotionState]                    ;; 02:704B $FA $1C $C1
    cp   $01                                      ;; 02:704E $FE $01
    jp   z, ApplyCollisionWithSolid               ;; 02:7050 $CA $77 $72

.jr_7053
    ldh  a, [hMultiPurposeD]                      ;; 02:7053 $F0 $E4
    cp   $D0                                      ;; 02:7055 $FE $D0
    jp   c, label_002_70DF                        ;; 02:7057 $DA $DF $70

    cp   $D4                                      ;; 02:705A $FE $D4
    jp   nc, label_002_70DF                       ;; 02:705C $D2 $DF $70

    sub  $D0                                      ;; 02:705F $D6 $D0
    ld   e, a                                     ;; 02:7061 $5F
    ld   a, [wIsIndoor]                           ;; 02:7062 $FA $A5 $DB
    and  a                                        ;; 02:7065 $A7
    jr   nz, jr_002_7085                          ;; 02:7066 $20 $1D

    ld   a, e                                     ;; 02:7068 $7B
    cp   $00                                      ;; 02:7069 $FE $00
    jr   nz, .jr_7078                             ;; 02:706B $20 $0B

    ldh  a, [hMultiPurpose4]                      ;; 02:706D $F0 $DB
    and  $0F                                      ;; 02:706F $E6 $0F
    cp   $08                                      ;; 02:7071 $FE $08
    jp   c, label_002_7461                        ;; 02:7073 $DA $61 $74

    jr   jr_002_7085                              ;; 02:7076 $18 $0D

.jr_7078
    cp   $01                                      ;; 02:7078 $FE $01
    jr   nz, jr_002_7085                          ;; 02:707A $20 $09

    ldh  a, [hMultiPurpose4]                      ;; 02:707C $F0 $DB
    and  $0F                                      ;; 02:707E $E6 $0F
    cp   $08                                      ;; 02:7080 $FE $08
    jp   nc, label_002_7461                       ;; 02:7082 $D2 $61 $74

jr_002_7085:
IF __PATCH_0__
    ld   a, [wIsLinkInTheAir]
    and  a
    jr   nz, label_002_70D8
ENDC

    ld   d, $00                                   ;; 02:7085 $16 $00
    ldh  a, [hLinkDirection]                      ;; 02:7087 $F0 $9E
    cp   e                                        ;; 02:7089 $BB
    jp   nz, label_002_70D8                       ;; 02:708A $C2 $D8 $70

    ld   a, [wIgnoreLinkCollisionsCountdown]      ;; 02:708D $FA $3E $C1
    ld   hl, wIsUsingSpinAttack                   ;; 02:7090 $21 $21 $C1
    or   [hl]                                     ;; 02:7093 $B6
    ld   hl, wD45E                                ;; 02:7094 $21 $5E $D4
    or   [hl]                                     ;; 02:7097 $B6
    jr   nz, label_002_70D8                       ;; 02:7098 $20 $3E

    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:709A $FA $4A $C1
    and  a                                        ;; 02:709D $A7
    jr   nz, .jr_70B5                             ;; 02:709E $20 $15

    ld   hl, Data_002_6F28                        ;; 02:70A0 $21 $28 $6F
    add  hl, de                                   ;; 02:70A3 $19
    ldh  a, [hPressedButtonsMask]                 ;; 02:70A4 $F0 $CB
    and  [hl]                                     ;; 02:70A6 $A6
    jr   z, label_002_70D8                        ;; 02:70A7 $28 $2F

    ld   a, [wC191]                               ;; 02:70A9 $FA $91 $C1
    inc  a                                        ;; 02:70AC $3C
    ld   [wC191], a                               ;; 02:70AD $EA $91 $C1
    cp   $0C                                      ;; 02:70B0 $FE $0C
    jp   c, ApplyCollisionWithSolid               ;; 02:70B2 $DA $77 $72

.jr_70B5
    call ResetPegasusBoots                        ;; 02:70B5 $CD $B6 $0C
    ld   hl, Data_002_6E3D                        ;; 02:70B8 $21 $3D $6E
    add  hl, de                                   ;; 02:70BB $19
    ld   a, [hl]                                  ;; 02:70BC $7E
    ldh  [hLinkSpeedX], a                         ;; 02:70BD $E0 $9A
    ld   hl, Data_002_6E41                        ;; 02:70BF $21 $41 $6E
    add  hl, de                                   ;; 02:70C2 $19
    ld   a, [hl]                                  ;; 02:70C3 $7E
    ldh  [hLinkSpeedY], a                         ;; 02:70C4 $E0 $9B
    ld   a, $1C                                   ;; 02:70C6 $3E $1C
    ldh  [hLinkVelocityZ], a                      ;; 02:70C8 $E0 $A3
    ld   a, $01                                   ;; 02:70CA $3E $01
    ld   [wIsLinkInTheAir], a                     ;; 02:70CC $EA $46 $C1
    ld   a, $01                                   ;; 02:70CF $3E $01
    ld   [wC10A], a                               ;; 02:70D1 $EA $0A $C1
    ld   a, JINGLE_FALL_DOWN                      ;; 02:70D4 $3E $08
    ldh  [hJingle], a                             ;; 02:70D6 $E0 $F2

label_002_70D8:
    xor  a                                        ;; 02:70D8 $AF
    ld   [wC191], a                               ;; 02:70D9 $EA $91 $C1
    jp   ApplyCollisionWithSolid                  ;; 02:70DC $C3 $77 $72

label_002_70DF:
    cp   $90                                      ;; 02:70DF $FE $90
    jp   c, label_002_715F                        ;; 02:70E1 $DA $5F $71

    cp   $99                                      ;; 02:70E4 $FE $99
    jp   nc, ApplyCollisionWithSolid              ;; 02:70E6 $D2 $77 $72

    sub  $90                                      ;; 02:70E9 $D6 $90
    ld   e, a                                     ;; 02:70EB $5F
    ld   d, $00                                   ;; 02:70EC $16 $00
    bit  1, a                                     ;; 02:70EE $CB $4F
    jr   nz, .jr_7103                             ;; 02:70F0 $20 $11

    ld   hl, wC1D0                                ;; 02:70F2 $21 $D0 $C1
    add  hl, de                                   ;; 02:70F5 $19
    ld   e, [hl]                                  ;; 02:70F6 $5E
    ldh  a, [hLinkPositionX]                      ;; 02:70F7 $F0 $98
    sub  e                                        ;; 02:70F9 $93
    sub  $0C                                      ;; 02:70FA $D6 $0C
    cp   $08                                      ;; 02:70FC $FE $08
    jp   nc, ApplyCollisionWithSolid              ;; 02:70FE $D2 $77 $72

    jr   jr_002_7112                              ;; 02:7101 $18 $0F

.jr_7103
    ld   hl, wC1E0                                ;; 02:7103 $21 $E0 $C1
    add  hl, de                                   ;; 02:7106 $19
    ld   e, [hl]                                  ;; 02:7107 $5E
    ldh  a, [hLinkPositionY]                      ;; 02:7108 $F0 $99
    sub  e                                        ;; 02:710A $93
    sub  $14                                      ;; 02:710B $D6 $14
    cp   $08                                      ;; 02:710D $FE $08
    jp   nc, ApplyCollisionWithSolid              ;; 02:710F $D2 $77 $72

jr_002_7112:
    ld   a, [wC188]                               ;; 02:7112 $FA $88 $C1
    and  a                                        ;; 02:7115 $A7
    jp   nz, ApplyCollisionWithSolid              ;; 02:7116 $C2 $77 $72

    ldh  a, [hMultiPurposeD]                      ;; 02:7119 $F0 $E4
    cp   $94                                      ;; 02:711B $FE $94
    jr   nc, .jr_712C                             ;; 02:711D $30 $0D

    ld   a, [wSmallKeysCount]                     ;; 02:711F $FA $D0 $DB
    and  a                                        ;; 02:7122 $A7
    jp   z, ApplyCollisionWithSolid               ;; 02:7123 $CA $77 $72

    dec  a                                        ;; 02:7126 $3D
    ld   [wSmallKeysCount], a                     ;; 02:7127 $EA $D0 $DB
    jr   jr_002_7147                              ;; 02:712A $18 $1B

.jr_712C
    cp   $98                                      ;; 02:712C $FE $98
    jr   z, .jr_7139                              ;; 02:712E $28 $09

    ld   a, [wRoomEvent]                          ;; 02:7130 $FA $8E $C1
    and  a                                        ;; 02:7133 $A7
    jr   z, jr_002_7147                           ;; 02:7134 $28 $11

    jp   ApplyCollisionWithSolid                  ;; 02:7136 $C3 $77 $72

.jr_7139
    ld   a, [wHasDungeonBossKey]                  ;; 02:7139 $FA $CF $DB
    and  a                                        ;; 02:713C $A7
    jr   nz, jr_002_7147                          ;; 02:713D $20 $08

    ld_dialog_low a, Dialog007 ; "Boss door locked" ;; 02:713F $3E $07
    call OpenDialogInTable0AndClearIncrement      ;; 02:7141 $CD $FE $74
    jp   ApplyCollisionWithSolid                  ;; 02:7144 $C3 $77 $72

jr_002_7147:
    ldh  a, [hMultiPurposeD]                      ;; 02:7147 $F0 $E4
    sub  $90                                      ;; 02:7149 $D6 $90
    ld   [wC189], a                               ;; 02:714B $EA $89 $C1
    xor  a                                        ;; 02:714E $AF
    ld   [wDBAC], a                               ;; 02:714F $EA $AC $DB
    inc  a                                        ;; 02:7152 $3C
    ld   [wC188], a                               ;; 02:7153 $EA $88 $C1
    call SynchronizeDungeonsItemFlags_trampoline  ;; 02:7156 $CD $02 $28
    call EnqueueDoorUnlockedSfx                   ;; 02:7159 $CD $20 $54
    jp   ApplyCollisionWithSolid                  ;; 02:715C $C3 $77 $72

label_002_715F:
    cp   $7C                                      ;; 02:715F $FE $7C
    jp   c, label_002_7461                        ;; 02:7161 $DA $61 $74

    push af                                       ;; 02:7164 $F5
    jr   z, .jr_716B                              ;; 02:7165 $28 $04

    cp   $7D                                      ;; 02:7167 $FE $7D
    jr   nz, jr_002_716E                          ;; 02:7169 $20 $03

.jr_716B
    call func_002_7468                            ;; 02:716B $CD $68 $74

jr_002_716E:
    pop  af                                       ;; 02:716E $F1
    cp   $90                                      ;; 02:716F $FE $90
    jp   nc, label_002_7461                       ;; 02:7171 $D2 $61 $74

    sub  $7C                                      ;; 02:7174 $D6 $7C
    sla  a                                        ;; 02:7176 $CB $27
    sla  a                                        ;; 02:7178 $CB $27
    ld   e, a                                     ;; 02:717A $5F
    ld   d, $00                                   ;; 02:717B $16 $00
    ld   hl, Data_002_49CA                        ;; 02:717D $21 $CA $49
    add  hl, de                                   ;; 02:7180 $19
    ldh  a, [hMultiPurpose4]                      ;; 02:7181 $F0 $DB
    rra                                           ;; 02:7183 $1F
    rra                                           ;; 02:7184 $1F
    rra                                           ;; 02:7185 $1F
    and  $01                                      ;; 02:7186 $E6 $01
    ld   e, a                                     ;; 02:7188 $5F
    ldh  a, [hMultiPurpose5]                      ;; 02:7189 $F0 $DC
    rra                                           ;; 02:718B $1F
    rra                                           ;; 02:718C $1F
    and  $02                                      ;; 02:718D $E6 $02
    or   e                                        ;; 02:718F $B3
    ld   e, a                                     ;; 02:7190 $5F
    ld   d, $00                                   ;; 02:7191 $16 $00
    add  hl, de                                   ;; 02:7193 $19
    ld   a, [hl]                                  ;; 02:7194 $7E
    and  a                                        ;; 02:7195 $A7
    jp   nz, ApplyCollisionWithSolid              ;; 02:7196 $C2 $77 $72

    jp   label_002_7461                           ;; 02:7199 $C3 $61 $74

ApplyCollisionWithLedge:
    ld   a, [wLinkMotionState]                    ;; 02:719C $FA $1C $C1
    cp   LINK_MOTION_UNSTUCKING                   ;; 02:719F $FE $02
    jp   z, collisionEnd                          ;; 02:71A1 $CA $54 $74

    ld   a, [wLiftedEntityType]                   ;; 02:71A4 $FA $A8 $C5
    cp   ENTITY_ROOSTER                           ;; 02:71A7 $FE $D5
    jp   z, collisionEnd                          ;; 02:71A9 $CA $54 $74

    ldh  a, [hMultiPurpose5]                      ;; 02:71AC $F0 $DC
    and  $0F                                      ;; 02:71AE $E6 $0F
    cp   $08                                      ;; 02:71B0 $FE $08
    jp   c, label_002_7461                        ;; 02:71B2 $DA $61 $74

    call func_002_6EA9                            ;; 02:71B5 $CD $A9 $6E
    jp   collisionEnd                             ;; 02:71B8 $C3 $54 $74

ApplyCollisionWithDoor:
    ld   a, [wIsCarryingLiftedObject]             ;; 02:71BB $FA $5C $C1
    and  a                                        ;; 02:71BE $A7
    jp   nz, collisionEnd                         ;; 02:71BF $C2 $54 $74

    ldh  a, [hMultiPurpose5]                      ;; 02:71C2 $F0 $DC
    and  $0F                                      ;; 02:71C4 $E6 $0F
    cp   $06                                      ;; 02:71C6 $FE $06
    jp   nc, label_002_726A                       ;; 02:71C8 $D2 $6A $72

    ;
    ; Special cases for passing through an entrance to a dungeon
    ; while being followed by the Ghost or Marin.
    ;

    ld   a, [wIsIndoor]                           ;; 02:71CB $FA $A5 $DB
    and  a                                        ;; 02:71CE $A7
    jr   nz, jr_002_722C                          ;; 02:71CF $20 $5B

    ld   a, [wIsGhostFollowingLink]               ;; 02:71D1 $FA $79 $DB
    cp   TRUE                                     ;; 02:71D4 $FE $01
    jr   z, .jr_71DE                              ;; 02:71D6 $28 $06

    ld   a, [wIsMarinFollowingLink]               ;; 02:71D8 $FA $73 $DB
    and  a                                        ;; 02:71DB $A7
    jr   z, jr_002_722C                           ;; 02:71DC $28 $4E

.jr_71DE
    ; Check all dungeon entrances
    ;
    ; @bug: Because the Color Dungeon is a staircase and not door,
    ; this check is never hit for the Color Dungeon entrance.
    ; That's probably why the developers added an extra "you should
    ; not have followers" check for the Color Dungeon as well.

    ldh  a, [hMapRoom]                            ;; 02:71DE $F0 $F6
    cp   ROOM_OW_COLOR_DUNGEON_ENTRANCE           ;; 02:71E0 $FE $77
    jr   z, .jr_7204                              ;; 02:71E2 $28 $20
    cp   ROOM_OW_TAIL_CAVE_ENTRANCE               ;; 02:71E4 $FE $D3
    jr   z, .jr_7204                              ;; 02:71E6 $28 $1C
    cp   ROOM_OW_BOTTLE_GROTTO_ENTRANCE           ;; 02:71E8 $FE $24
    jr   z, .jr_7204                              ;; 02:71EA $28 $18
    cp   ROOM_OW_KEY_CAVERN_ENTRANCE              ;; 02:71EC $FE $B5
    jr   z, .jr_7204                              ;; 02:71EE $28 $14
    cp   ROOM_OW_ANGLERS_TUNNEL_ENTRANCE          ;; 02:71F0 $FE $2B
    jr   z, .jr_7204                              ;; 02:71F2 $28 $10
    cp   ROOM_OW_CATFISHS_MAW_ENTRANCE            ;; 02:71F4 $FE $D9
    jr   z, .jr_7204                              ;; 02:71F6 $28 $0C
    cp   ROOM_OW_SOUTHERN_FACE_SHRINE_ENTRANCE    ;; 02:71F8 $FE $AC
    jr   z, .jr_7204                              ;; 02:71FA $28 $08
    cp   ROOM_OW_FACE_SHRINE_ENTRANCE             ;; 02:71FC $FE $8C
    jr   z, .jr_7204                              ;; 02:71FE $28 $04
    cp   ROOM_OW_EAGLES_TOWER                     ;; 02:7200 $FE $0E
    jr   nz, jr_002_722C                          ;; 02:7202 $20 $28

.jr_7204
    ld   a, [wIsGhostFollowingLink]               ;; 02:7204 $FA $79 $DB
    cp   TRUE                                     ;; 02:7207 $FE $01
    jr   nz, .jr_7213                             ;; 02:7209 $20 $08

    ld_dialog_low a, Dialog212 ; "N-not there!"   ;; 02:720B $3E $12
    call OpenDialogInTable2AndClearIncrement      ;; 02:720D $CD $04 $75
    jp   collisionEnd                             ;; 02:7210 $C3 $54 $74

.jr_7213
    xor  a                                        ;; 02:7213 $AF
    ld   [wDB47], a                               ;; 02:7214 $EA $47 $DB

    ld_dialog_low a, Dialog198 ; "You want me to go in there?" ;; 02:7217 $3E $98
    ld   [wC3C9], a                               ;; 02:7219 $EA $C9 $C3
    call OpenDialogInTable1                       ;; 02:721C $CD $73 $23

    ld   a, [wIsOnLowHeath]                       ;; 02:721F $FA $63 $C1
    inc  a                                        ;; 02:7222 $3C
    ld   [wDB10], a                               ;; 02:7223 $EA $10 $DB
    call disableMovementInTransition              ;; 02:7226 $CD $9E $0C
    jp   collisionEnd                             ;; 02:7229 $C3 $54 $74

jr_002_722C:
    ld   a, [wIgnoreLinkCollisionsCountdown]      ;; 02:722C $FA $3E $C1
    and  a                                        ;; 02:722F $A7
    jp   nz, collisionEnd                         ;; 02:7230 $C2 $54 $74

    ld   a, [wIsIndoor]                           ;; 02:7233 $FA $A5 $DB
    and  a                                        ;; 02:7236 $A7
    jp   nz, ApplyMapFadeOutTransitionWithSound   ;; 02:7237 $C2 $89 $0C

    jp   ApplyMapFadeOutTransitionWithNoise       ;; 02:723A $C3 $7D $0C

ApplyCollisionWithOceanOrSwitchBlock:
    ld   a, [wLinkStandingOnSwitchBlock]          ;; 02:723D $FA $F9 $D6
    and  a                                        ;; 02:7240 $A7
    jp   nz, label_002_7461                       ;; 02:7241 $C2 $61 $74

    ldh  a, [hObjectUnderEntity]                  ;; 02:7244 $F0 $AF
    cp   OBJECT_LOWERED_BLOCK                     ;; 02:7246 $FE $DB
    jr   c, ApplyCollisionWithSolid               ;; 02:7248 $38 $2D

    cp   OBJECT_RAISED_BLOCK + 1                  ;; 02:724A $FE $DD
    jr   nc, ApplyCollisionWithSolid              ;; 02:724C $30 $29

    sub  OBJECT_LOWERED_BLOCK                     ;; 02:724E $D6 $DB
    ld   e, a                                     ;; 02:7250 $5F
    ld   d, $00                                   ;; 02:7251 $16 $00
    ld   hl, SwitchBlocksStateTable               ;; 02:7253 $21 $7B $78
    add  hl, de                                   ;; 02:7256 $19
    ld   a, [wSwitchBlocksState]                  ;; 02:7257 $FA $FB $D6
    xor  [hl]                                     ;; 02:725A $AE
    jr   nz, ApplyCollisionWithSolid              ;; 02:725B $20 $1A

    jp   label_002_7461                           ;; 02:725D $C3 $61 $74

ApplyCollisionWithStairs:
    ld   hl, wLinkGroundStatus                    ;; 02:7260 $21 $1F $C1
    ld   [hl], $01                                ;; 02:7263 $36 $01
    cp   $0A                                      ;; 02:7265 $FE $0A
    jp   z, label_002_7461                        ;; 02:7267 $CA $61 $74

label_002_726A:
    ldh  a, [hMultiPurpose4]                      ;; 02:726A $F0 $DB
    and  $0F                                      ;; 02:726C $E6 $0F
    cp   $06                                      ;; 02:726E $FE $06
    jr   c, ApplyCollisionWithSolid               ;; 02:7270 $38 $05

    cp   $0B                                      ;; 02:7272 $FE $0B
    jp   c, label_002_7461                        ;; 02:7274 $DA $61 $74

ApplyCollisionWithSolid:
    ldh  a, [hObjectUnderEntity]                  ;; 02:7277 $F0 $AF
    cp   OBJECT_HURT_TILE                         ;; 02:7279 $FE $69
    jr   nz, jr_002_728E                          ;; 02:727B $20 $11

    ld   hl, hMultiPurposeC                       ;; 02:727D $21 $E3 $FF
    ldh  a, [hLinkDirection]                      ;; 02:7280 $F0 $9E
    cp   [hl]                                     ;; 02:7282 $BE
    jr   nz, .jr_728B                             ;; 02:7283 $20 $06

    ld   a, [wIsUsingShield]                      ;; 02:7285 $FA $5B $C1
    and  a                                        ;; 02:7288 $A7
    jr   nz, jr_002_728E                          ;; 02:7289 $20 $03

.jr_728B
    call HurtBySpikes                             ;; 02:728B $CD $F5 $75

jr_002_728E:
    ld   hl, hMultiPurposeC                       ;; 02:728E $21 $E3 $FF
    ldh  a, [hLinkDirection]                      ;; 02:7291 $F0 $9E
    cp   [hl]                                     ;; 02:7293 $BE
    jr   nz, .checkPegasusBoots                   ;; 02:7294 $20 $64

    ld   a, [wIgnoreLinkCollisionsCountdown]      ;; 02:7296 $FA $3E $C1
    ld   hl, wIsLinkInTheAir                      ;; 02:7299 $21 $46 $C1
    or   [hl]                                     ;; 02:729C $B6
    jr   nz, .checkPegasusBoots                   ;; 02:729D $20 $5B

    ld   a, [wIsIndoor]                           ;; 02:729F $FA $A5 $DB
    and  a                                        ;; 02:72A2 $A7
    ldh  a, [hObjectUnderEntity]                  ;; 02:72A3 $F0 $AF
    jr   z, .checkOverworldObjects                ;; 02:72A5 $28 $2A

    ld_dialog_low e, Dialog08A ; "This rock has many cracks" ;; 02:72A7 $1E $8A
    cp   OBJECT_BOMBABLE_BLOCK                    ;; 02:72A9 $FE $A9
    jr   z, .jr_002_72EC                          ;; 02:72AB $28 $3F

    ld_dialog_low e, Dialog08B ; "What a weird object" ;; 02:72AD $1E $8B
    cp   OBJECT_DASHABLE_ROCK_2                   ;; 02:72AF $FE $4F
    jr   z, .jr_72BB                              ;; 02:72B1 $28 $08

    cp   OBJECT_DASHABLE_ROCK_1                   ;; 02:72B3 $FE $4E
    jr   z, .jr_72BB                              ;; 02:72B5 $28 $04

    cp   OBJECT_DASHABLE_ROCK_3                   ;; 02:72B7 $FE $88
    jr   nz, .jr_002_72C3                         ;; 02:72B9 $20 $08

.jr_72BB
    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:72BB $FA $4A $C1
    and  a                                        ;; 02:72BE $A7
    jr   nz, .checkPegasusBoots                   ;; 02:72BF $20 $39

    jr   .jr_002_72EC                             ;; 02:72C1 $18 $29

.jr_002_72C3:
    cp   OBJECT_KEYHOLE_BLOCK                     ;; 02:72C3 $FE $DE
    jr   nz, .checkOverworldObjects               ;; 02:72C5 $20 $0A

    ld   a, [wSmallKeysCount]                     ;; 02:72C7 $FA $D0 $DB
    and  a                                        ;; 02:72CA $A7
    jr   nz, .checkPegasusBoots                   ;; 02:72CB $20 $2D

    ld_dialog_low e, Dialog08C ; "This rock has a key hole" ;; 02:72CD $1E $8C
    jr   .jr_002_72EC                             ;; 02:72CF $18 $1B

; Check whether Link is touching an object in the
; overworld that should print an informational message
.checkOverworldObjects
    cp   OBJECT_LIFTABLE_ROCK                     ;; 02:72D1 $FE $20
    jr   nz, .checkPegasusBoots                   ;; 02:72D3 $20 $25

    ; If you have the Power Bracelet equippped, don't
    ; show the "This looks pretty heavy" dialog when
    ; touching an OBJECT_LIFTABLE_ROCK
    ld   a, [wInventoryItems.AButtonSlot]         ;; 02:72D5 $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 02:72D8 $FE $03
    jr   z, .checkPegasusBoots                    ;; 02:72DA $28 $1E

    ld   a, [wInventoryItems.BButtonSlot]         ;; 02:72DC $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 02:72DF $FE $03
    jr   z, .checkPegasusBoots                    ;; 02:72E1 $28 $17

    ; If you have instrument #2, don't show the
    ; "This looks pretty heavy" dialog when touching
    ; an OBJECT_LIFTABLE_ROCK ever again
    ld   a, [wHasInstrument2]                     ;; 02:72E3 $FA $66 $DB
    and  $02                                      ;; 02:72E6 $E6 $02
    jr   nz, .checkPegasusBoots                   ;; 02:72E8 $20 $10

    ld_dialog_low e, Dialog08D ; "This looks pretty heavy" ;; 02:72EA $1E $8D

.jr_002_72EC:
    ld   a, [wC5A6]                               ;; 02:72EC $FA $A6 $C5
    and  a                                        ;; 02:72EF $A7
    jr   nz, .checkPegasusBoots                   ;; 02:72F0 $20 $08

    inc  a                                        ;; 02:72F2 $3C
    ld   [wC5A6], a                               ;; 02:72F3 $EA $A6 $C5

    ld   a, e                                     ;; 02:72F6 $7B
    call OpenDialogInTable0AndClearIncrement      ;; 02:72F7 $CD $FE $74

; Check whether Link is currently dashing with
; the Pegasus Boots, in which case he should collide
; and not interact
.checkPegasusBoots
    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:72FA $FA $4A $C1
    and  a                                        ;; 02:72FD $A7
    jr   nz, .jr_7330                             ;; 02:72FE $20 $30

    ld   a, [wC16A]                               ;; 02:7300 $FA $6A $C1
    cp   $05                                      ;; 02:7303 $FE $05
    jr   nz, .jr_7330                             ;; 02:7305 $20 $29

    ld   hl, LinkDirectionCompareDirection        ;; 02:7307 $21 $31 $6E
    add  hl, bc                                   ;; 02:730A $09
    ldh  a, [hLinkDirection]                      ;; 02:730B $F0 $9E
    cp   [hl]                                     ;; 02:730D $BE
    jp   nz, collisionEnd                         ;; 02:730E $C2 $54 $74

    ld   a, [wC1C3]                               ;; 02:7311 $FA $C3 $C1
    inc  a                                        ;; 02:7314 $3C
    ld   [wC1C3], a                               ;; 02:7315 $EA $C3 $C1
    cp   $0C                                      ;; 02:7318 $FE $0C
    jp   c, collisionEnd                          ;; 02:731A $DA $54 $74

    xor  a                                        ;; 02:731D $AF
    ld   [wC1C3], a                               ;; 02:731E $EA $C3 $C1
    ; reset spin marker and sword charge
    xor  a                                        ;; 02:7321 $AF
    ld   [wIsUsingSpinAttack], a                  ;; 02:7322 $EA $21 $C1
    ld   [wSwordCharge], a                        ;; 02:7325 $EA $22 $C1
    ld   a, $0C                                   ;; 02:7328 $3E $0C
    ld   [wC16D], a                               ;; 02:732A $EA $6D $C1
    jp   collisionEnd                             ;; 02:732D $C3 $54 $74

.jr_7330
    ld   a, [wIsUsingShield]                      ;; 02:7330 $FA $5B $C1
    and  a                                        ;; 02:7333 $A7
    jr   nz, .jr_733B                             ;; 02:7334 $20 $05

    ld   a, $03                                   ;; 02:7336 $3E $03
    ld   [wIsLinkPushing], a                      ;; 02:7338 $EA $44 $C1

.jr_733B
    ldh  a, [hMapId]                              ;; 02:733B $F0 $F7
    and  a                                        ;; 02:733D $A7
    ldh  a, [hObjectUnderEntity]                  ;; 02:733E $F0 $AF
    jr   z, label_002_73AD                        ;; 02:7340 $28 $6B

    cp   OBJECT_DASHABLE_ROCK_3                   ;; 02:7342 $FE $88
    jr   z, .jr_734F                              ;; 02:7344 $28 $09

    cp   OBJECT_DASHABLE_ROCK_1                   ;; 02:7346 $FE $4E
    jr   z, .jr_734F                              ;; 02:7348 $28 $05

    cp   OBJECT_DASHABLE_ROCK_2                   ;; 02:734A $FE $4F
    jp   nz, label_002_73AD                       ;; 02:734C $C2 $AD $73

.jr_734F
    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:734F $FA $4A $C1
    and  a                                        ;; 02:7352 $A7
    jp   z, collisionEnd                          ;; 02:7353 $CA $54 $74

    ldh  a, [hMultiPurpose4]                      ;; 02:7356 $F0 $DB
    and  $F0                                      ;; 02:7358 $E6 $F0
    ldh  [hIntersectedObjectLeft], a              ;; 02:735A $E0 $CE
    ldh  a, [hMultiPurpose5]                      ;; 02:735C $F0 $DC
    and  $F0                                      ;; 02:735E $E6 $F0
    ldh  [hIntersectedObjectTop], a               ;; 02:7360 $E0 $CD
    ldh  a, [hDungeonFloorTile]                   ;; 02:7362 $F0 $E9
    ld   e, a                                     ;; 02:7364 $5F
    ld   d, $00                                   ;; 02:7365 $16 $00
    call func_014_5526_trampoline                 ;; 02:7367 $CD $78 $21

    ld   a, ENTITY_LIFTABLE_ROCK                  ;; 02:736A $3E $05
    call SpawnNewEntity_trampoline                ;; 02:736C $CD $86 $3B
    jp   c, collisionEnd                          ;; 02:736F $DA $54 $74

    ld   hl, wEntitiesPosXTable                   ;; 02:7372 $21 $00 $C2
    add  hl, de                                   ;; 02:7375 $19
    ldh  a, [hDungeonFloorTile]                   ;; 02:7376 $F0 $E9
    swap a                                        ;; 02:7378 $CB $37
    and  $F0                                      ;; 02:737A $E6 $F0
    add  $08                                      ;; 02:737C $C6 $08
    ld   [hl], a                                  ;; 02:737E $77
    ld   hl, wEntitiesPosYTable                   ;; 02:737F $21 $10 $C2
    add  hl, de                                   ;; 02:7382 $19
    ldh  a, [hDungeonFloorTile]                   ;; 02:7383 $F0 $E9
    and  $F0                                      ;; 02:7385 $E6 $F0
    add  $10                                      ;; 02:7387 $C6 $10
    ld   [hl], a                                  ;; 02:7389 $77
    ld   hl, wEntitiesSpriteVariantTable          ;; 02:738A $21 $B0 $C3
    add  hl, de                                   ;; 02:738D $19
    ld   [hl], d                                  ;; 02:738E $72
    ld   hl, hNoiseSfx                            ;; 02:738F $21 $F4 $FF
    ld   [hl], NOISE_SFX_POT_SMASHED              ;; 02:7392 $36 $09
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 02:7394 $21 $F0 $C2
    add  hl, de                                   ;; 02:7397 $19
    ld   [hl], $0F                                ;; 02:7398 $36 $0F
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 02:739A $21 $40 $C3
    add  hl, de                                   ;; 02:739D $19
    ld   [hl], 4 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 02:739E $36 $C4
    jp   label_002_7461                           ;; 02:73A0 $C3 $61 $74

Data_002_73A3::
IF __PATCH_0__
    db   $24, $25, $33, $22, $23, $14, $26, $27
ELSE
    db   $35, $44, $23, $14, $27
ENDC

Data_002_73A8::
IF __PATCH_0__
    db   $03, $03, $01, $02, $02, $00, $02, $02
ELSE
    db   $03, $01, $02, $00, $02
ENDC
.end

label_002_73AD:
    ld   e, $20                                   ;; 02:73AD $1E $20
    cp   $C5                                      ;; 02:73AF $FE $C5
    jr   nz, jr_002_741D                          ;; 02:73B1 $20 $6A

    ld   a, [wIsIndoor]                           ;; 02:73B3 $FA $A5 $DB
    and  a                                        ;; 02:73B6 $A7
    jp   nz, collisionEnd                         ;; 02:73B7 $C2 $54 $74

    ldh  a, [hMapRoom]                            ;; 02:73BA $F0 $F6
    cp   ROOM_OW_COLOR_DUNGEON_ENTRANCE           ;; 02:73BC $FE $77
    jr   nz, jr_002_742D                          ;; 02:73BE $20 $6D

    ld   a, [wColorDungonCorrectTombStones]       ;; 02:73C0 $FA $D9 $DD
    ldh  a, [hLinkPositionX]                      ;; 02:73C3 $F0 $98
IF __PATCH_0__
    sub  $08
ENDC
    swap a                                        ;; 02:73C5 $CB $37
    and  $0F                                      ;; 02:73C7 $E6 $0F
    ld   e, a                                     ;; 02:73C9 $5F
    ldh  a, [hLinkPositionY]                      ;; 02:73CA $F0 $99
IF __PATCH_0__
    sub  $08
ENDC
    and  $F0                                      ;; 02:73CC $E6 $F0
    or   e                                        ;; 02:73CE $B3
    ldh  [hMultiPurpose0], a                      ;; 02:73CF $E0 $D7
    ld   e, $00                                   ;; 02:73D1 $1E $00
    ld   d, e                                     ;; 02:73D3 $53

jr_002_73D4:
    ld   hl, Data_002_73A3                        ;; 02:73D4 $21 $A3 $73
    add  hl, de                                   ;; 02:73D7 $19
    ldh  a, [hMultiPurpose0]                      ;; 02:73D8 $F0 $D7
    cp   [hl]                                     ;; 02:73DA $BE
    jr   nz, .jr_73E6                             ;; 02:73DB $20 $09

    ldh  a, [hLinkDirection]                      ;; 02:73DD $F0 $9E
    ld   hl, Data_002_73A8                        ;; 02:73DF $21 $A8 $73
    add  hl, de                                   ;; 02:73E2 $19
    cp   [hl]                                     ;; 02:73E3 $BE
    jr   z, jr_002_73EE                           ;; 02:73E4 $28 $08

.jr_73E6
    inc  de                                       ;; 02:73E6 $13
    ld   a, e                                     ;; 02:73E7 $7B
    cp   Data_002_73A8.end - Data_002_73A8
    jr   nz, jr_002_73D4                          ;; 02:73EA $20 $E8

    jr   collisionEnd                             ;; 02:73EC $18 $66

jr_002_73EE:
    ld   a, e                                     ;; 02:73EE $7B
IF __PATCH_0__
    cp   $06
ELSE
    cp   $04                                      ;; 02:73EF $FE $04
ENDC
    jr   c, jr_002_742D                           ;; 02:73F1 $38 $3A

IF __PATCH_0__
    ld   a, [wIsLinkInTheAir]
    and  a
    jr   nz, collisionEnd
ENDC

    ld   hl, wInventoryItems.BButtonSlot          ;; 02:73F3 $21 $00 $DB

.loop_73F6
    ld   a, [hl+]                                 ;; 02:73F6 $2A
    cp   INVENTORY_POWER_BRACELET                 ;; 02:73F7 $FE $03
    jr   z, .jr_7402                              ;; 02:73F9 $28 $07

    ld   a, l                                     ;; 02:73FB $7D
    cp   $0C                                      ;; 02:73FC $FE $0C
    jr   nz, .loop_73F6                           ;; 02:73FE $20 $F6

    jr   jr_002_7415                              ;; 02:7400 $18 $13

.jr_7402
    ld   a, [wIsMarinFollowingLink]               ;; 02:7402 $FA $73 $DB
    ld   hl, wIsGhostFollowingLink                ;; 02:7405 $21 $79 $DB
    or   [hl]                                     ;; 02:7408 $B6
    ld   hl, wIsRoosterFollowingLink              ;; 02:7409 $21 $7B $DB
    or   [hl]                                     ;; 02:740C $B6
    ld   hl, wIsBowWowFollowingLink               ;; 02:740D $21 $56 $DB
    or   [hl]                                     ;; 02:7410 $B6
    and  LOW(~BOW_WOW_KIDNAPPED)                  ;; 02:7411 $E6 $7F
    jr   z, jr_002_742D                           ;; 02:7413 $28 $18

jr_002_7415:
    call_open_dialog Dialog253                    ;; 02:7415
    jp   collisionEnd                             ;; 02:741A $C3 $54 $74

jr_002_741D:
    ld   a, [wIsIndoor]                           ;; 02:741D $FA $A5 $DB
    and  a                                        ;; 02:7420 $A7
    jr   z, collisionEnd                          ;; 02:7421 $28 $31

    ldh  a, [hObjectUnderEntity]                  ;; 02:7423 $F0 $AF
    cp   OBJECT_KEYHOLE_BLOCK                     ;; 02:7425 $FE $DE
    jr   z, interactiveBlock                      ;; 02:7427 $28 $06

    cp   OBJECT_PUSHABLE_BLOCK                    ;; 02:7429 $FE $A7
    jr   nz, collisionEnd                         ;; 02:742B $20 $27

jr_002_742D:
    ld   e, $40                                   ;; 02:742D $1E $40

interactiveBlock:
    ; Increment wC191
    ld   a, [wC191]                               ;; 02:742F $FA $91 $C1
    inc  a                                        ;; 02:7432 $3C
    ld   [wC191], a                               ;; 02:7433 $EA $91 $C1
    cp   e                                        ;; 02:7436 $BB
    jr   c, collisionEnd                          ;; 02:7437 $38 $1B

    ld   a, e                                     ;; 02:7439 $7B
    ldh  [hMultiPurposeG], a                      ;; 02:743A $E0 $E8
    xor  a                                        ;; 02:743C $AF
    ld   [wC191], a                               ;; 02:743D $EA $91 $C1
    call TryOpenLockedDoor                        ;; 02:7440 $CD $B0 $53

    ; If on overworld…
    ld   a, [wIsIndoor]                           ;; 02:7443 $FA $A5 $DB
    and  a                                        ;; 02:7446 $A7
    jr   nz, collisionEnd                         ;; 02:7447 $20 $0B

    ; … and on room 77 (graveyard with entry to color dungeon)…
    ldh  a, [hMapRoom]                            ;; 02:7449 $F0 $F6
    cp   ROOM_OW_COLOR_DUNGEON_ENTRANCE           ;; 02:744B $FE $77
    jr   nz, collisionEnd                         ;; 02:744D $20 $05

IF __OPTIMIZATIONS_1__
    ld   hl, wFarcallParams
    ld   a, BANK(CheckPushedTombStone)
    ld   [hl+], a
    ld   a, HIGH(CheckPushedTombStone)
    ld   [hl+], a
    ld   a, LOW(CheckPushedTombStone)
    ld   [hl+], a
    ld   a, BANK(@)
    ld   [hl], a
    call Farcall
ELSE
    ld   a, BANK(@)                               ;; 02:744F $3E $02
    call CheckPushedTombStone_trampoline          ;; 02:7451 $CD $C8 $09
ENDC

collisionEnd::
    ld   hl, Data_002_6E29                        ;; 02:7454 $21 $29 $6E
    add  hl, bc                                   ;; 02:7457 $09
    ld   a, [wCollisionType]                      ;; 02:7458 $FA $33 $C1
    or   [hl]                                     ;; 02:745B $B6
    ld   [wCollisionType], a                      ;; 02:745C $EA $33 $C1
    scf                                           ;; 02:745F $37
    ret                                           ;; 02:7460 $C9

label_002_7461:
    xor  a                                        ;; 02:7461 $AF
    ld   [wC191], a                               ;; 02:7462 $EA $91 $C1
    scf                                           ;; 02:7465 $37
    ccf                                           ;; 02:7466 $3F
    ret                                           ;; 02:7467 $C9

func_002_7468::
    ldh  a, [hObjectUnderEntity]                  ;; 02:7468 $F0 $AF
    cp   $B1                                      ;; 02:746A $FE $B1
    jr   z, .jr_7472                              ;; 02:746C $28 $04

    cp   $B2                                      ;; 02:746E $FE $B2
    jr   nz, jr_002_7493                          ;; 02:7470 $20 $21

.jr_7472
    ldh  a, [hMultiPurpose5]                      ;; 02:7472 $F0 $DC
    and  $0F                                      ;; 02:7474 $E6 $0F
    cp   $06                                      ;; 02:7476 $FE $06
    jr   nc, ret_002_74AC                         ;; 02:7478 $30 $32

    ld   a, JINGLE_REVOLVING_DOOR                 ;; 02:747A $3E $0C
    ldh  [hJingle], a                             ;; 02:747C $E0 $F2

    ld   a, LINK_MOTION_REVOLVING_DOOR            ;; 02:747E $3E $05
    ld   [wLinkMotionState], a                    ;; 02:7480 $EA $1C $C1

    call ClearLinkPositionIncrement               ;; 02:7483 $CD $8E $17
    ld   [wInvincibilityCounter], a               ;; 02:7486 $EA $C7 $DB
    ld   [wLinkAnimationFrame], a                 ;; 02:7489 $EA $98 $C1
    ldh  [hLinkPositionZ], a                      ;; 02:748C $E0 $A2
    ldh  [hLinkVelocityZ], a                      ;; 02:748E $E0 $A3
    jp   ResetSpinAttack                          ;; 02:7490 $C3 $AF $0C

jr_002_7493:
    cp   $C1                                      ;; 02:7493 $FE $C1
    jr   z, .jr_74A3                              ;; 02:7495 $28 $0C

    cp   $C2                                      ;; 02:7497 $FE $C2
    jr   z, .jr_74A3                              ;; 02:7499 $28 $08

    cp   $BB                                      ;; 02:749B $FE $BB
    jr   z, .jr_74A3                              ;; 02:749D $28 $04

    cp   $BC                                      ;; 02:749F $FE $BC
    jr   nz, ret_002_74AC                         ;; 02:74A1 $20 $09

.jr_74A3
    ldh  a, [hMultiPurpose5]                      ;; 02:74A3 $F0 $DC
    and  $0F                                      ;; 02:74A5 $E6 $0F
    cp   $0C                                      ;; 02:74A7 $FE $0C
    jp   nc, ApplyMapFadeOutTransitionWithNoise   ;; 02:74A9 $D2 $7D $0C

ret_002_74AC:
    ret                                           ;; 02:74AC $C9

label_002_74AD:
    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:74AD $FA $4A $C1
    and  a                                        ;; 02:74B0 $A7
    ret  z                                        ;; 02:74B1 $C8

    ld   a, [wCurrentBank]                        ;; 02:74B2 $FA $AF $DB
    cp   $02                                      ;; 02:74B5 $FE $02
    ret  nz                                       ;; 02:74B7 $C0

    ld   a, [wCollisionType]                      ;; 02:74B8 $FA $33 $C1
    and  COLLISION_TYPE_VERTICAL                  ;; 02:74BB $E6 $03
    cp   COLLISION_TYPE_VERTICAL                  ;; 02:74BD $FE $03
    jr   z, .jr_74C9                              ;; 02:74BF $28 $08

    ld   a, [wCollisionType]                      ;; 02:74C1 $FA $33 $C1
    and  COLLISION_TYPE_HORIZONTAL                ;; 02:74C4 $E6 $0C
    cp   COLLISION_TYPE_HORIZONTAL                ;; 02:74C6 $FE $0C
    ret  nz                                       ;; 02:74C8 $C0

.jr_74C9
    call ResetSpinAttack                          ;; 02:74C9 $CD $AF $0C
    ldh  a, [hLinkSpeedX]                         ;; 02:74CC $F0 $9A
    cpl                                           ;; 02:74CE $2F
    inc  a                                        ;; 02:74CF $3C
    sra  a                                        ;; 02:74D0 $CB $2F
    sra  a                                        ;; 02:74D2 $CB $2F
    ldh  [hLinkSpeedX], a                         ;; 02:74D4 $E0 $9A
    ldh  a, [hLinkSpeedY]                         ;; 02:74D6 $F0 $9B
    cpl                                           ;; 02:74D8 $2F
    inc  a                                        ;; 02:74D9 $3C
    sra  a                                        ;; 02:74DA $CB $2F
    sra  a                                        ;; 02:74DC $CB $2F
    ldh  [hLinkSpeedY], a                         ;; 02:74DE $E0 $9B
    ld   a, $18                                   ;; 02:74E0 $3E $18
    ldh  [hLinkVelocityZ], a                      ;; 02:74E2 $E0 $A3
    ld   a, $02                                   ;; 02:74E4 $3E $02
    ld   [wIsLinkInTheAir], a                     ;; 02:74E6 $EA $46 $C1
    ld   a, $20                                   ;; 02:74E9 $3E $20
    ld   [wScreenShakeCountdown], a               ;; 02:74EB $EA $57 $C1
    ldh  a, [hLinkDirection]                      ;; 02:74EE $F0 $9E
    and  $02                                      ;; 02:74F0 $E6 $02
    sla  a                                        ;; 02:74F2 $CB $27
    ld   [wC158], a                               ;; 02:74F4 $EA $58 $C1
    ld   a, JINGLE_STRONG_BUMP                    ;; 02:74F7 $3E $0B
    ldh  [hJingle], a                             ;; 02:74F9 $E0 $F2
    jp   func_1828                                ;; 02:74FB $C3 $28 $18

OpenDialogInTable0AndClearIncrement::
    call OpenDialogInTable0                       ;; 02:74FE $CD $85 $23
    jp   ClearLinkPositionIncrement               ;; 02:7501 $C3 $8E $17

OpenDialogInTable2AndClearIncrement::
    call OpenDialogInTable2                       ;; 02:7504 $CD $7C $23
    jp   ClearLinkPositionIncrement               ;; 02:7507 $C3 $8E $17

Data_002_750A::
    db   $08, $F8, $00, $00

Data_002_750E::
    db   $00, $00, $F8, $08

; Retrieve the ID of the room object currently under the player's feets.
; See OBJECT_* constants for possible values.
;
; Return:
;   a    the object id
GetObjectUnderLink::
    ldh  a, [hLinkPositionX]                      ;; 02:7512 $F0 $98
    and  $F0                                      ;; 02:7514 $E6 $F0
    ldh  [hMultiPurpose0], a                      ;; 02:7516 $E0 $D7
    swap a                                        ;; 02:7518 $CB $37
    ld   e, a                                     ;; 02:751A $5F
    ldh  a, [hLinkPositionY]                      ;; 02:751B $F0 $99
    sub  $04                                      ;; 02:751D $D6 $04
    and  $F0                                      ;; 02:751F $E6 $F0
    ldh  [hMultiPurpose1], a                      ;; 02:7521 $E0 $D8
    or   e                                        ;; 02:7523 $B3
    ld   e, a                                     ;; 02:7524 $5F
    ldh  [hLinkRoomPosition], a                   ;; 02:7525 $E0 $FA
    ld   d, $00                                   ;; 02:7527 $16 $00
    ld   hl, wRoomObjects                         ;; 02:7529 $21 $11 $D7
    ld   a, h                                     ;; 02:752C $7C
    add  hl, de                                   ;; 02:752D $19
    ld   h, a                                     ;; 02:752E $67
    ld   a, [wIsIndoor]                           ;; 02:752F $FA $A5 $DB
    ld   d, a                                     ;; 02:7532 $57

    ld   a, [hl]                                  ;; 02:7533 $7E
    ldh  [hObjectUnderLink], a                    ;; 02:7534 $E0 $B8
    ldh  [hObjectUnderEntity], a                  ;; 02:7536 $E0 $AF

    ld   e, a                                     ;; 02:7538 $5F
    ret                                           ;; 02:7539 $C9

func_002_753A::
    ld   a, [wLinkMotionState]                    ;; 02:753A $FA $1C $C1
    cp   LINK_MOTION_SWIMMING                     ;; 02:753D $FE $01
    jr   nz, .jr_7549                             ;; 02:753F $20 $08

    ld   a, [wC13B]                               ;; 02:7541 $FA $3B $C1
    add  $04                                      ;; 02:7544 $C6 $04
    ld   [wC13B], a                               ;; 02:7546 $EA $3B $C1

.jr_7549
    ld   a, [wC1A4]                               ;; 02:7549 $FA $A4 $C1
    and  a                                        ;; 02:754C $A7
    jr   z, jr_002_7587                           ;; 02:754D $28 $38

func_002_754F::
    ld   hl, wIsLinkInTheAir                      ;; 02:754F $21 $46 $C1
    ld   a, [wIsRunningWithPegasusBoots]          ;; 02:7552 $FA $4A $C1
    or   [hl]                                     ;; 02:7555 $B6
    jr   nz, func_002_755B                        ;; 02:7556 $20 $03

    call ClearLinkPositionIncrement               ;; 02:7558 $CD $8E $17

; Called when getting an item, and showing a location on the mini-map
func_002_755B::
    call GetObjectUnderLink                       ;; 02:755B $CD $12 $75
    ld   c, $04                                   ;; 02:755E $0E $04
    ld   a, [wD463]                               ;; 02:7560 $FA $63 $D4
    cp   $01                                      ;; 02:7563 $FE $01
    jr   z, .jr_7582                              ;; 02:7565 $28 $1B

    ld   c, $FC                                   ;; 02:7567 $0E $FC
    ld   a, [wLinkStandingOnSwitchBlock]          ;; 02:7569 $FA $F9 $D6
    and  a                                        ;; 02:756C $A7
    jr   nz, .jr_7582                             ;; 02:756D $20 $13

    call GetObjectPhysicsFlags_trampoline         ;; 02:756F $CD $26 $2A
    ld   c, $02                                   ;; 02:7572 $0E $02
    cp   $05                                      ;; 02:7574 $FE $05
    jr   z, .jr_7582                              ;; 02:7576 $28 $0A

    cp   $09                                      ;; 02:7578 $FE $09
    jr   z, .jr_7582                              ;; 02:757A $28 $06

    cp   $08                                      ;; 02:757C $FE $08
    jr   nz, ret_002_7586                         ;; 02:757E $20 $06

    ld   c, $FD                                   ;; 02:7580 $0E $FD

.jr_7582
    ld   a, c                                     ;; 02:7582 $79
    ld   [wC13B], a                               ;; 02:7583 $EA $3B $C1

ret_002_7586:
    ret                                           ;; 02:7586 $C9

jr_002_7587:
    ldh  a, [hLinkRoomPosition]                   ;; 02:7587 $F0 $FA
    ldh  [hLinkFinalRoomPosition], a              ;; 02:7589 $E0 $FB
    ld   a, [wFreeMovementMode]                   ;; 02:758B $FA $7B $C1
    and  a                                        ;; 02:758E $A7
    ret  nz                                       ;; 02:758F $C0

    ldh  a, [hLinkPositionZ]                      ;; 02:7590 $F0 $A2
    and  a                                        ;; 02:7592 $A7
    jr   z, jr_002_75B2                           ;; 02:7593 $28 $1D

    ldh  a, [hFrameCounter]                       ;; 02:7595 $F0 $E7
    and  $01                                      ;; 02:7597 $E6 $01
    jr   nz, ret_002_75B1                         ;; 02:7599 $20 $16

    ld   hl, wLinkOAMBuffer                       ;; 02:759B $21 $00 $C0
    ldh  a, [hLinkPositionY]                      ;; 02:759E $F0 $99
    add  $0B                                      ;; 02:75A0 $C6 $0B
    cp   $88                                      ;; 02:75A2 $FE $88
    jr   nc, ret_002_75B1                         ;; 02:75A4 $30 $0B

    ld   [hl+], a                                 ;; 02:75A6 $22

    ldh  a, [hLinkPositionX]                      ;; 02:75A7 $F0 $98
    add  $04                                      ;; 02:75A9 $C6 $04
    ld   [hl+], a                                 ;; 02:75AB $22

    ld   a, $26                                   ;; 02:75AC $3E $26
    ld   [hl+], a                                 ;; 02:75AE $22
    ld   [hl], $00                                ;; 02:75AF $36 $00

ret_002_75B1:
    ret                                           ;; 02:75B1 $C9

jr_002_75B2:
    xor  a                                        ;; 02:75B2 $AF
    ld   [wD475], a                               ;; 02:75B3 $EA $75 $D4
    ld   a, [wLinkMotionState]                    ;; 02:75B6 $FA $1C $C1
    cp   LINK_MOTION_UNSTUCKING                   ;; 02:75B9 $FE $02
    jr   z, ret_002_75B1                          ;; 02:75BB $28 $F4

; Handle physics between Link and the ground.
;
; This includes spikes, pits, normal ground, etc.
ApplyLinkGroundPhysics::
    ld   a, [wRoomTransitionState]                ;; 02:75BD $FA $24 $C1
    ld   hl, wDialogState                         ;; 02:75C0 $21 $9F $C1
    or   [hl]                                     ;; 02:75C3 $B6
    jp   nz, label_002_76C0                       ;; 02:75C4 $C2 $C0 $76

    ; Store id of the object under Link's feets into a
    call GetObjectUnderLink                       ;; 02:75C7 $CD $12 $75

    ; If over an overworld well, fall immediately into it
    ld   c, a                                     ;; 02:75CA $4F
    ld   a, [wIsIndoor]                           ;; 02:75CB $FA $A5 $DB
    and  a                                        ;; 02:75CE $A7
    jr   nz, .indoor                              ;; 02:75CF $20 $08

    ld   a, c                                     ;; 02:75D1 $79
    cp   OBJECT_WELL                              ;; 02:75D2 $FE $61
    jp   z, ApplyLinkGroundPhysics_part2.makeLinkFallInPit ;; 02:75D4 $CA $AA $76

    jr   .specialCasesEnd                         ;; 02:75D7 $18 $0E

.indoor
    ; If over side-view spikes, hurt the player imediately
    ld   a, c                                     ;; 02:75D9 $79
    cp   OBJECT_SIDE_VIEW_SPIKES                  ;; 02:75DA $FE $4C
    jr   nz, .specialCasesEnd                     ;; 02:75DC $20 $09

    ldh  a, [hLinkPositionY]                      ;; 02:75DE $F0 $99
    dec  a                                        ;; 02:75E0 $3D
    and  $0F                                      ;; 02:75E1 $E6 $0F
    cp   $0C                                      ;; 02:75E3 $FE $0C
    jr   nc, HurtBySpikes                         ;; 02:75E5 $30 $0E

.specialCasesEnd

    call GetObjectPhysicsFlags_trampoline         ;; 02:75E7 $CD $26 $2A
    ld   [wLinkObjectPhysics], a                  ;; 02:75EA $EA $81 $C1
    and  a                                        ;; 02:75ED $A7
    jp   z, ApplyLinkGroundPhysics_Default        ;; 02:75EE $CA $A2 $77

    cp   OBJ_PHYSICS_SPIKES                       ;; 02:75F1 $FE $E0
    jr   nz, ApplyLinkGroundPhysics_part2         ;; 02:75F3 $20 $40
    ; fallthrough

; Hurt Link when bumbing into spikes (object, thwomp, etc.)
; Makes Link recoil, and lose one heart.
HurtBySpikes::
    ; If already fallen, return
    ld   a, [wInvincibilityCounter]               ;; 02:75F5 $FA $C7 $DB
    and  a                                        ;; 02:75F8 $A7
    jr   nz, .return                              ;; 02:75F9 $20 $39

    call ResetSpinAttack                          ;; 02:75FB $CD $AF $0C

    ; Invert Link speed
    ldh  a, [hLinkSpeedX]                         ;; 02:75FE $F0 $9A
    cpl                                           ;; 02:7600 $2F
    inc  a                                        ;; 02:7601 $3C
    ldh  [hLinkSpeedX], a                         ;; 02:7602 $E0 $9A
    ldh  a, [hLinkSpeedY]                         ;; 02:7604 $F0 $9B
    cpl                                           ;; 02:7606 $2F
    inc  a                                        ;; 02:7607 $3C
    ldh  [hLinkSpeedY], a                         ;; 02:7608 $E0 $9B

    ; Mark Link as in the air
    ld   a, $02                                   ;; 02:760A $3E $02
    ld   [wIsLinkInTheAir], a                     ;; 02:760C $EA $46 $C1

    ; If in top-view…
    ldh  a, [hIsSideScrolling]                    ;; 02:760F $F0 $F9
    and  a                                        ;; 02:7611 $A7
    jr   nz, .topViewEnd                          ;; 02:7612 $20 $0A
    ; … move Link slighly above the ground
    ld   a, $10                                   ;; 02:7614 $3E $10
    ldh  [hLinkVelocityZ], a                      ;; 02:7616 $E0 $A3
    ldh  a, [hLinkPositionZ]                      ;; 02:7618 $F0 $A2
    add  $02                                      ;; 02:761A $C6 $02
    ldh  [hLinkPositionZ], a                      ;; 02:761C $E0 $A2
.topViewEnd

    ld   a, $10                                   ;; 02:761E $3E $10
    ld   [wIgnoreLinkCollisionsCountdown], a      ;; 02:7620 $EA $3E $C1

    ; Make Link invicible during 48 frames
    ld   a, $30                                   ;; 02:7623 $3E $30
    ld   [wInvincibilityCounter], a               ;; 02:7625 $EA $C7 $DB

    ; Loose one full heart
    ld   a, [wSubtractHealthBuffer]               ;; 02:7628 $FA $94 $DB
    add  $04                                      ;; 02:762B $C6 $04
    ld   [wSubtractHealthBuffer], a               ;; 02:762D $EA $94 $DB

    ; Play the "hurt" sfx
    ld   a, WAVE_SFX_LINK_HURT                    ;; 02:7630 $3E $03
    ldh  [hWaveSfx], a                            ;; 02:7632 $E0 $F3

.return
    ret                                           ;; 02:7634 $C9

ApplyLinkGroundPhysics_part2::
    ld   a, [wLinkObjectPhysics]                  ;; 02:7635 $FA $81 $C1
    cp   OBJ_PHYSICS_TRACTOR_DEVICE               ;; 02:7638 $FE $FF
    jp   z, ApplyLinkGroundPhysics_Default        ;; 02:763A $CA $A2 $77

    cp   OBJ_PHYSICS_CONVEYOR                     ;; 02:763D $FE $F0
    jr   c, .jr_002_7644                          ;; 02:763F $38 $03

    jp   label_002_7C14                           ;; 02:7641 $C3 $14 $7C

.jr_002_7644
    cp   OBJ_PHYSICS_PIT_WARP                     ;; 02:7644 $FE $51
    jr   z, .slipIntoPit                          ;; 02:7646 $28 $04

    cp   OBJ_PHYSICS_PIT                          ;; 02:7648 $FE $50
    jr   nz, label_002_76C0                       ;; 02:764A $20 $74

; handle pit physics
; called when slipping into a pit before falling
.slipIntoPit
    call ResetSpinAttack                          ;; 02:764C $CD $AF $0C

    ld   a, GROUND_STATUS_PIT                     ;; 02:764F $3E $07
    ld   [wLinkGroundStatus], a                   ;; 02:7651 $EA $1F $C1

    ld   hl, wPitSlippingCounter                  ;; 02:7654 $21 $BB $C1
    inc  [hl]                                     ;; 02:7657 $34

    ; If in free-movment debug mode, or not every 4th frame, return.
    ld   hl, wFreeMovementMode                    ;; 02:7658 $21 $7B $C1
    ldh  a, [hFrameCounter]                       ;; 02:765B $F0 $E7
    and  $03                                      ;; 02:765D $E6 $03
    or   [hl]                                     ;; 02:765F $B6
    jr   nz, .return                              ;; 02:7660 $20 $5D

    ; Adjust Link X position (using content of hMultiPurpose1)
    ldh  a, [hLinkPositionX]                      ;; 02:7662 $F0 $98
    sub  $08                                      ;; 02:7664 $D6 $08
    ld   hl, hMultiPurpose0                       ;; 02:7666 $21 $D7 $FF
    sub  [hl]                                     ;; 02:7669 $96
    bit  7, a                                     ;; 02:766A $CB $7F
    ld   a, $FF                                   ;; 02:766C $3E $FF
    jr   z, .jr_002_7672                          ;; 02:766E $28 $02
    ld   a, $01                                   ;; 02:7670 $3E $01
.jr_002_7672

    ld   hl, hLinkPositionX                       ;; 02:7672 $21 $98 $FF
    add  [hl]                                     ;; 02:7675 $86
    ld   [hl], a                                  ;; 02:7676 $77

    ; Adjust Link Y position (using content of hMultiPurpose1)
    ldh  a, [hMultiPurpose1]                      ;; 02:7677 $F0 $D8
    add  $10                                      ;; 02:7679 $C6 $10
    ld   hl, hLinkPositionY                       ;; 02:767B $21 $99 $FF
    sub  [hl]                                     ;; 02:767E $96
    bit  7, a                                     ;; 02:767F $CB $7F
    ld   a, $FF                                   ;; 02:7681 $3E $FF
    jr   nz, .jr_002_7687                         ;; 02:7683 $20 $02
    ld   a, $01                                   ;; 02:7685 $3E $01
.jr_002_7687

    ld   hl, hLinkPositionY                       ;; 02:7687 $21 $99 $FF
    add  [hl]                                     ;; 02:768A $86
    ld   [hl], a                                  ;; 02:768B $77

    ; If Link is close from pit center (?), make it fall down
    ldh  a, [hLinkPositionX]                      ;; 02:768C $F0 $98
    sub  $08                                      ;; 02:768E $D6 $08
    add  $02                                      ;; 02:7690 $C6 $02
    and  $0F                                      ;; 02:7692 $E6 $0F
    cp   $04                                      ;; 02:7694 $FE $04
    jr   nc, .return                              ;; 02:7696 $30 $27

    ldh  a, [hLinkPositionY]                      ;; 02:7698 $F0 $99
    sub  $10                                      ;; 02:769A $D6 $10
    add  $02                                      ;; 02:769C $C6 $02
    and  $0F                                      ;; 02:769E $E6 $0F
    cp   $04                                      ;; 02:76A0 $FE $04
    jr   nc, .return                              ;; 02:76A2 $30 $1B

    ldh  a, [hLinkPositionY]                      ;; 02:76A4 $F0 $99
    add  $03                                      ;; 02:76A6 $C6 $03
    ldh  [hLinkPositionY], a                      ;; 02:76A8 $E0 $99

.makeLinkFallInPit
    ; Make Link fall down the pit
    ld   a, LINK_MOTION_FALLING_DOWN              ;; 02:76AA $3E $06
    ld   [wLinkMotionState], a                    ;; 02:76AC $EA $1C $C1

    call ResetSpinAttack                          ;; 02:76AF $CD $AF $0C

    ld   [wLinkAnimationFrame], a                 ;; 02:76B2 $EA $98 $C1

    ld   a, [wLinkObjectPhysics]                  ;; 02:76B5 $FA $81 $C1
    ld   [wLinkFallingDownObjectPhysics], a       ;; 02:76B8 $EA $CB $DB

    ld   a, WAVE_SFX_LINK_FALL                    ;; 02:76BB $3E $0C
    ldh  [hWaveSfx], a                            ;; 02:76BD $E0 $F3

.return
    ret                                           ;; 02:76BF $C9

; Link ground physics during dialog or room transitions
label_002_76C0:
    ld   hl, wLinkOAMBuffer                       ;; 02:76C0 $21 $00 $C0
    ld   a, [wLinkObjectPhysics]                  ;; 02:76C3 $FA $81 $C1
    cp   OBJ_PHYSICS_RAISED                       ;; 02:76C6 $FE $08
    jr   nz, .jr_76D5                             ;; 02:76C8 $20 $0B

    ld   a, [wC13B]                               ;; 02:76CA $FA $3B $C1
    add  $FD                                      ;; 02:76CD $C6 $FD
    ld   [wC13B], a                               ;; 02:76CF $EA $3B $C1
    jp   ApplyLinkGroundPhysics_Default           ;; 02:76D2 $C3 $A2 $77

.jr_76D5
    cp   OBJ_PHYSICS_LOWERED                      ;; 02:76D5 $FE $09
    jr   nz, .jr_76E4                             ;; 02:76D7 $20 $0B

    ld   a, [wC13B]                               ;; 02:76D9 $FA $3B $C1
    add  $02                                      ;; 02:76DC $C6 $02
    ld   [wC13B], a                               ;; 02:76DE $EA $3B $C1
    jp   ApplyLinkGroundPhysics_Default           ;; 02:76E1 $C3 $A2 $77

.jr_76E4
    cp   OBJ_PHYSICS_LAVA                         ;; 02:76E4 $FE $0B
    jr   z, .jr_76EC                              ;; 02:76E6 $28 $04

    cp   OBJ_PHYSICS_DEEP_WATER                   ;; 02:76E8 $FE $07
    jr   nz, jr_002_7750                          ;; 02:76EA $20 $64

.jr_76EC
    ldh  a, [hLinkSlowWalkingSpeed]               ;; 02:76EC $F0 $B2
    and  a                                        ;; 02:76EE $A7
    jr   z, .jr_76F4                              ;; 02:76EF $28 $03

    jp   label_002_7C50                           ;; 02:76F1 $C3 $50 $7C

.jr_76F4
    ld   a, [wItemUsageContext]                   ;; 02:76F4 $FA $AD $C1
    cp   ITEM_USAGE_ON_RAFT                       ;; 02:76F7 $FE $80
    jr   z, jr_002_7750                           ;; 02:76F9 $28 $55

    ld   a, [wLinkMotionState]                    ;; 02:76FB $FA $1C $C1
    cp   LINK_MOTION_RECOVER                      ;; 02:76FE $FE $08
    jr   z, ret_002_774F                          ;; 02:7700 $28 $4D

    cp   LINK_MOTION_SWIMMING                     ;; 02:7702 $FE $01
    jr   z, ret_002_774F                          ;; 02:7704 $28 $49

    ldh  a, [hLinkPositionY]                      ;; 02:7706 $F0 $99
    add  $FE                                      ;; 02:7708 $C6 $FE
    call func_002_5928                            ;; 02:770A $CD $28 $59
    ldh  a, [hObjectUnderEntity]                  ;; 02:770D $F0 $AF
    cp   $06                                      ;; 02:770F $FE $06
    jr   z, label_002_7719                        ;; 02:7711 $28 $06

    ld   a, [wHasFlippers]                        ;; 02:7713 $FA $0C $DB
    and  a                                        ;; 02:7716 $A7
    jr   nz, jr_002_7732                          ;; 02:7717 $20 $19

label_002_7719:
    ld   a, $50                                   ;; 02:7719 $3E $50
    ldh  [hLinkCountdown], a                      ;; 02:771B $E0 $B7

    ld   a, LINK_MOTION_RECOVER                   ;; 02:771D $3E $08
    ld   [wLinkMotionState], a                    ;; 02:771F $EA $1C $C1

    ldh  a, [hObjectUnderEntity]                  ;; 02:7722 $F0 $AF
    ldh  [hLinkPhysicsModifier], a                ;; 02:7724 $E0 $9C
    ldh  a, [hLinkPositionY]                      ;; 02:7726 $F0 $99
    add  $02                                      ;; 02:7728 $C6 $02
    ldh  [hLinkPositionY], a                      ;; 02:772A $E0 $99
    ld   a, $01                                   ;; 02:772C $3E $01
    ld   [wC167], a                               ;; 02:772E $EA $67 $C1
    ret                                           ;; 02:7731 $C9

jr_002_7732:
    ld   a, $01                                   ;; 02:7732 $3E $01
    ld   [wLinkMotionState], a                    ;; 02:7734 $EA $1C $C1
    xor  a                                        ;; 02:7737 $AF
    ldh  [hLinkPhysicsModifier], a                ;; 02:7738 $E0 $9C
    call ClearLinkPositionIncrement               ;; 02:773A $CD $8E $17
    ldh  a, [hLinkDirection]                      ;; 02:773D $F0 $9E
    ld   e, a                                     ;; 02:773F $5F
IF __PATCH_0__
    ld   d, $00
ELSE
    ld   d, b                                     ;; 02:7740 $50
ENDC
    ld   hl, Data_002_750A                        ;; 02:7741 $21 $0A $75
    add  hl, de                                   ;; 02:7744 $19
    ld   a, [hl]                                  ;; 02:7745 $7E
    ldh  [hLinkSpeedX], a                         ;; 02:7746 $E0 $9A
    ld   hl, Data_002_750E                        ;; 02:7748 $21 $0E $75
    add  hl, de                                   ;; 02:774B $19
    ld   a, [hl]                                  ;; 02:774C $7E
    ldh  [hLinkSpeedY], a                         ;; 02:774D $E0 $9B

ret_002_774F:
    ret                                           ;; 02:774F $C9

jr_002_7750:
    cp   OBJ_PHYSICS_GRASS                        ;; 02:7750 $FE $06
    jp   z, label_002_787D                        ;; 02:7752 $CA $7D $78

    cp   OBJ_PHYSICS_SHALLOW_WATER                ;; 02:7755 $FE $05
    jr   nz, ApplyLinkGroundPhysics_Default       ;; 02:7757 $20 $49

    ldh  a, [hLinkPositionY]                      ;; 02:7759 $F0 $99
    add  $0C                                      ;; 02:775B $C6 $0C
    ld   [hl+], a                                 ;; 02:775D $22
    ldh  a, [hLinkPositionX]                      ;; 02:775E $F0 $98
    add  $00                                      ;; 02:7760 $C6 $00
    ld   [hl+], a                                 ;; 02:7762 $22
    ld   a, $1C                                   ;; 02:7763 $3E $1C
    ld   [hl+], a                                 ;; 02:7765 $22

IF __PATCH_0__
    ldh  a, [hIsGBC]
    and  a
    jr   z, .notGBC

.gbc
    ldh  a, [hFrameCounter]
    and  $02 << 1
    srl  a
    add  OAMF_PAL0 | OAM_GBC_PAL_3
    jr   .anyGB
ENDC

.notGBC
    ldh  a, [hFrameCounter]                       ;; 02:7766 $F0 $E7
    rla                                           ;; 02:7768 $17
    rla                                           ;; 02:7769 $17
    and  OAMF_PAL1                                ;; 02:776A $E6 $10

.anyGB
    push af                                       ;; 02:776C $F5
    ld   [hl+], a                                 ;; 02:776D $22
    ldh  a, [hLinkPositionY]                      ;; 02:776E $F0 $99
    add  $0C                                      ;; 02:7770 $C6 $0C
    ld   [hl+], a                                 ;; 02:7772 $22
    ldh  a, [hLinkPositionX]                      ;; 02:7773 $F0 $98
    add  $08                                      ;; 02:7775 $C6 $08
    ld   [hl+], a                                 ;; 02:7777 $22
    ld   a, $1C                                   ;; 02:7778 $3E $1C
    ld   [hl+], a                                 ;; 02:777A $22
    pop  af                                       ;; 02:777B $F1
    or   $20                                      ;; 02:777C $F6 $20
    ld   [hl], a                                  ;; 02:777E $77
    ld   a, GROUND_STATUS_SLOW                    ;; 02:777F $3E $03
    ld   [wLinkGroundStatus], a                   ;; 02:7781 $EA $1F $C1
    ldh  a, [hFrameCounter]                       ;; 02:7784 $F0 $E7
    and  $0F                                      ;; 02:7786 $E6 $0F
    jr   nz, .jr_779A                             ;; 02:7788 $20 $10

    ldh  a, [hPressedButtonsMask]                 ;; 02:778A $F0 $CB
    and  $0F                                      ;; 02:778C $E6 $0F
    jr   z, .jr_779A                              ;; 02:778E $28 $0A

    ld   a, [wDialogState]                        ;; 02:7790 $FA $9F $C1
    and  a                                        ;; 02:7793 $A7
    jr   nz, .jr_779A                             ;; 02:7794 $20 $04

IF __PATCH_0__
    ldh  a, [hLinkAnimationState]
    cp   LINK_ANIMATION_STATE_GOT_ITEM
    jr   z, .jr_779A
ENDC

    ld   a, JINGLE_WATER_SPLASH                   ;; 02:7796 $3E $0E
    ldh  [hJingle], a                             ;; 02:7798 $E0 $F2

.jr_779A
    ld   a, [wC13B]                               ;; 02:779A $FA $3B $C1
    add  $02                                      ;; 02:779D $C6 $02
    ld   [wC13B], a                               ;; 02:779F $EA $3B $C1

; Apply default ground physics to Link (solid ground)
ApplyLinkGroundPhysics_Default::
    ; Reset wPitSlippingCounter
    xor  a                                        ;; 02:77A2 $AF
    ld   [wPitSlippingCounter], a                 ;; 02:77A3 $EA $BB $C1

    ; If Link was swimming, mark it as no longer swimming
    ld   a, [wLinkMotionState]                    ;; 02:77A6 $FA $1C $C1
    cp   LINK_MOTION_SWIMMING                     ;; 02:77A9 $FE $01
    jr   nz, .swimmingEnd                         ;; 02:77AB $20 $05
    ld   a, LINK_MOTION_DEFAULT                   ;; 02:77AD $3E $00
    ld   [wLinkMotionState], a                    ;; 02:77AF $EA $1C $C1
.swimmingEnd

    ld   a, [wLinkObjectPhysics]                  ;; 02:77B2 $FA $81 $C1
    cp   OBJ_PHYSICS_OCEAN_SWITCH_BLOCK           ;; 02:77B5 $FE $04
    jr   nz, .grassVfxEnd                         ;; 02:77B7 $20 $30

    ldh  a, [hObjectUnderEntity]                  ;; 02:77B9 $F0 $AF
    cp   $DB                                      ;; 02:77BB $FE $DB
    jr   c, .grassVfxEnd                          ;; 02:77BD $38 $2A

    cp   $DD                                      ;; 02:77BF $FE $DD
    jr   nc, .grassVfxEnd                         ;; 02:77C1 $30 $26

    sub  $DB                                      ;; 02:77C3 $D6 $DB
    ld   e, a                                     ;; 02:77C5 $5F
    ld   d, $00                                   ;; 02:77C6 $16 $00
    ld   hl, SwitchBlocksStateTable               ;; 02:77C8 $21 $7B $78
    add  hl, de                                   ;; 02:77CB $19
    ld   a, [wSwitchBlocksState]                  ;; 02:77CC $FA $FB $D6
    xor  [hl]                                     ;; 02:77CF $AE
    jr   z, .grassVfxEnd                          ;; 02:77D0 $28 $17

    ld   a, [wSwitchableObjectAnimationStage]     ;; 02:77D2 $FA $F8 $D6
    ld   e, a                                     ;; 02:77D5 $5F
    ld   d, $00                                   ;; 02:77D6 $16 $00
    ld   hl, Data_002_786F                        ;; 02:77D8 $21 $6F $78
    add  hl, de                                   ;; 02:77DB $19
    ld   a, [wC13B]                               ;; 02:77DC $FA $3B $C1
    add  [hl]                                     ;; 02:77DF $86
    ld   [wC13B], a                               ;; 02:77E0 $EA $3B $C1
    ld   a, $01                                   ;; 02:77E3 $3E $01
    ld   [wLinkStandingOnSwitchBlock], a          ;; 02:77E5 $EA $F9 $D6
    ret                                           ;; 02:77E8 $C9
.grassVfxEnd

    ld   a, [wLinkStandingOnSwitchBlock]          ;; 02:77E9 $FA $F9 $D6
    and  a                                        ;; 02:77EC $A7
    jr   z, .jr_002_77F7                          ;; 02:77ED $28 $08

    ld   a, NOISE_SFX_FOOTSTEP                    ;; 02:77EF $3E $07
    ldh  [hNoiseSfx], a                           ;; 02:77F1 $E0 $F4
    xor  a                                        ;; 02:77F3 $AF
    ld   [wLinkStandingOnSwitchBlock], a          ;; 02:77F4 $EA $F9 $D6

.jr_002_77F7
    ld   a, [wIsIndoor]                           ;; 02:77F7 $FA $A5 $DB
    and  a                                        ;; 02:77FA $A7
    jp   z, .return                               ;; 02:77FB $CA $6E $78

    ld   a, [wRoomTransitionState]                ;; 02:77FE $FA $24 $C1
    and  a                                        ;; 02:7801 $A7
    jr   nz, .return                              ;; 02:7802 $20 $6A

    ;
    ; When stepping over a switch button, activate it
    ;

    ldh  a, [hObjectUnderEntity]                  ;; 02:7804 $F0 $AF
    cp   OBJECT_SWITCH_BUTTON                     ;; 02:7806 $FE $AA
    jr   nz, .switchButtonEnd                     ;; 02:7808 $20 $32

    ld   a, [wSwitchButtonPressed]                ;; 02:780A $FA $CB $C1
    and  a                                        ;; 02:780D $A7
    jr   nz, .switchButtonEnd                     ;; 02:780E $20 $2C

    ld   a, [wC1CA]                               ;; 02:7810 $FA $CA $C1
    inc  a                                        ;; 02:7813 $3C
    ld   [wC1CA], a                               ;; 02:7814 $EA $CA $C1
    cp   $18                                      ;; 02:7817 $FE $18
    jr   nz, .kanaletGateEnd                      ;; 02:7819 $20 $18

    ld   a, $60                                   ;; 02:781B $3E $60
    ld   [wSwitchButtonPressed], a                ;; 02:781D $EA $CB $C1

    ld   a, WAVE_SFX_FLOOR_SWITCH                 ;; 02:7820 $3E $0E
    ldh  [hWaveSfx], a                            ;; 02:7822 $E0 $F3

    ld   a, REPLACE_TILES_BUTTON_PRESSED          ;; 02:7824 $3E $03
    ldh  [hReplaceTiles], a                       ;; 02:7826 $E0 $A5

    ; If switch pressed is kanalet gate switch, mark the gate as opened
    ldh  a, [hMapRoom]                            ;; 02:7828 $F0 $F6
    cp   ROOM_INDOOR_B_KANALET_GATE_SWITCH        ;; 02:782A $FE $C3
    jr   nz, .kanaletGateEnd                      ;; 02:782C $20 $05
    ld   hl, wOverworldRoomStatus + ROOM_OW_KANALET_GATE ;; 02:782E $21 $79 $D8
    set  OW_ROOM_STATUS_FLAG_CHANGED, [hl]        ;; 02:7831 $CB $E6
.kanaletGateEnd

    ld   a, [wC13B]                               ;; 02:7833 $FA $3B $C1
    add  $FD                                      ;; 02:7836 $C6 $FD
    ld   [wC13B], a                               ;; 02:7838 $EA $3B $C1
    ret                                           ;; 02:783B $C9

.switchButtonEnd

    xor  a                                        ;; 02:783C $AF
    ld   [wC1CA], a                               ;; 02:783D $EA $CA $C1
    ldh  a, [hLinkRoomPosition]                   ;; 02:7840 $F0 $FA
    ld   hl, hLinkFinalRoomPosition               ;; 02:7842 $21 $FB $FF
    cp   [hl]                                     ;; 02:7845 $BE
    ld   hl, wC1C9                                ;; 02:7846 $21 $C9 $C1
    jr   nz, .jr_002_786C                         ;; 02:7849 $20 $21

    ldh  a, [hObjectUnderEntity]                  ;; 02:784B $F0 $AF
    cp   $DF                                      ;; 02:784D $FE $DF
    jr   nz, .jr_002_786C                         ;; 02:784F $20 $1B

    ldh  a, [hLinkInteractiveMotionBlocked]       ;; 02:7851 $F0 $A1
    ld   e, a                                     ;; 02:7853 $5F
    ld   a, [wDialogGotItem]                      ;; 02:7854 $FA $A9 $C1
    ld   d, a                                     ;; 02:7857 $57
    ld   a, [wDialogState]                        ;; 02:7858 $FA $9F $C1
    or   e                                        ;; 02:785B $B3
    or   d                                        ;; 02:785C $B2
    jr   nz, .jr_002_786C                         ;; 02:785D $20 $0D

    inc  [hl]                                     ;; 02:785F $34
    ld   a, [hl]                                  ;; 02:7860 $7E
    cp   $28                                      ;; 02:7861 $FE $28
    jr   c, .return                               ;; 02:7863 $38 $09

    ld   a, NOISE_SFX_RUMBLE2                     ;; 02:7865 $3E $2B
    ldh  [hNoiseSfx], a                           ;; 02:7867 $E0 $F4
    jp   label_002_4D97                           ;; 02:7869 $C3 $97 $4D

.jr_002_786C
    ld   [hl], $00                                ;; 02:786C $36 $00

.return
    ret                                           ;; 02:786E $C9

Data_002_786F::
    db   $FC, $FF, $FF, $FE, $FE, $FE, $FD, $FD, $FD, $FC, $FC, $FC

SwitchBlocksStateTable::
    db   $00, $02

label_002_787D:
    ; Write transient vfx position to wLinkOAMBuffer

    ldh  a, [hLinkPositionY]                      ;; 02:787D $F0 $99
    add  $08                                      ;; 02:787F $C6 $08
    ld   [hl+], a                                 ;; 02:7881 $22

    ldh  a, [hLinkPositionX]                      ;; 02:7882 $F0 $98
    add  -1                                       ;; 02:7884 $C6 $FF
    ld   [hl+], a                                 ;; 02:7886 $22

    ld   a, $1A                                   ;; 02:7887 $3E $1A
    ld   [hl+], a                                 ;; 02:7889 $22

    ld   a, [wConsecutiveStepsCount]              ;; 02:788A $FA $20 $C1
    rla                                           ;; 02:788D $17
    rla                                           ;; 02:788E $17
    and  OAMF_XFLIP                               ;; 02:788F $E6 $20
    push af                                       ;; 02:7891 $F5
    push af                                       ;; 02:7892 $F5
    ldh  a, [hIsGBC]                              ;; 02:7893 $F0 $FE
    and  a                                        ;; 02:7895 $A7
    jr   z, .jr_78A9                              ;; 02:7896 $28 $11

    ld   a, [wIsIndoor]                           ;; 02:7898 $FA $A5 $DB
    and  a                                        ;; 02:789B $A7
    jr   nz, .jr_78A9                             ;; 02:789C $20 $0B

    ldh  a, [hMapRoom]                            ;; 02:789E $F0 $F6
    cp   UNKNOWN_ROOM_32                          ;; 02:78A0 $FE $32
    jr   nz, .jr_78A9                             ;; 02:78A2 $20 $05

    pop  af                                       ;; 02:78A4 $F1
    or   OAMF_PAL0 | OAM_GBC_PAL_6                ;; 02:78A5 $F6 $06
    jr   jr_002_78AA                              ;; 02:78A7 $18 $01

.jr_78A9
    pop  af                                       ;; 02:78A9 $F1

jr_002_78AA:
    ld   [hl+], a                                 ;; 02:78AA $22
    ldh  a, [hLinkPositionY]                      ;; 02:78AB $F0 $99
    add  $08                                      ;; 02:78AD $C6 $08
    ld   [hl+], a                                 ;; 02:78AF $22
    ldh  a, [hLinkPositionX]                      ;; 02:78B0 $F0 $98
    add  $07                                      ;; 02:78B2 $C6 $07
    ld   [hl+], a                                 ;; 02:78B4 $22
    ld   a, $1A                                   ;; 02:78B5 $3E $1A
    ld   [hl+], a                                 ;; 02:78B7 $22
    ldh  a, [hIsGBC]                              ;; 02:78B8 $F0 $FE
    and  a                                        ;; 02:78BA $A7
    jr   z, .jr_78CE                              ;; 02:78BB $28 $11

    ld   a, [wIsIndoor]                           ;; 02:78BD $FA $A5 $DB
    and  a                                        ;; 02:78C0 $A7
    jr   nz, .jr_78CE                             ;; 02:78C1 $20 $0B

    ldh  a, [hMapRoom]                            ;; 02:78C3 $F0 $F6
    cp   UNKNOWN_ROOM_32                          ;; 02:78C5 $FE $32
    jr   nz, .jr_78CE                             ;; 02:78C7 $20 $05

    pop  af                                       ;; 02:78C9 $F1
    or   OAMF_PAL0 | OAM_GBC_PAL_6                ;; 02:78CA $F6 $06
    jr   jr_002_78CF                              ;; 02:78CC $18 $01

.jr_78CE
    pop  af                                       ;; 02:78CE $F1

jr_002_78CF:
    xor  $20                                      ;; 02:78CF $EE $20
    ld   [hl], a                                  ;; 02:78D1 $77
    ld   a, GROUND_STATUS_SLOW                    ;; 02:78D2 $3E $03
    ld   [wLinkGroundStatus], a                   ;; 02:78D4 $EA $1F $C1
    ret                                           ;; 02:78D7 $C9

include "code/room_transition.asm"
