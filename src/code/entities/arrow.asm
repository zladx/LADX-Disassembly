ArrowEntityHandler::
    ; Increment the active projectiles count
    ld   hl, wActiveProjectileCount                     ; $6A34: $21 $4D $C1
    inc  [hl]                                     ; $6A37: $34

    ; If the entity is not "walking"…
    ldh  a, [hActiveEntityState]                  ; $6A38: $F0 $F0
    and  a                                        ; $6A3A: $A7
    jr   nz, Func_003_6A70                        ; $6A3B: $20 $33

    ; …
    call GetEntityTransitionCountdown                 ; $6A3D: $CD $05 $0C
    jp   nz, label_003_6AD4                       ; $6A40: $C2 $D4 $6A

    ld   a, $05                                   ; $6A43: $3E $05
    ld   [$C19E], a                               ; $6A45: $EA $9E $C1
    call func_003_75A2                            ; $6A48: $CD $A2 $75
    call func_003_6AD4                            ; $6A4B: $CD $D4 $6A
    ldh  a, [hActiveEntitySpriteVariant]               ; $6A4E: $F0 $F1
    cp   $02                                      ; $6A50: $FE $02
    ret  nz                                       ; $6A52: $C0

    ld   a, [$C18E]                               ; $6A53: $FA $8E $C1
    and  $1F                                      ; $6A56: $E6 $1F
    cp   $0F                                      ; $6A58: $FE $0F
    ret  nz                                       ; $6A5A: $C0

    ldh  a, [hFFAF]                               ; $6A5B: $F0 $AF
    cp   $C0                                      ; $6A5D: $FE $C0
    ret  nz                                       ; $6A5F: $C0

    call label_C60                                ; $6A60: $CD $60 $0C
    jp   ClearEntityType                               ; $6A63: $C3 $8D $3F
