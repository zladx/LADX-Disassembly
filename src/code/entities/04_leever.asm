; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
LeeverSpriteVariants::
.variant0
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0
    db $56, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0
    db $54, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0
    db $52, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0
    db $50, OAM_GBC_PAL_2 | OAMF_PAL0 | OAMF_XFLIP

LeeverEntityHandler::
    ld   de, LeeverSpriteVariants                 ; $7EF5: $11 $E5 $7E
    call RenderActiveEntitySpritesPair            ; $7EF8: $CD $C0 $3B
    call ReturnIfNonInteractive_04                ; $7EFB: $CD $A3 $7F
    call ApplyRecoilIfNeeded_04                   ; $7EFE: $CD $80 $6D
    call UpdateEntityPosWithSpeed_04              ; $7F01: $CD $CA $6D
    call label_3B23                               ; $7F04: $CD $23 $3B
    ldh  a, [hActiveEntityState]                  ; $7F07: $F0 $F0
    and  $03                                      ; $7F09: $E6 $03
    JP_TABLE                                      ; $7F0B
._00 dw func_004_7F14                             ; $7F0C
._01 dw func_004_7F27                             ; $7F0E
._02 dw func_004_7F49                             ; $7F10
._03 dw func_004_7F75                             ; $7F12

func_004_7F14::
    ld   a, $FF                                   ; $7F14: $3E $FF
    call SetEntitySpriteVariant                   ; $7F16: $CD $0C $3B
    call GetEntityTransitionCountdown             ; $7F19: $CD $05 $0C
    ret  nz                                       ; $7F1C: $C0

    ld   [hl], $1F                                ; $7F1D: $36 $1F
    call IncrementEntityState                     ; $7F1F: $CD $12 $3B
    jp   ClearEntitySpeed                         ; $7F22: $C3 $7F $3D

Data_004_7F25::
    db   $01, $00

func_004_7F27::
    call GetEntityTransitionCountdown             ; $7F27: $CD $05 $0C
    jr   nz, .jr_7F37                             ; $7F2A: $20 $0B

    call GetRandomByte                            ; $7F2C: $CD $0D $28
    and  $3F                                      ; $7F2F: $E6 $3F
    add  $70                                      ; $7F31: $C6 $70
    ld   [hl], a                                  ; $7F33: $77
    jp   IncrementEntityState                     ; $7F34: $C3 $12 $3B

.jr_7F37
    ld   hl, Data_004_7F25                        ; $7F37: $21 $25 $7F

label_004_7F3A:
    srl  a                                        ; $7F3A: $CB $3F
    srl  a                                        ; $7F3C: $CB $3F
    srl  a                                        ; $7F3E: $CB $3F
    srl  a                                        ; $7F40: $CB $3F
    ld   e, a                                     ; $7F42: $5F
    ld   d, b                                     ; $7F43: $50
    add  hl, de                                   ; $7F44: $19
    ld   a, [hl]                                  ; $7F45: $7E
    jp   SetEntitySpriteVariant                   ; $7F46: $C3 $0C $3B

func_004_7F49::
    call label_3B39                               ; $7F49: $CD $39 $3B
    call GetEntityTransitionCountdown             ; $7F4C: $CD $05 $0C
    jr   nz, .jr_7F59                             ; $7F4F: $20 $08

    ld   [hl], $1F                                ; $7F51: $36 $1F
    call IncrementEntityState                     ; $7F53: $CD $12 $3B
    jp   ClearEntitySpeed                         ; $7F56: $C3 $7F $3D

.jr_7F59
    ldh  a, [hFrameCounter]                       ; $7F59: $F0 $E7
    xor  c                                        ; $7F5B: $A9
    push af                                       ; $7F5C: $F5
    and  $0F                                      ; $7F5D: $E6 $0F
    jr   nz, .jr_7F66                             ; $7F5F: $20 $05

    ld   a, $08                                   ; $7F61: $3E $08
    call ApplyVectorTowardsLink_trampoline        ; $7F63: $CD $AA $3B

.jr_7F66
    pop  af                                       ; $7F66: $F1
    srl  a                                        ; $7F67: $CB $3F
    srl  a                                        ; $7F69: $CB $3F
    and  $01                                      ; $7F6B: $E6 $01
    call SetEntitySpriteVariant                   ; $7F6D: $CD $0C $3B
    inc  [hl]                                     ; $7F70: $34
    inc  [hl]                                     ; $7F71: $34
    ret                                           ; $7F72: $C9

Data_004_7F73::
    db   $00, $01

func_004_7F75::
    call GetEntityTransitionCountdown             ; $7F75: $CD $05 $0C
    jr   nz, .jr_7F8A                             ; $7F78: $20 $10

    call GetRandomByte                            ; $7F7A: $CD $0D $28
    and  $1F                                      ; $7F7D: $E6 $1F
    add  $30                                      ; $7F7F: $C6 $30
    ld   [hl], a                                  ; $7F81: $77
    call IncrementEntityState                     ; $7F82: $CD $12 $3B
    ld   a, $08                                   ; $7F85: $3E $08
    jp   ApplyVectorTowardsLink_trampoline        ; $7F87: $C3 $AA $3B

.jr_7F8A
    ld   hl, Data_004_7F73                        ; $7F8A: $21 $73 $7F
    jp   label_004_7F3A                           ; $7F8D: $C3 $3A $7F

func_004_7F90:: ; also called from ghini code
    ld   hl, wEntitiesSpeedXTable                 ; $7F90: $21 $40 $C2
    add  hl, bc                                   ; $7F93: $09
    ld   a, [hl]                                  ; $7F94: $7E
    rl   a                                        ; $7F95: $CB $17
    ld   a, OAM_NO_FLIP                           ; $7F97: $3E $00
    jr   c, .jr_7F9D                              ; $7F99: $38 $02

    ld   a, OAMF_XFLIP                            ; $7F9B: $3E $20

.jr_7F9D
    ld   hl, hActiveEntityFlipAttribute           ; $7F9D: $21 $ED $FF
    xor  [hl]                                     ; $7FA0: $AE
    ld   [hl], a                                  ; $7FA1: $77
    ret                                           ; $7FA2: $C9
