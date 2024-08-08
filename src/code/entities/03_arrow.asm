ArrowEntityHandler::
    ; Increment the active projectiles count
    ld   hl, wActiveProjectileCount               ;; 03:6A34 $21 $4D $C1
    inc  [hl]                                     ;; 03:6A37 $34

    ; If hActiveEntityState == 1…
    ldh  a, [hActiveEntityState]                  ;; 03:6A38 $F0 $F0
    and  a                                        ;; 03:6A3A $A7
    ; call func_003_6A70 and return
    jr   nz, func_003_6A70                        ;; 03:6A3B $20 $33

    ; If GetEntityTransitionCountdown != 0…
    call GetEntityTransitionCountdown             ;; 03:6A3D $CD $05 $0C
    ; call LoadMobilArrowSpriteVariants and return
    jp   nz, LoadMobilArrowSpriteVariants         ;; 03:6A40 $C2 $D4 $6A

    ;
    ; hActiveEntityState == 0 and GetEntityTransitionCountdown == 0
    ;

    ld   a, $05                                   ;; 03:6A43 $3E $05
    ld   [wC19E], a                               ;; 03:6A45 $EA $9E $C1
    call func_003_75A2                            ;; 03:6A48 $CD $A2 $75
    call LoadMobilArrowSpriteVariants             ;; 03:6A4B $CD $D4 $6A

    ;
    ; Allow shooting the Dungeon 8 statue in the eye
    ;

    ; If hActiveEntitySpriteVariant == 2…
    ldh  a, [hActiveEntitySpriteVariant]          ;; 03:6A4E $F0 $F1
    cp   $02                                      ;; 03:6A50 $FE $02
    ret  nz                                       ;; 03:6A52 $C0
    ; and the event trigger is TRIGGER_SHOOT_STATUE_EYE…
    ld   a, [wRoomEvent]                          ;; 03:6A53 $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ;; 03:6A56 $E6 $1F
    cp   TRIGGER_SHOOT_STATUE_EYE                 ;; 03:6A58 $FE $0F
    ret  nz                                       ;; 03:6A5A $C0
    ; and hObjectUnderEntity == OBJECT_ONE_EYED_STATUE…
    ldh  a, [hObjectUnderEntity]                  ;; 03:6A5B $F0 $AF
    cp   OBJECT_ONE_EYED_STATUE                   ;; 03:6A5D $FE $C0
    ret  nz                                       ;; 03:6A5F $C0
    ; call MarkTriggerAsResolved, and clear entity
    call MarkTriggerAsResolved                    ;; 03:6A60 $CD $60 $0C
    jp   UnloadEntityAndReturn                    ;; 03:6A63 $C3 $8D $3F
