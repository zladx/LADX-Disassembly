; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

; Load the template for an indoor room
; Inputs:
;   a: the template to use (see ROOM_TEMPLATE_* constants)
LoadRoomTemplate::
    JP_TABLE                                      ; $4880: $C7
._00 dw RoomTemplateTopRightBottomLeftHandler
._01 dw RoomTemplateRightBottomLeftHandler
._02 dw RoomTemplateTopLeftBottomHandler
._03 dw RoomTemplateLeftTopRightHandler
._04 dw RoomTemplateTopRightBottomHandler
._05 dw RoomTemplateBottomLeftHandler
._06 dw RoomTemplateBottomRightHandler
._07 dw RoomTemplateTopRightHandler
._08 dw RoomTemplateTopLeftHandler
._09 dw RoomTemplatNotImplementedHandler
._0A dw RoomTemplatNotImplementedHandler
._0B dw RoomTemplatNotImplementedHandler
._0C dw RoomTemplatNotImplementedHandler
._0D dw RoomTemplatNotImplementedHandler
._0E dw RoomTemplatNotImplementedHandler
._0F dw RoomTemplatNotImplementedHandler

RoomTemplateTopRightBottomLeftHandler::
    push bc                                       ; $48A1: $C5
    ld   hl, wRoomObjects                         ; $48A2: $21 $11 $D7
    ld   bc, Data_014_4917                        ; $48A5: $01 $17 $49
    ld   de, Data_014_4938                        ; $48A8: $11 $38 $49
    jp   Func_354B                                ; $48AB: $C3 $4B $35

RoomTemplateRightBottomLeftHandler::
    push bc                                       ; $48AE: $C5
    ld   hl, wRoomObjects                         ; $48AF: $21 $11 $D7
    ld   bc, Data_014_4958                        ; $48B2: $01 $58 $49
    ld   de, Data_014_4971                        ; $48B5: $11 $71 $49
    jp   Func_354B                                ; $48B8: $C3 $4B $35

RoomTemplateTopLeftBottomHandler::
    push bc                                       ; $48BB: $C5
    ld   hl, wRoomObjects                         ; $48BC: $21 $11 $D7
    ld   bc, Data_014_4989                        ; $48BF: $01 $89 $49
    ld   de, Data_014_49A4                        ; $48C2: $11 $A4 $49
    jp   Func_354B                                ; $48C5: $C3 $4B $35

RoomTemplateLeftTopRightHandler::
    push bc                                       ; $48C8: $C5
    ld   hl, wRoomObjects                         ; $48C9: $21 $11 $D7
    ld   bc, Data_014_49BE                        ; $48CC: $01 $BE $49
    ld   de, Data_014_49D7                        ; $48CF: $11 $D7 $49
    jp   Func_354B                                ; $48D2: $C3 $4B $35

RoomTemplateTopRightBottomHandler::
    push bc                                       ; $48D5: $C5
    ld   hl, wRoomObjects                         ; $48D6: $21 $11 $D7
    ld   bc, Data_014_49EF                        ; $48D9: $01 $EF $49
    ld   de, Data_014_4A0A                        ; $48DC: $11 $0A $4A
    jp   Func_354B                                ; $48DF: $C3 $4B $35

RoomTemplateBottomLeftHandler::
    push bc                                       ; $48E2: $C5
    ld   hl, wRoomObjects                         ; $48E3: $21 $11 $D7
    ld   bc, Data_014_4A24                        ; $48E6: $01 $24 $4A
    ld   de, Data_014_4A36                        ; $48E9: $11 $36 $4A
    jp   Func_354B                                ; $48EC: $C3 $4B $35

RoomTemplateBottomRightHandler::
    push bc                                       ; $48EF: $C5
    ld   hl, wRoomObjects                         ; $48F0: $21 $11 $D7
    ld   bc, Data_014_4A47                        ; $48F3: $01 $47 $4A
    ld   de, Data_014_4A59                        ; $48F6: $11 $59 $4A
    jp   Func_354B                                ; $48F9: $C3 $4B $35

RoomTemplateTopRightHandler::
    push bc                                       ; $48FC: $C5
    ld   hl, wRoomObjects                         ; $48FD: $21 $11 $D7
    ld   bc, Data_014_4A6A                        ; $4900: $01 $6A $4A
    ld   de, Data_014_4A7C                        ; $4903: $11 $7C $4A
    jp   Func_354B                                ; $4906: $C3 $4B $35

RoomTemplateTopLeftHandler::
    push bc                                       ; $4909: $C5
    ld   hl, wRoomObjects                         ; $490A: $21 $11 $D7
    ld   bc, Data_014_4A8D                        ; $490D: $01 $8D $4A
    ld   de, Data_014_4A9F                        ; $4910: $11 $9F $4A
    jp   Func_354B                                ; $4913: $C3 $4B $35

RoomTemplatNotImplementedHandler::
    ret                                           ; $4916: $C9

Data_014_4917::
    db   $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $10, $19, $20, $29, $30, $39
    db   $40, $49, $50, $59, $60, $69, $70, $71, $72, $73, $74, $75, $76, $77, $78, $79
    db   $FF

Data_014_4938::
    db   $25, $21, $21, $21, $21, $21, $21, $21, $21, $26, $23, $24, $23, $24, $23, $24
    db   $23, $24, $23, $24, $23, $24, $27, $22, $22, $22, $22, $22, $22, $22, $22, $28

Data_014_4958::
    db   $00, $09, $10, $19, $20, $29, $30, $39, $40, $49, $50, $59, $60, $69, $70, $71
    db   $72, $73, $74, $75, $76, $77, $78, $79, $FF

Data_014_4971::
    db   $23, $24, $23, $24, $23, $24, $23, $24, $23, $24, $23, $24, $23, $24, $27, $22
    db   $22, $22, $22, $22, $22, $22, $22, $28

Data_014_4989::
    db   $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $10, $20, $30, $40, $50, $60
    db   $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $FF

Data_014_49A4::
    db   $25, $21, $21, $21, $21, $21, $21, $21, $21, $21, $23, $23, $23, $23, $23, $23
    db   $27, $22, $22, $22, $22, $22, $22, $22, $22, $22

Data_014_49BE::
    db   $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $10, $19, $20, $29, $30, $39
    db   $40, $49, $50, $59, $60, $69, $70, $79, $FF

Data_014_49D7::
    db   $25, $21, $21, $21, $21, $21, $21, $21, $21, $26, $23, $24, $23, $24, $23, $24
    db   $23, $24, $23, $24, $23, $24, $23, $24

Data_014_49EF::
    db   $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $19, $29, $39, $49, $59, $69
    db   $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $FF

Data_014_4A0A::
    db   $21, $21, $21, $21, $21, $21, $21, $21, $21, $26, $24, $24, $24, $24, $24, $24
    db   $22, $22, $22, $22, $22, $22, $22, $22, $22, $28

Data_014_4A24::
    db   $00, $10, $20, $30, $40, $50, $60, $70, $71, $72, $73, $74, $75, $76, $77, $78
    db   $79, $FF

Data_014_4A36::
    db   $23, $23, $23, $23, $23, $23, $23, $27, $22, $22, $22, $22, $22, $22, $22, $22
    db   $22

Data_014_4A47::
    db   $09, $19, $29, $39, $49, $59, $69, $70, $71, $72, $73, $74, $75, $76, $77, $78
    db   $79, $FF

Data_014_4A59::
    db   $24, $24, $24, $24, $24, $24, $24, $22, $22, $22, $22, $22, $22, $22, $22, $22
    db   $28

Data_014_4A6A::
    db   $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $19, $29, $39, $49, $59, $69
    db   $79, $FF

Data_014_4A7C::
    db   $21, $21, $21, $21, $21, $21, $21, $21, $21, $26, $24, $24, $24, $24, $24, $24
    db   $24

Data_014_4A8D::
    db   $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $10, $20, $30, $40, $50, $60
    db   $70, $FF

Data_014_4A9F::
    db   $25, $21, $21, $21, $21, $21, $21, $21, $21, $21, $23, $23, $23, $23

Data_014_4AAD::
    db   $23, $23, $23, $18, $20, $28, $30, $38, $40, $48, $50, $58, $60, $68, $70

; Execute recurrent audio tasks on each frame of the overworld
PerformOverworldAudioTasks::
    ;
    ; Play compass SFX at countdown end
    ;

    ; If wCompassSfxCountdown > 0…
    ld   a, [wCompassSfxCountdown]                ; $4ABC: $FA $62 $D4
    and  a                                        ; $4ABF: $A7
    jr   z, .compassSfxEnd                        ; $4AC0: $28 $0A
    ; decrement the countdown
    dec  a                                        ; $4AC2: $3D
    ld   [wCompassSfxCountdown], a                ; $4AC3: $EA $62 $D4
    ; If the countdown reached 0…
    jr   nz, .compassSfxEnd                       ; $4AC6: $20 $04
    ; play the compass sfx.
    ld   a, WAVE_SFX_COMPASS                      ; $4AC8: $3E $1B
    ldh  [hWaveSfx], a                            ; $4ACA: $E0 $F3
.compassSfxEnd

    ;
    ; Decrement wC502 counter
    ;

    ld   a, [wC502]                               ; $4ACC: $FA $02 $C5
    and  a                                        ; $4ACF: $A7
    jr   z, .C502End                              ; $4AD0: $28 $04
    dec  a                                        ; $4AD2: $3D
    ld   [wC502], a                               ; $4AD3: $EA $02 $C5
.C502End

    ld   a, [wNextWorldMusicTrackCountdown]       ; $4AD6: $FA $AF $C5
    and  a                                        ; $4AD9: $A7
    jr   z, jr_014_4AE7                           ; $4ADA: $28 $0B

    dec  a                                        ; $4ADC: $3D
    ld   [wNextWorldMusicTrackCountdown], a       ; $4ADD: $EA $AF $C5
    jr   nz, jr_014_4AE7                          ; $4AE0: $20 $05

    ldh  a, [hNextDefaultMusicTrack]              ; $4AE2: $F0 $BF

.jr_4AE4
    ld   [wMusicTrackToPlay], a                   ; $4AE4: $EA $68 $D3

jr_014_4AE7:

    ;
    ; Play waves SFX on beaches overworld rooms
    ;

    ; If is on overworld…
    ld   a, [wIsIndoor]                           ; $4AE7: $FA $A5 $DB
    and  a                                        ; $4AEA: $A7
    jr   nz, .wavesSfxEnd                         ; $4AEB: $20 $1F

    ; …and $F0 <= map room < $F6…
    ldh  a, [hMapRoom]                            ; $4AED: $F0 $F6
    ld   [wDB54], a                               ; $4AEF: $EA $54 $DB
    ldh  a, [hMapRoom]                            ; $4AF2: $F0 $F6
    cp   UNKNOWN_ROOM_F0                          ; $4AF4: $FE $F0
    jr   c, .wavesSfxEnd                          ; $4AF6: $38 $14
    cp   UNKNOWN_ROOM_F6                          ; $4AF8: $FE $F6
    jr   nc, .wavesSfxEnd                         ; $4AFA: $30 $10

    ; increment the sea waves counter.
    ld   a, [wNoiseSfxSeaWavesCounter]            ; $4AFC: $FA $14 $C1
    inc  a                                        ; $4AFF: $3C

    ; When the counter reaches $A0…
    cp   $A0                                      ; $4B00: $FE $A0
    jr   nz, .updateCounter                       ; $4B02: $20 $05

    ; play the sea waves sound effect once again.
    ld   a, NOISE_SFX_SEA_WAVES                   ; $4B04: $3E $0F
    ldh  [hNoiseSfx], a                           ; $4B06: $E0 $F4
    xor  a                                        ; $4B08: $AF

.updateCounter
    ld   [wNoiseSfxSeaWavesCounter], a            ; $4B09: $EA $14 $C1
.wavesSfxEnd

    ld   a, [wMaxHearts]                          ; $4B0C: $FA $5B $DB
    ld   e, a                                     ; $4B0F: $5F
    ld   d, b                                     ; $4B10: $50
    ld   hl, Data_014_4AAD                        ; $4B11: $21 $AD $4A
    add  hl, de                                   ; $4B14: $19
    ld   a, [wHealth]                             ; $4B15: $FA $5A $DB
    cp   [hl]                                     ; $4B18: $BE
    ld   a, $00                                   ; $4B19: $3E $00
    jr   nz, .jr_4B1E                             ; $4B1B: $20 $01

    inc  a                                        ; $4B1D: $3C

.jr_4B1E
    ld   [wC5A9], a                               ; $4B1E: $EA $A9 $C5
    ld   a, [wC5AC]                               ; $4B21: $FA $AC $C5
    inc  a                                        ; $4B24: $3C
    cp   $1A                                      ; $4B25: $FE $1A
    jr   nz, .jr_4B2A                             ; $4B27: $20 $01

    xor  a                                        ; $4B29: $AF

.jr_4B2A
    ld   [wC5AC], a                               ; $4B2A: $EA $AC $C5
    ldh  a, [hFrameCounter]                       ; $4B2D: $F0 $E7
    and  $3F                                      ; $4B2F: $E6 $3F
    jr   nz, .jr_4B3E                             ; $4B31: $20 $0B

    ld   a, [wDB47]                               ; $4B33: $FA $47 $DB
    cp   $FF                                      ; $4B36: $FE $FF
    jr   z, .jr_4B3E                              ; $4B38: $28 $04

    inc  a                                        ; $4B3A: $3C
    ld   [wDB47], a                               ; $4B3B: $EA $47 $DB

.jr_4B3E
    ld   a, [wD464]                               ; $4B3E: $FA $64 $D4
    and  a                                        ; $4B41: $A7
    ret  z                                        ; $4B42: $C8

    ldh  a, [hIsGBC]                              ; $4B43: $F0 $FE
    and  a                                        ; $4B45: $A7
    jr   z, .jr_4B4D                              ; $4B46: $28 $05

    call func_014_4BEF                            ; $4B48: $CD $EF $4B
    jr   jr_014_4B5A                              ; $4B4B: $18 $0D

.jr_4B4D
    ld   a, $E4                                   ; $4B4D: $3E $E4
    ld   [wBGPalette], a                          ; $4B4F: $EA $97 $DB
    ld   [wOBJ1Palette], a                        ; $4B52: $EA $99 $DB
    ld   a, $1C                                   ; $4B55: $3E $1C
    ld   [wOBJ0Palette], a                        ; $4B57: $EA $98 $DB

jr_014_4B5A:
    ld   hl, wD464                                ; $4B5A: $21 $64 $D4
    dec  [hl]                                     ; $4B5D: $35
    ret  z                                        ; $4B5E: $C8

    ld   a, [hl]                                  ; $4B5F: $7E
    ld   hl, wScreenShakeHorizontal               ; $4B60: $21 $55 $C1
    ld   [hl], b                                  ; $4B63: $70
    cp   $20                                      ; $4B64: $FE $20
    jr   c, ret_014_4B8E                          ; $4B66: $38 $26

    rla                                           ; $4B68: $17
    nop                                           ; $4B69: $00
    nop                                           ; $4B6A: $00
    nop                                           ; $4B6B: $00
    and  $04                                      ; $4B6C: $E6 $04
    sub  $02                                      ; $4B6E: $D6 $02
    ld   [wScreenShakeHorizontal], a              ; $4B70: $EA $55 $C1
    ldh  a, [hIsGBC]                              ; $4B73: $F0 $FE
    and  a                                        ; $4B75: $A7
    jr   z, .jr_4B7D                              ; $4B76: $28 $05

    call func_014_4BA7                            ; $4B78: $CD $A7 $4B
    jr   jr_014_4B8A                              ; $4B7B: $18 $0D

.jr_4B7D
    ld   a, $CC                                   ; $4B7D: $3E $CC
    ld   [wBGPalette], a                          ; $4B7F: $EA $97 $DB
    ld   [wOBJ1Palette], a                        ; $4B82: $EA $99 $DB
    ld   a, $0C                                   ; $4B85: $3E $0C
    ld   [wOBJ0Palette], a                        ; $4B87: $EA $98 $DB

jr_014_4B8A:
    ld   a, $02                                   ; $4B8A: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $4B8C: $E0 $A1

ret_014_4B8E:
    ret                                           ; $4B8E: $C9

Data_014_4B8F::
    db   $FF, $7F, $82, $18, $FF, $3F, $00, $00

Data_014_4B97::
    db   $E0, $7F, $00, $00, $FF, $3F, $FF, $7F

Data_014_4B9F::
    db   $E0, $7F, $FF, $7F, $FF, $3F, $00, $00

func_014_4BA7::
    ld   a, [wD464]                               ; $4BA7: $FA $64 $D4
    cp   $3E                                      ; $4BAA: $FE $3E
    ret  c                                        ; $4BAC: $D8

    jr   z, .jr_4BBE                              ; $4BAD: $28 $0F

    ld   de, Data_014_4B8F                        ; $4BAF: $11 $8F $4B
    ld   hl, wBGPal1                              ; $4BB2: $21 $10 $DC
    ld   b, $40                                   ; $4BB5: $06 $40
    call func_014_4BDA                            ; $4BB7: $CD $DA $4B
    ld   a, $01                                   ; $4BBA: $3E $01
    jr   jr_014_4BD6                              ; $4BBC: $18 $18

.jr_4BBE
    ld   de, Data_014_4B97                        ; $4BBE: $11 $97 $4B
    ld   hl, wObjPal1                             ; $4BC1: $21 $50 $DC
    ld   b, $20                                   ; $4BC4: $06 $20
    call func_014_4BDA                            ; $4BC6: $CD $DA $4B
    ld   de, Data_014_4B9F                        ; $4BC9: $11 $9F $4B
    ld   hl, wObjPal5                             ; $4BCC: $21 $70 $DC
    ld   b, $20                                   ; $4BCF: $06 $20
    call func_014_4BDA                            ; $4BD1: $CD $DA $4B
    ld   a, $02                                   ; $4BD4: $3E $02

jr_014_4BD6:
    ld   [wPaletteDataFlags], a                   ; $4BD6: $EA $D1 $DD
    ret                                           ; $4BD9: $C9

func_014_4BDA::
    ld   a, [de]                                  ; $4BDA: $1A
    ld   [hl+], a                                 ; $4BDB: $22
    inc  de                                       ; $4BDC: $13
    dec  b                                        ; $4BDD: $05
    ld   a, b                                     ; $4BDE: $78
    and  a                                        ; $4BDF: $A7
    ret  z                                        ; $4BE0: $C8

    and  $07                                      ; $4BE1: $E6 $07
    jr   nz, func_014_4BDA                        ; $4BE3: $20 $F5

    ld   a, e                                     ; $4BE5: $7B
    sub  $08                                      ; $4BE6: $D6 $08
    ld   e, a                                     ; $4BE8: $5F
    ld   a, d                                     ; $4BE9: $7A
    sbc  $00                                      ; $4BEA: $DE $00
    ld   d, a                                     ; $4BEC: $57
    jr   func_014_4BDA                            ; $4BED: $18 $EB

func_014_4BEF::
    ld   a, [wD464]                               ; $4BEF: $FA $64 $D4
    cp   $20                                      ; $4BF2: $FE $20
    ret  nc                                       ; $4BF4: $D0

    cp   $1E                                      ; $4BF5: $FE $1E
    ret  c                                        ; $4BF7: $D8

    jr   z, .jr_4C04                              ; $4BF8: $28 $0A

    ld   hl, wBGPal1                              ; $4BFA: $21 $10 $DC
    call func_014_4C10                            ; $4BFD: $CD $10 $4C
    ld   a, $01                                   ; $4C00: $3E $01
    jr   jr_014_4BD6                              ; $4C02: $18 $D2

.jr_4C04
    ld   hl, wObjPal1                             ; $4C04: $21 $50 $DC
    call func_014_4C10                            ; $4C07: $CD $10 $4C
    ld   a, $02                                   ; $4C0A: $3E $02
    ld   [wPaletteDataFlags], a                   ; $4C0C: $EA $D1 $DD
    ret                                           ; $4C0F: $C9

func_014_4C10::
    ld   b, $40                                   ; $4C10: $06 $40

.loop_4C12
    ld   a, $02                                   ; $4C12: $3E $02
    ldh  [rSVBK], a                               ; $4C14: $E0 $70
    ld   c, [hl]                                  ; $4C16: $4E
    xor  a                                        ; $4C17: $AF
    ldh  [rSVBK], a                               ; $4C18: $E0 $70
    ld   [hl], c                                  ; $4C1A: $71
    inc  hl                                       ; $4C1B: $23
    dec  b                                        ; $4C1C: $05
    jr   nz, .loop_4C12                           ; $4C1D: $20 $F3

    ret                                           ; $4C1F: $C9

Data_014_4C20::
    db   $E4, $E4, $E4, $E4, $F9, $F9, $F9, $F9, $FE, $FE, $FE, $FE, $FF, $FF, $FF, $FF
    db   $E4, $E4, $E4, $E4, $94, $94, $94, $94, $40, $40, $40, $40, $00, $00, $00, $00

; Indicates whether the palette effects applied by some specific
; objects are disabled, depending on Link's motion state.
PaletteEffectDisabledTable::
.LINK_MOTION_DEFAULT        db 0
.LINK_MOTION_SWIMMING       db 0
.LINK_MOTION_UNSTUCKING     db 0
.LINK_MOTION_MAP_FADE_OUT   db 1
.LINK_MOTION_MAP_FADE_IN    db 1
.LINK_MOTION_REVOLVING_DOOR db 0
.LINK_MOTION_FALLING_DOWN   db 0
.LINK_MOTION_PASS_OUT       db 0
.LINK_MOTION_RECOVER        db 0
.LINK_MOTION_TELEPORT       db 0
.LINK_MOTION_UNKNOWN_0A     db 0

; Update the palette effects for interactive objects
; (for instance a dark palette when torches are not lit)
UpdatePaletteEffectForInteractiveObjects::
    ; If gameplay subtype != GAMEPLAY_WORLD_INTERACTIVE, return
    ld   a, [wGameplaySubtype]                    ; $4C4B: $FA $96 $DB
    cp   GAMEPLAY_WORLD_INTERACTIVE               ; $4C4E: $FE $07
    ret  nz                                       ; $4C50: $C0

    ; If Transition Sequence Counter != 4, return
    ld   a, [wTransitionSequenceCounter]          ; $4C51: $FA $6B $C1
    cp   $04                                      ; $4C54: $FE $04
    ret  nz                                       ; $4C56: $C0

    ; If there is no object currently affecting the background palette, return
    ld   a, [wObjectAffectingBGPalette]           ; $4C57: $FA $CB $C3
    and  a                                        ; $4C5A: $A7
    jr   z, .return                               ; $4C5B: $28 $54

    ; If Link's motion state doesn't allow for palette effects, return
    xor  a                                        ; $4C5D: $AF
    ldh  [hMultiPurpose0], a                      ; $4C5E: $E0 $D7
    ld   d, a                                     ; $4C60: $57
    ld   a, [wLinkMotionState]                    ; $4C61: $FA $1C $C1
    ld   e, a                                     ; $4C64: $5F
    ld   hl, PaletteEffectDisabledTable           ; $4C65: $21 $40 $4C
    add  hl, de                                   ; $4C68: $19
    ld   a, [hl]                                  ; $4C69: $7E
    and  a                                        ; $4C6A: $A7
    jr   nz, .return                              ; $4C6B: $20 $44


    ld   a, [wWindowY]                            ; $4C6D: $FA $9A $DB
    cp   $00                                      ; $4C70: $FE $00
    jr   z, .jr_014_4C82                          ; $4C72: $28 $0E

    ld   hl, wTransitionGfx                       ; $4C74: $21 $7F $C1
    ld   a, [wDialogState]                        ; $4C77: $FA $9F $C1
    or   [hl]                                     ; $4C7A: $B6
    jr   nz, .jr_014_4C82                         ; $4C7B: $20 $05

    ld   a, [wC3CD]                               ; $4C7D: $FA $CD $C3
    ldh  [hMultiPurpose0], a                      ; $4C80: $E0 $D7

.jr_014_4C82
    ld   a, [wBGPaletteEffectAddress]             ; $4C82: $FA $CC $C3
    ld   e, a                                     ; $4C85: $5F
    ldh  a, [hFrameCounter]                       ; $4C86: $F0 $E7
    and  $03                                      ; $4C88: $E6 $03
    add  e                                        ; $4C8A: $83
    ld   e, a                                     ; $4C8B: $5F
    ld   hl, Data_014_4C20                        ; $4C8C: $21 $20 $4C
    add  hl, de                                   ; $4C8F: $19
    ld   a, [hl]                                  ; $4C90: $7E
    ld   [wBGPalette], a                          ; $4C91: $EA $97 $DB
    ld   [wC5AD], a                               ; $4C94: $EA $AD $C5

    ldh  a, [hIsGBC]                              ; $4C97: $F0 $FE
    and  a                                        ; $4C99: $A7
    jr   nz, jr_014_4CB2                          ; $4C9A: $20 $16

    ldh  a, [hFrameCounter]                       ; $4C9C: $F0 $E7
    and  $01                                      ; $4C9E: $E6 $01
    jr   nz, .return                              ; $4CA0: $20 $0F

    ldh  a, [hMultiPurpose0]                      ; $4CA2: $F0 $D7
    ld   hl, wBGPaletteEffectAddress              ; $4CA4: $21 $CC $C3
    sub  [hl]                                     ; $4CA7: $96
    jr   z, .return                               ; $4CA8: $28 $07

    and  $80                                      ; $4CAA: $E6 $80
    jr   nz, .jr_014_4CB0                         ; $4CAC: $20 $02

    inc  [hl]                                     ; $4CAE: $34
    inc  [hl]                                     ; $4CAF: $34

.jr_014_4CB0
    dec  [hl]                                     ; $4CB0: $35

.return
    ret                                           ; $4CB1: $C9

jr_014_4CB2:
    ld   hl, wTransitionGfx                       ; $4CB2: $21 $7F $C1
    ld   a, [wDialogState]                        ; $4CB5: $FA $9F $C1
    or   [hl]                                     ; $4CB8: $B6
    ret  nz                                       ; $4CB9: $C0

    ldh  a, [hMultiPurpose0]                      ; $4CBA: $F0 $D7
    ld   hl, wBGPaletteEffectAddress              ; $4CBC: $21 $CC $C3
    sub  [hl]                                     ; $4CBF: $96
    jr   nz, .jr_4CC7                             ; $4CC0: $20 $05

    ld   a, [wBGPaletteTransitionEffect]          ; $4CC2: $FA $D6 $DD
    and  a                                        ; $4CC5: $A7
    ret  z                                        ; $4CC6: $C8

.jr_4CC7
    ld   a, [wLinkMotionState]                    ; $4CC7: $FA $1C $C1
    cp   LINK_MOTION_DEFAULT                      ; $4CCA: $FE $00
    ret  nz                                       ; $4CCC: $C0

    ld   a, [wRoomTransitionDirection]            ; $4CCD: $FA $25 $C1
    cp   $04                                      ; $4CD0: $FE $04
    jr   nz, .jr_4CDF                             ; $4CD2: $20 $0B

    ld   a, [wC3CD]                               ; $4CD4: $FA $CD $C3
    ld   [wBGPaletteEffectAddress], a             ; $4CD7: $EA $CC $C3
    xor  a                                        ; $4CDA: $AF
    ld   [wRoomTransitionDirection], a            ; $4CDB: $EA $25 $C1
    ret                                           ; $4CDE: $C9

.jr_4CDF
    ld   a, [wDDD7]                               ; $4CDF: $FA $D7 $DD
    dec  a                                        ; $4CE2: $3D
    ld   [wDDD7], a                               ; $4CE3: $EA $D7 $DD
    jr   z, .jr_4CEB                              ; $4CE6: $28 $03

    cp   $01                                      ; $4CE8: $FE $01
    ret  nz                                       ; $4CEA: $C0

.jr_4CEB
    ld   a, [wBGPaletteTransitionEffect]          ; $4CEB: $FA $D6 $DD
    and  $80                                      ; $4CEE: $E6 $80
    jr   nz, jr_014_4D0B                          ; $4CF0: $20 $19

    ld   a, [wDDD7]                               ; $4CF2: $FA $D7 $DD
    and  a                                        ; $4CF5: $A7
    jr   z, jr_014_4D22                           ; $4CF6: $28 $2A

    ld   a, [hl]                                  ; $4CF8: $7E
    and  $06                                      ; $4CF9: $E6 $06
    jr   z, .jr_4D01                              ; $4CFB: $28 $04

    dec  [hl]                                     ; $4CFD: $35
    dec  [hl]                                     ; $4CFE: $35
    jr   jr_014_4D22                              ; $4CFF: $18 $21

.jr_4D01
    ld   a, [wBGPaletteEffectAddress]             ; $4D01: $FA $CC $C3
    sub  $04                                      ; $4D04: $D6 $04
    ld   [wBGPaletteEffectAddress], a             ; $4D06: $EA $CC $C3
    jr   jr_014_4D22                              ; $4D09: $18 $17

jr_014_4D0B:
    ld   a, [wDDD7]                               ; $4D0B: $FA $D7 $DD
    and  a                                        ; $4D0E: $A7
    jr   z, jr_014_4D22                           ; $4D0F: $28 $11

    ld   a, [hl]                                  ; $4D11: $7E
    and  $04                                      ; $4D12: $E6 $04
    jr   nz, .jr_4D1A                             ; $4D14: $20 $04

    inc  [hl]                                     ; $4D16: $34
    inc  [hl]                                     ; $4D17: $34
    jr   jr_014_4D22                              ; $4D18: $18 $08

.jr_4D1A
    ld   a, [wBGPaletteEffectAddress]             ; $4D1A: $FA $CC $C3
    add  $04                                      ; $4D1D: $C6 $04
    ld   [wBGPaletteEffectAddress], a             ; $4D1F: $EA $CC $C3

jr_014_4D22:
    ld   a, [wC3CD]                               ; $4D22: $FA $CD $C3
    cp   [hl]                                     ; $4D25: $BE
    jr   nz, .jr_4D32                             ; $4D26: $20 $0A

    ld   a, [wDDD7]                               ; $4D28: $FA $D7 $DD
    and  a                                        ; $4D2B: $A7
    jr   nz, .jr_4D32                             ; $4D2C: $20 $04

    xor  a                                        ; $4D2E: $AF
    ld   [wBGPaletteTransitionEffect], a          ; $4D2F: $EA $D6 $DD

.jr_4D32
    ld   a, [wDDD7]                               ; $4D32: $FA $D7 $DD
    and  a                                        ; $4D35: $A7
    jr   z, .jr_4D4A                              ; $4D36: $28 $12

    ld   hl, wFarcallParams                       ; $4D38: $21 $01 $DE
    ld   a, BANK(func_021_5355)                   ; $4D3B: $3E $21
    ld   [hl+], a                                 ; $4D3D: $22
    ld   a, HIGH(func_021_5355)                   ; $4D3E: $3E $53
    ld   [hl+], a                                 ; $4D40: $22
    ld   a, LOW(func_021_5355)                    ; $4D41: $3E $55
    ld   [hl+], a                                 ; $4D43: $22
    ld   a, BANK(@)                               ; $4D44: $3E $14
    ld   [hl], a                                  ; $4D46: $77
    call Farcall                                  ; $4D47: $CD $D7 $0B

.jr_4D4A
    ld   a, [wDDD7]                               ; $4D4A: $FA $D7 $DD
    xor  $01                                      ; $4D4D: $EE $01
    swap a                                        ; $4D4F: $CB $37
    ld   [wPalettePartialCopyColorIndexStart], a  ; $4D51: $EA $D3 $DD
    ld   a, $10                                   ; $4D54: $3E $10
    ld   [wPalettePartialCopyColorCount], a       ; $4D56: $EA $D4 $DD
    ld   a, $81                                   ; $4D59: $3E $81
    ld   [wPaletteDataFlags], a                   ; $4D5B: $EA $D1 $DD
    ld   a, [wDDD7]                               ; $4D5E: $FA $D7 $DD
    and  a                                        ; $4D61: $A7
    ret  nz                                       ; $4D62: $C0

    ldh  a, [hMapId]                              ; $4D63: $F0 $F7
    cp   MAP_TURTLE_ROCK                          ; $4D65: $FE $07
    jr   nz, .jr_4D6D                             ; $4D67: $20 $04

    ld   a, $0A                                   ; $4D69: $3E $0A
    jr   jr_014_4D6F                              ; $4D6B: $18 $02

.jr_4D6D
    ld   a, $0B                                   ; $4D6D: $3E $0B

jr_014_4D6F:
    ld   [wDDD7], a                               ; $4D6F: $EA $D7 $DD
    ret                                           ; $4D72: $C9

; Decrement various countdowns for this entity
; (if in a gameplay state that requires it)
;
; Input:
;   bc   entity index
UpdateEntityTimers::
    xor  a                                        ; $4D73: $AF
    ldh  [hActiveEntityNoBGCollision], a          ; $4D74: $E0 $BE
    ldh  [hActiveEntityTilesOffset], a            ; $4D76: $E0 $F5

    ld   a, [wGameplayType]                       ; $4D78: $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ; $4D7B: $FE $07
    jr   z, .done                                 ; $4D7D: $28 $6E

    cp   GAMEPLAY_CREDITS                         ; $4D7F: $FE $01
    jr   z, .jr_014_4D97                          ; $4D81: $28 $14

    cp   GAMEPLAY_WORLD                           ; $4D83: $FE $0B
    jr   nz, .done                                ; $4D85: $20 $66

    ld   a, [wTransitionSequenceCounter]          ; $4D87: $FA $6B $C1
    cp   $04                                      ; $4D8A: $FE $04
    jr   z, .jr_014_4D97                          ; $4D8C: $28 $09
    ld   hl, wEntitiesTypeTable                   ; $4D8E: $21 $A0 $C3
    add  hl, bc                                   ; $4D91: $09
    ld   a, [hl]                                  ; $4D92: $7E
    cp   ENTITY_DREAM_SHRINE_BED                  ; $4D93: $FE $83
    jr   nz, .done                                ; $4D95: $20 $56
.jr_014_4D97

    ; If transitioning between rooms,
    ; or the inventory is appearing,
    ; or a dialog is appearing,
    ; or Link is playing the ocarina,
    ; return.
    ld   a, [wRoomTransitionState]                ; $4D97: $FA $24 $C1
    ld   hl, wInventoryAppearing                  ; $4D9A: $21 $4F $C1
    or   [hl]                                     ; $4D9D: $B6
    ld   hl, wDialogState                         ; $4D9E: $21 $9F $C1
    or   [hl]                                     ; $4DA1: $B6
    ld   hl, wLinkPlayingOcarinaCountdown         ; $4DA2: $21 $66 $C1
    or   [hl]                                     ; $4DA5: $B6
    jr   nz, .done                                ; $4DA6: $20 $45

    ; If transition countdown > 0, decrement it
    ld   hl, wEntitiesTransitionCountdownTable    ; $4DA8: $21 $E0 $C2
    add  hl, bc                                   ; $4DAB: $09
    ld   a, [hl]                                  ; $4DAC: $7E
    and  a                                        ; $4DAD: $A7
    jr   z, .transitionCountdownEnd               ; $4DAE: $28 $01
    dec  [hl]                                     ; $4DB0: $35
.transitionCountdownEnd

    ; If private countdown 1 > 0, decrement it
    ld   hl, wEntitiesPrivateCountdown1Table      ; $4DB1: $21 $F0 $C2
    add  hl, bc                                   ; $4DB4: $09
    ld   a, [hl]                                  ; $4DB5: $7E
    and  a                                        ; $4DB6: $A7
    jr   z, .privateCountdown1End                 ; $4DB7: $28 $01
    dec  [hl]                                     ; $4DB9: $35
.privateCountdown1End

    ; If private countdown 2 > 0, decrement it
    ld   hl, wEntitiesPrivateCountdown2Table      ; $4DBA: $21 $00 $C3
    add  hl, bc                                   ; $4DBD: $09
    ld   a, [hl]                                  ; $4DBE: $7E
    and  a                                        ; $4DBF: $A7
    jr   z, .privateCountdown2End                 ; $4DC0: $28 $01
    dec  [hl]                                     ; $4DC2: $35
.privateCountdown2End

    ; If wEntitiesPrivateCountdown3Table > 0, decrement it
    ld   hl, wEntitiesPrivateCountdown3Table      ; $4DC3: $21 $80 $C4
    add  hl, bc                                   ; $4DC6: $09
    ld   a, [hl]                                  ; $4DC7: $7E
    and  a                                        ; $4DC8: $A7
    jr   z, .unknownCountdownEnd                  ; $4DC9: $28 $01
    dec  [hl]                                     ; $4DCB: $35
.unknownCountdownEnd

    ; Every 4 frames, if entity drop timer > 0, decrement it
    ldh  a, [hFrameCounter]                       ; $4DCC: $F0 $E7
    and  $03                                      ; $4DCE: $E6 $03
    jr   nz, .dropTimerEnd                        ; $4DD0: $20 $0

    ld   hl, wEntitiesDropTimerTable              ; $4DD2: $21 $50 $C4
    add  hl, bc                                   ; $4DD5: $09
    ld   a, [hl]                                  ; $4DD6: $7E
    and  a                                        ; $4DD7: $A7
    jr   z, .dropTimerEnd                         ; $4DD8: $28 $0
    dec  [hl]                                     ; $4DDA: $35
.dropTimerEnd

    ; If flash countdown > 0, decrement it
    ld   hl, wEntitiesFlashCountdownTable         ; $4DDB: $21 $20 $C4
    add  hl, bc                                   ; $4DDE: $09
    ld   a, [hl]                                  ; $4DDF: $7E
    and  a                                        ; $4DE0: $A7
    jr   z, .flashCountdownEnd                    ; $4DE1: $28 $01
    dec  [hl]                                     ; $4DE3: $35
.flashCountdownEnd

    ; When the flash countdown is active, invert the palette every 4 frames
    sla  a                                        ; $4DE4: $CB $27
    sla  a                                        ; $4DE6: $CB $27
    and  OAMF_PAL1                                ; $4DE8: $E6 $10
    ldh  [hActiveEntityFlipAttribute], a          ; $4DEA: $E0 $ED
    ret                                           ; $4DEC: $C9

.done
    xor  a                                        ; $4DED: $AF
    ldh  [hActiveEntityFlipAttribute], a          ; $4DEE: $E0 $ED
    ret                                           ; $4DF0: $C9

; Array of 5-bytes warp data
Data_014_4DF1::
    db   $01, $00, $17, $50, $7C, $01, $01, $36, $50, $7C, $01, $02, $52, $50, $7C, $01
    db   $03, $7A, $50, $7C, $01, $04, $A1, $50, $7C, $01, $05, $D4, $50, $7C, $01, $06
    db   $0E, $50, $7C, $01, $07, $5D, $50, $7C, $01, $08, $70, $50, $7C, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00

Data_014_4E3C::
    db   $01, $FF, $12, $50, $5C

Data_014_4E41::
    db   $3B, $3A, $39, $3B, $3F, $3B, $39, $3B, $3B, $00, $00, $00, $00, $00, $00, $00

TeleportToManboPond::
    ld   a, $01                                   ; $4E51: $3E $01
    ld   [wD474], a                               ; $4E53: $EA $74 $D4

    ld   a, LINK_MOTION_MAP_FADE_OUT              ; $4E56: $3E $03
    ld   [wLinkMotionState], a                    ; $4E58: $EA $1C $C1

    ld   a, [wIsIndoor]                           ; $4E5B: $FA $A5 $DB
    and  a                                        ; $4E5E: $A7
    jr   z, jr_014_4E88                           ; $4E5F: $28 $27

    ldh  a, [hMapId]                              ; $4E61: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $4E63: $FE $FF
    jr   nz, .jr_4E6B                             ; $4E65: $20 $04

    and  $0F                                      ; $4E67: $E6 $0F
    jr   jr_014_4E6F                              ; $4E69: $18 $04

.jr_4E6B
    cp   $0A                                      ; $4E6B: $FE $0A
    jr   nc, jr_014_4E88                          ; $4E6D: $30 $19

jr_014_4E6F:
    ld   e, a                                     ; $4E6F: $5F
    sla  a                                        ; $4E70: $CB $27
    sla  a                                        ; $4E72: $CB $27
    add  e                                        ; $4E74: $83
    ld   e, a                                     ; $4E75: $5F
    ld   d, $00                                   ; $4E76: $16 $00
    ld   hl, Data_014_4DF1                        ; $4E78: $21 $F1 $4D
    add  hl, de                                   ; $4E7B: $19
    ld   e, $05                                   ; $4E7C: $1E $05
    ld   bc, wWarpStructs                         ; $4E7E: $01 $01 $D4

.loop
    ld   a, [hl+]                                 ; $4E81: $2A
    ld   [bc], a                                  ; $4E82: $02
    inc  bc                                       ; $4E83: $03
    dec  e                                        ; $4E84: $1D
    jr   nz, .loop                                ; $4E85: $20 $FA

    ret                                           ; $4E87: $C9

jr_014_4E88:
    xor  a                                        ; $4E88: $AF
    ld   [wWarpStructs], a                        ; $4E89: $EA $01 $D4
    ld   [wWarp0Map], a                           ; $4E8C: $EA $02 $D4
    ld   a, $45                                   ; $4E8F: $3E $45
    ld   [wWarp0Room], a                          ; $4E91: $EA $03 $D4
    ld   a, $38                                   ; $4E94: $3E $38
    ld   [wWarp0DestinationX], a                  ; $4E96: $EA $04 $D4
    ldh  [hLinkPositionX], a                      ; $4E99: $E0 $98
    ld   a, $60                                   ; $4E9B: $3E $60
    ld   [wWarp0DestinationY], a                  ; $4E9D: $EA $05 $D4
    ldh  [hLinkPositionY], a                      ; $4EA0: $E0 $99
    ld   a, $53                                   ; $4EA2: $3E $53
    ld   [wWarp0PositionTileIndex], a             ; $4EA4: $EA $16 $D4
    ret                                           ; $4EA7: $C9

; BG palettes
Data_014_4EA8::
    db   $E4, $E4, $E4, $E4, $94, $94, $94, $94, $40, $40, $40, $40, $00, $00, $00, $00

; OBJ0 palettes
Data_014_4EB8::
    db   $1C, $1C, $1C, $1C, $18, $18, $18, $18, $04, $04, $04, $04, $00, $00, $00, $00

; BG palettes
Data_014_4EC8::
    db   $00, $00, $00, $00, $40, $40, $40, $40, $94, $94, $94, $94, $E4, $E4, $E4, $E4

; OBJ0 palettes
Data_014_4ED8::
    db   $00, $00, $00, $00, $04, $04, $04, $04, $18, $18, $18, $18, $1C, $1C, $1C, $1C

; Data for transition effects (rumble?)
Data_014_4EE8::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00
    db   $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00
    db   $00, $00, $00, $00, $01, $01, $02, $02, $02, $02, $02, $01, $01, $00, $00, $00
    db   $00, $00, $00, $00, $FF, $FF, $FE, $FE, $FE, $FE, $FE, $FF, $FF, $00, $00, $00
    db   $00, $01, $01, $02, $02, $02, $03, $03, $03, $03, $03, $02, $02, $02, $01, $00
    db   $00, $FF, $FF, $FE, $FE, $FE, $FD, $FD, $FD, $FD, $FD, $FE, $FE, $FE, $FF, $00
    db   $00, $02, $02, $03, $03, $03, $04, $04, $04, $04, $04, $03, $03, $03, $02, $02
    db   $00, $FE, $FE, $FD, $FD, $FD, $FC, $FC, $FC, $FC, $FC, $FD, $FD, $FD, $FE, $FE
    db   $00, $01, $01, $02, $02, $02, $03, $03, $03, $03, $03, $02, $02, $02, $01, $00
    db   $00, $FF, $FF, $FE, $FE, $FE, $FD, $FD, $FD, $FD, $FD, $FE, $FE, $FE, $FF, $00
    db   $00, $00, $00, $00, $01, $01, $02, $02, $02, $02, $02, $01, $01, $00, $00, $00
    db   $00, $00, $00, $00, $FF, $FF, $FE, $FE, $FE, $FE, $FE, $FF, $FF, $00, $00, $00
    db   $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00
    db   $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00

; Progressively fade the screen to white (DMG version)
;
; See also: ApplyFadeToWhite_GBC in bank $20
ApplyFadeToWhite_DMG::
    ld   a, [wTransitionGfxFrameCount]            ; $4FE8: $FA $80 $C1
    push af                                       ; $4FEB: $F5
    and  $07                                      ; $4FEC: $E6 $07
    jr   nz, .jr_4FFB                             ; $4FEE: $20 $0B

    ld   a, [wC3CA]                               ; $4FF0: $FA $CA $C3
    cp   $0C                                      ; $4FF3: $FE $0C
    jr   z, jr_014_5036                           ; $4FF5: $28 $3F

    inc  a                                        ; $4FF7: $3C
    ld   [wC3CA], a                               ; $4FF8: $EA $CA $C3

.jr_4FFB
    ld   a, [wC3CA]                               ; $4FFB: $FA $CA $C3
    ld   e, a                                     ; $4FFE: $5F
    ldh  a, [hFrameCounter]                       ; $4FFF: $F0 $E7
    and  $03                                      ; $5001: $E6 $03
    add  e                                        ; $5003: $83
    ld   e, a                                     ; $5004: $5F
    ld   d, $00                                   ; $5005: $16 $00
    ld   a, [wTransitionGfx]                      ; $5007: $FA $7F $C1
    cp   $03                                      ; $500A: $FE $03
    jr   z, .jr_5023                              ; $500C: $28 $15

    ld   hl, Data_014_4EA8                        ; $500E: $21 $A8 $4E
    add  hl, de                                   ; $5011: $19
    ld   a, [hl]                                  ; $5012: $7E
    ld   [wBGPalette], a                          ; $5013: $EA $97 $DB
    ld   [wOBJ1Palette], a                        ; $5016: $EA $99 $DB
    ld   hl, Data_014_4EB8                        ; $5019: $21 $B8 $4E
    add  hl, de                                   ; $501C: $19
    ld   a, [hl]                                  ; $501D: $7E
    ld   [wOBJ0Palette], a                        ; $501E: $EA $98 $DB
    jr   jr_014_5036                              ; $5021: $18 $13

.jr_5023
    ld   hl, Data_014_4EC8                        ; $5023: $21 $C8 $4E
    add  hl, de                                   ; $5026: $19
    ld   a, [hl]                                  ; $5027: $7E
    ld   [wBGPalette], a                          ; $5028: $EA $97 $DB
    ld   [wOBJ1Palette], a                        ; $502B: $EA $99 $DB
    ld   hl, Data_014_4ED8                        ; $502E: $21 $D8 $4E
    add  hl, de                                   ; $5031: $19
    ld   a, [hl]                                  ; $5032: $7E
    ld   [wOBJ0Palette], a                        ; $5033: $EA $98 $DB

jr_014_5036:
    pop  af                                       ; $5036: $F1
    ret                                           ; $5037: $C9

RenderTransitionEffect::
    srl  a                                        ; $5038: $CB $3F
    srl  a                                        ; $503A: $CB $3F
    ldh  [hMultiPurpose0], a                      ; $503C: $E0 $D7
    ld   a, [wTransitionGfxFrameCount]            ; $503E: $FA $80 $C1
    nop                                           ; $5041: $00
    and  $E0                                      ; $5042: $E6 $E0
    ld   e, a                                     ; $5044: $5F
    ld   a, [wTransitionGfx]                      ; $5045: $FA $7F $C1
    cp   $03                                      ; $5048: $FE $03
    jr   nz, .jr_5050                             ; $504A: $20 $04

    ld   a, e                                     ; $504C: $7B
    xor  $E0                                      ; $504D: $EE $E0
    ld   e, a                                     ; $504F: $5F

.jr_5050
    ld   a, e                                     ; $5050: $7B
    ldh  [hMultiPurpose1], a                      ; $5051: $E0 $D8
    ld   hl, wC17C                                ; $5053: $21 $7C $C1
    xor  a                                        ; $5056: $AF
    ld   [hl+], a                                 ; $5057: $22
    ld   [hl+], a                                 ; $5058: $22
    ld   [hl+], a                                 ; $5059: $22
    ld   a, $58                                   ; $505A: $3E $58
    ldh  [hMultiPurpose2], a                      ; $505C: $E0 $D9
    ldh  a, [hIsGBC]                              ; $505E: $F0 $FE
    and  a                                        ; $5060: $A7
    jr   z, label_014_5067                        ; $5061: $28 $04

    ld   a, $88                                   ; $5063: $3E $88
    ldh  [hMultiPurpose2], a                      ; $5065: $E0 $D9

label_014_5067:
    ldh  a, [rSTAT]                               ; $5067: $F0 $41
    and  STATF_LCD                                ; $5069: $E6 $03
    jr   nz, label_014_5067                       ; $506B: $20 $FA

    ld   d, $00                                   ; $506D: $16 $00

.loop_506F
    ld   a, [wC17E]                               ; $506F: $FA $7E $C1
    inc  a                                        ; $5072: $3C
    ld   [wC17E], a                               ; $5073: $EA $7E $C1
    and  $01                                      ; $5076: $E6 $01
    jr   nz, .loop_506F                           ; $5078: $20 $F5

    ld   a, [wC17C]                               ; $507A: $FA $7C $C1
    add  $01                                      ; $507D: $C6 $01
    ld   [wC17C], a                               ; $507F: $EA $7C $C1
    ld   a, [wC17D]                               ; $5082: $FA $7D $C1
    adc  $00                                      ; $5085: $CE $00
    ld   [wC17D], a                               ; $5087: $EA $7D $C1
    ldh  a, [hMultiPurpose2]                      ; $508A: $F0 $D9
    ld   hl, wC17C                                ; $508C: $21 $7C $C1
    cp   [hl]                                     ; $508F: $BE
    ret  z                                        ; $5090: $C8

    ld   c, $00                                   ; $5091: $0E $00
    ld   a, [wTransitionGfx]                      ; $5093: $FA $7F $C1
    cp   $01                                      ; $5096: $FE $01
    jr   z, .jr_509B                              ; $5098: $28 $01

    inc  c                                        ; $509A: $0C

.jr_509B
    ldh  a, [hMultiPurpose0]                      ; $509B: $F0 $D7
    add  [hl]                                     ; $509D: $86
    and  $1F                                      ; $509E: $E6 $1F
    ld   hl, hMultiPurpose1                       ; $50A0: $21 $D8 $FF
    or   [hl]                                     ; $50A3: $B6
    ld   e, a                                     ; $50A4: $5F
    ld   hl, Data_014_4EE8                        ; $50A5: $21 $E8 $4E
    add  hl, de                                   ; $50A8: $19
    ld   a, [wTransitionGfxFrameCount]            ; $50A9: $FA $80 $C1
    and  c                                        ; $50AC: $A1
    ld   a, [hl]                                  ; $50AD: $7E
    jr   z, .jr_50B2                              ; $50AE: $28 $02

    cpl                                           ; $50B0: $2F
    inc  a                                        ; $50B1: $3C

.jr_50B2
    push af                                       ; $50B2: $F5
    ld   hl, hBaseScrollX                         ; $50B3: $21 $96 $FF
    add  [hl]                                     ; $50B6: $86
    ldh  [rSCX], a                                ; $50B7: $E0 $43
    pop  af                                       ; $50B9: $F1
    ld   hl, hBaseScrollY                         ; $50BA: $21 $97 $FF
    add  [hl]                                     ; $50BD: $86
    ldh  [rSCY], a                                ; $50BE: $E0 $42
    jp   label_014_5067                           ; $50C0: $C3 $67 $50

func_014_50C3::
    ; de = entity slot
    ld   e, $0F                                   ; $50C3: $1E $0F
    ld   d, $00                                   ; $50C5: $16 $00

    ; For each entity:
.loop
    ; If the entity is active…
    ld   hl, wEntitiesStatusTable                 ; $50C7: $21 $80 $C2
    add  hl, de                                   ; $50CA: $19
    ld   a, [hl]                                  ; $50CB: $7E
    cp   ENTITY_STATUS_ACTIVE                     ; $50CC: $FE $05
    jr   nz, .continue                            ; $50CE: $20 $41

    ; and the item is pickable…
    ld   hl, wEntitiesPhysicsFlagsTable           ; $50D0: $21 $40 $C3
    add  hl, de                                   ; $50D3: $19
    ld   a, [hl]                                  ; $50D4: $7E
    and  ENTITY_PHYSICS_GRABBABLE                 ; $50D5: $E6 $20
    jr   z, .continue                             ; $50D7: $28 $38

    ; and the wEntitiesPrivateState3Table value != 2…
    ld   hl, wEntitiesPrivateState3Table          ; $50D9: $21 $D0 $C2
    add  hl, de                                   ; $50DC: $19
    ld   a, [hl]                                  ; $50DD: $7E
    cp   $02                                      ; $50DE: $FE $02
    jr   nz, .continue                            ; $50E0: $20 $2F

    ; and the sword X position intersects with the entity…
    ld   hl, wEntitiesPosXTable                   ; $50E2: $21 $00 $C2
    add  hl, de                                   ; $50E5: $19
    ldh  a, [hIntersectedObjectLeft]              ; $50E6: $F0 $CE
    add  $08                                      ; $50E8: $C6 $08
    sub  [hl]                                     ; $50EA: $96
    add  $08                                      ; $50EB: $C6 $08
    cp   $10                                      ; $50ED: $FE $10
    jr   nc, .continue                            ; $50EF: $30 $20

    ; and the sword Y position intersects with the entity…
    ld   hl, wEntitiesPosYTable                   ; $50F1: $21 $10 $C2
    add  hl, de                                   ; $50F4: $19
    ldh  a, [hIntersectedObjectTop]               ; $50F5: $F0 $CD
    add  $10                                      ; $50F7: $C6 $10
    sub  [hl]                                     ; $50F9: $96
    add  $08                                      ; $50FA: $C6 $08
    cp   $10                                      ; $50FC: $FE $10
    jr   nc, .continue                            ; $50FE: $30 $11

    ; Set the drop timer to $80
    ld   hl, wEntitiesDropTimerTable              ; $5100: $21 $50 $C4
    add  hl, de                                   ; $5103: $19
    ld   [hl], $80                                ; $5104: $36 $80
    ; Clear the wEntitiesPrivateState3Table value
    ld   hl, wEntitiesPrivateState3Table          ; $5106: $21 $D0 $C2
    add  hl, de                                   ; $5109: $19
    ld   [hl], d                                  ; $510A: $72
    ; Set the wEntitiesPrivateCountdown1Table value to $18
    ld   hl, wEntitiesPrivateCountdown1Table      ; $510B: $21 $F0 $C2
    add  hl, de                                   ; $510E: $19
    ld   [hl], $18                                ; $510F: $36 $18

.continue
    ; Loop until reaching entity 0
    dec  e                                        ; $5111: $1D
    ld   a, e                                     ; $5112: $7B
    cp   $FF                                      ; $5113: $FE $FF
    jr   nz, .loop                                ; $5115: $20 $B0

    ret                                           ; $5117: $C9

include "data/objects/signpost_dialogs.asm"
include "data/entities/bow_wow_eatable.asm"

Data_014_5313::
    db   $30, $D0, $00, $00, $18, $E8, $00, $00, $30, $D0, $00, $00, $18, $E8, $00, $00

Data_014_5323::
    db   $00, $00, $D0, $30, $00, $00, $E8, $18, $F4, $F4, $D0, $00, $F8, $F8, $E8, $00

Data_014_5333::
    db   $04, $04, $04, $04, $10, $10, $10, $10, $00, $00, $00, $00, $00, $00, $00, $00

Data_014_5343::
    db   $02, $06, $00, $04

func_014_5347::
    ld   a, [wRoomTransitionState]                ; $5347: $FA $24 $C1
    and  a                                        ; $534A: $A7
    jr   nz, .jr_5354                             ; $534B: $20 $07

    ld   a, [wLinkMotionState]                    ; $534D: $FA $1C $C1
    cp   LINK_MOTION_FALLING_DOWN                 ; $5350: $FE $06
    jr   nz, jr_014_5360                          ; $5352: $20 $0C

.jr_5354
    ldh  a, [hActiveEntityType]                   ; $5354: $F0 $EB
    cp   ENTITY_WRECKING_BALL                     ; $5356: $FE $A8
    jr   z, jr_014_5360                           ; $5358: $28 $06

    call func_014_53A3                            ; $535A: $CD $A3 $53
    jp   ClearEntitySpeed                         ; $535D: $C3 $7F $3D

jr_014_5360:
    ld   a, [wC5AE]                               ; $5360: $FA $AE $C5
    and  a                                        ; $5363: $A7
    jr   z, .jr_536B                              ; $5364: $28 $05

    dec  a                                        ; $5366: $3D
    ld   [wC5AE], a                               ; $5367: $EA $AE $C5
    ret                                           ; $536A: $C9

.jr_536B
    ld   a, [wIsCarryingLiftedObject]             ; $536B: $FA $5C $C1
    cp   TRUE                                     ; $536E: $FE $01
    jp   nz, label_014_5443                       ; $5370: $C2 $43 $54

    ld   d, INVENTORY_POWER_BRACELET              ; $5373: $16 $03
    ldh  a, [hActiveEntityType]                   ; $5375: $F0 $EB
    cp   ENTITY_BOMB                              ; $5377: $FE $02
    jr   nz, .jr_537D                             ; $5379: $20 $02

    ld   d, INVENTORY_BOMBS                       ; $537B: $16 $02

.jr_537D
    ld   e, J_A                                   ; $537D: $1E $10
    ld   a, [wInventoryItems.BButtonSlot]         ; $537F: $FA $00 $DB
    cp   d                                        ; $5382: $BA
    jr   nz, .jr_5389                             ; $5383: $20 $04

    sla  e ; J_B                                       ; $5385: $CB $23
    jr   jr_014_5391                              ; $5387: $18 $08

.jr_5389
    ld   a, [wInventoryItems.AButtonSlot]         ; $5389: $FA $01 $DB
    cp   d                                        ; $538C: $BA
    jr   z, jr_014_5391                           ; $538D: $28 $02

    ld   e, $30                                   ; $538F: $1E $30

jr_014_5391:
    ldh  a, [hJoypadState]                        ; $5391: $F0 $CC
    and  e                                        ; $5393: $A3
    jp   z, label_014_5443                        ; $5394: $CA $43 $54

    ldh  a, [hLinkDirection]                      ; $5397: $F0 $9E
    ld   hl, wC5D0                                ; $5399: $21 $D0 $C5
    add  hl, bc                                   ; $539C: $09
    ld   [hl], a                                  ; $539D: $77
    ld   hl, hJingle                              ; $539E: $21 $F2 $FF
    ld   [hl], JINGLE_FALL_DOWN                   ; $53A1: $36 $08

func_014_53A3::
    ld   hl, wEntitiesStatusTable                 ; $53A3: $21 $80 $C2
    add  hl, bc                                   ; $53A6: $09
    ld   [hl], $05                                ; $53A7: $36 $05
    ldh  a, [hActiveEntityType]                   ; $53A9: $F0 $EB
    cp   ENTITY_BOMB                              ; $53AB: $FE $02
    jr   nz, .jr_53B6                             ; $53AD: $20 $07

    call GetEntityTransitionCountdown             ; $53AF: $CD $05 $0C
    ld   [hl], $A0                                ; $53B2: $36 $A0
    jr   jr_014_5409                              ; $53B4: $18 $53

.jr_53B6
    ld   hl, wEntitiesStatusTable                 ; $53B6: $21 $80 $C2
    add  hl, bc                                   ; $53B9: $09
    cp   ENTITY_SIDE_VIEW_POT                     ; $53BA: $FE $D6
    jr   z, .jr_53ED                              ; $53BC: $28 $2F

    cp   ENTITY_ROOSTER                           ; $53BE: $FE $D5
    jr   z, .jr_53ED                              ; $53C0: $28 $2B

    cp   ENTITY_CUCCO                             ; $53C2: $FE $6C
    jr   z, .jr_53ED                              ; $53C4: $28 $27

    cp   ENTITY_LIFTABLE_STATUE                   ; $53C6: $FE $9D
    jr   z, .jr_53ED                              ; $53C8: $28 $23

    cp   ENTITY_WRECKING_BALL                     ; $53CA: $FE $A8
    jr   z, .jr_53ED                              ; $53CC: $28 $1F

    cp   ENTITY_HORSE_PIECE                       ; $53CE: $FE $98
    jr   nz, jr_014_53F6                          ; $53D0: $20 $24

    ; Horse head piece specific handling on throwing
    push hl                                       ; $53D2: $E5
    ldh  a, [hLinkDirection]                      ; $53D3: $F0 $9E
    ld   e, a                                     ; $53D5: $5F
    ld   d, b                                     ; $53D6: $50
    ld   hl, Data_014_5343                        ; $53D7: $21 $43 $53
    add  hl, de                                   ; $53DA: $19
    ld   a, [hl]                                  ; $53DB: $7E
    ld   hl, wEntitiesDirectionTable              ; $53DC: $21 $80 $C3
    add  hl, bc                                   ; $53DF: $09
    ld   [hl], a                                  ; $53E0: $77
    call GetEntityTransitionCountdown             ; $53E1: $CD $05 $0C
    call GetRandomByte                            ; $53E4: $CD $0D $28
    and  $1F                                      ; $53E7: $E6 $1F
    add  $30                                      ; $53E9: $C6 $30
    ld   [hl], a                                  ; $53EB: $77
    pop  hl                                       ; $53EC: $E1

.jr_53ED
    ; Set the entity state to 2 for certain throwable objects.
    ld   [hl], $05                                ; $53ED: $36 $05
    call IncrementEntityState                     ; $53EF: $CD $12 $3B
    ld   [hl], $02                                ; $53F2: $36 $02
    jr   jr_014_5409                              ; $53F4: $18 $13

jr_014_53F6:
    cp   ENTITY_SMASHER                           ; $53F6: $FE $92
    jr   nz, .jr_5403                             ; $53F8: $20 $09

    ; Smasher ball throw
    ld   [hl], $05                                ; $53FA: $36 $05
    call IncrementEntityState                     ; $53FC: $CD $12 $3B
    ld   [hl], $03                                ; $53FF: $36 $03
    jr   jr_014_5409                              ; $5401: $18 $06

.jr_5403
    cp   ENTITY_LIFTABLE_ROCK                     ; $5403: $FE $05
    jr   z, jr_014_5409                           ; $5405: $28 $02

    ld   [hl], $08                                ; $5407: $36 $08

jr_014_5409:
    ld   e, b                                     ; $5409: $58
    ldh  a, [hIsSideScrolling]                    ; $540A: $F0 $F9
    and  a                                        ; $540C: $A7
    jr   z, .jr_5411                              ; $540D: $28 $02

    ld   e, $08                                   ; $540F: $1E $08

.jr_5411
    ldh  a, [hActiveEntityType]                   ; $5411: $F0 $EB
    cp   ENTITY_BOMB                              ; $5413: $FE $02
    jr   nz, .jr_541B                             ; $5415: $20 $04

    ld   a, e                                     ; $5417: $7B
    add  $04                                      ; $5418: $C6 $04
    ld   e, a                                     ; $541A: $5F

.jr_541B
    ldh  a, [hLinkDirection]                      ; $541B: $F0 $9E
    add  e                                        ; $541D: $83
    ld   e, a                                     ; $541E: $5F
    ld   d, b                                     ; $541F: $50
    ld   hl, Data_014_5313                        ; $5420: $21 $13 $53
    add  hl, de                                   ; $5423: $19
    ld   a, [hl]                                  ; $5424: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $5425: $21 $40 $C2
    add  hl, bc                                   ; $5428: $09
    ld   [hl], a                                  ; $5429: $77
    ld   hl, Data_014_5323                        ; $542A: $21 $23 $53
    add  hl, de                                   ; $542D: $19
    ld   a, [hl]                                  ; $542E: $7E
    ld   hl, wEntitiesSpeedYTable                 ; $542F: $21 $50 $C2
    add  hl, bc                                   ; $5432: $09
    ld   [hl], a                                  ; $5433: $77
    ld   hl, Data_014_5333                        ; $5434: $21 $33 $53
    add  hl, de                                   ; $5437: $19
    ld   a, [hl]                                  ; $5438: $7E
    ld   hl, wEntitiesSpeedZTable                 ; $5439: $21 $20 $C3
    add  hl, bc                                   ; $543C: $09
    ld   [hl], a                                  ; $543D: $77

    ld   a, $0C | ATTACK_STEP_ITEM_ANY            ; $543E: $3E $0C
    ld   [wLinkAttackStepAnimationCountdown], a   ; $5440: $EA $9B $C1

label_014_5443:
    ret                                           ; $5443: $C9

jr_014_5444:
    xor  a                                        ; $5444: $AF
    ld   [wDialogState], a                        ; $5445: $EA $9F $C1
    ret                                           ; $5448: $C9

DialogOpenAnimationStart::
    ld   a, [wC3C9]                               ; $5449: $FA $C9 $C3
    and  a                                        ; $544C: $A7
    jr   nz, .jr_545A                             ; $544D: $20 $0B

    ld   a, [wLinkMotionState]                    ; $544F: $FA $1C $C1
    cp   LINK_MOTION_MAP_FADE_OUT                 ; $5452: $FE $03
    jr   z, jr_014_5444                           ; $5454: $28 $EE

    cp   LINK_MOTION_MAP_FADE_IN                  ; $5456: $FE $04
    jr   z, jr_014_5444                           ; $5458: $28 $EA

.jr_545A
    ld   a, [wGameplayType]                       ; $545A: $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ; $545D: $FE $01
    jr   z, .jr_547F                              ; $545F: $28 $1E

    ld   a, [wObjectAffectingBGPalette]           ; $5461: $FA $CB $C3
    and  a                                        ; $5464: $A7
    jr   nz, .jr_547F                             ; $5465: $20 $18

    ldh  a, [hLinkAnimationState]                 ; $5467: $F0 $9D
    cp   LINK_ANIMATION_STATE_GOT_ITEM            ; $5469: $FE $6C
    jr   z, .jr_547F                              ; $546B: $28 $12

    ld   a, $04                                   ; $546D: $3E $04
    ld   [wTransitionSequenceCounter], a          ; $546F: $EA $6B $C1
    ld   a, $E4                                   ; $5472: $3E $E4
    ld   [wBGPalette], a                          ; $5474: $EA $97 $DB
    ld   [wOBJ1Palette], a                        ; $5477: $EA $99 $DB
    ld   a, $1C                                   ; $547A: $3E $1C
    ld   [wOBJ0Palette], a                        ; $547C: $EA $98 $DB

.jr_547F
    ld   a, [wDrawCommand]                        ; $547F: $FA $01 $D6
    and  a                                        ; $5482: $A7
    ret  nz                                       ; $5483: $C0

    ld   hl, wDialogState                         ; $5484: $21 $9F $C1
    inc  [hl]                                     ; $5487: $34
    ldh  a, [hIsGBC]                              ; $5488: $F0 $FE
    and  a                                        ; $548A: $A7
    ret  z                                        ; $548B: $C8

    ld   a, [wGameplayType]                       ; $548C: $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ; $548F: $FE $0B
    ret  nz                                       ; $5491: $C0

    ld   a, [wBGPaletteEffectAddress]             ; $5492: $FA $CC $C3
    cp   $08                                      ; $5495: $FE $08
    ret  c                                        ; $5497: $D8

    ld   hl, wFarcallParams                       ; $5498: $21 $01 $DE
    ld   a, BANK(func_021_53B6)                   ; $549B: $3E $21
    ld   [hl+], a                                 ; $549D: $22
    ld   a, HIGH(func_021_53B6)                   ; $549E: $3E $53
    ld   [hl+], a                                 ; $54A0: $22
    ld   a, LOW(func_021_53B6)                    ; $54A1: $3E $B6
    ld   [hl+], a                                 ; $54A3: $22
    ld   a, BANK(@)                               ; $54A4: $3E $14
    ld   [wFarcallReturnBank], a                  ; $54A6: $EA $04 $DE
    jp   Farcall                                  ; $54A9: $C3 $D7 $0B

func_014_54AC::
    ld   hl, wFreeMovementMode                    ; $54AC: $21 $7B $C1
    ld   a, [wRoomTransitionState]                ; $54AF: $FA $24 $C1
    or   [hl]                                     ; $54B2: $B6
    jr   nz, ret_014_54E7                         ; $54B3: $20 $32

    ldh  a, [hLinkPositionX]                      ; $54B5: $F0 $98
    sub  $11                                      ; $54B7: $D6 $11
    cp   $7E                                      ; $54B9: $FE $7E
    jr   c, jr_014_54D1                           ; $54BB: $38 $14

    ldh  a, [hLinkPositionX]                      ; $54BD: $F0 $98
    cp   $50                                      ; $54BF: $FE $50
    jr   nc, .jr_54CA                             ; $54C1: $30 $07

    ldh  a, [hLinkPositionX]                      ; $54C3: $F0 $98
    inc  a                                        ; $54C5: $3C
    ldh  [hLinkPositionX], a                      ; $54C6: $E0 $98
    jr   jr_014_54DE                              ; $54C8: $18 $14

.jr_54CA
    ldh  a, [hLinkPositionX]                      ; $54CA: $F0 $98
    dec  a                                        ; $54CC: $3D
    ldh  [hLinkPositionX], a                      ; $54CD: $E0 $98
    jr   jr_014_54DE                              ; $54CF: $18 $0D

jr_014_54D1:
    ldh  a, [hLinkPositionY]                      ; $54D1: $F0 $99
    sub  $16                                      ; $54D3: $D6 $16
    cp   $5E                                      ; $54D5: $FE $5E
    jr   c, ret_014_54E7                          ; $54D7: $38 $0E

    ldh  a, [hLinkPositionY]                      ; $54D9: $F0 $99
    dec  a                                        ; $54DB: $3D
    ldh  [hLinkPositionY], a                      ; $54DC: $E0 $99

jr_014_54DE:
    ld   a, $01                                   ; $54DE: $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ; $54E0: $E0 $A1
    ld   a, $02                                   ; $54E2: $3E $02
    ld   [wC111], a                               ; $54E4: $EA $11 $C1

ret_014_54E7:
    ret                                           ; $54E7: $C9

Data_014_54E8::
    db   $00, $02, $00, $FE, $00, $00, $00, $00

Data_014_54F0::
    db   $00, $00, $00, $00, $00, $02, $00, $FE

func_014_54F8::
    ld   a, [wC178]                               ; $54F8: $FA $78 $C1
    and  a                                        ; $54FB: $A7
    jr   z, .jr_5502                              ; $54FC: $28 $04

    dec  a                                        ; $54FE: $3D
    ld   [wC178], a                               ; $54FF: $EA $78 $C1

.jr_5502
    ld   a, [wC157]                               ; $5502: $FA $57 $C1
    and  a                                        ; $5505: $A7
    jr   z, .ret_5525                             ; $5506: $28 $1D

    dec  a                                        ; $5508: $3D
    ld   [wC157], a                               ; $5509: $EA $57 $C1
    and  $03                                      ; $550C: $E6 $03
    ld   hl, wC158                                ; $550E: $21 $58 $C1
    add  [hl]                                     ; $5511: $86
    ld   e, a                                     ; $5512: $5F
    ld   d, $00                                   ; $5513: $16 $00
    ld   hl, Data_014_54E8                        ; $5515: $21 $E8 $54
    add  hl, de                                   ; $5518: $19
    ld   a, [hl]                                  ; $5519: $7E
    ld   [wScreenShakeHorizontal], a              ; $551A: $EA $55 $C1
    ld   hl, Data_014_54F0                        ; $551D: $21 $F0 $54
    add  hl, de                                   ; $5520: $19
    ld   a, [hl]                                  ; $5521: $7E
    ld   [wScreenShakeVertical], a                ; $5522: $EA $56 $C1

.ret_5525
    ret                                           ; $5525: $C9

func_014_5526::
    ld   hl, wRoomObjects                         ; $5526: $21 $11 $D7
    add  hl, de                                   ; $5529: $19
    ldh  a, [hObjectUnderEntity]                  ; $552A: $F0 $AF
    cp   $8E                                      ; $552C: $FE $8E
    jr   nz, jr_014_557D                          ; $552E: $20 $4D

    ld   [hl], $AA                                ; $5530: $36 $AA
    call label_2887                               ; $5532: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $5535: $F0 $FE
    and  a                                        ; $5537: $A7
    jr   z, .jr_554D                              ; $5538: $28 $13

    push bc                                       ; $553A: $C5
    ld   c, $AA                                   ; $553B: $0E $AA
    ld   b, $00                                   ; $553D: $06 $00
    sla  c                                        ; $553F: $CB $21
    rl   b                                        ; $5541: $CB $10
    sla  c                                        ; $5543: $CB $21
    rl   b                                        ; $5545: $CB $10
    ld   a, $14                                   ; $5547: $3E $14
    call func_91D.jp_92E                          ; $5549: $CD $2E $09
    pop  bc                                       ; $554C: $C1

.jr_554D
    ld   hl, wDrawCommand                         ; $554D: $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ; $5550: $FA $00 $D6
    ld   e, a                                     ; $5553: $5F
    add  $0A                                      ; $5554: $C6 $0A
    ld   [wDrawCommandsSize], a                   ; $5556: $EA $00 $D6
    ld   d, $00                                   ; $5559: $16 $00
    add  hl, de                                   ; $555B: $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $555C: $F0 $CF
    ld   [hl+], a                                 ; $555E: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $555F: $F0 $D0
    ld   [hl+], a                                 ; $5561: $22
    ld   a, $81                                   ; $5562: $3E $81
    ld   [hl+], a                                 ; $5564: $22
    ld   a, $14                                   ; $5565: $3E $14
    ld   [hl+], a                                 ; $5567: $22
    ld   a, $16                                   ; $5568: $3E $16
    ld   [hl+], a                                 ; $556A: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $556B: $F0 $CF
    ld   [hl+], a                                 ; $556D: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $556E: $F0 $D0
    inc  a                                        ; $5570: $3C
    ld   [hl+], a                                 ; $5571: $22
    ld   a, $81                                   ; $5572: $3E $81
    ld   [hl+], a                                 ; $5574: $22
    ld   a, $15                                   ; $5575: $3E $15
    ld   [hl+], a                                 ; $5577: $22
    ld   a, $17                                   ; $5578: $3E $17
    jp   label_014_573E                           ; $557A: $C3 $3E $57

jr_014_557D:
    cp   $D3                                      ; $557D: $FE $D3
    jr   nz, .jr_5584                             ; $557F: $20 $03

    jp   label_014_5743                           ; $5581: $C3 $43 $57

.jr_5584
    ld   a, [wIsIndoor]                           ; $5584: $FA $A5 $DB
    and  a                                        ; $5587: $A7
    jp   z, label_014_5630                        ; $5588: $CA $30 $56

    ldh  a, [hIsSideScrolling]                    ; $558B: $F0 $F9
    and  a                                        ; $558D: $A7
    jr   z, jr_014_55E3                           ; $558E: $28 $53

    ldh  a, [hObjectUnderEntity]                  ; $5590: $F0 $AF
    cp   $8A                                      ; $5592: $FE $8A
    jr   nz, jr_014_55E3                          ; $5594: $20 $4D

    ld   [hl], $04                                ; $5596: $36 $04
    call label_2887                               ; $5598: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $559B: $F0 $FE
    and  a                                        ; $559D: $A7
    jr   z, .jr_55B3                              ; $559E: $28 $13

    push bc                                       ; $55A0: $C5
    ld   c, $04                                   ; $55A1: $0E $04
    ld   b, $00                                   ; $55A3: $06 $00
    sla  c                                        ; $55A5: $CB $21
    rl   b                                        ; $55A7: $CB $10
    sla  c                                        ; $55A9: $CB $21
    rl   b                                        ; $55AB: $CB $10
    ld   a, $14                                   ; $55AD: $3E $14
    call func_91D.jp_92E                          ; $55AF: $CD $2E $09
    pop  bc                                       ; $55B2: $C1

.jr_55B3
    ld   hl, wDrawCommand                         ; $55B3: $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ; $55B6: $FA $00 $D6
    ld   e, a                                     ; $55B9: $5F
    add  $0A                                      ; $55BA: $C6 $0A
    ld   [wDrawCommandsSize], a                   ; $55BC: $EA $00 $D6
    ld   d, $00                                   ; $55BF: $16 $00
    add  hl, de                                   ; $55C1: $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $55C2: $F0 $CF
    ld   [hl+], a                                 ; $55C4: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $55C5: $F0 $D0
    ld   [hl+], a                                 ; $55C7: $22
    ld   a, $81                                   ; $55C8: $3E $81
    ld   [hl+], a                                 ; $55CA: $22
    ld   a, $7E                                   ; $55CB: $3E $7E
    ld   [hl+], a                                 ; $55CD: $22
    ld   a, $7E                                   ; $55CE: $3E $7E
    ld   [hl+], a                                 ; $55D0: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $55D1: $F0 $CF
    ld   [hl+], a                                 ; $55D3: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $55D4: $F0 $D0
    inc  a                                        ; $55D6: $3C
    ld   [hl+], a                                 ; $55D7: $22
    ld   a, $81                                   ; $55D8: $3E $81
    ld   [hl+], a                                 ; $55DA: $22
    ld   a, $7E                                   ; $55DB: $3E $7E
    ld   [hl+], a                                 ; $55DD: $22
    ld   a, $7E                                   ; $55DE: $3E $7E
    jp   label_014_573E                           ; $55E0: $C3 $3E $57

jr_014_55E3:
    ld   [hl], $0D                                ; $55E3: $36 $0D
    call label_2887                               ; $55E5: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $55E8: $F0 $FE
    and  a                                        ; $55EA: $A7
    jr   z, .jr_5600                              ; $55EB: $28 $13

    push bc                                       ; $55ED: $C5
    ld   c, $0D                                   ; $55EE: $0E $0D
    ld   b, $00                                   ; $55F0: $06 $00
    sla  c                                        ; $55F2: $CB $21
    rl   b                                        ; $55F4: $CB $10
    sla  c                                        ; $55F6: $CB $21
    rl   b                                        ; $55F8: $CB $10
    ld   a, $14                                   ; $55FA: $3E $14
    call func_91D.jp_92E                          ; $55FC: $CD $2E $09
    pop  bc                                       ; $55FF: $C1

.jr_5600
    ld   hl, wDrawCommand                         ; $5600: $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ; $5603: $FA $00 $D6
    ld   e, a                                     ; $5606: $5F
    add  $0A                                      ; $5607: $C6 $0A
    ld   [wDrawCommandsSize], a                   ; $5609: $EA $00 $D6
    ld   d, $00                                   ; $560C: $16 $00
    add  hl, de                                   ; $560E: $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $560F: $F0 $CF
    ld   [hl+], a                                 ; $5611: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $5612: $F0 $D0
    ld   [hl+], a                                 ; $5614: $22
    ld   a, $81                                   ; $5615: $3E $81
    ld   [hl+], a                                 ; $5617: $22
    ld   a, $10                                   ; $5618: $3E $10
    ld   [hl+], a                                 ; $561A: $22
    ld   a, $12                                   ; $561B: $3E $12
    ld   [hl+], a                                 ; $561D: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $561E: $F0 $CF
    ld   [hl+], a                                 ; $5620: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $5621: $F0 $D0
    inc  a                                        ; $5623: $3C
    ld   [hl+], a                                 ; $5624: $22
    ld   a, $81                                   ; $5625: $3E $81
    ld   [hl+], a                                 ; $5627: $22
    ld   a, $11                                   ; $5628: $3E $11
    ld   [hl+], a                                 ; $562A: $22
    ld   a, $13                                   ; $562B: $3E $13
    jp   label_014_573E                           ; $562D: $C3 $3E $57

label_014_5630:
    ldh  a, [hObjectUnderEntity]                  ; $5630: $F0 $AF
    cp   $20                                      ; $5632: $FE $20
    jr   nz, jr_014_564E                          ; $5634: $20 $18

    ldh  a, [hMapRoom]                            ; $5636: $F0 $F6
    cp   UNKNOWN_ROOM_52                          ; $5638: $FE $52
    jr   z, .jr_5640                              ; $563A: $28 $04
    cp   UNKNOWN_ROOM_04                          ; $563C: $FE $04
    jr   nz, jr_014_5643                          ; $563E: $20 $03

.jr_5640
    jp   label_014_5767                           ; $5640: $C3 $67 $57

jr_014_5643:
    cp   UNKNOWN_ROOM_75                          ; $5643: $FE $75
    jr   nz, jr_014_564E                          ; $5645: $20 $07

    ldh  a, [hIsGBC]                              ; $5647: $F0 $FE
    and  a                                        ; $5649: $A7
    jr   z, jr_014_5677                           ; $564A: $28 $2B

    jr   jr_014_5673                              ; $564C: $18 $25

jr_014_564E:
    ldh  a, [hIsGBC]                              ; $564E: $F0 $FE
    and  a                                        ; $5650: $A7
    jr   z, jr_014_5677                           ; $5651: $28 $24

    ldh  a, [hMapRoom]                            ; $5653: $F0 $F6
    cp   ROOM_SECTION_OW_SOUTH_OF_TAL_TAL_HEIGHTS ; $5655: $FE $20
    jr   c, jr_014_5673                           ; $5657: $38 $1A

    cp   UNKNOWN_ROOM_E0                          ; $5659: $FE $E0
    jr   z, jr_014_5673                           ; $565B: $28 $16
    cp   UNKNOWN_ROOM_E1                          ; $565D: $FE $E1
    jr   z, jr_014_5673                           ; $565F: $28 $12
    cp   UNKNOWN_ROOM_E3                          ; $5661: $FE $E3
    jr   z, jr_014_5673                           ; $5663: $28 $0E
    cp   UNKNOWN_ROOM_E4                          ; $5665: $FE $E4
    jr   z, jr_014_5673                           ; $5667: $28 $0A
    cp   UNKNOWN_ROOM_FF                          ; $5669: $FE $FF
    jr   nz, jr_014_5677                          ; $566B: $20 $0A

    ldh  a, [hObjectUnderEntity]                  ; $566D: $F0 $AF
    cp   $20                                      ; $566F: $FE $20
    jr   z, jr_014_5677                           ; $5671: $28 $04

jr_014_5673:
    ld   [hl], $03                                ; $5673: $36 $03
    jr   jr_014_5679                              ; $5675: $18 $02

jr_014_5677:
    ld   [hl], $04                                ; $5677: $36 $04

jr_014_5679:
    ld   a, $94                                   ; $5679: $3E $94
    call BackupObjectInRAM2                       ; $567B: $CD $2F $0B
    call label_2887                               ; $567E: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $5681: $F0 $FE
    and  a                                        ; $5683: $A7
    jr   z, jr_014_56C9                           ; $5684: $28 $43

    push bc                                       ; $5686: $C5
    ldh  a, [hMapRoom]                            ; $5687: $F0 $F6
    cp   ROOM_SECTION_OW_SOUTH_OF_TAL_TAL_HEIGHTS ; $5689: $FE $20
    jr   c, jr_014_56B3                           ; $568B: $38 $26

    cp   UNKNOWN_ROOM_E0                          ; $568D: $FE $E0
    jr   z, jr_014_56B3                           ; $568F: $28 $22
    cp   UNKNOWN_ROOM_E1                          ; $5691: $FE $E1
    jr   z, jr_014_56B3                           ; $5693: $28 $1E
    cp   UNKNOWN_ROOM_E3                          ; $5695: $FE $E3
    jr   z, jr_014_56B3                           ; $5697: $28 $1A
    cp   UNKNOWN_ROOM_E4                          ; $5699: $FE $E4
    jr   z, jr_014_56B3                           ; $569B: $28 $16
    cp   UNKNOWN_ROOM_FF                          ; $569D: $FE $FF
    jr   nz, .jr_56A9                             ; $569F: $20 $08

    ldh  a, [hObjectUnderEntity]                  ; $56A1: $F0 $AF
    cp   $20                                      ; $56A3: $FE $20
    jr   nz, jr_014_56B3                          ; $56A5: $20 $0C

    jr   jr_014_56B7                              ; $56A7: $18 $0E

.jr_56A9
    cp   $75                                      ; $56A9: $FE $75
    jr   nz, jr_014_56B7                          ; $56AB: $20 $0A

    ldh  a, [hObjectUnderEntity]                  ; $56AD: $F0 $AF
    cp   $20                                      ; $56AF: $FE $20
    jr   nz, jr_014_56B7                          ; $56B1: $20 $04

jr_014_56B3:
    ld   c, $03                                   ; $56B3: $0E $03
    jr   jr_014_56B9                              ; $56B5: $18 $02

jr_014_56B7:
    ld   c, $04                                   ; $56B7: $0E $04

jr_014_56B9:
    ld   b, $00                                   ; $56B9: $06 $00
    sla  c                                        ; $56BB: $CB $21
    rl   b                                        ; $56BD: $CB $10
    sla  c                                        ; $56BF: $CB $21
    rl   b                                        ; $56C1: $CB $10
    ld   a, $14                                   ; $56C3: $3E $14
    call func_91D.jp_92E                          ; $56C5: $CD $2E $09
    pop  bc                                       ; $56C8: $C1

jr_014_56C9:
    ld   hl, wDrawCommand                         ; $56C9: $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ; $56CC: $FA $00 $D6
    ld   e, a                                     ; $56CF: $5F
    add  $0A                                      ; $56D0: $C6 $0A
    ld   [wDrawCommandsSize], a                   ; $56D2: $EA $00 $D6
    ld   d, $00                                   ; $56D5: $16 $00
    add  hl, de                                   ; $56D7: $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $56D8: $F0 $CF
    ld   [hl+], a                                 ; $56DA: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $56DB: $F0 $D0
    ld   [hl+], a                                 ; $56DD: $22
    ld   a, $81                                   ; $56DE: $3E $81
    ld   [hl+], a                                 ; $56E0: $22
    ldh  a, [hIsGBC]                              ; $56E1: $F0 $FE
    and  a                                        ; $56E3: $A7
    jr   z, jr_014_5712                           ; $56E4: $28 $2C

    ldh  a, [hMapRoom]                            ; $56E6: $F0 $F6
    cp   ROOM_SECTION_OW_SOUTH_OF_TAL_TAL_HEIGHTS ; $56E8: $FE $20
    jr   c, jr_014_5729                           ; $56EA: $38 $3D

    cp   UNKNOWN_ROOM_E0                          ; $56EC: $FE $E0
    jr   z, jr_014_5729                           ; $56EE: $28 $39
    cp   UNKNOWN_ROOM_E1                          ; $56F0: $FE $E1
    jr   z, jr_014_5729                           ; $56F2: $28 $35
    cp   UNKNOWN_ROOM_E3                          ; $56F4: $FE $E3
    jr   z, jr_014_5729                           ; $56F6: $28 $31
    cp   UNKNOWN_ROOM_E4                          ; $56F8: $FE $E4
    jr   z, jr_014_5729                           ; $56FA: $28 $2D
    cp   UNKNOWN_ROOM_FF                          ; $56FC: $FE $FF
    jr   nz, .jr_5708                             ; $56FE: $20 $08

    ldh  a, [hObjectUnderEntity]                  ; $5700: $F0 $AF
    cp   $20                                      ; $5702: $FE $20
    jr   nz, jr_014_5729                          ; $5704: $20 $23

    jr   jr_014_5712                              ; $5706: $18 $0A

.jr_5708
    cp   $75                                      ; $5708: $FE $75
    jr   nz, jr_014_5712                          ; $570A: $20 $06

    ldh  a, [hObjectUnderEntity]                  ; $570C: $F0 $AF
    cp   $20                                      ; $570E: $FE $20
    jr   z, jr_014_5729                           ; $5710: $28 $17

jr_014_5712:
    ld   a, $5A                                   ; $5712: $3E $5A
    ld   [hl+], a                                 ; $5714: $22
    ld   a, $7F                                   ; $5715: $3E $7F
    ld   [hl+], a                                 ; $5717: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $5718: $F0 $CF
    ld   [hl+], a                                 ; $571A: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $571B: $F0 $D0
    inc  a                                        ; $571D: $3C
    ld   [hl+], a                                 ; $571E: $22
    ld   a, $81                                   ; $571F: $3E $81
    ld   [hl+], a                                 ; $5721: $22
    ld   a, $7F                                   ; $5722: $3E $7F
    ld   [hl+], a                                 ; $5724: $22
    ld   a, $5A                                   ; $5725: $3E $5A
    jr   label_014_573E                           ; $5727: $18 $15

jr_014_5729:
    ld   a, $76                                   ; $5729: $3E $76
    ld   [hl+], a                                 ; $572B: $22
    ld   a, $76                                   ; $572C: $3E $76
    ld   [hl+], a                                 ; $572E: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $572F: $F0 $CF
    ld   [hl+], a                                 ; $5731: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $5732: $F0 $D0
    inc  a                                        ; $5734: $3C
    ld   [hl+], a                                 ; $5735: $22
    ld   a, $81                                   ; $5736: $3E $81
    ld   [hl+], a                                 ; $5738: $22
    ld   a, $76                                   ; $5739: $3E $76
    ld   [hl+], a                                 ; $573B: $22
    ld   a, $76                                   ; $573C: $3E $76

label_014_573E:
    ld   [hl+], a                                 ; $573E: $22
    ld   a, $00                                   ; $573F: $3E $00
    ld   [hl+], a                                 ; $5741: $22
    ret                                           ; $5742: $C9

label_014_5743:
    ldh  a, [hMapRoom]                            ; $5743: $F0 $F6
    cp   UNKNOWN_ROOM_75                          ; $5745: $FE $75
    jr   z, .jr_5756                              ; $5747: $28 $0D
    cp   ROOM_OW_RIGHT_OF_EGG                     ; $5749: $FE $07
    jr   z, .jr_5756                              ; $574B: $28 $09
    cp   UNKNOWN_ROOM_AA                          ; $574D: $FE $AA
    jr   z, .jr_5756                              ; $574F: $28 $05
    cp   UNKNOWN_ROOM_4A                          ; $5751: $FE $4A
    jp   nz, label_014_57E1                       ; $5753: $C2 $E1 $57

.jr_5756
    ld   hl, wRoomObjects                         ; $5756: $21 $11 $D7
    add  hl, de                                   ; $5759: $19
    push hl                                       ; $575A: $E5
    ldh  a, [hMapRoom]                            ; $575B: $F0 $F6
    ld   e, a                                     ; $575D: $5F
    ld   d, $00                                   ; $575E: $16 $00
    ld   hl, wOverworldRoomStatus                 ; $5760: $21 $00 $D8
    add  hl, de                                   ; $5763: $19
    set  OW_ROOM_STATUS_FLAG_CHANGED, [hl]        ; $5764: $CB $E6
    pop  hl                                       ; $5766: $E1

label_014_5767:
    ld   [hl], $C6                                ; $5767: $36 $C6
    ld   a, $94                                   ; $5769: $3E $94
    call BackupObjectInRAM2                       ; $576B: $CD $2F $0B
    call label_2887                               ; $576E: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $5771: $F0 $FE
    and  a                                        ; $5773: $A7
    jr   z, .jr_5789                              ; $5774: $28 $13

    push bc                                       ; $5776: $C5
    ld   c, $C6                                   ; $5777: $0E $C6
    ld   b, $00                                   ; $5779: $06 $00
    sla  c                                        ; $577B: $CB $21
    rl   b                                        ; $577D: $CB $10
    sla  c                                        ; $577F: $CB $21
    rl   b                                        ; $5781: $CB $10
    ld   a, $14                                   ; $5783: $3E $14
    call func_91D.jp_92E                          ; $5785: $CD $2E $09
    pop  bc                                       ; $5788: $C1

.jr_5789
    ; Make staircase appear
    ld   hl, wDrawCommand                         ; $5789: $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ; $578C: $FA $00 $D6
    ld   e, a                                     ; $578F: $5F
    add  $0A                                      ; $5790: $C6 $0A
    ld   [wDrawCommandsSize], a                   ; $5792: $EA $00 $D6
    ld   d, $00                                   ; $5795: $16 $00
    add  hl, de                                   ; $5797: $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $5798: $F0 $CF
    ld   [hl+], a                                 ; $579A: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $579B: $F0 $D0
    ld   [hl+], a                                 ; $579D: $22
    ld   a, $81                                   ; $579E: $3E $81
    ld   [hl+], a                                 ; $57A0: $22
    ld   a, $68                                   ; $57A1: $3E $68
    ld   [hl+], a                                 ; $57A3: $22
    ld   a, $77                                   ; $57A4: $3E $77
    ld   [hl+], a                                 ; $57A6: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $57A7: $F0 $CF
    ld   [hl+], a                                 ; $57A9: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $57AA: $F0 $D0
    inc  a                                        ; $57AC: $3C
    ld   [hl+], a                                 ; $57AD: $22
    ld   a, $81                                   ; $57AE: $3E $81
    ld   [hl+], a                                 ; $57B0: $22
    ld   a, $69                                   ; $57B1: $3E $69
    ld   [hl+], a                                 ; $57B3: $22
    ld   a, $4B                                   ; $57B4: $3E $4B
    ld   [hl+], a                                 ; $57B6: $22
    ld   [hl], $00                                ; $57B7: $36 $00
    ld   a, STAIRCASE_INACTIVE                    ; $57B9: $3E $01
    ldh  [hStaircase], a                          ; $57BB: $E0 $AC
    ldh  a, [hIntersectedObjectTop]               ; $57BD: $F0 $CD
    and  $F0                                      ; $57BF: $E6 $F0
    add  $10                                      ; $57C1: $C6 $10
    ldh  [hStaircasePosY], a                      ; $57C3: $E0 $AE
    ldh  a, [hIntersectedObjectLeft]              ; $57C5: $F0 $CE
    and  $F0                                      ; $57C7: $E6 $F0
    add  $08                                      ; $57C9: $C6 $08
    ldh  [hStaircasePosX], a                      ; $57CB: $E0 $AD
    ldh  a, [hIntersectedObjectLeft]              ; $57CD: $F0 $CE
    swap a                                        ; $57CF: $CB $37
    and  $0F                                      ; $57D1: $E6 $0F
    ld   e, a                                     ; $57D3: $5F
    ldh  a, [hIntersectedObjectTop]               ; $57D4: $F0 $CD
    and  $F0                                      ; $57D6: $E6 $F0
    or   e                                        ; $57D8: $B3
    ld   [wWarp0PositionTileIndex], a             ; $57D9: $EA $16 $D4
    ld   a, JINGLE_PUZZLE_SOLVED                  ; $57DC: $3E $02
    ldh  [hJingle], a                             ; $57DE: $E0 $F2
    ret                                           ; $57E0: $C9

label_014_57E1:
    ld   hl, wRoomObjects                         ; $57E1: $21 $11 $D7
    add  hl, de                                   ; $57E4: $19
    ld   [hl], $E8                                ; $57E5: $36 $E8
    ld   a, $94                                   ; $57E7: $3E $94
    call BackupObjectInRAM2                       ; $57E9: $CD $2F $0B
    call label_2887                               ; $57EC: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $57EF: $F0 $FE
    and  a                                        ; $57F1: $A7
    jr   z, .jr_5807                              ; $57F2: $28 $13

    push bc                                       ; $57F4: $C5
    ld   c, $E8                                   ; $57F5: $0E $E8
    ld   b, $00                                   ; $57F7: $06 $00
    sla  c                                        ; $57F9: $CB $21
    rl   b                                        ; $57FB: $CB $10
    sla  c                                        ; $57FD: $CB $21
    rl   b                                        ; $57FF: $CB $10
    ld   a, $14                                   ; $5801: $3E $14
    call func_91D.jp_92E                          ; $5803: $CD $2E $09
    pop  bc                                       ; $5806: $C1

.jr_5807
    ld   hl, wDrawCommand                         ; $5807: $21 $01 $D6
    ld   a, [wDrawCommandsSize]                   ; $580A: $FA $00 $D6
    ld   e, a                                     ; $580D: $5F
    add  $0A                                      ; $580E: $C6 $0A
    ld   [wDrawCommandsSize], a                   ; $5810: $EA $00 $D6
    ld   d, $00                                   ; $5813: $16 $00
    add  hl, de                                   ; $5815: $19
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $5816: $F0 $CF
    ld   [hl+], a                                 ; $5818: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $5819: $F0 $D0
    ld   [hl+], a                                 ; $581B: $22
    ld   a, $81                                   ; $581C: $3E $81
    ld   [hl+], a                                 ; $581E: $22
    ld   a, $68                                   ; $581F: $3E $68
    ld   [hl+], a                                 ; $5821: $22
    ld   a, $78                                   ; $5822: $3E $78
    ld   [hl+], a                                 ; $5824: $22
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $5825: $F0 $CF
    ld   [hl+], a                                 ; $5827: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $5828: $F0 $D0
    inc  a                                        ; $582A: $3C
    ld   [hl+], a                                 ; $582B: $22
    ld   a, $81                                   ; $582C: $3E $81
    ld   [hl+], a                                 ; $582E: $22
    ld   a, $69                                   ; $582F: $3E $69
    ld   [hl+], a                                 ; $5831: $22
    ld   a, $79                                   ; $5832: $3E $79
    ld   [hl+], a                                 ; $5834: $22
    ld   [hl], $00                                ; $5835: $36 $00
    ret                                           ; $5837: $C9

func_014_5838::
    ld   hl, MapLayout11                          ; $5838: $21 $E0 $44
    ldh  a, [hMapId]                              ; $583B: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $583D: $FE $FF
    jr   z, .jr_5866                              ; $583F: $28 $25

    cp   $0B                                      ; $5841: $FE $0B
    jr   nc, ret_014_5883                         ; $5843: $30 $3E

    ld   hl, MapLayout0                           ; $5845: $21 $20 $42
    swap a                                        ; $5848: $CB $37
    ld   c, a                                     ; $584A: $4F
    ld   b, $00                                   ; $584B: $06 $00
    sla  c                                        ; $584D: $CB $21
    rl   b                                        ; $584F: $CB $10
    sla  c                                        ; $5851: $CB $21
    rl   b                                        ; $5853: $CB $10
    add  hl, bc                                   ; $5855: $09
    ldh  a, [hMapId]                              ; $5856: $F0 $F7
    cp   MAP_EAGLES_TOWER                         ; $5858: $FE $06
    jr   nz, .jr_5866                             ; $585A: $20 $0A

    ld   a, [wHasInstrument7]                     ; $585C: $FA $6B $DB
    and  $04                                      ; $585F: $E6 $04
    jr   z, .jr_5866                              ; $5861: $28 $03

    ld   hl, MapLayout12                          ; $5863: $21 $20 $45

.jr_5866
    add  hl, de                                   ; $5866: $19
    ld   a, [hl]                                  ; $5867: $7E
    ld   e, a                                     ; $5868: $5F
    ld   d, $00                                   ; $5869: $16 $00
    ld   hl, wIndoorARoomStatus                   ; $586B: $21 $00 $D9
    ldh  a, [hMapId]                              ; $586E: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $5870: $FE $FF
    jr   nz, .jr_5879                             ; $5872: $20 $05

    ld   hl, wColorDungeonRoomStatus              ; $5874: $21 $E0 $DD
    jr   jr_014_5882                              ; $5877: $18 $09

.jr_5879
    cp   $1A                                      ; $5879: $FE $1A
    jr   nc, jr_014_5882                          ; $587B: $30 $05

    cp   $06                                      ; $587D: $FE $06
    jr   c, jr_014_5882                           ; $587F: $38 $01

    inc  d                                        ; $5881: $14

jr_014_5882:
    add  hl, de                                   ; $5882: $19

ret_014_5883:
    ret                                           ; $5883: $C9

; Retrieve the status of chests in the given room
; Inputs:
;   d    is room indoor
;   e    room id
; Output:
;   a    status of chests (eg. $19, $1A, etc.)
GetChestsStatusForRoom::
    ldh  a, [hMapId]                              ; $5884: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $5886: $FE $FF
    jr   nz, .jr_5891                             ; $5888: $20 $07

    ld   d, $00                                   ; $588A: $16 $00
    ld   hl, ColorDungeonRoomChestsTable          ; $588C: $21 $60 $48
    jr   jr_014_5894                              ; $588F: $18 $03

.jr_5891
    ld   hl, RoomChestsTable                      ; $5891: $21 $60 $45

jr_014_5894:
    add  hl, de                                   ; $5894: $19
    ld   a, [hl]                                  ; $5895: $7E
    ret                                           ; $5896: $C9

func_014_5897::
    ldh  a, [hMapId]                              ; $5897: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $5899: $FE $FF
    jr   nz, .jr_58A2                             ; $589B: $20 $05

    ld   hl, MapLayout11                          ; $589D: $21 $E0 $44
    jr   jr_014_58C7                              ; $58A0: $18 $25

.jr_58A2
    cp   $0B                                      ; $58A2: $FE $0B
    jr   nc, jr_014_58D1                          ; $58A4: $30 $2B

    ld   hl, MapLayout0                           ; $58A6: $21 $20 $42
    swap a                                        ; $58A9: $CB $37
    ld   e, a                                     ; $58AB: $5F
    ld   d, $00                                   ; $58AC: $16 $00
    sla  e                                        ; $58AE: $CB $23
    rl   d                                        ; $58B0: $CB $12
    sla  e                                        ; $58B2: $CB $23
    rl   d                                        ; $58B4: $CB $12
    add  hl, de                                   ; $58B6: $19
    ldh  a, [hMapId]                              ; $58B7: $F0 $F7
    cp   MAP_EAGLES_TOWER                         ; $58B9: $FE $06
    jr   nz, jr_014_58C7                          ; $58BB: $20 $0A

    ld   a, [wHasInstrument7]                     ; $58BD: $FA $6B $DB
    and  $04                                      ; $58C0: $E6 $04
    jr   z, jr_014_58C7                           ; $58C2: $28 $03

    ld   hl, MapLayout12                          ; $58C4: $21 $20 $45

jr_014_58C7:
    ld   a, [wIndoorRoom]                         ; $58C7: $FA $AE $DB
    ld   e, a                                     ; $58CA: $5F
    ld   d, $00                                   ; $58CB: $16 $00
    add  hl, de                                   ; $58CD: $19
    ld   a, [hl]                                  ; $58CE: $7E
    ldh  [hMapRoom], a                            ; $58CF: $E0 $F6

jr_014_58D1:
    ldh  a, [hMapRoom]                            ; $58D1: $F0 $F6
    ld   c, a                                     ; $58D3: $4F
    ld   b, $00                                   ; $58D4: $06 $00
    ldh  a, [hMapId]                              ; $58D6: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $58D8: $FE $FF
    jr   nz, .jr_58E1                             ; $58DA: $20 $05

    ld   hl, ColorDungeonEventsTable              ; $58DC: $21 $00 $42
    jr   jr_014_58ED                              ; $58DF: $18 $0C

.jr_58E1
    cp   $1A                                      ; $58E1: $FE $1A
    jr   nc, .jr_58EA                             ; $58E3: $30 $05

    cp   $06                                      ; $58E5: $FE $06
    jr   c, .jr_58EA                              ; $58E7: $38 $01

    inc  b                                        ; $58E9: $04

.jr_58EA
    ld   hl, DungeonEventsTable                   ; $58EA: $21 $00 $40

jr_014_58ED:
    add  hl, bc                                   ; $58ED: $09
    ld   a, [hl]                                  ; $58EE: $7E
    ld   [wRoomEvent], a                          ; $58EF: $EA $8E $C1
    xor  a                                        ; $58F2: $AF
    ld   [wC18A], a                               ; $58F3: $EA $8A $C1
    ld   [wC18B], a                               ; $58F6: $EA $8B $C1
    ld   [wC190], a                               ; $58F9: $EA $90 $C1
    ld   [wRoomEventEffectExecuted], a            ; $58FC: $EA $8F $C1
    ret                                           ; $58FF: $C9

func_014_5900::
    ldh  a, [hMapRoom]                            ; $5900: $F0 $F6
    ld   e, a                                     ; $5902: $5F
    ld   a, [wIsIndoor]                           ; $5903: $FA $A5 $DB
    ld   d, a                                     ; $5906: $57
    ldh  a, [hMapId]                              ; $5907: $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ; $5909: $FE $FF
    jr   nz, .jr_5914                             ; $590B: $20 $07

    ld   d, $00                                   ; $590D: $16 $00
    ld   hl, ColorDungeonRoomChestsTable          ; $590F: $21 $60 $48
    jr   jr_014_5920                              ; $5912: $18 $0C

.jr_5914
    cp   $1A                                      ; $5914: $FE $1A
    jr   nc, .jr_591D                             ; $5916: $30 $05

    cp   $06                                      ; $5918: $FE $06
    jr   c, .jr_591D                              ; $591A: $38 $01

    inc  d                                        ; $591C: $14

.jr_591D
    ld   hl, RoomChestsTable                      ; $591D: $21 $60 $45

jr_014_5920:
    add  hl, de                                   ; $5920: $19
    ld   a, [hl]                                  ; $5921: $7E
    cp   $20                                      ; $5922: $FE $20
    jr   nz, .jr_5931                             ; $5924: $20 $0B

    ld   a, [wSwordLevel]                         ; $5926: $FA $4E $DB
    cp   $02                                      ; $5929: $FE $02
    ld   a, $20                                   ; $592B: $3E $20
    jr   c, .jr_5931                              ; $592D: $38 $02

    ld   a, $1C                                   ; $592F: $3E $1C

.jr_5931
    ldh  [hMultiPurpose8], a                      ; $5931: $E0 $DF
    ret                                           ; $5933: $C9
