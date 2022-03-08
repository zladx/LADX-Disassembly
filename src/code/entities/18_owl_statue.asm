Data_018_5DF7::
    db   $5E, $01, $5E, $21

Data_018_5DFB::
    db   $00, $F8, $50, $06, $00, $00, $52, $06, $00, $08, $54, $06, $00, $10, $56, $06

Data_018_5E0B::
    db   $00, $F8, $50, $03, $00, $00, $52, $03, $00, $08, $54, $03, $00, $10, $56, $03

OwlStatueSouthFaceShrine:
    ld   hl, Data_018_5DFB                        ; $5E1B: $21 $FB $5D
    ld   a, [wBGPaletteEffectAddress]             ; $5E1E: $FA $CC $C3
    and  a                                        ; $5E21: $A7
    jr   nz, jr_018_5E27                          ; $5E22: $20 $03

    ld   hl, Data_018_5E0B                        ; $5E24: $21 $0B $5E

jr_018_5E27:
    ld   c, $04                                   ; $5E27: $0E $04
    call RenderActiveEntitySpritesRect            ; $5E29: $CD $E6 $3C
    ld   a, $02                                   ; $5E2C: $3E $02
    call func_015_7964_trampoline                 ; $5E2E: $CD $A0 $3D
    ldh  a, [hActiveEntityState]                  ; $5E31: $F0 $F0
    JP_TABLE                                      ; $5E33
._00 dw func_018_5E3A                             ; $5E34
._01 dw func_018_5E43                             ; $5E36
._02 dw func_018_5E5D                             ; $5E38

func_018_5E3A::
    ld   hl, wEntitiesPosXTable                   ; $5E3A: $21 $00 $C2
    add  hl, bc                                   ; $5E3D: $09
    ld   [hl], $50                                ; $5E3E: $36 $50
    jp   IncrementEntityState                     ; $5E40: $C3 $12 $3B

func_018_5E43::
    call ReturnIfNonInteractive_18                ; $5E43: $CD $E8 $7D
    call GetEntityTransitionCountdown             ; $5E46: $CD $05 $0C
    ret  nz                                       ; $5E49: $C0

    call func_018_7D95                            ; $5E4A: $CD $95 $7D
    ret  nc                                       ; $5E4D: $D0

    ld   a, [wBGPalette]                          ; $5E4E: $FA $97 $DB
    cp   $E4                                      ; $5E51: $FE $E4
    jr   nz, jr_018_5E58                          ; $5E53: $20 $03

    jp   IncrementEntityState                     ; $5E55: $C3 $12 $3B

jr_018_5E58:
    jp_open_dialog $0E6                           ; $5E58

func_018_5E5D::
    call ReturnIfNonInteractive_18                ; $5E5D: $CD $E8 $7D
    ld   a, [wDialogState]                        ; $5E60: $FA $9F $C1
    and  a                                        ; $5E63: $A7
    jr   nz, jr_018_5E79                          ; $5E64: $20 $13

    ld   a, GAMEPLAY_WF_MURAL                     ; $5E66: $3E $0A
    call func_018_4CB0                            ; $5E68: $CD $B0 $4C
    call GetEntityTransitionCountdown             ; $5E6B: $CD $05 $0C
    ld   [hl], $20                                ; $5E6E: $36 $20
    call IncrementEntityState                     ; $5E70: $CD $12 $3B
    ld   [hl], b                                  ; $5E73: $70
    ld   hl, wOverworldRoomStatus + $AC           ; $5E74: $21 $AC $D8
    set  4, [hl]                                  ; $5E77: $CB $E6

ret_018_5E79:
    ret                                           ; $5E79: $C9

OwlStatueEntityHandler::
    ldh  a, [hMapId]                              ; $5E7A: $F0 $F7
    cp   MAP_S_FACE_SHRINE                        ; $5E7C: $FE $16
    jp   z, OwlStatueSouthFaceShrine              ; $5E7E: $CA $1B $5E

IF __PATCH_0__
    ld   hl, hActiveEntityVisualPosY
    inc  [hl]
ELSE
    ldh  a, [hActiveEntityVisualPosY]             ; $5E81: $F0 $EC
    add  $01                                      ; $5E83: $C6 $01
    ldh  [hActiveEntityVisualPosY], a             ; $5E85: $E0 $EC
ENDC
    ld   de, Data_018_5DF7                        ; $5E87: $11 $F7 $5D
    call RenderActiveEntitySpritesPair            ; $5E8A: $CD $C0 $3B

IF __PATCH_0__
    call ReturnIfNonInteractive_18
    call func_018_7D36
ELSE
    call func_018_7D36                            ; $5E8D: $CD $36 $7D
    call ReturnIfNonInteractive_18                ; $5E90: $CD $E8 $7D
ENDC

    call func_018_7D95                            ; $5E93: $CD $95 $7D
    ret  nc                                       ; $5E96: $D0

    ld   a, [wHasDungeonStoneSlab]                ; $5E97: $FA $CE $DB
    and  a                                        ; $5E9A: $A7
    ld   a, $10                                   ; $5E9B: $3E $10
    jr   nz, jr_018_5EA2                          ; $5E9D: $20 $03

    jp   OpenDialogInTable1                       ; $5E9F: $C3 $73 $23

jr_018_5EA2:
    ldh  a, [hMapId]                              ; $5EA2: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $5EA4: $FE $FF
    jr   nz, jr_018_5EAD                          ; $5EA6: $20 $05

    jp_open_dialog $263                           ; $5EA8

jr_018_5EAD:
    ld   a, $18                                   ; $5EAD: $3E $18
    call func_036_4A4C_trampoline                 ; $5EAF: $CD $EA $0A
    ldh  a, [hMultiPurpose0]                      ; $5EB2: $F0 $D7
    jp   OpenDialogInTable2                       ; $5EB4: $C3 $7C $23
