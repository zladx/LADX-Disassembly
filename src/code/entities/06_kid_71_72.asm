; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Kid71SpriteVariants::
.variant0
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0
.variant1
    db $72, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $70, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0
.variant3
    db $76, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $74, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Kid72SpriteVariants::
.variant0
    db $70, OAM_GBC_PAL_2 | OAMF_PAL0
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $72, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $70, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0
.variant3
    db $76, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
    db $74, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown019SpriteVariants::
.variant0
    db $78, OAM_GBC_PAL_2 | OAMF_PAL0
    db $7A, OAM_GBC_PAL_2 | OAMF_PAL0
.variant1
    db $7C, OAM_GBC_PAL_2 | OAMF_PAL0
    db $7E, OAM_GBC_PAL_2 | OAMF_PAL0
.variant2
    db $7A, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $78, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $7E, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP
    db $7C, OAM_GBC_PAL_0 | OAMF_PAL0 | OAMF_XFLIP

KidBallSprite::
    db   $3E, $00

Kid71EntityHandler::
Kid72EntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ; $607F: $21 $B0 $C2
    add  hl, bc                                   ; $6082: $09
    ld   a, [hl]                                  ; $6083: $7E
    and  a                                        ; $6084: $A7
    jr   z, .notBall                              ; $6085: $28 $1B

    ld   de, KidBallSprite                        ; $6087: $11 $7D $60
    call RenderActiveEntitySprite                 ; $608A: $CD $77 $3C
    call ReturnIfNonInteractive_06                ; $608D: $CD $C6 $64
    call UpdateEntityPosWithSpeed_06              ; $6090: $CD $41 $65
    call AddEntityZSpeedToPos_06                  ; $6093: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $6096: $21 $20 $C3
    add  hl, bc                                   ; $6099: $09
    dec  [hl]                                     ; $609A: $35
    call GetEntityTransitionCountdown             ; $609B: $CD $05 $0C
    jp   z, ClearEntityStatus_06                  ; $609E: $CA $DB $65

    ret                                           ; $60A1: $C9

.notBall
    ld   a, [wIsBowWowFollowingLink]              ; $60A2: $FA $56 $DB
    cp   BOW_WOW_KIDNAPPED                        ; $60A5: $FE $80
    jp   nz, KidPlayingWithBall                   ; $60A7: $C2 $70 $61

    ld   a, [wGameplayType]                       ; $60AA: $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ; $60AD: $FE $01
    jp   z, KidPlayingWithBall                    ; $60AF: $CA $70 $61

    ; Beyond this point is the BOW WOW kidnapped event.
    ld   de, Kid71SpriteVariants                  ; $60B2: $11 $4D $60
    ld   hl, wEntitiesTypeTable                   ; $60B5: $21 $A0 $C3
    add  hl, bc                                   ; $60B8: $09
    ld   a, [hl]                                  ; $60B9: $7E
    cp   ENTITY_KID_72                            ; $60BA: $FE $72
    jr   nz, .render                              ; $60BC: $20 $03
    ld   de, Kid72SpriteVariants                  ; $60BE: $11 $5D $60
.render:
    call RenderActiveEntitySpritesPair            ; $60C1: $CD $C0 $3B

    call func_006_65A4                            ; $60C4: $CD $A4 $65
    ld   a, e                                     ; $60C7: $7B
    dec  a                                        ; $60C8: $3D
    and  $02                                      ; $60C9: $E6 $02
    xor  $02                                      ; $60CB: $EE $02
    ld   e, a                                     ; $60CD: $5F
    ldh  a, [hFrameCounter]                       ; $60CE: $F0 $E7
    rra                                           ; $60D0: $1F
    rra                                           ; $60D1: $1F
    rra                                           ; $60D2: $1F
    and  $01                                      ; $60D3: $E6 $01
    add  e                                        ; $60D5: $83
    call SetEntitySpriteVariant                   ; $60D6: $CD $0C $3B
    ld   hl, wEntitiesPrivateState3Table          ; $60D9: $21 $D0 $C2
    add  hl, bc                                   ; $60DC: $09
    ld   a, [hl]                                  ; $60DD: $7E
    JP_TABLE                                      ; $60DE
._00 dw KidBowwowKidnapState0                     ; $60DF
._01 dw KidBowwowKidnapState1                     ; $60E1
._02 dw KidBowwowKidnapState2                     ; $60E3

KidBowwowKidnapState0::
    call ReturnIfNonInteractive_06                ; $60E5: $CD $C6 $64
    ld   hl, wEntitiesPrivateState2Table          ; $60E8: $21 $C0 $C2
    add  hl, bc                                   ; $60EB: $09
    ld   [hl], $30                                ; $60EC: $36 $30
    ld   a, MUSIC_BOWWOW_KIDNAPPED                ; $60EE: $3E $0E
    ld   [wMusicTrackToPlay], a                   ; $60F0: $EA $68 $D3
    ldh  [hDefaultMusicTrack], a                  ; $60F3: $E0 $B0
    ldh  [hDefaultMusicTrackAlt], a               ; $60F5: $E0 $BD
IncreasePrivateState3:
    ld   hl, wEntitiesPrivateState3Table          ; $60F7: $21 $D0 $C2
    add  hl, bc                                   ; $60FA: $09
    inc  [hl]                                     ; $60FB: $34
    ret                                           ; $60FC: $C9

KidBowwowKidnapState1::
    call ReturnIfNonInteractive_06                ; $60FD: $CD $C6 $64
    call func_006_65A4                            ; $6100: $CD $A4 $65
    add  $20                                      ; $6103: $C6 $20
    cp   $40                                      ; $6105: $FE $40
    jr   c, .jr_6110                              ; $6107: $38 $07

    ld   hl, wEntitiesPrivateState2Table          ; $6109: $21 $C0 $C2
    add  hl, bc                                   ; $610C: $09
    dec  [hl]                                     ; $610D: $35
    jr   nz, .moveTowardsLink                     ; $610E: $20 $14

.jr_6110
    ld   a, [wTransitionSequenceCounter]          ; $6110: $FA $6B $C1
    cp   $04                                      ; $6113: $FE $04
    ret  nz                                       ; $6115: $C0

    ldh  a, [hActiveEntityType]                   ; $6116: $F0 $EB
    cp   ENTITY_KID_71                            ; $6118: $FE $71
    jr   nz, .kid71End                            ; $611A: $20 $05
    call_open_dialog Dialog220                    ; $611C
.kid71End

    jp   IncreasePrivateState3                    ; $6121: $C3 $F7 $60

.moveTowardsLink:
    ld   a, $08                                   ; $6124: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $6126: $CD $AA $3B
    call UpdateEntityPosWithSpeed_06              ; $6129: $CD $41 $65
    ld   a, $02                                   ; $612C: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $612E: $E0 $A1
    ld   [wC167], a                               ; $6130: $EA $67 $C1
    ret                                           ; $6133: $C9

KidBowwowKidnapState2::
    xor  a                                        ; $6134: $AF
    ld   [wC167], a                               ; $6135: $EA $67 $C1
    ldh  a, [hActiveEntityPosY]                   ; $6138: $F0 $EF
    ldh  [hActiveEntityVisualPosY], a             ; $613A: $E0 $EC
    call PushLinkOutOfEntity_06                   ; $613C: $CD $1A $64
    call CopyEntityPositionToActivePosition       ; $613F: $CD $8A $3D
    call CheckLinkInteractionWithEntity_06        ; $6142: $CD $5D $64
    jr   nc, .noTalking                           ; $6145: $30 $05
    call_open_dialog Dialog220                    ; $6147
.noTalking
    call AddEntityZSpeedToPos_06                  ; $614C: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $614F: $21 $20 $C3
    add  hl, bc                                   ; $6152: $09
    dec  [hl]                                     ; $6153: $35
    dec  [hl]                                     ; $6154: $35
    ld   hl, wEntitiesPosZTable                   ; $6155: $21 $10 $C3
    add  hl, bc                                   ; $6158: $09
    ld   a, [hl]                                  ; $6159: $7E
    and  a                                        ; $615A: $A7
    jr   z, .jr_6161                              ; $615B: $28 $04

    and  $80                                      ; $615D: $E6 $80
    jr   z, .ret                                  ; $615F: $28 $0E

.jr_6161
    ld   [hl], b                                  ; $6161: $70
    ld   hl, wEntitiesSpeedZTable                 ; $6162: $21 $20 $C3
    add  hl, bc                                   ; $6165: $09
    ld   [hl], b                                  ; $6166: $70
    ldh  a, [hFrameCounter]                       ; $6167: $F0 $E7
    and  $1F                                      ; $6169: $E6 $1F
    jr   nz, .ret                                 ; $616B: $20 $02
    ; Make the kid jump.
    ld   [hl], $10                                ; $616D: $36 $10
.ret:
    ret                                           ; $616F: $C9

KidPlayingWithBall:
    ld   hl, wEntitiesDirectionTable              ; $6170: $21 $80 $C3
    add  hl, bc                                   ; $6173: $09
    ldh  a, [hActiveEntitySpriteVariant]          ; $6174: $F0 $F1
    or   [hl]                                     ; $6176: $B6
    ldh  [hActiveEntitySpriteVariant], a          ; $6177: $E0 $F1
    ld   de, Unknown019SpriteVariants             ; $6179: $11 $6D $60
    call RenderActiveEntitySpritesPair            ; $617C: $CD $C0 $3B
    call ReturnIfNonInteractive_06                ; $617F: $CD $C6 $64
    call func_006_6230                            ; $6182: $CD $30 $62
    call AddEntityZSpeedToPos_06                  ; $6185: $CD $7A $65
    ld   hl, wEntitiesSpeedZTable                 ; $6188: $21 $20 $C3
    add  hl, bc                                   ; $618B: $09
    dec  [hl]                                     ; $618C: $35
    ld   hl, wEntitiesPosZTable                   ; $618D: $21 $10 $C3
    add  hl, bc                                   ; $6190: $09
    ld   a, [hl]                                  ; $6191: $7E
    and  $80                                      ; $6192: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $6194: $E0 $E8
    jr   z, .jr_619F                              ; $6196: $28 $07

    xor  a                                        ; $6198: $AF
    ld   [hl], a                                  ; $6199: $77
    ld   hl, wEntitiesSpeedZTable                 ; $619A: $21 $20 $C3
    add  hl, bc                                   ; $619D: $09
    ld   [hl], a                                  ; $619E: $77

.jr_619F
    ldh  a, [hActiveEntityState]                  ; $619F: $F0 $F0
    JP_TABLE                                      ; $61A1
._00 dw KidWithBallState0                         ; $61A2
._01 dw KidWithBallState1                         ; $61A4

KidWithBallState0::
    call GetEntityTransitionCountdown             ; $61A6: $CD $05 $0C
    jr   nz, .ret                                 ; $61A9: $20 $40

    ld   [hl], $80                                ; $61AB: $36 $80
    call IncrementEntityState                     ; $61AD: $CD $12 $3B
    ld   a, $01                                   ; $61B0: $3E $01
    call SetEntitySpriteVariant                   ; $61B2: $CD $0C $3B
    ld   a, ENTITY_KID_71                         ; $61B5: $3E $71
    call SpawnNewEntity_trampoline                ; $61B7: $CD $86 $3B
    jr   c, .ret                                  ; $61BA: $38 $2F
    ; Created the ball entity, set the right properties
    ; to make it take the throwing arc from one kid to the other.
    ldh  a, [hMultiPurpose0]                      ; $61BC: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $61BE: $21 $00 $C2
    add  hl, de                                   ; $61C1: $19
    ld   [hl], a                                  ; $61C2: $77
    ldh  a, [hMultiPurpose1]                      ; $61C3: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $61C5: $21 $10 $C2
    add  hl, de                                   ; $61C8: $19
    ld   [hl], a                                  ; $61C9: $77
    ld   hl, wEntitiesPrivateState1Table          ; $61CA: $21 $B0 $C2
    add  hl, de                                   ; $61CD: $19
    ld   [hl], $01                                ; $61CE: $36 $01
    ld   hl, wEntitiesSpeedZTable                 ; $61D0: $21 $20 $C3
    add  hl, de                                   ; $61D3: $19
    ld   [hl], $10                                ; $61D4: $36 $10
    ldh  a, [hActiveEntityType]                   ; $61D6: $F0 $EB
    cp   ENTITY_KID_71                            ; $61D8: $FE $71
    ld   a, $14                                   ; $61DA: $3E $14
    jr   z, .throwRight                           ; $61DC: $28 $02
    ld   a, -$14                                  ; $61DE: $3E $EC
.throwRight
    ld   hl, wEntitiesSpeedXTable                 ; $61E0: $21 $40 $C2
    add  hl, de                                   ; $61E3: $19
    ld   [hl], a                                  ; $61E4: $77
    ld   hl, wEntitiesTransitionCountdownTable    ; $61E5: $21 $E0 $C2
    add  hl, de                                   ; $61E8: $19
    ld   [hl], $24                                ; $61E9: $36 $24

.ret:
    ret                                           ; $61EB: $C9

KidWithBallState1::
    call GetEntityTransitionCountdown             ; $61EC: $CD $05 $0C
    jr   nz, .jr_61F8                             ; $61EF: $20 $07

    ld   [hl], $60                                ; $61F1: $36 $60
    call IncrementEntityState                     ; $61F3: $CD $12 $3B
    ld   [hl], b                                  ; $61F6: $70
    ret                                           ; $61F7: $C9

.jr_61F8
    cp   $60                                      ; $61F8: $FE $60
    ret  nc                                       ; $61FA: $D0

    cp   $40                                      ; $61FB: $FE $40
    jr   nc, .noJump                              ; $61FD: $30 $0B

    ldh  a, [hMultiPurposeG]                      ; $61FF: $F0 $E8
    and  a                                        ; $6201: $A7
    jr   z, .noJump                               ; $6202: $28 $06

    ld   hl, wEntitiesSpeedZTable                 ; $6204: $21 $20 $C3
    add  hl, bc                                   ; $6207: $09
    ld   [hl], $08                                ; $6208: $36 $08

.noJump
    xor  a                                        ; $620A: $AF
    jp   SetEntitySpriteVariant                   ; $620B: $C3 $0C $3B
