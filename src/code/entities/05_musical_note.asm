MusicalNoteSpriteVariants::
    db   $0E, OAM_GBC_PAL_3 | OAMF_PAL0

MusicalNoteEntityHandler::
    ld   de, MusicalNoteSpriteVariants            ;; 05:7EF8 $11 $F6 $7E
    call RenderActiveEntitySprite                 ;; 05:7EFB $CD $77 $3C
    ld   hl, wEntitiesInertiaTable                ;; 05:7EFE $21 $D0 $C3
    add  hl, bc                                   ;; 05:7F01 $09
    ld   a, [hl]                                  ;; 05:7F02 $7E
    dec  a                                        ;; 05:7F03 $3D
    ld   [hl], a                                  ;; 05:7F04 $77
    jp   z, ClearEntityStatus_05                  ;; 05:7F05 $CA $4B $7B

    bit  4, a                                     ;; 05:7F08 $CB $67
    ld   e, $01                                   ;; 05:7F0A $1E $01
    jr   z, .jr_7F10                              ;; 05:7F0C $28 $02

    ld   e, $FF                                   ;; 05:7F0E $1E $FF

.jr_7F10
    bit  0, a                                     ;; 05:7F10 $CB $47
    jr   nz, .jr_7F1B                             ;; 05:7F12 $20 $07

    ld   hl, wEntitiesSpeedXTable                 ;; 05:7F14 $21 $40 $C2
    add  hl, bc                                   ;; 05:7F17 $09
    ld   a, [hl]                                  ;; 05:7F18 $7E
    add  e                                        ;; 05:7F19 $83
    ld   [hl], a                                  ;; 05:7F1A $77

.jr_7F1B
    jp   UpdateEntityPosWithSpeed_05              ;; 05:7F1B $C3 $B1 $7A
