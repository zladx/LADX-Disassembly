; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

PlayDoorUnlockedSfx::
    ld   a, NOISE_SFX_DOOR_UNLOCKED               ; $4000: $3E $04
    ldh  [hNoiseSfx], a                           ; $4002: $E0 $F4
    ret                                           ; $4004: $C9

GetEntitySpeedYAddress::
    ld   hl, wEntitiesSpeedYTable                 ; $4005: $21 $50 $C2
    add  hl, bc                                   ; $4008: $09
    ret                                           ; $4009: $C9

include "code/entities/07_bushcrawler.asm"
include "code/entities/07_fisherman_under_bridge.asm"
include "code/entities/07_mermaid.asm"
include "code/entities/07_papahl.asm"
include "code/entities/07_bear.asm"
include "code/entities/07_honeycomb.asm"
include "code/entities/07_tarinbeekeeper.asm"
include "code/entities/07_holefiller.asm"
include "code/entities/07_pincer.asm"
include "code/entities/07_tradingitem.asm"
include "code/entities/07_wingedoctorok.asm"
include "code/entities/07_kiki.asm"
include "code/entities/07_blooper.asm"
include "code/entities/07_smashablepillar.asm"
include "code/entities/07_wreckingball.asm"
include "code/entities/07_sideviewweights.asm"
include "code/entities/07_sideviewplatform.asm"
include "code/entities/07_goomba.asm"
include "code/entities/07_peahat.asm"

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SnakeSpriteVariants::
.variant0
    db $44, $03
    db $46, $03
.variant1
    db $44, $03
    db $48, $03
.variant2
    db $46, $23
    db $44, $23
.variant3
    db $48, $23
    db $44, $23

SnakeEntityHandler::
    ld   hl, wEntitiesDirectionTable              ; $684E: $21 $80 $C3
    add  hl, bc                                   ; $6851: $09
    ldh  a, [hActiveEntitySpriteVariant]          ; $6852: $F0 $F1
    add  [hl]                                     ; $6854: $86
    ldh  [hActiveEntitySpriteVariant], a          ; $6855: $E0 $F1
    ld   de, SnakeSpriteVariants                  ; $6857: $11 $3E $68
    call RenderActiveEntitySpritesPair            ; $685A: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $685D: $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ; $6860: $CD $C3 $7D
    call label_3B39                               ; $6863: $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ; $6866: $CD $0A $7E
    call label_3B23                               ; $6869: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $686C: $21 $A0 $C2
    add  hl, bc                                   ; $686F: $09
    ld   a, [hl]                                  ; $6870: $7E
    and  a                                        ; $6871: $A7
    jr   z, jr_007_6882                           ; $6872: $28 $0E

    call IncrementEntityState                     ; $6874: $CD $12 $3B
    ld   [hl], b                                  ; $6877: $70
    call GetEntityTransitionCountdown             ; $6878: $CD $05 $0C
    ld   [hl], $08                                ; $687B: $36 $08
    call GetEntityPrivateCountdown1               ; $687D: $CD $00 $0C
    ld   [hl], $20                                ; $6880: $36 $20

jr_007_6882:
    ldh  a, [hActiveEntityState]                  ; $6882: $F0 $F0
    JP_TABLE                                      ; $6884
._00 dw func_007_6897                             ; $6885
._01 dw func_007_68D8                             ; $6887
._02 dw func_007_6929                             ; $6889

Data_007_688B::
    db   $08, $F8, $00, $00

Data_007_688F::
    db   $00, $00, $F8, $08

Data_007_6893::
    db   $02, $00, $FF, $FF

func_007_6897::
    call GetEntityTransitionCountdown             ; $6897: $CD $05 $0C
    jr   nz, jr_007_68D0                          ; $689A: $20 $34

    call IncrementEntityState                     ; $689C: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $689F: $CD $05 $0C
    call GetRandomByte                            ; $68A2: $CD $0D $28
    and  $1F                                      ; $68A5: $E6 $1F
    add  $30                                      ; $68A7: $C6 $30
    ld   [hl], a                                  ; $68A9: $77
    and  $03                                      ; $68AA: $E6 $03
    ld   e, a                                     ; $68AC: $5F

func_007_68AD::
    ld   d, b                                     ; $68AD: $50
    ld   hl, Data_007_688B                        ; $68AE: $21 $8B $68
    add  hl, de                                   ; $68B1: $19
    ld   a, [hl]                                  ; $68B2: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $68B3: $21 $40 $C2
    add  hl, bc                                   ; $68B6: $09
    ld   [hl], a                                  ; $68B7: $77
    ld   hl, Data_007_688F                        ; $68B8: $21 $8F $68
    add  hl, de                                   ; $68BB: $19
    ld   a, [hl]                                  ; $68BC: $7E
    call GetEntitySpeedYAddress                   ; $68BD: $CD $05 $40
    ld   [hl], a                                  ; $68C0: $77
    ld   hl, Data_007_6893                        ; $68C1: $21 $93 $68
    add  hl, de                                   ; $68C4: $19
    ld   a, [hl]                                  ; $68C5: $7E
    cp   $FF                                      ; $68C6: $FE $FF
    jr   z, jr_007_68CF                           ; $68C8: $28 $05

    ld   hl, wEntitiesDirectionTable              ; $68CA: $21 $80 $C3
    add  hl, bc                                   ; $68CD: $09
    ld   [hl], a                                  ; $68CE: $77

jr_007_68CF:
    ret                                           ; $68CF: $C9

jr_007_68D0:
    call ClearEntitySpeed                         ; $68D0: $CD $7F $3D
    call func_007_68F0                            ; $68D3: $CD $F0 $68
    jr   jr_007_68E6                              ; $68D6: $18 $0E

func_007_68D8::
    call GetEntityTransitionCountdown             ; $68D8: $CD $05 $0C
    jr   nz, jr_007_68E3                          ; $68DB: $20 $06

    ld   [hl], $18                                ; $68DD: $36 $18
    call IncrementEntityState                     ; $68DF: $CD $12 $3B
    ld   [hl], b                                  ; $68E2: $70

jr_007_68E3:
    call func_007_68F0                            ; $68E3: $CD $F0 $68

jr_007_68E6:
    ldh  a, [hFrameCounter]                       ; $68E6: $F0 $E7
    rra                                           ; $68E8: $1F
    rra                                           ; $68E9: $1F
    rra                                           ; $68EA: $1F
    and  $01                                      ; $68EB: $E6 $01
    jp   SetEntitySpriteVariant                   ; $68ED: $C3 $0C $3B

func_007_68F0::
    call GetEntityPrivateCountdown1               ; $68F0: $CD $00 $0C
    jr   nz, jr_007_6919                          ; $68F3: $20 $24

    call func_007_7E5D                            ; $68F5: $CD $5D $7E
    add  $08                                      ; $68F8: $C6 $08
    cp   $10                                      ; $68FA: $FE $10
    jr   nc, jr_007_691A                          ; $68FC: $30 $1C

    call func_007_7E6D                            ; $68FE: $CD $6D $7E

jr_007_6901:
    call func_007_68AD                            ; $6901: $CD $AD $68
    ld   hl, wEntitiesSpeedXTable                 ; $6904: $21 $40 $C2
    add  hl, bc                                   ; $6907: $09
    sla  [hl]                                     ; $6908: $CB $26
    call GetEntitySpeedYAddress                   ; $690A: $CD $05 $40
    sla  [hl]                                     ; $690D: $CB $26
    call IncrementEntityState                     ; $690F: $CD $12 $3B
    ld   [hl], $02                                ; $6912: $36 $02
    call GetEntityTransitionCountdown             ; $6914: $CD $05 $0C
    ld   [hl], $30                                ; $6917: $36 $30

jr_007_6919:
    ret                                           ; $6919: $C9

jr_007_691A:
    call func_007_7E6D                            ; $691A: $CD $6D $7E
    add  $08                                      ; $691D: $C6 $08
    cp   $10                                      ; $691F: $FE $10
    jr   nc, jr_007_6928                          ; $6921: $30 $05

    call func_007_7E5D                            ; $6923: $CD $5D $7E
    jr   jr_007_6901                              ; $6926: $18 $D9

jr_007_6928:
    ret                                           ; $6928: $C9

func_007_6929::
    call GetEntityTransitionCountdown             ; $6929: $CD $05 $0C
    jr   nz, jr_007_6939                          ; $692C: $20 $0B

    ld   [hl], $20                                ; $692E: $36 $20
    call IncrementEntityState                     ; $6930: $CD $12 $3B
    ld   [hl], b                                  ; $6933: $70
    call GetEntityPrivateCountdown1               ; $6934: $CD $00 $0C
    ld   [hl], $40                                ; $6937: $36 $40

jr_007_6939:
    ldh  a, [hFrameCounter]                       ; $6939: $F0 $E7
    rra                                           ; $693B: $1F
    rra                                           ; $693C: $1F
    and  $01                                      ; $693D: $E6 $01
    jp   SetEntitySpriteVariant                   ; $693F: $C3 $0C $3B

Data_007_6942::
    db   $3A, $D5, $D6, $D7, $3A, $3A, $CD, $E1, $CE, $3A, $03, $09, $03, $09, $C6, $1B
    db   $1B, $03, $03, $09, $0E, $1B, $1B, $1B, $1B

Data_007_695B::
    db   $02, $12, $22, $32

Data_007_695F::
    db   $42, $00, $08, $10, $18, $20, $28, $30, $38, $40, $48

label_007_696A:
    call ReturnIfNonInteractive_07                ; $696A: $CD $96 $7D
    ld   a, $02                                   ; $696D: $3E $02
    ldh  [hLinkInteractiveMotionBlocked], a       ; $696F: $E0 $A1
    ld   [wC167], a                               ; $6971: $EA $67 $C1
    ldh  a, [hActiveEntityState]                  ; $6974: $F0 $F0
    JP_TABLE                                      ; $6976
._00 dw func_007_697F                             ; $6977
._01 dw func_007_698A                             ; $6979
._02 dw func_007_6996                             ; $697B
._03 dw func_007_69A2                             ; $697D

func_007_697F::
    call PlayDoorUnlockedSfx                      ; $697F: $CD $00 $40
    call GetEntityTransitionCountdown             ; $6982: $CD $05 $0C
    ld   [hl], $28                                ; $6985: $36 $28
    jp   IncrementEntityState                     ; $6987: $C3 $12 $3B

func_007_698A::
    call GetEntityTransitionCountdown             ; $698A: $CD $05 $0C
    ret  nz                                       ; $698D: $C0

jr_007_698E:
    ld   a, MUSIC_WATERFALL_DRAIN                 ; $698E: $3E $4C
    ld   [wMusicTrackToPlay], a                   ; $6990: $EA $68 $D3
    jp   IncrementEntityState                     ; $6993: $C3 $12 $3B

func_007_6996::
    ld   a, $1D                                   ; $6996: $3E $1D
    ldh  [hNoiseSfx], a                           ; $6998: $E0 $F4
    call GetEntityTransitionCountdown             ; $699A: $CD $05 $0C
    ld   [hl], $80                                ; $699D: $36 $80
    jp   IncrementEntityState                     ; $699F: $C3 $12 $3B

func_007_69A2::
    ldh  a, [hFrameCounter]                       ; $69A2: $F0 $E7
    ld   e, $00                                   ; $69A4: $1E $00
    and  $08                                      ; $69A6: $E6 $08
    jr   z, jr_007_69AC                           ; $69A8: $28 $02

    ld   e, $02                                   ; $69AA: $1E $02

jr_007_69AC:
    ld   a, e                                     ; $69AC: $7B
    ld   [wScreenShakeHorizontal], a              ; $69AD: $EA $55 $C1
    call GetEntityTransitionCountdown             ; $69B0: $CD $05 $0C
    ret  nz                                       ; $69B3: $C0

    ld   hl, wEntitiesPrivateState1Table          ; $69B4: $21 $B0 $C2
    add  hl, bc                                   ; $69B7: $09
    ld   a, [hl]                                  ; $69B8: $7E
    ld   e, a                                     ; $69B9: $5F
    inc  a                                        ; $69BA: $3C
    ld   [hl], a                                  ; $69BB: $77
    ldh  [hMultiPurposeG], a                      ; $69BC: $E0 $E8
    ld   a, e                                     ; $69BE: $7B
    and  $1F                                      ; $69BF: $E6 $1F
    jp   nz, label_007_69D0                       ; $69C1: $C2 $D0 $69

    ld   hl, wEntitiesInertiaTable                ; $69C4: $21 $D0 $C3
    add  hl, bc                                   ; $69C7: $09
    ld   a, [hl]                                  ; $69C8: $7E
    cp   $0A                                      ; $69C9: $FE $0A
    jp   z, label_007_6A34                        ; $69CB: $CA $34 $6A

    inc  a                                        ; $69CE: $3C
    ld   [hl], a                                  ; $69CF: $77

label_007_69D0:
    ld   hl, wEntitiesInertiaTable                ; $69D0: $21 $D0 $C3
    add  hl, bc                                   ; $69D3: $09
    push hl                                       ; $69D4: $E5
    ld   a, [hl]                                  ; $69D5: $7E
    ld   e, a                                     ; $69D6: $5F
    ld   d, b                                     ; $69D7: $50
    ld   hl, Data_007_695F                        ; $69D8: $21 $5F $69
    add  hl, de                                   ; $69DB: $19
    ld   a, [hl]                                  ; $69DC: $7E
    ldh  [hIntersectedObjectTop], a               ; $69DD: $E0 $CD
    ld   a, $20                                   ; $69DF: $3E $20
    ldh  [hIntersectedObjectLeft], a              ; $69E1: $E0 $CE
    call label_2887                               ; $69E3: $CD $87 $28
    pop  hl                                       ; $69E6: $E1
    ld   d, h                                     ; $69E7: $54
    ld   e, l                                     ; $69E8: $5D

    ld   hl, wFarcallParams                       ; $69E9: $21 $01 $DE
    ld   a, BANK(AnglersTunnelDoorEntityHandler)  ; $69EC: $3E $1A
    ld   [hl+], a                                 ; $69EE: $22
    ld   a, HIGH(AnglersTunnelDoorEntityHandler)  ; $69EF: $3E $71
    ld   [hl+], a                                 ; $69F1: $22
    ld   a, LOW(AnglersTunnelDoorEntityHandler)   ; $69F2: $3E $11
    ld   [hl+], a                                 ; $69F4: $22
    ld   a, BANK(@)                               ; $69F5: $3E $07
    ld   [hl], a                                  ; $69F7: $77
    call Farcall                                  ; $69F8: $CD $D7 $0B

    push bc                                       ; $69FB: $C5
    ld   hl, wEntitiesInertiaTable                ; $69FC: $21 $D0 $C3
    add  hl, bc                                   ; $69FF: $09
    ld   a, [hl]                                  ; $6A00: $7E
    dec  a                                        ; $6A01: $3D
    rra                                           ; $6A02: $1F
    and  $07                                      ; $6A03: $E6 $07
    push af                                       ; $6A05: $F5
    ld   e, a                                     ; $6A06: $5F
    ld   d, b                                     ; $6A07: $50
    ld   hl, Data_007_695B                        ; $6A08: $21 $5B $69
    add  hl, de                                   ; $6A0B: $19
    ld   e, [hl]                                  ; $6A0C: $5E
    ld   hl, wRoomObjects                         ; $6A0D: $21 $11 $D7
    add  hl, de                                   ; $6A10: $19
    ld   c, l                                     ; $6A11: $4D
    ld   b, h                                     ; $6A12: $44
    pop  af                                       ; $6A13: $F1
    ld   e, a                                     ; $6A14: $5F
    sla  a                                        ; $6A15: $CB $27
    sla  a                                        ; $6A17: $CB $27
    add  e                                        ; $6A19: $83
    ld   e, a                                     ; $6A1A: $5F
    ld   d, $00                                   ; $6A1B: $16 $00
    ld   hl, Data_007_6942                        ; $6A1D: $21 $42 $69
    add  hl, de                                   ; $6A20: $19
    ld   e, $05                                   ; $6A21: $1E $05

.loop_6A23:
    ld   a, [hl+]                                 ; $6A23: $2A
    ld   [bc], a                                  ; $6A24: $02
    push hl                                       ; $6A25: $E5
    ld   h, b                                     ; $6A26: $60
    ld   l, c                                     ; $6A27: $69
    ld   a, $87                                   ; $6A28: $3E $87
    call func_2BF                                 ; $6A2A: $CD $2F $0B
    pop  hl                                       ; $6A2D: $E1
    inc  bc                                       ; $6A2E: $03
    dec  e                                        ; $6A2F: $1D
    jr   nz, .loop_6A23                           ; $6A30: $20 $F1

    pop  bc                                       ; $6A32: $C1
    ret                                           ; $6A33: $C9

label_007_6A34:
    xor  a                                        ; $6A34: $AF
    ld   [wScreenShakeHorizontal], a              ; $6A35: $EA $55 $C1
    ld   [wC167], a                               ; $6A38: $EA $67 $C1
    call label_27DD                               ; $6A3B: $CD $DD $27
    jp   func_007_7EA4                            ; $6A3E: $C3 $A4 $7E

; Entity handler for:
;  - Master Stalfos
;  - Angler's Tunnel cascade
MasterStalfosEntityHandler::
    ld   hl, wEntitiesPrivateState4Table          ; $6A41: $21 $40 $C4
    add  hl, bc                                   ; $6A44: $09
    ld   a, [hl]                                  ; $6A45: $7E
    cp   $FF                                      ; $6A46: $FE $FF
    jp   z, label_007_696A                        ; $6A48: $CA $6A $69

    and  a                                        ; $6A4B: $A7
    jr   nz, jr_007_6A52                          ; $6A4C: $20 $04

    inc  [hl]                                     ; $6A4E: $34
    call func_007_6ED0                            ; $6A4F: $CD $D0 $6E

jr_007_6A52:
    call func_007_6FB1                            ; $6A52: $CD $B1 $6F
    ldh  a, [hActiveEntityStatus]                 ; $6A55: $F0 $EA
    cp   $05                                      ; $6A57: $FE $05
    jp   nz, label_007_7EAA                       ; $6A59: $C2 $AA $7E

    call ReturnIfNonInteractive_07                ; $6A5C: $CD $96 $7D
    call label_394D                               ; $6A5F: $CD $4D $39
    call BossIntro                                ; $6A62: $CD $E8 $3E
    ld   hl, wEntitiesFlashCountdownTable         ; $6A65: $21 $20 $C4
    add  hl, bc                                   ; $6A68: $09
    ld   a, [hl]                                  ; $6A69: $7E
    cp   $16                                      ; $6A6A: $FE $16
    jr   nz, jr_007_6A89                          ; $6A6C: $20 $1B

    ldh  a, [hActiveEntityState]                  ; $6A6E: $F0 $F0
    cp   $09                                      ; $6A70: $FE $09
    jr   nc, jr_007_6A84                          ; $6A72: $30 $10

    ld   [hl], b                                  ; $6A74: $70
    ld   hl, wEntitiesSpeedZTable                 ; $6A75: $21 $20 $C3
    add  hl, bc                                   ; $6A78: $09
    ld   [hl], b                                  ; $6A79: $70
    call IncrementEntityState                     ; $6A7A: $CD $12 $3B
    ld   a, $09                                   ; $6A7D: $3E $09
    ld   [hl], a                                  ; $6A7F: $77
    ldh  [hActiveEntityState], a                  ; $6A80: $E0 $F0
    jr   jr_007_6A89                              ; $6A82: $18 $05

jr_007_6A84:
    ld   hl, wEntitiesInertiaTable                ; $6A84: $21 $D0 $C3
    add  hl, bc                                   ; $6A87: $09
    inc  [hl]                                     ; $6A88: $34

jr_007_6A89:
    call ApplyRecoilIfNeeded_07                   ; $6A89: $CD $C3 $7D
    call AddEntityZSpeedToPos_07                  ; $6A8C: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $6A8F: $21 $20 $C3
    add  hl, bc                                   ; $6A92: $09
    dec  [hl]                                     ; $6A93: $35
    dec  [hl]                                     ; $6A94: $35
    ld   hl, wEntitiesPosZTable                   ; $6A95: $21 $10 $C3
    add  hl, bc                                   ; $6A98: $09
    ld   a, [hl]                                  ; $6A99: $7E
    and  $80                                      ; $6A9A: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $6A9C: $E0 $E8
    jr   z, jr_007_6AA6                           ; $6A9E: $28 $06

    ld   [hl], b                                  ; $6AA0: $70
    ld   hl, wEntitiesSpeedZTable                 ; $6AA1: $21 $20 $C3
    add  hl, bc                                   ; $6AA4: $09
    ld   [hl], b                                  ; $6AA5: $70

jr_007_6AA6:
    ldh  a, [hActiveEntityState]                  ; $6AA6: $F0 $F0
    cp   $09                                      ; $6AA8: $FE $09
    jr   nc, jr_007_6AC0                          ; $6AAA: $30 $14

    call label_3B65                               ; $6AAC: $CD $65 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $6AAF: $21 $10 $C4
    add  hl, bc                                   ; $6AB2: $09
    ld   a, [wIgnoreLinkCollisionsCountdown]      ; $6AB3: $FA $3E $C1
    or   [hl]                                     ; $6AB6: $B6
    and  a                                        ; $6AB7: $A7
    jr   nz, jr_007_6AC0                          ; $6AB8: $20 $06

    call CheckLinkCollisionWithEnemy_trampoline   ; $6ABA: $CD $5A $3B
    call label_3B70                               ; $6ABD: $CD $70 $3B

jr_007_6AC0:
    ldh  a, [hActiveEntityState]                  ; $6AC0: $F0 $F0
     JP_TABLE                                      ; $6AC2
._00 dw func_007_6ADF                             ; $6AC3
._01 dw func_007_6AF5                             ; $6AC5
._02 dw func_007_6B16                             ; $6AC7
._03 dw func_007_6B68                             ; $6AC9
._04 dw func_007_6BC8                             ; $6ACB
._05 dw func_007_6BF4                             ; $6ACD
._06 dw func_007_6C39                             ; $6ACF
._07 dw func_007_6D18                             ; $6AD1
._08 dw func_007_6D5F                             ; $6AD3
._09 dw func_007_6D7F                             ; $6AD5
._0A dw func_007_6D9F                             ; $6AD7
._0B dw func_007_6DD9                             ; $6AD9
._0C dw func_007_6DF6                             ; $6ADB
._0D dw func_007_6E58                             ; $6ADD

func_007_6ADF::
    ld   hl, wEntitiesSpeedZTable                 ; $6ADF: $21 $20 $C3
    add  hl, bc                                   ; $6AE2: $09
    ld   [hl], b                                  ; $6AE3: $70
    call GetEntityTransitionCountdown             ; $6AE4: $CD $05 $0C
    jr   nz, jr_007_6AF4                          ; $6AE7: $20 $0B

    ld   [hl], $30                                ; $6AE9: $36 $30
    call IncrementEntityState                     ; $6AEB: $CD $12 $3B
    ld   hl, wEntitiesPosZTable                   ; $6AEE: $21 $10 $C3
    add  hl, bc                                   ; $6AF1: $09
    ld   [hl], $6F                                ; $6AF2: $36 $6F

jr_007_6AF4:
    ret                                           ; $6AF4: $C9

func_007_6AF5::
    call GetEntityTransitionCountdown             ; $6AF5: $CD $05 $0C
    jr   z, jr_007_6B08                           ; $6AF8: $28 $0E

    cp   $01                                      ; $6AFA: $FE $01
    jr   nz, jr_007_6B02                          ; $6AFC: $20 $04

    ld   a, JINGLE_JUMP_DOWN                      ; $6AFE: $3E $08
    ldh  [hJingle], a                             ; $6B00: $E0 $F2

jr_007_6B02:
    ld   hl, wEntitiesSpeedZTable                 ; $6B02: $21 $20 $C3
    add  hl, bc                                   ; $6B05: $09
    ld   [hl], b                                  ; $6B06: $70
    ret                                           ; $6B07: $C9

jr_007_6B08:
    ldh  a, [hMultiPurposeG]                      ; $6B08: $F0 $E8
    and  a                                        ; $6B0A: $A7
    jr   z, jr_007_6B15                           ; $6B0B: $28 $08

    call GetEntityTransitionCountdown             ; $6B0D: $CD $05 $0C
    ld   [hl], $40                                ; $6B10: $36 $40
    call IncrementEntityState                     ; $6B12: $CD $12 $3B

jr_007_6B15:
    ret                                           ; $6B15: $C9

func_007_6B16::
    call GetEntityTransitionCountdown             ; $6B16: $CD $05 $0C
    cp   $01                                      ; $6B19: $FE $01
    jr   nz, jr_007_6B33                          ; $6B1B: $20 $16

    ld   e, $12                                   ; $6B1D: $1E $12
    ldh  a, [hMapRoom]                            ; $6B1F: $F0 $F6
    cp   ROOM_INDOOR_A_MASTER_STALFOS_2           ; $6B21: $FE $92
    jr   z, jr_007_6B2F                           ; $6B23: $28 $0A
    cp   ROOM_INDOOR_A_MASTER_STALFOS_3           ; $6B25: $FE $84
    jr   z, jr_007_6B2F                           ; $6B27: $28 $06
    cp   ROOM_INDOOR_A_MASTER_STALFOS_FINAL       ; $6B29: $FE $80
    jr   nz, jr_007_6B33                          ; $6B2B: $20 $06

    ld   e, $14                                   ; $6B2D: $1E $14

jr_007_6B2F:
    ld   a, e                                     ; $6B2F: $7B
    call OpenDialogInTable1                       ; $6B30: $CD $73 $23

jr_007_6B33:
    call GetEntityTransitionCountdown             ; $6B33: $CD $05 $0C
    jr   nz, jr_007_6B45                          ; $6B36: $20 $0D

    ld   [hl], $A0                                ; $6B38: $36 $A0
    ldh  a, [hMapRoom]                            ; $6B3A: $F0 $F6
    cp   UNKNOWN_ROOM_95                          ; $6B3C: $FE $95
    jr   z, jr_007_6B42                           ; $6B3E: $28 $02

jr_007_6B40:
    ld   [hl], $20                                ; $6B40: $36 $20

jr_007_6B42:
    jp   IncrementEntityState                     ; $6B42: $C3 $12 $3B

jr_007_6B45:
    ld   hl, wD20E                                ; $6B45: $21 $0E $D2
    ld   [hl], $F0                                ; $6B48: $36 $F0
    ld   hl, wD20B                                ; $6B4A: $21 $0B $D2
    ld   [hl], $F8                                ; $6B4D: $36 $F8
    ld   hl, wD20D                                ; $6B4F: $21 $0D $D2
    ld   [hl], $F0                                ; $6B52: $36 $F0
    cp   $20                                      ; $6B54: $FE $20
    jr   c, jr_007_6B67                           ; $6B56: $38 $0F

    ld   hl, wD20E                                ; $6B58: $21 $0E $D2
    ld   [hl], $F2                                ; $6B5B: $36 $F2
    ld   hl, wD20B                                ; $6B5D: $21 $0B $D2
    ld   [hl], $FA                                ; $6B60: $36 $FA
    ld   hl, wD20D                                ; $6B62: $21 $0D $D2
    ld   [hl], $F2                                ; $6B65: $36 $F2

jr_007_6B67:
    ret                                           ; $6B67: $C9

func_007_6B68::
    call GetEntityTransitionCountdown             ; $6B68: $CD $05 $0C
    jr   nz, jr_007_6B72                          ; $6B6B: $20 $05

    ld   [hl], $20                                ; $6B6D: $36 $20
    jp   IncrementEntityState                     ; $6B6F: $C3 $12 $3B

jr_007_6B72:
    and  $3F                                      ; $6B72: $E6 $3F
    jr   nz, jr_007_6B76                          ; $6B74: $20 $00

jr_007_6B76:
    call GetEntityTransitionCountdown             ; $6B76: $CD $05 $0C
    and  $40                                      ; $6B79: $E6 $40
    jr   z, func_007_6BA3                         ; $6B7B: $28 $26

func_007_6B7D::
    call func_007_6EF0                            ; $6B7D: $CD $F0 $6E
    ld   hl, wD208                                ; $6B80: $21 $08 $D2
    ld   [hl], $01                                ; $6B83: $36 $01
    ld   hl, wD209                                ; $6B85: $21 $09 $D2
    ld   [hl], b                                  ; $6B88: $70
    ld   hl, wD20A                                ; $6B89: $21 $0A $D2
    ld   [hl], $F0                                ; $6B8C: $36 $F0
    ld   hl, wD20B                                ; $6B8E: $21 $0B $D2
    ld   [hl], $F8                                ; $6B91: $36 $F8
    ld   hl, wD20D                                ; $6B93: $21 $0D $D2
    ld   [hl], $F3                                ; $6B96: $36 $F3
    ld   hl, wD20C                                ; $6B98: $21 $0C $D2
    ld   [hl], $10                                ; $6B9B: $36 $10
    ld   hl, wD207                                ; $6B9D: $21 $07 $D2
    ld   [hl], $00                                ; $6BA0: $36 $00
    ret                                           ; $6BA2: $C9

func_007_6BA3::
    call func_007_6EF0                            ; $6BA3: $CD $F0 $6E
    ld   hl, wD208                                ; $6BA6: $21 $08 $D2
    ld   [hl], b                                  ; $6BA9: $70
    ld   hl, wD209                                ; $6BAA: $21 $09 $D2
    ld   [hl], b                                  ; $6BAD: $70
    ld   hl, wD20A                                ; $6BAE: $21 $0A $D2
    ld   [hl], $F8                                ; $6BB1: $36 $F8
    ld   hl, wD20B                                ; $6BB3: $21 $0B $D2
    ld   [hl], $F8                                ; $6BB6: $36 $F8
    ld   hl, wD20D                                ; $6BB8: $21 $0D $D2
    ld   [hl], $F0                                ; $6BBB: $36 $F0
    ld   hl, wD20C                                ; $6BBD: $21 $0C $D2
    ld   [hl], $10                                ; $6BC0: $36 $10
    ld   hl, wD207                                ; $6BC2: $21 $07 $D2
    ld   [hl], $00                                ; $6BC5: $36 $00
    ret                                           ; $6BC7: $C9

func_007_6BC8::
    call func_007_6EA2                            ; $6BC8: $CD $A2 $6E
    call GetEntityTransitionCountdown             ; $6BCB: $CD $05 $0C
    ret  nz                                       ; $6BCE: $C0

    call GetRandomByte                            ; $6BCF: $CD $0D $28
    and  $1F                                      ; $6BD2: $E6 $1F
    add  $30                                      ; $6BD4: $C6 $30
    ld   [hl], a                                  ; $6BD6: $77
    ld   a, $08                                   ; $6BD7: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $6BD9: $CD $AA $3B
    call IncrementEntityState                     ; $6BDC: $CD $12 $3B

label_007_6BDF:
    call func_007_7E5D                            ; $6BDF: $CD $5D $7E
    ld   hl, wEntitiesDirectionTable              ; $6BE2: $21 $80 $C3
    add  hl, bc                                   ; $6BE5: $09
    ld   [hl], e                                  ; $6BE6: $73

func_007_6BE7::
    call func_007_6B7D                            ; $6BE7: $CD $7D $6B
    ld   hl, wEntitiesDirectionTable              ; $6BEA: $21 $80 $C3
    add  hl, bc                                   ; $6BED: $09
    ld   a, [hl]                                  ; $6BEE: $7E
    and  a                                        ; $6BEF: $A7
    ret  nz                                       ; $6BF0: $C0

    jp   func_007_6BA3                            ; $6BF1: $C3 $A3 $6B

func_007_6BF4::
    call func_007_6EA2                            ; $6BF4: $CD $A2 $6E
    call func_007_7E5D                            ; $6BF7: $CD $5D $7E
    add  $20                                      ; $6BFA: $C6 $20
    cp   $40                                      ; $6BFC: $FE $40
    jr   nc, jr_007_6C14                          ; $6BFE: $30 $14

    call func_007_7E6D                            ; $6C00: $CD $6D $7E
    add  $1C                                      ; $6C03: $C6 $1C
    cp   $38                                      ; $6C05: $FE $38
    jr   nc, jr_007_6C14                          ; $6C07: $30 $0B

    call IncrementEntityState                     ; $6C09: $CD $12 $3B
    ld   [hl], $06                                ; $6C0C: $36 $06
    call GetEntityTransitionCountdown             ; $6C0E: $CD $05 $0C
    ld   [hl], $30                                ; $6C11: $36 $30
    ret                                           ; $6C13: $C9

jr_007_6C14:
    call GetEntityTransitionCountdown             ; $6C14: $CD $05 $0C
    jr   nz, jr_007_6C27                          ; $6C17: $20 $0E

    call GetRandomByte                            ; $6C19: $CD $0D $28
    and  $0F                                      ; $6C1C: $E6 $0F
    add  $10                                      ; $6C1E: $C6 $10
    ld   [hl], a                                  ; $6C20: $77
    call IncrementEntityState                     ; $6C21: $CD $12 $3B
    ld   [hl], $04                                ; $6C24: $36 $04
    ret                                           ; $6C26: $C9

jr_007_6C27:
    and  $0F                                      ; $6C27: $E6 $0F
    jr   nz, func_007_6C33                        ; $6C29: $20 $08

    ld   a, [wD209]                               ; $6C2B: $FA $09 $D2
    xor  $01                                      ; $6C2E: $EE $01
    ld   [wD209], a                               ; $6C30: $EA $09 $D2

func_007_6C33::
    call UpdateEntityPosWithSpeed_07              ; $6C33: $CD $0A $7E
    jp   label_3B23                               ; $6C36: $C3 $23 $3B

func_007_6C39::
    call GetEntityTransitionCountdown             ; $6C39: $CD $05 $0C
    jr   nz, jr_007_6C55                          ; $6C3C: $20 $17

func_007_6C3E::
    call GetEntityTransitionCountdown             ; $6C3E: $CD $05 $0C
    ld   [hl], $20                                ; $6C41: $36 $20
    call IncrementEntityState                     ; $6C43: $CD $12 $3B
    ld   [hl], $04                                ; $6C46: $36 $04
    ld   hl, wEntitiesHitboxFlagsTable            ; $6C48: $21 $50 $C3
    add  hl, bc                                   ; $6C4B: $09
    set  7, [hl]                                  ; $6C4C: $CB $FE
    ld   hl, wEntitiesOptions1Table               ; $6C4E: $21 $30 $C4
    add  hl, bc                                   ; $6C51: $09
    res  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ; $6C52: $CB $B6
    ret                                           ; $6C54: $C9

jr_007_6C55:
    ld   hl, wEntitiesDirectionTable              ; $6C55: $21 $80 $C3
    add  hl, bc                                   ; $6C58: $09
    ld   a, [hl]                                  ; $6C59: $7E
    and  a                                        ; $6C5A: $A7
    jr   nz, jr_007_6CB8                          ; $6C5B: $20 $5B

    call GetEntityTransitionCountdown             ; $6C5D: $CD $05 $0C
    cp   $18                                      ; $6C60: $FE $18
    jr   c, jr_007_6C77                           ; $6C62: $38 $13

    call func_007_6BA3                            ; $6C64: $CD $A3 $6B
    ld   a, $08                                   ; $6C67: $3E $08
    ld   [wD20C], a                               ; $6C69: $EA $0C $D2
    ld   a, $E0                                   ; $6C6C: $3E $E0
    ld   [wD20D], a                               ; $6C6E: $EA $0D $D2
    ld   a, $01                                   ; $6C71: $3E $01
    ld   [wD207], a                               ; $6C73: $EA $07 $D2
    ret                                           ; $6C76: $C9

jr_007_6C77:
    cp   $10                                      ; $6C77: $FE $10
    jr   c, jr_007_6C9E                           ; $6C79: $38 $23

    cp   $17                                      ; $6C7B: $FE $17
    jr   nz, jr_007_6C89                          ; $6C7D: $20 $0A

    ld   a, $27                                   ; $6C7F: $3E $27
    ldh  [hNoiseSfx], a                           ; $6C81: $E0 $F4
    ld   hl, wEntitiesPrivateCountdown2Table      ; $6C83: $21 $00 $C3
    add  hl, bc                                   ; $6C86: $09
    ld   [hl], $10                                ; $6C87: $36 $10

jr_007_6C89:
    ld   a, $FF                                   ; $6C89: $3E $FF
    ld   [wD207], a                               ; $6C8B: $EA $07 $D2
    ld   a, $F0                                   ; $6C8E: $3E $F0
    ld   [wD20A], a                               ; $6C90: $EA $0A $D2
    ld   a, $F4                                   ; $6C93: $3E $F4
    ld   [wD20B], a                               ; $6C95: $EA $0B $D2
    ld   a, $01                                   ; $6C98: $3E $01
    ld   [wD208], a                               ; $6C9A: $EA $08 $D2
    ret                                           ; $6C9D: $C9

jr_007_6C9E:
    ld   a, $03                                   ; $6C9E: $3E $03
    ld   [wD207], a                               ; $6CA0: $EA $07 $D2
    ld   a, $F8                                   ; $6CA3: $3E $F8
    ld   [wD20C], a                               ; $6CA5: $EA $0C $D2
    ld   a, $08                                   ; $6CA8: $3E $08
    ld   [wD20D], a                               ; $6CAA: $EA $0D $D2
    ld   a, $F0                                   ; $6CAD: $3E $F0
    ld   [wD20A], a                               ; $6CAF: $EA $0A $D2
    ld   a, $F0                                   ; $6CB2: $3E $F0
    ld   [wD20B], a                               ; $6CB4: $EA $0B $D2
    ret                                           ; $6CB7: $C9

jr_007_6CB8:
    call GetEntityTransitionCountdown             ; $6CB8: $CD $05 $0C
    cp   $18                                      ; $6CBB: $FE $18
    jr   c, jr_007_6CD7                           ; $6CBD: $38 $18

    call func_007_6B7D                            ; $6CBF: $CD $7D $6B
    ld   a, $01                                   ; $6CC2: $3E $01
    ld   [wD209], a                               ; $6CC4: $EA $09 $D2
    ld   a, $F8                                   ; $6CC7: $3E $F8
    ld   [wD20C], a                               ; $6CC9: $EA $0C $D2
    ld   a, $E8                                   ; $6CCC: $3E $E8
    ld   [wD20D], a                               ; $6CCE: $EA $0D $D2
    ld   a, $00                                   ; $6CD1: $3E $00
    ld   [wD207], a                               ; $6CD3: $EA $07 $D2
    ret                                           ; $6CD6: $C9

jr_007_6CD7:
    cp   $10                                      ; $6CD7: $FE $10
    jr   c, jr_007_6CFE                           ; $6CD9: $38 $23

    cp   $17                                      ; $6CDB: $FE $17
    jr   nz, jr_007_6CE9                          ; $6CDD: $20 $0A

    ld   a, $27                                   ; $6CDF: $3E $27
    ldh  [hNoiseSfx], a                           ; $6CE1: $E0 $F4
    ld   hl, wEntitiesPrivateCountdown2Table      ; $6CE3: $21 $00 $C3
    add  hl, bc                                   ; $6CE6: $09
    ld   [hl], $10                                ; $6CE7: $36 $10

jr_007_6CE9:
    ld   a, $FF                                   ; $6CE9: $3E $FF
    ld   [wD207], a                               ; $6CEB: $EA $07 $D2
    ld   a, $F0                                   ; $6CEE: $3E $F0
    ld   [wD20A], a                               ; $6CF0: $EA $0A $D2
    ld   a, $F0                                   ; $6CF3: $3E $F0
    ld   [wD20B], a                               ; $6CF5: $EA $0B $D2
    ld   a, $00                                   ; $6CF8: $3E $00
    ld   [wD208], a                               ; $6CFA: $EA $08 $D2
    ret                                           ; $6CFD: $C9

jr_007_6CFE:
    ld   a, $02                                   ; $6CFE: $3E $02
    ld   [wD207], a                               ; $6D00: $EA $07 $D2
    ld   a, $10                                   ; $6D03: $3E $10
    ld   [wD20C], a                               ; $6D05: $EA $0C $D2
    ld   a, $08                                   ; $6D08: $3E $08
    ld   [wD20D], a                               ; $6D0A: $EA $0D $D2
    ld   a, $F0                                   ; $6D0D: $3E $F0
    ld   [wD20A], a                               ; $6D0F: $EA $0A $D2
    ld   a, $EC                                   ; $6D12: $3E $EC
    ld   [wD20B], a                               ; $6D14: $EA $0B $D2
    ret                                           ; $6D17: $C9

func_007_6D18::
    call func_007_6BE7                            ; $6D18: $CD $E7 $6B
    call GetEntityTransitionCountdown             ; $6D1B: $CD $05 $0C
    jr   nz, jr_007_6D46                          ; $6D1E: $20 $26

    call IncrementEntityState                     ; $6D20: $CD $12 $3B
    call func_007_733F                            ; $6D23: $CD $3F $73
    ld   hl, wEntitiesPrivateState1Table          ; $6D26: $21 $B0 $C2
    add  hl, bc                                   ; $6D29: $09
    ld   a, [hl]                                  ; $6D2A: $7E
    ld   hl, wEntitiesSpeedZTable                 ; $6D2B: $21 $20 $C3
    add  hl, bc                                   ; $6D2E: $09
    ld   [hl], $30                                ; $6D2F: $36 $30
    and  a                                        ; $6D31: $A7
    jr   nz, jr_007_6D3B                          ; $6D32: $20 $07

    ld   [hl], $28                                ; $6D34: $36 $28
    ld   a, $18                                   ; $6D36: $3E $18
    jp   ApplyVectorTowardsLink_trampoline        ; $6D38: $C3 $AA $3B

jr_007_6D3B:
    ld   a, $08                                   ; $6D3B: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $6D3D: $CD $AA $3B
    call GetEntitySpeedYAddress                   ; $6D40: $CD $05 $40
    ld   [hl], $F0                                ; $6D43: $36 $F0
    ret                                           ; $6D45: $C9

jr_007_6D46:
    ld   a, [wD20E]                               ; $6D46: $FA $0E $D2
    add  $02                                      ; $6D49: $C6 $02
    ld   [wD20E], a                               ; $6D4B: $EA $0E $D2
    ld   a, [wD20B]                               ; $6D4E: $FA $0B $D2
    add  $02                                      ; $6D51: $C6 $02
    ld   [wD20B], a                               ; $6D53: $EA $0B $D2
    ld   a, [wD20D]                               ; $6D56: $FA $0D $D2
    add  $02                                      ; $6D59: $C6 $02
    ld   [wD20D], a                               ; $6D5B: $EA $0D $D2
    ret                                           ; $6D5E: $C9

func_007_6D5F::
    call GetEntityTransitionCountdown             ; $6D5F: $CD $05 $0C
    jr   z, jr_007_6D70                           ; $6D62: $28 $0C

    dec  a                                        ; $6D64: $3D
    jr   nz, jr_007_6D6A                          ; $6D65: $20 $03

    call func_007_6C3E                            ; $6D67: $CD $3E $6C

jr_007_6D6A:
    call func_007_6BE7                            ; $6D6A: $CD $E7 $6B
    jp   jr_007_6D46                              ; $6D6D: $C3 $46 $6D

jr_007_6D70:
    call func_007_6C33                            ; $6D70: $CD $33 $6C
    ldh  a, [hMultiPurposeG]                      ; $6D73: $F0 $E8
    and  a                                        ; $6D75: $A7
    ret  z                                        ; $6D76: $C8

    call GetEntityTransitionCountdown             ; $6D77: $CD $05 $0C
    ld   [hl], $10                                ; $6D7A: $36 $10
    jp   jr_007_6B15                              ; $6D7C: $C3 $15 $6B

func_007_6D7F::
    ldh  a, [hMultiPurposeG]                      ; $6D7F: $F0 $E8
    and  a                                        ; $6D81: $A7
    jr   z, jr_007_6D9C                           ; $6D82: $28 $18

    call IncrementEntityState                     ; $6D84: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $6D87: $CD $05 $0C
    ld   [hl], $20                                ; $6D8A: $36 $20
    ld   hl, wEntitiesHitboxFlagsTable            ; $6D8C: $21 $50 $C3
    add  hl, bc                                   ; $6D8F: $09
    res  7, [hl]                                  ; $6D90: $CB $BE
    ld   hl, wEntitiesOptions1Table               ; $6D92: $21 $30 $C4
    add  hl, bc                                   ; $6D95: $09
    set  ENTITY_OPT1_B_SWORD_CLINK_OFF, [hl]      ; $6D96: $CB $F6
    ld   a, JINGLE_MASTER_STALFOS                 ; $6D98: $3E $28
    ldh  [hJingle], a                             ; $6D9A: $E0 $F2

jr_007_6D9C:
    jp   func_007_6C33                            ; $6D9C: $C3 $33 $6C

func_007_6D9F::
    call GetEntityTransitionCountdown             ; $6D9F: $CD $05 $0C
    jr   nz, jr_007_6DA9                          ; $6DA2: $20 $05

    ld   [hl], $C0                                ; $6DA4: $36 $C0
    jp   IncrementEntityState                     ; $6DA6: $C3 $12 $3B

jr_007_6DA9:
    ld   hl, wD20B                                ; $6DA9: $21 $0B $D2
    ld   a, [hl]                                  ; $6DAC: $7E
    sub  $03                                      ; $6DAD: $D6 $03
    jr   z, jr_007_6DB8                           ; $6DAF: $28 $07

    bit  7, a                                     ; $6DB1: $CB $7F
    jr   z, jr_007_6DB7                           ; $6DB3: $28 $02

    inc  [hl]                                     ; $6DB5: $34
    inc  [hl]                                     ; $6DB6: $34

jr_007_6DB7:
    dec  [hl]                                     ; $6DB7: $35

jr_007_6DB8:
    ld   hl, wD20D                                ; $6DB8: $21 $0D $D2
    ld   a, [hl]                                  ; $6DBB: $7E
    sub  $03                                      ; $6DBC: $D6 $03
    jr   z, jr_007_6DC7                           ; $6DBE: $28 $07

    bit  7, a                                     ; $6DC0: $CB $7F
    jr   z, jr_007_6DC6                           ; $6DC2: $28 $02

    inc  [hl]                                     ; $6DC4: $34
    inc  [hl]                                     ; $6DC5: $34

jr_007_6DC6:
    dec  [hl]                                     ; $6DC6: $35

jr_007_6DC7:
    call GetEntityTransitionCountdown             ; $6DC7: $CD $05 $0C
    cp   $14                                      ; $6DCA: $FE $14
    jr   nc, jr_007_6DD8                          ; $6DCC: $30 $0A

    ld   a, [wD20E]                               ; $6DCE: $FA $0E $D2
    and  a                                        ; $6DD1: $A7
    jr   z, jr_007_6DD8                           ; $6DD2: $28 $04

    inc  a                                        ; $6DD4: $3C
    ld   [wD20E], a                               ; $6DD5: $EA $0E $D2

jr_007_6DD8:
    ret                                           ; $6DD8: $C9

func_007_6DD9::
    call GetEntityTransitionCountdown             ; $6DD9: $CD $05 $0C
    jr   nz, jr_007_6DE3                          ; $6DDC: $20 $05

    ld   [hl], $30                                ; $6DDE: $36 $30
    jp   IncrementEntityState                     ; $6DE0: $C3 $12 $3B

jr_007_6DE3:
    cp   $30                                      ; $6DE3: $FE $30
    jr   nc, jr_007_6DF5                          ; $6DE5: $30 $0E

    and  $03                                      ; $6DE7: $E6 $03
    jr   nz, jr_007_6DF5                          ; $6DE9: $20 $0A

    ld   a, [wD20E]                               ; $6DEB: $FA $0E $D2
    add  $02                                      ; $6DEE: $C6 $02
    cpl                                           ; $6DF0: $2F
    inc  a                                        ; $6DF1: $3C
    ld   [wD20E], a                               ; $6DF2: $EA $0E $D2

jr_007_6DF5:
    ret                                           ; $6DF5: $C9

func_007_6DF6::
    ld   a, [wD20E]                               ; $6DF6: $FA $0E $D2
    cp   $F0                                      ; $6DF9: $FE $F0
    jr   z, jr_007_6E01                           ; $6DFB: $28 $04

    dec  a                                        ; $6DFD: $3D
    ld   [wD20E], a                               ; $6DFE: $EA $0E $D2

jr_007_6E01:
    call GetEntityTransitionCountdown             ; $6E01: $CD $05 $0C
    jr   nz, jr_007_6E35                          ; $6E04: $20 $2F

    ld   e, $FF                                   ; $6E06: $1E $FF
    ldh  a, [hMapRoom]                            ; $6E08: $F0 $F6
    cp   UNKNOWN_ROOM_80                          ; $6E0A: $FE $80
    jr   z, jr_007_6E16                           ; $6E0C: $28 $08
    ld   e, $03                                   ; $6E0E: $1E $03
    cp   UNKNOWN_ROOM_95                          ; $6E10: $FE $95
    jr   z, jr_007_6E16                           ; $6E12: $28 $02
    ld   e, $02                                   ; $6E14: $1E $02

jr_007_6E16:
    ld   hl, wEntitiesInertiaTable                ; $6E16: $21 $D0 $C3
    add  hl, bc                                   ; $6E19: $09
    ld   a, [hl]                                  ; $6E1A: $7E
    cp   e                                        ; $6E1B: $BB
    jr   c, jr_007_6E32                           ; $6E1C: $38 $14

    ld   hl, wEntitiesHitboxFlagsTable            ; $6E1E: $21 $50 $C3
    add  hl, bc                                   ; $6E21: $09
    set  7, [hl]                                  ; $6E22: $CB $FE
    call IncrementEntityState                     ; $6E24: $CD $12 $3B
    call_open_dialog $113                         ; $6E27
    call GetEntityTransitionCountdown             ; $6E2C: $CD $05 $0C
    ld   [hl], $04                                ; $6E2F: $36 $04
    ret                                           ; $6E31: $C9

jr_007_6E32:
    jp   func_007_6C3E                            ; $6E32: $C3 $3E $6C

jr_007_6E35:
    cp   $24                                      ; $6E35: $FE $24
    jr   nc, jr_007_6E57                          ; $6E37: $30 $1E

    ld   hl, wD20B                                ; $6E39: $21 $0B $D2
    ld   a, [hl]                                  ; $6E3C: $7E
    sub  $F8                                      ; $6E3D: $D6 $F8
    jr   z, jr_007_6E48                           ; $6E3F: $28 $07

    bit  7, a                                     ; $6E41: $CB $7F
    jr   z, jr_007_6E47                           ; $6E43: $28 $02

    inc  [hl]                                     ; $6E45: $34
    inc  [hl]                                     ; $6E46: $34

jr_007_6E47:
    dec  [hl]                                     ; $6E47: $35

jr_007_6E48:
    ld   hl, wD20D                                ; $6E48: $21 $0D $D2
    ld   a, [hl]                                  ; $6E4B: $7E
    sub  $F0                                      ; $6E4C: $D6 $F0
    jr   z, jr_007_6E57                           ; $6E4E: $28 $07

    bit  7, a                                     ; $6E50: $CB $7F
    jr   z, jr_007_6E56                           ; $6E52: $28 $02

    inc  [hl]                                     ; $6E54: $34
    inc  [hl]                                     ; $6E55: $34

jr_007_6E56:
    dec  [hl]                                     ; $6E56: $35

jr_007_6E57:
    ret                                           ; $6E57: $C9

func_007_6E58::
    call func_007_6BE7                            ; $6E58: $CD $E7 $6B
    call GetEntityTransitionCountdown             ; $6E5B: $CD $05 $0C
    jr   z, jr_007_6E6A                           ; $6E5E: $28 $0A

    dec  a                                        ; $6E60: $3D
    jr   nz, jr_007_6E67                          ; $6E61: $20 $04

    ld   a, $3F                                   ; $6E63: $3E $3F
    ldh  [hNoiseSfx], a                           ; $6E65: $E0 $F4

jr_007_6E67:
    jp   jr_007_6D46                              ; $6E67: $C3 $46 $6D

jr_007_6E6A:
    ld   hl, wEntitiesSpeedZTable                 ; $6E6A: $21 $20 $C3
    add  hl, bc                                   ; $6E6D: $09
    ld   [hl], $30                                ; $6E6E: $36 $30
    ld   hl, wEntitiesPosZTable                   ; $6E70: $21 $10 $C3
    add  hl, bc                                   ; $6E73: $09
    ld   a, [hl]                                  ; $6E74: $7E
    cp   $78                                      ; $6E75: $FE $78
    jr   c, jr_007_6EA1                           ; $6E77: $38 $28

    call label_27DD                               ; $6E79: $CD $DD $27
    call func_007_7EA4                            ; $6E7C: $CD $A4 $7E

func_007_6E7F::
    ld   hl, wIndoorARoomStatus                   ; $6E7F: $21 $00 $D9
    ldh  a, [hMapRoom]                            ; $6E82: $F0 $F6
    cp   UNKNOWN_ROOM_FF                          ; $6E84: $FE $FF
    jr   nz, jr_007_6E8D                          ; $6E86: $20 $05

    ld   hl, wColorDungeonRoomStatus              ; $6E88: $21 $E0 $DD
    jr   jr_007_6E9A                              ; $6E8B: $18 $0D

jr_007_6E8D:
    ld   e, a                                     ; $6E8D: $5F
    ld   d, b                                     ; $6E8E: $50

    ; If the map uses rooms in the indoors_b rooms group…
    ldh  a, [hMapId]                              ; $6E8F: $F0 $F7
    cp   MAP_INDOORS_B_END                        ; $6E91: $FE $1A
    jr   nc, jr_007_6E9A                          ; $6E93: $30 $05
    cp   MAP_INDOORS_B_START                      ; $6E95: $FE $06
    jr   c, jr_007_6E9A                           ; $6E97: $38 $01
    ; increase offset in wIndoorARoomStatus by 0x100
    inc  d                                        ; $6E99: $14
jr_007_6E9A:

    add  hl, de                                   ; $6E9A: $19
    ld   a, [hl]                                  ; $6E9B: $7E
    or   ROOM_STATUS_EVENT_2                      ; $6E9C: $F6 $20
    ld   [hl], a                                  ; $6E9E: $77
    ldh  [hRoomStatus], a                         ; $6E9F: $E0 $F8

jr_007_6EA1:
    ret                                           ; $6EA1: $C9

func_007_6EA2::
    ld   hl, wEntitiesPrivateState1Table          ; $6EA2: $21 $B0 $C2
    add  hl, bc                                   ; $6EA5: $09
    ld   [hl], b                                  ; $6EA6: $70
    call func_007_7E5D                            ; $6EA7: $CD $5D $7E
    add  $30                                      ; $6EAA: $C6 $30
    cp   $60                                      ; $6EAC: $FE $60
    jr   nc, jr_007_6EC3                          ; $6EAE: $30 $13

    call func_007_7E6D                            ; $6EB0: $CD $6D $7E
    add  $30                                      ; $6EB3: $C6 $30
    cp   $60                                      ; $6EB5: $FE $60
    jr   nc, jr_007_6EC3                          ; $6EB7: $30 $0A

    ld   a, e                                     ; $6EB9: $7B
    cp   $02                                      ; $6EBA: $FE $02
    ret  nz                                       ; $6EBC: $C0

    ld   hl, wEntitiesPrivateState1Table          ; $6EBD: $21 $B0 $C2
    add  hl, bc                                   ; $6EC0: $09
    ld   [hl], $01                                ; $6EC1: $36 $01

jr_007_6EC3:
    call IncrementEntityState                     ; $6EC3: $CD $12 $3B
    ld   [hl], $07                                ; $6EC6: $36 $07
    call GetEntityTransitionCountdown             ; $6EC8: $CD $05 $0C
    ld   [hl], $20                                ; $6ECB: $36 $20
    jp   label_007_6BDF                           ; $6ECD: $C3 $DF $6B

func_007_6ED0::
    ld   hl, wEntitiesPosZTable                   ; $6ED0: $21 $10 $C3
    add  hl, bc                                   ; $6ED3: $09
    ld   [hl], $7F                                ; $6ED4: $36 $7F
    call GetEntityTransitionCountdown             ; $6ED6: $CD $05 $0C
    ld   [hl], $80                                ; $6ED9: $36 $80
    ldh  a, [hDefaultMusicTrack]                  ; $6EDB: $F0 $B0
    ld   hl, wEntitiesPrivateState5Table          ; $6EDD: $21 $90 $C3
    add  hl, bc                                   ; $6EE0: $09
    ld   [hl], a                                  ; $6EE1: $77
    ld   hl, wEntitiesHealthTable                 ; $6EE2: $21 $60 $C3
    add  hl, bc                                   ; $6EE5: $09
    ld   [hl], $FF                                ; $6EE6: $36 $FF
    ldh  a, [hMapRoom]                            ; $6EE8: $F0 $F6
    cp   UNKNOWN_ROOM_80                          ; $6EEA: $FE $80
    jr   nz, func_007_6EF0                        ; $6EEC: $20 $02

    ld   [hl], $C0                                ; $6EEE: $36 $C0

func_007_6EF0::
    ld   a, $F8                                   ; $6EF0: $3E $F8
    ld   [wD20A], a                               ; $6EF2: $EA $0A $D2
    ld   a, $F8                                   ; $6EF5: $3E $F8
    ld   [wD20B], a                               ; $6EF7: $EA $0B $D2
    ld   a, $F0                                   ; $6EFA: $3E $F0
    ld   [wD20E], a                               ; $6EFC: $EA $0E $D2
    ld   a, $00                                   ; $6EFF: $3E $00
    ld   [wD207], a                               ; $6F01: $EA $07 $D2
    ld   [wD208], a                               ; $6F04: $EA $08 $D2
    ld   [wD209], a                               ; $6F07: $EA $09 $D2
    ld   a, $10                                   ; $6F0A: $3E $10
    ld   [wD20C], a                               ; $6F0C: $EA $0C $D2
    ld   a, $F0                                   ; $6F0F: $3E $F0
    ld   [wD20D], a                               ; $6F11: $EA $0D $D2
    ret                                           ; $6F14: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown041SpriteVariants::
.variant0
    db $70, $01
    db $70, $21

Data_007_6F19::
    db   $00, $F8, $60, $00, $00, $00, $62, $00, $00, $08, $64, $00, $00, $10, $66, $00
    db   $00, $F8, $66, $20, $00, $00, $64, $20, $00, $08, $62, $20, $00, $10, $60, $20

Data_007_6F39::
    db   $00, $F8, $68, $00, $00, $00, $6A, $00, $00, $08, $6C, $00, $00, $10, $6E, $00
    db   $00, $F8, $6E, $20, $00, $00, $6C, $20, $00, $08, $6A, $20, $00, $10, $68, $20

Data_007_6F59::
    db   $00, $00, $72, $03, $F8, $08, $74, $03, $F8, $00, $74, $23, $00, $08, $72, $23
    db   $00, $00, $72, $43, $08, $08, $74, $43, $08, $00, $74, $63, $00, $08, $72, $63

Data_007_6F79::
    db   $10, $00, $76, $00, $10, $08, $78, $00, $10, $10, $7A, $00, $08, $18, $7C, $00
    db   $F8, $18, $7E, $00

Data_007_6F8D::
    db   $10, $08, $76, $20, $10, $00, $78, $20, $10, $F8, $7A, $20, $08, $F0, $7C, $20
    db   $F8, $F0, $7E, $20

Data_007_6FA1::
    db   $0C, $FB, $26, $00, $0C, $01, $26, $00, $0C, $07, $26, $00, $0C, $0D, $26, $00

func_007_6FB1::
    ld   hl, wEntitiesPosZTable                   ; $6FB1: $21 $10 $C3
    add  hl, bc                                   ; $6FB4: $09
    ld   a, [hl]                                  ; $6FB5: $7E
    cp   $70                                      ; $6FB6: $FE $70
    ret  nc                                       ; $6FB8: $D0

    call func_007_6FE6                            ; $6FB9: $CD $E6 $6F
    call func_007_7015                            ; $6FBC: $CD $15 $70
    call func_007_703A                            ; $6FBF: $CD $3A $70
    call func_007_706F                            ; $6FC2: $CD $6F $70
    call func_007_7090                            ; $6FC5: $CD $90 $70
    ld   hl, wEntitiesPosZTable                   ; $6FC8: $21 $10 $C3
    add  hl, bc                                   ; $6FCB: $09
    ld   a, [hl]                                  ; $6FCC: $7E
    and  a                                        ; $6FCD: $A7
    jr   z, jr_007_6FE3                           ; $6FCE: $28 $13

    ldh  a, [hActiveEntityPosY]                   ; $6FD0: $F0 $EF
    sub  $02                                      ; $6FD2: $D6 $02
    ldh  [hActiveEntityVisualPosY], a             ; $6FD4: $E0 $EC
    ld   hl, Data_007_6FA1                        ; $6FD6: $21 $A1 $6F
    ld   c, $04                                   ; $6FD9: $0E $04
    call RenderActiveEntitySpritesRect            ; $6FDB: $CD $E6 $3C
    ld   a, $04                                   ; $6FDE: $3E $04
    call func_015_7964_trampoline                 ; $6FE0: $CD $A0 $3D

jr_007_6FE3:
    jp   CopyEntityPositionToActivePosition       ; $6FE3: $C3 $8A $3D

func_007_6FE6::
    ld   a, [wD20C]                               ; $6FE6: $FA $0C $D2
    ld   hl, hActiveEntityPosX                    ; $6FE9: $21 $EE $FF
    add  [hl]                                     ; $6FEC: $86
    ld   [hl], a                                  ; $6FED: $77
    ld   a, [wD20D]                               ; $6FEE: $FA $0D $D2
    ld   hl, hActiveEntityVisualPosY              ; $6FF1: $21 $EC $FF
    add  [hl]                                     ; $6FF4: $86
    ld   [hl], a                                  ; $6FF5: $77
    ld   a, [wD207]                               ; $6FF6: $FA $07 $D2
    cp   $FF                                      ; $6FF9: $FE $FF
    jr   z, jr_007_7012                           ; $6FFB: $28 $15

    rla                                           ; $6FFD: $17
    rla                                           ; $6FFE: $17
    rla                                           ; $6FFF: $17
    and  $F8                                      ; $7000: $E6 $F8
    ld   e, a                                     ; $7002: $5F
    ld   d, b                                     ; $7003: $50
    ld   hl, Data_007_6F59                        ; $7004: $21 $59 $6F
    add  hl, de                                   ; $7007: $19
    ld   c, $02                                   ; $7008: $0E $02
    call RenderActiveEntitySpritesRect            ; $700A: $CD $E6 $3C
    ld   a, $02                                   ; $700D: $3E $02
    jp   label_007_7034                           ; $700F: $C3 $34 $70

jr_007_7012:
    jp   CopyEntityPositionToActivePosition       ; $7012: $C3 $8A $3D

func_007_7015::
    ld   hl, wEntitiesPrivateCountdown2Table      ; $7015: $21 $00 $C3
    add  hl, bc                                   ; $7018: $09
    ld   a, [hl]                                  ; $7019: $7E
    and  a                                        ; $701A: $A7
    ret  z                                        ; $701B: $C8

    call func_007_70B7                            ; $701C: $CD $B7 $70
    ld   hl, wEntitiesDirectionTable              ; $701F: $21 $80 $C3
    add  hl, bc                                   ; $7022: $09
    ld   a, [hl]                                  ; $7023: $7E
    ld   hl, Data_007_6F79                        ; $7024: $21 $79 $6F
    and  a                                        ; $7027: $A7
    jr   z, jr_007_702D                           ; $7028: $28 $03

    ld   hl, Data_007_6F8D                        ; $702A: $21 $8D $6F

jr_007_702D:
    ld   c, $05                                   ; $702D: $0E $05
    call RenderActiveEntitySpritesRect            ; $702F: $CD $E6 $3C
    ld   a, $05                                   ; $7032: $3E $05

label_007_7034:
    call func_015_7964_trampoline                 ; $7034: $CD $A0 $3D
    jp   CopyEntityPositionToActivePosition       ; $7037: $C3 $8A $3D

func_007_703A::
    ld   a, [wD20A]                               ; $703A: $FA $0A $D2
    ld   hl, hActiveEntityPosX                    ; $703D: $21 $EE $FF
    add  [hl]                                     ; $7040: $86
    ld   [hl], a                                  ; $7041: $77
    ld   a, [wD20A]                               ; $7042: $FA $0A $D2
    add  $0C                                      ; $7045: $C6 $0C
    ld   [wD5C0], a                               ; $7047: $EA $C0 $D5
    ld   a, [wD20B]                               ; $704A: $FA $0B $D2
    ld   hl, hActiveEntityVisualPosY              ; $704D: $21 $EC $FF
    add  [hl]                                     ; $7050: $86
    ld   [hl], a                                  ; $7051: $77
    ld   a, [wD20B]                               ; $7052: $FA $0B $D2
    add  $08                                      ; $7055: $C6 $08
    ld   [wD5C2], a                               ; $7057: $EA $C2 $D5
    ld   a, $08                                   ; $705A: $3E $08
    ld   [wD5C0+1], a                             ; $705C: $EA $C1 $D5
    ld   a, $06                                   ; $705F: $3E $06
    ld   [wD5C2+1], a                             ; $7061: $EA $C3 $D5
    ld   de, Unknown041SpriteVariants             ; $7064: $11 $15 $6F
    call RenderActiveEntitySpritesPair            ; $7067: $CD $C0 $3B
    ld   a, $02                                   ; $706A: $3E $02
    jp   label_007_7034                           ; $706C: $C3 $34 $70

func_007_706F::
    ld   a, [wD20E]                               ; $706F: $FA $0E $D2
    ld   hl, hActiveEntityVisualPosY              ; $7072: $21 $EC $FF
    add  [hl]                                     ; $7075: $86
    ld   [hl], a                                  ; $7076: $77
    ld   a, [wD208]                               ; $7077: $FA $08 $D2
    rla                                           ; $707A: $17
    rla                                           ; $707B: $17
    rla                                           ; $707C: $17
    rla                                           ; $707D: $17
    and  $F0                                      ; $707E: $E6 $F0
    ld   e, a                                     ; $7080: $5F
    ld   d, b                                     ; $7081: $50
    ld   hl, Data_007_6F19                        ; $7082: $21 $19 $6F
    add  hl, de                                   ; $7085: $19
    ld   c, $04                                   ; $7086: $0E $04
    call RenderActiveEntitySpritesRect            ; $7088: $CD $E6 $3C
    ld   a, $04                                   ; $708B: $3E $04
    jp   label_007_7034                           ; $708D: $C3 $34 $70

func_007_7090::
    ld   a, [wD20E]                               ; $7090: $FA $0E $D2
    cp   $00                                      ; $7093: $FE $00
    ret  z                                        ; $7095: $C8

    ld   a, [wD20F]                               ; $7096: $FA $0F $D2
    ld   hl, hActiveEntityVisualPosY              ; $7099: $21 $EC $FF
    add  [hl]                                     ; $709C: $86
    ld   [hl], a                                  ; $709D: $77
    ld   a, [wD209]                               ; $709E: $FA $09 $D2
    rla                                           ; $70A1: $17
    rla                                           ; $70A2: $17
    rla                                           ; $70A3: $17
    rla                                           ; $70A4: $17
    and  $F0                                      ; $70A5: $E6 $F0
    ld   e, a                                     ; $70A7: $5F
    ld   d, b                                     ; $70A8: $50
    ld   hl, Data_007_6F39                        ; $70A9: $21 $39 $6F
    add  hl, de                                   ; $70AC: $19
    ld   c, $04                                   ; $70AD: $0E $04
    call RenderActiveEntitySpritesRect            ; $70AF: $CD $E6 $3C
    ld   a, $04                                   ; $70B2: $3E $04
    jp   label_007_7034                           ; $70B4: $C3 $34 $70

func_007_70B7::
    ld   hl, wIsLinkInTheAir                      ; $70B7: $21 $46 $C1
    ld   a, [wInvincibilityCounter]               ; $70BA: $FA $C7 $DB
    or   [hl]                                     ; $70BD: $B6
    jr   nz, jr_007_7111                          ; $70BE: $20 $51

    ldh  a, [hActiveEntityVisualPosY]             ; $70C0: $F0 $EC
    add  $18                                      ; $70C2: $C6 $18
    ld   e, a                                     ; $70C4: $5F
    ldh  a, [hLinkPositionY]                      ; $70C5: $F0 $99
    ld   hl, hLinkPositionZ                       ; $70C7: $21 $A2 $FF
    sub  [hl]                                     ; $70CA: $96
    add  $08                                      ; $70CB: $C6 $08
    sub  e                                        ; $70CD: $93
    add  $0C                                      ; $70CE: $C6 $0C
    cp   $18                                      ; $70D0: $FE $18
    jr   nc, jr_007_7111                          ; $70D2: $30 $3D

    ld   hl, wEntitiesDirectionTable              ; $70D4: $21 $80 $C3
    add  hl, bc                                   ; $70D7: $09
    ld   e, $08                                   ; $70D8: $1E $08
    ld   a, [hl]                                  ; $70DA: $7E
    and  a                                        ; $70DB: $A7
    jr   z, jr_007_70E0                           ; $70DC: $28 $02

    ld   e, $F8                                   ; $70DE: $1E $F8

jr_007_70E0:
    ldh  a, [hActiveEntityPosX]                   ; $70E0: $F0 $EE
    add  e                                        ; $70E2: $83
    ld   hl, hLinkPositionX                       ; $70E3: $21 $98 $FF
    sub  [hl]                                     ; $70E6: $96
    add  $1A                                      ; $70E7: $C6 $1A
    cp   $34                                      ; $70E9: $FE $34
    jr   nc, jr_007_7111                          ; $70EB: $30 $24

    ld   a, $28                                   ; $70ED: $3E $28
    call GetVectorTowardsLink_trampoline          ; $70EF: $CD $B5 $3B
    ldh  a, [hMultiPurpose0]                      ; $70F2: $F0 $D7
    ldh  [hLinkSpeedY], a                         ; $70F4: $E0 $9B
    ldh  a, [hMultiPurpose1]                      ; $70F6: $F0 $D8
    ldh  [hLinkSpeedX], a                         ; $70F8: $E0 $9A
    ld   a, $02                                   ; $70FA: $3E $02
    ld   [wIsLinkInTheAir], a                     ; $70FC: $EA $46 $C1
    ld   a, $13                                   ; $70FF: $3E $13
    ldh  [hLinkVelocityZ], a                      ; $7101: $E0 $A3
    ld   a, $08                                   ; $7103: $3E $08
    ld   [wSubtractHealthBuffer], a               ; $7105: $EA $94 $DB
    ld   a, $20                                   ; $7108: $3E $20
    ld   [wInvincibilityCounter], a               ; $710A: $EA $C7 $DB
    ld   a, $03                                   ; $710D: $3E $03
    ldh  [hWaveSfx], a                            ; $710F: $E0 $F3

jr_007_7111:
    ret                                           ; $7111: $C9

Data_007_7112::
    db   $12, $14, $16, $18, $19, $1A, $1A, $1A, $1A, $1A

FireballShooterEntityHandler::
    call ReturnIfNonInteractive_07                ; $711C: $CD $96 $7D
    call func_007_7E5D                            ; $711F: $CD $5D $7E
    add  $20                                      ; $7122: $C6 $20
    cp   $40                                      ; $7124: $FE $40
    jr   nc, jr_007_7131                          ; $7126: $30 $09

    call func_007_7E6D                            ; $7128: $CD $6D $7E
    add  $20                                      ; $712B: $C6 $20
    cp   $40                                      ; $712D: $FE $40
    jr   c, jr_007_7197                           ; $712F: $38 $66

jr_007_7131:
    ld   hl, wEntitiesSpriteVariantTable          ; $7131: $21 $B0 $C3
    add  hl, bc                                   ; $7134: $09
    ld   a, [hl]                                  ; $7135: $7E
    inc  a                                        ; $7136: $3C
    ld   [hl], a                                  ; $7137: $77
    and  $7F                                      ; $7138: $E6 $7F
    ret  nz                                       ; $713A: $C0

    ld   e, $0F                                   ; $713B: $1E $0F
    ld   d, b                                     ; $713D: $50

jr_007_713E:
    ld   hl, wEntitiesTypeTable                   ; $713E: $21 $A0 $C3
    add  hl, de                                   ; $7141: $19
    ld   a, [hl]                                  ; $7142: $7E
    cp   $82                                      ; $7143: $FE $82
    jr   z, jr_007_7161                           ; $7145: $28 $1A

    cp   $9E                                      ; $7147: $FE $9E
    jr   z, jr_007_7161                           ; $7149: $28 $16

    cp   $7D                                      ; $714B: $FE $7D
    jr   z, jr_007_7161                           ; $714D: $28 $12

    ld   hl, wEntitiesPhysicsFlagsTable           ; $714F: $21 $40 $C3
    add  hl, de                                   ; $7152: $19
    ld   a, [hl]                                  ; $7153: $7E
    and  $80                                      ; $7154: $E6 $80
    jr   nz, jr_007_7161                          ; $7156: $20 $09

    ld   hl, wEntitiesStatusTable                 ; $7158: $21 $80 $C2
    add  hl, de                                   ; $715B: $19
    ld   a, [hl]                                  ; $715C: $7E
    cp   $05                                      ; $715D: $FE $05
    jr   z, jr_007_7168                           ; $715F: $28 $07

jr_007_7161:
    dec  e                                        ; $7161: $1D
    ld   a, e                                     ; $7162: $7B
    cp   $FF                                      ; $7163: $FE $FF
    jr   nz, jr_007_713E                          ; $7165: $20 $D7

    ret                                           ; $7167: $C9

jr_007_7168:
    ld   a, [wRoomEventEffectExecuted]            ; $7168: $FA $8F $C1
    and  a                                        ; $716B: $A7
    ret  nz                                       ; $716C: $C0

    ld   a, ENTITY_GOPONGA_FLOWER_PROJECTILE      ; $716D: $3E $7D
    call SpawnNewEntity_trampoline                ; $716F: $CD $86 $3B
    jr   c, jr_007_7197                           ; $7172: $38 $23

    ldh  a, [hMultiPurpose0]                      ; $7174: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7176: $21 $00 $C2
    add  hl, de                                   ; $7179: $19
    ld   [hl], a                                  ; $717A: $77
    ldh  a, [hMultiPurpose1]                      ; $717B: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $717D: $21 $10 $C2
    add  hl, de                                   ; $7180: $19
    ld   [hl], a                                  ; $7181: $77
    push bc                                       ; $7182: $C5
    ld   c, e                                     ; $7183: $4B
    ld   b, d                                     ; $7184: $42
    ldh  a, [hMapId]                              ; $7185: $F0 $F7
    ld   e, a                                     ; $7187: $5F
    ld   a, $14                                   ; $7188: $3E $14
    cp   $0A                                      ; $718A: $FE $0A
    jr   nc, jr_007_7193                          ; $718C: $30 $05

    ld   hl, Data_007_7112                        ; $718E: $21 $12 $71
    add  hl, de                                   ; $7191: $19
    ld   a, [hl]                                  ; $7192: $7E

jr_007_7193:
    call ApplyVectorTowardsLink_trampoline        ; $7193: $CD $AA $3B
    pop  bc                                       ; $7196: $C1

jr_007_7197:
    ret                                           ; $7197: $C9

KanaletBombableWallEntityHandler::
    ld   hl, wEntitiesLoadOrderTable              ; $7198: $21 $60 $C4
    add  hl, bc                                   ; $719B: $09
    ld   a, [hl]                                  ; $719C: $7E
    cp   $00                                      ; $719D: $FE $00
    jr   nz, jr_007_71B4                          ; $719F: $20 $13

    ldh  a, [hRoomStatus]                         ; $71A1: $F0 $F8
    and  ROOM_STATUS_EVENT_1                      ; $71A3: $E6 $10
    jp   nz, func_007_7EA4                        ; $71A5: $C2 $A4 $7E

    ld   hl, wEntitiesLoadOrderTable              ; $71A8: $21 $60 $C4
    add  hl, bc                                   ; $71AB: $09
    ld   [hl], $FF                                ; $71AC: $36 $FF
    ld   hl, wEntitiesDroppedItemTable            ; $71AE: $21 $E0 $C4
    add  hl, bc                                   ; $71B1: $09
    ld   [hl], $3C                                ; $71B2: $36 $3C

jr_007_71B4:
    call ReturnIfNonInteractive_07                ; $71B4: $CD $96 $7D
    ld   hl, wEntitiesSpriteVariantTable          ; $71B7: $21 $B0 $C3
    add  hl, bc                                   ; $71BA: $09
    ld   [hl], b                                  ; $71BB: $70
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $71BC: $21 $10 $C4
    add  hl, bc                                   ; $71BF: $09
    ld   a, [hl]                                  ; $71C0: $7E
    and  a                                        ; $71C1: $A7
    jp   z, jr_007_7246                           ; $71C2: $CA $46 $72

    ld   a, ENTITY_MOBLIN_SWORD                   ; $71C5: $3E $14
    call SpawnNewEntity_trampoline                ; $71C7: $CD $86 $3B
    jr   c, jr_007_7246                           ; $71CA: $38 $7A

    ld   hl, wEntitiesDroppedItemTable            ; $71CC: $21 $E0 $C4
    add  hl, bc                                   ; $71CF: $09
    ld   a, [hl]                                  ; $71D0: $7E
    ld   hl, wEntitiesDroppedItemTable            ; $71D1: $21 $E0 $C4
    add  hl, de                                   ; $71D4: $19
    ld   [hl], a                                  ; $71D5: $77
    ldh  a, [hMultiPurpose0]                      ; $71D6: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $71D8: $21 $00 $C2
    add  hl, de                                   ; $71DB: $19
    ld   [hl], a                                  ; $71DC: $77
    ldh  a, [hMultiPurpose1]                      ; $71DD: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $71DF: $21 $10 $C2
    add  hl, de                                   ; $71E2: $19
    add  $08                                      ; $71E3: $C6 $08
    ld   [hl], a                                  ; $71E5: $77
    call label_3E34                               ; $71E6: $CD $34 $3E
    ldh  a, [hActiveEntityPosX]                   ; $71E9: $F0 $EE
    sub  $08                                      ; $71EB: $D6 $08
    ldh  [hIntersectedObjectLeft], a              ; $71ED: $E0 $CE
    ldh  a, [hActiveEntityPosY]                   ; $71EF: $F0 $EF
    sub  $10                                      ; $71F1: $D6 $10
    ldh  [hIntersectedObjectTop], a               ; $71F3: $E0 $CD
    ldh  a, [hIntersectedObjectLeft]              ; $71F5: $F0 $CE
    swap a                                        ; $71F7: $CB $37
    and  $0F                                      ; $71F9: $E6 $0F
    ld   e, a                                     ; $71FB: $5F
    ldh  a, [hIntersectedObjectTop]               ; $71FC: $F0 $CD
    and  $F0                                      ; $71FE: $E6 $F0
    or   e                                        ; $7200: $B3
    ld   e, a                                     ; $7201: $5F
    ld   d, b                                     ; $7202: $50
    ld   hl, wRoomObjects                         ; $7203: $21 $11 $D7
    add  hl, de                                   ; $7206: $19
    ld   [hl], $91                                ; $7207: $36 $91
    call label_2887                               ; $7209: $CD $87 $28
    ldh  a, [hIsGBC]                              ; $720C: $F0 $FE
    and  a                                        ; $720E: $A7
    jr   z, jr_007_721D                           ; $720F: $28 $0C

    push bc                                       ; $7211: $C5
    ld   a, $91                                   ; $7212: $3E $91
    ld   [wDDD8], a                               ; $7214: $EA $D8 $DD
    ld   a, $07                                   ; $7217: $3E $07
    call func_91D                                 ; $7219: $CD $1D $09
    pop  bc                                       ; $721C: $C1

jr_007_721D:
    ld   a, [wDrawCommandsSize]                   ; $721D: $FA $00 $D6
    ld   e, a                                     ; $7220: $5F
    ld   d, $00                                   ; $7221: $16 $00
    ld   hl, wDrawCommand                         ; $7223: $21 $01 $D6
    add  hl, de                                   ; $7226: $19
    add  $0A                                      ; $7227: $C6 $0A
    ld   [wDrawCommandsSize], a                   ; $7229: $EA $00 $D6
    ld   e, $08                                   ; $722C: $1E $08
    call func_007_7233                            ; $722E: $CD $33 $72
    ld   e, $09                                   ; $7231: $1E $09

func_007_7233::
    ldh  a, [hIntersectedObjectBGAddressHigh]     ; $7233: $F0 $CF
    ld   [hl+], a                                 ; $7235: $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ; $7236: $F0 $D0
    ld   [hl+], a                                 ; $7238: $22
    inc  a                                        ; $7239: $3C
    ldh  [hIntersectedObjectBGAddressLow], a      ; $723A: $E0 $D0
    ld   a, $81                                   ; $723C: $3E $81
    ld   [hl+], a                                 ; $723E: $22
    ld   a, e                                     ; $723F: $7B
    ld   [hl+], a                                 ; $7240: $22
    inc  a                                        ; $7241: $3C
    inc  a                                        ; $7242: $3C
    ld   [hl+], a                                 ; $7243: $22
    xor  a                                        ; $7244: $AF
    ld   [hl], a                                  ; $7245: $77

jr_007_7246:
    ret                                           ; $7246: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
StarSpriteVariants::
.variant0
    db $74, $01
    db $74, $21
.variant1
    db $76, $01
    db $78, $01
.variant2
    db $7A, $01
    db $7A, $21
.variant3
    db $78, $21
    db $76, $21
.variant4
    db $7C, $01
    db $7C, $01

StarEntityHandler::
    ld   de, StarSpriteVariants                   ; $725B: $11 $47 $72
    call RenderActiveEntitySpritesPair            ; $725E: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $7261: $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ; $7264: $CD $C3 $7D
    call label_3B39                               ; $7267: $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ; $726A: $CD $0A $7E
    call label_3B23                               ; $726D: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $7270: $21 $A0 $C2
    add  hl, bc                                   ; $7273: $09
    ld   a, [hl]                                  ; $7274: $7E
    and  $03                                      ; $7275: $E6 $03
    jr   nz, jr_007_7280                          ; $7277: $20 $07

    ld   a, [hl]                                  ; $7279: $7E
    and  $0C                                      ; $727A: $E6 $0C
    jr   nz, jr_007_728A                          ; $727C: $20 $0C

    jr   jr_007_7291                              ; $727E: $18 $11

jr_007_7280:
    ld   hl, wEntitiesSpeedXTable                 ; $7280: $21 $40 $C2
    add  hl, bc                                   ; $7283: $09
    ld   a, [hl]                                  ; $7284: $7E
    cpl                                           ; $7285: $2F
    inc  a                                        ; $7286: $3C
    ld   [hl], a                                  ; $7287: $77
    jr   jr_007_7291                              ; $7288: $18 $07

jr_007_728A:
    call GetEntitySpeedYAddress                   ; $728A: $CD $05 $40
    ld   a, [hl]                                  ; $728D: $7E
    cpl                                           ; $728E: $2F
    inc  a                                        ; $728F: $3C
    ld   [hl], a                                  ; $7290: $77

jr_007_7291:
    ldh  a, [hFrameCounter]                       ; $7291: $F0 $E7
    rra                                           ; $7293: $1F
    rra                                           ; $7294: $1F
    rra                                           ; $7295: $1F
    and  $03                                      ; $7296: $E6 $03
    jp   SetEntitySpriteVariant                   ; $7298: $C3 $0C $3B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HidingGel2SpriteVariants::
.variant0
    db $FF, $FF
    db $FF, $FF
.variant1
    db $FF, $FF
    db $FF, $FF
.variant2
    db $54, $00
    db $54, $20
.variant3
    db $52, $00
    db $52, $20

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HidingGel1SpriteVariants::
.variant0
    db $56, $00
    db $56, $00

HidingGelEntityHandler::
    ldh  a, [hActiveEntitySpriteVariant]          ; $72AF: $F0 $F1
    cp   $01                                      ; $72B1: $FE $01
    jr   nz, jr_007_72BD                          ; $72B3: $20 $08

    ld   de, HidingGel1SpriteVariants             ; $72B5: $11 $AB $72
    call RenderActiveEntitySprite                 ; $72B8: $CD $77 $3C
    jr   jr_007_72C3                              ; $72BB: $18 $06

jr_007_72BD:
    ld   de, HidingGel2SpriteVariants             ; $72BD: $11 $9B $72
    call RenderActiveEntitySpritesPair            ; $72C0: $CD $C0 $3B

jr_007_72C3:
    call ReturnIfNonInteractive_07                ; $72C3: $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ; $72C6: $CD $C3 $7D
    call AddEntityZSpeedToPos_07                  ; $72C9: $CD $43 $7E
    ld   hl, wEntitiesSpeedZTable                 ; $72CC: $21 $20 $C3
    add  hl, bc                                   ; $72CF: $09
    dec  [hl]                                     ; $72D0: $35
    dec  [hl]                                     ; $72D1: $35
    ld   hl, wEntitiesPosZTable                   ; $72D2: $21 $10 $C3
    add  hl, bc                                   ; $72D5: $09
    ld   a, [hl]                                  ; $72D6: $7E
    and  $80                                      ; $72D7: $E6 $80
    ldh  [hMultiPurposeG], a                      ; $72D9: $E0 $E8
    jr   z, jr_007_72E3                           ; $72DB: $28 $06

    ld   [hl], b                                  ; $72DD: $70
    ld   hl, wEntitiesSpeedZTable                 ; $72DE: $21 $20 $C3
    add  hl, bc                                   ; $72E1: $09
    ld   [hl], b                                  ; $72E2: $70

jr_007_72E3:
    ldh  a, [hActiveEntityState]                  ; $72E3: $F0 $F0
    JP_TABLE                                      ; $72E5
._00 dw func_007_72F4                             ; $72E6
._01 dw func_007_7320                             ; $72E8
._02 dw func_007_7350                             ; $72EA
._03 dw func_007_735C                             ; $72EC
._04 dw func_007_737C                             ; $72EE
._05 dw func_007_73A0                             ; $72F0
._06 dw func_007_73D7                             ; $72F2

func_007_72F4::
    call GetEntityTransitionCountdown             ; $72F4: $CD $05 $0C
    jr   nz, jr_007_731F                          ; $72F7: $20 $26

    call func_007_7E5D                            ; $72F9: $CD $5D $7E
    add  $20                                      ; $72FC: $C6 $20
    cp   $40                                      ; $72FE: $FE $40
    jr   nc, jr_007_731F                          ; $7300: $30 $1D

jr_007_7302:
    call func_007_7E6D                            ; $7302: $CD $6D $7E
    add  $20                                      ; $7305: $C6 $20
    cp   $40                                      ; $7307: $FE $40
    jr   nc, jr_007_731F                          ; $7309: $30 $14

    call IncrementEntityState                     ; $730B: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $730E: $CD $05 $0C
    ld   [hl], $20                                ; $7311: $36 $20
    call GetRandomByte                            ; $7313: $CD $0D $28
    and  $03                                      ; $7316: $E6 $03
    add  $03                                      ; $7318: $C6 $03
    ld   hl, wEntitiesPrivateState1Table          ; $731A: $21 $B0 $C2
    add  hl, bc                                   ; $731D: $09
    ld   [hl], a                                  ; $731E: $77

jr_007_731F:
    ret                                           ; $731F: $C9

func_007_7320::
    call GetEntityTransitionCountdown             ; $7320: $CD $05 $0C
    jr   nz, jr_007_7344                          ; $7323: $20 $1F

    ld   hl, wEntitiesPosZTable                   ; $7325: $21 $10 $C3
    add  hl, bc                                   ; $7328: $09
    ld   [hl], $08                                ; $7329: $36 $08
    ld   hl, wEntitiesSpeedZTable                 ; $732B: $21 $20 $C3
    add  hl, bc                                   ; $732E: $09
    ld   [hl], $08                                ; $732F: $36 $08
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7331: $21 $40 $C3
    add  hl, bc                                   ; $7334: $09
    ld   [hl], $12                                ; $7335: $36 $12
    ld   a, $03                                   ; $7337: $3E $03
    call SetEntitySpriteVariant                   ; $7339: $CD $0C $3B
    call IncrementEntityState                     ; $733C: $CD $12 $3B

func_007_733F::
    ld   a, JINGLE_JUMP                           ; $733F: $3E $24
    ldh  [hJingle], a                             ; $7341: $E0 $F2
    ret                                           ; $7343: $C9

jr_007_7344:
    ld   e, $01                                   ; $7344: $1E $01
    cp   $10                                      ; $7346: $FE $10
    jr   nc, jr_007_734C                          ; $7348: $30 $02

    ld   e, $02                                   ; $734A: $1E $02

jr_007_734C:
    ld   a, e                                     ; $734C: $7B
    jp   SetEntitySpriteVariant                   ; $734D: $C3 $0C $3B

func_007_7350::
    ldh  a, [hMultiPurposeG]                      ; $7350: $F0 $E8
    and  a                                        ; $7352: $A7
    ret  z                                        ; $7353: $C8

    call GetEntityTransitionCountdown             ; $7354: $CD $05 $0C
    ld   [hl], $20                                ; $7357: $36 $20
    jp   IncrementEntityState                     ; $7359: $C3 $12 $3B

func_007_735C::
    call label_3B70                               ; $735C: $CD $70 $3B
    call GetEntityTransitionCountdown             ; $735F: $CD $05 $0C
    jr   nz, jr_007_736C                          ; $7362: $20 $08

    ld   [hl], $10                                ; $7364: $36 $10
    call ClearEntitySpeed                         ; $7366: $CD $7F $3D
    jp   IncrementEntityState                     ; $7369: $C3 $12 $3B

jr_007_736C:
    ld   e, $08                                   ; $736C: $1E $08
    and  $04                                      ; $736E: $E6 $04
    jr   z, jr_007_7374                           ; $7370: $28 $02

    ld   e, $F8                                   ; $7372: $1E $F8

jr_007_7374:
    ld   hl, wEntitiesSpeedXTable                 ; $7374: $21 $40 $C2
    add  hl, bc                                   ; $7377: $09
    ld   [hl], e                                  ; $7378: $73
    jp   AddEntitySpeedToPos_07                   ; $7379: $C3 $17 $7E

func_007_737C::
    call label_3B39                               ; $737C: $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ; $737F: $CD $0A $7E
    call func_007_73F7                            ; $7382: $CD $F7 $73
    call GetEntityTransitionCountdown             ; $7385: $CD $05 $0C
    jr   nz, jr_007_739B                          ; $7388: $20 $11

    ld   a, $0C                                   ; $738A: $3E $0C
    call ApplyVectorTowardsLink_trampoline        ; $738C: $CD $AA $3B
    ld   hl, wEntitiesSpeedZTable                 ; $738F: $21 $20 $C3
    add  hl, bc                                   ; $7392: $09
    ld   [hl], $18                                ; $7393: $36 $18
    call func_007_733F                            ; $7395: $CD $3F $73
    call IncrementEntityState                     ; $7398: $CD $12 $3B

jr_007_739B:
    ld   a, $03                                   ; $739B: $3E $03
    jp   SetEntitySpriteVariant                   ; $739D: $C3 $0C $3B

func_007_73A0::
    call label_3B39                               ; $73A0: $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ; $73A3: $CD $0A $7E
    call func_007_73F7                            ; $73A6: $CD $F7 $73
    ldh  a, [hMultiPurposeG]                      ; $73A9: $F0 $E8
    and  a                                        ; $73AB: $A7
    jr   z, jr_007_73D2                           ; $73AC: $28 $24

    call ClearEntitySpeed                         ; $73AE: $CD $7F $3D
    call IncrementEntityState                     ; $73B1: $CD $12 $3B
    ld   [hl], $04                                ; $73B4: $36 $04
    call GetEntityTransitionCountdown             ; $73B6: $CD $05 $0C
    ld   [hl], $20                                ; $73B9: $36 $20
    ld   hl, wEntitiesPrivateState1Table          ; $73BB: $21 $B0 $C2
    add  hl, bc                                   ; $73BE: $09
    dec  [hl]                                     ; $73BF: $35
    jr   nz, jr_007_73D2                          ; $73C0: $20 $10

    call IncrementEntityState                     ; $73C2: $CD $12 $3B
    ld   [hl], $06                                ; $73C5: $36 $06
    call GetEntityTransitionCountdown             ; $73C7: $CD $05 $0C
    ld   [hl], $30                                ; $73CA: $36 $30
    ld   hl, wEntitiesPhysicsFlagsTable           ; $73CC: $21 $40 $C3
    add  hl, bc                                   ; $73CF: $09
    ld   [hl], $D2                                ; $73D0: $36 $D2

jr_007_73D2:
    ld   a, $02                                   ; $73D2: $3E $02
    jp   SetEntitySpriteVariant                   ; $73D4: $C3 $0C $3B

func_007_73D7::
    call GetEntityTransitionCountdown             ; $73D7: $CD $05 $0C
    jr   nz, jr_007_73E6                          ; $73DA: $20 $0A

    ld   [hl], $50                                ; $73DC: $36 $50
    call IncrementEntityState                     ; $73DE: $CD $12 $3B
    ld   [hl], b                                  ; $73E1: $70
    xor  a                                        ; $73E2: $AF
    jp   SetEntitySpriteVariant                   ; $73E3: $C3 $0C $3B

jr_007_73E6:
    ld   e, $03                                   ; $73E6: $1E $03
    cp   $20                                      ; $73E8: $FE $20
    jr   nc, jr_007_73F3                          ; $73EA: $30 $07

    ld   e, $01                                   ; $73EC: $1E $01
    cp   $10                                      ; $73EE: $FE $10
    jr   c, jr_007_73F3                           ; $73F0: $38 $01

    inc  e                                        ; $73F2: $1C

jr_007_73F3:
    ld   a, e                                     ; $73F3: $7B
    jp   SetEntitySpriteVariant                   ; $73F4: $C3 $0C $3B

func_007_73F7::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $73F7: $21 $10 $C4
    add  hl, bc                                   ; $73FA: $09
    ld   [hl], $03                                ; $73FB: $36 $03
    call label_3B23                               ; $73FD: $CD $23 $3B
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7400: $21 $10 $C4
    add  hl, bc                                   ; $7403: $09
    ld   [hl], b                                  ; $7404: $70
    ret                                           ; $7405: $C9

FlyingTilesEntityHandler::
    call ReturnIfNonInteractive_07                ; $7406: $CD $96 $7D
    ldh  a, [hActiveEntityState]                  ; $7409: $F0 $F0
    JP_TABLE                                      ; $740B
._00 dw func_007_7410                             ; $740C
._01 dw func_007_74A8                             ; $740E

func_007_7410::
    ldh  a, [hActiveEntityPosX]                   ; $7410: $F0 $EE
    and  $70                                      ; $7412: $E6 $70
    ld   [wD201], a                               ; $7414: $EA $01 $D2
    call GetEntityTransitionCountdown             ; $7417: $CD $05 $0C
    ld   [hl], $80                                ; $741A: $36 $80
    jp   IncrementEntityState                     ; $741C: $C3 $12 $3B

Data_007_741F::
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $21, $28, $53, $56, $34, $45, $35, $44, $31, $48, $38, $41, $14, $66, $15, $63
    db   $31, $45, $38, $44, $13, $56, $16, $53, $27, $42, $47, $22, $65, $33, $64, $36
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54
    db   $23, $56, $26, $53, $32, $47, $42, $37, $33, $46, $43, $36, $24, $55, $25, $54

Data_007_749F::
    db   $30, $30, $30, $30, $30, $30, $30, $28, $28

func_007_74A8::
    ld   hl, wEntitiesInertiaTable                ; $74A8: $21 $D0 $C3
    add  hl, bc                                   ; $74AB: $09
    ld   a, [hl]                                  ; $74AC: $7E
    cp   $10                                      ; $74AD: $FE $10
    jp   z, func_007_7EA4                         ; $74AF: $CA $A4 $7E

    call GetEntityTransitionCountdown             ; $74B2: $CD $05 $0C
    jr   nz, jr_007_752C                          ; $74B5: $20 $75

    push hl                                       ; $74B7: $E5
    ldh  a, [hMapId]                              ; $74B8: $F0 $F7
    ld   e, a                                     ; $74BA: $5F
    ld   d, b                                     ; $74BB: $50
    ld   hl, Data_007_749F                        ; $74BC: $21 $9F $74
    add  hl, de                                   ; $74BF: $19
    ld   a, [hl]                                  ; $74C0: $7E
    pop  hl                                       ; $74C1: $E1
    ld   [hl], a                                  ; $74C2: $77
    ld   a, ENTITY_FACADE                         ; $74C3: $3E $5A
    call SpawnNewEntity_trampoline                ; $74C5: $CD $86 $3B
    jr   c, jr_007_752C                           ; $74C8: $38 $62

jr_007_74CA:
    ld   hl, wEntitiesPrivateState1Table          ; $74CA: $21 $B0 $C2
    add  hl, de                                   ; $74CD: $19
    ld   [hl], $02                                ; $74CE: $36 $02
    push bc                                       ; $74D0: $C5

jr_007_74D1:
    ld   a, [wD201]                               ; $74D1: $FA $01 $D2
    ld   hl, wEntitiesInertiaTable                ; $74D4: $21 $D0 $C3
    add  hl, bc                                   ; $74D7: $09
    add  [hl]                                     ; $74D8: $86
    inc  [hl]                                     ; $74D9: $34
    ld   c, a                                     ; $74DA: $4F
    ld   hl, wEntitiesPrivateState4Table          ; $74DB: $21 $40 $C4
    add  hl, de                                   ; $74DE: $19
    ldh  a, [hActiveEntityPosY]                   ; $74DF: $F0 $EF
    sub  $10                                      ; $74E1: $D6 $10
    and  $F0                                      ; $74E3: $E6 $F0
    jr   z, jr_007_74E8                           ; $74E5: $28 $01

    ld   [hl], a                                  ; $74E7: $77

jr_007_74E8:
    ld   a, c                                     ; $74E8: $79
    cp   $0F                                      ; $74E9: $FE $0F
    jr   nz, jr_007_74F8                          ; $74EB: $20 $0B

    ld   a, [wRoomEvent]                          ; $74ED: $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ; $74F0: $E6 $1F
    cp   TRIGGER_STEP_ON_BUTTON                   ; $74F2: $FE $03
    jr   nz, jr_007_74F8                          ; $74F4: $20 $02

    ld   [hl], $01                                ; $74F6: $36 $01

jr_007_74F8:
    ld   hl, Data_007_741F                        ; $74F8: $21 $1F $74
    add  hl, bc                                   ; $74FB: $09
    ld   a, [hl]                                  ; $74FC: $7E
    push af                                       ; $74FD: $F5
    swap a                                        ; $74FE: $CB $37
    and  $F0                                      ; $7500: $E6 $F0
    or   $08                                      ; $7502: $F6 $08
    ld   hl, wEntitiesPosXTable                   ; $7504: $21 $00 $C2
    add  hl, de                                   ; $7507: $19
    ld   [hl], a                                  ; $7508: $77
    pop  af                                       ; $7509: $F1
    and  $F0                                      ; $750A: $E6 $F0
    add  $10                                      ; $750C: $C6 $10
    ld   hl, wEntitiesPosYTable                   ; $750E: $21 $10 $C2
    add  hl, de                                   ; $7511: $19
    ld   [hl], a                                  ; $7512: $77
    ld   hl, wEntitiesPhysicsFlagsTable           ; $7513: $21 $40 $C3
    add  hl, de                                   ; $7516: $19
    ld   [hl], $12                                ; $7517: $36 $12
    ld   hl, wEntitiesHitboxFlagsTable            ; $7519: $21 $50 $C3
    add  hl, de                                   ; $751C: $19
    ld   [hl], $00                                ; $751D: $36 $00
    ld   hl, wEntitiesOptions1Table               ; $751F: $21 $30 $C4
    add  hl, de                                   ; $7522: $19
    ld   [hl], ENTITY_OPT1_NONE                   ; $7523: $36 $00
    ld   hl, wEntitiesHealthGroup                 ; $7525: $21 $D0 $C4
    add  hl, de                                   ; $7528: $19
    ld   [hl], $00                                ; $7529: $36 $00
    pop  bc                                       ; $752B: $C1

jr_007_752C:
    ret                                           ; $752C: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
WaterTektiteSpriteVariants::
.variant0
    db $70, $00
    db $70, $20
.variant1
    db $72, $00
    db $72, $20

WaterTektiteEntityHandler::
    ld   de, WaterTektiteSpriteVariants           ; $7535: $11 $2D $75
    call RenderActiveEntitySpritesPair            ; $7538: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $753B: $CD $96 $7D
    call ApplyRecoilIfNeeded_07                   ; $753E: $CD $C3 $7D
    ldh  a, [hFrameCounter]                       ; $7541: $F0 $E7
    rra                                           ; $7543: $1F
    rra                                           ; $7544: $1F
    rra                                           ; $7545: $1F
    rra                                           ; $7546: $1F

jr_007_7547:
    and  $01                                      ; $7547: $E6 $01
    call SetEntitySpriteVariant                   ; $7549: $CD $0C $3B
    call UpdateEntityPosWithSpeed_07              ; $754C: $CD $0A $7E
    call label_3B23                               ; $754F: $CD $23 $3B
    ld   hl, wEntitiesCollisionsTable             ; $7552: $21 $A0 $C2
    add  hl, bc                                   ; $7555: $09
    ld   a, [hl]                                  ; $7556: $7E
    and  $0F                                      ; $7557: $E6 $0F
    jr   z, jr_007_756A                           ; $7559: $28 $0F

    call GetEntityTransitionCountdown             ; $755B: $CD $05 $0C
    ld   [hl], $10                                ; $755E: $36 $10
    call ClearEntitySpeed                         ; $7560: $CD $7F $3D
    call IncrementEntityState                     ; $7563: $CD $12 $3B
    xor  a                                        ; $7566: $AF
    ld   [hl], a                                  ; $7567: $77
    ldh  [hActiveEntityState], a                  ; $7568: $E0 $F0

jr_007_756A:
    call label_3B39                               ; $756A: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $756D: $F0 $F0
    JP_TABLE                                      ; $756F
._00 dw func_007_7576                             ; $7570
._01 dw func_007_7597                             ; $7572
._02 dw func_007_75B7                             ; $7574

func_007_7576::
    call GetEntityTransitionCountdown             ; $7576: $CD $05 $0C
    jr   nz, jr_007_7596                          ; $7579: $20 $1B

    ld   [hl], $20                                ; $757B: $36 $20
    call IncrementEntityState                     ; $757D: $CD $12 $3B
    call GetRandomByte                            ; $7580: $CD $0D $28
    and  $02                                      ; $7583: $E6 $02
    dec  a                                        ; $7585: $3D
    ld   hl, wEntitiesPrivateState1Table          ; $7586: $21 $B0 $C2
    add  hl, bc                                   ; $7589: $09
    ld   [hl], a                                  ; $758A: $77
    call GetRandomByte                            ; $758B: $CD $0D $28
    and  $02                                      ; $758E: $E6 $02
    dec  a                                        ; $7590: $3D
    ld   hl, wEntitiesPrivateState2Table          ; $7591: $21 $C0 $C2
    add  hl, bc                                   ; $7594: $09
    ld   [hl], a                                  ; $7595: $77

jr_007_7596:
    ret                                           ; $7596: $C9

func_007_7597::
    call GetEntityTransitionCountdown             ; $7597: $CD $05 $0C
    jp   z, IncrementEntityState                  ; $759A: $CA $12 $3B

    and  $01                                      ; $759D: $E6 $01
    jr   nz, jr_007_75B6                          ; $759F: $20 $15

    ld   hl, wEntitiesPrivateState1Table          ; $75A1: $21 $B0 $C2

jr_007_75A4:
    add  hl, bc                                   ; $75A4: $09
    ld   a, [hl]                                  ; $75A5: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $75A6: $21 $40 $C2
    add  hl, bc                                   ; $75A9: $09
    add  [hl]                                     ; $75AA: $86
    ld   [hl], a                                  ; $75AB: $77
    ld   hl, wEntitiesPrivateState2Table          ; $75AC: $21 $C0 $C2
    add  hl, bc                                   ; $75AF: $09
    ld   a, [hl]                                  ; $75B0: $7E
    call GetEntitySpeedYAddress                   ; $75B1: $CD $05 $40
    add  [hl]                                     ; $75B4: $86
    ld   [hl], a                                  ; $75B5: $77

jr_007_75B6:
    ret                                           ; $75B6: $C9

func_007_75B7::
    ldh  a, [hFrameCounter]                       ; $75B7: $F0 $E7
    and  $01                                      ; $75B9: $E6 $01
    jr   nz, jr_007_75DD                          ; $75BB: $20 $20

    ld   hl, wEntitiesSpeedXTable                 ; $75BD: $21 $40 $C2
    add  hl, bc                                   ; $75C0: $09
    ld   a, [hl]                                  ; $75C1: $7E
    and  a                                        ; $75C2: $A7
    jr   nz, jr_007_75CF                          ; $75C3: $20 $0A

    call IncrementEntityState                     ; $75C5: $CD $12 $3B
    ld   [hl], b                                  ; $75C8: $70
    call GetEntityTransitionCountdown             ; $75C9: $CD $05 $0C
    ld   [hl], $10                                ; $75CC: $36 $10
    ret                                           ; $75CE: $C9

jr_007_75CF:
    call func_007_75D6                            ; $75CF: $CD $D6 $75
    call GetEntitySpeedYAddress                   ; $75D2: $CD $05 $40
    ld   a, [hl]                                  ; $75D5: $7E

func_007_75D6::
    bit  7, a                                     ; $75D6: $CB $7F
    jr   z, jr_007_75DC                           ; $75D8: $28 $02

    inc  [hl]                                     ; $75DA: $34
    inc  [hl]                                     ; $75DB: $34

jr_007_75DC:
    dec  [hl]                                     ; $75DC: $35

jr_007_75DD:
    ret                                           ; $75DD: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
HorsePieceSpriteVariants::
.variant0
    db $60, $03
    db $62, $03
.variant1
    db $64, $03
    db $66, $03
.variant2
    db $62, $63
    db $60, $63
.variant3
    db $66, $63
    db $64, $63
.variant4
    db $66, $23
    db $64, $23

HorsePieceEntityHandler::
    ld   hl, wEntitiesLoadOrderTable              ; $75F2: $21 $60 $C4
    add  hl, bc                                   ; $75F5: $09
    ld   a, [hl]                                  ; $75F6: $7E
    and  a                                        ; $75F7: $A7
    jr   z, jr_007_75FE                           ; $75F8: $28 $04

    ld   a, c                                     ; $75FA: $79
    ld   [wD201], a                               ; $75FB: $EA $01 $D2

jr_007_75FE:
    ld   de, HorsePieceSpriteVariants             ; $75FE: $11 $DE $75
    call RenderActiveEntitySpritesPair            ; $7601: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $7604: $CD $96 $7D
    call UpdateEntityPosWithSpeed_07              ; $7607: $CD $0A $7E
    call AddEntityZSpeedToPos_07                  ; $760A: $CD $43 $7E
    call label_3B23                               ; $760D: $CD $23 $3B
    ld   hl, wEntitiesSpeedZTable                 ; $7610: $21 $20 $C3
    add  hl, bc                                   ; $7613: $09
    dec  [hl]                                     ; $7614: $35
    dec  [hl]                                     ; $7615: $35
    ld   hl, wEntitiesPosZTable                   ; $7616: $21 $10 $C3
    add  hl, bc                                   ; $7619: $09
    ld   a, [hl]                                  ; $761A: $7E
    ldh  [hMultiPurposeG], a                      ; $761B: $E0 $E8
    dec  a                                        ; $761D: $3D
    and  $80                                      ; $761E: $E6 $80
    jr   z, jr_007_7633                           ; $7620: $28 $11

    ld   [hl], b                                  ; $7622: $70
    ld   hl, wEntitiesSpeedZTable                 ; $7623: $21 $20 $C3
    add  hl, bc                                   ; $7626: $09
    ld   a, [hl]                                  ; $7627: $7E
    ldh  [hDungeonFloorTile], a                   ; $7628: $E0 $E9
    sra  a                                        ; $762A: $CB $2F
    cpl                                           ; $762C: $2F
    cp   $07                                      ; $762D: $FE $07
    jr   nc, jr_007_7632                          ; $762F: $30 $01

    xor  a                                        ; $7631: $AF

jr_007_7632:
    ld   [hl], a                                  ; $7632: $77

jr_007_7633:
    ldh  a, [hActiveEntityState]                  ; $7633: $F0 $F0
    JP_TABLE                                      ; $7635
._00 dw func_007_7640                             ; $7636
._01 dw func_007_7640                             ; $7638
._02 dw func_007_7657                             ; $763A
._03 dw func_007_76EE                             ; $763C
._04 dw func_007_7724                             ; $763E

func_007_7640::
    jp   label_007_7733                           ; $7640: $C3 $33 $77

Data_007_7643::
    db   $00, $0C, $10, $0C, $00, $F4, $F0, $F4

Data_007_764B::
    db   $F0, $F4, $00, $0C, $10, $0C, $00, $F4

Data_007_7653::
    db   $00, $01, $04, $00

func_007_7657::
    call GetEntityTransitionCountdown             ; $7657: $CD $05 $0C
    jr   nz, jr_007_7671                          ; $765A: $20 $15

    call ClearEntitySpeed                         ; $765C: $CD $7F $3D
    call IncrementEntityState                     ; $765F: $CD $12 $3B
    call GetRandomByte                            ; $7662: $CD $0D $28
    and  $03                                      ; $7665: $E6 $03
    ld   e, a                                     ; $7667: $5F
    ld   d, b                                     ; $7668: $50
    ld   hl, Data_007_7653                        ; $7669: $21 $53 $76
    add  hl, de                                   ; $766C: $19
    ld   a, [hl]                                  ; $766D: $7E
    jp   SetEntitySpriteVariant                   ; $766E: $C3 $0C $3B

jr_007_7671:
    and  $07                                      ; $7671: $E6 $07
    jr   nz, jr_007_767E                          ; $7673: $20 $09

    ld   hl, wEntitiesSpriteVariantTable          ; $7675: $21 $B0 $C3
    add  hl, bc                                   ; $7678: $09
    ld   a, [hl]                                  ; $7679: $7E
    inc  a                                        ; $767A: $3C
    and  $03                                      ; $767B: $E6 $03
    ld   [hl], a                                  ; $767D: $77

jr_007_767E:
    ldh  a, [hMultiPurposeG]                      ; $767E: $F0 $E8
    dec  a                                        ; $7680: $3D
    and  $80                                      ; $7681: $E6 $80
    jr   z, jr_007_76C2                           ; $7683: $28 $3D

    call func_007_76E7                            ; $7685: $CD $E7 $76
    ldh  a, [hDungeonFloorTile]                   ; $7688: $F0 $E9
    sub  $FC                                      ; $768A: $D6 $FC
    and  $80                                      ; $768C: $E6 $80
    jr   nz, jr_007_7696                          ; $768E: $20 $06

    ldh  a, [hFrameCounter]                       ; $7690: $F0 $E7
    and  $07                                      ; $7692: $E6 $07
    jr   nz, jr_007_76C2                          ; $7694: $20 $2C

jr_007_7696:
    call GetRandomByte                            ; $7696: $CD $0D $28
    and  $01                                      ; $7699: $E6 $01
    ld   e, $01                                   ; $769B: $1E $01
    jr   z, jr_007_76A1                           ; $769D: $28 $02

    ld   e, $FF                                   ; $769F: $1E $FF

jr_007_76A1:
    ld   hl, wEntitiesDirectionTable              ; $76A1: $21 $80 $C3
    add  hl, bc                                   ; $76A4: $09
    ld   a, [hl]                                  ; $76A5: $7E
    add  e                                        ; $76A6: $83
    and  $07                                      ; $76A7: $E6 $07
    ld   [hl], a                                  ; $76A9: $77
    ld   e, a                                     ; $76AA: $5F
    ld   d, b                                     ; $76AB: $50
    ld   hl, Data_007_7643                        ; $76AC: $21 $43 $76
    add  hl, de                                   ; $76AF: $19
    ld   a, [hl]                                  ; $76B0: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $76B1: $21 $40 $C2
    add  hl, bc                                   ; $76B4: $09
    ld   [hl], a                                  ; $76B5: $77
    ld   hl, Data_007_764B                        ; $76B6: $21 $4B $76
    add  hl, de                                   ; $76B9: $19
    ld   a, [hl]                                  ; $76BA: $7E
    call GetEntitySpeedYAddress                   ; $76BB: $CD $05 $40
    ld   [hl], a                                  ; $76BE: $77
    call func_007_76E7                            ; $76BF: $CD $E7 $76

jr_007_76C2:
    ld   hl, wEntitiesCollisionsTable             ; $76C2: $21 $A0 $C2
    add  hl, bc                                   ; $76C5: $09
    ld   a, [hl]                                  ; $76C6: $7E
    and  a                                        ; $76C7: $A7
    jr   z, jr_007_76ED                           ; $76C8: $28 $23

    ld   hl, wEntitiesDirectionTable              ; $76CA: $21 $80 $C3
    add  hl, bc                                   ; $76CD: $09
    ld   a, [hl]                                  ; $76CE: $7E
    xor  $04                                      ; $76CF: $EE $04
    ld   [hl], a                                  ; $76D1: $77
    call GetEntityTransitionCountdown             ; $76D2: $CD $05 $0C
    srl  [hl]                                     ; $76D5: $CB $3E
    ld   hl, wEntitiesSpeedXTable                 ; $76D7: $21 $40 $C2
    call func_007_76E0                            ; $76DA: $CD $E0 $76
    ld   hl, wEntitiesSpeedYTable                 ; $76DD: $21 $50 $C2

func_007_76E0::
    add  hl, bc                                   ; $76E0: $09
    ld   a, [hl]                                  ; $76E1: $7E
    cpl                                           ; $76E2: $2F
    sra  a                                        ; $76E3: $CB $2F
    inc  a                                        ; $76E5: $3C
    ld   [hl], a                                  ; $76E6: $77

func_007_76E7::
    ld   hl, wC5D0                                ; $76E7: $21 $D0 $C5
    add  hl, bc                                   ; $76EA: $09
    ld   [hl], $FF                                ; $76EB: $36 $FF

jr_007_76ED:
    ret                                           ; $76ED: $C9

func_007_76EE::
    ld   hl, wEntitiesLoadOrderTable              ; $76EE: $21 $60 $C4
    add  hl, bc                                   ; $76F1: $09
    ld   a, [hl]                                  ; $76F2: $7E
    and  a                                        ; $76F3: $A7
    ret  nz                                       ; $76F4: $C0

    ld   a, [wD201]                               ; $76F5: $FA $01 $D2
    ld   e, a                                     ; $76F8: $5F
    ld   d, b                                     ; $76F9: $50
    ld   hl, wEntitiesStateTable                  ; $76FA: $21 $90 $C2
    add  hl, de                                   ; $76FD: $19
    ld   a, [hl]                                  ; $76FE: $7E
    cp   $03                                      ; $76FF: $FE $03
    ret  nz                                       ; $7701: $C0

    inc  [hl]                                     ; $7702: $34
    call IncrementEntityState                     ; $7703: $CD $12 $3B
    ldh  a, [hActiveEntitySpriteVariant]          ; $7706: $F0 $F1
    cp   $00                                      ; $7708: $FE $00
    jr   nz, jr_007_7716                          ; $770A: $20 $0A

    ld   hl, wEntitiesSpriteVariantTable          ; $770C: $21 $B0 $C3
    add  hl, de                                   ; $770F: $19
    ld   a, [hl]                                  ; $7710: $7E
    cp   $00                                      ; $7711: $FE $00
    jp   z, MarkTriggerAsResolved                 ; $7713: $CA $60 $0C

jr_007_7716:
    ld   hl, wEntitiesTransitionCountdownTable    ; $7716: $21 $E0 $C2
    add  hl, de                                   ; $7719: $19
    ld   [hl], $40                                ; $771A: $36 $40
    call GetEntityTransitionCountdown             ; $771C: $CD $05 $0C
    ld   [hl], $40                                ; $771F: $36 $40
    jp   PlayWrongAnswerJingle                    ; $7721: $C3 $20 $0C

func_007_7724::
    call GetEntityTransitionCountdown             ; $7724: $CD $05 $0C
    cp   $01                                      ; $7727: $FE $01
    jr   nz, jr_007_7730                          ; $7729: $20 $05

    ld   a, $01                                   ; $772B: $3E $01
    call SetEntitySpriteVariant                   ; $772D: $CD $0C $3B

jr_007_7730:
    jp   label_007_7733                           ; $7730: $C3 $33 $77

label_007_7733:
    call CheckLinkCollisionWithEnemy_trampoline   ; $7733: $CD $5A $3B
    jr   nc, jr_007_7783                          ; $7736: $30 $4B

    ld   a, [wLinkAttackStepAnimationCountdown]   ; $7738: $FA $9B $C1
    and  a                                        ; $773B: $A7
    jr   nz, jr_007_7783                          ; $773C: $20 $45

    ld   a, [wBButtonSlot]                        ; $773E: $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $7741: $FE $03
    jr   nz, jr_007_774D                          ; $7743: $20 $08

    ldh  a, [hJoypadState]                        ; $7745: $F0 $CC
    and  J_B                                      ; $7747: $E6 $20
    jr   nz, jr_007_775A                          ; $7749: $20 $0F

    jr   jr_007_7783                              ; $774B: $18 $36

jr_007_774D:
    ld   a, [wAButtonSlot]                        ; $774D: $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ; $7750: $FE $03
    jr   nz, jr_007_7783                          ; $7752: $20 $2F

    ldh  a, [hJoypadState]                        ; $7754: $F0 $CC
    and  J_A                                      ; $7756: $E6 $10
    jr   z, jr_007_7783                           ; $7758: $28 $29

jr_007_775A:
    ld   a, [wC3CF]                               ; $775A: $FA $CF $C3
    and  a                                        ; $775D: $A7
    jr   nz, jr_007_7783                          ; $775E: $20 $23

    inc  a                                        ; $7760: $3C
    ld   [wC3CF], a                               ; $7761: $EA $CF $C3
    call IncrementEntityState                     ; $7764: $CD $12 $3B
    ld   [hl], $02                                ; $7767: $36 $02
    ld   hl, wEntitiesStatusTable                 ; $7769: $21 $80 $C2
    add  hl, bc                                   ; $776C: $09
    ld   [hl], $07                                ; $776D: $36 $07
    ld   hl, wEntitiesLiftedTable                 ; $776F: $21 $90 $C4
    add  hl, bc                                   ; $7772: $09
    ld   [hl], b                                  ; $7773: $70
    ldh  a, [hLinkDirection]                      ; $7774: $F0 $9E
    ld   [wC15D], a                               ; $7776: $EA $5D $C1
    call GetEntityTransitionCountdown             ; $7779: $CD $05 $0C
    ld   [hl], $02                                ; $777C: $36 $02
    ld   hl, hWaveSfx                             ; $777E: $21 $F3 $FF
    ld   [hl], $02                                ; $7781: $36 $02

jr_007_7783:
    ret                                           ; $7783: $C9

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SpikedBeetle1SpriteVariants:: ; $7784
.variant0
    db $70, $00
    db $70, $20
.variant1
    db $72, $00
    db $72, $20
.variant2
    db $74, $00
    db $74, $20
.variant3
    db $76, $00
    db $76, $20

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
SpikedBeetle2SpriteVariants::
.variant0
    db $60, $00
    db $60, $20
.variant1
    db $62, $00
    db $62, $20
.variant2
    db $64, $00
    db $64, $20
.variant3
    db $66, $00
    db $66, $20

SpikedBeetleEntityHandler::
    ld   de, SpikedBeetle1SpriteVariants          ; $77A4: $11 $84 $77
    ldh  a, [hMapId]                              ; $77A7: $F0 $F7
    cp   MAP_ANGLERS_TUNNEL                       ; $77A9: $FE $03
    jr   nz, .render                              ; $77AB: $20 $03

    ld   de, SpikedBeetle2SpriteVariants          ; $77AD: $11 $94 $77

.render
    call RenderActiveEntitySpritesPair            ; $77B0: $CD $C0 $3B
    call ReturnIfNonInteractive_07                ; $77B3: $CD $96 $7D

jr_007_77B6:
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $77B6: $21 $10 $C4
    add  hl, bc                                   ; $77B9: $09
    ld   a, [hl]                                  ; $77BA: $7E
    and  a                                        ; $77BB: $A7
    jr   z, jr_007_77C1                           ; $77BC: $28 $03

    call ClearEntitySpeed                         ; $77BE: $CD $7F $3D

jr_007_77C1:
    call ApplyRecoilIfNeeded_07                   ; $77C1: $CD $C3 $7D
    call label_3B39                               ; $77C4: $CD $39 $3B
    call UpdateEntityPosWithSpeed_07              ; $77C7: $CD $0A $7E
    call AddEntityZSpeedToPos_07                  ; $77CA: $CD $43 $7E
    call label_3B23                               ; $77CD: $CD $23 $3B
    ld   hl, wEntitiesSpeedZTable                 ; $77D0: $21 $20 $C3
    add  hl, bc                                   ; $77D3: $09
    dec  [hl]                                     ; $77D4: $35
    dec  [hl]                                     ; $77D5: $35
    ld   hl, wEntitiesPosZTable                   ; $77D6: $21 $10 $C3
    add  hl, bc                                   ; $77D9: $09
    ld   a, [hl]                                  ; $77DA: $7E
    bit  7, a                                     ; $77DB: $CB $7F
    jr   nz, jr_007_77E2                          ; $77DD: $20 $03

    and  a                                        ; $77DF: $A7
    jr   nz, jr_007_780D                          ; $77E0: $20 $2B

jr_007_77E2:
    ld   [hl], b                                  ; $77E2: $70
    ldh  a, [hActiveEntityState]                  ; $77E3: $F0 $F0
    cp   $03                                      ; $77E5: $FE $03
    jr   nz, jr_007_7808                          ; $77E7: $20 $1F

    ld   hl, wEntitiesSpeedXTable                 ; $77E9: $21 $40 $C2
    add  hl, bc                                   ; $77EC: $09
    sra  [hl]                                     ; $77ED: $CB $2E
    call GetEntitySpeedYAddress                   ; $77EF: $CD $05 $40
    sra  [hl]                                     ; $77F2: $CB $2E
    ld   hl, wEntitiesSpeedZTable                 ; $77F4: $21 $20 $C3
    add  hl, bc                                   ; $77F7: $09
    ld   a, [hl]                                  ; $77F8: $7E
    sra  a                                        ; $77F9: $CB $2F

jr_007_77FB:
    cpl                                           ; $77FB: $2F
    ld   [hl], a                                  ; $77FC: $77
    cp   $07                                      ; $77FD: $FE $07
    jp   nc, jr_007_780D                          ; $77FF: $D2 $0D $78

    ld   [hl], b                                  ; $7802: $70
    call ClearEntitySpeed                         ; $7803: $CD $7F $3D
    jr   jr_007_780D                              ; $7806: $18 $05

jr_007_7808:
    ld   hl, wEntitiesSpeedZTable                 ; $7808: $21 $20 $C3
    add  hl, bc                                   ; $780B: $09
    ld   [hl], b                                  ; $780C: $70

jr_007_780D:
    ldh  a, [hActiveEntityState]                  ; $780D: $F0 $F0
    cp   $04                                      ; $780F: $FE $04
    jr   c, jr_007_7814                           ; $7811: $38 $01

    ret                                           ; $7813: $C9

jr_007_7814:
    JP_TABLE                                      ; $7814
._00 dw func_007_7825                             ; $7815
._01 dw func_007_7860                             ; $7817
._02 dw func_007_78A5                             ; $7819
._03 dw func_007_78EC                             ; $781B

Data_007_781D::
    db   $06, $FA, $00, $00

Data_007_7821::
    db   $00, $00, $FA, $06

func_007_7825::
    call ClearEntitySpeed                         ; $7825: $CD $7F $3D
    call GetEntityTransitionCountdown             ; $7828: $CD $05 $0C
    jr   nz, jr_007_785E                          ; $782B: $20 $31

    call GetRandomByte                            ; $782D: $CD $0D $28
    and  $1F                                      ; $7830: $E6 $1F
    add  $30                                      ; $7832: $C6 $30
    ld   [hl], a                                  ; $7834: $77
    call IncrementEntityState                     ; $7835: $CD $12 $3B
    call GetRandomByte                            ; $7838: $CD $0D $28
    and  $06                                      ; $783B: $E6 $06
    jr   nz, jr_007_7844                          ; $783D: $20 $05

    call func_007_7E7D                            ; $783F: $CD $7D $7E
    jr   jr_007_784A                              ; $7842: $18 $06

jr_007_7844:
    call GetRandomByte                            ; $7844: $CD $0D $28
    and  $03                                      ; $7847: $E6 $03
    ld   e, a                                     ; $7849: $5F

jr_007_784A:
    ld   d, b                                     ; $784A: $50
    ld   hl, Data_007_781D                        ; $784B: $21 $1D $78
    add  hl, de                                   ; $784E: $19
    ld   a, [hl]                                  ; $784F: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7850: $21 $40 $C2
    add  hl, bc                                   ; $7853: $09
    ld   [hl], a                                  ; $7854: $77
    ld   hl, Data_007_7821                        ; $7855: $21 $21 $78
    add  hl, de                                   ; $7858: $19
    ld   a, [hl]                                  ; $7859: $7E
    call GetEntitySpeedYAddress                   ; $785A: $CD $05 $40
    ld   [hl], a                                  ; $785D: $77

jr_007_785E:
    jr   jr_007_786E                              ; $785E: $18 $0E

func_007_7860::
    call GetEntityTransitionCountdown             ; $7860: $CD $05 $0C
    jr   nz, jr_007_786B                          ; $7863: $20 $06

    ld   [hl], $18                                ; $7865: $36 $18
    call IncrementEntityState                     ; $7867: $CD $12 $3B
    ld   [hl], b                                  ; $786A: $70

jr_007_786B:
    call func_007_78E1                            ; $786B: $CD $E1 $78

jr_007_786E:
    ld   hl, wEntitiesHitboxFlagsTable            ; $786E: $21 $50 $C3
    add  hl, bc                                   ; $7871: $09
    ld   [hl], $80                                ; $7872: $36 $80
    ld   hl, wEntitiesOptions1Table               ; $7874: $21 $30 $C4
    add  hl, bc                                   ; $7877: $09
    ld   [hl], ENTITY_OPT1_SWORD_CLINK_OFF|ENTITY_OPT1_SPLASH_IN_WATER ; $7878: $36 $48
    call func_007_7E5D                            ; $787A: $CD $5D $7E
    add  $06                                      ; $787D: $C6 $06
    cp   $0A                                      ; $787F: $FE $0A
    jr   c, jr_007_788C                           ; $7881: $38 $09

    call func_007_7E6D                            ; $7883: $CD $6D $7E
    add  $06                                      ; $7886: $C6 $06
    cp   $0A                                      ; $7888: $FE $0A
    jr   nc, jr_007_789C                          ; $788A: $30 $10

jr_007_788C:
    call func_007_7E7D                            ; $788C: $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ; $788F: $21 $80 $C3
    add  hl, bc                                   ; $7892: $09
    ld   [hl], e                                  ; $7893: $73
    call IncrementEntityState                     ; $7894: $CD $12 $3B
    call GetEntityTransitionCountdown             ; $7897: $CD $05 $0C
    ld   [hl], $FF                                ; $789A: $36 $FF

jr_007_789C:
    ret                                           ; $789C: $C9

Data_007_789D::
    db   $18, $E8, $00, $00

Data_007_78A1::
    db   $00, $00, $E8, $18

func_007_78A5::
    call GetEntityTransitionCountdown             ; $78A5: $CD $05 $0C
    jr   z, jr_007_78DD                           ; $78A8: $28 $33

    ld   hl, wEntitiesDirectionTable              ; $78AA: $21 $80 $C3
    add  hl, bc                                   ; $78AD: $09
    ld   e, [hl]                                  ; $78AE: $5E
    ld   d, b                                     ; $78AF: $50
    ld   hl, Data_007_789D                        ; $78B0: $21 $9D $78
    add  hl, de                                   ; $78B3: $19
    ld   a, [hl]                                  ; $78B4: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $78B5: $21 $40 $C2
    add  hl, bc                                   ; $78B8: $09
    sub  [hl]                                     ; $78B9: $96
    jr   z, jr_007_78C3                           ; $78BA: $28 $07

    and  $80                                      ; $78BC: $E6 $80
    jr   nz, jr_007_78C2                          ; $78BE: $20 $02

    inc  [hl]                                     ; $78C0: $34
    inc  [hl]                                     ; $78C1: $34

jr_007_78C2:
    dec  [hl]                                     ; $78C2: $35

jr_007_78C3:
    ld   hl, Data_007_78A1                        ; $78C3: $21 $A1 $78
    add  hl, de                                   ; $78C6: $19
    ld   a, [hl]                                  ; $78C7: $7E
    call GetEntitySpeedYAddress                   ; $78C8: $CD $05 $40
    sub  [hl]                                     ; $78CB: $96
    jr   z, jr_007_78D5                           ; $78CC: $28 $07

    and  $80                                      ; $78CE: $E6 $80
    jr   nz, jr_007_78D4                          ; $78D0: $20 $02

    inc  [hl]                                     ; $78D2: $34
    inc  [hl]                                     ; $78D3: $34

jr_007_78D4:
    dec  [hl]                                     ; $78D4: $35

jr_007_78D5:
    ld   hl, wEntitiesCollisionsTable             ; $78D5: $21 $A0 $C2
    add  hl, bc                                   ; $78D8: $09
    ld   a, [hl]                                  ; $78D9: $7E
    and  a                                        ; $78DA: $A7
    jr   z, func_007_78E1                         ; $78DB: $28 $04

jr_007_78DD:
    call IncrementEntityState                     ; $78DD: $CD $12 $3B
    ld   [hl], b                                  ; $78E0: $70

func_007_78E1::
    ldh  a, [hFrameCounter]                       ; $78E1: $F0 $E7
    rra                                           ; $78E3: $1F
    rra                                           ; $78E4: $1F
    rra                                           ; $78E5: $1F
    rra                                           ; $78E6: $1F
    and  $01                                      ; $78E7: $E6 $01
    jp   SetEntitySpriteVariant                   ; $78E9: $C3 $0C $3B

func_007_78EC::
    ld   hl, wEntitiesOptions1Table               ; $78EC: $21 $30 $C4
    add  hl, bc                                   ; $78EF: $09
    ld   [hl], ENTITY_OPT1_SPLASH_IN_WATER        ; $78F0: $36 $08
    ld   hl, wEntitiesHitboxFlagsTable            ; $78F2: $21 $50 $C3
    add  hl, bc                                   ; $78F5: $09
    ld   [hl], $00                                ; $78F6: $36 $00
    ldh  a, [hFrameCounter]                       ; $78F8: $F0 $E7
    rra                                           ; $78FA: $1F
    rra                                           ; $78FB: $1F
    rra                                           ; $78FC: $1F
    rra                                           ; $78FD: $1F
    and  $01                                      ; $78FE: $E6 $01
    inc  a                                        ; $7900: $3C
    inc  a                                        ; $7901: $3C
    call SetEntitySpriteVariant                   ; $7902: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $7905: $CD $05 $0C
    jr   nz, jr_007_791A                          ; $7908: $20 $10

    call IncrementEntityState                     ; $790A: $CD $12 $3B
    ld   [hl], b                                  ; $790D: $70
    ld   hl, wEntitiesSpeedZTable                 ; $790E: $21 $20 $C3
    add  hl, bc                                   ; $7911: $09
    ld   [hl], $18                                ; $7912: $36 $18
    ld   hl, wEntitiesSpeedXTable                 ; $7914: $21 $40 $C2
    add  hl, bc                                   ; $7917: $09
    ld   [hl], b                                  ; $7918: $70
    ret                                           ; $7919: $C9

jr_007_791A:
    cp   $60                                      ; $791A: $FE $60
    jr   nc, jr_007_792B                          ; $791C: $30 $0D

    and  $04                                      ; $791E: $E6 $04
    ld   a, $08                                   ; $7920: $3E $08
    jr   nz, jr_007_7926                          ; $7922: $20 $02

    ld   a, $F8                                   ; $7924: $3E $F8

jr_007_7926:
    ld   hl, wEntitiesSpeedXTable                 ; $7926: $21 $40 $C2
    add  hl, bc                                   ; $7929: $09
    ld   [hl], a                                  ; $792A: $77

jr_007_792B:
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $792B: $21 $10 $C4
    add  hl, bc                                   ; $792E: $09
    ld   a, [hl]                                  ; $792F: $7E
    push af                                       ; $7930: $F5
    ld   [hl], $01                                ; $7931: $36 $01
    call label_3B23                               ; $7933: $CD $23 $3B
    pop  af                                       ; $7936: $F1
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7937: $21 $10 $C4
    add  hl, bc                                   ; $793A: $09
    ld   [hl], a                                  ; $793B: $77
    ret                                           ; $793C: $C9

Data_007_793D::
    db   $06, $04, $02, $00                       ; $793D

MoblinSwordEntityHandler::
    ldh  a, [hMapId]                              ; $7941: $F0 $F7
    cp   MAP_BOWWOW_HIDEOUT                       ; $7943: $FE $15
    jr   nz, jr_007_794F                          ; $7945: $20 $08

    ld   a, [wIsBowWowFollowingLink]              ; $7947: $FA $56 $DB
    cp   $80                                      ; $794A: $FE $80
    jp   nz, func_007_7EA4                        ; $794C: $C2 $A4 $7E

jr_007_794F:
    call func_007_7AB5                            ; $794F: $CD $B5 $7A
    call ReturnIfNonInteractive_07                ; $7952: $CD $96 $7D
    ldh  a, [hMapId]                              ; $7955: $F0 $F7
    cp   MAP_BOWWOW_HIDEOUT                       ; $7957: $FE $15
    jr   z, jr_007_7963                           ; $7959: $28 $08

    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $795B: $21 $10 $C4
    add  hl, bc                                   ; $795E: $09
    ld   a, [hl]                                  ; $795F: $7E
    and  a                                        ; $7960: $A7
    jr   z, jr_007_7966                           ; $7961: $28 $03

jr_007_7963:
    call func_007_7A55                            ; $7963: $CD $55 $7A

jr_007_7966:
    call ApplyRecoilIfNeeded_07                   ; $7966: $CD $C3 $7D
    call label_3B65                               ; $7969: $CD $65 $3B
    call label_3B39                               ; $796C: $CD $39 $3B
    ldh  a, [hActiveEntityState]                  ; $796F: $F0 $F0
    JP_TABLE                                      ; $7971
._00 dw func_007_7980                             ; $7972
._01 dw func_007_79B4                             ; $7974
._02 dw func_007_79D7                             ; $7976

Data_007_7978::
    db   $06, $FA, $00, $00

Data_007_797C::
    db   $00, $00, $FA, $06

func_007_7980::
    call label_3B23                               ; $7980: $CD $23 $3B
    ld   hl, wEntitiesInertiaTable                ; $7983: $21 $D0 $C3
    add  hl, bc                                   ; $7986: $09
    ld   [hl], $00                                ; $7987: $36 $00
    call func_007_7A2D                            ; $7989: $CD $2D $7A
    call GetEntityTransitionCountdown             ; $798C: $CD $05 $0C
    jr   nz, jr_007_79B3                          ; $798F: $20 $22

    ld   [hl], $80                                ; $7991: $36 $80
    call IncrementEntityState                     ; $7993: $CD $12 $3B

func_007_7996::
    ld   hl, wEntitiesDirectionTable              ; $7996: $21 $80 $C3
    add  hl, bc                                   ; $7999: $09
    ld   a, [hl]                                  ; $799A: $7E
    xor  $01                                      ; $799B: $EE $01
    ld   [hl], a                                  ; $799D: $77
    ld   e, a                                     ; $799E: $5F
    ld   d, b                                     ; $799F: $50
    ld   hl, Data_007_7978                        ; $79A0: $21 $78 $79
    add  hl, de                                   ; $79A3: $19
    ld   a, [hl]                                  ; $79A4: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $79A5: $21 $40 $C2
    add  hl, bc                                   ; $79A8: $09
    ld   [hl], a                                  ; $79A9: $77
    ld   hl, Data_007_797C                        ; $79AA: $21 $7C $79
    add  hl, de                                   ; $79AD: $19
    ld   a, [hl]                                  ; $79AE: $7E
    call GetEntitySpeedYAddress                   ; $79AF: $CD $05 $40
    ld   [hl], a                                  ; $79B2: $77

jr_007_79B3:
    ret                                           ; $79B3: $C9

func_007_79B4::
    call func_007_7A2D                            ; $79B4: $CD $2D $7A
    ld   hl, wEntitiesCollisionsTable             ; $79B7: $21 $A0 $C2
    add  hl, bc                                   ; $79BA: $09
    ld   a, [hl]                                  ; $79BB: $7E
    and  a                                        ; $79BC: $A7
    jr   z, jr_007_79C2                           ; $79BD: $28 $03

    call func_007_7996                            ; $79BF: $CD $96 $79

jr_007_79C2:
    call UpdateEntityPosWithSpeed_07              ; $79C2: $CD $0A $7E
    call label_3B23                               ; $79C5: $CD $23 $3B
    call func_007_7D1A                            ; $79C8: $CD $1A $7D
    call GetEntityTransitionCountdown             ; $79CB: $CD $05 $0C
    jr   nz, jr_007_79D6                          ; $79CE: $20 $06

    ld   [hl], $30                                ; $79D0: $36 $30

func_007_79D2::
    call IncrementEntityState                     ; $79D2: $CD $12 $3B
    ld   [hl], b                                  ; $79D5: $70

jr_007_79D6:
    ret                                           ; $79D6: $C9

func_007_79D7::
    call GetEntityPrivateCountdown1               ; $79D7: $CD $00 $0C
    jr   z, jr_007_79F9                           ; $79DA: $28 $1D

    ld   a, [wTransitionSequenceCounter]          ; $79DC: $FA $6B $C1
    cp   $04                                      ; $79DF: $FE $04
    jr   nz, jr_007_79F9                          ; $79E1: $20 $16

    ldh  a, [hMapId]                              ; $79E3: $F0 $F7
    cp   MAP_BOWWOW_HIDEOUT                       ; $79E5: $FE $15
    jr   nz, jr_007_79F9                          ; $79E7: $20 $10

    ld   hl, wEntitiesPrivateState3Table          ; $79E9: $21 $D0 $C2
    add  hl, bc                                   ; $79EC: $09
    ld   a, [hl]                                  ; $79ED: $7E
    and  a                                        ; $79EE: $A7
    jr   nz, jr_007_7A1E                          ; $79EF: $20 $2D

    inc  [hl]                                     ; $79F1: $34
    call_open_dialog $190                         ; $79F2
    jr   jr_007_7A1E                              ; $79F7: $18 $25

jr_007_79F9:
    ld   a, [hl]                                  ; $79F9: $7E
    and  a                                        ; $79FA: $A7
    jr   nz, jr_007_7A1E                          ; $79FB: $20 $21

    call GetEntityTransitionCountdown             ; $79FD: $CD $05 $0C
    jr   nz, jr_007_7A07                          ; $7A00: $20 $05

    ld   [hl], $18                                ; $7A02: $36 $18
    call func_007_79D2                            ; $7A04: $CD $D2 $79

jr_007_7A07:
    call func_007_7D1A                            ; $7A07: $CD $1A $7D
    call func_007_7D1A                            ; $7A0A: $CD $1A $7D
    call UpdateEntityPosWithSpeed_07              ; $7A0D: $CD $0A $7E
    call label_3B23                               ; $7A10: $CD $23 $3B
    ldh  a, [hFrameCounter]                       ; $7A13: $F0 $E7
    xor  c                                        ; $7A15: $A9
    and  $0F                                      ; $7A16: $E6 $0F
    ret  nz                                       ; $7A18: $C0

    ld   a, $0A                                   ; $7A19: $3E $0A
    call ApplyVectorTowardsLink_trampoline        ; $7A1B: $CD $AA $3B

jr_007_7A1E:
    call func_007_7E7D                            ; $7A1E: $CD $7D $7E
    ld   hl, wEntitiesDirectionTable              ; $7A21: $21 $80 $C3
    add  hl, bc                                   ; $7A24: $09
    ld   [hl], a                                  ; $7A25: $77
    jp   func_007_7D1A                            ; $7A26: $C3 $1A $7D

Data_007_7A29::
    db   $01, $00, $03, $02

func_007_7A2D::
    ld   a, [wC502]                               ; $7A2D: $FA $02 $C5
    and  a                                        ; $7A30: $A7
    jr   nz, func_007_7A55                        ; $7A31: $20 $22

    call func_007_7E5D                            ; $7A33: $CD $5D $7E
    add  $30                                      ; $7A36: $C6 $30
    cp   $60                                      ; $7A38: $FE $60
    jr   nc, jr_007_7A6C                          ; $7A3A: $30 $30

    call func_007_7E6D                            ; $7A3C: $CD $6D $7E
    add  $30                                      ; $7A3F: $C6 $30
    cp   $60                                      ; $7A41: $FE $60
    jr   nc, jr_007_7A6C                          ; $7A43: $30 $27

    call func_007_7E7D                            ; $7A45: $CD $7D $7E
    ld   d, b                                     ; $7A48: $50
    ld   hl, Data_007_7A29                        ; $7A49: $21 $29 $7A
    add  hl, de                                   ; $7A4C: $19
    ld   a, [hl]                                  ; $7A4D: $7E
    ld   hl, wEntitiesDirectionTable              ; $7A4E: $21 $80 $C3
    add  hl, bc                                   ; $7A51: $09
    cp   [hl]                                     ; $7A52: $BE
    jr   z, jr_007_7A6C                           ; $7A53: $28 $17

func_007_7A55::
    ld   hl, wEntitiesStateTable                  ; $7A55: $21 $90 $C2
    add  hl, bc                                   ; $7A58: $09
    ld   a, [hl]                                  ; $7A59: $7E
    cp   $02                                      ; $7A5A: $FE $02
    jr   z, jr_007_7A65                           ; $7A5C: $28 $07

    push hl                                       ; $7A5E: $E5
    call GetEntityPrivateCountdown1               ; $7A5F: $CD $00 $0C
    ld   [hl], $10                                ; $7A62: $36 $10
    pop  hl                                       ; $7A64: $E1

jr_007_7A65:
    ld   [hl], $02                                ; $7A65: $36 $02
    call GetEntityTransitionCountdown             ; $7A67: $CD $05 $0C
    ld   [hl], $80                                ; $7A6A: $36 $80

jr_007_7A6C:
    ret                                           ; $7A6C: $C9

Data_007_7A6D::
    db   $00, $00, $F9, $F9, $F8, $F2, $08, $0E

Data_007_7A75::
    db   $08, $0E, $F8, $F2, $00, $00, $00, $00

Data_007_7A7D::
    db   $02, $02, $06, $06, $04, $04, $00, $00

Data_007_7A85::
    db   $0C, $0C, $04, $04, $FC, $FC, $14, $14

Data_007_7A8D::
    db   $14, $14, $FC, $FC, $0C, $0C, $0C, $0C

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown042SpriteVariants::
.variant0
    db $60, $03
    db $62, $03
.variant1
    db $62, $23
    db $60, $23
.variant2
    db $64, $03
    db $66, $03
.variant3
    db $66, $23
    db $64, $23
.variant4
    db $68, $03
    db $6A, $03
.variant5
    db $6C, $03
    db $6E, $03
.variant6
    db $6A, $23
    db $68, $23
.variant7
    db $6E, $23
    db $6C, $23

func_007_7AB5::
    call SkipDisabledEntityDuringRoomTransition   ; $7AB5: $CD $57 $3D
    ldh  a, [hActiveEntitySpriteVariant]          ; $7AB8: $F0 $F1
    cp   $02                                      ; $7ABA: $FE $02
    jr   nc, jr_007_7AC1                          ; $7ABC: $30 $03

    call func_007_7B30                            ; $7ABE: $CD $30 $7B

jr_007_7AC1:
    ldh  a, [hActiveEntitySpriteVariant]          ; $7AC1: $F0 $F1
    cp   $02                                      ; $7AC3: $FE $02
    jr   z, jr_007_7ACB                           ; $7AC5: $28 $04

    cp   $03                                      ; $7AC7: $FE $03
    jr   nz, jr_007_7AD1                          ; $7AC9: $20 $06

jr_007_7ACB:
    ld   de, Unknown042SpriteVariants             ; $7ACB: $11 $95 $7A
    call RenderActiveEntitySpritesPair            ; $7ACE: $CD $C0 $3B

jr_007_7AD1:
    push bc                                       ; $7AD1: $C5
    ldh  a, [hActiveEntityVisualPosY]             ; $7AD2: $F0 $EC
    ldh  [hMultiPurpose0], a                      ; $7AD4: $E0 $D7
    ldh  a, [hActiveEntityPosX]                   ; $7AD6: $F0 $EE
    ldh  [hMultiPurpose1], a                      ; $7AD8: $E0 $D8
    ldh  a, [hActiveEntitySpriteVariant]          ; $7ADA: $F0 $F1
    ld   e, a                                     ; $7ADC: $5F
    ld   d, b                                     ; $7ADD: $50
    ld   hl, Data_007_7A85                        ; $7ADE: $21 $85 $7A
    add  hl, de                                   ; $7AE1: $19
    ld   a, [hl]                                  ; $7AE2: $7E
    ld   [wD5C0], a                               ; $7AE3: $EA $C0 $D5
    ld   hl, Data_007_7A8D                        ; $7AE6: $21 $8D $7A
    add  hl, de                                   ; $7AE9: $19
    ld   a, [hl]                                  ; $7AEA: $7E
    ld   [wD5C2], a                               ; $7AEB: $EA $C2 $D5
    ld   a, $02                                   ; $7AEE: $3E $02
    ld   [wD5C0+1], a                             ; $7AF0: $EA $C1 $D5
    ld   [wD5C2+1], a                             ; $7AF3: $EA $C3 $D5
    ld   hl, Data_007_7A7D                        ; $7AF6: $21 $7D $7A
    add  hl, de                                   ; $7AF9: $19
    ld   a, [hl]                                  ; $7AFA: $7E
    ldh  [hMultiPurpose2], a                      ; $7AFB: $E0 $D9
    ld   hl, Data_007_7A75                        ; $7AFD: $21 $75 $7A
    add  hl, de                                   ; $7B00: $19
    ld   a, [hl]                                  ; $7B01: $7E
    ld   hl, Data_007_7A6D                        ; $7B02: $21 $6D $7A
    add  hl, de                                   ; $7B05: $19
    ld   l, [hl]                                  ; $7B06: $6E
    ld   h, a                                     ; $7B07: $67
    push hl                                       ; $7B08: $E5
    ld   a, [wOAMNextAvailableSlot]               ; $7B09: $FA $C0 $C3
    ld   e, a                                     ; $7B0C: $5F
    ld   d, $00                                   ; $7B0D: $16 $00
    ld   hl, wDynamicOAMBuffer                    ; $7B0F: $21 $30 $C0
    add  hl, de                                   ; $7B12: $19
    ld   c, l                                     ; $7B13: $4D
    ld   b, h                                     ; $7B14: $44
    xor  a                                        ; $7B15: $AF
    ldh  [hMultiPurpose3], a                      ; $7B16: $E0 $DA
    pop  hl                                       ; $7B18: $E1
    call func_1819                                ; $7B19: $CD $19 $18
    ld   a, $02                                   ; $7B1C: $3E $02
    call func_015_7964_trampoline                 ; $7B1E: $CD $A0 $3D
    pop  bc                                       ; $7B21: $C1
    ldh  a, [hActiveEntitySpriteVariant]          ; $7B22: $F0 $F1
    cp   $02                                      ; $7B24: $FE $02
    ret  z                                        ; $7B26: $C8

    cp   $03                                      ; $7B27: $FE $03
    ret  z                                        ; $7B29: $C8

    ld   de, Unknown042SpriteVariants             ; $7B2A: $11 $95 $7A
    jp   RenderActiveEntitySpritesPair            ; $7B2D: $C3 $C0 $3B

func_007_7B30::
    xor  $01                                      ; $7B30: $EE $01
    push af                                       ; $7B32: $F5
    ld   a, [wOAMNextAvailableSlot]               ; $7B33: $FA $C0 $C3
    ld   l, a                                     ; $7B36: $6F
    ld   h, $00                                   ; $7B37: $26 $00
    ld   de, wDynamicOAMBuffer                    ; $7B39: $11 $30 $C0
    add  hl, de                                   ; $7B3C: $19
    pop  de                                       ; $7B3D: $D1
    ldh  a, [hActiveEntityVisualPosY]             ; $7B3E: $F0 $EC
    add  d                                        ; $7B40: $82
    add  $04                                      ; $7B41: $C6 $04
    ld   [hl+], a                                 ; $7B43: $22
    ldh  a, [hActiveEntityPosX]                   ; $7B44: $F0 $EE
    add  $FE                                      ; $7B46: $C6 $FE
    ld   [hl+], a                                 ; $7B48: $22
    ld   a, $86                                   ; $7B49: $3E $86
    ld   [hl+], a                                 ; $7B4B: $22
    ld   [hl], $16                                ; $7B4C: $36 $16
    ld   a, $01                                   ; $7B4E: $3E $01
    jp   func_015_7964_trampoline                 ; $7B50: $C3 $A0 $3D

include "code/entities/07_chest_with_item.asm"

func_007_7CF0::
    call CheckLinkCollisionWithEnemy_trampoline   ; $7CF0: $CD $5A $3B
    jr   nc, jr_007_7D14                          ; $7CF3: $30 $1F

    call CopyLinkFinalPositionToPosition          ; $7CF5: $CD $BE $0C
    call ResetPegasusBoots                        ; $7CF8: $CD $B6 $0C
    ld   a, [wC1A6]                               ; $7CFB: $FA $A6 $C1
    and  a                                        ; $7CFE: $A7
    jr   z, jr_007_7D12                           ; $7CFF: $28 $11

    ld   e, a                                     ; $7D01: $5F
    ld   d, b                                     ; $7D02: $50
    ld   hl, wEntitiesPrivateState5Table+15       ; $7D03: $21 $9F $C3
    add  hl, de                                   ; $7D06: $19
    ld   a, [hl]                                  ; $7D07: $7E
    cp   $03                                      ; $7D08: $FE $03
    jr   nz, jr_007_7D12                          ; $7D0A: $20 $06

    ld   hl, wEntitiesStatusTable + $0F           ; $7D0C: $21 $8F $C2
    add  hl, de                                   ; $7D0F: $19
    ld   [hl], $00                                ; $7D10: $36 $00

jr_007_7D12:
    scf                                           ; $7D12: $37
    ret                                           ; $7D13: $C9

jr_007_7D14:
    and  a                                        ; $7D14: $A7
    ret                                           ; $7D15: $C9

Data_007_7D16::
    db   $06, $04, $02, $00

func_007_7D1A::
    ld   hl, wEntitiesDirectionTable              ; $7D1A: $21 $80 $C3
    add  hl, bc                                   ; $7D1D: $09
    ld   e, [hl]                                  ; $7D1E: $5E
    ld   d, b                                     ; $7D1F: $50
    ld   hl, Data_007_7D16                        ; $7D20: $21 $16 $7D
    add  hl, de                                   ; $7D23: $19
    push hl                                       ; $7D24: $E5
    ld   hl, wEntitiesInertiaTable                ; $7D25: $21 $D0 $C3
    add  hl, bc                                   ; $7D28: $09
    inc  [hl]                                     ; $7D29: $34
    ld   a, [hl]                                  ; $7D2A: $7E
    rra                                           ; $7D2B: $1F
    rra                                           ; $7D2C: $1F
    rra                                           ; $7D2D: $1F
    rra                                           ; $7D2E: $1F
    pop  hl                                       ; $7D2F: $E1
    and  $01                                      ; $7D30: $E6 $01
    or   [hl]                                     ; $7D32: $B6
    jp   SetEntitySpriteVariant                   ; $7D33: $C3 $0C $3B

func_007_7D36::
    ld   e, b                                     ; $7D36: $58
    ldh  a, [hLinkPositionY]                      ; $7D37: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $7D39: $21 $EF $FF
    sub  [hl]                                     ; $7D3C: $96
    add  $14                                      ; $7D3D: $C6 $14
    cp   $38                                      ; $7D3F: $FE $38
    jr   jr_007_7D4E                              ; $7D41: $18 $0B

func_007_7D43::
    ld   e, b                                     ; $7D43: $58
    ldh  a, [hLinkPositionY]                      ; $7D44: $F0 $99
    ld   hl, hActiveEntityPosY                    ; $7D46: $21 $EF $FF
    sub  [hl]                                     ; $7D49: $96
    add  $14                                      ; $7D4A: $C6 $14
    cp   $28                                      ; $7D4C: $FE $28

jr_007_7D4E:
    jr   nc, jr_007_7D94                          ; $7D4E: $30 $44

    ldh  a, [hLinkPositionX]                      ; $7D50: $F0 $98
    ld   hl, hActiveEntityPosX                    ; $7D52: $21 $EE $FF
    sub  [hl]                                     ; $7D55: $96
    add  $10                                      ; $7D56: $C6 $10
    cp   $20                                      ; $7D58: $FE $20
    jr   nc, jr_007_7D94                          ; $7D5A: $30 $38

    inc  e                                        ; $7D5C: $1C
    ldh  a, [hActiveEntityType]                   ; $7D5D: $F0 $EB
    cp   ENTITY_BEAR                              ; $7D5F: $FE $B5
    jr   z, jr_007_7D6F                           ; $7D61: $28 $0C

    push de                                       ; $7D63: $D5
    call func_007_7E7D                            ; $7D64: $CD $7D $7E
    ldh  a, [hLinkDirection]                      ; $7D67: $F0 $9E
    xor  $01                                      ; $7D69: $EE $01
    cp   e                                        ; $7D6B: $BB
    pop  de                                       ; $7D6C: $D1
    jr   nz, jr_007_7D94                          ; $7D6D: $20 $25

jr_007_7D6F:
    ld   hl, wC1AD                                ; $7D6F: $21 $AD $C1
    ld   [hl], $01                                ; $7D72: $36 $01
    ld   a, [wDialogState]                        ; $7D74: $FA $9F $C1
    ld   hl, wInventoryAppearing                  ; $7D77: $21 $4F $C1
    or   [hl]                                     ; $7D7A: $B6
    ld   hl, wIsLinkInTheAir                      ; $7D7B: $21 $46 $C1
    or   [hl]                                     ; $7D7E: $B6
    ld   hl, wC134                                ; $7D7F: $21 $34 $C1
    or   [hl]                                     ; $7D82: $B6
    jr   nz, jr_007_7D94                          ; $7D83: $20 $0F

    ld   a, [wWindowY]                            ; $7D85: $FA $9A $DB
    cp   $80                                      ; $7D88: $FE $80
    jr   nz, jr_007_7D94                          ; $7D8A: $20 $08

    ldh  a, [hJoypadState]                        ; $7D8C: $F0 $CC
    and  J_A                                      ; $7D8E: $E6 $10
    jr   z, jr_007_7D94                           ; $7D90: $28 $02

    scf                                           ; $7D92: $37
    ret                                           ; $7D93: $C9

jr_007_7D94:
    and  a                                        ; $7D94: $A7
    ret                                           ; $7D95: $C9

; If the entity is disabled or the game is in a dialog or transition,
; return to the caller directly, skipping the rest of the code.
ReturnIfNonInteractive_07::
    ldh  a, [hActiveEntityStatus]                 ; $7D96: $F0 $EA
    cp   ENTITY_STATUS_ACTIVE                     ; $7D98: $FE $05
    jr   nz, .skip                                ; $7D9A: $20 $25

.allowInactiveEntity
    ld   a, [wGameplayType]                       ; $7D9C: $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP                       ; $7D9F: $FE $07
    jr   z, .skip                                 ; $7DA1: $28 $1E

    cp   GAMEPLAY_WORLD                           ; $7DA3: $FE $0B
    jr   nz, .skip                                ; $7DA5: $20 $1A

    ld   a, [wTransitionSequenceCounter]          ; $7DA7: $FA $6B $C1
    cp   $04                                      ; $7DAA: $FE $04
    jr   nz, .skip                                ; $7DAC: $20 $13

    ld   a, [wDialogState]                        ; $7DAE: $FA $9F $C1
    ld   hl, wC1A8                                ; $7DB1: $21 $A8 $C1
    or   [hl]                                     ; $7DB4: $B6
    ld   hl, wInventoryAppearing                  ; $7DB5: $21 $4F $C1
    or   [hl]                                     ; $7DB8: $B6
    jr   nz, .skip                                ; $7DB9: $20 $06

    ld   a, [wRoomTransitionState]                ; $7DBB: $FA $24 $C1
    and  a                                        ; $7DBE: $A7
    jr   z, .return                               ; $7DBF: $28 $01

.skip
    ; pop the return address to return to caller
    pop  af                                       ; $7DC1: $F1

.return
    ret                                           ; $7DC2: $C9

; If the entity is ignoring hits, apply its recoil velocity.
ApplyRecoilIfNeeded_07::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ; $7DC3: $21 $10 $C4
    add  hl, bc                                   ; $7DC6: $09
    ld   a, [hl]                                  ; $7DC7: $7E
    and  a                                        ; $7DC8: $A7
    jr   z, .return                               ; $7DC9: $28 $3E

    dec  a                                        ; $7DCB: $3D
    ld   [hl], a                                  ; $7DCC: $77

    call label_3E8E                               ; $7DCD: $CD $8E $3E

    ;
    ; Temporarily replace the entity speed by the recoil speed
    ;

    ld   hl, wEntitiesSpeedXTable                 ; $7DD0: $21 $40 $C2
    add  hl, bc                                   ; $7DD3: $09
    ld   a, [hl]                                  ; $7DD4: $7E
    push af                                       ; $7DD5: $F5

    call GetEntitySpeedYAddress                   ; $7DD6: $CD $05 $40
    ld   a, [hl]                                  ; $7DD9: $7E
    push af                                       ; $7DDA: $F5

    ld   hl, wEntitiesRecoilVelocityX             ; $7DDB: $21 $F0 $C3
    add  hl, bc                                   ; $7DDE: $09
    ld   a, [hl]                                  ; $7DDF: $7E
    ld   hl, wEntitiesSpeedXTable                 ; $7DE0: $21 $40 $C2
    add  hl, bc                                   ; $7DE3: $09
    ld   [hl], a                                  ; $7DE4: $77

    ld   hl, wEntitiesRecoilVelocityY             ; $7DE5: $21 $00 $C4
    add  hl, bc                                   ; $7DE8: $09
    ld   a, [hl]                                  ; $7DE9: $7E
    call GetEntitySpeedYAddress                   ; $7DEA: $CD $05 $40
    ld   [hl], a                                  ; $7DED: $77

    call UpdateEntityPosWithSpeed_07              ; $7DEE: $CD $0A $7E

    ld   hl, wEntitiesOptions1Table               ; $7DF1: $21 $30 $C4
    add  hl, bc                                   ; $7DF4: $09
    ld   a, [hl]                                  ; $7DF5: $7E
    and  $20                                      ; $7DF6: $E6 $20
    jr   nz, .restoreOriginalSpeed                ; $7DF8: $20 $03

    call label_3B23                               ; $7DFA: $CD $23 $3B

.restoreOriginalSpeed
    call GetEntitySpeedYAddress                   ; $7DFD: $CD $05 $40
    pop  af                                       ; $7E00: $F1
    ld   [hl], a                                  ; $7E01: $77
    ld   hl, wEntitiesSpeedXTable                 ; $7E02: $21 $40 $C2
    add  hl, bc                                   ; $7E05: $09
    pop  af                                       ; $7E06: $F1
    ld   [hl], a                                  ; $7E07: $77
    pop  af                                       ; $7E08: $F1

.return
    ret                                           ; $7E09: $C9

UpdateEntityPosWithSpeed_07::
    call AddEntitySpeedToPos_07                   ; $7E0A: $CD $17 $7E
    push bc                                       ; $7E0D: $C5
    ld   a, c                                     ; $7E0E: $79
    add  $10                                      ; $7E0F: $C6 $10
    ld   c, a                                     ; $7E11: $4F
    call AddEntitySpeedToPos_07                   ; $7E12: $CD $17 $7E
    pop  bc                                       ; $7E15: $C1
    ret                                           ; $7E16: $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_07::
    ld   hl, wEntitiesSpeedXTable                 ; $7E17: $21 $40 $C2
    add  hl, bc                                   ; $7E1A: $09
    ld   a, [hl]                                  ; $7E1B: $7E
    and  a                                        ; $7E1C: $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ; $7E1D: $28 $23

    push af                                       ; $7E1F: $F5
    swap a                                        ; $7E20: $CB $37
    and  $F0                                      ; $7E22: $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ; $7E24: $21 $60 $C2
    add  hl, bc                                   ; $7E27: $09
    add  [hl]                                     ; $7E28: $86
    ld   [hl], a                                  ; $7E29: $77
    ; Save carry in bit 0 of d
    rl   d                                        ; $7E2A: $CB $12
    ld   hl, wEntitiesPosXTable                   ; $7E2C: $21 $00 $C2

.updatePosition
    add  hl, bc                                   ; $7E2F: $09
    pop  af                                       ; $7E30: $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ; $7E31: $1E $00
    bit  7, a                                     ; $7E33: $CB $7F
    jr   z, .positive                             ; $7E35: $28 $02

    ld   e, $F0                                   ; $7E37: $1E $F0

.positive
    swap a                                        ; $7E39: $CB $37
    and  $0F                                      ; $7E3B: $E6 $0F
    or   e                                        ; $7E3D: $B3
    ; Get carry back from d
    rr   d                                        ; $7E3E: $CB $1A
    adc  [hl]                                     ; $7E40: $8E
    ld   [hl], a                                  ; $7E41: $77

.return
    ret                                           ; $7E42: $C9

AddEntityZSpeedToPos_07::
    ld   hl, wEntitiesSpeedZTable                 ; $7E43: $21 $20 $C3
    add  hl, bc                                   ; $7E46: $09
    ld   a, [hl]                                  ; $7E47: $7E
    and  a                                        ; $7E48: $A7
    jr   z, AddEntitySpeedToPos_07.return         ; $7E49: $28 $F7

    push af                                       ; $7E4B: $F5
    swap a                                        ; $7E4C: $CB $37
    and  $F0                                      ; $7E4E: $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ; $7E50: $21 $30 $C3
    add  hl, bc                                   ; $7E53: $09
    add  [hl]                                     ; $7E54: $86
    ld   [hl], a                                  ; $7E55: $77
    rl   d                                        ; $7E56: $CB $12
    ld   hl, wEntitiesPosZTable                   ; $7E58: $21 $10 $C3
    jr   AddEntitySpeedToPos_07.updatePosition    ; $7E5B: $18 $D2

func_007_7E5D::
    ld   e, $00                                   ; $7E5D: $1E $00
    ldh  a, [hLinkPositionX]                      ; $7E5F: $F0 $98
    ld   hl, wEntitiesPosXTable                   ; $7E61: $21 $00 $C2
    add  hl, bc                                   ; $7E64: $09
    sub  [hl]                                     ; $7E65: $96
    bit  7, a                                     ; $7E66: $CB $7F
    jr   z, jr_007_7E6B                           ; $7E68: $28 $01

    inc  e                                        ; $7E6A: $1C

jr_007_7E6B:
    ld   d, a                                     ; $7E6B: $57
    ret                                           ; $7E6C: $C9

func_007_7E6D::
    ld   e, $02                                   ; $7E6D: $1E $02
    ldh  a, [hLinkPositionY]                      ; $7E6F: $F0 $99
    ld   hl, wEntitiesPosYTable                   ; $7E71: $21 $10 $C2
    add  hl, bc                                   ; $7E74: $09
    sub  [hl]                                     ; $7E75: $96
    bit  7, a                                     ; $7E76: $CB $7F
    jr   nz, jr_007_7E7B                          ; $7E78: $20 $01

    inc  e                                        ; $7E7A: $1C

jr_007_7E7B:
    ld   d, a                                     ; $7E7B: $57
    ret                                           ; $7E7C: $C9

func_007_7E7D::
    call func_007_7E5D                            ; $7E7D: $CD $5D $7E
    ld   a, e                                     ; $7E80: $7B
    ldh  [hMultiPurpose0], a                      ; $7E81: $E0 $D7
    ld   a, d                                     ; $7E83: $7A
    bit  7, a                                     ; $7E84: $CB $7F
    jr   z, jr_007_7E8A                           ; $7E86: $28 $02

    cpl                                           ; $7E88: $2F
    inc  a                                        ; $7E89: $3C

jr_007_7E8A:
    push af                                       ; $7E8A: $F5
    call func_007_7E6D                            ; $7E8B: $CD $6D $7E
    ld   a, e                                     ; $7E8E: $7B
    ldh  [hMultiPurpose1], a                      ; $7E8F: $E0 $D8
    ld   a, d                                     ; $7E91: $7A
    bit  7, a                                     ; $7E92: $CB $7F
    jr   z, jr_007_7E98                           ; $7E94: $28 $02

    cpl                                           ; $7E96: $2F
    inc  a                                        ; $7E97: $3C

jr_007_7E98:
    pop  de                                       ; $7E98: $D1
    cp   d                                        ; $7E99: $BA
    jr   nc, jr_007_7EA0                          ; $7E9A: $30 $04

    ldh  a, [hMultiPurpose0]                      ; $7E9C: $F0 $D7
    jr   jr_007_7EA2                              ; $7E9E: $18 $02

jr_007_7EA0:
    ldh  a, [hMultiPurpose1]                      ; $7EA0: $F0 $D8

jr_007_7EA2:
    ld   e, a                                     ; $7EA2: $5F
    ret                                           ; $7EA3: $C9

func_007_7EA4::
    ld   hl, wEntitiesStatusTable                 ; $7EA4: $21 $80 $C2
    add  hl, bc                                   ; $7EA7: $09
    ld   [hl], b                                  ; $7EA8: $70
    ret                                           ; $7EA9: $C9

label_007_7EAA:
    ld   hl, wEntitiesPrivateState2Table          ; $7EAA: $21 $C0 $C2
    add  hl, bc                                   ; $7EAD: $09
    ld   a, [hl]                                  ; $7EAE: $7E
    JP_TABLE                                      ; $7EAF
._00 dw func_007_7EB6                             ; $7EB0
._01 dw func_007_7EC7                             ; $7EB2
._02 dw func_007_7ED6                             ; $7EB4

func_007_7EB6::
    call GetEntityTransitionCountdown             ; $7EB6: $CD $05 $0C
    ld   [hl], $A0                                ; $7EB9: $36 $A0
    ld   hl, wEntitiesFlashCountdownTable         ; $7EBB: $21 $20 $C4
    add  hl, bc                                   ; $7EBE: $09
    ld   [hl], $FF                                ; $7EBF: $36 $FF

label_007_7EC1:
    ld   hl, wEntitiesPrivateState2Table          ; $7EC1: $21 $C0 $C2
    add  hl, bc                                   ; $7EC4: $09
    inc  [hl]                                     ; $7EC5: $34
    ret                                           ; $7EC6: $C9

func_007_7EC7::
    call GetEntityTransitionCountdown             ; $7EC7: $CD $05 $0C
    ret  nz                                       ; $7ECA: $C0

    ld   [hl], $C0                                ; $7ECB: $36 $C0
    ld   hl, wEntitiesFlashCountdownTable         ; $7ECD: $21 $20 $C4
    add  hl, bc                                   ; $7ED0: $09
    ld   [hl], $FF                                ; $7ED1: $36 $FF
    jp   label_007_7EC1                           ; $7ED3: $C3 $C1 $7E

func_007_7ED6::
    call GetEntityTransitionCountdown             ; $7ED6: $CD $05 $0C
    jr   nz, jr_007_7F13                          ; $7ED9: $20 $38

    ldh  a, [hActiveEntityType]                   ; $7EDB: $F0 $EB
    cp   ENTITY_MASTER_STALFOS                    ; $7EDD: $FE $5F
    jr   nz, jr_007_7F0A                          ; $7EDF: $20 $29

    ld   a, ENTITY_KEY_DROP_POINT                 ; $7EE1: $3E $30
    call SpawnNewEntity_trampoline                ; $7EE3: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $7EE6: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7EE8: $21 $00 $C2
    add  hl, de                                   ; $7EEB: $19
    ld   [hl], a                                  ; $7EEC: $77
    ldh  a, [hMultiPurpose1]                      ; $7EED: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7EEF: $21 $10 $C2
    add  hl, de                                   ; $7EF2: $19
    ld   [hl], a                                  ; $7EF3: $77
    ld   hl, wEntitiesSpeedZTable                 ; $7EF4: $21 $20 $C3
    add  hl, de                                   ; $7EF7: $19
    ld   [hl], $18                                ; $7EF8: $36 $18
    ld   hl, wEntitiesPrivateCountdown1Table      ; $7EFA: $21 $F0 $C2
    add  hl, de                                   ; $7EFD: $19
    ld   [hl], $20                                ; $7EFE: $36 $20
    ld   hl, wEntitiesPrivateState5Table          ; $7F00: $21 $90 $C3
    add  hl, bc                                   ; $7F03: $09
    ld   a, [hl]                                  ; $7F04: $7E
    ldh  [hDefaultMusicTrack], a                  ; $7F05: $E0 $B0
    jp   jr_007_7F76                              ; $7F07: $C3 $76 $7F

jr_007_7F0A:
    call PlayBombExplosionSfx                     ; $7F0A: $CD $4B $0C
    call label_27DD                               ; $7F0D: $CD $DD $27
    jp   DidKillEnemy                             ; $7F10: $C3 $50 $3F

jr_007_7F13:
    jp   label_007_7F16                           ; $7F13: $C3 $16 $7F

label_007_7F16:
    and  $07                                      ; $7F16: $E6 $07
    ret  nz                                       ; $7F18: $C0

    call GetRandomByte                            ; $7F19: $CD $0D $28
    and  $1F                                      ; $7F1C: $E6 $1F
    sub  $10                                      ; $7F1E: $D6 $10
    ld   e, a                                     ; $7F20: $5F
    ld   hl, hActiveEntityPosX                    ; $7F21: $21 $EE $FF
    add  [hl]                                     ; $7F24: $86
    ld   [hl], a                                  ; $7F25: $77
    call GetRandomByte                            ; $7F26: $CD $0D $28
    and  $1F                                      ; $7F29: $E6 $1F
    sub  $14                                      ; $7F2B: $D6 $14
    ld   e, a                                     ; $7F2D: $5F
    ld   hl, hActiveEntityVisualPosY              ; $7F2E: $21 $EC $FF
    add  [hl]                                     ; $7F31: $86
    ld   [hl], a                                  ; $7F32: $77
    jp   label_007_7F36                           ; $7F33: $C3 $36 $7F

label_007_7F36:
    call ReturnIfNonInteractive_07.allowInactiveEntity ; $7F36: $CD $9C $7D
    ldh  a, [hActiveEntityPosX]                   ; $7F39: $F0 $EE
    ldh  [hMultiPurpose0], a                      ; $7F3B: $E0 $D7
    ldh  a, [hActiveEntityVisualPosY]             ; $7F3D: $F0 $EC
    ldh  [hMultiPurpose1], a                      ; $7F3F: $E0 $D8
    ld   a, TRANSCIENT_VFX_POOF                   ; $7F41: $3E $02
    call AddTranscientVfx                         ; $7F43: $CD $C7 $0C
    ld   a, $13                                   ; $7F46: $3E $13
    ldh  [hNoiseSfx], a                           ; $7F48: $E0 $F4
    ret                                           ; $7F4A: $C9

    ld   a, ENTITY_HEART_CONTAINER                ; $7F4B: $3E $36
    call SpawnNewEntity_trampoline                ; $7F4D: $CD $86 $3B
    ldh  a, [hMultiPurpose0]                      ; $7F50: $F0 $D7
    ld   hl, wEntitiesPosXTable                   ; $7F52: $21 $00 $C2
    add  hl, de                                   ; $7F55: $19
    ld   [hl], a                                  ; $7F56: $77
    ldh  a, [hMultiPurpose1]                      ; $7F57: $F0 $D8
    ld   hl, wEntitiesPosYTable                   ; $7F59: $21 $10 $C2
    add  hl, de                                   ; $7F5C: $19
    ld   [hl], a                                  ; $7F5D: $77
    ldh  a, [hIsSideScrolling]                    ; $7F5E: $F0 $F9
    and  a                                        ; $7F60: $A7
    jr   z, jr_007_7F6A                           ; $7F61: $28 $07

    call GetEntitySpeedYAddress                   ; $7F63: $CD $05 $40
    ld   [hl], $F0                                ; $7F66: $36 $F0
    jr   jr_007_7F76                              ; $7F68: $18 $0C

jr_007_7F6A:
    ld   hl, wEntitiesSpeedZTable                 ; $7F6A: $21 $20 $C3
    add  hl, de                                   ; $7F6D: $19
    ld   [hl], $10                                ; $7F6E: $36 $10
    ld   hl, wEntitiesPosZTable                   ; $7F70: $21 $10 $C3
    add  hl, de                                   ; $7F73: $19
    ld   [hl], $08                                ; $7F74: $36 $08

jr_007_7F76:
    call func_007_7EA4                            ; $7F76: $CD $A4 $7E
    ld   hl, hNoiseSfx                            ; $7F79: $21 $F4 $FF
    ld   [hl], $1A                                ; $7F7C: $36 $1A
    ret                                           ; $7F7E: $C9
