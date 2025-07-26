Data_019_4201:: ; Warp points ?
    db   UNKNOWN_ROOM_17
    db   UNKNOWN_ROOM_11
    db   UNKNOWN_ROOM_36
    db   UNKNOWN_ROOM_28
    db   UNKNOWN_ROOM_45
    db   UNKNOWN_ROOM_52
    db   MOUNTAIN_CAVE_ROOM_1
    db   UNKNOWN_ROOM_64
    db   UNKNOWN_ROOM_93
    db   UNKNOWN_ROOM_A1
    db   UNKNOWN_ROOM_C5
    db   UNKNOWN_ROOM_D4
    db   UNKNOWN_ROOM_28
    db   ROOM_OW_EAGLE_TOWER
    db   UNKNOWN_ROOM_3F
    db   UNKNOWN_ROOM_5D

WarpEntityHandler::
    ld   a, [wIsIndoor]                           ; $4211: $FA $A5 $DB
    and  a                                        ; $4214: $A7
    jr   nz, jr_019_4279                          ; $4215: $20 $62

    ldh  a, [hMapRoom]                            ; $4217: $F0 $F6
    cp   UNKNOWN_ROOM_CF                          ; $4219: $FE $CF
    jr   z, .jr_4226                              ; $421B: $28 $09

    cp   UNKNOWN_ROOM_DE                          ; $421D: $FE $DE
    jr   z, .jr_4226                              ; $421F: $28 $05

    cp   ROOM_OW_YARNA_LANMOLA                    ; $4221: $FE $CE
    jp   nz, label_019_4406                       ; $4223: $C2 $06 $44

.jr_4226
    call ReturnIfNonInteractive_19                ; $4226: $CD $3D $7D
    ld   a, [wIsLinkInTheAir]                     ; $4229: $FA $46 $C1
    and  a                                        ; $422C: $A7
    ret  nz                                       ; $422D: $C0

    ldh  a, [hLinkPositionX]                      ; $422E: $F0 $98
    sub  $50                                      ; $4230: $D6 $50
    add  $03                                      ; $4232: $C6 $03
    cp   $06                                      ; $4234: $FE $06
    ret  nc                                       ; $4236: $D0

    ldh  a, [hLinkPositionY]                      ; $4237: $F0 $99
    sub  $46                                      ; $4239: $D6 $46
    add  $04                                      ; $423B: $C6 $04
    cp   $08                                      ; $423D: $FE $08
    ret  nc                                       ; $423F: $D0

    ld   a, $01                                   ; $4240: $3E $01
    ld   [wWarpStructs], a                        ; $4242: $EA $01 $D4
    ld   a, $1F                                   ; $4245: $3E $1F
    ld   [wWarp0Map], a                           ; $4247: $EA $02 $D4
    ld   a, $F8                                   ; $424A: $3E $F8
    ld   [wWarp0Room], a                          ; $424C: $EA $03 $D4
    ld   a, $50                                   ; $424F: $3E $50
    ld   [wWarp0DestinationX], a                  ; $4251: $EA $04 $D4
    ldh  [hLinkPositionX], a                      ; $4254: $E0 $98
    ld   a, $48                                   ; $4256: $3E $48
    ld   [wWarp0DestinationY], a                  ; $4258: $EA $05 $D4
    ldh  [hLinkPositionY], a                      ; $425B: $E0 $99
    ld   a, $45                                   ; $425D: $3E $45
    ld   [wWarp0PositionTileIndex], a             ; $425F: $EA $16 $D4
    ld   a, LINK_MOTION_FALLING_DOWN              ; $4262: $3E $06
    ld   [wLinkMotionState], a                    ; $4264: $EA $1C $C1
    call ResetSpinAttack                          ; $4267: $CD $AF $0C
    ld   [wC198], a                               ; $426A: $EA $98 $C1
    ld   a, $51                                   ; $426D: $3E $51
    ld   [wDBCB], a                               ; $426F: $EA $CB $DB
    ld   a, WAVE_SFX_LINK_FALL                    ; $4272: $3E $0C
    ldh  [hWaveSfx], a                            ; $4274: $E0 $F3
    jp   ClearEntityStatus_19                     ; $4276: $C3 $61 $7E

jr_019_4279:
    ld   a, $01                                   ; $4279: $3E $01
    ld   [wC19D], a                               ; $427B: $EA $9D $C1
    ldh  a, [hMapId]                              ; $427E: $F0 $F7
    ld   e, a                                     ; $4280: $5F
    ld   d, b                                     ; $4281: $50
    ld   hl, wHasInstrument1                      ; $4282: $21 $65 $DB
    add  hl, de                                   ; $4285: $19
    ld   a, [hl]                                  ; $4286: $7E
    and  $01                                      ; $4287: $E6 $01
    jp   z, label_019_42E0                        ; $4289: $CA $E0 $42

    call func_019_43A9                            ; $428C: $CD $A9 $43
    ldh  a, [hActiveEntityState]                  ; $428F: $F0 $F0
    JP_TABLE
._00 dw WarpState0Handler
._01 dw WarpState1Handler
._02 dw WarpState2Handler
._03 dw WarpState3Handler

WarpState0Handler::
    call IncrementEntityState                     ; $429A: $CD $12 $3B
    ld   a, MUSIC_OBTAIN_INSTRUMENT               ; $429D: $3E $1B
    ld   [wMusicTrackToPlay], a                   ; $429F: $EA $68 $D3
    ret                                           ; $42A2: $C9

WarpState1Handler::
    call EntityLinkPositionXDifference_19         ; $42A3: $CD $0B $7E
    add  $04                                      ; $42A6: $C6 $04
    cp   $08                                      ; $42A8: $FE $08
    jp   nc, IncrementEntityState                 ; $42AA: $D2 $12 $3B

    call EntityLinkPositionYDifference_19         ; $42AD: $CD $1B $7E
    add  $04                                      ; $42B0: $C6 $04
    cp   $08                                      ; $42B2: $FE $08
    ret  c                                        ; $42B4: $D8

    jp   IncrementEntityState                     ; $42B5: $C3 $12 $3B

WarpState2Handler::
    ldh  a, [hLinkPositionZ]                      ; $42B8: $F0 $A2
    and  a                                        ; $42BA: $A7
    jr   nz, label_019_42E0                       ; $42BB: $20 $23

    call EntityLinkPositionXDifference_19         ; $42BD: $CD $0B $7E
    add  $03                                      ; $42C0: $C6 $03
    cp   $06                                      ; $42C2: $FE $06
    jr   nc, label_019_42E0                       ; $42C4: $30 $1A

    call EntityLinkPositionYDifference_19         ; $42C6: $CD $1B $7E
    add  $03                                      ; $42C9: $C6 $03
    cp   $06                                      ; $42CB: $FE $06
    jr   nc, label_019_42E0                       ; $42CD: $30 $11

    call IncrementEntityState                     ; $42CF: $CD $12 $3B
    ld   a, $20                                   ; $42D2: $3E $20
    ld   [wC1C6], a                               ; $42D4: $EA $C6 $C1
    call GetEntityTransitionCountdown             ; $42D7: $CD $05 $0C
    ld   [hl], $50                                ; $42DA: $36 $50
    ld   a, JINGLE_DUNGEON_WARP                   ; $42DC: $3E $1C
    ldh  [hJingle], a                             ; $42DE: $E0 $F2

label_019_42E0:
    ret                                           ; $42E0: $C9

Data_019_42E1::
    db   $E4, $E4, $E4, $E4, $94, $94, $94, $94, $54, $54, $54, $54, $00, $00, $00, $00

Data_019_42F1::
    db   $00, $03, $01, $02

WarpState3Handler::
    call ResetSpinAttack                          ; $42F5: $CD $AF $0C
    ; a = 0
    ; reset parameter to 0
    ld   [wSubtractHealthBuffer], a               ; $42F8: $EA $94 $DB
    ld   [wInvincibilityCounter], a               ; $42FB: $EA $C7 $DB
    ld   [wIgnoreLinkCollisionsCountdown], a      ; $42FE: $EA $3E $C1
    ld   [wSwordAnimationState], a                ; $4301: $EA $37 $C1
    ld   [wC16A], a                               ; $4304: $EA $6A $C1
    ld   [wLinkPlayingOcarinaCountdown], a        ; $4307: $EA $66 $C1
    ld   [wDialogGotItem], a                      ; $430A: $EA $A9 $C1
    inc  a                                        ; $430D: $3C
    ld   [wC167], a                               ; $430E: $EA $67 $C1
    ldh  a, [hActiveEntityPosX]                   ; $4311: $F0 $EE
    ldh  [hLinkPositionX], a                      ; $4313: $E0 $98
    ldh  a, [hActiveEntityVisualPosY]             ; $4315: $F0 $EC
    ldh  [hLinkPositionY], a                      ; $4317: $E0 $99
    call GetEntityTransitionCountdown             ; $4319: $CD $05 $0C
    jr   nz, jr_019_4355                          ; $431C: $20 $37

    ld   hl, wWarpStructs                         ; $431E: $21 $01 $D4
    ld   a, $01                                   ; $4321: $3E $01
    ld   [hl+], a                                 ; $4323: $22
    ldh  a, [hMapId]                              ; $4324: $F0 $F7
    ld   [hl+], a                                 ; $4326: $22
    inc  hl                                       ; $4327: $23
    ld   a, $50                                   ; $4328: $3E $50
    ld   [hl+], a                                 ; $432A: $22
    push hl                                       ; $432B: $E5
    ldh  a, [hMapId]                              ; $432C: $F0 $F7
    ld   e, a                                     ; $432E: $5F
    sla  e                                        ; $432F: $CB $23
    ld   d, $00                                   ; $4331: $16 $00
    ld   hl, Data_019_4201                        ; $4333: $21 $01 $42
    add  hl, de                                   ; $4336: $19
    ldh  a, [hMapRoom]                            ; $4337: $F0 $F6
    cp   [hl]                                     ; $4339: $BE
    jr   nz, .jr_433D                             ; $433A: $20 $01

    inc  hl                                       ; $433C: $23

.jr_433D
    ld   a, [hl]                                  ; $433D: $7E
    ld   [wWarp0Room], a                          ; $433E: $EA $03 $D4
    pop  hl                                       ; $4341: $E1
    cp   $64                                      ; $4342: $FE $64
    ld   a, $48                                   ; $4344: $3E $48
    jr   nz, .jr_434A                             ; $4346: $20 $02

    ld   a, $28                                   ; $4348: $3E $28

.jr_434A
    ld   [hl], a                                  ; $434A: $77
    xor  a                                        ; $434B: $AF
    ld   [wC167], a                               ; $434C: $EA $67 $C1
    call ClearEntityStatus_19                     ; $434F: $CD $61 $7E
    jp   disableMovementInTransition              ; $4352: $C3 $9E $0C

jr_019_4355:
    ld   hl, hLinkInteractiveMotionBlocked        ; $4355: $21 $A1 $FF
    ld   [hl], $01                                ; $4358: $36 $01
    push af                                       ; $435A: $F5
    ldh  a, [hFrameCounter]                       ; $435B: $F0 $E7
    rra                                           ; $435D: $1F
    rra                                           ; $435E: $1F
    rra                                           ; $435F: $1F
    and  $03                                      ; $4360: $E6 $03
    ld   e, a                                     ; $4362: $5F
    ld   d, b                                     ; $4363: $50
    ld   hl, Data_019_42F1                        ; $4364: $21 $F1 $42
    add  hl, de                                   ; $4367: $19
    ld   a, [hl]                                  ; $4368: $7E
    ldh  [hLinkDirection], a                      ; $4369: $E0 $9E
    push bc                                       ; $436B: $C5
    call UpdateLinkWalkingAnimation_trampoline    ; $436C: $CD $F0 $0B
    pop  bc                                       ; $436F: $C1
    ld   hl, wEntitiesPrivateState4Table          ; $4370: $21 $40 $C4
    add  hl, bc                                   ; $4373: $09
    pop  af                                       ; $4374: $F1
    cp   $40                                      ; $4375: $FE $40
    jr   nc, .jr_4383                             ; $4377: $30 $0A

    and  $03                                      ; $4379: $E6 $03
    jr   nz, .jr_4383                             ; $437B: $20 $06

    ld   a, [hl]                                  ; $437D: $7E
    cp   $0C                                      ; $437E: $FE $0C
    jr   z, .jr_4383                              ; $4380: $28 $01

    inc  [hl]                                     ; $4382: $34

.jr_4383
    ldh  a, [hFrameCounter]                       ; $4383: $F0 $E7
    and  $03                                      ; $4385: $E6 $03
    add  [hl]                                     ; $4387: $86
    ld   e, a                                     ; $4388: $5F
    ld   d, b                                     ; $4389: $50
    ld   hl, Data_019_42E1                        ; $438A: $21 $E1 $42
    add  hl, de                                   ; $438D: $19
    ld   a, [hl]                                  ; $438E: $7E
    ld   [wBGPalette], a                          ; $438F: $EA $97 $DB
    ret                                           ; $4392: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown062SpriteVariants::
.variant0
    db $1E, $02
    db $1E, $62
.variant1
    db $1E, $42
    db $1E, $22

Data_019_439B::
    db   $F8, $FA

Data_019_439D::
    db   $00, $06, $08, $06, $00, $FA, $F8, $FA

Data_019_43A5::
    db   $24, $01, $24, $01

func_019_43A9::
    ld   hl, wEntitiesPhysicsFlagsTable           ; $43A9: $21 $40 $C3
    add  hl, bc                                   ; $43AC: $09
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $43AD: $36 $C2
    ldh  a, [hFrameCounter]                       ; $43AF: $F0 $E7
    rra                                           ; $43B1: $1F
    rra                                           ; $43B2: $1F
    rra                                           ; $43B3: $1F
    and  $01                                      ; $43B4: $E6 $01
    ldh  [hActiveEntitySpriteVariant], a          ; $43B6: $E0 $F1
    ld   de, Unknown062SpriteVariants             ; $43B8: $11 $93 $43
    call RenderActiveEntitySpritesPair            ; $43BB: $CD $C0 $3B
    ld   hl, wEntitiesPhysicsFlagsTable           ; $43BE: $21 $40 $C3
    add  hl, bc                                   ; $43C1: $09
    ld   [hl], 1 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $43C2: $36 $C1
    xor  a                                        ; $43C4: $AF

.loop_43C5
    ldh  [hMultiPurposeG], a                      ; $43C5: $E0 $E8
    ld   e, a                                     ; $43C7: $5F
    call func_019_43D4                            ; $43C8: $CD $D4 $43
    ldh  a, [hMultiPurposeG]                      ; $43CB: $F0 $E8
    add  $02                                      ; $43CD: $C6 $02
    and  $07                                      ; $43CF: $E6 $07
    jr   nz, .loop_43C5                           ; $43D1: $20 $F2

    ret                                           ; $43D3: $C9

func_019_43D4::
    ldh  a, [hFrameCounter]                       ; $43D4: $F0 $E7
    rra                                           ; $43D6: $1F
    rra                                           ; $43D7: $1F
    rra                                           ; $43D8: $1F
    nop                                           ; $43D9: $00
    add  e                                        ; $43DA: $83
    and  $07                                      ; $43DB: $E6 $07
    ld   e, a                                     ; $43DD: $5F
    ld   d, b                                     ; $43DE: $50
    ld   hl, Data_019_439D                        ; $43DF: $21 $9D $43
    add  hl, de                                   ; $43E2: $19
    ldh  a, [hActiveEntityPosX]                   ; $43E3: $F0 $EE
    add  [hl]                                     ; $43E5: $86
    ldh  [hActiveEntityPosX], a                   ; $43E6: $E0 $EE
    ld   hl, Data_019_439B                        ; $43E8: $21 $9B $43
    add  hl, de                                   ; $43EB: $19
    ldh  a, [hActiveEntityVisualPosY]             ; $43EC: $F0 $EC
    add  [hl]                                     ; $43EE: $86
    ldh  [hActiveEntityVisualPosY], a             ; $43EF: $E0 $EC
    ld   de, Data_019_43A5                        ; $43F1: $11 $A5 $43
    call RenderActiveEntitySprite                 ; $43F4: $CD $77 $3C
    jp   CopyEntityPositionToActivePosition       ; $43F7: $C3 $8A $3D

Data_019_43FA::
    db   $FA, $FC

Data_019_43FC::
    db   $00, $04, $06, $04, $00, $FC, $FA, $FC

Data_019_4404::
    db   $3E, $00

label_019_4406:
    ld   hl, wEntitiesPhysicsFlagsTable           ; $4406: $21 $40 $C3
    add  hl, bc                                   ; $4409: $09
    ld   [hl], 1 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ; $440A: $36 $C1
    ldh  a, [hFrameCounter]                       ; $440C: $F0 $E7
    rla                                           ; $440E: $17
    rla                                           ; $440F: $17
    and  OAMF_PAL1                                ; $4410: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $4412: $E0 $ED
    ldh  a, [hActiveEntityPosX]                   ; $4414: $F0 $EE
    ldh  [hMultiPurposeE], a                      ; $4416: $E0 $E5
    ldh  a, [hActiveEntityVisualPosY]             ; $4418: $F0 $EC
    ldh  [hFreeWarpDataAddress], a                ; $441A: $E0 $E6
    xor  a                                        ; $441C: $AF

.loop_441D
    ldh  [hMultiPurposeG], a                      ; $441D: $E0 $E8
    ld   e, a                                     ; $441F: $5F
    call func_019_442C                            ; $4420: $CD $2C $44
    ldh  a, [hMultiPurposeG]                      ; $4423: $F0 $E8
    add  $02                                      ; $4425: $C6 $02
    and  $07                                      ; $4427: $E6 $07
    jr   nz, .loop_441D                           ; $4429: $20 $F2

    ret                                           ; $442B: $C9

func_019_442C::
    ldh  a, [hFrameCounter]                       ; $442C: $F0 $E7
    rra                                           ; $442E: $1F
    rra                                           ; $442F: $1F
    rra                                           ; $4430: $1F
    nop                                           ; $4431: $00
    add  e                                        ; $4432: $83
    and  $07                                      ; $4433: $E6 $07
    ld   e, a                                     ; $4435: $5F
    ld   d, b                                     ; $4436: $50
    ld   hl, Data_019_43FC                        ; $4437: $21 $FC $43
    add  hl, de                                   ; $443A: $19
    ldh  a, [hMultiPurposeE]                      ; $443B: $F0 $E5
    add  [hl]                                     ; $443D: $86
    ldh  [hActiveEntityPosX], a                   ; $443E: $E0 $EE
    ld   hl, Data_019_43FA                        ; $4440: $21 $FA $43
    add  hl, de                                   ; $4443: $19
    ldh  a, [hFreeWarpDataAddress]                ; $4444: $F0 $E6
    add  [hl]                                     ; $4446: $86
    add  $04                                      ; $4447: $C6 $04
    ldh  [hActiveEntityVisualPosY], a             ; $4449: $E0 $EC
    ld   de, Data_019_4404                        ; $444B: $11 $04 $44
    jp   RenderActiveEntitySprite                 ; $444E: $C3 $77 $3C
