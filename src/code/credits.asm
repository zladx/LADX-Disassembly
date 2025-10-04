; Disassembly of "game.gbc"
; This file was created with mgbdis v1.3 - Game Boy ROM disassembler by Matt Currie.
; https://github.com/mattcurrie/mgbdis

macro CREDITS_MACRO
    CREDITS_MACRO_LDH_AND_ADD
    CREDITS_MACRO_LD
endm

macro CREDITS_MACRO_LDH_AND_ADD
IF !__PATCH_0__
    ldh  a, [hFrameCounter]
    and  $03
    add  e
ENDC
endm

macro CREDITS_MACRO_LDH_AND_LD
DEF mask = $03
IF _NARG == 1
    DEF mask = \1
ENDC

IF !__PATCH_0__
    ldh  a, [hFrameCounter]
    and  mask
    ld   e, a
ENDC
endm

macro CREDITS_MACRO_LD
IF !__PATCH_0__
    ld   e, a
ENDC
endm

macro CREDITS_MACRO_ADD
IF !__PATCH_0__
    add  e
ENDC
endm

Data_017_4000::
    db   $18, $05, $37, $20, $36, $0E, $1E, $2B, $25, $14, $1F, $12, $15, $2C, $31, $3F
    db   $0C, $30, $01, $33, $04, $27, $08, $1D, $38, $17, $3E, $28, $11, $00, $3A, $3D
    db   $2A, $0B, $1B, $0A, $34, $07, $22, $0F, $1C, $23, $2F, $3B, $2D, $16, $3C, $32
    db   $10, $29, $02, $2E, $0D, $19, $09, $26, $24, $06, $13, $21, $1A, $03, $39, $35

Data_017_4040::
    db   $7F, $BF, $DF, $EF, $F7, $FB, $FD, $FE

Data_017_4048::
    db   $50, $91, $60, $90, $70, $90, $80, $90, $90, $90, $A0, $90, $F0, $91, $60, $91
    db   $70, $91, $80, $91, $90, $91, $A0, $91, $40, $94

AnimateCreditsIslandFadeTiles::
IF LANG_FR
    ; TODO: document what this code is doing
    ; (hReplaceTiles isn't supposed to go above $10)
    ldh a, [hReplaceTiles]
    cp $11
    jr nc, jr_017_40c1
ENDC
    ld   a, [wD00B]                               ;; 17:4062 $FA $0B $D0
    ld   e, a                                     ;; 17:4065 $5F
    ld   d, $00                                   ;; 17:4066 $16 $00
    ld   hl, Data_017_4000                        ;; 17:4068 $21 $00 $40
    add  hl, de                                   ;; 17:406B $19
    ld   a, [hl]                                  ;; 17:406C $7E
    rra                                           ;; 17:406D $1F
    rra                                           ;; 17:406E $1F
    and  $0E                                      ;; 17:406F $E6 $0E
    ld   b, a                                     ;; 17:4071 $47
    ld   a, [hl]                                  ;; 17:4072 $7E
    and  $07                                      ;; 17:4073 $E6 $07
    ld   e, a                                     ;; 17:4075 $5F
    ld   hl, Data_017_4040                        ;; 17:4076 $21 $40 $40
    add  hl, de                                   ;; 17:4079 $19
    ld   c, [hl]                                  ;; 17:407A $4E
    xor  a                                        ;; 17:407B $AF
    ld   d, a                                     ;; 17:407C $57

.loop_407D
    ldh  [hMultiPurpose2], a                      ;; 17:407D $E0 $D9
    sla  a                                        ;; 17:407F $CB $27
    ld   e, a                                     ;; 17:4081 $5F
    ld   hl, Data_017_4048                        ;; 17:4082 $21 $48 $40
    add  hl, de                                   ;; 17:4085 $19
    ld   a, [hl+]                                 ;; 17:4086 $2A
    ld   h, [hl]                                  ;; 17:4087 $66
    add  b                                        ;; 17:4088 $80
    ld   l, a                                     ;; 17:4089 $6F
    ld   a, [hl]                                  ;; 17:408A $7E
    and  c                                        ;; 17:408B $A1
    ld   [hl+], a                                 ;; 17:408C $22
    ld   a, [hl]                                  ;; 17:408D $7E
    and  c                                        ;; 17:408E $A1
    ld   [hl], a                                  ;; 17:408F $77
    ldh  a, [hMultiPurpose2]                      ;; 17:4090 $F0 $D9
    inc  a                                        ;; 17:4092 $3C
    cp   $0D                                      ;; 17:4093 $FE $0D
    jr   nz, .loop_407D                           ;; 17:4095 $20 $E6

    xor  a                                        ;; 17:4097 $AF
    ldh  [hReplaceTiles], a                       ;; 17:4098 $E0 $A5
    ret                                           ;; 17:409A $C9

IF LANG_FR
Data_017_40A1:
    ; tile
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $F3, $F3, $ED, $ED, $FF, $FF

Data_017_40B1:
    ; tile
    db   $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FD, $FD, $FB, $FB, $FF, $FF

jr_017_40c1:
    jr nz, .jr_40c8

    ld hl, Data_017_40A1
    jr jr_017_40cb

.jr_40c8
    ld hl, Data_017_40B1

jr_017_40cb:
    ld de, vTiles1 + $0480
    ld bc, TILE_SIZE
    call CopyData
    xor a
    ldh [hReplaceTiles], a
    jp DrawLinkSpriteAndReturn
ENDC

PUSHC
SETCHARMAP CreditsCharmap
include "text/credits.asm"
POPC

func_017_448B::
    ld   a, [wD009]                               ;; 17:448B $FA $09 $D0
    and  a                                        ;; 17:448E $A7
    ret  nz                                       ;; 17:448F $C0

    ld   a, [wD01E]                               ;; 17:4490 $FA $1E $D0

.jr_4493
    and  a                                        ;; 17:4493 $A7
    jr   nz, .jr_449C                             ;; 17:4494 $20 $06

    call LayoutRoleLetters                        ;; 17:4496 $CD $9D $46
    call LayoutStaffLetters                       ;; 17:4499 $CD $84 $47

.jr_449C
    ld   a, [wD012]                               ;; 17:449C $FA $12 $D0
    JP_TABLE                                      ;; 17:449F $C7
._00 dw func_017_44FC
._01 dw func_017_457D
._02 dw func_017_4594
._03 dw func_017_45BA
._04 dw func_017_4630
._05 dw func_017_4678

include "data/credits.asm"

func_017_44FC::
    ld   a, [wD008]                               ;; 17:44FC $FA $08 $D0
    and  a                                        ;; 17:44FF $A7
    ret  nz                                       ;; 17:4500 $C0

    ld   c, $00                                   ;; 17:4501 $0E $00
    ld   a, [wD00A]                               ;; 17:4503 $FA $0A $D0
    ld   e, a                                     ;; 17:4506 $5F
    cp   $25                                      ;; 17:4507 $FE $25

.jr_4509
    jr   c, jr_017_4519                           ;; 17:4509 $38 $0E

    cp   $27                                      ;; 17:450B $FE $27
    jr   nz, .jr_4514                             ;; 17:450D $20 $05

    ldh  a, [hIsGBC]                              ;; 17:450F $F0 $FE
    and  a                                        ;; 17:4511 $A7
    jr   z, jr_017_4519                           ;; 17:4512 $28 $05

.jr_4514
    ld   a, $0C                                   ;; 17:4514 $3E $0C
    ld   [wD01E], a                               ;; 17:4516 $EA $1E $D0

jr_017_4519:
    ld   d, $00                                   ;; 17:4519 $16 $00
    ld   hl, Data_017_44AC                        ;; 17:451B $21 $AC $44
    add  hl, de                                   ;; 17:451E $19
    ld   a, [wD010]                               ;; 17:451F $FA $10 $D0
    cp   [hl]                                     ;; 17:4522 $BE
    jr   nz, .jr_4526                             ;; 17:4523 $20 $01

    inc  c                                        ;; 17:4525 $0C

.jr_4526
    ld   a, c                                     ;; 17:4526 $79
    ld   [wD005], a                               ;; 17:4527 $EA $05 $D0
    ld   a, [hl]                                  ;; 17:452A $7E
    ld   [wD010], a                               ;; 17:452B $EA $10 $D0
    ld   hl, Data_017_44D4                        ;; 17:452E $21 $D4 $44
    add  hl, de                                   ;; 17:4531 $19
    ld   a, [hl]                                  ;; 17:4532 $7E
    ld   [wD011], a                               ;; 17:4533 $EA $11 $D0
    xor  a                                        ;; 17:4536 $AF
    ld   [wCreditsScratch0], a                    ;; 17:4537 $EA $00 $D0
    jp   func_017_45B5                            ;; 17:453A $C3 $B5 $45

; Unused data
Data_017_453D::
    db   $00, $00, $00, $00, $04, $04, $04, $04, $19, $19, $19, $19, $1E, $1E, $1E, $1E
    db   $FF, $FF, $FF, $FF, $AF, $AF, $AF, $AF, $5A, $5A, $5A, $5A, $1E, $1E, $1E, $1E
    db   $1E, $1E, $1E, $1E, $19, $19, $19, $19, $04, $04, $04, $04, $00, $00, $00, $00

Data_017_456D::
    db   $1E, $1E, $1E, $1E, $6F, $6F, $6F, $6F, $BF, $BF, $BF, $BF, $FF, $FF, $FF, $FF

func_017_457D::
    ld   a, $B0                                   ;; 17:457D $3E $B0
    ld   [wD008], a                               ;; 17:457F $EA $08 $D0
    call func_017_45B5                            ;; 17:4582 $CD $B5 $45
    ld   a, [wD00A]                               ;; 17:4585 $FA $0A $D0
    cp   $27                                      ;; 17:4588 $FE $27
    jr   nz, .jr_458E                             ;; 17:458A $20 $02

    ld   [hl], $04                                ;; 17:458C $36 $04

.jr_458E
    ld   a, $1E                                   ;; 17:458E $3E $1E
    ld   [wOBJ1Palette], a                        ;; 17:4590 $EA $99 $DB
    ret                                           ;; 17:4593 $C9

func_017_4594::
    ld   a, [wD008]                               ;; 17:4594 $FA $08 $D0
    and  a                                        ;; 17:4597 $A7
    ret  nz                                       ;; 17:4598 $C0

    ld   c, $00                                   ;; 17:4599 $0E $00
    ld   a, [wD00A]                               ;; 17:459B $FA $0A $D0
    inc  a                                        ;; 17:459E $3C
    ld   e, a                                     ;; 17:459F $5F
    ld   d, $00                                   ;; 17:45A0 $16 $00
    ld   hl, Data_017_44AC                        ;; 17:45A2 $21 $AC $44
    add  hl, de                                   ;; 17:45A5 $19
    ld   a, [wD010]                               ;; 17:45A6 $FA $10 $D0
    cp   [hl]                                     ;; 17:45A9 $BE
    jr   nz, .jr_45AD                             ;; 17:45AA $20 $01

    inc  c                                        ;; 17:45AC $0C

.jr_45AD
    ld   a, c                                     ;; 17:45AD $79
    ld   [wD005], a                               ;; 17:45AE $EA $05 $D0
    xor  a                                        ;; 17:45B1 $AF
    ld   [wCreditsScratch0], a                    ;; 17:45B2 $EA $00 $D0

func_017_45B5::
    ld   hl, wD012                                ;; 17:45B5 $21 $12 $D0
    inc  [hl]                                     ;; 17:45B8 $34
    ret                                           ;; 17:45B9 $C9

func_017_45BA::
    ld   a, [wD00A]                               ;; 17:45BA $FA $0A $D0
    ldh  [hMultiPurposeD], a                      ;; 17:45BD $E0 $E4
    cp   $26                                      ;; 17:45BF $FE $26
    jr   c, jr_017_45F9                           ;; 17:45C1 $38 $36

    ldh  a, [hIsGBC]                              ;; 17:45C3 $F0 $FE
    and  a                                        ;; 17:45C5 $A7
    jr   z, jr_017_45E8                           ;; 17:45C6 $28 $20

    ld   hl, wDeathCount                          ;; 17:45C8 $21 $57 $DB
    ld   a, [hl+]                                 ;; 17:45CB $2A
    or   [hl]                                     ;; 17:45CC $B6
    jr   z, jr_017_45F9                           ;; 17:45CD $28 $2A

    ldh  a, [hFrameCounter]                       ;; 17:45CF $F0 $E7
    and  $03                                      ;; 17:45D1 $E6 $03
    jr   nz, jr_017_4612                          ;; 17:45D3 $20 $3D

    call func_017_7FA9                            ;; 17:45D5 $CD $A9 $7F
    ldh  a, [hFrameCounter]                       ;; 17:45D8 $F0 $E7
    and  $04                                      ;; 17:45DA $E6 $04
    jr   z, .jr_45E3                              ;; 17:45DC $28 $05

    ld   a, $02                                   ;; 17:45DE $3E $02
    ld   [wPaletteDataFlags], a                   ;; 17:45E0 $EA $D1 $DD

.jr_45E3
    ld   a, [wD00A]                               ;; 17:45E3 $FA $0A $D0
    ldh  [hMultiPurposeD], a                      ;; 17:45E6 $E0 $E4

jr_017_45E8:
    ldh  a, [hFrameCounter]                       ;; 17:45E8 $F0 $E7
    and  $07                                      ;; 17:45EA $E6 $07
    jr   nz, jr_017_4612                          ;; 17:45EC $20 $24

    ld   a, [wCreditsScratch0]                    ;; 17:45EE $FA $00 $D0
    inc  a                                        ;; 17:45F1 $3C
    ld   [wCreditsScratch0], a                    ;; 17:45F2 $EA $00 $D0
    cp   $0C                                      ;; 17:45F5 $FE $0C
    jr   nz, jr_017_4612                          ;; 17:45F7 $20 $19

jr_017_45F9:
    ldh  a, [hMultiPurposeD]                      ;; 17:45F9 $F0 $E4
    cp   $26                                      ;; 17:45FB $FE $26
    ld   a, $10                                   ;; 17:45FD $3E $10
    jr   c, .jr_4603                              ;; 17:45FF $38 $02

    ld   a, $80                                   ;; 17:4601 $3E $80

.jr_4603
    ld   [wD008], a                               ;; 17:4603 $EA $08 $D0
    ld   a, $00                                   ;; 17:4606 $3E $00
    ld   [wD012], a                               ;; 17:4608 $EA $12 $D0
    ld   a, [wD00A]                               ;; 17:460B $FA $0A $D0
    inc  a                                        ;; 17:460E $3C
    ld   [wD00A], a                               ;; 17:460F $EA $0A $D0

jr_017_4612:
    ld   a, [wCreditsScratch0]                    ;; 17:4612 $FA $00 $D0
    ld   e, a                                     ;; 17:4615 $5F
    CREDITS_MACRO
    ld   d, $00                                   ;; 17:461C $16 $00
    ldh  a, [hMultiPurposeD]                      ;; 17:461E $F0 $E4
    cp   $26                                      ;; 17:4620 $FE $26
    jr   c, .ret_462F                             ;; 17:4622 $38 $0B

    ld   hl, Data_017_456D                        ;; 17:4624 $21 $6D $45
    add  hl, de                                   ;; 17:4627 $19
    ld   a, [hl]                                  ;; 17:4628 $7E
    ld   [wBGPalette], a                          ;; 17:4629 $EA $97 $DB
    ld   [wOBJ1Palette], a                        ;; 17:462C $EA $99 $DB

.ret_462F
    ret                                           ;; 17:462F $C9

func_017_4630::
    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:4630 $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:4632 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:4635 $21 $00 $C2
    add  hl, de                                   ;; 17:4638 $19
    ld   [hl], $E0                                ;; 17:4639 $36 $E0
    ld   hl, wEntitiesPosYTable                   ;; 17:463B $21 $10 $C2
    add  hl, de                                   ;; 17:463E $19
    ld   [hl], $10                                ;; 17:463F $36 $10
    ld   hl, wEntitiesSpeedXTable                 ;; 17:4641 $21 $40 $C2
    add  hl, de                                   ;; 17:4644 $19
    ld   [hl], $08                                ;; 17:4645 $36 $08
    ld   hl, wEntitiesSpeedYTable                 ;; 17:4647 $21 $50 $C2
    add  hl, de                                   ;; 17:464A $19
    ld   [hl], $08                                ;; 17:464B $36 $08
    ld   hl, wEntitiesPrivateState1Table          ;; 17:464D $21 $B0 $C2
    add  hl, de                                   ;; 17:4650 $19
    ld   [hl], $10                                ;; 17:4651 $36 $10
    ldh  a, [hIsGBC]                              ;; 17:4653 $F0 $FE
    and  a                                        ;; 17:4655 $A7
    jp   z, func_017_45B5                         ;; 17:4656 $CA $B5 $45

    ld   hl, wEntitiesSpeedYTable                 ;; 17:4659 $21 $50 $C2
    add  hl, de                                   ;; 17:465C $19
    ld   [hl], $F8                                ;; 17:465D $36 $F8
    ld   hl, wDeathCount                          ;; 17:465F $21 $57 $DB
    ld   a, [hl+]                                 ;; 17:4662 $2A
    or   [hl]                                     ;; 17:4663 $B6
    jr   nz, .jr_466A                             ;; 17:4664 $20 $04

    ld   a, $3C                                   ;; 17:4666 $3E $3C
    jr   jr_017_466B                              ;; 17:4668 $18 $01

.jr_466A
    xor  a                                        ;; 17:466A $AF

jr_017_466B:
    ld   [wD01E], a                               ;; 17:466B $EA $1E $D0
    xor  a                                        ;; 17:466E $AF
    ld   [wCreditsSubscene], a                    ;; 17:466F $EA $0E $D0
    call ResetCreditsSceneVariables               ;; 17:4672 $CD $A5 $4D
    jp   IncrementCreditsGameplaySubtype          ;; 17:4675 $C3 $5B $4C

func_017_4678::
    ret                                           ;; 17:4678 $C9

; Charmap for the credits roles
; Maps a letter code (A = 0, B = 1…) to the proper tile index
CreditsRolesCharmap::
IF __PATCH_1__
    db   $40 ; A
    db   $56 ; B
    db   $41 ; C
    db   $42 ; D
    db   $43 ; E
    db   $57 ; F
    db   $44 ; G
    db   $45 ; H
    db   $46 ; I
    db   $58 ; J
    db   $47 ; K
    db   $48 ; L
    db   $49 ; M
    db   $4A ; N
    db   $4B ; O
    db   $50 ; P
    db   $59 ; Q
    db   $51 ; R
    db   $52 ; S
    db   $53 ; T
    db   $54 ; U
    db   $55 ; V
    db   $2F ; W
    db   $3F ; X
    db   $5A ; Y
    db   $5B ; Z
    db   $00 ; (unused)
    db   $0D ; 1
    db   $00 ; (unused)
    db   $0F ; 3
    db   $00 ; (unused)
    db   $00 ; (unused)
    db   $00 ; (unused)
    db   $00 ; (unused)
    db   $0C ; 8
    db   $0E ; 9
ELSE
    db   $40 ; A
    db   $18 ; B
    db   $41 ; C
    db   $42 ; D
    db   $43 ; E
    db   $19 ; F
    db   $44 ; G
    db   $45 ; H
    db   $46 ; I
    db   $00 ; (unused)
    db   $47 ; K
    db   $48 ; L
    db   $49 ; M
    db   $4A ; N
    db   $4B ; O
    db   $50 ; P
    db   $00 ; (unused)
    db   $51 ; R
    db   $52 ; S
    db   $53 ; T
    db   $54 ; U
    db   $55 ; V
    db   $2F ; W
    db   $3F ; X
    db   $00 ; (unused)
    db   $00 ; (unused)
    db   $00 ; (unused)
    db   $1A ; 1
    db   $00 ; (unused)
    db   $1C ; 3
    db   $00 ; (unused)
    db   $00 ; (unused)
    db   $00 ; (unused)
    db   $00 ; (unused)
    db   $1D ; 8
    db   $1B ; 9
ENDC

; Set the position of the staff role letters in the OAM buffer.
;
; Note that only even letters will be displayed on even frames (and only
; odd letters on odd frames).
;
; This is because the Game Boy can only display 10 sprites per line, and
; some roles have more letter than that.
LayoutRoleLetters::
    ld   a, [wD010]                               ;; 17:469D $FA $10 $D0
    cp   -1                                       ;; 17:46A0 $FE $FF
    ret  z                                        ;; 17:46A2 $C8

    ; Retrieve the current role to display
    rla                                           ;; 17:46A3 $17
    and  $FE                                      ;; 17:46A4 $E6 $FE
    ld   e, a                                     ;; 17:46A6 $5F
    ld   d, $00                                   ;; 17:46A7 $16 $00
    rla                                           ;; 17:46A9 $17
    rl   d                                        ;; 17:46AA $CB $12
    rla                                           ;; 17:46AC $17
    rl   d                                        ;; 17:46AD $CB $12
    rla                                           ;; 17:46AF $17
    rl   d                                        ;; 17:46B0 $CB $12
    and  $F0                                      ;; 17:46B2 $E6 $F0
    add  e                                        ;; 17:46B4 $83
    ld   e, a                                     ;; 17:46B5 $5F
    ld   a, d                                     ;; 17:46B6 $7A
    adc  $00                                      ;; 17:46B7 $CE $00
    ld   d, a                                     ;; 17:46B9 $57
    ld   hl, NewStaffRoles                        ;; 17:46BA $21 $9B $40
    add  hl, de                                   ;; 17:46BD $19

    ; Set the target OAM buffer address
    ld   de, wDynamicOAMBuffer                    ;; 17:46BE $11 $30 $C0
    ldh  a, [hIsGBC]                              ;; 17:46C1 $F0 $FE
    and  a                                        ;; 17:46C3 $A7
    jr   z, .oamEnd                               ;; 17:46C4 $28 $03
    ld   de, wOAMBuffer                           ;; 17:46C6 $11 $00 $C0
.oamEnd

    ; On even frames, start at letter 0.
    ; On odd frames, start at letter 1.
    ldh  a, [hFrameCounter]                       ;; 17:46C9 $F0 $E7
    and  $01                                      ;; 17:46CB $E6 $01
    ld   a, $10                                   ;; 17:46CD $3E $10
    jr   z, .oddFrameEnd                          ;; 17:46CF $28 $03
    inc  hl                                       ;; 17:46D1 $23
    ld   a, $18                                   ;; 17:46D2 $3E $18
.oddFrameEnd

    ldh  [hMultiPurpose0], a                      ;; 17:46D4 $E0 $D7
    ld   c, $09                                   ;; 17:46D6 $0E $09

    ; For each letter…
.loop
    ld   a, $40 ; OAM Y position                  ;; 17:46D8 $3E $40
    ld   [de], a                                  ;; 17:46DA $12
    inc  de                                       ;; 17:46DB $13
    ldh  a, [hMultiPurpose0] ; OAM X position     ;; 17:46DC $F0 $D7
    ld   [de], a                                  ;; 17:46DE $12
    inc  de                                       ;; 17:46DF $13

    ; Increment X position
    add  $10                                      ;; 17:46E0 $C6 $10
    ldh  [hMultiPurpose0], a                      ;; 17:46E2 $E0 $D7

    ; Read the ASCII code for the current role letter
    ld   a, [hl+]                                 ;; 17:46E4 $2A
    ; Skip the next letter (because only every other letter is ever displayed in one frame)
    inc  hl                                       ;; 17:46E5 $23

    push hl                                       ;; 17:46E6 $E5
    push de                                       ;; 17:46E7 $D5

    ;
    ; Adjust the letter ASCII code, to map to a tile indice
    ;
IF LANG_DE
    cp   $2E
    jr   nz, .jr_017_46EA

    ld   a, $14
    jr   .jr_017_4708
.jr_017_46EA
ENDC
    cp   $30                                      ;; 17:46E8 $FE $30
    jr   c, .jr_017_46F6                          ;; 17:46EA $38 $0A

    cp   $3A                                      ;; 17:46EC $FE $3A
    jr   nc, .jr_017_46F6                         ;; 17:46EE $30 $06

    sub  $30                                      ;; 17:46F0 $D6 $30
    add  $1A                                      ;; 17:46F2 $C6 $1A
    jr   .jr_017_4700                             ;; 17:46F4 $18 $0A

.jr_017_46F6
    cp   $20                                      ;; 17:46F6 $FE $20
    jr   nz, .jr_017_46FE                         ;; 17:46F8 $20 $04

IF __PATCH_1__
    ld   a, $13
ELSE
    ld   a, $0F                                   ;; 17:46FA $3E $0F
ENDC
    jr   .jr_017_4708                             ;; 17:46FC $18 $0A

.jr_017_46FE
    ; Substract $41 the letter ASCII code (so that A becomes 0, B becomes 1, etc.)
    sub  $41                                      ;; 17:46FE $D6 $41

.jr_017_4700
    ; Map the letter code to the tile index
    ld   e, a                                     ;; 17:4700 $5F
    ld   d, $00                                   ;; 17:4701 $16 $00
    ld   hl, CreditsRolesCharmap                  ;; 17:4703 $21 $79 $46
    add  hl, de                                   ;; 17:4706 $19
    ld   a, [hl]                                  ;; 17:4707 $7E

.jr_017_4708
    pop  de                                       ;; 17:4708 $D1
    pop  hl                                       ;; 17:4709 $E1
    ld   [de], a ; OAM tile index                 ;; 17:470A $12
    inc  de                                       ;; 17:470B $13
    ld   a, $10 ; OAM attribute                   ;; 17:470C $3E $10
    ld   [de], a                                  ;; 17:470E $12
    inc  de                                       ;; 17:470F $13
    dec  c                                        ;; 17:4710 $0D
    jr   nz, .loop                                ;; 17:4711 $20 $C5

    ret                                           ;; 17:4713 $C9

include "data/credits_staff_codepoint_to_tile.asm"

LayoutStaffLetters::
    ld   a, [wD011]                               ;; 17:4784 $FA $11 $D0
    rla                                           ;; 17:4787 $17
    and  $FE                                      ;; 17:4788 $E6 $FE
    ld   e, a                                     ;; 17:478A $5F
    ld   d, $00                                   ;; 17:478B $16 $00
    rla                                           ;; 17:478D $17
    rl   d                                        ;; 17:478E $CB $12
    rla                                           ;; 17:4790 $17
    rl   d                                        ;; 17:4791 $CB $12
    rla                                           ;; 17:4793 $17
    rl   d                                        ;; 17:4794 $CB $12
    and  $F0                                      ;; 17:4796 $E6 $F0
    add  e                                        ;; 17:4798 $83
    ld   e, a                                     ;; 17:4799 $5F
    ld   a, d                                     ;; 17:479A $7A
    adc  $00                                      ;; 17:479B $CE $00
    ld   d, a                                     ;; 17:479D $57
    ld   hl, NewStaffPeople                       ;; 17:479E $21 $DF $41
    add  hl, de                                   ;; 17:47A1 $19
    push hl                                       ;; 17:47A2 $E5
    xor  a                                        ;; 17:47A3 $AF
    ldh  [hMultiPurpose1], a                      ;; 17:47A4 $E0 $D8

    ; Select OAM buffer for the top part
    ld   de, wDynamicOAMBuffer+$24                ;; 17:47A6 $11 $54 $C0
    ldh  a, [hIsGBC]                              ;; 17:47A9 $F0 $FE
    and  a                                        ;; 17:47AB $A7
    jr   z, .topOAMBufferEnd                      ;; 17:47AC $28 $03
    ld   de, wOAMBuffer+$24                       ;; 17:47AE $11 $24 $C0
.topOAMBufferEnd

    ; Lay out the top part of the letters
    ld   a, $55                                   ;; 17:47B1 $3E $55
    call LayoutRowOfStaffLetters                  ;; 17:47B3 $CD $C8 $47

    ld   hl, hMultiPurpose1                       ;; 17:47B6 $21 $D8 $FF
    inc  [hl]                                     ;; 17:47B9 $34
    pop  hl                                       ;; 17:47BA $E1

    ; Select OAM buffer for the bottom part
    ld   de, wDynamicOAMBuffer+$48                ;; 17:47BB $11 $78 $C0
    ldh  a, [hIsGBC]                              ;; 17:47BE $F0 $FE
    and  a                                        ;; 17:47C0 $A7
    jr   z, .bottomOAMBufferEnd                   ;; 17:47C1 $28 $03
    ld   de, wDynamicOAMBuffer+$18                ;; 17:47C3 $11 $48 $C0
.bottomOAMBufferEnd

    ; Lay out the bottom part of the letters
    ld   a, $5D                                   ;; 17:47C6 $3E $5D
    ; fallthrough to LayoutRowOfStaffLetters

; Layout the top or bottom part of the letters.
;
; Input:
;   a    ???
LayoutRowOfStaffLetters::
    ldh  [hMultiPurposeH], a                      ;; 17:47C8 $E0 $E9
    ld   c, $12                                   ;; 17:47CA $0E $12
    ld   b, $08                                   ;; 17:47CC $06 $08
    ld   a, [wD011]                               ;; 17:47CE $FA $11 $D0
    cp   $25                                      ;; 17:47D1 $FE $25
    ld   a, $38                                   ;; 17:47D3 $3E $38
    jr   z, .jr_017_47E6                          ;; 17:47D5 $28 $0F

    ld   c, $09                                   ;; 17:47D7 $0E $09
    ld   b, $10                                   ;; 17:47D9 $06 $10
    ldh  a, [hFrameCounter]                       ;; 17:47DB $F0 $E7
    and  $01                                      ;; 17:47DD $E6 $01
    ld   a, $10                                   ;; 17:47DF $3E $10
    jr   z, .jr_017_47E6                          ;; 17:47E1 $28 $03

    inc  hl                                       ;; 17:47E3 $23
    ld   a, $18                                   ;; 17:47E4 $3E $18

.jr_017_47E6
    ldh  [hMultiPurpose0], a                      ;; 17:47E6 $E0 $D7

    ; For each letter…
.loop
    ldh  a, [hMultiPurposeH]                      ;; 17:47E8 $F0 $E9
    ld   [de], a ; OAM Y position                 ;; 17:47EA $12
    inc  de                                       ;; 17:47EB $13
    ldh  a, [hMultiPurpose0]                      ;; 17:47EC $F0 $D7
    ld   [de], a  ; OAM X position                ;; 17:47EE $12
    inc  de                                       ;; 17:47EF $13

    ; Increment X position
    add  b                                        ;; 17:47F0 $80
    ldh  [hMultiPurpose0], a                      ;; 17:47F1 $E0 $D7

    ld   a, [wD011]                               ;; 17:47F3 $FA $11 $D0
    cp   $25                                      ;; 17:47F6 $FE $25
    ld   a, [hl+]                                 ;; 17:47F8 $2A
    jr   z, .jr_017_47FC                          ;; 17:47F9 $28 $01

    inc  hl                                       ;; 17:47FB $23

    ;
    ; Adjust the letter ASCII code, to map to a tile indice
    ;

.jr_017_47FC
    push hl                                       ;; 17:47FC $E5
    push de                                       ;; 17:47FD $D5
    cp   $26                                      ;; 17:47FE $FE $26
    jr   nz, .jr_017_4806                         ;; 17:4800 $20 $04

    ld   a, CREDITS_VAR_0                         ;; 17:4802 $3E $1A
    jr   .jr_017_4818                             ;; 17:4804 $18 $12

.jr_017_4806
    cp   $32                                      ;; 17:4806 $FE $32
    jr   nz, .jr_017_480E                         ;; 17:4808 $20 $04

    ld   a, CREDITS_VAR_1                         ;; 17:480A $3E $1B
    jr   .jr_017_4818                             ;; 17:480C $18 $0A

.jr_017_480E
    cp   $20                                      ;; 17:480E $FE $20
    jr   nz, .jr_017_4816                         ;; 17:4810 $20 $04

    ld   a, CREDITS_VAR_2                         ;; 17:4812 $3E $0F
    jr   .jr_017_482D                             ;; 17:4814 $18 $17

.jr_017_4816

    ; Substract $41 the letter ASCII code (so that A becomes 0, B becomes 1, etc.)
    sub  $41                                      ;; 17:4816 $D6 $41

.jr_017_4818

    ; Map the letter code to the tile index and attribute
    sla  a                                        ;; 17:4818 $CB $27
    ld   hl, hMultiPurpose1                       ;; 17:481A $21 $D8 $FF
    add  [hl]                                     ;; 17:481D $86
    ld   e, a                                     ;; 17:481E $5F
    ld   d, $00                                   ;; 17:481F $16 $00
    ld   hl, CreditsStaffAttrmap                  ;; 17:4821 $21 $4C $47
    add  hl, de                                   ;; 17:4824 $19
    ld   a, [hl]                                  ;; 17:4825 $7E
    ldh  [hMultiPurposeG], a                      ;; 17:4826 $E0 $E8
    ld   hl, CreditsStaffCharmap                  ;; 17:4828 $21 $14 $47
    add  hl, de                                   ;; 17:482B $19
    ld   a, [hl]                                  ;; 17:482C $7E

.jr_017_482D
    pop  de                                       ;; 17:482D $D1
    pop  hl                                       ;; 17:482E $E1
    ld   [de], a ; OAM tile index                 ;; 17:482F $12
    inc  de                                       ;; 17:4830 $13
    ldh  a, [hMultiPurposeG]                      ;; 17:4831 $F0 $E8
    ld   [de], a ; OAM attribute                  ;; 17:4833 $12
    inc  de                                       ;; 17:4834 $13
    dec  c                                        ;; 17:4835 $0D
    jr   nz, .loop                                ;; 17:4836 $20 $B0

    ret                                           ;; 17:4838 $C9

func_017_4839::
    ld   a, [wNoiseSfxSeaWavesCounter]            ;; 17:4839 $FA $14 $C1
    inc  a                                        ;; 17:483C $3C
    cp   $C0                                      ;; 17:483D $FE $C0
    jr   c, .jr_4846                              ;; 17:483F $38 $05

    ld   a, NOISE_SFX_SEA_WAVES                   ;; 17:4841 $3E $0F
    ldh  [hNoiseSfx], a                           ;; 17:4843 $E0 $F4
    xor  a                                        ;; 17:4845 $AF

.jr_4846
    ld   [wNoiseSfxSeaWavesCounter], a            ;; 17:4846 $EA $14 $C1
    ld   a, [wD466]                               ;; 17:4849 $FA $66 $D4
    and  a                                        ;; 17:484C $A7
    jr   nz, .jr_485D                             ;; 17:484D $20 $0E

    ld   a, JINGLE_SEAGULL                        ;; 17:484F $3E $21
    ldh  [hJingle], a                             ;; 17:4851 $E0 $F2
    call GetRandomByte                            ;; 17:4853 $CD $0D $28
    and  $7F                                      ;; 17:4856 $E6 $7F
    add  $50                                      ;; 17:4858 $C6 $50
    ld   [wD466], a                               ;; 17:485A $EA $66 $D4

.jr_485D
    dec  a                                        ;; 17:485D $3D
    ld   [wD466], a                               ;; 17:485E $EA $66 $D4
    ret                                           ;; 17:4861 $C9

Data_017_4862::
    db   $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93, $92, $93
    db   $92, $93, $92, $93, $92

Data_017_4877::
    db   $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83, $82, $83
    db   $82, $83, $82, $83, $82

func_017_488C::
    ldh  a, [hFrameCounter]                       ;; 17:488C $F0 $E7
    and  $0F                                      ;; 17:488E $E6 $0F
    cp   $02                                      ;; 17:4890 $FE $02
    jr   nz, ret_017_48CC                         ;; 17:4892 $20 $38

    push de                                       ;; 17:4894 $D5
    ld   hl, wDrawCommand                         ;; 17:4895 $21 $01 $D6
    ld   a, d                                     ;; 17:4898 $7A
    ld   [hl+], a                                 ;; 17:4899 $22
    ld   a, e                                     ;; 17:489A $7B
    ld   [hl+], a                                 ;; 17:489B $22
    ld   a, $13                                   ;; 17:489C $3E $13
    ld   [hl+], a                                 ;; 17:489E $22
    ld   de, Data_017_4862                        ;; 17:489F $11 $62 $48
    ldh  a, [hFrameCounter]                       ;; 17:48A2 $F0 $E7
    and  $10                                      ;; 17:48A4 $E6 $10
    jr   z, .jr_48A9                              ;; 17:48A6 $28 $01

    inc  de                                       ;; 17:48A8 $13

.jr_48A9
    ld   c, $14                                   ;; 17:48A9 $0E $14

.loop_48AB
    ld   a, [de]                                  ;; 17:48AB $1A
    ld   [hl+], a                                 ;; 17:48AC $22
    dec  c                                        ;; 17:48AD $0D
    jr   nz, .loop_48AB                           ;; 17:48AE $20 $FB

    pop  de                                       ;; 17:48B0 $D1
    ld   a, d                                     ;; 17:48B1 $7A
    ld   [hl+], a                                 ;; 17:48B2 $22
    ld   a, e                                     ;; 17:48B3 $7B
    sub  $20                                      ;; 17:48B4 $D6 $20
    ld   [hl+], a                                 ;; 17:48B6 $22
    ld   a, $13                                   ;; 17:48B7 $3E $13
    ld   [hl+], a                                 ;; 17:48B9 $22
    ld   de, Data_017_4877                        ;; 17:48BA $11 $77 $48
    ldh  a, [hFrameCounter]                       ;; 17:48BD $F0 $E7
    and  $10                                      ;; 17:48BF $E6 $10
    jr   z, .jr_48C4                              ;; 17:48C1 $28 $01

    inc  de                                       ;; 17:48C3 $13

.jr_48C4
    ld   c, $14                                   ;; 17:48C4 $0E $14

.loop_48C6
    ld   a, [de]                                  ;; 17:48C6 $1A
    ld   [hl+], a                                 ;; 17:48C7 $22
    dec  c                                        ;; 17:48C8 $0D
    jr   nz, .loop_48C6                           ;; 17:48C9 $20 $FB

    ld   [hl], c                                  ;; 17:48CB $71

ret_017_48CC:
    ret                                           ;; 17:48CC $C9

Data_017_48CD::
    db   $F4, $F4, $F5, $F6, $F7, $F7, $F8, $F8, $F8, $F8, $F7, $F7, $F6, $F5, $F4, $F4

; Apply the waving visual effect when the Wind Fish appears
; or disappears.
ApplyWindFishVfx::
    ldh  a, [hFrameCounter]                       ;; 17:48DD $F0 $E7
    rra                                           ;; 17:48DF $1F
    rra                                           ;; 17:48E0 $1F
    rra                                           ;; 17:48E1 $1F
    nop                                           ;; 17:48E2 $00
    and  $0F                                      ;; 17:48E3 $E6 $0F
    ld   e, a                                     ;; 17:48E5 $5F
    ld   d, $00                                   ;; 17:48E6 $16 $00
    ld   hl, Data_017_48CD                        ;; 17:48E8 $21 $CD $48
    add  hl, de                                   ;; 17:48EB $19
    ld   a, [hl]                                  ;; 17:48EC $7E
    sub  $05                                      ;; 17:48ED $D6 $05
    ldh  [rSCY], a                                ;; 17:48EF $E0 $42
    ldh  [hMultiPurposeG], a                      ;; 17:48F1 $E0 $E8
    ld   a, [wTransitionGfx]                      ;; 17:48F3 $FA $7F $C1
    cp   $FE                                      ;; 17:48F6 $FE $FE
    ret  z                                        ;; 17:48F8 $C8

    ld   a, [wTransitionGfxFrameCount]            ;; 17:48F9 $FA $80 $C1
    inc  a                                        ;; 17:48FC $3C
    ld   [wTransitionGfxFrameCount], a            ;; 17:48FD $EA $80 $C1
    ld   a, [wD005]                               ;; 17:4900 $FA $05 $D0
    ldh  [hMultiPurpose1], a                      ;; 17:4903 $E0 $D8
    ld   hl, wC17C                                ;; 17:4905 $21 $7C $C1
    xor  a                                        ;; 17:4908 $AF
    ld   [hl+], a                                 ;; 17:4909 $22
    ld   [hl+], a                                 ;; 17:490A $22
    ld   [hl+], a                                 ;; 17:490B $22
    ldh  a, [hIsGBC]                              ;; 17:490C $F0 $FE
    and  a                                        ;; 17:490E $A7
    jr   nz, jr_017_4964                          ;; 17:490F $20 $53

jr_017_4911:
    ldh  a, [rSTAT]                               ;; 17:4911 $F0 $41
    and  STATF_LCD                                ;; 17:4913 $E6 $03
    jr   nz, jr_017_4911                          ;; 17:4915 $20 $FA

    ld   d, $00                                   ;; 17:4917 $16 $00

.loop_4919
    ld   a, [wC17E]                               ;; 17:4919 $FA $7E $C1
    inc  a                                        ;; 17:491C $3C
    ld   [wC17E], a                               ;; 17:491D $EA $7E $C1
    and  $01                                      ;; 17:4920 $E6 $01
    jr   nz, .loop_4919                           ;; 17:4922 $20 $F5

    ld   a, [wC17C]                               ;; 17:4924 $FA $7C $C1
    add  $01                                      ;; 17:4927 $C6 $01
    ld   [wC17C], a                               ;; 17:4929 $EA $7C $C1
    ld   a, [wC17D]                               ;; 17:492C $FA $7D $C1
    adc  $00                                      ;; 17:492F $CE $00
    ld   [wC17D], a                               ;; 17:4931 $EA $7D $C1
    ld   a, [wC17C]                               ;; 17:4934 $FA $7C $C1
    cp   $50                                      ;; 17:4937 $FE $50
    jr   z, .jr_4960                              ;; 17:4939 $28 $25

    ld   hl, wTransitionGfxFrameCount             ;; 17:493B $21 $80 $C1
    ld   a, [wC17C]                               ;; 17:493E $FA $7C $C1
    add  [hl]                                     ;; 17:4941 $86
    and  $1F                                      ;; 17:4942 $E6 $1F
    ld   hl, hMultiPurpose1                       ;; 17:4944 $21 $D8 $FF
    or   [hl]                                     ;; 17:4947 $B6
    ld   e, a                                     ;; 17:4948 $5F
    ld   hl, Data_017_49B7                        ;; 17:4949 $21 $B7 $49
    add  hl, de                                   ;; 17:494C $19
    ld   a, [hl]                                  ;; 17:494D $7E
    push af                                       ;; 17:494E $F5
    ld   hl, hBaseScrollX                         ;; 17:494F $21 $96 $FF
    add  [hl]                                     ;; 17:4952 $86
    ldh  [rSCX], a                                ;; 17:4953 $E0 $43
    pop  af                                       ;; 17:4955 $F1
    sra  a                                        ;; 17:4956 $CB $2F
    ld   hl, hMultiPurposeG                       ;; 17:4958 $21 $E8 $FF
    add  [hl]                                     ;; 17:495B $86
    ldh  [rSCY], a                                ;; 17:495C $E0 $42
    jr   jr_017_4911                              ;; 17:495E $18 $B1

.jr_4960
    xor  a                                        ;; 17:4960 $AF
    ldh  [rSCX], a                                ;; 17:4961 $E0 $43
    ret                                           ;; 17:4963 $C9

jr_017_4964:
    ldh  a, [rSTAT]                               ;; 17:4964 $F0 $41
    and  STATF_LCD                                ;; 17:4966 $E6 $03
    jr   nz, jr_017_4964                          ;; 17:4968 $20 $FA

    ld   d, $00                                   ;; 17:496A $16 $00

.loop_496C
    ld   a, [wC17E]                               ;; 17:496C $FA $7E $C1
    inc  a                                        ;; 17:496F $3C
    ld   [wC17E], a                               ;; 17:4970 $EA $7E $C1
    and  $01                                      ;; 17:4973 $E6 $01
    jr   nz, .loop_496C                           ;; 17:4975 $20 $F5

    ld   a, [wC17C]                               ;; 17:4977 $FA $7C $C1
    add  $01                                      ;; 17:497A $C6 $01
    ld   [wC17C], a                               ;; 17:497C $EA $7C $C1
    ld   a, [wC17D]                               ;; 17:497F $FA $7D $C1
    adc  $00                                      ;; 17:4982 $CE $00
    ld   [wC17D], a                               ;; 17:4984 $EA $7D $C1
    ld   a, [wC17C]                               ;; 17:4987 $FA $7C $C1
    cp   $60                                      ;; 17:498A $FE $60
    jr   z, .jr_49B3                              ;; 17:498C $28 $25

    ld   hl, wTransitionGfxFrameCount             ;; 17:498E $21 $80 $C1
    ld   a, [wC17C]                               ;; 17:4991 $FA $7C $C1
    add  [hl]                                     ;; 17:4994 $86
    and  $1F                                      ;; 17:4995 $E6 $1F
    ld   hl, hMultiPurpose1                       ;; 17:4997 $21 $D8 $FF
    or   [hl]                                     ;; 17:499A $B6
    ld   e, a                                     ;; 17:499B $5F
    ld   hl, Data_017_49B7                        ;; 17:499C $21 $B7 $49
    add  hl, de                                   ;; 17:499F $19
    ld   a, [hl]                                  ;; 17:49A0 $7E
    push af                                       ;; 17:49A1 $F5
    ld   hl, hBaseScrollX                         ;; 17:49A2 $21 $96 $FF
    add  [hl]                                     ;; 17:49A5 $86
    ldh  [rSCX], a                                ;; 17:49A6 $E0 $43
    pop  af                                       ;; 17:49A8 $F1
    sra  a                                        ;; 17:49A9 $CB $2F
    ld   hl, hMultiPurposeG                       ;; 17:49AB $21 $E8 $FF
    add  [hl]                                     ;; 17:49AE $86
    ldh  [rSCY], a                                ;; 17:49AF $E0 $42
    jr   jr_017_4964                              ;; 17:49B1 $18 $B1

.jr_49B3
    xor  a                                        ;; 17:49B3 $AF
    ldh  [rSCX], a                                ;; 17:49B4 $E0 $43
    ret                                           ;; 17:49B6 $C9

Data_017_49B7::
    db   $00, $05, $09, $0C, $0D, $0E, $0E, $0F, $0F, $0F, $0E, $0E, $0D, $0C, $09, $05
    db   $00, $FB, $F7, $F4, $F3, $F2, $F2, $F1, $F1, $F1, $F2, $F2, $F3, $F4, $F7, $FB
    db   $00, $04, $07, $09, $0B, $0C, $0C, $0D, $0D, $0D, $0C, $0C, $0B, $09, $07, $04
    db   $00, $FC, $F9, $F7, $F5, $F4, $F4, $F3, $F3, $F3, $F4, $F4, $F5, $F7, $F9, $FC
    db   $00, $03, $05, $07, $08, $09, $0A, $0B, $0B, $0B, $0A, $09, $08, $07, $05, $03
    db   $00, $FD, $FB, $F9, $F8, $F7, $F6, $F5, $F5, $F5, $F6, $F7, $F8, $F9, $FB, $FD
    db   $00, $03, $05, $06, $07, $08, $08, $09, $09, $09, $08, $08, $07, $06, $05, $03
    db   $00, $FD, $FB, $FA, $F9, $F8, $F8, $F7, $F7, $F7, $F8, $F8, $F9, $FA, $FB, $FD
    db   $00, $02, $04, $05, $05, $06, $06, $07, $07, $07, $06, $06, $05, $05, $04, $02
    db   $00, $FE, $FC, $FB, $FB, $FA, $FA, $F9, $F9, $F9, $FA, $FA, $FB, $FB, $FC, $FE
    db   $00, $01, $02, $03, $03, $04, $04, $05, $05, $05, $04, $04, $03, $03, $02, $01
    db   $00, $FF, $FE, $FD, $FD, $FC, $FC, $FB, $FB, $FB, $FC, $FC, $FD, $FD, $FE, $FF
    db   $00, $01, $01, $01, $02, $02, $02, $03, $03, $03, $02, $02, $02, $01, $01, $01
    db   $00, $FF, $FF, $FF, $FE, $FE, $FE, $FD, $FD, $FD, $FE, $FE, $FE, $FF, $FF, $FF
    db   $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00, $00
    db   $00, $00, $00, $00, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $FF, $00, $00, $00

EndCreditsEntryPoint::
    ;
    ; End Credits Debug Tools
    ;

    ; If pressing UP or DOWN…
    ldh  a, [hJoypadState]                        ;; 17:4AB7 $F0 $CC
    and  J_UP | J_DOWN                            ;; 17:4AB9 $E6 $0C
    jr   z, .debugResetEnd                        ;; 17:4ABB $28 $0A
    ; … and ROM_DebugTool2 is enabled…
    ld   a, [ROM_DebugTool2]                      ;; 17:4ABD $FA $04 $00
    and  a                                        ;; 17:4AC0 $A7
    jr   z, .debugResetEnd                        ;; 17:4AC1 $28 $04
    ; … reset the ending sequence to the start.
    xor  a                                        ;; 17:4AC3 $AF
    ld   [wGameplaySubtype], a                    ;; 17:4AC4 $EA $96 $DB
.debugResetEnd

    ; If pressing LEFT or RIGHT…
    ldh  a, [hJoypadState]                        ;; 17:4AC7 $F0 $CC
    and  J_RIGHT | J_LEFT                         ;; 17:4AC9 $E6 $03
    jr   z, .debugSkipEnd                         ;; 17:4ACB $28 $09
    ; … and ROM_DebugTool2 is enabled…
    ld   a, [ROM_DebugTool2]                      ;; 17:4ACD $FA $04 $00
    and  a                                        ;; 17:4AD0 $A7
    jr   z, .debugSkipEnd                         ;; 17:4AD1 $28 $03
    call TransitionToNextEndingScene              ;; 17:4AD3 $CD $DE $64
.debugSkipEnd

    ;
    ; Update ending global timers
    ;

    ; Decrement wD006
    ld   a, [wD006]                               ;; 17:4AD6 $FA $06 $D0
    and  a                                        ;; 17:4AD9 $A7
    jr   z, .decrementwD006End                    ;; 17:4ADA $28 $04
    dec  a                                        ;; 17:4ADC $3D
    ld   [wD006], a                               ;; 17:4ADD $EA $06 $D0
.decrementwD006End

    ; Decrement wD007
    ld   a, [wD007]                               ;; 17:4AE0 $FA $07 $D0
    and  a                                        ;; 17:4AE3 $A7
    jr   z, .decrementwD007End                    ;; 17:4AE4 $28 $04
    dec  a                                        ;; 17:4AE6 $3D
    ld   [wD007], a                               ;; 17:4AE7 $EA $07 $D0
.decrementwD007End

    ; Decrement wD008
    ld   a, [wD008]                               ;; 17:4AEA $FA $08 $D0
    and  a                                        ;; 17:4AED $A7
    jr   z, .decrementwD008End                    ;; 17:4AEE $28 $04
    dec  a                                        ;; 17:4AF0 $3D
    ld   [wD008], a                               ;; 17:4AF1 $EA $08 $D0
.decrementwD008End

    ; Decrement wD009 every 4 frames
    ldh  a, [hFrameCounter]                       ;; 17:4AF4 $F0 $E7
    and  $03                                      ;; 17:4AF6 $E6 $03
    jr   nz, .decrementwD009End                   ;; 17:4AF8 $20 $0A
    ld   a, [wD009]                               ;; 17:4AFA $FA $09 $D0
    and  a                                        ;; 17:4AFD $A7
    jr   z, .decrementwD009End                    ;; 17:4AFE $28 $04
    dec  a                                        ;; 17:4B00 $3D
    ld   [wD009], a                               ;; 17:4B01 $EA $09 $D0
.decrementwD009End

    ; Decrement wD013 every 16 frames
    ldh  a, [hFrameCounter]                       ;; 17:4B04 $F0 $E7
    and  $0F                                      ;; 17:4B06 $E6 $0F
    jr   nz, .decrementwD013End                   ;; 17:4B08 $20 $0A
    ld   a, [wD013]                               ;; 17:4B0A $FA $13 $D0
    and  a                                        ;; 17:4B0D $A7
    jr   z, .decrementwD013End                    ;; 17:4B0E $28 $04
    dec  a                                        ;; 17:4B10 $3D
    ld   [wD013], a                               ;; 17:4B11 $EA $13 $D0
.decrementwD013End

    ld   a, [wD01E]                               ;; 17:4B14 $FA $1E $D0
    and  a                                        ;; 17:4B17 $A7
    jr   z, .jr_4B22                              ;; 17:4B18 $28 $08

    dec  a                                        ;; 17:4B1A $3D
    ld   [wD01E], a                               ;; 17:4B1B $EA $1E $D0
    ld   hl, wD008                                ;; 17:4B1E $21 $08 $D0
    inc  [hl]                                     ;; 17:4B21 $34
.jr_4B22

    ; Main ending sequence jump table
    ld   a, [wGameplaySubtype]                    ;; 17:4B22 $FA $96 $DB
    JP_TABLE                                      ;; 17:4B25 $C7
._00 dw CreditsInitHandler
._01 dw CreditsFadeoutHandler
._02 dw CreditsWindFishHandler
._03 dw CreditsSunAboveHandler
._04 dw CreditsLinkOnSeaLargeHandler
._05 dw CreditsLinkOnSeaCloseHandler
._06 dw CreditsLinkSeatedOnLogHandler
._07 dw CreditsLinkFaceCloseUpHandler
._08 dw CreditsRollHandler
._09 dw CreditsTheEndHandler

Data_017_4B3A::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
    db   $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01
    db   $01, $01, $00, $01, $01, $01, $01, $01, $01, $00, $01, $00, $00, $00, $00, $00
    db   $01, $01, $00, $01, $01, $01, $01, $01, $01, $00, $01, $00, $00, $00, $00, $00
    db   $01, $01, $00, $01, $01, $01, $01, $01, $01, $00, $01, $00, $00, $00, $00, $00
    db   $01, $01, $00, $00, $00, $00, $00, $00, $00, $00, $01, $00, $00, $00, $00, $00

macro CREDITS_FADE
IF !__PATCH_0__
    db \1, \1, \1, \1
    db \2, \2, \2, \2
    db \3, \3, \3, \3
    db \4, \4, \4, \4
ELSE
    db \1, \1
    db \2, \2
    db \3, \3
    REPT 10
        db \4
    ENDR
ENDC
endm

Data_017_4BBA::
    CREDITS_FADE $E4, $94, $40, $00

IF __PATCH_0__
    db   $00
ENDC

Data_017_4BCA::
    CREDITS_FADE $1C, $18, $04, $00

CreditsInitHandler::
    call ResetCreditsSceneVariables               ;; 17:4BDA $CD $A5 $4D
    jp   IncrementCreditsGameplaySubtype          ;; 17:4BDD $C3 $5B $4C

CreditsFadeoutHandler::
    call AnimateEntitiesAndRestoreBank17          ;; 17:4BE0 $CD $ED $0E
    ldh  a, [hFrameCounter]                       ;; 17:4BE3 $F0 $E7
    and  $03                                      ;; 17:4BE5 $E6 $03
    jr   nz, jr_017_4C03                          ;; 17:4BE7 $20 $1A

    ld   a, [wIntroTimer]                         ;; 17:4BE9 $FA $01 $D0
    inc  a                                        ;; 17:4BEC $3C
    ld   [wIntroTimer], a                         ;; 17:4BED $EA $01 $D0
    cp   $0D                                      ;; 17:4BF0 $FE $0D
    jr   nz, .jr_4BF7                             ;; 17:4BF2 $20 $03

    jp   label_017_4C22                           ;; 17:4BF4 $C3 $22 $4C

.jr_4BF7
    ldh  a, [hIsGBC]                              ;; 17:4BF7 $F0 $FE
    and  a                                        ;; 17:4BF9 $A7
    jr   z, jr_017_4C03                           ;; 17:4BFA $28 $07

    ld   a, [wIntroTimer]                         ;; 17:4BFC $FA $01 $D0
    dec  a                                        ;; 17:4BFF $3D
    jp   func_017_7F30                            ;; 17:4C00 $C3 $30 $7F

jr_017_4C03:
    ld   a, [wIntroTimer]                         ;; 17:4C03 $FA $01 $D0
    ld   e, a                                     ;; 17:4C06 $5F
    CREDITS_MACRO
    ld   d, b                                     ;; 17:4C0D $50
    ld   hl, Data_017_4BBA                        ;; 17:4C0E $21 $BA $4B
    add  hl, de                                   ;; 17:4C11 $19
    ld   a, [hl]                                  ;; 17:4C12 $7E
    ld   [wBGPalette], a                          ;; 17:4C13 $EA $97 $DB
    ld   [wOBJ1Palette], a                        ;; 17:4C16 $EA $99 $DB
    ld   hl, Data_017_4BCA                        ;; 17:4C19 $21 $CA $4B
    add  hl, de                                   ;; 17:4C1C $19
    ld   a, [hl]                                  ;; 17:4C1D $7E
    ld   [wOBJ0Palette], a                        ;; 17:4C1E $EA $98 $DB
    ret                                           ;; 17:4C21 $C9

label_017_4C22:
    call ClearLowerAndMiddleWRAM                  ;; 17:4C22 $CD $C1 $29
    ld   hl, wRoomObjectsArea                     ;; 17:4C25 $21 $00 $D7
    ld   de, Data_017_4B3A                        ;; 17:4C28 $11 $3A $4B
    ld   c, $80                                   ;; 17:4C2B $0E $80
    ld   a, $01                                   ;; 17:4C2D $3E $01

.loop_4C2F
    ld   a, [de]                                  ;; 17:4C2F $1A
    inc  de                                       ;; 17:4C30 $13
    ld   [hl+], a                                 ;; 17:4C31 $22
    dec  c                                        ;; 17:4C32 $0D
    jr   nz, .loop_4C2F                           ;; 17:4C33 $20 $FA

    call label_27F2                               ;; 17:4C35 $CD $F2 $27
    ld   a, IEF_VBLANK                            ;; 17:4C38 $3E $01
    ldh  [rIE], a                                 ;; 17:4C3A $E0 $FF
    ld   a, $00                                   ;; 17:4C3C $3E $00
    ldh  [rLYC], a                                ;; 17:4C3E $E0 $45
    ld   hl, wLCDControl                          ;; 17:4C40 $21 $FD $D6
    res  LCDCB_BG9C00, [hl]                       ;; 17:4C43 $CB $9E
    call ResetCreditsSceneVariables               ;; 17:4C45 $CD $A5 $4D
    call IncrementCreditsGameplaySubtype          ;; 17:4C48 $CD $5B $4C
    ld   a, MUSIC_WIND_FISH                       ;; 17:4C4B $3E $59
    ld   [wMusicTrackToPlay], a                   ;; 17:4C4D $EA $68 $D3
    ld   a, $40                                   ;; 17:4C50 $3E $40
    ld   [wD006], a                               ;; 17:4C52 $EA $06 $D0
    ld   a, $04                                   ;; 17:4C55 $3E $04
    ld   [wTransitionSequenceCounter], a          ;; 17:4C57 $EA $6B $C1
    ret                                           ;; 17:4C5A $C9

IncrementCreditsGameplaySubtype::
IncrementCreditsGameplaySubtypeAndReturn::
    ld   hl, wGameplaySubtype                     ;; 17:4C5B $21 $96 $DB
    inc  [hl]                                     ;; 17:4C5E $34
    ret                                           ;; 17:4C5F $C9

; Owl speech, Wind Fish speech, song of awakening sequence
CreditsWindFishHandler::
    ld   a, BOW_WOW_KIDNAPPED                     ;; 17:4C60 $3E $80
    ld   [wIsBowWowFollowingLink], a              ;; 17:4C62 $EA $56 $DB
    xor  a                                        ;; 17:4C65 $AF
    ld   [wIsIndoor], a                           ;; 17:4C66 $EA $A5 $DB
    ldh  [hRoomStatus], a                         ;; 17:4C69 $E0 $F8
    ld   a, $01                                   ;; 17:4C6B $3E $01
    ld   [wIsMarinSinging], a                     ;; 17:4C6D $EA $C8 $C3
    ld   a, ROOM_OW_MABE_VILLAGE_SQUARE           ;; 17:4C70 $3E $92
    ldh  [hMapRoom], a                            ;; 17:4C72 $E0 $F6
    ld   a, $FF                                   ;; 17:4C74 $3E $FF
    ld   [wInvincibilityCounter], a               ;; 17:4C76 $EA $C7 $DB
    call AnimateEntitiesAndRestoreBank17          ;; 17:4C79 $CD $ED $0E
    ld   a, [wCreditsSubscene]                    ;; 17:4C7C $FA $0E $D0
    JP_TABLE                                      ;; 17:4C7F $C7
._00 dw CreditsStairsPrepare1Handler              ;; 17:4C80
._01 dw CreditsStairsPrepare2Handler              ;; 17:4C82
._02 dw CreditsStairsFadeInHandler                ;; 17:4C84
._03 dw CreditsStairsClimbingHandler              ;; 17:4C86
._04 dw CreditsStairsReachingPlatformHandler      ;; 17:4C88
._05 dw CreditsStairsOwlSpeechHandler             ;; 17:4C8A
._06 dw CreditsWindFishPrepare1Handler            ;; 17:4C8C
._07 dw CreditsWindFishPrepare2Handler            ;; 17:4C8E
._08 dw CreditsWindFishPrepare3Handler            ;; 17:4C90
._09 dw CreditsWindFishApparitionHandler          ;; 17:4C92
._0A dw CreditsWindFishFloatingHandler            ;; 17:4C94
._0B dw CreditsWindFishSpeechHandler              ;; 17:4C96
._0C dw CreditsWindFishPrepareDisapparitionHandler ;; 17:4C98
._0D dw CreditsWindFishDisapparitionHandler       ;; 17:4C9A
._0E dw CreditsWindFishDisappearedHandler         ;; 17:4C9C
._0F dw CreditsPlayInstrumentsDialogHandler       ;; 17:4C9E
._10 dw CreditsLinkTurnsToPlayHandler             ;; 17:4CA0
._11 dw CreditsLinkPreparesToPlayHandler          ;; 17:4CA2
._12 dw CreditsLinkShowsInstrumentsHandler        ;; 17:4CA4
._13 dw CreditsInstrumentsPlayingHandler          ;; 17:4CA6
._14 dw CreditsWaterAppearingHandler              ;; 17:4CA8
._15 dw CreditsWaterSplashingHandler              ;; 17:4CAA
._16 dw CreditsWaterMovingUpHandler               ;; 17:4CAC
._17 dw CreditsWaterFadeToWhiteHandler            ;; 17:4CAE
._18 dw CreditsWaterNoiseFadingOutHandler         ;; 17:4CB0

CreditsStairsPrepare1Handler::
    ; Hide the Window
    ld   a, $FF                                   ;; 17:4CB2 $3E $FF
    ld   [wWindowY], a                            ;; 17:4CB4 $EA $9A $DB

    ; Prepare the loading of tilemap and palette
    ld   a, TILESET_CREDITS_STAIRS                ;; 17:4CB7 $3E $1F
    ld   [wTilesetToLoad], a                      ;; 17:4CB9 $EA $FE $D6
    ld   a, $01                                   ;; 17:4CBC $3E $01
    ld   [wPaletteUnknownE], a                    ;; 17:4CBE $EA $D5 $DD

    ; Clear scroll variables
    xor  a                                        ;; 17:4CC1 $AF
    ldh  [hBaseScrollX], a                        ;; 17:4CC2 $E0 $96
    ld   [wScreenShakeHorizontal], a              ;; 17:4CC4 $EA $55 $C1
    ld   [wScreenShakeVertical], a                ;; 17:4CC7 $EA $56 $C1
    ldh  [hBaseScrollY], a                        ;; 17:4CCA $E0 $97

    ; Clear $0C bytes starting from wRoomTransitionState
    ld   hl, wRoomTransitionState                 ;; 17:4CCC $21 $24 $C1
    ld   e, $00                                   ;; 17:4CCF $1E $00
.loop
    xor  a                                        ;; 17:4CD1 $AF
    ld   [hl+], a                                 ;; 17:4CD2 $22
    inc  e                                        ;; 17:4CD3 $1C
    ld   a, e                                     ;; 17:4CD4 $7B
    cp   $0C                                      ;; 17:4CD5 $FE $0C
    jr   nz, .loop                                ;; 17:4CD7 $20 $F8

IncrementCreditsSubscene::
IncrementCreditsSubsceneAndReturn::
    ld   hl, wCreditsSubscene                     ;; 17:4CD9 $21 $0E $D0
    inc  [hl]                                     ;; 17:4CDC $34
    ret                                           ;; 17:4CDD $C9

CreditsStairsPrepare2Handler::
    ; Prepare loading of background map
    ld   a, TILEMAP_CREDITS_STAIRS                ;; 17:4CDE $3E $16
    ld   [wBGMapToLoad], a                        ;; 17:4CE0 $EA $FF $D6

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:4CE3 $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:4CE5 $CD $86 $3B

    ;
    ; Set Link initial position
    ;

    ld   hl, wEntitiesPosXTable                   ;; 17:4CE8 $21 $00 $C2
    add  hl, de                                   ;; 17:4CEB $19
    ld   [hl], $40                                ;; 17:4CEC $36 $40

    ld   hl, wEntitiesPosYTable                   ;; 17:4CEE $21 $10 $C2
    add  hl, de                                   ;; 17:4CF1 $19
    ld   [hl], $E0                                ;; 17:4CF2 $36 $E0

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:4CF4 $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:4CF6 $CD $86 $3B

    ld   hl, wEntitiesPrivateState1Table          ;; 17:4CF9 $21 $B0 $C2
    add  hl, de                                   ;; 17:4CFC $19
    inc  [hl]                                     ;; 17:4CFD $34
    ld   a, $50                                   ;; 17:4CFE $3E $50
    ldh  [hLinkPositionX], a                      ;; 17:4D00 $E0 $98
    ld   a, $98                                   ;; 17:4D02 $3E $98
    ldh  [hLinkPositionY], a                      ;; 17:4D04 $E0 $99
    jp   IncrementCreditsSubscene                 ;; 17:4D06 $C3 $D9 $4C

Data_017_4D09::
IF !__PATCH_0__
    CREDITS_FADE $00, $01, $16, $27
ELSE
    db $00, $00, $01, $01, $16, $16, $27, $27, $27, $27, $27, $27, $27, $27
ENDC

Data_017_4D19::
    CREDITS_FADE $00, $04, $18, $1C

Data_017_4D29::
    CREDITS_FADE $00, $00, $50, $90

CreditsStairsFadeInHandler::
    ld   a, [wD006]                               ;; 17:4D39 $FA $06 $D0
    ld   e, a                                     ;; 17:4D3C $5F

    ldh  a, [hFrameCounter]                       ;; 17:4D3D $F0 $E7
    and  $07                                      ;; 17:4D3F $E6 $07
    or   e                                        ;; 17:4D41 $B3
    jr   nz, .fadeInDMGPalettes                   ;; 17:4D42 $20 $1A

    ld   a, [wIntroTimer]                         ;; 17:4D44 $FA $01 $D0
    inc  a                                        ;; 17:4D47 $3C
    ld   [wIntroTimer], a                         ;; 17:4D48 $EA $01 $D0
    cp   $0C                                      ;; 17:4D4B $FE $0C
    jr   nz, .jr_017_4D52                         ;; 17:4D4D $20 $03

    call IncrementCreditsSubscene                 ;; 17:4D4F $CD $D9 $4C

.jr_017_4D52
    ldh  a, [hIsGBC]                              ;; 17:4D52 $F0 $FE
    and  a                                        ;; 17:4D54 $A7
    jr   z, .fadeInDMGPalettes                    ;; 17:4D55 $28 $07

    ld   a, [wIntroTimer]                         ;; 17:4D57 $FA $01 $D0
    dec  a                                        ;; 17:4D5A $3D
    jp   CreditsBlendPalettes                     ;; 17:4D5B $C3 $80 $7E

.fadeInDMGPalettes
    ; Assign the DMG grayscale palettes
    ld   a, [wIntroTimer]                         ;; 17:4D5E $FA $01 $D0
    ld   e, a                                     ;; 17:4D61 $5F
    CREDITS_MACRO
    ld   d, b                                     ;; 17:4D68 $50
    ld   hl, Data_017_4D09                        ;; 17:4D69 $21 $09 $4D
    add  hl, de                                   ;; 17:4D6C $19
    ld   a, [hl]                                  ;; 17:4D6D $7E
    ld   [wBGPalette], a                          ;; 17:4D6E $EA $97 $DB
    ld   hl, Data_017_4D19                        ;; 17:4D71 $21 $19 $4D
    add  hl, de                                   ;; 17:4D74 $19
    ld   a, [hl]                                  ;; 17:4D75 $7E
    ld   [wOBJ0Palette], a                        ;; 17:4D76 $EA $98 $DB
    ld   hl, Data_017_4D29                        ;; 17:4D79 $21 $29 $4D
    add  hl, de                                   ;; 17:4D7C $19
    ld   a, [hl]                                  ;; 17:4D7D $7E
    ld   [wOBJ1Palette], a                        ;; 17:4D7E $EA $99 $DB

CreditsStairsClimbingHandler::
    ld   a, [wD003]                               ;; 17:4D81 $FA $03 $D0
    add  $18                                      ;; 17:4D84 $C6 $18
    ld   [wD003], a                               ;; 17:4D86 $EA $03 $D0
    jr   nc, .jr_4D8F                             ;; 17:4D89 $30 $04

    ld   hl, wEntitiesPosYTable+14                ;; 17:4D8B $21 $1E $C2
    inc  [hl]                                     ;; 17:4D8E $34

.jr_4D8F
    ld   a, [wIntroSubTimer]                      ;; 17:4D8F $FA $02 $D0
    add  $40                                      ;; 17:4D92 $C6 $40
    ld   [wIntroSubTimer], a                      ;; 17:4D94 $EA $02 $D0
    jr   nc, ret_017_4DD0                         ;; 17:4D97 $30 $37

    ldh  a, [hBaseScrollY]                        ;; 17:4D99 $F0 $97
    dec  a                                        ;; 17:4D9B $3D
    ldh  [hBaseScrollY], a                        ;; 17:4D9C $E0 $97
    cp   $90                                      ;; 17:4D9E $FE $90
    jr   nz, ret_017_4DD0                         ;; 17:4DA0 $20 $2E

    call IncrementCreditsSubscene                 ;; 17:4DA2 $CD $D9 $4C

ResetCreditsSceneVariables::
    xor  a                                        ;; 17:4DA5 $AF
    ld   [wCreditsScratch0], a                    ;; 17:4DA6 $EA $00 $D0
    ld   [wIntroTimer], a                         ;; 17:4DA9 $EA $01 $D0
    ld   [wIntroSubTimer], a                      ;; 17:4DAC $EA $02 $D0
    ld   [wD003], a                               ;; 17:4DAF $EA $03 $D0
    ld   [wD004], a                               ;; 17:4DB2 $EA $04 $D0
    ld   [wD005], a                               ;; 17:4DB5 $EA $05 $D0
    ld   [wD00A], a                               ;; 17:4DB8 $EA $0A $D0
    ld   [wD00B], a                               ;; 17:4DBB $EA $0B $D0
    ld   [wD00C], a                               ;; 17:4DBE $EA $0C $D0
    ld   [wD00D], a                               ;; 17:4DC1 $EA $0D $D0
    ld   [wD006], a                               ;; 17:4DC4 $EA $06 $D0
    ld   [wD007], a                               ;; 17:4DC7 $EA $07 $D0
    ld   [wD008], a                               ;; 17:4DCA $EA $08 $D0
    ld   [wD009], a                               ;; 17:4DCD $EA $09 $D0

ret_017_4DD0:
    ret                                           ;; 17:4DD0 $C9

Data_017_4DD1::
    db   $98, $00, $53, $A0, $98, $20, $53, $A0, $98, $40, $53, $A0, $98, $60, $53, $A0
    db   $98, $80, $53, $A0, $98, $A0, $53, $A0, $98, $C0, $53, $A0, $98, $E0, $53, $A0
    db   $99, $00, $53, $A0, $99, $20, $53, $A0, $99, $40, $53, $A0, $99, $60, $53, $A0
    db   $99, $80, $53, $A0, $99, $A0, $53, $A0, $99, $C0, $53, $A0, $99, $E0, $53, $A0
    db   $9A, $00, $53, $A0, $9A, $20, $53, $A0

CreditsStairsReachingPlatformHandler::
    ld   a, [wCreditsScratch0]                    ;; 17:4E19 $FA $00 $D0
    cp   $09                                      ;; 17:4E1C $FE $09
    jr   nz, .jr_4E27                             ;; 17:4E1E $20 $07

    ld   a, $F0                                   ;; 17:4E20 $3E $F0
    ldh  [hBaseScrollY], a                        ;; 17:4E22 $E0 $97
    jp   IncrementCreditsSubscene                 ;; 17:4E24 $C3 $D9 $4C

.jr_4E27
    ld   e, a                                     ;; 17:4E27 $5F
    inc  a                                        ;; 17:4E28 $3C
    ld   [wCreditsScratch0], a                    ;; 17:4E29 $EA $00 $D0
    sla  e                                        ;; 17:4E2C $CB $23
    sla  e                                        ;; 17:4E2E $CB $23
    sla  e                                        ;; 17:4E30 $CB $23
    ld   d, $00                                   ;; 17:4E32 $16 $00
    ld   hl, Data_017_4DD1                        ;; 17:4E34 $21 $D1 $4D
    add  hl, de                                   ;; 17:4E37 $19
    ld   de, wDrawCommand                         ;; 17:4E38 $11 $01 $D6
    ld   c, $08                                   ;; 17:4E3B $0E $08

.loop_4E3D
    ld   a, [hl+]                                 ;; 17:4E3D $2A
    ld   [de], a                                  ;; 17:4E3E $12
    inc  de                                       ;; 17:4E3F $13
    dec  c                                        ;; 17:4E40 $0D
    jr   nz, .loop_4E3D                           ;; 17:4E41 $20 $FA

    xor  a                                        ;; 17:4E43 $AF
    ld   [de], a                                  ;; 17:4E44 $12
    ret                                           ;; 17:4E45 $C9

CreditsStairsOwlSpeechHandler::
    ldh  a, [hIsGBC]                              ;; 17:4E46 $F0 $FE
    and  a                                        ;; 17:4E48 $A7
    ret  z                                        ;; 17:4E49 $C8

    ld   a, [wD014]                               ;; 17:4E4A $FA $14 $D0
    cp   $0E                                      ;; 17:4E4D $FE $0E
    ret  z                                        ;; 17:4E4F $C8

    ld   bc, wDrawCommand                         ;; 17:4E50 $01 $01 $D6
    ld   de, wDrawCommandVRAM1                    ;; 17:4E53 $11 $91 $DC
    ld   hl, $9880                                ;; 17:4E56 $21 $80 $98
    swap a                                        ;; 17:4E59 $CB $37
    sla  a                                        ;; 17:4E5B $CB $27
    push af                                       ;; 17:4E5D $F5
    ld   a, h                                     ;; 17:4E5E $7C
    adc  $00                                      ;; 17:4E5F $CE $00
    ld   h, a                                     ;; 17:4E61 $67
    pop  af                                       ;; 17:4E62 $F1
    add  l                                        ;; 17:4E63 $85
    ld   l, a                                     ;; 17:4E64 $6F
    ld   a, h                                     ;; 17:4E65 $7C
    adc  $00                                      ;; 17:4E66 $CE $00
    ld   [bc], a                                  ;; 17:4E68 $02
    ld   [de], a                                  ;; 17:4E69 $12
    inc  bc                                       ;; 17:4E6A $03

.jr_4E6B
    inc  de                                       ;; 17:4E6B $13
    ld   a, l                                     ;; 17:4E6C $7D
    ld   [bc], a                                  ;; 17:4E6D $02
    ld   [de], a                                  ;; 17:4E6E $12
    inc  bc                                       ;; 17:4E6F $03
    inc  de                                       ;; 17:4E70 $13
    ld   a, $53                                   ;; 17:4E71 $3E $53
    ld   [bc], a                                  ;; 17:4E73 $02
    ld   [de], a                                  ;; 17:4E74 $12
    inc  bc                                       ;; 17:4E75 $03
    inc  de                                       ;; 17:4E76 $13
    ld   a, $A0                                   ;; 17:4E77 $3E $A0
    ld   [bc], a                                  ;; 17:4E79 $02
    xor  a                                        ;; 17:4E7A $AF
    ld   [de], a                                  ;; 17:4E7B $12
    inc  bc                                       ;; 17:4E7C $03
    inc  de                                       ;; 17:4E7D $13
    ld   [bc], a                                  ;; 17:4E7E $02
    ld   [de], a                                  ;; 17:4E7F $12
    ld   hl, wD014                                ;; 17:4E80 $21 $14 $D0
    inc  [hl]                                     ;; 17:4E83 $34
    ret                                           ;; 17:4E84 $C9

CreditsWindFishPrepare1Handler::
    call ResetCreditsSceneVariables               ;; 17:4E85 $CD $A5 $4D
    ld   a, $08                                   ;; 17:4E88 $3E $08
    ld   [wD006], a                               ;; 17:4E8A $EA $06 $D0
    call func_017_4E93                            ;; 17:4E8D $CD $93 $4E
    jp   IncrementCreditsSubscene                 ;; 17:4E90 $C3 $D9 $4C

func_017_4E93::
    ldh  a, [hIsGBC]                              ;; 17:4E93 $F0 $FE
    and  a                                        ;; 17:4E95 $A7
    ret  z                                        ;; 17:4E96 $C8

    ld   hl, wBGPal1                              ;; 17:4E97 $21 $10 $DC
    ld   b, $40                                   ;; 17:4E9A $06 $40
    xor  a                                        ;; 17:4E9C $AF

.loop
    ld   [hl+], a                                 ;; 17:4E9D $22
    dec  b                                        ;; 17:4E9E $05
    jr   nz, .loop                                ;; 17:4E9F $20 $FC

    ld   hl, wBGPal2 + 3*2                        ;; 17:4EA1 $21 $1E $DC
    dec  a                                        ;; 17:4EA4 $3D
    ld   [hl+], a                                 ;; 17:4EA5 $22
    ld   a, $47                                   ;; 17:4EA6 $3E $47
    ld   [hl], a                                  ;; 17:4EA8 $77
    xor  a                                        ;; 17:4EA9 $AF
    ld   [wPalettePartialCopyColorIndexStart], a  ;; 17:4EAA $EA $D3 $DD
    ld   a, $20                                   ;; 17:4EAD $3E $20
    ld   [wPalettePartialCopyColorCount], a       ;; 17:4EAF $EA $D4 $DD
    ld   a, $81                                   ;; 17:4EB2 $3E $81
    ld   [wPaletteDataFlags], a                   ;; 17:4EB4 $EA $D1 $DD
    ret                                           ;; 17:4EB7 $C9

Data_017_4EB8::
    db   $27, $27, $EB, $FF, $FF, $FF

CreditsWindFishPrepare2Handler::
    CREDITS_MACRO_LDH_AND_LD $01
    ld   a, [wD00A]                               ;; 17:4EC3 $FA $0A $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:4EC7 $5F
    ld   d, $00                                   ;; 17:4EC8 $16 $00
    ld   hl, Data_017_4EB8                        ;; 17:4ECA $21 $B8 $4E
    add  hl, de                                   ;; 17:4ECD $19
    ld   a, [hl]                                  ;; 17:4ECE $7E
    ld   [wBGPalette], a                          ;; 17:4ECF $EA $97 $DB
    ld   a, [wD006]                               ;; 17:4ED2 $FA $06 $D0
    and  a                                        ;; 17:4ED5 $A7
    jr   nz, .ret_4EEE                            ;; 17:4ED6 $20 $16

    ld   a, $08                                   ;; 17:4ED8 $3E $08
    ld   [wD006], a                               ;; 17:4EDA $EA $06 $D0
    ld   a, [wD00A]                               ;; 17:4EDD $FA $0A $D0
    inc  a                                        ;; 17:4EE0 $3C
    ld   [wD00A], a                               ;; 17:4EE1 $EA $0A $D0
    cp   $05                                      ;; 17:4EE4 $FE $05
    jr   nz, .ret_4EEE                            ;; 17:4EE6 $20 $06

    call ResetCreditsSceneVariables               ;; 17:4EE8 $CD $A5 $4D
    jp   IncrementCreditsSubscene                 ;; 17:4EEB $C3 $D9 $4C

.ret_4EEE
    ret                                           ;; 17:4EEE $C9

Data_017_4EEF::
    db   $9B, $C0, $13, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $72, $73, $74
    db   $A0, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9B, $E0, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $A0, $A0, $A0, $A0, $7B, $7C, $7D, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $98, $00, $13, $A0, $A0, $A0, $A0, $A0, $A0, $A0, $05, $06, $07, $08, $09, $0A
    db   $0B, $0C, $0D, $0E, $A0, $A0, $A0, $00, $98, $20, $13, $A0, $A0, $A0, $A0, $A0
    db   $13, $14, $15, $16, $17, $18, $19, $1A, $1B, $1C, $1D, $1E, $1F, $A0, $A0, $00
    db   $98, $40, $13, $A0, $A0, $A0, $A0, $22, $23, $24, $25, $26, $27, $28, $29, $2A
    db   $2B, $2C, $2D, $2E, $2F, $A0, $A0, $00, $98, $60, $13, $A0, $A0, $A0, $31, $32
    db   $33, $34, $35, $36, $37, $38, $39, $3A, $3B, $3C, $3D, $3E, $3F, $A0, $A0, $00
    db   $98, $80, $13, $A0, $A0, $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4A
    db   $4B, $4C, $4D, $4E, $4F, $A0, $A0, $00, $98, $A0, $13, $A0, $A0, $50, $51, $52
    db   $53, $54, $55, $56, $57, $58, $59, $A0, $5B, $5C, $5D, $5E, $5F, $A0, $A0, $00
    db   $98, $C0, $13, $A0, $A0, $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $6A
    db   $A0, $6C, $6D, $6E, $6F, $A0, $A0, $00, $98, $E0, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $A0, $75, $76, $77, $78, $79, $7A, $A0, $A0, $A0, $7E, $AF, $A0, $A0, $00

Data_017_4FDF::
    db   $9B, $C0, $13, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $03, $03, $03
    db   $00, $00, $00, $00, $00, $00, $00, $00, $9B, $E0, $13, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $03, $03, $03, $00, $00, $00, $00, $00, $00, $00, $00
    db   $98, $00, $13, $00, $00, $00, $00, $00, $00, $00, $01, $01, $04, $05, $05, $05
    db   $05, $05, $04, $04, $00, $00, $00, $00, $98, $20, $13, $00, $00, $00, $00, $00
    db   $01, $01, $01, $07, $04, $06, $06, $06, $06, $06, $04, $04, $05, $00, $00
    db   $00, $98, $40, $13, $00, $00, $00, $00, $01, $07, $07, $07, $02, $04, $04, $04
    db   $04, $04, $04, $04, $04, $05, $00, $00, $00, $98, $60, $13, $00, $00, $00, $03
    db   $03, $02, $02, $02, $02, $04, $00, $02, $03, $03, $00, $00, $04, $03, $00, $00
    db   $00, $98, $80, $13, $00, $00, $03, $03, $03, $03, $03, $03, $04, $05, $03, $03
    db   $03, $03, $05, $05, $03, $03, $00, $00, $00, $98, $A0, $13, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $05, $05, $05, $05, $00, $00
    db   $00, $98, $C0, $13, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $05, $05, $05, $05, $00, $00, $00, $98, $E0, $13, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $05, $00, $00
    db   $00

CreditsWindFishPrepare3Handler::
    ld   a, [wCreditsScratch0]                    ;; 17:50CF $FA $00 $D0
    cp   $0A                                      ;; 17:50D2 $FE $0A
    jr   nz, .jr_50F9                             ;; 17:50D4 $20 $23

    ld   a, $F0                                   ;; 17:50D6 $3E $F0
    ldh  [hBaseScrollY], a                        ;; 17:50D8 $E0 $97
    call ResetCreditsSceneVariables               ;; 17:50DA $CD $A5 $4D
    ld   a, IEF_VBLANK                            ;; 17:50DD $3E $01
    ldh  [rIE], a                                 ;; 17:50DF $E0 $FF
    ld   a, $56                                   ;; 17:50E1 $3E $56
    ldh  [rLYC], a                                ;; 17:50E3 $E0 $45
    ld   a, $0C                                   ;; 17:50E5 $3E $0C
    ld   [wD006], a                               ;; 17:50E7 $EA $06 $D0
    ld   a, $FF                                   ;; 17:50EA $3E $FF
    ld   [wTransitionGfx], a                      ;; 17:50EC $EA $7F $C1
    ld   a, $09                                   ;; 17:50EF $3E $09
    ld   [wCreditsSubscene], a                    ;; 17:50F1 $EA $0E $D0
    ld   a, WAVE_SFX_WIND_FISH_MORPH              ;; 17:50F4 $3E $1F
    ldh  [hWaveSfx], a                            ;; 17:50F6 $E0 $F3
    ret                                           ;; 17:50F8 $C9

.jr_50F9
    ld   e, a                                     ;; 17:50F9 $5F
    inc  a                                        ;; 17:50FA $3C
    ld   [wCreditsScratch0], a                    ;; 17:50FB $EA $00 $D0
    sla  e                                        ;; 17:50FE $CB $23
    sla  e                                        ;; 17:5100 $CB $23
    sla  e                                        ;; 17:5102 $CB $23
    ld   a, e                                     ;; 17:5104 $7B
    sla  e                                        ;; 17:5105 $CB $23
    add  e                                        ;; 17:5107 $83
    ld   e, a                                     ;; 17:5108 $5F
    ld   d, $00                                   ;; 17:5109 $16 $00
    ld   hl, Data_017_4EEF                        ;; 17:510B $21 $EF $4E
    add  hl, de                                   ;; 17:510E $19
    push de                                       ;; 17:510F $D5
    ld   de, wDrawCommand                         ;; 17:5110 $11 $01 $D6
    ld   c, $18                                   ;; 17:5113 $0E $18

.loop_5115
    ld   a, [hl+]                                 ;; 17:5115 $2A
    ld   [de], a                                  ;; 17:5116 $12
    inc  de                                       ;; 17:5117 $13
    dec  c                                        ;; 17:5118 $0D
    jr   nz, .loop_5115                           ;; 17:5119 $20 $FA

    pop  de                                       ;; 17:511B $D1
    ldh  a, [hIsGBC]                              ;; 17:511C $F0 $FE
    and  a                                        ;; 17:511E $A7
    ret  z                                        ;; 17:511F $C8

    ld   hl, Data_017_4FDF                        ;; 17:5120 $21 $DF $4F
    add  hl, de                                   ;; 17:5123 $19
    ld   de, wDrawCommandVRAM1                    ;; 17:5124 $11 $91 $DC
    ld   c, $18                                   ;; 17:5127 $0E $18

.loop_5129
    ld   a, [hl+]                                 ;; 17:5129 $2A
    ld   [de], a                                  ;; 17:512A $12
    inc  de                                       ;; 17:512B $13
    dec  c                                        ;; 17:512C $0D
    jr   nz, .loop_5129                           ;; 17:512D $20 $FA

    ret                                           ;; 17:512F $C9

Data_017_5130::
IF __PATCH_0__
    db   $FF, $FF, $FF, $BF, $BF, $BF, $BF, $6B, $6B, $6B, $6B, $27, $27, $27, $27
ELSE
    db   $FF, $FF, $FF, $FF, $BF, $BF, $BF, $BF, $6B, $6B, $6B, $6B, $27, $27, $27, $27
ENDC

CreditsWindFishApparitionHandler::
    CREDITS_MACRO_LDH_AND_LD
    ldh  a, [hIsGBC]                              ;; 17:5145 $F0 $FE
    and  a                                        ;; 17:5147 $A7
    jr   z, .jr_5151                              ;; 17:5148 $28 $07

    ld   a, $01                                   ;; 17:514A $3E $01
    call func_017_53A7                            ;; 17:514C $CD $A7 $53
    jr   jr_017_5160                              ;; 17:514F $18 $0F

.jr_5151
    ld   a, [wD00A]                               ;; 17:5151 $FA $0A $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:5155 $5F
    ld   d, $00                                   ;; 17:5156 $16 $00
    ld   hl, Data_017_5130                        ;; 17:5158 $21 $30 $51
    add  hl, de                                   ;; 17:515B $19
    ld   a, [hl]                                  ;; 17:515C $7E
    ld   [wBGPalette], a                          ;; 17:515D $EA $97 $DB

jr_017_5160:
    ld   a, [wD006]                               ;; 17:5160 $FA $06 $D0
    and  a                                        ;; 17:5163 $A7
    jr   nz, .jr_5176                             ;; 17:5164 $20 $10

    ld   a, [wD00A]                               ;; 17:5166 $FA $0A $D0
    cp   $0C                                      ;; 17:5169 $FE $0C
    jr   z, .jr_5176                              ;; 17:516B $28 $09

    inc  a                                        ;; 17:516D $3C
    ld   [wD00A], a                               ;; 17:516E $EA $0A $D0
    ld   a, $0C                                   ;; 17:5171 $3E $0C
    ld   [wD006], a                               ;; 17:5173 $EA $06 $D0

.jr_5176
    ld   a, [wD00A]                               ;; 17:5176 $FA $0A $D0
    cp   $07                                      ;; 17:5179 $FE $07
    jr   c, .ret_51A6                             ;; 17:517B $38 $29

    ld   a, [wD00B]                               ;; 17:517D $FA $0B $D0
    inc  a                                        ;; 17:5180 $3C
    ld   [wD00B], a                               ;; 17:5181 $EA $0B $D0
    and  $0F                                      ;; 17:5184 $E6 $0F
    jr   nz, .ret_51A6                            ;; 17:5186 $20 $1E

    ld   a, [wD005]                               ;; 17:5188 $FA $05 $D0
    add  $20                                      ;; 17:518B $C6 $20
    ld   [wD005], a                               ;; 17:518D $EA $05 $D0
    jr   nz, .ret_51A6                            ;; 17:5190 $20 $14

    ld   a, $FE                                   ;; 17:5192 $3E $FE
    ld   [wTransitionGfx], a                      ;; 17:5194 $EA $7F $C1
    call ResetCreditsSceneVariables               ;; 17:5197 $CD $A5 $4D
    ld   a, $40                                   ;; 17:519A $3E $40
    ld   [wD006], a                               ;; 17:519C $EA $06 $D0
    ld   a, IEF_STAT | IEF_VBLANK                 ;; 17:519F $3E $03
    ldh  [rIE], a                                 ;; 17:51A1 $E0 $FF
    jp   IncrementCreditsSubscene                 ;; 17:51A3 $C3 $D9 $4C

.ret_51A6
    ret                                           ;; 17:51A6 $C9

; Windfish palette data.
; These are palettes for the whole fade from black to final colors, for all background GBC palettes.
; Full color is first, and darkest is last.
; The palettes gets loaded just before the Windfish is shown.
WindfishPalettes::
.step0
    rgb   #000000, #007880, #383838, #F0F8E0
    rgb   #000000, #F83070, #801838, #F8F888
    rgb   #78B840, #A8A800, #383838, #F0F8E0
    rgb   #000000, #78B840, #383838, #F0F8E0
    rgb   #000000, #A00058, #383838, #F0F8E0
    rgb   #000000, #7800F8, #383838, #F0F8E0
    rgb   #A00058, #7800F8, #383838, #F0F8E0
    rgb   #A8A800, #F83070, #801838, #F0F8E0

.step1
    rgb   #000000, #006870, #303030, #D0D8C0
    rgb   #000000, #D83060, #701830, #F8F888
    rgb   #68A038, #909000, #303030, #D0D8C0
    rgb   #000000, #68A038, #303030, #D0D8C0
    rgb   #000000, #900050, #303030, #D0D8C0
    rgb   #000000, #6800D8, #303030, #D0D8C0
    rgb   #900050, #6800D8, #303030, #D0D8C0
    rgb   #909000, #D83060, #701830, #D0D8C0

.step2
    rgb   #000000, #005860, #282828, #B0B8A0
    rgb   #000000, #B82850, #601828, #F8F888
    rgb   #588830, #787800, #282828, #B0B8A0
    rgb   #000000, #588830, #282828, #B0B8A0
    rgb   #000000, #780040, #282828, #B0B8A0
    rgb   #000000, #5800B8, #282828, #B0B8A0
    rgb   #780040, #5800B8, #282828, #B0B8A0
    rgb   #787800, #B82850, #601828, #B0B8A0

.step3
    rgb   #000000, #004850, #202020, #909080
    rgb   #000000, #902040, #501020, #F8F888
    rgb   #487028, #606000, #202020, #909080
    rgb   #000000, #487028, #202020, #909080
    rgb   #000000, #600038, #202020, #909080
    rgb   #000000, #480090, #202020, #909080
    rgb   #600038, #480090, #202020, #909080
    rgb   #606000, #902040, #501020, #909080

.step4
    rgb   #000000, #003838, #181818, #687060
    rgb   #000000, #701830, #381018, #F8F888
    rgb   #385020, #484800, #181818, #687060
    rgb   #000000, #385020, #181818, #687060
    rgb   #000000, #480028, #181818, #687060
    rgb   #000000, #380070, #181818, #687060
    rgb   #480028, #380070, #181818, #687060
    rgb   #484800, #701830, #381018, #687060

.step5
    rgb   #000000, #002828, #101010, #484840
    rgb   #000000, #481020, #280810, #F8F888
    rgb   #283818, #303000, #101010, #484840
    rgb   #000000, #283818, #101010, #484840
    rgb   #000000, #300020, #101010, #484840
    rgb   #000000, #280048, #101010, #484840
    rgb   #300020, #280048, #101010, #484840
    rgb   #303000, #481020, #280810, #484840

.step6
    rgb   #000000, #001818, #080808, #282820
    rgb   #000000, #280810, #180808, #F8F888
    rgb   #182010, #181800, #080808, #282820
    rgb   #000000, #182010, #080808, #282820
    rgb   #000000, #180010, #080808, #282820
    rgb   #000000, #180028, #080808, #282820
    rgb   #180010, #180028, #080808, #282820
    rgb   #181800, #280810, #180808, #282820

.step7
    rgb   #000000, #000000, #000000, #000000
    rgb   #000000, #000000, #000000, #F8F888
    rgb   #000000, #000000, #000000, #000000
    rgb   #000000, #000000, #000000, #000000
    rgb   #000000, #000000, #000000, #000000
    rgb   #000000, #000000, #000000, #000000
    rgb   #000000, #000000, #000000, #000000
    rgb   #000000, #000000, #000000, #000000

func_017_53A7::
    and  a                                        ;; 17:53A7 $A7
    jr   z, .jr_53B3                              ;; 17:53A8 $28 $09

    ld   a, [wD00A]                               ;; 17:53AA $FA $0A $D0
    inc  a                                        ;; 17:53AD $3C
    inc  a                                        ;; 17:53AE $3C
    xor  $0F                                      ;; 17:53AF $EE $0F
    jr   jr_017_53B8                              ;; 17:53B1 $18 $05

.jr_53B3
    ld   a, [wD00A]                               ;; 17:53B3 $FA $0A $D0
    inc  a                                        ;; 17:53B6 $3C
    inc  a                                        ;; 17:53B7 $3C

jr_017_53B8:
    and  $FE                                      ;; 17:53B8 $E6 $FE
    swap a                                        ;; 17:53BA $CB $37
    sla  a                                        ;; 17:53BC $CB $27
    ld   c, a                                     ;; 17:53BE $4F
    ld   a, $00                                   ;; 17:53BF $3E $00
    adc  $00                                      ;; 17:53C1 $CE $00
    ld   b, a                                     ;; 17:53C3 $47
    ld   hl, WindfishPalettes                     ;; 17:53C4 $21 $A7 $51
    add  hl, bc                                   ;; 17:53C7 $09
    ld   bc, $0040                                ;; 17:53C8 $01 $40 $00
    ld   de, wBGPal1                              ;; 17:53CB $11 $10 $DC
    call CopyData                                 ;; 17:53CE $CD $14 $29

    xor  a                                        ;; 17:53D1 $AF
    ld   [wPalettePartialCopyColorIndexStart], a  ;; 17:53D2 $EA $D3 $DD
    ld   a, $20                                   ;; 17:53D5 $3E $20
    ld   [wPalettePartialCopyColorCount], a       ;; 17:53D7 $EA $D4 $DD
    ld   a, $81                                   ;; 17:53DA $3E $81
    ld   [wPaletteDataFlags], a                   ;; 17:53DC $EA $D1 $DD
    ret                                           ;; 17:53DF $C9

CreditsWindFishFloatingHandler::
    ld   a, [wD006]                               ;; 17:53E0 $FA $06 $D0
    and  a                                        ;; 17:53E3 $A7
    jr   nz, ret_017_53F2                         ;; 17:53E4 $20 $0C

    call IncrementCreditsSubscene                 ;; 17:53E6 $CD $D9 $4C

    ld_dialog_low  a, Dialog0D0 ; "I AM THE WIND FISH" ;; 17:53E9 $3E $D0
    ; fallthrough

CreditsOpenWindFishDialog::
    call CreditsOpenDialog                        ;; 17:53EB $CD $F0 $7C
    ld   a, WAVE_SFX_WIND_FISH_CRY                ;; 17:53EE $3E $17
    ldh  [hWaveSfx], a                            ;; 17:53F0 $E0 $F3

ret_017_53F2:
    ret                                           ;; 17:53F2 $C9

CreditsWindFishSpeechHandler::
    ld   a, [wDialogState]                        ;; 17:53F3 $FA $9F $C1
    and  a                                        ;; 17:53F6 $A7
    jr   nz, .ret_53FC                            ;; 17:53F7 $20 $03

    call IncrementCreditsSubscene                 ;; 17:53F9 $CD $D9 $4C

.ret_53FC
    ret                                           ;; 17:53FC $C9

CreditsWindFishPrepareDisapparitionHandler::
    ld   a, [wDialogState]                        ;; 17:53FD $FA $9F $C1
    and  a                                        ;; 17:5400 $A7
    jr   nz, .ret_541D                            ;; 17:5401 $20 $1A

    ld   a, IEF_VBLANK                            ;; 17:5403 $3E $01
    ldh  [rIE], a                                 ;; 17:5405 $E0 $FF
    ld   a, $FF                                   ;; 17:5407 $3E $FF
    ld   [wTransitionGfx], a                      ;; 17:5409 $EA $7F $C1
    ld   a, $E0                                   ;; 17:540C $3E $E0
    ld   [wD005], a                               ;; 17:540E $EA $05 $D0
    ld   a, $50                                   ;; 17:5411 $3E $50
    ld   [wD006], a                               ;; 17:5413 $EA $06 $D0
    ld   a, WAVE_SFX_WIND_FISH_MORPH              ;; 17:5416 $3E $1F
    ldh  [hWaveSfx], a                            ;; 17:5418 $E0 $F3
    call IncrementCreditsSubscene                 ;; 17:541A $CD $D9 $4C

.ret_541D
    ret                                           ;; 17:541D $C9

Data_017_541E::
    db   $27, $27, $27, $27, $6B, $6B, $6B, $6B, $BF, $BF, $BF, $BF, $FF, $FF, $FF, $FF

CreditsWindFishDisapparitionHandler::
    CREDITS_MACRO_LDH_AND_LD
    ldh  a, [hIsGBC]                              ;; 17:5433 $F0 $FE
    and  a                                        ;; 17:5435 $A7
    jr   z, .jr_543E                              ;; 17:5436 $28 $06

    xor  a                                        ;; 17:5438 $AF
    call func_017_53A7                            ;; 17:5439 $CD $A7 $53
    jr   jr_017_544D                              ;; 17:543C $18 $0F

.jr_543E
    ld   a, [wD00A]                               ;; 17:543E $FA $0A $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:5442 $5F
    ld   d, $00                                   ;; 17:5443 $16 $00
    ld   hl, Data_017_541E                        ;; 17:5445 $21 $1E $54
    add  hl, de                                   ;; 17:5448 $19
    ld   a, [hl]                                  ;; 17:5449 $7E
    ld   [wBGPalette], a                          ;; 17:544A $EA $97 $DB

jr_017_544D:
    ld   a, [wD005]                               ;; 17:544D $FA $05 $D0
    cp   $A0                                      ;; 17:5450 $FE $A0
    jr   nc, .jr_547D                             ;; 17:5452 $30 $29

    ld   a, [wD006]                               ;; 17:5454 $FA $06 $D0
    and  a                                        ;; 17:5457 $A7
    jr   nz, .jr_547D                             ;; 17:5458 $20 $23

    ld   a, $0C                                   ;; 17:545A $3E $0C
    ld   [wD006], a                               ;; 17:545C $EA $06 $D0
    ld   a, [wD00A]                               ;; 17:545F $FA $0A $D0
    inc  a                                        ;; 17:5462 $3C
    ld   [wD00A], a                               ;; 17:5463 $EA $0A $D0
    cp   $0D                                      ;; 17:5466 $FE $0D
    jr   nz, .jr_547D                             ;; 17:5468 $20 $13

    xor  a                                        ;; 17:546A $AF
    ld   [wTransitionGfx], a                      ;; 17:546B $EA $7F $C1
    call ResetCreditsSceneVariables               ;; 17:546E $CD $A5 $4D
    ld   a, $30                                   ;; 17:5471 $3E $30
    ld   [wD006], a                               ;; 17:5473 $EA $06 $D0
    ld   a, IEF_VBLANK                            ;; 17:5476 $3E $01
    ldh  [rIE], a                                 ;; 17:5478 $E0 $FF
    jp   IncrementCreditsSubsceneAndReturn        ;; 17:547A $C3 $D9 $4C

.jr_547D
    ld   a, [wD00B]                               ;; 17:547D $FA $0B $D0
    inc  a                                        ;; 17:5480 $3C
    ld   [wD00B], a                               ;; 17:5481 $EA $0B $D0
    and  $0F                                      ;; 17:5484 $E6 $0F
    jr   nz, .ret_5493                            ;; 17:5486 $20 $0B

    ld   a, [wD005]                               ;; 17:5488 $FA $05 $D0
    and  a                                        ;; 17:548B $A7
    jr   z, .ret_5493                             ;; 17:548C $28 $05

    sub  $20                                      ;; 17:548E $D6 $20
    ld   [wD005], a                               ;; 17:5490 $EA $05 $D0

.ret_5493
    ret                                           ;; 17:5493 $C9

Data_017_5494::
    db   $9B, $C0, $53, $A0, $9B, $E0, $53, $A0, $98, $00, $53, $A0, $98, $20, $53, $A0
    db   $98, $40, $53, $A0, $98, $60, $53, $A0, $98, $80, $53, $A0, $98, $A0, $53, $A0
    db   $98, $C0, $53, $A0, $98, $E0, $53, $A0

CreditsWindFishDisappearedHandler::
    ld   a, [wD006]                               ;; 17:54BC $FA $06 $D0
    and  a                                        ;; 17:54BF $A7
    ret  nz                                       ;; 17:54C0 $C0

    ld   a, [wCreditsScratch0]                    ;; 17:54C1 $FA $00 $D0
    cp   $0A                                      ;; 17:54C4 $FE $0A
    jr   nz, .jr_54D5                             ;; 17:54C6 $20 $0D

    ; Open the "Play the instruments!" dialog
    ld_dialog_low a, Dialog0D2                    ;; 17:54C8 $3E $D2
    call CreditsOpenWindFishDialog                ;; 17:54CA $CD $EB $53
    ld   a, $27                                   ;; 17:54CD $3E $27
    ld   [wBGPalette], a                          ;; 17:54CF $EA $97 $DB
    jp   IncrementCreditsSubscene                 ;; 17:54D2 $C3 $D9 $4C

.jr_54D5
    ld   e, a                                     ;; 17:54D5 $5F
    inc  a                                        ;; 17:54D6 $3C
    ld   [wCreditsScratch0], a                    ;; 17:54D7 $EA $00 $D0
    sla  e                                        ;; 17:54DA $CB $23
    sla  e                                        ;; 17:54DC $CB $23
    ld   d, $00                                   ;; 17:54DE $16 $00
    ld   hl, Data_017_5494                        ;; 17:54E0 $21 $94 $54
    add  hl, de                                   ;; 17:54E3 $19
IF !__PATCH_1__
    push de                                       ;; 17:54E4 $D5
ENDC
    ld   de, wDrawCommand                         ;; 17:54E5 $11 $01 $D6
    ld   c, $04                                   ;; 17:54E8 $0E $04

.loop_54EA
    ld   a, [hl+]                                 ;; 17:54EA $2A
    ld   [de], a                                  ;; 17:54EB $12
    inc  de                                       ;; 17:54EC $13
    dec  c                                        ;; 17:54ED $0D
    jr   nz, .loop_54EA                           ;; 17:54EE $20 $FA

    xor  a                                        ;; 17:54F0 $AF
    ld   [de], a                                  ;; 17:54F1 $12
    pop  de                                       ;; 17:54F2 $D1
    ldh  a, [hIsGBC]                              ;; 17:54F3 $F0 $FE
    and  a                                        ;; 17:54F5 $A7

.jr_54F6
    ret  z                                        ;; 17:54F6 $C8

    ld   hl, Data_017_5494                        ;; 17:54F7 $21 $94 $54
    add  hl, de                                   ;; 17:54FA $19
    ld   de, wDrawCommandVRAM1                    ;; 17:54FB $11 $91 $DC
    ld   c, $03                                   ;; 17:54FE $0E $03

.loop_5500
    ld   a, [hl+]                                 ;; 17:5500 $2A
    ld   [de], a                                  ;; 17:5501 $12
    inc  de                                       ;; 17:5502 $13
    dec  c                                        ;; 17:5503 $0D
    jr   nz, .loop_5500                           ;; 17:5504 $20 $FA

    xor  a                                        ;; 17:5506 $AF
    ld   [de], a                                  ;; 17:5507 $12
    inc  de                                       ;; 17:5508 $13
    ld   [de], a                                  ;; 17:5509 $12
    ret                                           ;; 17:550A $C9

CreditsPlayInstrumentsDialogHandler::
    ld   a, [wDialogState]                        ;; 17:550B $FA $9F $C1
    and  a                                        ;; 17:550E $A7
    jr   nz, .ret_551F                            ;; 17:550F $20 $0E

    call ResetCreditsSceneVariables               ;; 17:5511 $CD $A5 $4D
    ld   a, LINK_ANIMATION_STATE_UNKNOWN_03       ;; 17:5514 $3E $03
    ldh  [hLinkAnimationState], a                 ;; 17:5516 $E0 $9D
    ld   a, REPLACE_TILES_SIRENS_INSTRUMENT       ;; 17:5518 $3E $0C
    ldh  [hReplaceTiles], a                       ;; 17:551A $E0 $A5
    call IncrementCreditsSubscene                 ;; 17:551C $CD $D9 $4C

.ret_551F
    ret                                           ;; 17:551F $C9

CreditsLinkTurnsToPlayHandler::
    ld   a, [wCreditsScratch0]                    ;; 17:5520 $FA $00 $D0
    cp   $07                                      ;; 17:5523 $FE $07
    jr   nz, .jr_5532                             ;; 17:5525 $20 $0B

    call ResetCreditsSceneVariables               ;; 17:5527 $CD $A5 $4D
    ld   a, $80                                   ;; 17:552A $3E $80
    ld   [wD006], a                               ;; 17:552C $EA $06 $D0
    jp   IncrementCreditsSubsceneAndReturn        ;; 17:552F $C3 $D9 $4C

.jr_5532
    inc  a                                        ;; 17:5532 $3C
    ld   [wCreditsScratch0], a                    ;; 17:5533 $EA $00 $D0
    ld   a, REPLACE_TILES_SIRENS_INSTRUMENT       ;; 17:5536 $3E $0C
    ldh  [hReplaceTiles], a                       ;; 17:5538 $E0 $A5
    ret                                           ;; 17:553A $C9

Data_017_553B::
    db   $48, $58, $60, $60, $58, $48, $40, $40

Data_017_5543::
    db   $40, $40, $48, $58, $60, $60, $58, $48

Data_017_554B::
    db   $FF, $01, $02, $02, $01, $FF, $FE, $FE

Data_017_5553::
    db   $FE, $FE, $FF, $01, $02, $02, $01, $FF

Data_017_555B::
    db   $00, $01, $02, $03, $04, $05, $06, $07

Data_017_5563::
    db   $00, $08, $10, $18, $20, $28, $30, $38

CreditsLinkPreparesToPlayHandler::
    ld   a, [wD006]                               ;; 17:556B $FA $06 $D0
    and  a                                        ;; 17:556E $A7
    jr   nz, ret_017_55E9                         ;; 17:556F $20 $78

    ld   a, LINK_ANIMATION_STATE_STANDING_UP      ;; 17:5571 $3E $04
    ldh  [hLinkAnimationState], a                 ;; 17:5573 $E0 $9D
    ld   a, MUSIC_ISLAND_DISAPPEAR                ;; 17:5575 $3E $3F
    ld   [wMusicTrackToPlay], a                   ;; 17:5577 $EA $68 $D3

jr_017_557A:
    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:557A $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:557C $CD $86 $3B
    ld   a, [wCreditsScratch0]                    ;; 17:557F $FA $00 $D0
    ld   c, a                                     ;; 17:5582 $4F
    ld   b, $00                                   ;; 17:5583 $06 $00
    ld   hl, Data_017_553B                        ;; 17:5585 $21 $3B $55
    add  hl, bc                                   ;; 17:5588 $09
    ld   a, [hl]                                  ;; 17:5589 $7E
    ld   hl, wEntitiesPosXTable                   ;; 17:558A $21 $00 $C2
    add  hl, de                                   ;; 17:558D $19
    ld   [hl], a                                  ;; 17:558E $77
    ld   hl, Data_017_5543                        ;; 17:558F $21 $43 $55
    add  hl, bc                                   ;; 17:5592 $09
    ld   a, [hl]                                  ;; 17:5593 $7E
    ld   hl, wEntitiesPosYTable                   ;; 17:5594 $21 $10 $C2
    add  hl, de                                   ;; 17:5597 $19
    sub  $20                                      ;; 17:5598 $D6 $20
    ld   [hl], a                                  ;; 17:559A $77
    ld   hl, Data_017_554B                        ;; 17:559B $21 $4B $55
    add  hl, bc                                   ;; 17:559E $09
    ld   a, [hl]                                  ;; 17:559F $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 17:55A0 $21 $40 $C2

.jr_55A3
    add  hl, de                                   ;; 17:55A3 $19
    ld   [hl], a                                  ;; 17:55A4 $77
    ld   hl, Data_017_5553                        ;; 17:55A5 $21 $53 $55
    add  hl, bc                                   ;; 17:55A8 $09
    ld   a, [hl]                                  ;; 17:55A9 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 17:55AA $21 $50 $C2
    add  hl, de                                   ;; 17:55AD $19
    ld   [hl], a                                  ;; 17:55AE $77
    ld   hl, Data_017_555B                        ;; 17:55AF $21 $5B $55
    add  hl, bc                                   ;; 17:55B2 $09
    ld   a, [hl]                                  ;; 17:55B3 $7E
    ld   hl, wEntitiesSpriteVariantTable          ;; 17:55B4 $21 $B0 $C3
    add  hl, de                                   ;; 17:55B7 $19
    ld   [hl], a                                  ;; 17:55B8 $77
    ld   hl, Data_017_5563                        ;; 17:55B9 $21 $63 $55
    add  hl, bc                                   ;; 17:55BC $09
    ld   a, [hl]                                  ;; 17:55BD $7E
    ld   hl, wEntitiesPrivateState2Table          ;; 17:55BE $21 $C0 $C2
    add  hl, de                                   ;; 17:55C1 $19
    ld   [hl], a                                  ;; 17:55C2 $77
    ld   hl, wEntitiesPrivateState1Table          ;; 17:55C3 $21 $B0 $C2
    add  hl, de                                   ;; 17:55C6 $19
    ld   [hl], $03                                ;; 17:55C7 $36 $03
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 17:55C9 $21 $40 $C3
    add  hl, de                                   ;; 17:55CC $19
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 17:55CD $36 $C2
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 17:55CF $21 $50 $C4
    add  hl, de                                   ;; 17:55D2 $19
    ld   [hl], $20                                ;; 17:55D3 $36 $20
    ld   a, c                                     ;; 17:55D5 $79
    inc  a                                        ;; 17:55D6 $3C
    ld   [wCreditsScratch0], a                    ;; 17:55D7 $EA $00 $D0
    cp   $08                                      ;; 17:55DA $FE $08
    jr   nz, jr_017_557A                          ;; 17:55DC $20 $9C

    call ResetCreditsSceneVariables               ;; 17:55DE $CD $A5 $4D
    ld   a, $A0                                   ;; 17:55E1 $3E $A0
    ld   [wD006], a                               ;; 17:55E3 $EA $06 $D0
    call IncrementCreditsSubscene                 ;; 17:55E6 $CD $D9 $4C

ret_017_55E9:
    ret                                           ;; 17:55E9 $C9

CreditsLinkShowsInstrumentsHandler::
    ld   a, [wD006]                               ;; 17:55EA $FA $06 $D0
    cp   $9E                                      ;; 17:55ED $FE $9E
    jr   nz, .jr_55F6                             ;; 17:55EF $20 $05

    ld   hl, hJingle                              ;; 17:55F1 $21 $F2 $FF
    ld   [hl], JINGLE_INSTRUMENTS_APPEAR          ;; 17:55F4 $36 $34

.jr_55F6
    and  a                                        ;; 17:55F6 $A7
    jr   nz, .ret_55FC                            ;; 17:55F7 $20 $03

    call IncrementCreditsSubscene                 ;; 17:55F9 $CD $D9 $4C

.ret_55FC
    ret                                           ;; 17:55FC $C9

; Handles:
; - the fade-to-white of Link on the stairs
; - the various views of Koholint
; - the island disappearing
; - link's platform rumbling
CreditsInstrumentsPlayingHandler::
    ld   a, [wCreditsScratch0]                    ;; 17:55FD $FA $00 $D0
    JP_TABLE                                     ;; 17:5600
._00 dw func_017_5665                            ;; 17:5601
._01 dw MrsMeowMeowsHouseSceneHandler            ;; 17:5603
._02 dw func_017_5728                            ;; 17:5605
._03 dw KidsSceneHandler                         ;; 17:5607
._04 dw func_017_5794                            ;; 17:5609
._05 dw BeachSceneHandler                        ;; 17:560B
._06 dw func_017_57F9                            ;; 17:560D
._07 dw TarinSceneHandler                        ;; 17:560F
._08 dw func_017_583C                            ;; 17:5611
._09 dw MarinSingingSceneHandler                 ;; 17:5613
._0A dw func_017_58C3                            ;; 17:5615
._0B dw func_017_58D1                            ;; 17:5617
._0C dw func_017_58F0                            ;; 17:5619
._0D dw func_017_58F8                            ;; 17:561B
._0E dw func_017_590B                            ;; 17:561D
._0F dw func_017_5938                            ;; 17:561F
._10 dw func_017_5A66                            ;; 17:5621
._11 dw func_017_5ACD                            ;; 17:5623

IncrementD000AndReturn::
    ld   hl, wCreditsScratch0                    ; $5625 (17): $21 $00 $D0
    inc  [hl]                                    ; $5628 (17): $34
    ret                                          ; $5629 (17): $C9

DisableAllEntities::
    ; For each entity, set the state to 0 (ENTITY_STATUS_DISABLED)
    ld   e, MAX_ENTITIES                          ;; 17:562A $1E $10
    ld   hl, wEntitiesStatusTable                 ;; 17:562C $21 $80 $C2
    xor  a                                        ;; 17:562F $AF
.loop
    ld   [hl+], a                                 ;; 17:5630 $22
    dec  e                                        ;; 17:5631 $1D
    jr   nz, .loop                                ;; 17:5632 $20 $FC
    ret                                           ;; 17:5634 $C9

Data_017_5635::
    CREDITS_FADE $FF, $AA, $55, $00

Data_017_5645::
    CREDITS_FADE $1C, $18, $04, $00

Data_017_5655::
    CREDITS_FADE $90, $50, $00, $00

func_017_5665::
    ldh  a, [hFrameCounter]                       ;; 17:5665 $F0 $E7
    and  $07                                      ;; 17:5667 $E6 $07
    jr   nz, jr_017_5695                          ;; 17:5669 $20 $2A

    ld   a, [wD00A]                               ;; 17:566B $FA $0A $D0
    inc  a                                        ;; 17:566E $3C
    ld   [wD00A], a                               ;; 17:566F $EA $0A $D0
    cp   $0C                                      ;; 17:5672 $FE $0C
    jr   nz, .jr_5689                             ;; 17:5674 $20 $13

    ld   a, TILESET_CREDITS_KOHOLINT_VIEWS        ;; 17:5676 $3E $1D
    ld   [wTilesetToLoad], a                      ;; 17:5678 $EA $FE $D6

    ld   a, $01                                   ;; 17:567B $3E $01
    ld   [wPaletteUnknownE], a                    ;; 17:567D $EA $D5 $DD

    xor  a                                        ;; 17:5680 $AF
    ldh  [hBaseScrollY], a                        ;; 17:5681 $E0 $97

    call DisableAllEntities                       ;; 17:5683 $CD $2A $56
    jp   IncrementD000AndReturn                   ;; 17:5686 $C3 $25 $56

.jr_5689
    ldh  a, [hIsGBC]                              ;; 17:5689 $F0 $FE
    and  a                                        ;; 17:568B $A7
    jr   z, jr_017_5695                           ;; 17:568C $28 $07

    ld   a, [wD00A]                               ;; 17:568E $FA $0A $D0
    dec  a                                        ;; 17:5691 $3D
    jp   func_017_7F30                            ;; 17:5692 $C3 $30 $7F

jr_017_5695:
    CREDITS_MACRO_LDH_AND_LD
    ld   a, [wD00A]                               ;; 17:569A $FA $0A $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:569E $5F
    ld   d, $00                                   ;; 17:569F $16 $00
    ld   hl, Data_017_5635                        ;; 17:56A1 $21 $35 $56
    add  hl, de                                   ;; 17:56A4 $19
    ld   a, [hl]                                  ;; 17:56A5 $7E
    ld   [wBGPalette], a                          ;; 17:56A6 $EA $97 $DB
    ld   hl, Data_017_5645                        ;; 17:56A9 $21 $45 $56
    add  hl, de                                   ;; 17:56AC $19
    ld   a, [hl]                                  ;; 17:56AD $7E
    ld   [wOBJ0Palette], a                        ;; 17:56AE $EA $98 $DB
    ld   hl, Data_017_5655                        ;; 17:56B1 $21 $55 $56
    add  hl, de                                   ;; 17:56B4 $19
    ld   a, [hl]                                  ;; 17:56B5 $7E
    ld   [wOBJ1Palette], a                        ;; 17:56B6 $EA $99 $DB
    ret                                           ;; 17:56B9 $C9

label_017_56BA:
    ldh  a, [hFrameCounter]                       ;; 17:56BA $F0 $E7
    ld   e, $01                                   ;; 17:56BC $1E $01
    and  $04                                      ;; 17:56BE $E6 $04
    jr   z, .jr_56C4                              ;; 17:56C0 $28 $02

    ld   e, $FE                                   ;; 17:56C2 $1E $FE

.jr_56C4
    ld   hl, wScreenShakeHorizontal               ;; 17:56C4 $21 $55 $C1
    ld   [hl], e                                  ;; 17:56C7 $73
    ret                                           ;; 17:56C8 $C9

MrsMeowMeowsHouseSceneHandler::
    xor  a                                        ;; 17:56C9 $AF
    ld   [wD00A], a                               ;; 17:56CA $EA $0A $D0
    ldh  a, [hIsGBC]                              ;; 17:56CD $F0 $FE
    and  a                                        ;; 17:56CF $A7
    jr   z, .jr_56D7                              ;; 17:56D0 $28 $05

    call func_017_5B00                            ;; 17:56D2 $CD $00 $5B
    jr   jr_017_56DC                              ;; 17:56D5 $18 $05

.jr_56D7
    ld   a, TILEMAP_CREDITS_MRS_MEOW_MEOWS_HOUSE  ;; 17:56D7 $3E $20
    ld   [wBGMapToLoad], a                        ;; 17:56D9 $EA $FF $D6

jr_017_56DC:
    ld   a, ENTITY_BOW_WOW                        ;; 17:56DC $3E $6D
    call SpawnNewEntity_trampoline                ;; 17:56DE $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:56E1 $21 $00 $C2
    add  hl, de                                   ;; 17:56E4 $19
    ld   [hl], $48                                ;; 17:56E5 $36 $48
    ld   hl, wEntitiesPosYTable                   ;; 17:56E7 $21 $10 $C2
    add  hl, de                                   ;; 17:56EA $19
    ld   [hl], $50                                ;; 17:56EB $36 $50

    ld   a, ENTITY_DOG                            ;; 17:56ED $3E $6F
    call SpawnNewEntity_trampoline                ;; 17:56EF $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:56F2 $21 $00 $C2
    add  hl, de                                   ;; 17:56F5 $19
    ld   [hl], $68                                ;; 17:56F6 $36 $68
    ld   hl, wEntitiesPosYTable                   ;; 17:56F8 $21 $10 $C2
    add  hl, de                                   ;; 17:56FB $19
    ld   [hl], $30                                ;; 17:56FC $36 $30

    ld   a, ENTITY_YIP_YIP                        ;; 17:56FE $3E $78
    call SpawnNewEntity_trampoline                ;; 17:5700 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:5703 $21 $00 $C2
    add  hl, de                                   ;; 17:5706 $19
    ld   [hl], $2C                                ;; 17:5707 $36 $2C
    ld   hl, wEntitiesPosYTable                   ;; 17:5709 $21 $10 $C2
    add  hl, de                                   ;; 17:570C $19
    ld   [hl], $58                                ;; 17:570D $36 $58

    ld   a, ENTITY_YIP_YIP                        ;; 17:570F $3E $78
    call SpawnNewEntity_trampoline                ;; 17:5711 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:5714 $21 $00 $C2
    add  hl, de                                   ;; 17:5717 $19
    ld   [hl], $60                                ;; 17:5718 $36 $60
    ld   hl, wEntitiesPosYTable                   ;; 17:571A $21 $10 $C2
    add  hl, de                                   ;; 17:571D $19
    ld   [hl], $52                                ;; 17:571E $36 $52
    ld   hl, wEntitiesPrivateState1Table          ;; 17:5720 $21 $B0 $C2
    add  hl, de                                   ;; 17:5723 $19
    inc  [hl]                                     ;; 17:5724 $34
    jp   IncrementD000AndReturn                   ;; 17:5725 $C3 $25 $56

func_017_5728::
    call func_017_5970                            ;; 17:5728 $CD $70 $59
    jr   nz, .ret_5735                            ;; 17:572B $20 $08

    ld   a, $50                                   ;; 17:572D $3E $50
    ld   [wD006], a                               ;; 17:572F $EA $06 $D0
    jp   IncrementD000AndReturn                   ;; 17:5732 $C3 $25 $56

.ret_5735
    ret                                           ;; 17:5735 $C9

func_017_5736::
    ldh  a, [hPressedButtonsMask]                 ;; 17:5736 $F0 $CB
    and  $30                                      ;; 17:5738 $E6 $30
    ret  nz                                       ;; 17:573A $C0

    nop                                           ;; 17:573B $00
    ret                                           ;; 17:573C $C9

KidsSceneHandler::
    ld   a, [wD006]                               ;; 17:573D $FA $06 $D0
    and  a                                        ;; 17:5740 $A7
    jr   nz, ret_017_5793                         ;; 17:5741 $20 $50

    call func_017_5736                            ;; 17:5743 $CD $36 $57
    call func_017_59FD                            ;; 17:5746 $CD $FD $59
    jr   nz, ret_017_5793                         ;; 17:5749 $20 $48

    ldh  a, [hIsGBC]                              ;; 17:574B $F0 $FE
    and  a                                        ;; 17:574D $A7
    jr   z, .jr_5755                              ;; 17:574E $28 $05

    call func_017_5B00                            ;; 17:5750 $CD $00 $5B
    jr   jr_017_575A                              ;; 17:5753 $18 $05

.jr_5755
    ld   a, TILEMAP_CREDITS_KIDS                  ;; 17:5755 $3E $1E
    ld   [wBGMapToLoad], a                        ;; 17:5757 $EA $FF $D6

jr_017_575A:
    call DisableAllEntities                       ;; 17:575A $CD $2A $56

    ld   a, ENTITY_KID_71                         ;; 17:575D $3E $71
    call SpawnNewEntity_trampoline                ;; 17:575F $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:5762 $21 $00 $C2
    add  hl, de                                   ;; 17:5765 $19
    ld   [hl], $48                                ;; 17:5766 $36 $48
    ld   hl, wEntitiesPosYTable                   ;; 17:5768 $21 $10 $C2
    add  hl, de                                   ;; 17:576B $19
    ld   [hl], $50                                ;; 17:576C $36 $50
    ld   hl, wEntitiesStateTable                  ;; 17:576E $21 $90 $C2
    add  hl, de                                   ;; 17:5771 $19
    inc  [hl]                                     ;; 17:5772 $34
    ld   hl, wEntitiesTransitionCountdownTable    ;; 17:5773 $21 $E0 $C2
    add  hl, de                                   ;; 17:5776 $19
    ld   [hl], $20                                ;; 17:5777 $36 $20
    ld   hl, wEntitiesDirectionTable              ;; 17:5779 $21 $80 $C3
    add  hl, de                                   ;; 17:577C $19
    ld   [hl], $02                                ;; 17:577D $36 $02

    ld   a, ENTITY_KID_72                         ;; 17:577F $3E $72
    call SpawnNewEntity_trampoline                ;; 17:5781 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:5784 $21 $00 $C2
    add  hl, de                                   ;; 17:5787 $19
    ld   [hl], $78                                ;; 17:5788 $36 $78
    ld   hl, wEntitiesPosYTable                   ;; 17:578A $21 $10 $C2
    add  hl, de                                   ;; 17:578D $19
    ld   [hl], $50                                ;; 17:578E $36 $50
    jp   IncrementD000AndReturn                   ;; 17:5790 $C3 $25 $56

ret_017_5793:
    ret                                           ;; 17:5793 $C9

func_017_5794::
    call func_017_5970                            ;; 17:5794 $CD $70 $59
    jr   nz, .ret_57A1                            ;; 17:5797 $20 $08

    ld   a, $50                                   ;; 17:5799 $3E $50
    ld   [wD006], a                               ;; 17:579B $EA $06 $D0
    jp   IncrementD000AndReturn                   ;; 17:579E $C3 $25 $56

.ret_57A1
    ret                                           ;; 17:57A1 $C9

BeachSceneHandler::
    ld   a, [wD006]                               ;; 17:57A2 $FA $06 $D0
    and  a                                        ;; 17:57A5 $A7
    jr   nz, ret_017_57F8                         ;; 17:57A6 $20 $50

    call func_017_5736                            ;; 17:57A8 $CD $36 $57
    call func_017_59FD                            ;; 17:57AB $CD $FD $59
    jr   nz, ret_017_57F8                         ;; 17:57AE $20 $48

    ldh  a, [hIsGBC]                              ;; 17:57B0 $F0 $FE
    and  a                                        ;; 17:57B2 $A7
    jr   z, .jr_57BA                              ;; 17:57B3 $28 $05

    call func_017_5B00                            ;; 17:57B5 $CD $00 $5B
    jr   jr_017_57BF                              ;; 17:57B8 $18 $05

.jr_57BA
    ld   a, TILEMAP_CREDITS_BEACH                 ;; 17:57BA $3E $22
    ld   [wBGMapToLoad], a                        ;; 17:57BC $EA $FF $D6

jr_017_57BF:
    call DisableAllEntities                       ;; 17:57BF $CD $2A $56

    ld   a, ENTITY_URCHIN                         ;; 17:57C2 $3E $C5
    call SpawnNewEntity_trampoline                ;; 17:57C4 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:57C7 $21 $00 $C2
    add  hl, de                                   ;; 17:57CA $19
    ld   [hl], $28                                ;; 17:57CB $36 $28
    ld   hl, wEntitiesPosYTable                   ;; 17:57CD $21 $10 $C2
    add  hl, de                                   ;; 17:57D0 $19
    ld   [hl], $40                                ;; 17:57D1 $36 $40

    ld   a, ENTITY_OCTOROK                        ;; 17:57D3 $3E $09
    call SpawnNewEntity_trampoline                ;; 17:57D5 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:57D8 $21 $00 $C2
    add  hl, de                                   ;; 17:57DB $19
    ld   [hl], $48                                ;; 17:57DC $36 $48
    ld   hl, wEntitiesPosYTable                   ;; 17:57DE $21 $10 $C2
    add  hl, de                                   ;; 17:57E1 $19
    ld   [hl], $50                                ;; 17:57E2 $36 $50

    ld   a, ENTITY_OCTOROK                        ;; 17:57E4 $3E $09
    call SpawnNewEntity_trampoline                ;; 17:57E6 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:57E9 $21 $00 $C2
    add  hl, de                                   ;; 17:57EC $19
    ld   [hl], $68                                ;; 17:57ED $36 $68
    ld   hl, wEntitiesPosYTable                   ;; 17:57EF $21 $10 $C2
    add  hl, de                                   ;; 17:57F2 $19
    ld   [hl], $60                                ;; 17:57F3 $36 $60
    jp   IncrementD000AndReturn                   ;; 17:57F5 $C3 $25 $56

ret_017_57F8:
    ret                                           ;; 17:57F8 $C9

func_017_57F9::
    call func_017_5970                            ;; 17:57F9 $CD $70 $59
    jr   nz, .ret_5806                            ;; 17:57FC $20 $08

    ld   a, $50                                   ;; 17:57FE $3E $50
    ld   [wD006], a                               ;; 17:5800 $EA $06 $D0
    jp   IncrementD000AndReturn                   ;; 17:5803 $C3 $25 $56

.ret_5806
    ret                                           ;; 17:5806 $C9

TarinSceneHandler::
    ld   a, [wD006]                               ;; 17:5807 $FA $06 $D0
    and  a                                        ;; 17:580A $A7
    jr   nz, ret_017_583B                         ;; 17:580B $20 $2E

    call func_017_5736                            ;; 17:580D $CD $36 $57
    call func_017_59FD                            ;; 17:5810 $CD $FD $59
    jr   nz, ret_017_583B                         ;; 17:5813 $20 $26

    ldh  a, [hIsGBC]                              ;; 17:5815 $F0 $FE
    and  a                                        ;; 17:5817 $A7
    jr   z, .jr_581F                              ;; 17:5818 $28 $05

    call func_017_5B00                            ;; 17:581A $CD $00 $5B
    jr   jr_017_5824                              ;; 17:581D $18 $05

.jr_581F
    ld   a, TILEMAP_CREDITS_TARIN                 ;; 17:581F $3E $21
    ld   [wBGMapToLoad], a                        ;; 17:5821 $EA $FF $D6

jr_017_5824:
    call DisableAllEntities                       ;; 17:5824 $CD $2A $56

    ld   a, ENTITY_TARIN                          ;; 17:5827 $3E $3F
    call SpawnNewEntity_trampoline                ;; 17:5829 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:582C $21 $00 $C2
    add  hl, de                                   ;; 17:582F $19
    ld   [hl], $78                                ;; 17:5830 $36 $78
    ld   hl, wEntitiesPosYTable                   ;; 17:5832 $21 $10 $C2
    add  hl, de                                   ;; 17:5835 $19
    ld   [hl], $50                                ;; 17:5836 $36 $50
    jp   IncrementD000AndReturn                   ;; 17:5838 $C3 $25 $56

ret_017_583B:
    ret                                           ;; 17:583B $C9

func_017_583C::
    call func_017_5970                            ;; 17:583C $CD $70 $59
    jr   nz, .ret_5849                            ;; 17:583F $20 $08

    ld   a, $50                                   ;; 17:5841 $3E $50
    ld   [wD006], a                               ;; 17:5843 $EA $06 $D0
    jp   IncrementD000AndReturn                   ;; 17:5846 $C3 $25 $56

.ret_5849
    ret                                           ;; 17:5849 $C9

MarinSingingSceneHandler:
    ld   a, [wD006]                               ;; 17:584A $FA $06 $D0
    and  a                                        ;; 17:584D $A7
    jr   nz, ret_017_58C2                         ;; 17:584E $20 $72

    call func_017_5736                            ;; 17:5850 $CD $36 $57
    call func_017_59FD                            ;; 17:5853 $CD $FD $59
    jr   nz, ret_017_58C2                         ;; 17:5856 $20 $6A

    ldh  a, [hIsGBC]                              ;; 17:5858 $F0 $FE
    and  a                                        ;; 17:585A $A7
    jr   z, .jr_5862                              ;; 17:585B $28 $05

    call func_017_5B00                            ;; 17:585D $CD $00 $5B
    jr   jr_017_5867                              ;; 17:5860 $18 $05

.jr_5862
    ld   a, TILEMAP_CREDITS_MARIN_SINGING         ;; 17:5862 $3E $1F
    ld   [wBGMapToLoad], a                        ;; 17:5864 $EA $FF $D6

jr_017_5867:
    call DisableAllEntities                       ;; 17:5867 $CD $2A $56

    ld   a, ENTITY_MARIN                          ;; 17:586A $3E $3E
    call SpawnNewEntity_trampoline                ;; 17:586C $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:586F $21 $00 $C2
    add  hl, de                                   ;; 17:5872 $19
    ld   [hl], $28                                ;; 17:5873 $36 $28
    ld   hl, wEntitiesPosYTable                   ;; 17:5875 $21 $10 $C2
    add  hl, de                                   ;; 17:5878 $19
    ld   [hl], $50                                ;; 17:5879 $36 $50

    ld   a, ENTITY_BUTTERFLY                      ;; 17:587B $3E $6E
    call SpawnNewEntity_trampoline                ;; 17:587D $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:5880 $21 $00 $C2
    add  hl, de                                   ;; 17:5883 $19
    ld   [hl], $18                                ;; 17:5884 $36 $18
    ld   hl, wEntitiesPosYTable                   ;; 17:5886 $21 $10 $C2
    add  hl, de                                   ;; 17:5889 $19
    ld   [hl], $4C                                ;; 17:588A $36 $4C

    ld   a, ENTITY_BUTTERFLY                      ;; 17:588C $3E $6E
    call SpawnNewEntity_trampoline                ;; 17:588E $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:5891 $21 $00 $C2
    add  hl, de                                   ;; 17:5894 $19
    ld   [hl], $38                                ;; 17:5895 $36 $38
    ld   hl, wEntitiesPosYTable                   ;; 17:5897 $21 $10 $C2
    add  hl, de                                   ;; 17:589A $19
    ld   [hl], $54                                ;; 17:589B $36 $54

    ld   a, ENTITY_BUTTERFLY                      ;; 17:589D $3E $6E
    call SpawnNewEntity_trampoline                ;; 17:589F $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:58A2 $21 $00 $C2
    add  hl, de                                   ;; 17:58A5 $19
    ld   [hl], $28                                ;; 17:58A6 $36 $28
    ld   hl, wEntitiesPosYTable                   ;; 17:58A8 $21 $10 $C2
    add  hl, de                                   ;; 17:58AB $19
    ld   [hl], $30                                ;; 17:58AC $36 $30

    ld   a, ENTITY_DOG                            ;; 17:58AE $3E $6F
    call SpawnNewEntity_trampoline                ;; 17:58B0 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:58B3 $21 $00 $C2
    add  hl, de                                   ;; 17:58B6 $19
    ld   [hl], $78                                ;; 17:58B7 $36 $78
    ld   hl, wEntitiesPosYTable                   ;; 17:58B9 $21 $10 $C2
    add  hl, de                                   ;; 17:58BC $19
    ld   [hl], $60                                ;; 17:58BD $36 $60
    jp   IncrementD000AndReturn                   ;; 17:58BF $C3 $25 $56

ret_017_58C2:
    ret                                           ;; 17:58C2 $C9

func_017_58C3::
    call func_017_5970                            ;; 17:58C3 $CD $70 $59
    jr   nz, .ret_58D0                            ;; 17:58C6 $20 $08

    ld   a, $C0                                   ;; 17:58C8 $3E $C0
    ld   [wD006], a                               ;; 17:58CA $EA $06 $D0
    jp   IncrementD000AndReturn                   ;; 17:58CD $C3 $25 $56

.ret_58D0
    ret                                           ;; 17:58D0 $C9

; Load koholint island disapearing GFX
func_017_58D1::
    ld   a, [wD006]                               ;; 17:58D1 $FA $06 $D0
    and  a                                        ;; 17:58D4 $A7
    jr   nz, .ret_58EF                            ;; 17:58D5 $20 $18

    call func_017_5736                            ;; 17:58D7 $CD $36 $57
    call func_017_59FD                            ;; 17:58DA $CD $FD $59
    jr   nz, .ret_58EF                            ;; 17:58DD $20 $10

    ld   a, TILESET_CREDITS_KOHOLINT_DISAPPEARING ;; 17:58DF $3E $1E
    ld   [wTilesetToLoad], a                      ;; 17:58E1 $EA $FE $D6

    ld   a, $01                                   ;; 17:58E4 $3E $01
    ld   [wPaletteUnknownE], a                    ;; 17:58E6 $EA $D5 $DD

    call DisableAllEntities                       ;; 17:58E9 $CD $2A $56
    jp   IncrementD000AndReturn                   ;; 17:58EC $C3 $25 $56

.ret_58EF
    ret                                           ;; 17:58EF $C9

func_017_58F0::
    ld   a, TILEMAP_CREDITS_ISLAND                ;; 17:58F0 $3E $01
    ld   [wBGMapToLoad], a                        ;; 17:58F2 $EA $FF $D6
    jp   IncrementD000AndReturn                   ;; 17:58F5 $C3 $25 $56

func_017_58F8::
    call func_017_59A9                            ;; 17:58F8 $CD $A9 $59
    jr   nz, .ret_590A                            ;; 17:58FB $20 $0D

    ld   a, $A0                                   ;; 17:58FD $3E $A0
    ld   [wD006], a                               ;; 17:58FF $EA $06 $D0
    ld   a, $FF                                   ;; 17:5902 $3E $FF
    ld   [wD00B], a                               ;; 17:5904 $EA $0B $D0
    jp   IncrementD000AndReturn                   ;; 17:5907 $C3 $25 $56

.ret_590A
    ret                                           ;; 17:590A $C9

func_017_590B::
    ld   a, [wD006]                               ;; 17:590B $FA $06 $D0
    cp   $01                                      ;; 17:590E $FE $01
    jr   nz, .jr_5917                             ;; 17:5910 $20 $05

    ld   hl, hNoiseSfx                            ;; 17:5912 $21 $F4 $FF
    ld   [hl], NOISE_SFX_ISLAND_DISAPPEAR         ;; 17:5915 $36 $35

.jr_5917
    and  a                                        ;; 17:5917 $A7
    jr   nz, ret_017_594F                         ;; 17:5918 $20 $35

    ldh  a, [hFrameCounter]                       ;; 17:591A $F0 $E7
    and  $03                                      ;; 17:591C $E6 $03
    jr   nz, ret_017_594F                         ;; 17:591E $20 $2F

    ld   a, [wD00B]                               ;; 17:5920 $FA $0B $D0
    cp   $3F                                      ;; 17:5923 $FE $3F
    jr   z, .jr_5930                              ;; 17:5925 $28 $09

    inc  a                                        ;; 17:5927 $3C
    ld   [wD00B], a                               ;; 17:5928 $EA $0B $D0
    ld   a, REPLACE_TILES_ISLAND_FADE             ;; 17:592B $3E $0E
    ldh  [hReplaceTiles], a                       ;; 17:592D $E0 $A5
    ret                                           ;; 17:592F $C9

.jr_5930
    ld   a, $40                                   ;; 17:5930 $3E $40
    ld   [wD006], a                               ;; 17:5932 $EA $06 $D0
    jp   IncrementD000AndReturn                   ;; 17:5935 $C3 $25 $56

func_017_5938::
    ld   a, [wD006]                               ;; 17:5938 $FA $06 $D0
    and  a                                        ;; 17:593B $A7
    ret  nz                                       ;; 17:593C $C0

    xor  a                                        ;; 17:593D $AF
    ld   [wBGPalette], a                          ;; 17:593E $EA $97 $DB
    ld   [wOBJ0Palette], a                        ;; 17:5941 $EA $98 $DB
    ld   [wOBJ1Palette], a                        ;; 17:5944 $EA $99 $DB
    ld   a, BANK(func_017_5938)                   ;; 17:5947 $3E $17
    call ClearFileMenuBG_trampoline               ;; 17:5949 $CD $FA $08
    jp   IncrementD000AndReturn                   ;; 17:594C $C3 $25 $56

ret_017_594F:
    ret                                           ;; 17:594F $C9

Data_017_5950::
    CREDITS_FADE $00, $40, $94, $E4

Data_017_5960::
    CREDITS_FADE $00, $04, $18, $1C

func_017_5970::
    ldh  a, [hFrameCounter]                       ;; 17:5970 $F0 $E7
    and  $01                                      ;; 17:5972 $E6 $01
    jr   nz, jr_017_598F                          ;; 17:5974 $20 $19

    ld   a, [wD00A]                               ;; 17:5976 $FA $0A $D0
    inc  a                                        ;; 17:5979 $3C
    ld   [wD00A], a                               ;; 17:597A $EA $0A $D0
    ldh  a, [hIsGBC]                              ;; 17:597D $F0 $FE
    and  a                                        ;; 17:597F $A7
    jr   z, jr_017_598F                           ;; 17:5980 $28 $0D

.jr_5982
    ld   a, [wD00A]                               ;; 17:5982 $FA $0A $D0
    cp   $02                                      ;; 17:5985 $FE $02
    ret  c                                        ;; 17:5987 $D8

    dec  a                                        ;; 17:5988 $3D
    call CreditsBlendPalettes                     ;; 17:5989 $CD $80 $7E
    jp   jr_017_5A32                              ;; 17:598C $C3 $32 $5A

jr_017_598F:
    CREDITS_MACRO_LDH_AND_LD
    ld   a, [wD00A]                               ;; 17:5994 $FA $0A $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:5998 $5F
    ld   d, $00                                   ;; 17:5999 $16 $00
    ld   hl, Data_017_5950                        ;; 17:599B $21 $50 $59
    add  hl, de                                   ;; 17:599E $19
    ld   a, [hl]                                  ;; 17:599F $7E
    ld   [wBGPalette], a                          ;; 17:59A0 $EA $97 $DB
    ld   hl, Data_017_5960                        ;; 17:59A3 $21 $60 $59
    jp   jr_017_5A32                              ;; 17:59A6 $C3 $32 $5A

func_017_59A9::
    ldh  a, [hFrameCounter]                       ;; 17:59A9 $F0 $E7
    and  $03                                      ;; 17:59AB $E6 $03
    jr   nz, .jr_59C7                             ;; 17:59AD $20 $18

    ld   a, [wD00A]                               ;; 17:59AF $FA $0A $D0
    inc  a                                        ;; 17:59B2 $3C
    ld   [wD00A], a                               ;; 17:59B3 $EA $0A $D0
    ldh  a, [hIsGBC]                              ;; 17:59B6 $F0 $FE
    and  a                                        ;; 17:59B8 $A7
    jr   z, .jr_59C7                              ;; 17:59B9 $28 $0C

    ld   a, [wD00A]                               ;; 17:59BB $FA $0A $D0
    cp   $02                                      ;; 17:59BE $FE $02
    ret  c                                        ;; 17:59C0 $D8

    dec  a                                        ;; 17:59C1 $3D
    call CreditsBlendPalettes                     ;; 17:59C2 $CD $80 $7E
    jr   jr_017_5A32                              ;; 17:59C5 $18 $6B

.jr_59C7
    CREDITS_MACRO_LDH_AND_LD
    ld   a, [wD00A]                               ;; 17:59CC $FA $0A $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:59D0 $5F
    ld   d, $00                                   ;; 17:59D1 $16 $00
    ld   hl, Data_017_6ED8                        ;; 17:59D3 $21 $D8 $6E
    add  hl, de                                   ;; 17:59D6 $19
    ld   a, [hl]                                  ;; 17:59D7 $7E
    ld   [wBGPalette], a                          ;; 17:59D8 $EA $97 $DB
    jr   jr_017_5A37                              ;; 17:59DB $18 $5A

Data_017_59DD::
    CREDITS_FADE $E4, $94, $40, $00

Data_017_59ED::
    CREDITS_FADE $1C, $18, $04, $00

func_017_59FD::
    ldh  a, [hFrameCounter]                       ;; 17:59FD $F0 $E7
    and  $0F                                      ;; 17:59FF $E6 $0F
    jr   nz, jr_017_5A1B                          ;; 17:5A01 $20 $18

    ld   a, [wD00A]                               ;; 17:5A03 $FA $0A $D0
    inc  a                                        ;; 17:5A06 $3C
    ld   [wD00A], a                               ;; 17:5A07 $EA $0A $D0
    ldh  a, [hIsGBC]                              ;; 17:5A0A $F0 $FE
    and  a                                        ;; 17:5A0C $A7

.jr_5A0D
    jr   z, jr_017_5A1B                           ;; 17:5A0D $28 $0C

    ld   a, [wD00A]                               ;; 17:5A0F $FA $0A $D0
    cp   $02                                      ;; 17:5A12 $FE $02
    ret  c                                        ;; 17:5A14 $D8

    dec  a                                        ;; 17:5A15 $3D
    call func_017_7F30                            ;; 17:5A16 $CD $30 $7F
    jr   jr_017_5A37                              ;; 17:5A19 $18 $1C

jr_017_5A1B:
    CREDITS_MACRO_LDH_AND_LD
    ld   a, [wD00A]                               ;; 17:5A20 $FA $0A $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:5A24 $5F
    ld   d, $00                                   ;; 17:5A25 $16 $00
    ld   hl, Data_017_59DD                        ;; 17:5A27 $21 $DD $59
    add  hl, de                                   ;; 17:5A2A $19
    ld   a, [hl]                                  ;; 17:5A2B $7E
    ld   [wBGPalette], a                          ;; 17:5A2C $EA $97 $DB
    ld   hl, Data_017_59ED                        ;; 17:5A2F $21 $ED $59

jr_017_5A32:
    add  hl, de                                   ;; 17:5A32 $19
    ld   a, [hl]                                  ;; 17:5A33 $7E
    ld   [wOBJ0Palette], a                        ;; 17:5A34 $EA $98 $DB

jr_017_5A37:
    ld   a, [wD00A]                               ;; 17:5A37 $FA $0A $D0
    cp   $0C                                      ;; 17:5A3A $FE $0C
    jr   nz, .jr_5A42                             ;; 17:5A3C $20 $04

    xor  a                                        ;; 17:5A3E $AF
    ld   [wD00A], a                               ;; 17:5A3F $EA $0A $D0

.jr_5A42
    ret                                           ;; 17:5A42 $C9

    ldh  a, [hFrameCounter]                       ;; 17:5A43 $F0 $E7
    and  $07                                      ;; 17:5A45 $E6 $07
    jr   nz, .jr_5A50                             ;; 17:5A47 $20 $07

    ld   a, [wD00A]                               ;; 17:5A49 $FA $0A $D0
    inc  a                                        ;; 17:5A4C $3C
    ld   [wD00A], a                               ;; 17:5A4D $EA $0A $D0

.jr_5A50
    CREDITS_MACRO_LDH_AND_LD
    ld   a, [wD00A]                               ;; 17:5A55 $FA $0A $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:5A59 $5F
    ld   d, $00                                   ;; 17:5A5A $16 $00
    ld   hl, Data_017_6456                        ;; 17:5A5C $21 $56 $64
    add  hl, de                                   ;; 17:5A5F $19
    ld   a, [hl]                                  ;; 17:5A60 $7E
    ld   [wBGPalette], a                          ;; 17:5A61 $EA $97 $DB
    jr   jr_017_5A37                              ;; 17:5A64 $18 $D1

func_017_5A66::
    ld   a, $C9                                   ;; 17:5A66 $3E $C9
    ld   [wBGPalette], a                          ;; 17:5A68 $EA $97 $DB
    ld   a, $1C                                   ;; 17:5A6B $3E $1C
    ld   [wOBJ0Palette], a                        ;; 17:5A6D $EA $98 $DB
    ld   a, $90                                   ;; 17:5A70 $3E $90
    ld   [wOBJ1Palette], a                        ;; 17:5A72 $EA $99 $DB
    ld   a, [wD006]                               ;; 17:5A75 $FA $06 $D0
    and  a                                        ;; 17:5A78 $A7
    jp   nz, label_017_56BA                       ;; 17:5A79 $C2 $BA $56

    ld   a, $00                                   ;; 17:5A7C $3E $00
    ld   [wScreenShakeHorizontal], a              ;; 17:5A7E $EA $55 $C1
    ld   a, LINK_ANIMATION_STATE_STANDING_DOWN    ;; 17:5A81 $3E $00
    ldh  [hLinkAnimationState], a                 ;; 17:5A83 $E0 $9D

    ld   a, TILESET_15                            ;; 17:5A85 $3E $15
    ld   [wTilesetToLoad], a                      ;; 17:5A87 $EA $FE $D6

    xor  a                                        ;; 17:5A8A $AF
    ld   [wPaletteUnknownE], a                    ;; 17:5A8B $EA $D5 $DD
    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:5A8E $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:5A90 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:5A93 $21 $00 $C2
    add  hl, de                                   ;; 17:5A96 $19
    ld   [hl], $40                                ;; 17:5A97 $36 $40
    ld   hl, wEntitiesPosYTable                   ;; 17:5A99 $21 $10 $C2
    add  hl, de                                   ;; 17:5A9C $19
    ld   [hl], $60                                ;; 17:5A9D $36 $60
    ld   hl, wEntitiesStateTable                  ;; 17:5A9F $21 $90 $C2
    add  hl, de                                   ;; 17:5AA2 $19
    ld   [hl], $02                                ;; 17:5AA3 $36 $02
    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:5AA5 $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:5AA7 $CD $86 $3B
    ld   hl, wEntitiesPrivateState1Table          ;; 17:5AAA $21 $B0 $C2
    add  hl, de                                   ;; 17:5AAD $19
    inc  [hl]                                     ;; 17:5AAE $34
    ld   a, $50                                   ;; 17:5AAF $3E $50
    ldh  [hLinkPositionX], a                      ;; 17:5AB1 $E0 $98
    ld   hl, wLCDControl                          ;; 17:5AB3 $21 $FD $D6
    set  LCDCB_BG9C00, [hl]                       ;; 17:5AB6 $CB $DE
    ld   a, $A0                                   ;; 17:5AB8 $3E $A0
    ld   [wD006], a                               ;; 17:5ABA $EA $06 $D0
    ld   a, $FF                                   ;; 17:5ABD $3E $FF
    ld   [wBGPalette], a                          ;; 17:5ABF $EA $97 $DB
    ld   a, $5C                                   ;; 17:5AC2 $3E $5C
    ldh  [hLinkPositionY], a                      ;; 17:5AC4 $E0 $99
    ld   a, NOISE_SFX_WATERSPOUT                  ;; 17:5AC6 $3E $34
    ldh  [hNoiseSfx], a                           ;; 17:5AC8 $E0 $F4

    jp   IncrementD000AndReturn                   ;; 17:5ACA $C3 $25 $56

func_017_5ACD::
    ld   a, [wD006]                               ;; 17:5ACD $FA $06 $D0
    and  a                                        ;; 17:5AD0 $A7
    jp   nz, label_017_56BA                       ;; 17:5AD1 $C2 $BA $56

    ld   [wScreenShakeHorizontal], a              ;; 17:5AD4 $EA $55 $C1
    call ResetCreditsSceneVariables               ;; 17:5AD7 $CD $A5 $4D
    jp   IncrementCreditsSubscene                 ;; 17:5ADA $C3 $D9 $4C

CreditsWaterAppearingHandler::
    ldh  a, [hLinkPositionY]                      ;; 17:5ADD $F0 $99
    sub  $02                                      ;; 17:5ADF $D6 $02
    ldh  [hLinkPositionY], a                      ;; 17:5AE1 $E0 $99
    ldh  a, [hBaseScrollY]                        ;; 17:5AE3 $F0 $97
    add  $08                                      ;; 17:5AE5 $C6 $08
    ldh  [hBaseScrollY], a                        ;; 17:5AE7 $E0 $97
    cp   $60                                      ;; 17:5AE9 $FE $60
    jr   nz, .jr_5AFC                             ;; 17:5AEB $20 $0F

    ld   a, [wEntitiesStateTable+15]              ;; 17:5AED $FA $9F $C2
    inc  a                                        ;; 17:5AF0 $3C
    ld   [wEntitiesStateTable+15], a              ;; 17:5AF1 $EA $9F $C2
    ld   a, $40                                   ;; 17:5AF4 $3E $40
    ld   [wD009], a                               ;; 17:5AF6 $EA $09 $D0
    call IncrementCreditsSubscene                 ;; 17:5AF9 $CD $D9 $4C

.jr_5AFC
    call func_017_5B96                            ;; 17:5AFC $CD $96 $5B
    ret                                           ;; 17:5AFF $C9

func_017_5B00::
    call LCDOff                                   ;; 17:5B00 $CD $CF $28
    call CreditsLoadBGMap                         ;; 17:5B03 $CD $19 $5B
    call func_017_5B37                            ;; 17:5B06 $CD $37 $5B
    ld   a, [wLCDControl]                         ;; 17:5B09 $FA $FD $D6
    ldh  [rLCDC], a                               ;; 17:5B0C $E0 $40
    ret                                           ;; 17:5B0E $C9

Data_017_5B0F::
    dw CreditsBGMaps._04
    dw CreditsBGMaps._01
    dw CreditsBGMaps._02
    dw CreditsBGMaps._03
    dw CreditsBGMaps._00

CreditsLoadBGMap::
    ld   hl, Data_017_5B0F                        ;; 17:5B19 $21 $0F $5B
    ld   a, [wCreditsScratch0]                    ;; 17:5B1C $FA $00 $D0
    dec  a                                        ;; 17:5B1F $3D
    ld   e, a                                     ;; 17:5B20 $5F
    ld   d, $00                                   ;; 17:5B21 $16 $00
    add  hl, de                                   ;; 17:5B23 $19
    ld   a, [hl+]                                 ;; 17:5B24 $2A
    ld   b, a                                     ;; 17:5B25 $47
    ; Return bank to restore
    ld   a, BANK(@)                               ;; 17:5B26 $3E $17
    ldh  [hMultiPurposeF], a                      ;; 17:5B28 $E0 $E6
    ld   h, [hl]                                  ;; 17:5B2A $66
    ld   l, b                                     ;; 17:5B2B $68
    ; Source bank
    ld   a, BANK(CreditsBGMaps)                   ;; 17:5B2C $3E $23
    call CopyBGMapFromBank                        ;; 17:5B2E $CD $69 $0B
    ret                                           ;; 17:5B31 $C9

Data_017_5B32::
    db   $00, $00, $9F, $A0, $A1

func_017_5B37::
    ld   hl, Data_017_5B32                        ;; 17:5B37 $21 $32 $5B
    ld   a, [wCreditsScratch0]                    ;; 17:5B3A $FA $00 $D0
    dec  a                                        ;; 17:5B3D $3D
    srl  a                                        ;; 17:5B3E $CB $3F
    ld   d, $00                                   ;; 17:5B40 $16 $00
    ld   e, a                                     ;; 17:5B42 $5F
    add  hl, de                                   ;; 17:5B43 $19
    ld   a, [hl]                                  ;; 17:5B44 $7E
    and  a                                        ;; 17:5B45 $A7
    ret  z                                        ;; 17:5B46 $C8

    ld   [wPaletteToLoadForTileMap], a            ;; 17:5B47 $EA $D2 $DD
    ret                                           ;; 17:5B4A $C9

    ld   b, e                                     ;; 17:5B4B $43
    inc  de                                       ;; 17:5B4C $13
    rlca                                          ;; 17:5B4D $07
    add  e                                        ;; 17:5B4E $83
    inc  hl                                       ;; 17:5B4F $23
    dec  bc                                       ;; 17:5B50 $0B
    ld   d, e                                     ;; 17:5B51 $53
    rla                                           ;; 17:5B52 $17
    ld   b, a                                     ;; 17:5B53 $47

Data_017_5B54::
    db   $27, $4B, $93

Data_017_5B57::
    db   $60, $60, $61, $62, $63, $64, $65, $65, $65, $65, $64, $63, $62, $61, $60, $60

CreditsWaterSplashingHandler::
    call func_017_5B96                            ;; 17:5B67 $CD $96 $5B
    ld   a, [wD009]                               ;; 17:5B6A $FA $09 $D0
    and  a                                        ;; 17:5B6D $A7
    jr   nz, .jr_5B73                             ;; 17:5B6E $20 $03

    jp   IncrementCreditsSubsceneAndReturn        ;; 17:5B70 $C3 $D9 $4C

.jr_5B73
    ld   a, [wEntitiesPosYTable+14]               ;; 17:5B73 $FA $1E $C2
    add  $08                                      ;; 17:5B76 $C6 $08
    ld   [wEntitiesPosYTable+14], a               ;; 17:5B78 $EA $1E $C2
    ld   a, [wD00A]                               ;; 17:5B7B $FA $0A $D0
    inc  a                                        ;; 17:5B7E $3C
    ld   [wD00A], a                               ;; 17:5B7F $EA $0A $D0
    rra                                           ;; 17:5B82 $1F
    rra                                           ;; 17:5B83 $1F
    rra                                           ;; 17:5B84 $1F
    nop                                           ;; 17:5B85 $00
    and  $0F                                      ;; 17:5B86 $E6 $0F
    ld   e, a                                     ;; 17:5B88 $5F
    ld   d, $00                                   ;; 17:5B89 $16 $00
    ld   hl, Data_017_5B57                        ;; 17:5B8B $21 $57 $5B
    add  hl, de                                   ;; 17:5B8E $19
    ld   a, [hl]                                  ;; 17:5B8F $7E
    ldh  [hBaseScrollY], a                        ;; 17:5B90 $E0 $97
    call func_017_5BE2                            ;; 17:5B92 $CD $E2 $5B
    ret                                           ;; 17:5B95 $C9

func_017_5B96::
    ldh  a, [hFrameCounter]                       ;; 17:5B96 $F0 $E7
    rra                                           ;; 17:5B98 $1F
    rra                                           ;; 17:5B99 $1F
    rra                                           ;; 17:5B9A $1F
    and  $07                                      ;; 17:5B9B $E6 $07
    add  $05                                      ;; 17:5B9D $C6 $05
    ldh  [hLinkAnimationState], a                 ;; 17:5B9F $E0 $9D
    ld   a, [wD006]                               ;; 17:5BA1 $FA $06 $D0
    and  a                                        ;; 17:5BA4 $A7
    jr   nz, .jr_5BBB                             ;; 17:5BA5 $20 $14

    ld   a, $03                                   ;; 17:5BA7 $3E $03
    ld   [wD006], a                               ;; 17:5BA9 $EA $06 $D0
    ld   a, [wCreditsScratch0]                    ;; 17:5BAC $FA $00 $D0
    inc  a                                        ;; 17:5BAF $3C
    ld   [wCreditsScratch0], a                    ;; 17:5BB0 $EA $00 $D0
    cp   $03                                      ;; 17:5BB3 $FE $03
    jr   nz, .jr_5BBB                             ;; 17:5BB5 $20 $04

    xor  a                                        ;; 17:5BB7 $AF
    ld   [wCreditsScratch0], a                    ;; 17:5BB8 $EA $00 $D0

.jr_5BBB
    ldh  a, [hIsGBC]                              ;; 17:5BBB $F0 $FE
    and  a                                        ;; 17:5BBD $A7
    jp   nz, label_017_5BD0                       ;; 17:5BBE $C2 $D0 $5B

    ld   a, [wCreditsScratch0]                    ;; 17:5BC1 $FA $00 $D0
    ld   e, a                                     ;; 17:5BC4 $5F
    ld   d, $00                                   ;; 17:5BC5 $16 $00
    ld   hl, Data_017_5B54                        ;; 17:5BC7 $21 $54 $5B
    add  hl, de                                   ;; 17:5BCA $19
    ld   a, [hl]                                  ;; 17:5BCB $7E
    ld   [wBGPalette], a                          ;; 17:5BCC $EA $97 $DB
    ret                                           ;; 17:5BCF $C9

label_017_5BD0:
    ld   hl, wFarcallParams                       ;; 17:5BD0 $21 $01 $DE
    ld   a, BANK(func_020_78ED)                   ;; 17:5BD3 $3E $20
    ld   [hl+], a                                 ;; 17:5BD5 $22
    ld   a, HIGH(func_020_78ED)                   ;; 17:5BD6 $3E $78
    ld   [hl+], a                                 ;; 17:5BD8 $22
    ld   a, LOW(func_020_78ED)                    ;; 17:5BD9 $3E $ED
    ld   [hl+], a                                 ;; 17:5BDB $22
    ld   a, BANK(@)                               ;; 17:5BDC $3E $17
    ld   [hl], a                                  ;; 17:5BDE $77
    jp   Farcall                                  ;; 17:5BDF $C3 $D7 $0B

func_017_5BE2::
    ldh  a, [hBaseScrollY]                        ;; 17:5BE2 $F0 $97
    cpl                                           ;; 17:5BE4 $2F
    inc  a                                        ;; 17:5BE5 $3C
    sub  $A0                                      ;; 17:5BE6 $D6 $A0
    add  $3C                                      ;; 17:5BE8 $C6 $3C
    ldh  [hLinkPositionY], a                      ;; 17:5BEA $E0 $99
    ret                                           ;; 17:5BEC $C9

Data_017_5BED::
    db   $9C, $00, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9C, $20, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9C, $40, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9C, $60, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9C, $80, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9C, $A0, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9C, $C0, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9C, $E0, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9D, $00, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9D, $20, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9D, $40, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9D, $60, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9D, $80, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9D, $A0, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9D, $C0, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9D, $E0, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9E, $00, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9E, $20, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9E, $40, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9E, $60, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9E, $80, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9E, $A0, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9E, $C0, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9E, $E0, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9F, $00, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9F, $20, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9F, $40, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9F, $60, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9F, $80, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9F, $A0, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00
    db   $9F, $C0, $13, $A0, $A0, $A0, $A0, $A0, $A0, $80, $81, $80, $81, $80, $81, $80
    db   $81, $A0, $A0, $A0, $A0, $A0, $A0, $00, $9F, $E0, $13, $A0, $A0, $A0, $A0, $A0
    db   $A0, $90, $91, $90, $91, $90, $91, $90, $91, $A0, $A0, $A0, $A0, $A0, $A0, $00

Data_017_5EED::
    db   $00, $00, $00, $00, $00, $00, $02, $01, $00, $00, $00, $00, $01, $02, $00, $00
    db   $00, $00, $00, $00, $00

CreditsWaterMovingUpHandler::
    call func_017_5B96                            ;; 17:5F02 $CD $96 $5B
    ld   a, [wEntitiesPosYTable+14]               ;; 17:5F05 $FA $1E $C2
    add  $04                                      ;; 17:5F08 $C6 $04
    ld   [wEntitiesPosYTable+14], a               ;; 17:5F0A $EA $1E $C2
    ld   a, [wD00B]                               ;; 17:5F0D $FA $0B $D0
    inc  a                                        ;; 17:5F10 $3C
    ld   [wD00B], a                               ;; 17:5F11 $EA $0B $D0
    and  $07                                      ;; 17:5F14 $E6 $07
    jr   nz, .jr_5F23                             ;; 17:5F16 $20 $0B

    ld   a, [wD00C]                               ;; 17:5F18 $FA $0C $D0
    cp   $08                                      ;; 17:5F1B $FE $08
    jr   z, .jr_5F23                              ;; 17:5F1D $28 $04

    inc  a                                        ;; 17:5F1F $3C
    ld   [wD00C], a                               ;; 17:5F20 $EA $0C $D0

.jr_5F23
    ld   a, [wD00C]                               ;; 17:5F23 $FA $0C $D0
    ld   e, a                                     ;; 17:5F26 $5F
    ldh  a, [hBaseScrollY]                        ;; 17:5F27 $F0 $97
    add  e                                        ;; 17:5F29 $83
    ldh  [hBaseScrollY], a                        ;; 17:5F2A $E0 $97
    call func_017_5BE2                            ;; 17:5F2C $CD $E2 $5B
    ldh  a, [hLinkPositionY]                      ;; 17:5F2F $F0 $99
    cp   $F0                                      ;; 17:5F31 $FE $F0
    jr   c, .jr_5F39                              ;; 17:5F33 $38 $04

    xor  a                                        ;; 17:5F35 $AF
    ld   [wEntitiesStatusTable+15], a             ;; 17:5F36 $EA $8F $C2

.jr_5F39
    ld   a, [wD00B]                               ;; 17:5F39 $FA $0B $D0
    and  $01                                      ;; 17:5F3C $E6 $01
    ret  nz                                       ;; 17:5F3E $C0

    ld   a, [wIntroTimer]                         ;; 17:5F3F $FA $01 $D0
    cp   $20                                      ;; 17:5F42 $FE $20
    jr   nz, .jr_5F4D                             ;; 17:5F44 $20 $07

    call ResetCreditsSceneVariables               ;; 17:5F46 $CD $A5 $4D
    call IncrementCreditsSubscene                 ;; 17:5F49 $CD $D9 $4C
    ret                                           ;; 17:5F4C $C9

.jr_5F4D
    ld   e, a                                     ;; 17:5F4D $5F
    inc  a                                        ;; 17:5F4E $3C
    ld   [wIntroTimer], a                         ;; 17:5F4F $EA $01 $D0
    ld   d, $00                                   ;; 17:5F52 $16 $00
    sla  e                                        ;; 17:5F54 $CB $23
    rl   d                                        ;; 17:5F56 $CB $12
    sla  e                                        ;; 17:5F58 $CB $23
    rl   d                                        ;; 17:5F5A $CB $12
    sla  e                                        ;; 17:5F5C $CB $23
    rl   d                                        ;; 17:5F5E $CB $12
    ld   a, e                                     ;; 17:5F60 $7B
    sla  e                                        ;; 17:5F61 $CB $23
    rl   d                                        ;; 17:5F63 $CB $12
    add  e                                        ;; 17:5F65 $83
    ld   e, a                                     ;; 17:5F66 $5F
    ld   a, d                                     ;; 17:5F67 $7A
    adc  $00                                      ;; 17:5F68 $CE $00
    ld   d, a                                     ;; 17:5F6A $57
    ld   hl, Data_017_5BED                        ;; 17:5F6B $21 $ED $5B
    add  hl, de                                   ;; 17:5F6E $19
    push hl                                       ;; 17:5F6F $E5
    ld   de, wDrawCommand                         ;; 17:5F70 $11 $01 $D6
    ld   c, $18                                   ;; 17:5F73 $0E $18

.loop_5F75
    ld   a, [hl+]                                 ;; 17:5F75 $2A
    ld   [de], a                                  ;; 17:5F76 $12
    inc  de                                       ;; 17:5F77 $13
    dec  c                                        ;; 17:5F78 $0D
    jr   nz, .loop_5F75                           ;; 17:5F79 $20 $FA

    pop  hl                                       ;; 17:5F7B $E1
    ldh  a, [hIsGBC]                              ;; 17:5F7C $F0 $FE
    and  a                                        ;; 17:5F7E $A7
    ret  z                                        ;; 17:5F7F $C8

    ld   de, wDrawCommandVRAM1                    ;; 17:5F80 $11 $91 $DC
    ld   a, [hl+]                                 ;; 17:5F83 $2A
    ld   [de], a                                  ;; 17:5F84 $12
    inc  de                                       ;; 17:5F85 $13
    ld   a, [hl+]                                 ;; 17:5F86 $2A
    ld   [de], a                                  ;; 17:5F87 $12
    inc  de                                       ;; 17:5F88 $13
    ld   a, $13                                   ;; 17:5F89 $3E $13
    ld   [de], a                                  ;; 17:5F8B $12
    inc  de                                       ;; 17:5F8C $13
    ld   hl, Data_017_5EED                        ;; 17:5F8D $21 $ED $5E
    ld   c, $15                                   ;; 17:5F90 $0E $15

.loop_5F92
    ld   a, [hl+]                                 ;; 17:5F92 $2A
    ld   [de], a                                  ;; 17:5F93 $12
    inc  de                                       ;; 17:5F94 $13
    dec  c                                        ;; 17:5F95 $0D
    jr   nz, .loop_5F92                           ;; 17:5F96 $20 $FA

    ret                                           ;; 17:5F98 $C9

Data_017_5F99::
    CREDITS_FADE $27, $16, $01, $00

Data_017_5FA9::
IF __PATCH_0__
    db   $1C, $1C, $1C, $18, $08, $08, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
ELSE
    db   $1C, $1C, $1C, $1C, $1C, $1C, $18, $18, $08, $08, $08, $08, $00, $00, $00, $00
ENDC

Data_017_5FB9::
    CREDITS_FADE $90, $50, $00, $00

CreditsWaterFadeToWhiteHandler::
    ld   a, [wEntitiesPosYTable+14]               ;; 17:5FC9 $FA $1E $C2
    add  $02                                      ;; 17:5FCC $C6 $02
    ld   [wEntitiesPosYTable+14], a               ;; 17:5FCE $EA $1E $C2
    ldh  a, [hBaseScrollY]                        ;; 17:5FD1 $F0 $97
    add  $04                                      ;; 17:5FD3 $C6 $04
    ldh  [hBaseScrollY], a                        ;; 17:5FD5 $E0 $97
    ldh  a, [hFrameCounter]                       ;; 17:5FD7 $F0 $E7
    and  $07                                      ;; 17:5FD9 $E6 $07
    jr   nz, jr_017_5FFF                          ;; 17:5FDB $20 $22

    ld   a, [wD00A]                               ;; 17:5FDD $FA $0A $D0
    cp   $0C                                      ;; 17:5FE0 $FE $0C
    jr   nz, .jr_5FEF                             ;; 17:5FE2 $20 $0B

    call ResetCreditsSceneVariables               ;; 17:5FE4 $CD $A5 $4D
    ld   a, $C0                                   ;; 17:5FE7 $3E $C0
    ld   [wD006], a                               ;; 17:5FE9 $EA $06 $D0
    jp   IncrementCreditsSubscene                 ;; 17:5FEC $C3 $D9 $4C

.jr_5FEF
    inc  a                                        ;; 17:5FEF $3C
    ld   [wD00A], a                               ;; 17:5FF0 $EA $0A $D0
    ldh  a, [hIsGBC]                              ;; 17:5FF3 $F0 $FE
    and  a                                        ;; 17:5FF5 $A7
    jr   z, jr_017_5FFF                           ;; 17:5FF6 $28 $07

    ld   a, [wD00A]                               ;; 17:5FF8 $FA $0A $D0
    dec  a                                        ;; 17:5FFB $3D
    jp   func_017_7F30                            ;; 17:5FFC $C3 $30 $7F

jr_017_5FFF:
    CREDITS_MACRO_LDH_AND_LD
    ld   a, [wD00A]                               ;; 17:6004 $FA $0A $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:6008 $5F
    ld   d, $00                                   ;; 17:6009 $16 $00
    ld   hl, Data_017_5F99                        ;; 17:600B $21 $99 $5F
    add  hl, de                                   ;; 17:600E $19
    ld   a, [hl]                                  ;; 17:600F $7E
    ld   [wBGPalette], a                          ;; 17:6010 $EA $97 $DB
    ld   hl, Data_017_5FA9                        ;; 17:6013 $21 $A9 $5F
    add  hl, de                                   ;; 17:6016 $19
    ld   a, [hl]                                  ;; 17:6017 $7E
    ld   [wOBJ0Palette], a                        ;; 17:6018 $EA $98 $DB
    ld   hl, Data_017_5FB9                        ;; 17:601B $21 $B9 $5F
    add  hl, de                                   ;; 17:601E $19
    ld   a, [hl]                                  ;; 17:601F $7E
    ld   [wOBJ1Palette], a                        ;; 17:6020 $EA $99 $DB
    ret                                           ;; 17:6023 $C9

CreditsWaterNoiseFadingOutHandler::
    ld   a, [wD006]                               ;; 17:6024 $FA $06 $D0
    and  a                                        ;; 17:6027 $A7
    jr   nz, .ret_6045                            ;; 17:6028 $20 $1B

    xor  a                                        ;; 17:602A $AF
    ld   [wCreditsSubscene], a                    ;; 17:602B $EA $0E $D0
    ld   [wEntitiesStatusTable+14], a             ;; 17:602E $EA $8E $C2
    ld   [wEntitiesStatusTable+15], a             ;; 17:6031 $EA $8F $C2
    ld   [wNoiseSfxSeaWavesCounter], a            ;; 17:6034 $EA $14 $C1
    ld   a, $80                                   ;; 17:6037 $3E $80
    ld   [wD466], a                               ;; 17:6039 $EA $66 $D4
    ld   hl, wLCDControl                          ;; 17:603C $21 $FD $D6
    res  LCDCB_BG9C00, [hl]                       ;; 17:603F $CB $9E
    ld   hl, wGameplaySubtype                     ;; 17:6041 $21 $96 $DB
    inc  [hl]                                     ;; 17:6044 $34

.ret_6045
    ret                                           ;; 17:6045 $C9

CreditsLinkOnSeaLargeHandler::
    call func_017_4839                            ;; 17:6046 $CD $39 $48
    ld   de, $98E0                                ;; 17:6049 $11 $E0 $98
    call func_017_488C                            ;; 17:604C $CD $8C $48
    call AnimateEntitiesAndRestoreBank17          ;; 17:604F $CD $ED $0E
    ld   a, [wCreditsSubscene]                    ;; 17:6052 $FA $0E $D0
    JP_TABLE                                      ;; 17:6055 $C7
._00 dw LinkOnSeaLarge0Handler                    ;; 17:6056
._01 dw LinkOnSeaLarge1Handler                    ;; 17:6058
._02 dw LinkOnSeaLarge2Handler                    ;; 17:605A
._03 dw LinkOnSeaLarge3Handler                    ;; 17:605C

LinkOnSeaLarge0Handler::
    ld   a, TILESET_CREDITS_LINK_ON_SEA_LARGE     ;; 17:605E $3E $16
    ld   [wTilesetToLoad], a                      ;; 17:6060 $EA $FE $D6
    xor  a                                        ;; 17:6063 $AF
    ld   [wPaletteUnknownE], a                    ;; 17:6064 $EA $D5 $DD
    call ResetCreditsSceneVariables               ;; 17:6067 $CD $A5 $4D
    ldh  a, [hIsGBC]                              ;; 17:606A $F0 $FE
    and  a                                        ;; 17:606C $A7
    jp   z, IncrementCreditsSubscene              ;; 17:606D $CA $D9 $4C

    ld   hl, wLCDControl                          ;; 17:6070 $21 $FD $D6
    res  2, [hl]                                  ;; 17:6073 $CB $96
    jp   IncrementCreditsSubscene                 ;; 17:6075 $C3 $D9 $4C

LinkOnSeaLarge1Handler::
    ld   a, TILEMAP_CREDITS_LINK_ON_SEA_LARGE     ;; 17:6078 $3E $17
    ld   [wBGMapToLoad], a                        ;; 17:607A $EA $FF $D6

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:607D $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:607F $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:6082 $21 $00 $C2
    add  hl, de                                   ;; 17:6085 $19
    ld   [hl], $48                                ;; 17:6086 $36 $48
    ld   hl, wEntitiesPosYTable                   ;; 17:6088 $21 $10 $C2
    add  hl, de                                   ;; 17:608B $19
    ld   [hl], $60                                ;; 17:608C $36 $60
    ld   hl, wEntitiesPrivateState1Table          ;; 17:608E $21 $B0 $C2
    add  hl, de                                   ;; 17:6091 $19
    ld   [hl], $04                                ;; 17:6092 $36 $04

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:6094 $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:6096 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:6099 $21 $00 $C2
    add  hl, de                                   ;; 17:609C $19
    ld   [hl], $28                                ;; 17:609D $36 $28
    ld   hl, wEntitiesPosYTable                   ;; 17:609F $21 $10 $C2
    add  hl, de                                   ;; 17:60A2 $19
    ld   [hl], $68                                ;; 17:60A3 $36 $68
    ld   hl, wEntitiesPrivateState1Table          ;; 17:60A5 $21 $B0 $C2
    add  hl, de                                   ;; 17:60A8 $19
    ld   [hl], $05                                ;; 17:60A9 $36 $05

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:60AB $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:60AD $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:60B0 $21 $00 $C2
    add  hl, de                                   ;; 17:60B3 $19
    ld   [hl], $78                                ;; 17:60B4 $36 $78
    ld   hl, wEntitiesPosYTable                   ;; 17:60B6 $21 $10 $C2
    add  hl, de                                   ;; 17:60B9 $19
    ld   [hl], $60                                ;; 17:60BA $36 $60
    ld   hl, wEntitiesPrivateState1Table          ;; 17:60BC $21 $B0 $C2
    add  hl, de                                   ;; 17:60BF $19
    ld   [hl], $05                                ;; 17:60C0 $36 $05
    ld   hl, wEntitiesSpriteVariantTable          ;; 17:60C2 $21 $B0 $C3
    add  hl, de                                   ;; 17:60C5 $19
    inc  [hl]                                     ;; 17:60C6 $34

    jp   IncrementCreditsSubscene                 ;; 17:60C7 $C3 $D9 $4C

; Palettes indices
Data_017_60CA::
IF __PATCH_0__
    db   $00, $00, $05, $05, $19, $1A, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E
ELSE
    db   $00, $00, $00, $00, $05, $05, $05, $05, $19, $19, $1A, $1A, $1E, $1E, $1E, $1E
ENDC

; Palettes indices
Data_017_60DA::
IF __PATCH_0__
    db   $00, $00, $00, $01, $01, $51, $52, $92, $92, $92, $92, $92, $92, $92, $92, $92
ELSE
    db   $00, $00, $00, $00, $00, $01, $01, $01, $51, $51, $52, $52, $92, $92, $92, $92
ENDC

LinkOnSeaLarge2Handler::
    call ResetCreditsSceneVariables               ;; 17:60EA $CD $A5 $4D
    ld   a, $60                                   ;; 17:60ED $3E $60
    ld   [wD009], a                               ;; 17:60EF $EA $09 $D0
    jp   IncrementCreditsSubscene                 ;; 17:60F2 $C3 $D9 $4C

LinkOnSeaLarge3Handler::
    ld   a, [wD009]                               ;; 17:60F5 $FA $09 $D0
    and  a                                        ;; 17:60F8 $A7
    jr   nz, .ret_6114                            ;; 17:60F9 $20 $19

    xor  a                                        ;; 17:60FB $AF
    ld   [wCreditsSubscene], a                    ;; 17:60FC $EA $0E $D0
    ld   [wEntitiesStatusTable+12], a             ;; 17:60FF $EA $8C $C2
    ld   [wEntitiesStatusTable+13], a             ;; 17:6102 $EA $8D $C2
    ld   [wEntitiesStatusTable+14], a             ;; 17:6105 $EA $8E $C2
    ld   [wEntitiesStatusTable+15], a             ;; 17:6108 $EA $8F $C2

    ld   a, BANK(LinkOnSeaLarge3Handler)          ;; 17:610B $3E $17
    call ClearFileMenuBG_trampoline               ;; 17:610D $CD $FA $08

    ld   hl, wGameplaySubtype                     ;; 17:6110 $21 $96 $DB
    inc  [hl]                                     ;; 17:6113 $34

.ret_6114
    ret                                           ;; 17:6114 $C9

CreditsSunAboveHandler::
    call func_017_4839                            ;; 17:6115 $CD $39 $48
    call AnimateEntitiesAndRestoreBank17          ;; 17:6118 $CD $ED $0E
    ld   a, [wCreditsSubscene]                    ;; 17:611B $FA $0E $D0
    JP_TABLE                                      ;; 17:611E $C7
._00 dw CreditsSunAbove0Handler
._01 dw CreditsSunAbove1Handler
._02 dw CreditsSunAbove2Handler
._03 dw CreditsSunAbove3Handler
._04 dw CreditsSunAbove4Handler

CreditsSunAbove0Handler::
    ld   a, TILESET_CREDITS_SUN_ABOVE             ;; 17:6129 $3E $17
    ld   [wTilesetToLoad], a                      ;; 17:612B $EA $FE $D6

    ld   a, $01                                   ;; 17:612E $3E $01
    ld   [wPaletteUnknownE], a                    ;; 17:6130 $EA $D5 $DD
    xor  a                                        ;; 17:6133 $AF
    ldh  [hBaseScrollX], a                        ;; 17:6134 $E0 $96
    ldh  [hBaseScrollY], a                        ;; 17:6136 $E0 $97
    ld   [wScreenShakeHorizontal], a              ;; 17:6138 $EA $55 $C1
    ld   [wScreenShakeVertical], a                ;; 17:613B $EA $56 $C1
    ld   a, MUSIC_ENDING                          ;; 17:613E $3E $3D
    ld   [wMusicTrackToPlay], a                   ;; 17:6140 $EA $68 $D3
    call ResetCreditsSceneVariables               ;; 17:6143 $CD $A5 $4D
    jp   IncrementCreditsSubscene                 ;; 17:6146 $C3 $D9 $4C

CreditsSunAbove1Handler::
    ld   a, TILEMAP_CREDITS_SUN_ABOVE             ;; 17:6149 $3E $18
    ld   [wBGMapToLoad], a                        ;; 17:614B $EA $FF $D6

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:614E $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:6150 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:6153 $21 $00 $C2
    add  hl, de                                   ;; 17:6156 $19
    ld   [hl], $18                                ;; 17:6157 $36 $18
    ld   hl, wEntitiesPosYTable                   ;; 17:6159 $21 $10 $C2
    add  hl, de                                   ;; 17:615C $19
    ld   [hl], $20                                ;; 17:615D $36 $20
    ld   hl, wEntitiesPrivateState1Table          ;; 17:615F $21 $B0 $C2
    add  hl, de                                   ;; 17:6162 $19
    ld   [hl], $06                                ;; 17:6163 $36 $06
    ld   hl, wEntitiesSpeedXTable                 ;; 17:6165 $21 $40 $C2
    add  hl, de                                   ;; 17:6168 $19
    ld   [hl], $03                                ;; 17:6169 $36 $03

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:616B $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:616D $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:6170 $21 $00 $C2
    add  hl, de                                   ;; 17:6173 $19
    ld   [hl], $78                                ;; 17:6174 $36 $78
    ld   hl, wEntitiesPosYTable                   ;; 17:6176 $21 $10 $C2
    add  hl, de                                   ;; 17:6179 $19
    ld   [hl], $78                                ;; 17:617A $36 $78
    ld   hl, wEntitiesPrivateState1Table          ;; 17:617C $21 $B0 $C2
    add  hl, de                                   ;; 17:617F $19
    ld   [hl], $06                                ;; 17:6180 $36 $06
    ld   hl, wEntitiesSpeedXTable                 ;; 17:6182 $21 $40 $C2
    add  hl, de                                   ;; 17:6185 $19
    ld   [hl], $FD                                ;; 17:6186 $36 $FD
    ld   hl, wEntitiesSpriteVariantTable          ;; 17:6188 $21 $B0 $C3

.jr_618B
    add  hl, de                                   ;; 17:618B $19
    ld   [hl], $03                                ;; 17:618C $36 $03
    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:618E $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:6190 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:6193 $21 $00 $C2
    add  hl, de                                   ;; 17:6196 $19
    ld   [hl], $68                                ;; 17:6197 $36 $68
    ld   hl, wEntitiesPosYTable                   ;; 17:6199 $21 $10 $C2
    add  hl, de                                   ;; 17:619C $19
    ld   [hl], $60                                ;; 17:619D $36 $60
    ld   hl, wEntitiesPrivateState1Table          ;; 17:619F $21 $B0 $C2
    add  hl, de                                   ;; 17:61A2 $19
    ld   [hl], $07                                ;; 17:61A3 $36 $07
    ld   a, $60                                   ;; 17:61A5 $3E $60
    ld   [wD009], a                               ;; 17:61A7 $EA $09 $D0
    jp   IncrementCreditsSubscene                 ;; 17:61AA $C3 $D9 $4C

; Palettes indices
Data_017_61AD::
IF __PATCH_0__
    db   $00, $00, $05, $05, $05, $05, $19, $1A
    db   $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E, $1E
ELSE
    db   $00, $00, $00, $00, $05, $05, $05, $05, $05, $05, $05, $05, $19, $19, $1A, $1A
    db   $1E, $1E, $1E, $1E
ENDC

; Palettes indices
Data_017_61C1::
IF __PATCH_0__
    db   $00, $00, $00, $01, $01, $01, $01, $51, $51, $52
    db   $92, $92, $92, $92, $92, $92, $92, $92, $92, $92, $92
ELSE
    db   $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $51, $51, $51, $52
    db   $52, $92, $92, $92, $92
ENDC

CreditsSunAbove2Handler::
    ldh  a, [hFrameCounter]                       ;; 17:61D6 $F0 $E7
    and  $0F                                      ;; 17:61D8 $E6 $0F
    jr   nz, jr_017_61FE                          ;; 17:61DA $20 $22

    ld   a, [wD00A]                               ;; 17:61DC $FA $0A $D0
    cp   $10                                      ;; 17:61DF $FE $10
    jr   nz, .jr_61EE                             ;; 17:61E1 $20 $0B

    call ResetCreditsSceneVariables               ;; 17:61E3 $CD $A5 $4D
    ld   a, $60                                   ;; 17:61E6 $3E $60
    ld   [wD009], a                               ;; 17:61E8 $EA $09 $D0
    jp   IncrementCreditsSubscene                 ;; 17:61EB $C3 $D9 $4C

.jr_61EE
    inc  a                                        ;; 17:61EE $3C
    ld   [wD00A], a                               ;; 17:61EF $EA $0A $D0
    ldh  a, [hIsGBC]                              ;; 17:61F2 $F0 $FE
    and  a                                        ;; 17:61F4 $A7
    jr   z, jr_017_61FE                           ;; 17:61F5 $28 $07

    ld   a, [wD00A]                               ;; 17:61F7 $FA $0A $D0
    dec  a                                        ;; 17:61FA $3D
    jp   CreditsBlendPalettes                     ;; 17:61FB $C3 $80 $7E

jr_017_61FE:
    CREDITS_MACRO_LDH_AND_LD
    ld   a, [wD00A]                               ;; 17:6203 $FA $0A $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:6207 $5F
    ld   d, $00                                   ;; 17:6208 $16 $00
    ld   hl, Data_017_61AD                        ;; 17:620A $21 $AD $61
    add  hl, de                                   ;; 17:620D $19
    ld   a, [hl]                                  ;; 17:620E $7E
    ld   [wBGPalette], a                          ;; 17:620F $EA $97 $DB
    ld   hl, Data_017_61AD                        ;; 17:6212 $21 $AD $61
    add  hl, de                                   ;; 17:6215 $19
    ld   a, [hl]                                  ;; 17:6216 $7E
    ld   [wOBJ0Palette], a                        ;; 17:6217 $EA $98 $DB
    ld   hl, Data_017_61C1                        ;; 17:621A $21 $C1 $61
    add  hl, de                                   ;; 17:621D $19
    ld   a, [hl]                                  ;; 17:621E $7E
    ld   [wOBJ1Palette], a                        ;; 17:621F $EA $99 $DB
    ret                                           ;; 17:6222 $C9

CreditsSunAbove3Handler::
    ld   a, [wD009]                               ;; 17:6223 $FA $09 $D0
    and  a                                        ;; 17:6226 $A7
    jr   nz, .ret_622F                            ;; 17:6227 $20 $06

    call ResetCreditsSceneVariables               ;; 17:6229 $CD $A5 $4D
    jp   IncrementCreditsSubscene                 ;; 17:622C $C3 $D9 $4C

.ret_622F
    ret                                           ;; 17:622F $C9

CreditsSunAbove4Handler::
    call ResetCreditsSceneVariables               ;; 17:6230 $CD $A5 $4D
    xor  a                                        ;; 17:6233 $AF
    ld   [wCreditsSubscene], a                    ;; 17:6234 $EA $0E $D0
    ld   [wEntitiesStatusTable+13], a             ;; 17:6237 $EA $8D $C2
    ld   [wEntitiesStatusTable+14], a             ;; 17:623A $EA $8E $C2
    ld   [wEntitiesStatusTable+15], a             ;; 17:623D $EA $8F $C2
    ld   a, $17                                   ;; 17:6240 $3E $17
    call ClearFileMenuBG_trampoline               ;; 17:6242 $CD $FA $08
    ld   hl, wGameplaySubtype                     ;; 17:6245 $21 $96 $DB
    inc  [hl]                                     ;; 17:6248 $34
    ret                                           ;; 17:6249 $C9

CreditsLinkOnSeaCloseHandler::
    call func_017_4839                            ;; 17:624A $CD $39 $48
    ld   de, $98E0                                ;; 17:624D $11 $E0 $98
    call func_017_488C                            ;; 17:6250 $CD $8C $48
    call AnimateEntitiesAndRestoreBank17          ;; 17:6253 $CD $ED $0E
    ld   a, [wD00F]                               ;; 17:6256 $FA $0F $D0
    inc  a                                        ;; 17:6259 $3C
    ld   [wD00F], a                               ;; 17:625A $EA $0F $D0
    cp   $05                                      ;; 17:625D $FE $05
    jr   c, jr_017_6271                           ;; 17:625F $38 $10

    xor  a                                        ;; 17:6261 $AF
    ld   [wD00F], a                               ;; 17:6262 $EA $0F $D0
    ld   a, [wD00A]                               ;; 17:6265 $FA $0A $D0
    inc  a                                        ;; 17:6268 $3C
    cp   $2B                                      ;; 17:6269 $FE $2B
    jr   nz, .jr_626E                             ;; 17:626B $20 $01

    xor  a                                        ;; 17:626D $AF

.jr_626E
    ld   [wD00A], a                               ;; 17:626E $EA $0A $D0

jr_017_6271:
    ld   a, [wD00A]                               ;; 17:6271 $FA $0A $D0
    ld   e, a                                     ;; 17:6274 $5F
    ld   d, $00                                   ;; 17:6275 $16 $00
    ld   hl, Data_017_634C                        ;; 17:6277 $21 $4C $63
    add  hl, de                                   ;; 17:627A $19
    ld   a, [hl]                                  ;; 17:627B $7E
    add  $00                                      ;; 17:627C $C6 $00
    ld   [wCreditsScratch0], a                    ;; 17:627E $EA $00 $D0
    call func_017_7971                            ;; 17:6281 $CD $71 $79
    ld   a, [wCreditsSubscene]                    ;; 17:6284 $FA $0E $D0
    JP_TABLE                                      ;; 17:6287
._00 dw func_017_6292                             ;; 17:6288
._01 dw func_017_629E                             ;; 17:628A
._02 dw func_017_63BC                             ;; 17:628C
._03 dw func_017_6476                             ;; 17:628E
._04 dw func_017_64D8                             ;; 17:6290

func_017_6292::
    ld   a, TILESET_CREDITS_LINK_ON_SEA_CLOSE     ;; 17:6292 $3E $18
    ld   [wTilesetToLoad], a                      ;; 17:6294 $EA $FE $D6
    xor  a                                        ;; 17:6297 $AF
    ld   [wPaletteUnknownE], a                    ;; 17:6298 $EA $D5 $DD
    jp   IncrementCreditsSubscene                 ;; 17:629B $C3 $D9 $4C

func_017_629E::
    ld   a, TILEMAP_CREDITS_LINK_ON_SEA_CLOSE     ;; 17:629E $3E $19
    ld   [wBGMapToLoad], a                        ;; 17:62A0 $EA $FF $D6
    ; Enable LCD STAT interrupt
    ld   hl, rIE                                  ;; 17:62A3 $21 $FF $FF
    set  IEB_STAT, [hl]                           ;; 17:62A6 $CB $CE
    ld   a, $42                                   ;; 17:62A8 $3E $42
    ldh  [rLYC], a                                ;; 17:62AA $E0 $45

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:62AC $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:62AE $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:62B1 $21 $00 $C2
    add  hl, de                                   ;; 17:62B4 $19
    ld   [hl], $18                                ;; 17:62B5 $36 $18
    ld   hl, wEntitiesPosYTable                   ;; 17:62B7 $21 $10 $C2
    add  hl, de                                   ;; 17:62BA $19
    ld   [hl], $55                                ;; 17:62BB $36 $55
    ld   hl, wEntitiesPrivateState1Table          ;; 17:62BD $21 $B0 $C2
    add  hl, de                                   ;; 17:62C0 $19
    ld   [hl], $08                                ;; 17:62C1 $36 $08
    ld   hl, wEntitiesSpriteVariantTable          ;; 17:62C3 $21 $B0 $C3
    add  hl, de                                   ;; 17:62C6 $19
    ld   [hl], $02                                ;; 17:62C7 $36 $02

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:62C9 $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:62CB $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:62CE $21 $00 $C2
    add  hl, de                                   ;; 17:62D1 $19
    ld   [hl], $68                                ;; 17:62D2 $36 $68
    ld   hl, wEntitiesPosYTable                   ;; 17:62D4 $21 $10 $C2
    add  hl, de                                   ;; 17:62D7 $19
    ld   [hl], $58                                ;; 17:62D8 $36 $58
    ld   hl, wEntitiesPrivateState1Table          ;; 17:62DA $21 $B0 $C2
    add  hl, de                                   ;; 17:62DD $19
    ld   [hl], $08                                ;; 17:62DE $36 $08
    ld   hl, wEntitiesSpriteVariantTable          ;; 17:62E0 $21 $B0 $C3
    add  hl, de                                   ;; 17:62E3 $19
    inc  [hl]                                     ;; 17:62E4 $34

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:62E5 $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:62E7 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:62EA $21 $00 $C2
    add  hl, de                                   ;; 17:62ED $19
    ld   [hl], $88                                ;; 17:62EE $36 $88
    ld   hl, wEntitiesPosYTable                   ;; 17:62F0 $21 $10 $C2
    add  hl, de                                   ;; 17:62F3 $19
    ld   [hl], $60                                ;; 17:62F4 $36 $60
    ld   hl, wEntitiesPrivateState1Table          ;; 17:62F6 $21 $B0 $C2
    add  hl, de                                   ;; 17:62F9 $19
    ld   [hl], $08                                ;; 17:62FA $36 $08

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:62FC $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:62FE $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:6301 $21 $00 $C2
    add  hl, de                                   ;; 17:6304 $19
    ld   [hl], $08                                ;; 17:6305 $36 $08
    ld   hl, wEntitiesPosYTable                   ;; 17:6307 $21 $10 $C2
    add  hl, de                                   ;; 17:630A $19
    ld   [hl], $50                                ;; 17:630B $36 $50
    ld   hl, wEntitiesPrivateState1Table          ;; 17:630D $21 $B0 $C2
    add  hl, de                                   ;; 17:6310 $19
    ld   [hl], $09                                ;; 17:6311 $36 $09
    ld   hl, wEntitiesSpeedXTable                 ;; 17:6313 $21 $40 $C2
    add  hl, de                                   ;; 17:6316 $19
    ld   [hl], $08                                ;; 17:6317 $36 $08
    ld   hl, wEntitiesSpeedYTable                 ;; 17:6319 $21 $50 $C2
    add  hl, de                                   ;; 17:631C $19
    ld   [hl], $F8                                ;; 17:631D $36 $F8
    call ResetCreditsSceneVariables               ;; 17:631F $CD $A5 $4D
    ld   a, $50                                   ;; 17:6322 $3E $50
    ld   [wD009], a                               ;; 17:6324 $EA $09 $D0
    ldh  a, [hIsGBC]                              ;; 17:6327 $F0 $FE
    and  a                                        ;; 17:6329 $A7
    jp   z, IncrementCreditsSubscene              ;; 17:632A $CA $D9 $4C

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:632D $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:632F $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:6332 $21 $00 $C2
    add  hl, de                                   ;; 17:6335 $19
    ld   [hl], $40                                ;; 17:6336 $36 $40
    ld   hl, wEntitiesPosYTable                   ;; 17:6338 $21 $10 $C2
    add  hl, de                                   ;; 17:633B $19
    ld   [hl], $70                                ;; 17:633C $36 $70
    ld   hl, wEntitiesPrivateState1Table          ;; 17:633E $21 $B0 $C2
    add  hl, de                                   ;; 17:6341 $19
    ld   [hl], $11                                ;; 17:6342 $36 $11
    ld   hl, wLCDControl                          ;; 17:6344 $21 $FD $D6
    res  LCDCB_OBJ16, [hl]                        ;; 17:6347 $CB $96
    jp   IncrementCreditsSubscene                 ;; 17:6349 $C3 $D9 $4C

Data_017_634C::
    db   $00, $00, $00, $00, $01, $01, $01, $02, $02, $03, $03, $04, $05, $06, $07, $08
    db   $09, $0A, $0A, $0B, $0B, $0C, $0C, $0C, $0B, $0B, $0A, $0A, $09, $08, $07, $06
    db   $05, $04, $03, $03, $02, $02, $01, $01, $01, $00, $00, $00, $00, $00, $00, $00

Data_017_637C::
    db   $0D, $4C, $4D, $4E, $4F, $4C, $4D, $4E, $4F, $4C, $4D, $4E, $4F, $4C, $4D, $00
    db   $0D, $5C, $5D, $5E, $5F, $5C, $5D, $5E, $5F, $5C, $5D, $5E, $5F, $5C, $5D, $00
    db   $0D, $6C, $6D, $6E, $6F, $6C, $6D, $6E, $6F, $6C, $6D, $6E, $6F, $6C, $6D, $00
    db   $0D, $7C, $7D, $7E, $7F, $7C, $7D, $7E, $7F, $7C, $7D, $7E, $7F, $7C, $7D, $00

func_017_63BC::
    ldh  a, [hFrameCounter]                       ;; 17:63BC $F0 $E7
    and  $07                                      ;; 17:63BE $E6 $07
    jr   nz, jr_017_63EE                          ;; 17:63C0 $20 $2C

    ld   hl, wDrawCommand                         ;; 17:63C2 $21 $01 $D6
    ld   a, $9A                                   ;; 17:63C5 $3E $9A
    ld   [hl+], a                                 ;; 17:63C7 $22
    ld   a, $23                                   ;; 17:63C8 $3E $23
    ld   [hl+], a                                 ;; 17:63CA $22
    ld   a, [wD00B]                               ;; 17:63CB $FA $0B $D0
    inc  a                                        ;; 17:63CE $3C
    and  $03                                      ;; 17:63CF $E6 $03
    ld   [wD00B], a                               ;; 17:63D1 $EA $0B $D0
    rla                                           ;; 17:63D4 $17
    rla                                           ;; 17:63D5 $17
    rla                                           ;; 17:63D6 $17
    rla                                           ;; 17:63D7 $17
    and  $F0                                      ;; 17:63D8 $E6 $F0
    ld   e, a                                     ;; 17:63DA $5F
    ld   d, $00                                   ;; 17:63DB $16 $00
    ld   hl, Data_017_637C                        ;; 17:63DD $21 $7C $63
    add  hl, de                                   ;; 17:63E0 $19
    ld   de, wDrawCommand.length                  ;; 17:63E1 $11 $03 $D6
    ld   c, $10                                   ;; 17:63E4 $0E $10

.loop_63E6
    ld   a, [hl+]                                 ;; 17:63E6 $2A
    ld   [de], a                                  ;; 17:63E7 $12
    inc  de                                       ;; 17:63E8 $13
    dec  c                                        ;; 17:63E9 $0D
    jr   nz, .loop_63E6                           ;; 17:63EA $20 $FA

    jr   jr_017_63F1                              ;; 17:63EC $18 $03

jr_017_63EE:
    call func_017_67CA                            ;; 17:63EE $CD $CA $67

jr_017_63F1:
    ld   a, [wIntroTimer]                         ;; 17:63F1 $FA $01 $D0
    JP_TABLE                                      ;; 17:63F4 $C7
._00 dw func_017_63FB                             ;; 17:63F5
._01 dw func_017_641E                             ;; 17:63F7
._02 dw func_017_6447                             ;; 17:63F9

func_017_63FB::
    ld   a, [wD009]                               ;; 17:63FB $FA $09 $D0
    and  a                                        ;; 17:63FE $A7
    jr   nz, ret_017_6405                         ;; 17:63FF $20 $04

label_017_6401:
    ld   hl, wIntroTimer                          ;; 17:6401 $21 $01 $D0
    inc  [hl]                                     ;; 17:6404 $34

ret_017_6405:
    ret                                           ;; 17:6405 $C9

Data_017_6406::
    db   $01, $00, $01, $02, $01, $02, $03, $04, $05, $06, $07, $08

Data_017_6412::
    db   $20, $18, $20, $18, $18, $18, $20, $40, $0C, $0C, $0C, $40

func_017_641E::
    ld   a, [wD006]                               ;; 17:641E $FA $06 $D0
    and  a                                        ;; 17:6421 $A7
    jr   nz, ret_017_6446                         ;; 17:6422 $20 $22

    ld   a, [wD00D]                               ;; 17:6424 $FA $0D $D0
    ld   e, a                                     ;; 17:6427 $5F
    ld   d, $00                                   ;; 17:6428 $16 $00
    ld   hl, Data_017_6406                        ;; 17:642A $21 $06 $64
    add  hl, de                                   ;; 17:642D $19

.jr_642E
    ld   a, [hl]                                  ;; 17:642E $7E
    ld   [wIntroSubTimer], a                      ;; 17:642F $EA $02 $D0
    ld   hl, Data_017_6412                        ;; 17:6432 $21 $12 $64
    add  hl, de                                   ;; 17:6435 $19
    ld   a, [hl]                                  ;; 17:6436 $7E
    ld   [wD006], a                               ;; 17:6437 $EA $06 $D0
    ld   a, e                                     ;; 17:643A $7B
    inc  a                                        ;; 17:643B $3C
    ld   [wD00D], a                               ;; 17:643C $EA $0D $D0
    cp   $0C                                      ;; 17:643F $FE $0C
    jr   nz, ret_017_6446                         ;; 17:6441 $20 $03

    jp   label_017_6401                           ;; 17:6443 $C3 $01 $64

ret_017_6446:
    ret                                           ;; 17:6446 $C9

func_017_6447::
    ld   a, [wD006]                               ;; 17:6447 $FA $06 $D0
    and  a                                        ;; 17:644A $A7
    jr   nz, .ret_6455                            ;; 17:644B $20 $08

    xor  a                                        ;; 17:644D $AF
    ld   [wD005], a                               ;; 17:644E $EA $05 $D0
    call IncrementCreditsSubscene                 ;; 17:6451 $CD $D9 $4C
    ret                                           ;; 17:6454 $C9

.ret_6455
    ret                                           ;; 17:6455 $C9

; Palettes indices
Data_017_6456::
IF __PATCH_0__
    db   $1E, $1E, $1A, $19, $05, $05, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
ELSE
    db   $1E, $1E, $1E, $1E, $1A, $1A, $19, $19, $05, $05, $05, $05, $00, $00, $00, $00
ENDC

; Palettes indices
Data_017_6466::
IF __PATCH_0__
    db   $92, $92, $92, $51, $41, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
ELSE
    db   $92, $92, $92, $92, $92, $92, $51, $51, $41, $41, $00, $00, $00, $00, $00, $00
ENDC

func_017_6476::
    ld   a, [wD01F]                               ;; 17:6476 $FA $1F $D0
    and  a                                        ;; 17:6479 $A7
    jp   nz, func_017_7F30                        ;; 17:647A $C2 $30 $7F

    ldh  a, [hFrameCounter]                       ;; 17:647D $F0 $E7
    and  $07                                      ;; 17:647F $E6 $07
    jr   nz, jr_017_64B3                          ;; 17:6481 $20 $30

    ld   a, [wD005]                               ;; 17:6483 $FA $05 $D0
    cp   $0C                                      ;; 17:6486 $FE $0C
    jr   nz, .jr_649C                             ;; 17:6488 $20 $12

    ld   a, $C0                                   ;; 17:648A $3E $C0
    ld   [wD006], a                               ;; 17:648C $EA $06 $D0
    xor  a                                        ;; 17:648F $AF
    ld   [wBGPalette], a                          ;; 17:6490 $EA $97 $DB
    ld   [wOBJ0Palette], a                        ;; 17:6493 $EA $98 $DB
    ld   [wOBJ1Palette], a                        ;; 17:6496 $EA $99 $DB
    jp   IncrementCreditsSubscene                 ;; 17:6499 $C3 $D9 $4C

.jr_649C
    inc  a                                        ;; 17:649C $3C
    ld   [wD005], a                               ;; 17:649D $EA $05 $D0
    ldh  a, [hIsGBC]                              ;; 17:64A0 $F0 $FE
    and  a                                        ;; 17:64A2 $A7
    jr   z, jr_017_64B3                           ;; 17:64A3 $28 $0E

    ld   a, [wD005]                               ;; 17:64A5 $FA $05 $D0
    dec  a                                        ;; 17:64A8 $3D
    and  $01                                      ;; 17:64A9 $E6 $01
    ret  nz                                       ;; 17:64AB $C0

    ld   hl, wD01F                                ;; 17:64AC $21 $1F $D0
    inc  [hl]                                     ;; 17:64AF $34
    jp   func_017_7F30                            ;; 17:64B0 $C3 $30 $7F

jr_017_64B3:
    CREDITS_MACRO_LDH_AND_LD
    ld   a, [wD005]                               ;; 17:64B8 $FA $05 $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:64BC $5F
    ld   d, $00                                   ;; 17:64BD $16 $00
    ld   hl, Data_017_6456                        ;; 17:64BF $21 $56 $64
    add  hl, de                                   ;; 17:64C2 $19
    ld   a, [hl]                                  ;; 17:64C3 $7E
    ld   [wBGPalette], a                          ;; 17:64C4 $EA $97 $DB
    ld   hl, Data_017_6456                        ;; 17:64C7 $21 $56 $64
    add  hl, de                                   ;; 17:64CA $19
    ld   a, [hl]                                  ;; 17:64CB $7E
    ld   [wOBJ0Palette], a                        ;; 17:64CC $EA $98 $DB
    ld   hl, Data_017_6466                        ;; 17:64CF $21 $66 $64
    add  hl, de                                   ;; 17:64D2 $19
    ld   a, [hl]                                  ;; 17:64D3 $7E
    ld   [wOBJ1Palette], a                        ;; 17:64D4 $EA $99 $DB
    ret                                           ;; 17:64D7 $C9

func_017_64D8::
    ld   a, [wD006]                               ;; 17:64D8 $FA $06 $D0
    and  a                                        ;; 17:64DB $A7
    jr   nz, TransitionToNextEndingScene.return   ;; 17:64DC $20 $3F

; Cleanup state, and increment wGameplaySubtype to move to the next scene.
TransitionToNextEndingScene::
    xor  a                                        ;; 17:64DE $AF
    ld   [wCreditsSubscene], a                    ;; 17:64DF $EA $0E $D0
    ld   [wEntitiesStatusTable+7], a              ;; 17:64E2 $EA $87 $C2
    ld   [wEntitiesStatusTable+8], a              ;; 17:64E5 $EA $88 $C2
    ld   [wEntitiesStatusTable+9], a              ;; 17:64E8 $EA $89 $C2
    ld   [wEntitiesStatusTable+10], a             ;; 17:64EB $EA $8A $C2
    ld   [wEntitiesStatusTable+11], a             ;; 17:64EE $EA $8B $C2
    ld   [wEntitiesStatusTable+12], a             ;; 17:64F1 $EA $8C $C2
    ld   [wEntitiesStatusTable+13], a             ;; 17:64F4 $EA $8D $C2
    ld   [wEntitiesStatusTable+14], a             ;; 17:64F7 $EA $8E $C2
    ld   [wEntitiesStatusTable+15], a             ;; 17:64FA $EA $8F $C2
    ldh  [hBaseScrollY], a                        ;; 17:64FD $E0 $97
    ld   [wD00F], a                               ;; 17:64FF $EA $0F $D0
    ld   [wD00F], a                               ;; 17:6502 $EA $0F $D0

    call ResetCreditsSceneVariables               ;; 17:6505 $CD $A5 $4D

    ; Disable LCD STAT interrupt
    ld   hl, rIE                                  ;; 17:6508 $21 $FF $FF
    res  IEB_STAT, [hl]                           ;; 17:650B $CB $8E

    ; Set OAM size to 8x16
    ld   hl, wLCDControl                          ;; 17:650D $21 $FD $D6
    set  LCDCB_OBJ16, [hl]                        ;; 17:6510 $CB $D6

    ld   hl, wGameplaySubtype                     ;; 17:6512 $21 $96 $DB
    inc  [hl]                                     ;; 17:6515 $34

    ; When reaching the last scene, reset to the first one
    ld   a, [hl]                                  ;; 17:6516 $7E
    cp   $0A                                      ;; 17:6517 $FE $0A
    jr   nz, .return                              ;; 17:6519 $20 $02
    ld   [hl], $00                                ;; 17:651B $36 $00

.return
    ret                                           ;; 17:651D $C9

Data_017_651E::
    db   $99, $46, $05, $AC, $AC, $AC, $AC, $AC   ;; 17:651E
    db   $AC, $99, $66, $05, $AC, $AC, $86, $87   ;; 17:6526
    db   $88, $89, $99, $86, $05, $94, $95, $96   ;; 17:652E
    db   $97, $98, $99, $99, $A6, $05, $A4, $A5   ;; 17:6536
    db   $A6, $A7, $A8, $A9, $99, $C6, $05, $B4   ;; 17:653E
    db   $B5, $B6, $B7, $B8, $B9, $99, $E6, $05   ;; 17:6546
    db   $C4, $C5, $C6, $C7, $C8, $C9

Data_017_6554::
    db   $99, $46                                 ;; 17:6554
    db   $05, $AC, $AC, $AC, $AC, $AC, $AC, $99   ;; 17:6556
    db   $66, $05, $AC, $AC, $86, $87, $88, $89   ;; 17:655E
    db   $99, $86, $05, $94, $95, $96, $97, $98   ;; 17:6566
    db   $99, $99, $A6, $05, $A4, $A5, $A6, $A7   ;; 17:656E
    db   $A8, $A9, $99, $C6, $05, $B4, $B5, $8A   ;; 17:6576
    db   $8B, $B8, $B9, $99, $E6, $05, $C4, $C5   ;; 17:657E
    db   $9A, $9B, $C8, $C9

Data_017_658A::
    db   $99, $46, $05, $AC                       ;; 17:658A
    db   $AC, $AC, $AC, $AC, $AC, $99, $66, $05   ;; 17:658E
    db   $AC, $AC, $86, $87, $88, $89, $99, $86   ;; 17:6596
    db   $05, $94, $95, $96, $97, $98, $99, $99   ;; 17:659E
    db   $A6, $05, $A4, $A5, $A6, $A7, $A8, $A9   ;; 17:65A6
    db   $99, $C6, $05, $B4, $B5, $8C, $8D, $B8   ;; 17:65AE
    db   $B9, $99, $E6, $05, $C4, $C5, $9C, $C7   ;; 17:65B6
    db   $C8, $C9

Data_017_65C0::
    db   $99, $46, $05, $AC, $AC, $AC             ;; 17:65C0
    db   $AC, $AC, $AC, $99, $66, $05, $AC, $AC   ;; 17:65C6
    db   $86, $87, $88, $89, $99, $86, $05, $94   ;; 17:65CE
    db   $95, $96, $97, $98, $99, $99, $A6, $05   ;; 17:65D6
    db   $A4, $A5, $A6, $A7, $A8, $A9, $99, $C6   ;; 17:65DE
    db   $05, $B4, $B5, $8E, $8F, $B8, $B9, $99   ;; 17:65E6
    db   $E6, $05, $C4, $C5, $9E, $C7, $C8, $C9   ;; 17:65EE

Data_017_65F6::
    db   $99, $46, $05, $AC, $AC, $AC, $AC, $AC   ;; 17:65F6
    db   $AC, $99, $66, $05, $AC, $AC, $86, $87   ;; 17:65FE
    db   $88, $89, $99, $86, $05, $94, $95, $96   ;; 17:6606
    db   $97, $98, $99, $99, $A6, $05, $A4, $A5   ;; 17:660E
    db   $A6, $A7, $A8, $A9, $99, $C6, $05, $B4   ;; 17:6616
    db   $B5, $E9, $EA, $B8, $B9, $99, $E6, $05   ;; 17:661E
    db   $C4, $C5, $F9, $C7, $C8, $C9

Data_017_662C::
    db   $99, $46                                 ;; 17:662C
    db   $05, $AC, $AC, $AC, $AC, $AC, $AC, $99   ;; 17:662E
    db   $66, $05, $AC, $AC, $86, $87, $88, $89   ;; 17:6636
    db   $99, $86, $05, $94, $95, $96, $97, $98   ;; 17:663E
    db   $99, $99, $A6, $05, $A4, $A5, $A6, $A7   ;; 17:6646
    db   $A8, $A9, $99, $C6, $05, $B4, $B5, $EB   ;; 17:664E
    db   $EC, $B8, $B9, $99, $E6, $05, $C4, $C5   ;; 17:6656
    db   $FB, $C7, $C8, $C9

Data_017_6662::
    db   $99, $46, $05, $AC                       ;; 17:6662
    db   $AC, $AC, $AC, $AC, $AC, $99, $66, $05   ;; 17:6666
    db   $AC, $AC, $86, $87, $88, $89, $99, $86   ;; 17:666E
    db   $05, $94, $95, $96, $97, $98, $99, $99   ;; 17:6676
    db   $A6, $05, $A4, $A5, $A6, $A7, $A8, $A9   ;; 17:667E
    db   $99, $C6, $05, $B4, $B5, $ED, $EE, $B8   ;; 17:6686
    db   $B9, $99, $E6, $05, $C4, $C5, $FB, $C7   ;; 17:668E
    db   $C8, $C9

Data_017_6698::
    db   $99, $46, $05, $AC, $AC, $AC             ;; 17:6698
    db   $AC, $AC, $AC, $99, $66, $05, $00, $01   ;; 17:669E
    db   $02, $03, $04, $AC, $99, $86, $05, $10   ;; 17:66A6
    db   $11, $12, $13, $14, $15, $99, $A6, $05   ;; 17:66AE
    db   $20, $21, $22, $23, $24, $25, $99, $C6   ;; 17:66B6
    db   $05, $30, $31, $32, $33, $34, $35, $99   ;; 17:66BE
    db   $E6, $05, $40, $41, $42, $43, $44, $C9   ;; 17:66C6

Data_017_66CE::
    db   $99, $46, $05, $0C, $0D, $1C, $1D, $AC   ;; 17:66CE
    db   $AC, $99, $66, $05, $06, $07, $08, $09   ;; 17:66D6
    db   $0A, $AC, $99, $86, $05, $16, $17, $18   ;; 17:66DE
    db   $19, $1A, $1B, $99, $A6, $05, $26, $27   ;; 17:66E6
    db   $28, $29, $2A, $2B, $99, $C6, $05, $36   ;; 17:66EE
    db   $37, $38, $39, $3A, $3B, $99, $E6, $05   ;; 17:66F6
    db   $46, $47, $48, $49, $4A, $C9             ;; 17:66FE

Data_017_6704::
    dw   Data_017_651E
    dw   Data_017_6554
    dw   Data_017_658A
    dw   Data_017_65C0
    dw   Data_017_65F6
    dw   Data_017_662C
    dw   Data_017_6662
    dw   Data_017_6698
    dw   Data_017_66CE

Data_017_6716::
    db   $99, $46, $05, $04, $04, $04, $04, $04   ;; 17:6716
    db   $04, $99, $66, $05, $04, $04, $03, $03   ;; 17:671E
    db   $03, $03, $99, $86, $05, $01, $01, $01   ;; 17:6726
    db   $05, $05, $03, $99, $A6, $05, $01, $01   ;; 17:672E
    db   $05, $05, $05, $02, $99, $C6, $05, $01   ;; 17:6736
    db   $01, $05, $05, $01, $02, $99, $E6, $05   ;; 17:673E
    db   $02, $02, $05, $05, $02, $02

Data_017_674C::
    db   $99, $46, $05, $04, $04, $04, $04, $04   ;; 17:674C
    db   $04, $99, $66, $05, $01, $07, $03, $03   ;; 17:6754
    db   $03, $03, $99, $86, $05, $01, $01, $01   ;; 17:675C
    db   $01, $05, $03, $99, $A6, $05, $01, $01   ;; 17:6764
    db   $05, $05, $05, $02, $99, $C6, $05, $07   ;; 17:676C
    db   $07, $05, $05, $05, $02, $99, $E6, $05   ;; 17:6774
    db   $02, $02, $02, $02, $02, $02             ;; 17:677C

Data_017_6782::
    db   $99, $46, $05, $07, $01, $07, $07, $04   ;; 17:6782
    db   $04, $99, $66, $05, $01, $01, $01, $01   ;; 17:678A
    db   $07, $04, $99, $86, $05, $01, $05, $05   ;; 17:6792
    db   $01, $07, $03, $99, $A6, $05, $01, $05   ;; 17:679A
    db   $05, $05, $07, $02, $99, $C6, $05, $07   ;; 17:67A2
    db   $05, $05, $05, $05, $02, $99, $E6, $05   ;; 17:67AA
    db   $02, $02, $02, $02, $02, $02             ;; 17:67B2

Data_017_67B8::
    dw   Data_017_6716
    dw   Data_017_6716
    dw   Data_017_6716
    dw   Data_017_6716
    dw   Data_017_6716
    dw   Data_017_6716
    dw   Data_017_6716
    dw   Data_017_674C
    dw   Data_017_6782

func_017_67CA::
    ldh  a, [hFrameCounter]                       ;; 17:67CA $F0 $E7
    and  $01                                      ;; 17:67CC $E6 $01
    cp   $01                                      ;; 17:67CE $FE $01
    jr   nz, ret_017_6808                         ;; 17:67D0 $20 $36

    ld   a, [wIntroSubTimer]                      ;; 17:67D2 $FA $02 $D0
    sla  a                                        ;; 17:67D5 $CB $27
    ld   e, a                                     ;; 17:67D7 $5F
    ld   d, $00                                   ;; 17:67D8 $16 $00
    push de                                       ;; 17:67DA $D5
    ld   hl, Data_017_6704                        ;; 17:67DB $21 $04 $67
    add  hl, de                                   ;; 17:67DE $19
    ld   a, [hl+]                                 ;; 17:67DF $2A
    ld   h, [hl]                                  ;; 17:67E0 $66
    ld   l, a                                     ;; 17:67E1 $6F
    ld   de, wDrawCommand                         ;; 17:67E2 $11 $01 $D6
    ld   c, $36                                   ;; 17:67E5 $0E $36

.loop_67E7
    ld   a, [hl+]                                 ;; 17:67E7 $2A
    ld   [de], a                                  ;; 17:67E8 $12
    inc  de                                       ;; 17:67E9 $13
    dec  c                                        ;; 17:67EA $0D
    jr   nz, .loop_67E7                           ;; 17:67EB $20 $FA

    xor  a                                        ;; 17:67ED $AF
    ld   [de], a                                  ;; 17:67EE $12
    pop  de                                       ;; 17:67EF $D1
    ldh  a, [hIsGBC]                              ;; 17:67F0 $F0 $FE
    and  a                                        ;; 17:67F2 $A7
    ret  z                                        ;; 17:67F3 $C8

    ld   hl, Data_017_67B8                        ;; 17:67F4 $21 $B8 $67
    add  hl, de                                   ;; 17:67F7 $19
    ld   a, [hl+]                                 ;; 17:67F8 $2A
    ld   h, [hl]                                  ;; 17:67F9 $66
    ld   l, a                                     ;; 17:67FA $6F
    ld   de, wDrawCommandVRAM1                    ;; 17:67FB $11 $91 $DC
    ld   c, $36                                   ;; 17:67FE $0E $36

.loop_6800
    ld   a, [hl+]                                 ;; 17:6800 $2A
    ld   [de], a                                  ;; 17:6801 $12
    inc  de                                       ;; 17:6802 $13
    dec  c                                        ;; 17:6803 $0D
    jr   nz, .loop_6800                           ;; 17:6804 $20 $FA

    xor  a                                        ;; 17:6806 $AF
    ld   [de], a                                  ;; 17:6807 $12

ret_017_6808:
    ret                                           ;; 17:6808 $C9

CreditsLinkSeatedOnLogHandler::
    call AnimateEntitiesAndRestoreBank17          ;; 17:6809 $CD $ED $0E
    ld   a, [wCreditsSubscene]                    ;; 17:680C $FA $0E $D0
    JP_TABLE                                      ;; 17:680F $C7
._00 dw LinkSeatedOnLog0Handler                   ;; 17:6810
._01 dw LinkSeatedOnLog1Handler                   ;; 17:6812
._02 dw LinkSeatedOnLog2Handler                   ;; 17:6814
._03 dw LinkSeatedOnLog3Handler                   ;; 17:6816
._04 dw LinkSeatedOnLog4Handler                   ;; 17:6818
._05 dw LinkSeatedOnLog5Handler                   ;; 17:681A
._06 dw LinkSeatedOnLog6Handler                   ;; 17:681C
._07 dw LinkSeatedOnLog7Handler                   ;; 17:681E
._08 dw LinkSeatedOnLog8Handler                   ;; 17:6820

LinkSeatedOnLog0Handler::
    ld   a, TILESET_CREDITS_LINK_SEATED_ON_LOG    ;; 17:6822 $3E $19
    ld   [wTilesetToLoad], a                      ;; 17:6824 $EA $FE $D6
    ld   a, $01                                   ;; 17:6827 $3E $01
    ld   [wPaletteUnknownE], a                    ;; 17:6829 $EA $D5 $DD
    jp   IncrementCreditsSubscene                 ;; 17:682C $C3 $D9 $4C

LinkSeatedOnLog1Handler::
    ld   a, TILEMAP_CREDITS_LINK_SEATED_ON_LOG    ;; 17:682F $3E $1A
    ld   [wBGMapToLoad], a                        ;; 17:6831 $EA $FF $D6

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:6834 $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:6836 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:6839 $21 $00 $C2
    add  hl, de                                   ;; 17:683C $19
    ld   [hl], $40                                ;; 17:683D $36 $40
    ld   hl, wEntitiesPosYTable                   ;; 17:683F $21 $10 $C2
    add  hl, de                                   ;; 17:6842 $19
    ld   [hl], $4E                                ;; 17:6843 $36 $4E
    ld   hl, wEntitiesPrivateState1Table          ;; 17:6845 $21 $B0 $C2
    add  hl, de                                   ;; 17:6848 $19
    ld   [hl], $0A                                ;; 17:6849 $36 $0A
    jp   IncrementCreditsSubscene                 ;; 17:684B $C3 $D9 $4C

LinkSeatedOnLog2Handler::
    ld   de, $9960                                ;; 17:684E $11 $60 $99
    call func_017_488C                            ;; 17:6851 $CD $8C $48
    ldh  a, [hFrameCounter]                       ;; 17:6854 $F0 $E7
    and  $03                                      ;; 17:6856 $E6 $03
    jr   nz, jr_017_687C                          ;; 17:6858 $20 $22

    ld   a, [wD00A]                               ;; 17:685A $FA $0A $D0
    cp   $0C                                      ;; 17:685D $FE $0C
    jr   nz, .jr_686C                             ;; 17:685F $20 $0B

    call ResetCreditsSceneVariables               ;; 17:6861 $CD $A5 $4D
    ld   a, $60                                   ;; 17:6864 $3E $60
    ld   [wD009], a                               ;; 17:6866 $EA $09 $D0
    jp   IncrementCreditsSubscene                 ;; 17:6869 $C3 $D9 $4C

.jr_686C
    inc  a                                        ;; 17:686C $3C
    ld   [wD00A], a                               ;; 17:686D $EA $0A $D0
    ldh  a, [hIsGBC]                              ;; 17:6870 $F0 $FE
    and  a                                        ;; 17:6872 $A7
    jr   z, jr_017_687C                           ;; 17:6873 $28 $07

    ld   a, [wD00A]                               ;; 17:6875 $FA $0A $D0
    dec  a                                        ;; 17:6878 $3D
    jp   CreditsBlendPalettes                     ;; 17:6879 $C3 $80 $7E

jr_017_687C:
    CREDITS_MACRO_LDH_AND_LD
    ld   a, [wD00A]                               ;; 17:6881 $FA $0A $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:6885 $5F
    ld   d, $00                                   ;; 17:6886 $16 $00
    ld   hl, Data_017_60CA                        ;; 17:6888 $21 $CA $60
    add  hl, de                                   ;; 17:688B $19
    ld   a, [hl]                                  ;; 17:688C $7E
    ld   [wBGPalette], a                          ;; 17:688D $EA $97 $DB
    ld   [wOBJ0Palette], a                        ;; 17:6890 $EA $98 $DB
    ld   hl, Data_017_60CA                        ;; 17:6893 $21 $CA $60
    add  hl, de                                   ;; 17:6896 $19
    ld   a, [hl]                                  ;; 17:6897 $7E
    ld   [wOBJ0Palette], a                        ;; 17:6898 $EA $98 $DB
    ld   hl, Data_017_60DA                        ;; 17:689B $21 $DA $60
    add  hl, de                                   ;; 17:689E $19
    ld   a, [hl]                                  ;; 17:689F $7E
    ld   [wOBJ1Palette], a                        ;; 17:68A0 $EA $99 $DB
    ret                                           ;; 17:68A3 $C9

LinkSeatedOnLog3Handler::
    ld   de, $9960                                ;; 17:68A4 $11 $60 $99
    call func_017_488C                            ;; 17:68A7 $CD $8C $48
    ld   a, [wD009]                               ;; 17:68AA $FA $09 $D0
    and  a                                        ;; 17:68AD $A7
    jr   nz, .ret_68B6                            ;; 17:68AE $20 $06

    call ResetCreditsSceneVariables               ;; 17:68B0 $CD $A5 $4D
    jp   IncrementCreditsSubscene                 ;; 17:68B3 $C3 $D9 $4C

.ret_68B6
    ret                                           ;; 17:68B6 $C9

; Palettes indices
Data_017_68B7::
IF __PATCH_0__
    db   $1E, $1E, $2E, $2E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E
ELSE
    db   $1E, $1E, $1E, $1E, $2E, $2E, $2E, $2E, $6E, $6E, $6E, $6E
ENDC

LinkSeatedOnLog4Handler::
    ld   de, $9960                                ;; 17:68C3 $11 $60 $99
    call func_017_488C                            ;; 17:68C6 $CD $8C $48
    ldh  a, [hFrameCounter]                       ;; 17:68C9 $F0 $E7
    and  $07                                      ;; 17:68CB $E6 $07
    jr   nz, jr_017_68EB                          ;; 17:68CD $20 $1C

    ld   a, [wD00A]                               ;; 17:68CF $FA $0A $D0
    cp   $08                                      ;; 17:68D2 $FE $08
    jr   nz, .jr_68E1                             ;; 17:68D4 $20 $0B

    call ResetCreditsSceneVariables               ;; 17:68D6 $CD $A5 $4D
    ld   a, $20                                   ;; 17:68D9 $3E $20
    ld   [wD006], a                               ;; 17:68DB $EA $06 $D0
    jp   IncrementCreditsSubscene                 ;; 17:68DE $C3 $D9 $4C

.jr_68E1
    inc  a                                        ;; 17:68E1 $3C
    ld   [wD00A], a                               ;; 17:68E2 $EA $0A $D0
    ldh  a, [hIsGBC]                              ;; 17:68E5 $F0 $FE
    and  a                                        ;; 17:68E7 $A7
    jp   nz, label_017_6A80                       ;; 17:68E8 $C2 $80 $6A

jr_017_68EB:
    CREDITS_MACRO_LDH_AND_LD
    ld   a, [wD00A]                               ;; 17:68F0 $FA $0A $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:68F4 $5F
    ld   d, $00                                   ;; 17:68F5 $16 $00
    ld   hl, Data_017_68B7                        ;; 17:68F7 $21 $B7 $68
    add  hl, de                                   ;; 17:68FA $19
    ld   a, [hl]                                  ;; 17:68FB $7E
    ld   [wOBJ0Palette], a                        ;; 17:68FC $EA $98 $DB
    ret                                           ;; 17:68FF $C9

; Palette data?
Data_017_6900::
    db   $C5, $4C, $FF, $7F, $AB, $56, $E0, $41, $B3, $7E, $00, $00, $00, $31, $28, $32
    db   $B3, $7E, $00, $00, $1F, $12, $FE, $27, $B3, $7E, $00, $00, $BF, $21, $1F, $4B
    db   $B3, $7E, $00, $00, $6B, $04, $15, $19, $B3, $7E, $00, $00, $15, $19, $1F, $4B
    db   $C5, $4C, $FF, $7F, $8B, $52, $C0, $3D, $B3, $7E, $00, $00, $00, $2D, $08, $2E
    db   $B3, $7E, $00, $00, $FD, $11, $BC, $27, $B3, $7E, $00, $00, $9D, $21, $DD, $46
    db   $B3, $7E, $00, $00, $6A, $04, $13, $19, $B3, $7E, $00, $00, $13, $19, $DD, $46
    db   $C5, $4C, $FF, $7F, $4A, $4A, $A0, $39, $B3, $7E, $00, $00, $E0, $28, $C7, $29
    db   $B3, $7E, $00, $00, $DA, $11, $59, $23, $B3, $7E, $00, $00, $7A, $1D, $9A, $3E
    db   $B3, $7E, $00, $00, $69, $04, $F1, $14, $B3, $7E, $00, $00, $F1, $14, $9A, $3E
    db   $C5, $4C, $FF, $7F, $09, $42, $60, $31, $B3, $7E, $00, $00, $C0, $24, $A6, $25
    db   $B3, $7E, $00, $00, $97, $11, $F6, $1E, $B3, $7E, $00, $00, $57, $19, $57, $36
    db   $B3, $7E, $00, $00, $68, $04, $CF, $14, $B3, $7E, $00, $00, $CF, $14, $57, $36
    db   $C5, $4C, $FF, $7F, $E8, $3D, $40, $2D, $B3, $7E, $00, $00, $C0, $20, $66, $21
    db   $B3, $7E, $00, $00, $74, $0D, $93, $1A, $B3, $7E, $00, $00, $34, $19, $F4, $31
    db   $B3, $7E, $00, $00, $47, $04, $CD, $10, $B3, $7E, $00, $00, $CD, $10, $F4, $31
    db   $C5, $4C, $FF, $7F, $A7, $35, $00, $25, $B3, $7E, $00, $00, $A0, $1C, $45, $1D
    db   $B3, $7E, $00, $00, $31, $0D, $30, $16, $B3, $7E, $00, $00, $11, $15, $B1, $29
    db   $B3, $7E, $00, $00, $46, $04, $AB, $10, $B3, $7E, $00, $00, $AB, $10, $B1, $29
    db   $C5, $4C, $FF, $7F, $66, $2D, $E0, $20, $B3, $7E, $00, $00, $80, $18, $04, $19
    db   $B3, $7E, $00, $00, $0E, $0D, $CD, $11, $B3, $7E, $00, $00, $EE, $10, $6E, $21
    db   $B3, $7E, $00, $00, $45, $04, $89, $0C, $B3, $7E, $00, $00, $89, $0C, $6E, $21
    db   $C5, $4C, $FF, $7F, $25, $25, $A0, $18, $B3, $7E, $00, $00, $60, $10, $C3, $10
    db   $B3, $7E, $00, $00, $CB, $08, $6A, $0D, $B3, $7E, $00, $00, $AB, $0C, $0B, $19
    db   $B3, $7E, $00, $00, $24, $04, $67, $08, $B3, $7E, $00, $00, $67, $08, $0B, $19

label_017_6A80:
    ld   a, [wD00A]                               ;; 17:6A80 $FA $0A $D0
    dec  a                                        ;; 17:6A83 $3D
    swap a                                        ;; 17:6A84 $CB $37
    ld   c, a                                     ;; 17:6A86 $4F
    sla  a                                        ;; 17:6A87 $CB $27
    add  c                                        ;; 17:6A89 $81
    ld   c, a                                     ;; 17:6A8A $4F
    ld   a, $00                                   ;; 17:6A8B $3E $00
    adc  $00                                      ;; 17:6A8D $CE $00
    ld   b, a                                     ;; 17:6A8F $47
    ld   hl, Data_017_6900                        ;; 17:6A90 $21 $00 $69
    add  hl, bc                                   ;; 17:6A93 $09
    ld   bc, $30                                  ;; 17:6A94 $01 $30 $00
    ld   de, wObjPal1                             ;; 17:6A97 $11 $50 $DC
    call CopyData                                 ;; 17:6A9A $CD $14 $29
    xor  a                                        ;; 17:6A9D $AF
    ld   [wPalettePartialCopyColorIndexStart], a  ;; 17:6A9E $EA $D3 $DD
    ld   a, $18                                   ;; 17:6AA1 $3E $18
    ld   [wPalettePartialCopyColorCount], a       ;; 17:6AA3 $EA $D4 $DD
    ld   a, $82                                   ;; 17:6AA6 $3E $82
    ld   [wPaletteDataFlags], a                   ;; 17:6AA8 $EA $D1 $DD
    ret                                           ;; 17:6AAB $C9

LinkSeatedOnLog5Handler::
    ld   de, $9960                                ;; 17:6AAC $11 $60 $99
    call func_017_488C                            ;; 17:6AAF $CD $8C $48
    ld   a, [wD006]                               ;; 17:6AB2 $FA $06 $D0
    and  a                                        ;; 17:6AB5 $A7
    jr   nz, .ret_6AD0                            ;; 17:6AB6 $20 $18

    ld   a, $0A                                   ;; 17:6AB8 $3E $0A
    ld   [wD006], a                               ;; 17:6ABA $EA $06 $D0
    ld   a, [wCreditsScratch0]                    ;; 17:6ABD $FA $00 $D0
    inc  a                                        ;; 17:6AC0 $3C
    ld   [wCreditsScratch0], a                    ;; 17:6AC1 $EA $00 $D0
    cp   $02                                      ;; 17:6AC4 $FE $02
    jr   nz, .ret_6AD0                            ;; 17:6AC6 $20 $08

    ld   a, $20                                   ;; 17:6AC8 $3E $20
    ld   [wD006], a                               ;; 17:6ACA $EA $06 $D0
    jp   IncrementCreditsSubscene                 ;; 17:6ACD $C3 $D9 $4C

.ret_6AD0
    ret                                           ;; 17:6AD0 $C9

LinkSeatedOnLog6Handler::
    ld   de, $9960                                ;; 17:6AD1 $11 $60 $99
    call func_017_488C                            ;; 17:6AD4 $CD $8C $48
    ld   a, [wD006]                               ;; 17:6AD7 $FA $06 $D0
    and  a                                        ;; 17:6ADA $A7
    jr   nz, .ret_6AE0                            ;; 17:6ADB $20 $03

    jp   IncrementCreditsSubscene                 ;; 17:6ADD $C3 $D9 $4C

.ret_6AE0
    ret                                           ;; 17:6AE0 $C9

Data_017_6AE1::
    db   $02, $04, $06, $08, $0A, $0C, $0E, $10, $12, $14, $16, $18, $1A, $1C, $1E, $20
    db   $22, $24, $26, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28
    db   $28, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28, $28
    db   $28, $28, $28, $27, $26, $25, $24, $23, $22, $21, $20, $1F, $1E, $1D, $1C, $1B
    db   $1A, $19, $18, $17, $16, $15, $14, $13, $12, $11, $10, $0F, $0E, $0D, $0C, $0B
    db   $0A, $09, $08, $07, $06, $05, $04, $04, $04, $04, $04, $04, $00, $00, $00, $00

Data_017_6B41::
    db   $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00
    db   $00, $00, $00, $00, $00, $00, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01
    db   $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $03, $03, $03, $03, $03, $03
    db   $03, $03, $03, $03, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db   $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
    db   $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04

Data_017_6BA1::
    db   $1E, $1E, $1E, $1E, $1F, $1F, $1F, $1F, $1A, $1A, $1A, $1A, $15, $15, $15, $15
    db   $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $15, $15, $15, $15
    db   $19, $19, $1A, $1A, $1E, $1E, $1E, $1E

LinkSeatedOnLog7Handler::
    ld   a, [wD00D]                               ;; 17:6BC9 $FA $0D $D0
    cp   $0E                                      ;; 17:6BCC $FE $0E
    jr   nc, .jr_6BD6                             ;; 17:6BCE $30 $06

    ld   de, $9960                                ;; 17:6BD0 $11 $60 $99
    call func_017_488C                            ;; 17:6BD3 $CD $8C $48

.jr_6BD6
    ld   a, [wD00D]                               ;; 17:6BD6 $FA $0D $D0
    ld   e, a                                     ;; 17:6BD9 $5F
    ld   d, $00                                   ;; 17:6BDA $16 $00
    ld   hl, Data_017_6B41                        ;; 17:6BDC $21 $41 $6B
    add  hl, de                                   ;; 17:6BDF $19
    ld   a, [hl]                                  ;; 17:6BE0 $7E
    ld   [wD00C], a                               ;; 17:6BE1 $EA $0C $D0
    CREDITS_MACRO_LDH_AND_LD
    ld   a, [wD00C]                               ;; 17:6BE9 $FA $0C $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:6BED $5F
    ld   d, $00                                   ;; 17:6BEE $16 $00
    ld   hl, Data_017_6BA1                        ;; 17:6BF0 $21 $A1 $6B
    add  hl, de                                   ;; 17:6BF3 $19
    ld   a, [hl]                                  ;; 17:6BF4 $7E
    ld   [wBGPalette], a                          ;; 17:6BF5 $EA $97 $DB
    ld   a, [wD00D]                               ;; 17:6BF8 $FA $0D $D0
    ld   e, a                                     ;; 17:6BFB $5F
    ld   d, $00                                   ;; 17:6BFC $16 $00
    cp   $59                                      ;; 17:6BFE $FE $59
    jr   nz, .jr_6C15                             ;; 17:6C00 $20 $13

    ldh  a, [hBaseScrollY]                        ;; 17:6C02 $F0 $97
    cp   $30                                      ;; 17:6C04 $FE $30
    jr   nz, .jr_6C15                             ;; 17:6C06 $20 $0D

    ld   a, $FF                                   ;; 17:6C08 $3E $FF
    ld   [wD008], a                               ;; 17:6C0A $EA $08 $D0
    ld   a, $A8                                   ;; 17:6C0D $3E $A8
    ld   [wD009], a                               ;; 17:6C0F $EA $09 $D0
    jp   IncrementCreditsSubscene                 ;; 17:6C12 $C3 $D9 $4C

.jr_6C15
    ld   hl, Data_017_6AE1                        ;; 17:6C15 $21 $E1 $6A
    add  hl, de                                   ;; 17:6C18 $19
    ld   a, [hl]                                  ;; 17:6C19 $7E
    cpl                                           ;; 17:6C1A $2F
    inc  a                                        ;; 17:6C1B $3C
    sla  a                                        ;; 17:6C1C $CB $27
    ld   [wEntitiesSpeedXTable], a                ;; 17:6C1E $EA $40 $C2
    ld   bc, $00                                  ;; 17:6C21 $01 $00 $00
    ld   a, [wEntitiesPosXTable]                  ;; 17:6C24 $FA $00 $C2
    push af                                       ;; 17:6C27 $F5
    call AddEntitySpeedToPos_17                   ;; 17:6C28 $CD $3A $7E
    ld   a, [wEntitiesPosXTable]                  ;; 17:6C2B $FA $00 $C2
    ldh  [hBaseScrollY], a                        ;; 17:6C2E $E0 $97
    and  $F8                                      ;; 17:6C30 $E6 $F8
    ld   e, a                                     ;; 17:6C32 $5F
    pop  af                                       ;; 17:6C33 $F1
    and  $F8                                      ;; 17:6C34 $E6 $F8
    cp   e                                        ;; 17:6C36 $BB
    ret  z                                        ;; 17:6C37 $C8

    ld   a, [wD00D]                               ;; 17:6C38 $FA $0D $D0
    cp   $59                                      ;; 17:6C3B $FE $59
    ret  z                                        ;; 17:6C3D $C8

    inc  a                                        ;; 17:6C3E $3C
    ld   [wD00D], a                               ;; 17:6C3F $EA $0D $D0
    ldh  a, [hIsGBC]                              ;; 17:6C42 $F0 $FE
    and  a                                        ;; 17:6C44 $A7
    jr   z, .jr_6C4A                              ;; 17:6C45 $28 $03

    call func_017_6C85                            ;; 17:6C47 $CD $85 $6C

.jr_6C4A
    ld   a, [wD00D]                               ;; 17:6C4A $FA $0D $D0
    cp   $44                                      ;; 17:6C4D $FE $44
    jr   nz, .jr_6C73                             ;; 17:6C4F $20 $22

    ld   a, $E3                                   ;; 17:6C51 $3E $E3
    ld   [wOBJ1Palette], a                        ;; 17:6C53 $EA $99 $DB
    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:6C56 $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:6C58 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:6C5B $21 $00 $C2
    add  hl, de                                   ;; 17:6C5E $19
    ld   [hl], $50                                ;; 17:6C5F $36 $50
    ld   hl, wEntitiesPosYTable                   ;; 17:6C61 $21 $10 $C2
    add  hl, de                                   ;; 17:6C64 $19
    ld   [hl], $80                                ;; 17:6C65 $36 $80
    ld   hl, wEntitiesPrivateState1Table          ;; 17:6C67 $21 $B0 $C2
    add  hl, de                                   ;; 17:6C6A $19
    ld   [hl], $0B                                ;; 17:6C6B $36 $0B
    ld   hl, wEntitiesTransitionCountdownTable    ;; 17:6C6D $21 $E0 $C2
    add  hl, de                                   ;; 17:6C70 $19
    ld   [hl], $A8                                ;; 17:6C71 $36 $A8

.jr_6C73
    ld   hl, wFarcallParams                       ;; 17:6C73 $21 $01 $DE
    ld   a, BANK(func_023_7E95)                   ;; 17:6C76 $3E $23
    ld   [hl+], a                                 ;; 17:6C78 $22
    ld   a, HIGH(func_023_7E95)                   ;; 17:6C79 $3E $7E
    ld   [hl+], a                                 ;; 17:6C7B $22
    ld   a, LOW(func_023_7E95)                    ;; 17:6C7C $3E $95
    ld   [hl+], a                                 ;; 17:6C7E $22
    ld   a, BANK(@)                               ;; 17:6C7F $3E $17
    ld   [hl], a                                  ;; 17:6C81 $77
    jp   Farcall                                  ;; 17:6C82 $C3 $D7 $0B

func_017_6C85::
    ld   hl, wFarcallParams                       ;; 17:6C85 $21 $01 $DE
    ld   a, BANK(func_020_7C26)                   ;; 17:6C88 $3E $20
    ld   [hl+], a                                 ;; 17:6C8A $22
    ld   a, HIGH(func_020_7C26)                   ;; 17:6C8B $3E $7C
    ld   [hl+], a                                 ;; 17:6C8D $22
    ld   a, LOW(func_020_7C26)                    ;; 17:6C8E $3E $26
    ld   [hl+], a                                 ;; 17:6C90 $22
    ld   a, BANK(@)                               ;; 17:6C91 $3E $17
    ld   [hl], a                                  ;; 17:6C93 $77
    jp   Farcall                                  ;; 17:6C94 $C3 $D7 $0B

LinkSeatedOnLog8Handler::
    ld   a, [wD009]                               ;; 17:6C97 $FA $09 $D0
    and  a                                        ;; 17:6C9A $A7
    jr   nz, .jr_6CA9                             ;; 17:6C9B $20 $0C

    xor  a                                        ;; 17:6C9D $AF
    ld   [wBGPalette], a                          ;; 17:6C9E $EA $97 $DB
    ld   a, $17                                   ;; 17:6CA1 $3E $17
    call ClearFileMenuBG_trampoline               ;; 17:6CA3 $CD $FA $08
    jp   TransitionToNextEndingScene              ;; 17:6CA6 $C3 $DE $64

.jr_6CA9
    CREDITS_MACRO_LDH_AND_LD
    ld   a, [wD00C]                               ;; 17:6CAE $FA $0C $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:6CB2 $5F
    ld   d, $00                                   ;; 17:6CB3 $16 $00
    ld   hl, Data_017_6BA1                        ;; 17:6CB5 $21 $A1 $6B
    add  hl, de                                   ;; 17:6CB8 $19
    ld   a, [hl]                                  ;; 17:6CB9 $7E
    ld   [wBGPalette], a                          ;; 17:6CBA $EA $97 $DB
    ld   a, [wD008]                               ;; 17:6CBD $FA $08 $D0
    and  a                                        ;; 17:6CC0 $A7
    jr   nz, ret_017_6D0A                         ;; 17:6CC1 $20 $47

    ld   a, [wD00B]                               ;; 17:6CC3 $FA $0B $D0
    inc  a                                        ;; 17:6CC6 $3C
    ld   [wD00B], a                               ;; 17:6CC7 $EA $0B $D0
    and  $07                                      ;; 17:6CCA $E6 $07
    jr   nz, ret_017_6D0A                         ;; 17:6CCC $20 $3C

    ld   a, [wD00C]                               ;; 17:6CCE $FA $0C $D0
    cp   $24                                      ;; 17:6CD1 $FE $24
    jr   z, ret_017_6D0A                          ;; 17:6CD3 $28 $35

    ldh  a, [hIsGBC]                              ;; 17:6CD5 $F0 $FE
    and  a                                        ;; 17:6CD7 $A7
    jr   z, .jr_6CDD                              ;; 17:6CD8 $28 $03

    call func_017_6D0B                            ;; 17:6CDA $CD $0B $6D

.jr_6CDD
    ld   a, [wD00C]                               ;; 17:6CDD $FA $0C $D0
    inc  a                                        ;; 17:6CE0 $3C
    ld   [wD00C], a                               ;; 17:6CE1 $EA $0C $D0
    cp   $05                                      ;; 17:6CE4 $FE $05
    jr   nz, ret_017_6D0A                         ;; 17:6CE6 $20 $22

    ld   a, $1E                                   ;; 17:6CE8 $3E $1E
    ld   [wOBJ0Palette], a                        ;; 17:6CEA $EA $98 $DB
    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:6CED $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:6CEF $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:6CF2 $21 $00 $C2
    add  hl, de                                   ;; 17:6CF5 $19
    ld   [hl], $62                                ;; 17:6CF6 $36 $62
    ld   hl, wEntitiesPosYTable                   ;; 17:6CF8 $21 $10 $C2
    add  hl, de                                   ;; 17:6CFB $19
    ld   [hl], $5A                                ;; 17:6CFC $36 $5A
    ld   hl, wEntitiesPrivateState1Table          ;; 17:6CFE $21 $B0 $C2
    add  hl, de                                   ;; 17:6D01 $19
    ld   [hl], $0C                                ;; 17:6D02 $36 $0C
    ld   hl, wEntitiesTransitionCountdownTable    ;; 17:6D04 $21 $E0 $C2
    add  hl, de                                   ;; 17:6D07 $19
    ld   [hl], $60                                ;; 17:6D08 $36 $60

ret_017_6D0A:
    ret                                           ;; 17:6D0A $C9

func_017_6D0B::
    ld   hl, wFarcallParams                       ;; 17:6D0B $21 $01 $DE
    ld   a, BANK(func_024_7801)                   ;; 17:6D0E $3E $24
    ld   [hl+], a                                 ;; 17:6D10 $22
    ld   a, HIGH(func_024_7801)                   ;; 17:6D11 $3E $78
    ld   [hl+], a                                 ;; 17:6D13 $22
    ld   a, LOW(func_024_7801)                    ;; 17:6D14 $3E $01
    ld   [hl+], a                                 ;; 17:6D16 $22
    ld   a, BANK(@)                               ;; 17:6D17 $3E $17
    ld   [hl], a                                  ;; 17:6D19 $77
    jp   Farcall                                  ;; 17:6D1A $C3 $D7 $0B

CreditsLinkFaceCloseUpHandler::
    call AnimateEntitiesAndRestoreBank17          ;; 17:6D1D $CD $ED $0E
    ld   a, [wCreditsSubscene]                    ;; 17:6D20 $FA $0E $D0
    JP_TABLE                                      ;; 17:6D23 $C7
._00 dw CreditsLinkFaceCloseUp0Handler            ;; 17:6D24
._01 dw CreditsLinkFaceCloseUp1Handler            ;; 17:6D26
._02 dw CreditsLinkFaceCloseUp2Handler            ;; 17:6D28
._03 dw CreditsLinkFaceCloseUp3Handler            ;; 17:6D2A
._04 dw CreditsLinkFaceCloseUp4Handler            ;; 17:6D2C
._05 dw CreditsLinkFaceCloseUp5Handler            ;; 17:6D2E
._06 dw CreditsLinkFaceCloseUp6Handler            ;; 17:6D30

CreditsLinkFaceCloseUp0Handler::
    ld   a, TILESET_CREDITS_LINK_FACE_CLOSEUP     ;; 17:6D32 $3E $1A
    ld   [wTilesetToLoad], a                      ;; 17:6D34 $EA $FE $D6
    xor  a                                        ;; 17:6D37 $AF
    ld   [wPaletteUnknownE], a                    ;; 17:6D38 $EA $D5 $DD
    dec  a                                        ;; 17:6D3B $3D
    ld   [wD022], a                               ;; 17:6D3C $EA $22 $D0
    jp   IncrementCreditsSubscene                 ;; 17:6D3F $C3 $D9 $4C

CreditsLinkFaceCloseUp1Handler::
    ld   a, TILEMAP_CREDITS_LINK_FACE_CLOSE_UP    ;; 17:6D42 $3E $1B
    ld   [wBGMapToLoad], a                        ;; 17:6D44 $EA $FF $D6

    call ResetCreditsSceneVariables               ;; 17:6D47 $CD $A5 $4D
    ld   a, $1E                                   ;; 17:6D4A $3E $1E
    ld   [wBGPalette], a                          ;; 17:6D4C $EA $97 $DB
    ld   a, $6E                                   ;; 17:6D4F $3E $6E
    ld   [wOBJ0Palette], a                        ;; 17:6D51 $EA $98 $DB
    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:6D54 $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:6D56 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:6D59 $21 $00 $C2
    add  hl, de                                   ;; 17:6D5C $19
    ld   [hl], $38                                ;; 17:6D5D $36 $38
    ld   hl, wEntitiesPosYTable                   ;; 17:6D5F $21 $10 $C2
    add  hl, de                                   ;; 17:6D62 $19
    ld   [hl], $50                                ;; 17:6D63 $36 $50
    ld   hl, wEntitiesPrivateState1Table          ;; 17:6D65 $21 $B0 $C2
    add  hl, de                                   ;; 17:6D68 $19
    ld   [hl], $0D                                ;; 17:6D69 $36 $0D
    ld   a, $20                                   ;; 17:6D6B $3E $20
    ld   [wD006], a                               ;; 17:6D6D $EA $06 $D0
    jp   IncrementCreditsSubscene                 ;; 17:6D70 $C3 $D9 $4C

CreditsLinkFaceCloseUp2Handler::
    ld   a, [wD006]                               ;; 17:6D73 $FA $06 $D0
    and  a                                        ;; 17:6D76 $A7
    jr   nz, func_017_6D7C                        ;; 17:6D77 $20 $03

    call IncrementCreditsSubscene                 ;; 17:6D79 $CD $D9 $4C

func_017_6D7C::
    ldh  a, [hFrameCounter]                       ;; 17:6D7C $F0 $E7
    and  $03                                      ;; 17:6D7E $E6 $03
    jr   nz, jr_017_6D8E                          ;; 17:6D80 $20 $0C

    ld   a, [wD00F]                               ;; 17:6D82 $FA $0F $D0
    inc  a                                        ;; 17:6D85 $3C
    cp   $31                                      ;; 17:6D86 $FE $31
    jr   nz, .jr_6D8B                             ;; 17:6D88 $20 $01

    xor  a                                        ;; 17:6D8A $AF

.jr_6D8B
    ld   [wD00F], a                               ;; 17:6D8B $EA $0F $D0

jr_017_6D8E:
    ld   a, [wD00F]                               ;; 17:6D8E $FA $0F $D0
    ld   e, a                                     ;; 17:6D91 $5F
    ld   d, b                                     ;; 17:6D92 $50
    ld   hl, Data_017_76AD                        ;; 17:6D93 $21 $AD $76
    add  hl, de                                   ;; 17:6D96 $19
    ld   a, [hl]                                  ;; 17:6D97 $7E
    sra  a                                        ;; 17:6D98 $CB $2F
    ldh  [hBaseScrollY], a                        ;; 17:6D9A $E0 $97
    ret                                           ;; 17:6D9C $C9

Data_017_6D9D::
    db   $6E, $6E, $6E, $6E, $1E, $1E, $1E, $1E

CreditsLinkFaceCloseUp3Handler::
    call func_017_6D7C                            ;; 17:6DA5 $CD $7C $6D
    ldh  a, [hFrameCounter]                       ;; 17:6DA8 $F0 $E7
    and  $07                                      ;; 17:6DAA $E6 $07
    jr   nz, .jr_6DC1                             ;; 17:6DAC $20 $13

    ld   a, [wD00A]                               ;; 17:6DAE $FA $0A $D0
    inc  a                                        ;; 17:6DB1 $3C
    ld   [wD00A], a                               ;; 17:6DB2 $EA $0A $D0
    cp   $04                                      ;; 17:6DB5 $FE $04
    jr   nz, .jr_6DC1                             ;; 17:6DB7 $20 $08

    ld   a, $FF                                   ;; 17:6DB9 $3E $FF
    ld   [wD006], a                               ;; 17:6DBB $EA $06 $D0
    jp   IncrementCreditsSubscene                 ;; 17:6DBE $C3 $D9 $4C

.jr_6DC1
    ldh  a, [hIsGBC]                              ;; 17:6DC1 $F0 $FE
    and  a                                        ;; 17:6DC3 $A7
    jr   nz, func_017_6DDB                        ;; 17:6DC4 $20 $15

    ldh  a, [hFrameCounter]                       ;; 17:6DC6 $F0 $E7
    and  $03                                      ;; 17:6DC8 $E6 $03
    ld   e, a                                     ;; 17:6DCA $5F
    ld   a, [wD00A]                               ;; 17:6DCB $FA $0A $D0
    add  e                                        ;; 17:6DCE $83
    ld   e, a                                     ;; 17:6DCF $5F
    ld   d, $00                                   ;; 17:6DD0 $16 $00
    ld   hl, Data_017_6D9D                        ;; 17:6DD2 $21 $9D $6D
    add  hl, de                                   ;; 17:6DD5 $19
    ld   a, [hl]                                  ;; 17:6DD6 $7E
    ld   [wOBJ0Palette], a                        ;; 17:6DD7 $EA $98 $DB
    ret                                           ;; 17:6DDA $C9

func_017_6DDB::
    ld   hl, wFarcallParams                       ;; 17:6DDB $21 $01 $DE
    ld   a, BANK(func_024_7A40)                   ;; 17:6DDE $3E $24
    ld   [hl+], a                                 ;; 17:6DE0 $22
    ld   a, HIGH(func_024_7A40)                   ;; 17:6DE1 $3E $7A
    ld   [hl+], a                                 ;; 17:6DE3 $22
    ld   a, LOW(func_024_7A40)                    ;; 17:6DE4 $3E $40
    ld   [hl+], a                                 ;; 17:6DE6 $22
    ld   a, BANK(@)                               ;; 17:6DE7 $3E $17
    ld   [hl], a                                  ;; 17:6DE9 $77
    jp   Farcall                                  ;; 17:6DEA $C3 $D7 $0B

CreditsLinkFaceCloseUp4Handler::
    call func_017_6D7C                            ;; 17:6DED $CD $7C $6D
    ldh  a, [hIsGBC]                              ;; 17:6DF0 $F0 $FE
    and  a                                        ;; 17:6DF2 $A7
    jr   z, .jr_6DF8                              ;; 17:6DF3 $28 $03

    call func_017_6DDB                            ;; 17:6DF5 $CD $DB $6D

.jr_6DF8
    ld   a, [wD006]                               ;; 17:6DF8 $FA $06 $D0
    and  a                                        ;; 17:6DFB $A7
    jr   nz, .jr_6E07                             ;; 17:6DFC $20 $09

    ld   a, $E0                                   ;; 17:6DFE $3E $E0
    ld   [wD006], a                               ;; 17:6E00 $EA $06 $D0
    jp   IncrementCreditsSubscene                 ;; 17:6E03 $C3 $D9 $4C

    ret                                           ;; 17:6E06 $C9

.jr_6E07
    cp   $44                                      ;; 17:6E07 $FE $44
    jr   z, .jr_6E0F                              ;; 17:6E09 $28 $04

    cp   $50                                      ;; 17:6E0B $FE $50
    jr   nz, ret_017_6E13                         ;; 17:6E0D $20 $04

.jr_6E0F
    ld   hl, wD003                                ;; 17:6E0F $21 $03 $D0
    inc  [hl]                                     ;; 17:6E12 $34

ret_017_6E13:
    ret                                           ;; 17:6E13 $C9

CreditsLinkFaceCloseUp5Handler::
    call func_017_6D7C                            ;; 17:6E14 $CD $7C $6D
    ld   hl, wD006                                ;; 17:6E17 $21 $06 $D0
    ldh  a, [hFrameCounter]                       ;; 17:6E1A $F0 $E7
    and  $07                                      ;; 17:6E1C $E6 $07
    or   [hl]                                     ;; 17:6E1E $B6
    jr   nz, jr_017_6E40                          ;; 17:6E1F $20 $1F

    ld   a, [wIntroSubTimer]                      ;; 17:6E21 $FA $02 $D0
    inc  a                                        ;; 17:6E24 $3C
    ld   [wIntroSubTimer], a                      ;; 17:6E25 $EA $02 $D0
    cp   $0C                                      ;; 17:6E28 $FE $0C
    jr   nz, .jr_6E34                             ;; 17:6E2A $20 $08

    ld   a, $40                                   ;; 17:6E2C $3E $40
    ld   [wD006], a                               ;; 17:6E2E $EA $06 $D0
    call IncrementCreditsSubscene                 ;; 17:6E31 $CD $D9 $4C

.jr_6E34
    ldh  a, [hIsGBC]                              ;; 17:6E34 $F0 $FE
    and  a                                        ;; 17:6E36 $A7
    jr   z, jr_017_6E40                           ;; 17:6E37 $28 $07

    ld   a, [wIntroSubTimer]                      ;; 17:6E39 $FA $02 $D0
    dec  a                                        ;; 17:6E3C $3D
    jp   func_017_7F30                            ;; 17:6E3D $C3 $30 $7F

jr_017_6E40:
    CREDITS_MACRO_LDH_AND_LD
    ld   a, [wIntroSubTimer]                      ;; 17:6E45 $FA $02 $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:6E49 $5F
    ld   d, $00                                   ;; 17:6E4A $16 $00
    ld   hl, Data_017_6456                        ;; 17:6E4C $21 $56 $64
    add  hl, de                                   ;; 17:6E4F $19
    ld   a, [hl]                                  ;; 17:6E50 $7E
    ld   [wBGPalette], a                          ;; 17:6E51 $EA $97 $DB
    ld   hl, Data_017_6456                        ;; 17:6E54 $21 $56 $64
    add  hl, de                                   ;; 17:6E57 $19
    ld   a, [hl]                                  ;; 17:6E58 $7E
    ld   [wOBJ0Palette], a                        ;; 17:6E59 $EA $98 $DB
    ld   hl, Data_017_6466                        ;; 17:6E5C $21 $66 $64
    add  hl, de                                   ;; 17:6E5F $19
    ld   a, [hl]                                  ;; 17:6E60 $7E
    ld   [wOBJ1Palette], a                        ;; 17:6E61 $EA $99 $DB
    ret                                           ;; 17:6E64 $C9

CreditsLinkFaceCloseUp6Handler::
    ld   a, [wD006]                               ;; 17:6E65 $FA $06 $D0
    and  a                                        ;; 17:6E68 $A7
    jr   nz, .ret_6E6E                            ;; 17:6E69 $20 $03

    jp   TransitionToNextEndingScene              ;; 17:6E6B $C3 $DE $64

.ret_6E6E
    ret                                           ;; 17:6E6E $C9

CreditsRollHandler::
    ld   de, $99A0                                ;; 17:6E6F $11 $A0 $99
    call func_017_488C                            ;; 17:6E72 $CD $8C $48
    call func_017_448B                            ;; 17:6E75 $CD $8B $44
    ld   a, [wGameplaySubtype]                    ;; 17:6E78 $FA $96 $DB
    cp   $09                                      ;; 17:6E7B $FE $09
    ret  z                                        ;; 17:6E7D $C8

    call AnimateEntitiesAndRestoreBank17          ;; 17:6E7E $CD $ED $0E
    ld   a, [wCreditsSubscene]                               ;; 17:6E81
    JP_TABLE                                      ;; 17:6E84
._00 dw CreditsRollLoadHandler                    ;; 17:6E85
._01 dw CreditsRoll1Handler                       ;; 17:6E87
._02 dw CreditsRoll2Handler                       ;; 17:6E89
._03 dw CreditsRoll3Handler                       ;; 17:6E8B
._04 dw CreditsRoll4Handler                       ;; 17:6E8D
._05 dw CreditsRoll5Handler                       ;; 17:6E8F

CreditsRollLoadHandler::
    ld   a, TILESET_CREDITS_ROLL                  ;; 17:6E91 $3E $1B
    ld   [wTilesetToLoad], a                      ;; 17:6E93 $EA $FE $D6
    ld   a, $01                                   ;; 17:6E96 $3E $01
    ld   [wPaletteUnknownE], a                    ;; 17:6E98 $EA $D5 $DD
    ld   hl, wLCDControl                          ;; 17:6E9B $21 $FD $D6
    res  LCDCB_OBJ16, [hl]                        ;; 17:6E9E $CB $96
    jp   IncrementCreditsSubscene                 ;; 17:6EA0 $C3 $D9 $4C

CreditsRoll1Handler::
    ld   a, TILEMAP_CREDITS_ROLL_1                ;; 17:6EA3 $3E $1C
    ld   [wBGMapToLoad], a                        ;; 17:6EA5 $EA $FF $D6

    call ResetCreditsSceneVariables               ;; 17:6EA8 $CD $A5 $4D
    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:6EAB $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:6EAD $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:6EB0 $21 $00 $C2
    add  hl, de                                   ;; 17:6EB3 $19
    ld   [hl], $50                                ;; 17:6EB4 $36 $50
    ld   hl, wEntitiesPosYTable                   ;; 17:6EB6 $21 $10 $C2
    add  hl, de                                   ;; 17:6EB9 $19
    ld   [hl], $78                                ;; 17:6EBA $36 $78
    ld   hl, wEntitiesPrivateState1Table          ;; 17:6EBC $21 $B0 $C2
    add  hl, de                                   ;; 17:6EBF $19
    ld   [hl], $0E                                ;; 17:6EC0 $36 $0E
    xor  a                                        ;; 17:6EC2 $AF
    ld   [wD012], a                               ;; 17:6EC3 $EA $12 $D0
    dec  a                                        ;; 17:6EC6 $3D
    ld   [wD010], a                               ;; 17:6EC7 $EA $10 $D0
    ld   a, $B0                                   ;; 17:6ECA $3E $B0
    ld   [wD009], a                               ;; 17:6ECC $EA $09 $D0
    xor  a                                        ;; 17:6ECF $AF
    ldh  [hFrameCounter], a                       ;; 17:6ED0 $E0 $E7
    ld   [wOBJ1Palette], a                        ;; 17:6ED2 $EA $99 $DB
    jp   IncrementCreditsSubscene                 ;; 17:6ED5 $C3 $D9 $4C

Data_017_6ED8::
    CREDITS_FADE $00, $04, $19, $1E

CreditsRoll2Handler::
    ldh  a, [hFrameCounter]                       ;; 17:6EE8 $F0 $E7
    and  $07                                      ;; 17:6EEA $E6 $07
    jr   nz, jr_017_6F10                          ;; 17:6EEC $20 $22

    ld   a, [wIntroSubTimer]                      ;; 17:6EEE $FA $02 $D0
    inc  a                                        ;; 17:6EF1 $3C
    ld   [wIntroSubTimer], a                      ;; 17:6EF2 $EA $02 $D0
    cp   $0C                                      ;; 17:6EF5 $FE $0C
    jr   nz, .jr_6F04                             ;; 17:6EF7 $20 $0B

    ld   a, $FF                                   ;; 17:6EF9 $3E $FF
    ld   [wD013], a                               ;; 17:6EFB $EA $13 $D0
    xor  a                                        ;; 17:6EFE $AF
    ldh  [hFrameCounter], a                       ;; 17:6EFF $E0 $E7
    call IncrementCreditsSubscene                 ;; 17:6F01 $CD $D9 $4C

.jr_6F04
    ldh  a, [hIsGBC]                              ;; 17:6F04 $F0 $FE
    and  a                                        ;; 17:6F06 $A7
    jr   z, jr_017_6F10                           ;; 17:6F07 $28 $07

    ld   a, [wIntroSubTimer]                      ;; 17:6F09 $FA $02 $D0
    dec  a                                        ;; 17:6F0C $3D
    jp   CreditsBlendPalettes                     ;; 17:6F0D $C3 $80 $7E

jr_017_6F10:
    CREDITS_MACRO_LDH_AND_LD
    ld   a, [wIntroSubTimer]                      ;; 17:6F15 $FA $02 $D0
    CREDITS_MACRO_ADD
    ld   e, a                                     ;; 17:6F19 $5F
    ld   d, $00                                   ;; 17:6F1A $16 $00
    ld   hl, Data_017_6ED8                        ;; 17:6F1C $21 $D8 $6E
    add  hl, de                                   ;; 17:6F1F $19
    ld   a, [hl]                                  ;; 17:6F20 $7E
    ld   [wBGPalette], a                          ;; 17:6F21 $EA $97 $DB
    ld   [wOBJ0Palette], a                        ;; 17:6F24 $EA $98 $DB
    ret                                           ;; 17:6F27 $C9

CreditsRoll3Handler::
    ld   a, [wD013]                               ;; 17:6F28 $FA $13 $D0
    and  a                                        ;; 17:6F2B $A7
    jr   nz, ret_017_6F67                         ;; 17:6F2C $20 $39

    ldh  a, [hFrameCounter]                       ;; 17:6F2E $F0 $E7
    and  $07                                      ;; 17:6F30 $E6 $07
    jr   nz, ret_017_6F67                         ;; 17:6F32 $20 $33

    ld   hl, hBaseScrollY                         ;; 17:6F34 $21 $97 $FF
    dec  [hl]                                     ;; 17:6F37 $35
    ld   a, [hl]                                  ;; 17:6F38 $7E
    cp   $70                                      ;; 17:6F39 $FE $70
    jr   nz, .jr_6F40                             ;; 17:6F3B $20 $03

    jp   IncrementCreditsSubscene                 ;; 17:6F3D $C3 $D9 $4C

.jr_6F40
    cp   $A0                                      ;; 17:6F40 $FE $A0
    jr   nz, .jr_6F4C                             ;; 17:6F42 $20 $08

    ld   hl, wEntitiesStatusTable+15              ;; 17:6F44 $21 $8F $C2
    ld   [hl], $00                                ;; 17:6F47 $36 $00
    jp   label_017_6F9F                           ;; 17:6F49 $C3 $9F $6F

.jr_6F4C
    cp   $C0                                      ;; 17:6F4C $FE $C0
    jr   nz, ret_017_6F67                         ;; 17:6F4E $20 $17

    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:6F50 $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:6F52 $CD $86 $3B
    ld   hl, wEntitiesPosXTable                   ;; 17:6F55 $21 $00 $C2
    add  hl, de                                   ;; 17:6F58 $19
    ld   [hl], $18                                ;; 17:6F59 $36 $18
    ld   hl, wEntitiesPosYTable                   ;; 17:6F5B $21 $10 $C2
    add  hl, de                                   ;; 17:6F5E $19
    ld   [hl], $B0                                ;; 17:6F5F $36 $B0
    ld   hl, wEntitiesPrivateState1Table          ;; 17:6F61 $21 $B0 $C2
    add  hl, de                                   ;; 17:6F64 $19
    ld   [hl], $0F                                ;; 17:6F65 $36 $0F

ret_017_6F67:
    ret                                           ;; 17:6F67 $C9

CreditsRoll4Handler::
    ret                                           ;; 17:6F68 $C9

CreditsRoll5Handler::
    ret                                           ;; 17:6F69 $C9

Data_017_6F6A::
    db   $99, $C1, $05, $58, $59, $5A, $5B, $5C, $5D, $99, $E1, $05, $68, $69, $6A, $6B
    db   $6C, $6D, $99, $F1, $02, $58, $59, $5A, $9A, $11, $02, $68, $69, $6A, $9A, $20
    db   $01, $5C, $5D, $00

Data_017_6F8E::
    db   $99, $C0, $53, $00, $99, $E0, $53, $00, $9A, $00, $53, $00, $9A, $20, $53, $00
    db   $00

label_017_6F9F:
    ld   hl, Data_017_6F6A                        ;; 17:6F9F $21 $6A $6F
    ld   de, wDrawCommand                         ;; 17:6FA2 $11 $01 $D6
    ld   c, $24                                   ;; 17:6FA5 $0E $24

.loop_6FA7
    ld   a, [hl+]                                 ;; 17:6FA7 $2A
    ld   [de], a                                  ;; 17:6FA8 $12
    inc  de                                       ;; 17:6FA9 $13
    dec  c                                        ;; 17:6FAA $0D
    jr   nz, .loop_6FA7                           ;; 17:6FAB $20 $FA

    ldh  a, [hIsGBC]                              ;; 17:6FAD $F0 $FE
    and  a                                        ;; 17:6FAF $A7
    ret  z                                        ;; 17:6FB0 $C8

    ld   hl, Data_017_6F8E                        ;; 17:6FB1 $21 $8E $6F
    ld   de, wDrawCommandVRAM1                    ;; 17:6FB4 $11 $91 $DC
    ld   c, $11                                   ;; 17:6FB7 $0E $11

.loop_6FB9
    ld   a, [hl+]                                 ;; 17:6FB9 $2A
    ld   [de], a                                  ;; 17:6FBA $12
    inc  de                                       ;; 17:6FBB $13
    dec  c                                        ;; 17:6FBC $0D
    jr   nz, .loop_6FB9                           ;; 17:6FBD $20 $FA

    ret                                           ;; 17:6FBF $C9

CreditsTheEndHandler::
    ld   a, [wCreditsSubscene]                    ;; 17:6FC0 $FA $0E $D0
    JP_TABLE                                      ;; 17:6FC3 $C7
._00 dw CreditsTheEnd0Handler                     ; $6FC4 (jumpTable [0]) $D2 $6F
._01 dw CreditsTheEnd1Handler                     ; $6FC6 (jumpTable [1]) $F7 $6F
._02 dw CreditsTheEnd2Handler                     ; $6FC8 (jumpTable [2]) $18 $70
._03 dw CreditsTheEnd3Handler                     ; $6FCA (jumpTable [3]) $21 $70
._04 dw CreditsTheEnd4Handler                     ; $6FCC (jumpTable [4]) $36 $70
._05 dw CreditsTheEnd5Handler                     ; $6FCE (jumpTable [5]) $B1 $70
._06 dw CreditsTheEnd6Handler                     ; $6FD0 (jumpTable [6]) $D0 $70

CreditsTheEnd0Handler::
    ld   a, [wD01E]                               ;; 17:6FD2 $FA $1E $D0
    and  a                                        ;; 17:6FD5 $A7
    ret  nz                                       ;; 17:6FD6 $C0

    ld   hl, wObjPal1 + 3*2                       ;; 17:6FD7 $21 $56 $DC
    ld   a, $FF                                   ;; 17:6FDA $3E $FF
    ld   [hl+], a                                 ;; 17:6FDC $22
    ld   a, $7F                                   ;; 17:6FDD $3E $7F
    ld   [hl], a                                  ;; 17:6FDF $77
    ld   a, $03                                   ;; 17:6FE0 $3E $03
    ld   [wPalettePartialCopyColorIndexStart], a  ;; 17:6FE2 $EA $D3 $DD
    ld   a, $01                                   ;; 17:6FE5 $3E $01
    ld   [wPalettePartialCopyColorCount], a       ;; 17:6FE7 $EA $D4 $DD
    ld   a, $82                                   ;; 17:6FEA $3E $82
    ld   [wPaletteDataFlags], a                   ;; 17:6FEC $EA $D1 $DD
    ld   a, $B4                                   ;; 17:6FEF $3E $B4
    ld   [wD006], a                               ;; 17:6FF1 $EA $06 $D0
    jp   IncrementCreditsSubscene                 ;; 17:6FF4 $C3 $D9 $4C

CreditsTheEnd1Handler::
    call LayoutRoleLetters                        ;; 17:6FF7 $CD $9D $46
    call LayoutStaffLetters                       ;; 17:6FFA $CD $84 $47
    ld   hl, wDeathCount                          ;; 17:6FFD $21 $57 $DB
    ld   a, [hl+]                                 ;; 17:7000 $2A
    or   [hl]                                     ;; 17:7001 $B6
    ret  nz                                       ;; 17:7002 $C0

    ld   a, [wD006]                               ;; 17:7003 $FA $06 $D0
    and  a                                        ;; 17:7006 $A7
    ret  nz                                       ;; 17:7007 $C0

    ld   a, $07                                   ;; 17:7008 $3E $07
    ldh  [hVolumeRight], a                        ;; 17:700A $E0 $A9
    swap a                                        ;; 17:700C $CB $37
    ldh  [hVolumeLeft], a                         ;; 17:700E $E0 $AA
    ld   a, $B4                                   ;; 17:7010 $3E $B4
    ld   [wD006], a                               ;; 17:7012 $EA $06 $D0
    jp   IncrementCreditsSubscene                 ;; 17:7015 $C3 $D9 $4C

CreditsTheEnd2Handler::
    ld   a, [wD006]                               ;; 17:7018 $FA $06 $D0
    and  a                                        ;; 17:701B $A7
    ret  nz                                       ;; 17:701C $C0

    call AnimateEntitiesAndRestoreBank17          ;; 17:701D $CD $ED $0E
    ret                                           ;; 17:7020 $C9

CreditsTheEnd3Handler::
    ldh  a, [hFrameCounter]                       ;; 17:7021 $F0 $E7
    and  $07                                      ;; 17:7023 $E6 $07
    ret  nz                                       ;; 17:7025 $C0

    call func_017_7FA9                            ;; 17:7026 $CD $A9 $7F
    ld   a, [wD01F]                               ;; 17:7029 $FA $1F $D0
    inc  a                                        ;; 17:702C $3C
    ld   [wD01F], a                               ;; 17:702D $EA $1F $D0
    cp   $10                                      ;; 17:7030 $FE $10
    jp   z, IncrementCreditsSubscene              ;; 17:7032 $CA $D9 $4C

    ret                                           ;; 17:7035 $C9

CreditsTheEnd4Handler::
    ld   a, TILESET_THANKS_FOR_PLAYING            ;; 17:7036 $3E $23
    ld   [wTilesetToLoad], a                      ;; 17:7038 $EA $FE $D6

    ld   hl, wBGPal2                              ;; 17:703B $21 $18 $DC
    ld   a, $FF                                   ;; 17:703E $3E $FF
    ld   [hl+], a                                 ;; 17:7040 $22
    ld   a, $47                                   ;; 17:7041 $3E $47
    ld   [hl], a                                  ;; 17:7043 $77
    ld   a, $04                                   ;; 17:7044 $3E $04
    ld   [wPalettePartialCopyColorIndexStart], a  ;; 17:7046 $EA $D3 $DD
    ld   a, $01                                   ;; 17:7049 $3E $01
    ld   [wPalettePartialCopyColorCount], a       ;; 17:704B $EA $D4 $DD
    ld   a, $81                                   ;; 17:704E $3E $81
    ld   [wPaletteDataFlags], a                   ;; 17:7050 $EA $D1 $DD
IF LANG_DE
    xor  a
    ldh  [hBaseScrollX], a
    ldh  [hBaseScrollY], a
ELSE
    ld   a, $FA                                   ;; 17:7053 $3E $FA
    ldh  [hBaseScrollX], a                        ;; 17:7055 $E0 $96
    xor  a                                        ;; 17:7057 $AF
    ldh  [hBaseScrollY], a                        ;; 17:7058 $E0 $97
ENDC
    jp   IncrementCreditsSubscene                 ;; 17:705A $C3 $D9 $4C

include "data/credits_3.asm"

CreditsTheEnd5Handler::
    ld   hl, Data_017_705D                        ;; 17:70B1 $21 $5D $70
    ld   de, wDrawCommand                         ;; 17:70B4 $11 $01 $D6
    ld   c, Data_017_705D.end - Data_017_705D     ;; 17:70B7 $0E $43

.loop_017_70B9
    ld   a, [hl+]                                 ;; 17:70B9 $2A
    ld   [de], a                                  ;; 17:70BA $12
    inc  de                                       ;; 17:70BB $13
    dec  c                                        ;; 17:70BC $0D
    jr   nz, .loop_017_70B9                       ;; 17:70BD $20 $FA

    ld   hl, Data_017_70A0                        ;; 17:70BF $21 $A0 $70
    ld   de, wDrawCommandVRAM1                    ;; 17:70C2 $11 $91 $DC
    ld   c, Data_017_70A0.end - Data_017_70A0     ;; 17:70C5 $0E $11

.loop_017_70C7
    ld   a, [hl+]                                 ;; 17:70C7 $2A
    ld   [de], a                                  ;; 17:70C8 $12
    inc  de                                       ;; 17:70C9 $13
    dec  c                                        ;; 17:70CA $0D
    jr   nz, .loop_017_70C7                       ;; 17:70CB $20 $FA

    jp   IncrementCreditsSubscene                 ;; 17:70CD $C3 $D9 $4C

CreditsTheEnd6Handler::
    ret                                           ;; 17:70D0 $C9

Data_017_70D1::
    db   $08, $00, $5C, $00, $10, $00, $5D, $00  ; $70D1 |..\...].|
    db   $00, $08, $C0, $00, $08, $08, $C1, $00  ; $70D9 |........|
    db   $00, $10, $CE, $00, $08, $10, $CF, $00  ; $70E1 |........|
    db   $00, $18, $DE, $00, $08, $18, $DF, $00  ; $70E9 |........|
    db   $00, $20, $EA, $00, $08, $20, $EB, $00  ; $70F1 |. ... ..|
    db   $08, $00, $5E, $00, $10, $00, $5F, $00  ; $70F9 |..^..._.|
    db   $00, $08, $C0, $00, $08, $08, $C1, $00  ; $7101 |........|
    db   $00, $10, $CE, $00, $08, $10, $CF, $00  ; $7109 |........|
    db   $00, $18, $DE, $00, $08, $18, $DF, $00  ; $7111 |........|
    db   $00, $20, $EA, $00, $08, $20, $EB, $00  ; $7119 |. ... ..|
    db   $08, $00, $EC, $00, $10, $00, $ED, $00  ; $7121 |........|
    db   $00, $08, $D0, $00, $08, $08, $D1, $00  ; $7129 |........|
    db   $00, $10, $CE, $00, $08, $10, $CF, $00  ; $7131 |........|
    db   $00, $18, $DE, $00, $08, $18, $DF, $00  ; $7139 |........|
    db   $00, $20, $EA, $00, $08, $20, $EB, $00  ; $7141 |. ... ..|
    db   $08, $00, $EE, $00, $10, $00, $EF, $00  ; $7149 |........|
    db   $00, $08, $D0, $00, $08, $08, $D1, $00  ; $7151 |........|
    db   $00, $10, $CE, $00, $08, $10, $CF, $00  ; $7159 |........|
    db   $00, $18, $DE, $00, $08, $18, $DF, $00  ; $7161 |........|
    db   $00, $20, $EA, $00, $08, $20, $EB, $00  ; $7169 |. ... ..|

func_017_7171::
    ld   a, $3C                                   ;; 17:7171 $3E $3C
    ld   [wOAMNextAvailableSlot], a               ;; 17:7173 $EA $C0 $C3
    ldh  a, [hBaseScrollY]                        ;; 17:7176 $F0 $97
    ld   e, a                                     ;; 17:7178 $5F
    ldh  a, [hActiveEntityVisualPosY]             ;; 17:7179 $F0 $EC
    sub  e                                        ;; 17:717B $93
    ldh  [hActiveEntityVisualPosY], a             ;; 17:717C $E0 $EC
    ldh  a, [hIsGBC]                              ;; 17:717E $F0 $FE
    and  a                                        ;; 17:7180 $A7
    jr   z, .jr_7188                              ;; 17:7181 $28 $05

    call func_017_71CD                            ;; 17:7183 $CD $CD $71
    jr   jr_017_71AC                              ;; 17:7186 $18 $24

.jr_7188
    ldh  a, [hFrameCounter]                       ;; 17:7188 $F0 $E7
    rra                                           ;; 17:718A $1F
    rra                                           ;; 17:718B $1F
    rra                                           ;; 17:718C $1F
    rra                                           ;; 17:718D $1F
    rra                                           ;; 17:718E $1F
    and  $03                                      ;; 17:718F $E6 $03
    rla                                           ;; 17:7191 $17
    rla                                           ;; 17:7192 $17
    rla                                           ;; 17:7193 $17
    and  $F8                                      ;; 17:7194 $E6 $F8
    ld   e, a                                     ;; 17:7196 $5F
    rla                                           ;; 17:7197 $17
    rla                                           ;; 17:7198 $17
    and  $E0                                      ;; 17:7199 $E6 $E0
    add  e                                        ;; 17:719B $83
    ld   e, a                                     ;; 17:719C $5F
    ld   d, b                                     ;; 17:719D $50
    ld   hl, Data_017_70D1                        ;; 17:719E $21 $D1 $70
    add  hl, de                                   ;; 17:71A1 $19
    ld   c, $0A                                   ;; 17:71A2 $0E $0A
    call RenderActiveEntitySpritesRectUsingAllOAM ;; 17:71A4 $CD $E0 $3C
    ld   a, $0A                                   ;; 17:71A7 $3E $0A
    call func_015_7964_trampoline                 ;; 17:71A9 $CD $A0 $3D

jr_017_71AC:
    ldh  a, [hFrameCounter]                       ;; 17:71AC $F0 $E7
    and  $01                                      ;; 17:71AE $E6 $01
    jr   nz, .ret_71CC                            ;; 17:71B0 $20 $1A

    ld   hl, wEntitiesSpeedXTable                 ;; 17:71B2 $21 $40 $C2
    add  hl, bc                                   ;; 17:71B5 $09
    ld   [hl], $04                                ;; 17:71B6 $36 $04
    ld   hl, wEntitiesSpeedYTable                 ;; 17:71B8 $21 $50 $C2
    add  hl, bc                                   ;; 17:71BB $09
    ld   [hl], $FF                                ;; 17:71BC $36 $FF
    call UpdateEntityPosWithSpeed_17              ;; 17:71BE $CD $2D $7E
    ldh  a, [hActiveEntityPosX]                   ;; 17:71C1 $F0 $EE
    cp   $A8                                      ;; 17:71C3 $FE $A8
    ret  c                                        ;; 17:71C5 $D8

    call IncrementCreditsSubscene                 ;; 17:71C6 $CD $D9 $4C
    jp   label_017_7CC2                           ;; 17:71C9 $C3 $C2 $7C

.ret_71CC
    ret                                           ;; 17:71CC $C9

func_017_71CD::
    ld   hl, wFarcallParams                       ;; 17:71CD $21 $01 $DE
    ld   a, BANK(func_020_7D1C)                   ;; 17:71D0 $3E $20
    ld   [hl+], a                                 ;; 17:71D2 $22
    ld   a, HIGH(func_020_7D1C)                   ;; 17:71D3 $3E $7D
    ld   [hl+], a                                 ;; 17:71D5 $22
    ld   a, LOW(func_020_7D1C)                    ;; 17:71D6 $3E $1C
    ld   [hl+], a                                 ;; 17:71D8 $22
    ld   a, BANK(@)                               ;; 17:71D9 $3E $17
    ld   [hl], a                                  ;; 17:71DB $77
    jp   Farcall                                  ;; 17:71DC $C3 $D7 $0B

Data_017_71DF::
IF __PATCH_1__
    db   $00, $00, $00, $00, $08, $00, $01, $00, $00, $08, $02, $00, $08, $08, $03, $00
    db   $00, $FA, $08, $00, $08, $FA, $09, $00, $00, $0E, $08, $20, $08, $0E, $09, $20
    db   $00, $00, $00, $00, $08, $00, $01, $00, $00, $08, $02, $00, $08, $08, $03, $00
    db   $08, $FA, $08, $40, $00, $FA, $09, $40, $08, $0E, $08, $60, $00, $0E, $09, $60
    db   $00, $08, $00, $20, $08, $08, $01, $20, $00, $00, $02, $20, $08, $00, $03, $20
    db   $00, $FA, $08, $00, $08, $FA, $09, $00, $00, $0E, $08, $20, $08, $0E, $09, $20
    db   $00, $08, $00, $20, $08, $08, $01, $20, $00, $00, $02, $20, $08, $00, $03, $20
    db   $08, $FA, $08, $40, $00, $FA, $09, $40, $08, $0E, $08, $60, $00, $0E, $09, $60
ELSE
    db   $00, $00, $00, $00, $08, $00, $01, $00, $00, $08, $02, $00, $08, $08, $03, $00
    db   $00, $FA, $10, $00, $08, $FA, $11, $00, $00, $0E, $10, $20, $08, $0E, $11, $20
    db   $00, $00, $00, $00, $08, $00, $01, $00, $00, $08, $02, $00, $08, $08, $03, $00
    db   $08, $FA, $10, $40, $00, $FA, $11, $40, $08, $0E, $10, $60, $00, $0E, $11, $60
    db   $00, $08, $00, $20, $08, $08, $01, $20, $00, $00, $02, $20, $08, $00, $03, $20
    db   $00, $FA, $10, $00, $08, $FA, $11, $00, $00, $0E, $10, $20, $08, $0E, $11, $20
    db   $00, $08, $00, $20, $08, $08, $01, $20, $00, $00, $02, $20, $08, $00, $03, $20
    db   $08, $FA, $10, $40, $00, $FA, $11, $40, $08, $0E, $10, $60, $00, $0E, $11, $60
ENDC

func_017_725F::
    ld   hl, wDeathCount                          ;; 17:725F $21 $57 $DB
    ld   a, [hl+]                                 ;; 17:7262 $2A
    or   [hl]                                     ;; 17:7263 $B6
    jr   nz, .jr_7293                             ;; 17:7264 $20 $2D

    ldh  a, [hIsGBC]                              ;; 17:7266 $F0 $FE
    and  a                                        ;; 17:7268 $A7
    jr   nz, jr_017_72BD                          ;; 17:7269 $20 $52

    ld   a, $1C                                   ;; 17:726B $3E $1C
    ld   [wOBJ0Palette], a                        ;; 17:726D $EA $98 $DB
    ld   a, $3C                                   ;; 17:7270 $3E $3C
    ld   [wOAMNextAvailableSlot], a               ;; 17:7272 $EA $C0 $C3
    ldh  a, [hFrameCounter]                       ;; 17:7275 $F0 $E7
    rra                                           ;; 17:7277 $1F
    rra                                           ;; 17:7278 $1F
    rra                                           ;; 17:7279 $1F
    and  $03                                      ;; 17:727A $E6 $03
    rla                                           ;; 17:727C $17
    rla                                           ;; 17:727D $17
    rla                                           ;; 17:727E $17
    rla                                           ;; 17:727F $17
    rla                                           ;; 17:7280 $17
    and  $E0                                      ;; 17:7281 $E6 $E0
    ld   e, a                                     ;; 17:7283 $5F
    ld   d, b                                     ;; 17:7284 $50
    ld   hl, Data_017_71DF                        ;; 17:7285 $21 $DF $71
    add  hl, de                                   ;; 17:7288 $19
    ld   c, $08                                   ;; 17:7289 $0E $08
    call RenderActiveEntitySpritesRectUsingAllOAM ;; 17:728B $CD $E0 $3C
    ld   a, $08                                   ;; 17:728E $3E $08
    call func_015_7964_trampoline                 ;; 17:7290 $CD $A0 $3D

.jr_7293
    call UpdateEntityPosWithSpeed_17              ;; 17:7293 $CD $2D $7E
    ldh  a, [hFrameCounter]                       ;; 17:7296 $F0 $E7
    and  $0F                                      ;; 17:7298 $E6 $0F
    jr   nz, .jr_72A6                             ;; 17:729A $20 $0A

    ld   hl, wEntitiesSpeedYTable                 ;; 17:729C $21 $50 $C2
    add  hl, bc                                   ;; 17:729F $09
    ld   a, [hl]                                  ;; 17:72A0 $7E
    cp   $FC                                      ;; 17:72A1 $FE $FC
    jr   z, .jr_72A6                              ;; 17:72A3 $28 $01

    dec  [hl]                                     ;; 17:72A5 $35

.jr_72A6
    ldh  a, [hActiveEntityPosX]                   ;; 17:72A6 $F0 $EE
    cp   $A8                                      ;; 17:72A8 $FE $A8
    jp   z, label_017_7CC2                        ;; 17:72AA $CA $C2 $7C

    ld   hl, wEntitiesInertiaTable                ;; 17:72AD $21 $D0 $C3
    add  hl, bc                                   ;; 17:72B0 $09
    ld   a, [hl]                                  ;; 17:72B1 $7E
    inc  a                                        ;; 17:72B2 $3C
    ld   [hl], a                                  ;; 17:72B3 $77
    and  $7F                                      ;; 17:72B4 $E6 $7F
    jr   nz, .ret_72BC                            ;; 17:72B6 $20 $04

    ld   a, JINGLE_SEAGULL                        ;; 17:72B8 $3E $21
    ldh  [hJingle], a                             ;; 17:72BA $E0 $F2

.ret_72BC
    ret                                           ;; 17:72BC $C9

jr_017_72BD:
    ld   hl, wFarcallParams                       ;; 17:72BD $21 $01 $DE
    ld   a, BANK(func_027_7854)                   ;; 17:72C0 $3E $27
    ld   [hl+], a                                 ;; 17:72C2 $22
    ld   [wCurrentBank], a                        ;; 17:72C3 $EA $AF $DB
    ld   a, HIGH(func_027_7854)                   ;; 17:72C6 $3E $78
    ld   [hl+], a                                 ;; 17:72C8 $22
    ld   a, LOW(func_027_7854)                    ;; 17:72C9 $3E $54
    ld   [hl+], a                                 ;; 17:72CB $22
    ld   a, BANK(@)                               ;; 17:72CC $3E $17
    ld   [hl], a                                  ;; 17:72CE $77
    call Farcall                                  ;; 17:72CF $CD $D7 $0B
    ld   a, BANK(@)                               ;; 17:72D2 $3E $17
    ld   [wCurrentBank], a                        ;; 17:72D4 $EA $AF $DB
    ret                                           ;; 17:72D7 $C9

Data_017_72D8::
    db   $00, $00, $4C, $00, $08, $00, $4D, $00, $00, $08, $4E, $00, $08, $08, $4F, $00
    db   $10, $F8, $60, $00, $18, $F8, $61, $00, $10, $00, $62, $00, $18, $00, $63, $00
    db   $10, $08, $64, $00, $18, $08, $65, $00, $10, $10, $66, $00, $18, $10, $67, $00
    db   $00, $00, $4C, $00, $08, $00, $4D, $00, $00, $08, $4E, $00, $08, $08, $4F, $00
    db   $10, $F8, $68, $00, $18, $F8, $69, $00, $10, $00, $6A, $00, $18, $00, $6B, $00
    db   $10, $08, $6C, $00, $18, $08, $6D, $00, $10, $10, $6E, $00, $18, $10, $6F, $00
    db   $00, $00, $4C, $00, $08, $00, $4D, $00, $00, $08, $4E, $00, $08, $08, $4F, $00
    db   $10, $F8, $70, $00, $18, $F8, $71, $00, $10, $00, $72, $00, $18, $00, $73, $00
    db   $10, $08, $74, $00, $18, $08, $75, $00, $10, $10, $76, $00, $18, $10, $77, $00
    db   $00, $00, $4C, $00, $08, $00, $4D, $00, $00, $08, $4E, $00, $08, $08, $4F, $00
    db   $10, $F8, $78, $00, $18, $F8, $79, $00, $10, $00, $7A, $00, $18, $00, $7B, $00
    db   $10, $08, $7C, $00, $18, $08, $7D, $00, $10, $10, $7E, $00, $18, $10, $7F, $00

func_017_7398::
    ld   a, $3C                                   ;; 17:7398 $3E $3C
    ld   [wOAMNextAvailableSlot], a               ;; 17:739A $EA $C0 $C3
    ldh  a, [hFrameCounter]                       ;; 17:739D $F0 $E7
    and  $03                                      ;; 17:739F $E6 $03
    jr   nz, jr_017_73AF                          ;; 17:73A1 $20 $0C

    ld   a, [wD00F]                               ;; 17:73A3 $FA $0F $D0

.jr_73A6
    inc  a                                        ;; 17:73A6 $3C
    cp   $31                                      ;; 17:73A7 $FE $31
    jr   c, .jr_73AC                              ;; 17:73A9 $38 $01

    xor  a                                        ;; 17:73AB $AF

.jr_73AC
    ld   [wD00F], a                               ;; 17:73AC $EA $0F $D0

jr_017_73AF:
    ld   a, [wD00F]                               ;; 17:73AF $FA $0F $D0
    ld   e, a                                     ;; 17:73B2 $5F
    ld   d, b                                     ;; 17:73B3 $50
    ld   hl, Data_017_76AD                        ;; 17:73B4 $21 $AD $76
    add  hl, de                                   ;; 17:73B7 $19
    ldh  a, [hBaseScrollY]                        ;; 17:73B8 $F0 $97
    ld   d, a                                     ;; 17:73BA $57
    ld   a, [hl]                                  ;; 17:73BB $7E
    sra  a                                        ;; 17:73BC $CB $2F
    ld   e, a                                     ;; 17:73BE $5F
    ldh  a, [hActiveEntityVisualPosY]             ;; 17:73BF $F0 $EC
    add  e                                        ;; 17:73C1 $83
    sub  d                                        ;; 17:73C2 $92
    ldh  [hActiveEntityVisualPosY], a             ;; 17:73C3 $E0 $EC
    ldh  a, [hIsGBC]                              ;; 17:73C5 $F0 $FE
    and  a                                        ;; 17:73C7 $A7
    jr   nz, .jr_73ED                             ;; 17:73C8 $20 $23

    ldh  a, [hFrameCounter]                       ;; 17:73CA $F0 $E7
    rra                                           ;; 17:73CC $1F
    rra                                           ;; 17:73CD $1F
    rra                                           ;; 17:73CE $1F
    and  $03                                      ;; 17:73CF $E6 $03
    rla                                           ;; 17:73D1 $17
    rla                                           ;; 17:73D2 $17
    rla                                           ;; 17:73D3 $17
    rla                                           ;; 17:73D4 $17
    and  $F0                                      ;; 17:73D5 $E6 $F0
    ld   e, a                                     ;; 17:73D7 $5F
    rla                                           ;; 17:73D8 $17
    and  $E0                                      ;; 17:73D9 $E6 $E0
    add  e                                        ;; 17:73DB $83
    ld   e, a                                     ;; 17:73DC $5F
    ld   d, b                                     ;; 17:73DD $50
    ld   hl, Data_017_72D8                        ;; 17:73DE $21 $D8 $72
    add  hl, de                                   ;; 17:73E1 $19
    ld   c, $0C                                   ;; 17:73E2 $0E $0C
    call RenderActiveEntitySpritesRectUsingAllOAM ;; 17:73E4 $CD $E0 $3C
    ld   a, $0C                                   ;; 17:73E7 $3E $0C
    call func_015_7964_trampoline                 ;; 17:73E9 $CD $A0 $3D
    ret                                           ;; 17:73EC $C9

.jr_73ED
    ld   hl, wFarcallParams                       ;; 17:73ED $21 $01 $DE
    ld   a, BANK(func_027_782E)                   ;; 17:73F0 $3E $27
    ld   [hl+], a                                 ;; 17:73F2 $22
    ld   a, HIGH(func_027_782E)                   ;; 17:73F3 $3E $78
    ld   [hl+], a                                 ;; 17:73F5 $22
    ld   a, LOW(func_027_782E)                    ;; 17:73F6 $3E $2E
    ld   [hl+], a                                 ;; 17:73F8 $22
    ld   a, BANK(@)                               ;; 17:73F9 $3E $17
    ld   [hl], a                                  ;; 17:73FB $77
    jp   Farcall                                  ;; 17:73FC $C3 $D7 $0B

Data_017_73FF::
    db   $00, $00, $00, $00, $00, $08, $02, $00, $00, $10, $04, $00, $00, $18, $06, $00
    db   $00, $20, $08, $00, $00, $28, $0A, $00, $10, $20, $14, $00, $10, $28, $16, $00
    db   $20, $20, $1E, $00, $20, $28, $20, $00, $30, $00, $50, $00, $30, $08, $22, $00
    db   $30, $10, $24, $00, $30, $18, $26, $00, $30, $20, $28, $00, $30, $28, $2A, $00
    db   $30, $30, $2C, $00, $30, $38, $2E, $00, $40, $00, $30, $00, $40, $08, $32, $00
    db   $40, $10, $34, $00, $40, $18, $36, $00, $40, $20, $38, $00, $40, $28, $3A, $00
    db   $40, $30, $3C, $00, $40, $38, $3E, $00, $40, $40, $40, $00

Data_017_746B::
    db   $10, $00, $0C, $00, $10, $08, $0E, $00, $10, $10, $10, $00, $10, $18, $12, $00
    db   $20, $08, $18, $00, $20, $10, $1A, $00, $20, $18, $1C, $00, $FF, $FF, $FF, $FF
    db   $10, $00, $0C, $00, $10, $08, $42, $00, $10, $10, $44, $00, $10, $18, $46, $00
    db   $20, $08, $18, $00, $20, $10, $48, $00, $20, $18, $4A, $00, $FF, $FF, $FF, $FF
    db   $10, $00, $0C, $00, $10, $08, $52, $00, $10, $10, $54, $00, $10, $18, $56, $00
    db   $20, $08, $18, $00, $20, $10, $58, $00, $20, $18, $5A, $00, $FF, $FF, $FF, $FF

func_017_74CB::
    ld   a, [wD00F]                               ;; 17:74CB $FA $0F $D0
    ld   e, a                                     ;; 17:74CE $5F
    ld   d, b                                     ;; 17:74CF $50
    ld   hl, Data_017_76AD                        ;; 17:74D0 $21 $AD $76
    add  hl, de                                   ;; 17:74D3 $19
    ld   a, [hl]                                  ;; 17:74D4 $7E
    sra  a                                        ;; 17:74D5 $CB $2F
    ld   e, a                                     ;; 17:74D7 $5F
    ldh  a, [hActiveEntityVisualPosY]             ;; 17:74D8 $F0 $EC
    add  e                                        ;; 17:74DA $83
    ldh  [hActiveEntityVisualPosY], a             ;; 17:74DB $E0 $EC

.jr_74DD
    ldh  a, [hIsGBC]                              ;; 17:74DD $F0 $FE
    and  a                                        ;; 17:74DF $A7

.jr_74E0
    jr   nz, .jr_750F                             ;; 17:74E0 $20 $2D

    ld   hl, Data_017_73FF                        ;; 17:74E2 $21 $FF $73
    ld   c, $1B                                   ;; 17:74E5 $0E $1B
    call RenderActiveEntitySpritesRectUsingAllOAM ;; 17:74E7 $CD $E0 $3C
    ld   a, $1B                                   ;; 17:74EA $3E $1B
    call func_015_7964_trampoline                 ;; 17:74EC $CD $A0 $3D
    ld   a, [wD003]                               ;; 17:74EF $FA $03 $D0
    rla                                           ;; 17:74F2 $17
    rla                                           ;; 17:74F3 $17
    rla                                           ;; 17:74F4 $17
    rla                                           ;; 17:74F5 $17
    rla                                           ;; 17:74F6 $17
    and  $E0                                      ;; 17:74F7 $E6 $E0
    ld   e, a                                     ;; 17:74F9 $5F
    ld   d, b                                     ;; 17:74FA $50
    ld   hl, Data_017_746B                        ;; 17:74FB $21 $6B $74
    add  hl, de                                   ;; 17:74FE $19
    ld   c, $07                                   ;; 17:74FF $0E $07
    ld   a, $40                                   ;; 17:7501 $3E $40
    ld   [wOAMNextAvailableSlot], a               ;; 17:7503 $EA $C0 $C3
    call RenderActiveEntitySpritesRect            ;; 17:7506 $CD $E6 $3C
    ld   a, $07                                   ;; 17:7509 $3E $07
    call func_015_7964_trampoline                 ;; 17:750B $CD $A0 $3D
    ret                                           ;; 17:750E $C9

.jr_750F
    ld   hl, wFarcallParams                       ;; 17:750F $21 $01 $DE
    ld   a, BANK(func_027_774C)                   ;; 17:7512 $3E $27
    ld   [hl+], a                                 ;; 17:7514 $22
    ld   a, HIGH(func_027_774C)                   ;; 17:7515 $3E $77
    ld   [hl+], a                                 ;; 17:7517 $22
    ld   a, LOW(func_027_774C)                    ;; 17:7518 $3E $4C
    ld   [hl+], a                                 ;; 17:751A $22
    ld   a, BANK(@)                               ;; 17:751B $3E $17
    ld   [hl], a                                  ;; 17:751D $77
    jp   Farcall                                  ;; 17:751E $C3 $D7 $0B

Data_017_7521::
    db   $00, $00, $70, $07, $00, $00, $70, $07, $00, $00, $70, $07, $00, $00, $70, $07
    db   $08, $08, $5C, $07, $08, $08, $5C, $07, $00, $00, $70, $07, $08, $08, $5E, $07
    db   $08, $10, $60, $07

func_017_7545::
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 17:7545 $21 $40 $C3
    add  hl, bc                                   ;; 17:7548 $09
    ld   [hl], 3 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 17:7549 $36 $C3
    ldh  a, [hActiveEntitySpriteVariant]          ;; 17:754B $F0 $F1
    rla                                           ;; 17:754D $17
    rla                                           ;; 17:754E $17
    and  $FC                                      ;; 17:754F $E6 $FC
    ld   e, a                                     ;; 17:7551 $5F
    rla                                           ;; 17:7552 $17
    and  $F8                                      ;; 17:7553 $E6 $F8
    add  e                                        ;; 17:7555 $83
    ld   e, a                                     ;; 17:7556 $5F
    ld   d, b                                     ;; 17:7557 $50
    ld   hl, Data_017_7521                        ;; 17:7558 $21 $21 $75
    add  hl, de                                   ;; 17:755B $19
    ld   c, $03                                   ;; 17:755C $0E $03
    call RenderActiveEntitySpritesRect            ;; 17:755E $CD $E6 $3C
    call GetEntityTransitionCountdown             ;; 17:7561 $CD $05 $0C
    cp   $01                                      ;; 17:7564 $FE $01
    jr   z, .jr_756C                              ;; 17:7566 $28 $04

    cp   $30                                      ;; 17:7568 $FE $30
    jr   nz, ret_017_7571                         ;; 17:756A $20 $05

.jr_756C
    ld   hl, wEntitiesSpriteVariantTable          ;; 17:756C $21 $B0 $C3
    add  hl, bc                                   ;; 17:756F $09
    inc  [hl]                                     ;; 17:7570 $34

ret_017_7571:
    ret                                           ;; 17:7571 $C9

Data_017_7572::
    db   $00, $00, $62, $10, $00, $08, $62, $30   ;; 17:7572
    db   $10, $F0, $64, $10, $10, $F8, $66, $10   ;; 17:757A
    db   $10, $00, $68, $10, $10, $08, $68, $30   ;; 17:7582
    db   $10, $10, $66, $30, $10, $18, $64, $30   ;; 17:758A
    db   $20, $00, $6A, $10, $20, $08, $6A, $30   ;; 17:7592
    db   $30, $F8, $6C, $10, $30, $00, $6E, $10   ;; 17:759A
    db   $30, $08, $6E, $30, $30, $10, $6C, $30   ;; 17:75A2

func_017_75AA::
    xor   a                                       ;; 17:75AA $C0
    ld   [wOAMNextAvailableSlot], a               ;; 17:75AB $EA $C0 $C3

    ld   hl, hBaseScrollY                         ;; 17:75AE $21 $97 $FF
    ldh  a, [hActiveEntityVisualPosY]             ;; 17:75B1 $F0 $EC
    sub  [hl]                                     ;; 17:75B3 $96
    ldh  [hActiveEntityVisualPosY], a             ;; 17:75B4 $E0 $EC

    ld   hl, Data_017_7572                        ;; 17:75B6 $21 $72 $75
    ld   c, $0E                                   ;; 17:75B9 $0E $0E
    call RenderActiveEntitySpritesRect            ;; 17:75BB $CD $E6 $3C
    ld   a, $0E                                   ;; 17:75BE $3E $0E
    call func_015_7964_trampoline                 ;; 17:75C0 $CD $A0 $3D
    ld   hl, wEntitiesSpeedYTable                 ;; 17:75C3 $21 $50 $C2
    add  hl, bc                                   ;; 17:75C6 $09
    ld   [hl], $FE                                ;; 17:75C7 $36 $FE
    call UpdateEntityYPosWithSpeed_17             ;; 17:75C9 $CD $30 $7E
    ldh  a, [hActiveEntityState]                  ;; 17:75CC $F0 $F0
    cp   $02                                      ;; 17:75CE $FE $02
    jr   nc, ret_017_75E0                         ;; 17:75D0 $30 $0E

    call GetEntityTransitionCountdown             ;; 17:75D2 $CD $05 $0C
    jr   nz, ret_017_75E0                         ;; 17:75D5 $20 $09

.jr_75D7
    ld   [hl], $C0                                ;; 17:75D7 $36 $C0
    call IncrementEntityState                     ;; 17:75D9 $CD $12 $3B
    ld   a, WAVE_SFX_WIND_FISH_CRY                ;; 17:75DC $3E $17
    ldh  [hWaveSfx], a                            ;; 17:75DE $E0 $F3

ret_017_75E0:
    ret                                           ;; 17:75E0 $C9

Data_017_75E1::
    db   $00, $08, $B2, $00, $00, $10, $B4, $00   ;; 17:75E1
    db   $00, $18, $B6, $00, $00, $20, $B8, $00   ;; 17:75E9
    db   $10, $10, $BA, $00, $10, $18, $BC, $00   ;; 17:75F1
    db   $10, $20, $86, $00, $20, $00, $88, $00   ;; 17:75F9
    db   $20, $08, $8A, $00, $20, $10, $8C, $00   ;; 17:7601
    db   $20, $18, $8E, $00, $20, $20, $94, $00   ;; 17:7609
    db   $30, $00, $98, $00, $30, $08, $9A, $00   ;; 17:7611
    db   $30, $10, $A4, $00, $30, $18, $A8, $00   ;; 17:7619
    db   $30, $20, $AA, $00, $00, $08, $C2, $00   ;; 17:7621
    db   $00, $10, $C4, $00, $00, $18, $C6, $00   ;; 17:7629
    db   $00, $20, $C8, $00, $10, $10, $CA, $00   ;; 17:7631
    db   $10, $18, $CC, $00, $10, $20, $96, $00   ;; 17:7639
    db   $20, $00, $88, $00, $20, $08, $8A, $00   ;; 17:7641
    db   $20, $10, $8C, $00, $20, $18, $8E, $00   ;; 17:7649
    db   $20, $20, $94, $00, $30, $00, $98, $00   ;; 17:7651
    db   $30, $08, $9A, $00, $30, $10, $A4, $00   ;; 17:7659
    db   $30, $18, $A8, $00, $30, $20, $AA, $00   ;; 17:7661
    db   $00, $08, $D2, $00, $00, $10, $D4, $00   ;; 17:7669
    db   $00, $18, $D6, $00, $00, $20, $D8, $00   ;; 17:7671
    db   $10, $10, $DA, $00, $10, $18, $DC, $00   ;; 17:7679
    db   $10, $20, $A6, $00, $20, $00, $88, $00   ;; 17:7681
    db   $20, $08, $8A, $00, $20, $10, $8C, $00   ;; 17:7689
    db   $20, $18, $8E, $00, $20, $20, $94, $00   ;; 17:7691
    db   $30, $00, $98, $00, $30, $08, $9A, $00   ;; 17:7699
    db   $30, $10, $A4, $00, $30, $18, $A8, $00   ;; 17:76A1
    db   $30, $20, $AA, $00                       ;; 17:76A9

Data_017_76AD::
    db   $00, $00, $00, $00, $00, $00, $01, $01   ;; 17:76AD
    db   $01, $01, $02, $02, $02, $03, $03, $04   ;; 17:76B5
    db   $05, $05, $06, $06, $06, $07, $07, $07   ;; 17:76BD
    db   $07, $08, $08, $08, $08, $08, $08, $07   ;; 17:76C5
    db   $07, $07, $07, $06, $06, $06, $05, $05   ;; 17:76CD
    db   $04, $03, $02, $02, $02, $01, $01, $01   ;; 17:76D5
    db   $01

func_017_76DE::
    ld   a, $00
    ld   [wOAMNextAvailableSlot], a               ;; 17:76E0 $EA $C0 $C3
    ldh  a, [hBaseScrollY]                        ;; 17:76E3 $F0 $97
    ld   d, a                                     ;; 17:76E5 $57
    sra  a                                        ;; 17:76E6 $CB $2F
    add  d                                        ;; 17:76E8 $82
    ldh  [hMultiPurpose0], a                      ;; 17:76E9 $E0 $D7
    ldh  a, [hFrameCounter]                       ;; 17:76EB $F0 $E7
    and  $03                                      ;; 17:76ED $E6 $03
    jr   nz, jr_017_76FD                          ;; 17:76EF $20 $0C

    ld   a, [wD00F]                               ;; 17:76F1 $FA $0F $D0
    inc  a                                        ;; 17:76F4 $3C
    cp   $31                                      ;; 17:76F5 $FE $31
    jr   c, .jr_76FA                              ;; 17:76F7 $38 $01

    xor  a                                        ;; 17:76F9 $AF

.jr_76FA
    ld   [wD00F], a                               ;; 17:76FA $EA $0F $D0

jr_017_76FD:
    ld   a, [wD00F]                               ;; 17:76FD $FA $0F $D0
    ld   e, a                                     ;; 17:7700 $5F
    ld   d, b                                     ;; 17:7701 $50
    ld   hl, Data_017_76AD                        ;; 17:7702 $21 $AD $76
    add  hl, de                                   ;; 17:7705 $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 17:7706 $F0 $EC
    add  [hl]                                     ;; 17:7708 $86
    ld   hl, hMultiPurpose0                       ;; 17:7709 $21 $D7 $FF
    sub  [hl]                                     ;; 17:770C $96
    ldh  [hActiveEntityVisualPosY], a             ;; 17:770D $E0 $EC
    cp   $A8                                      ;; 17:770F $FE $A8
    jp   nc, label_017_7CC2                       ;; 17:7711 $D2 $C2 $7C

    ldh  a, [hIsGBC]                              ;; 17:7714 $F0 $FE
    and  a                                        ;; 17:7716 $A7
    jr   nz, .jr_7739                             ;; 17:7717 $20 $20

    ld   a, [wCreditsScratch0]                    ;; 17:7719 $FA $00 $D0
    rla                                           ;; 17:771C $17
    rla                                           ;; 17:771D $17
    and  $FC                                      ;; 17:771E $E6 $FC
    ld   e, a                                     ;; 17:7720 $5F
    rla                                           ;; 17:7721 $17
    rla                                           ;; 17:7722 $17
    rla                                           ;; 17:7723 $17
    rla                                           ;; 17:7724 $17
    and  $C0                                      ;; 17:7725 $E6 $C0
    add  e                                        ;; 17:7727 $83
    ld   e, a                                     ;; 17:7728 $5F
    ld   d, b                                     ;; 17:7729 $50
    ld   hl, Data_017_75E1                        ;; 17:772A $21 $E1 $75
    add  hl, de                                   ;; 17:772D $19
    ld   c, $11                                   ;; 17:772E $0E $11
    call RenderActiveEntitySpritesRect            ;; 17:7730 $CD $E6 $3C
    ld   a, $11                                   ;; 17:7733 $3E $11
    call func_015_7964_trampoline                 ;; 17:7735 $CD $A0 $3D
    ret                                           ;; 17:7738 $C9

.jr_7739
    ld   hl, wFarcallParams                       ;; 17:7739 $21 $01 $DE
    ld   a, BANK(func_027_7660)                   ;; 17:773C $3E $27
    ld   [hl+], a                                 ;; 17:773E $22
    ld   a, HIGH(func_027_7660)                   ;; 17:773F $3E $76
    ld   [hl+], a                                 ;; 17:7741 $22
    ld   a, LOW(func_027_7660)                    ;; 17:7742 $3E $60
    ld   [hl+], a                                 ;; 17:7744 $22
    ld   a, BANK(@)                               ;; 17:7745 $3E $17
    ld   [hl], a                                  ;; 17:7747 $77
    jp   Farcall                                  ;; 17:7748 $C3 $D7 $0B

Data_017_774B::
    db   $00, $00, $70, $07, $08, $08, $5E, $07   ;; 17:774B
    db   $08, $10, $60, $07                       ;; 17:7753

func_017_7757::
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 17:7757 $21 $40 $C3
    add  hl, bc                                   ;; 17:775A $09
    ld   [hl], 3 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 17:775B $36 $C3
    ld   hl, Data_017_774B                        ;; 17:775D $21 $4B $77
    ld   c, $03                                   ;; 17:7760 $0E $03
    call RenderActiveEntitySpritesRect            ;; 17:7762 $CD $E6 $3C
    ret                                           ;; 17:7765 $C9

Data_017_7766::
    db   $50, $00, $52, $00, $54, $00, $56, $00   ;; 17:7766
    db   $57, $00, $5A, $00                       ;; 17:776E

func_017_7772::
    ldh  a, [hFrameCounter]                       ;; 17:7772 $F0 $E7
    and  $07                                      ;; 17:7774 $E6 $07
    jr   nz, jr_017_7784                          ;; 17:7776 $20 $0C

    ld   hl, wEntitiesSpriteVariantTable          ;; 17:7778 $21 $B0 $C3
    add  hl, bc                                   ;; 17:777B $09
    ld   a, [hl]                                  ;; 17:777C $7E
    inc  a                                        ;; 17:777D $3C
    cp   $06                                      ;; 17:777E $FE $06
    jr   nz, .jr_7783                             ;; 17:7780 $20 $01

    xor  a                                        ;; 17:7782 $AF

.jr_7783
    ld   [hl], a                                  ;; 17:7783 $77

jr_017_7784:
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 17:7784 $21 $40 $C3
    add  hl, bc                                   ;; 17:7787 $09
    ld   [hl], 1 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 17:7788 $36 $C1
    ld   hl, wEntitiesSpeedXTable                 ;; 17:778A $21 $40 $C2
    add  hl, bc                                   ;; 17:778D $09
    ld   a, [hl]                                  ;; 17:778E $7E
    and  $80                                      ;; 17:778F $E6 $80
    jr   z, .jr_7798                              ;; 17:7791 $28 $05

    ; X-flip the entity
    ld   hl, hActiveEntityFlipAttribute           ;; 17:7793 $21 $ED $FF
    set  OAMB_XFLIP, [hl]                         ;; 17:7796 $CB $EE

.jr_7798
    ld   de, Data_017_7766                        ;; 17:7798 $11 $66 $77
    call RenderActiveEntitySprite                 ;; 17:779B $CD $77 $3C
    call AddEntitySpeedToPos_17                   ;; 17:779E $CD $3A $7E
    ldh  a, [hActiveEntityPosX]                   ;; 17:77A1 $F0 $EE
    cp   $B0                                      ;; 17:77A3 $FE $B0
    jp   nc, label_017_7CC2                       ;; 17:77A5 $D2 $C2 $7C

    ret                                           ;; 17:77A8 $C9

Data_017_77A9::
    db   $00, $08, $0E, $00, $00, $10, $1E, $00   ;; 17:77A9
    db   $00, $18, $2E, $00, $10, $00, $50, $00   ;; 17:77B1
    db   $10, $08, $52, $00, $10, $10, $54, $00   ;; 17:77B9
    db   $10, $18, $58, $00                       ;; 17:77C1

Data_017_77C5::
    db   $00, $08, $0E, $00, $00, $10, $1E, $00   ;; 17:77C5
    db   $00, $18, $2E, $00, $10, $00, $60, $00   ;; 17:77CD
    db   $10, $08, $62, $00, $10, $10, $64, $00   ;; 17:77D5
    db   $10, $18, $68, $00

Data_017_77E1::
    db   $00, $00, $00, $01, $02, $02, $02, $01   ;; 17:77E1

Data_017_77E9::
    db   $00, $00, $00, $00, $01, $01, $01, $01   ;; 17:77E9

func_017_77F1::
    ld   hl, wEntitiesPhysicsFlagsTable
    add  hl, bc
    ld   [hl], $C7
    ld   a, $00                                   ;; 17:77F7 $3E $00
    ld   [wOAMNextAvailableSlot], a               ;; 17:77F9 $EA $C0 $C3
    ldh  a, [hFrameCounter]                       ;; 17:77FC $F0 $E7

.jr_77FE
    rra                                           ;; 17:77FE $1F
    rra                                           ;; 17:77FF $1F
    rra                                           ;; 17:7800 $1F
    rra                                           ;; 17:7801 $1F
    and  $07                                      ;; 17:7802 $E6 $07
    ld   e, a                                     ;; 17:7804 $5F
    ld   d, b                                     ;; 17:7805 $50
    ld   hl, Data_017_77E1                        ;; 17:7806 $21 $E1 $77
    add  hl, de                                   ;; 17:7809 $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 17:780A $F0 $EC
    add  [hl]                                     ;; 17:780C $86
    ldh  [hActiveEntityVisualPosY], a             ;; 17:780D $E0 $EC
    ldh  a, [hIsGBC]                              ;; 17:780F $F0 $FE
    and  a                                        ;; 17:7811 $A7
    jr   nz, jr_017_7826                          ;; 17:7812 $20 $12

    ld   hl, Data_017_77A9                        ;; 17:7814 $21 $A9 $77
    ldh  a, [hFrameCounter]                       ;; 17:7817 $F0 $E7
    and  $10                                      ;; 17:7819 $E6 $10
    jr   z, .jr_7820                              ;; 17:781B $28 $03

    ld   hl, Data_017_77C5                        ;; 17:781D $21 $C5 $77

.jr_7820
    ld   c, $07                                   ;; 17:7820 $0E $07
    call RenderActiveEntitySpritesRect            ;; 17:7822 $CD $E6 $3C
    ret                                           ;; 17:7825 $C9

jr_017_7826:
    ld   hl, wFarcallParams                       ;; 17:7826 $21 $01 $DE
    ld   a, BANK(func_027_72E4)                   ;; 17:7829 $3E $27
    ld   [hl+], a                                 ;; 17:782B $22
    ld   a, HIGH(func_027_72E4)                   ;; 17:782C $3E $72
    ld   [hl+], a                                 ;; 17:782E $22
    ld   a, LOW(func_027_72E4)                    ;; 17:782F $3E $E4
    ld   [hl+], a                                 ;; 17:7831 $22
    ld   a, BANK(@)                               ;; 17:7832 $3E $17
    ld   [hl], a                                  ;; 17:7834 $77
    jp   Farcall                                  ;; 17:7835 $C3 $D7 $0B

Data_017_7838::
    db   $5A, $03, $6A, $03                       ;; 17:7838

func_017_783C::
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 17:783C $21 $40 $C3
    add  hl, bc                                   ;; 17:783F $09
    ld   [hl], 1 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 17:7840 $36 $C1
    ld   a, c                                     ;; 17:7842 $79
    rla                                           ;; 17:7843 $17
    and  $06                                      ;; 17:7844 $E6 $06
    ld   e, a                                     ;; 17:7846 $5F
    ldh  a, [hFrameCounter]                       ;; 17:7847 $F0 $E7
    rra                                           ;; 17:7849 $1F
    rra                                           ;; 17:784A $1F
    rra                                           ;; 17:784B $1F
    rra                                           ;; 17:784C $1F
    add  e                                        ;; 17:784D $83
    and  $07                                      ;; 17:784E $E6 $07
    ld   e, a                                     ;; 17:7850 $5F
    ld   d, b                                     ;; 17:7851 $50
    ld   hl, Data_017_77E9                        ;; 17:7852 $21 $E9 $77
    add  hl, de                                   ;; 17:7855 $19
    ldh  a, [hActiveEntityVisualPosY]             ;; 17:7856 $F0 $EC
    add  [hl]                                     ;; 17:7858 $86
    ldh  [hActiveEntityVisualPosY], a             ;; 17:7859 $E0 $EC
    ldh  a, [hIsGBC]                              ;; 17:785B $F0 $FE
    and  a                                        ;; 17:785D $A7
    jr   nz, .jr_7867                             ;; 17:785E $20 $07

    ld   de, Data_017_7838                        ;; 17:7860 $11 $38 $78
    call RenderActiveEntitySprite                 ;; 17:7863 $CD $77 $3C
    ret                                           ;; 17:7866 $C9

.jr_7867
    ld   hl, wFarcallParams                       ;; 17:7867 $21 $01 $DE
    ld   a, BANK(func_027_7306)                   ;; 17:786A $3E $27
    ld   [hl+], a                                 ;; 17:786C $22
    ld   a, HIGH(func_027_7306)                   ;; 17:786D $3E $73
    ld   [hl+], a                                 ;; 17:786F $22
    ld   a, LOW(func_027_7306)                    ;; 17:7870 $3E $06
    ld   [hl+], a                                 ;; 17:7872 $22
    ld   a, BANK(@)                               ;; 17:7873 $3E $17
    ld   [hl], a                                  ;; 17:7875 $77
    jp   Farcall                                  ;; 17:7876 $C3 $D7 $0B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknow001SpriteVariants::
.variant0 ;; 17:7879
    db $54, OAM_GBC_PAL_4
    db $64, OAM_GBC_PAL_4
.variant1 ;; 17:787D
    db $64, OAM_GBC_PAL_4 | OAMF_XFLIP
    db $54, OAM_GBC_PAL_4 | OAMF_XFLIP
.variant2 ;; 17:7881
    db $4E, OAM_GBC_PAL_4
    db $7E, OAM_GBC_PAL_4

func_017_7885::
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 17:7885 $21 $40 $C3
    add  hl, bc                                   ;; 17:7888 $09
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 17:7889 $36 $C2
    ldh  a, [hActiveEntitySpriteVariant]          ;; 17:788B $F0 $F1
    cp   $01                                      ;; 17:788D $FE $01
    jr   z, jr_017_78B7                           ;; 17:788F $28 $26

    cp   $02                                      ;; 17:7891 $FE $02
    jr   z, jr_017_78C4                           ;; 17:7893 $28 $2F

    ld   a, [wD00A]                               ;; 17:7895 $FA $0A $D0

jr_017_7898:
    ld   e, a                                     ;; 17:7898 $5F
    ld   d, b                                     ;; 17:7899 $50
    ld   hl, Data_017_634C                        ;; 17:789A $21 $4C $63
    add  hl, de                                   ;; 17:789D $19
    ld   a, [hl]                                  ;; 17:789E $7E
    sub  $04                                      ;; 17:789F $D6 $04

jr_017_78A1:
    cpl                                           ;; 17:78A1 $2F
    inc  a                                        ;; 17:78A2 $3C
    sra  a                                        ;; 17:78A3 $CB $2F
    ld   e, a                                     ;; 17:78A5 $5F
    ldh  a, [hActiveEntityVisualPosY]             ;; 17:78A6 $F0 $EC
    add  e                                        ;; 17:78A8 $83
    ldh  [hActiveEntityVisualPosY], a             ;; 17:78A9 $E0 $EC
    ldh  a, [hIsGBC]                              ;; 17:78AB $F0 $FE
    and  a                                        ;; 17:78AD $A7
    jr   nz, jr_017_78DD                          ;; 17:78AE $20 $2D

    ld   de, Unknow001SpriteVariants              ;; 17:78B0 $11 $79 $78
    call RenderActiveEntitySpritesPair            ;; 17:78B3 $CD $C0 $3B
    ret                                           ;; 17:78B6 $C9

jr_017_78B7:
    ld   a, [wD00A]                               ;; 17:78B7 $FA $0A $D0
    add  $06                                      ;; 17:78BA $C6 $06
    cp   $2B                                      ;; 17:78BC $FE $2B
    jr   c, .jr_78C2                              ;; 17:78BE $38 $02

    sub  $2B                                      ;; 17:78C0 $D6 $2B

.jr_78C2
    jr   jr_017_7898                              ;; 17:78C2 $18 $D4

jr_017_78C4:
    ld   a, [wD00A]                               ;; 17:78C4 $FA $0A $D0
    add  $18                                      ;; 17:78C7 $C6 $18
    cp   $2B                                      ;; 17:78C9 $FE $2B
    jr   c, .jr_78CF                              ;; 17:78CB $38 $02

    sub  $2B                                      ;; 17:78CD $D6 $2B

.jr_78CF
    ld   e, a                                     ;; 17:78CF $5F
    ld   d, $00                                   ;; 17:78D0 $16 $00
    ld   hl, Data_017_634C                        ;; 17:78D2 $21 $4C $63
    add  hl, de                                   ;; 17:78D5 $19
    ld   a, [hl]                                  ;; 17:78D6 $7E
    sub  $04                                      ;; 17:78D7 $D6 $04
    sra  a                                        ;; 17:78D9 $CB $2F
    jr   jr_017_78A1                              ;; 17:78DB $18 $C4

jr_017_78DD:
    ld   hl, wFarcallParams                       ;; 17:78DD $21 $01 $DE
    ld   a, BANK(func_027_734B)                   ;; 17:78E0 $3E $27
    ld   [hl+], a                                 ;; 17:78E2 $22
    ld   a, HIGH(func_027_734B)                   ;; 17:78E3 $3E $73
    ld   [hl+], a                                 ;; 17:78E5 $22
    ld   a, LOW(func_027_734B)                    ;; 17:78E6 $3E $4B
    ld   [hl+], a                                 ;; 17:78E8 $22
    ld   a, BANK(@)                               ;; 17:78E9 $3E $17
    ld   [hl], a                                  ;; 17:78EB $77
    jp   Farcall                                  ;; 17:78EC $C3 $D7 $0B

; define sprite variants by selecting tile n° and setting OAM attributes (palette + flags) in a list
Unknown002SpriteVariants::
.variant0
    db $72, OAMF_PAL0
    db $72, OAMF_PAL0 | OAMF_XFLIP
.variant1
    db $74, OAMF_PAL0
    db $74, OAMF_PAL0 | OAMF_XFLIP
.variant2
    db $76, OAMF_PAL0
    db $76, OAMF_PAL0 | OAMF_XFLIP
.variant3
    db $78, OAMF_PAL0
    db $78, OAMF_PAL0 | OAMF_XFLIP
.variant4
    db $7A, OAMF_PAL0
    db $7A, OAMF_PAL0 | OAMF_XFLIP
.variant5
    db $7C, OAMF_PAL0
    db $7C, OAMF_PAL0 | OAMF_XFLIP

Data_017_7907::
    db   $08, $06, $06, $06, $06, $08

func_017_790D::
    ld   hl, wEntitiesPhysicsFlagsTable           ;; 17:790D $21 $40 $C3
    add  hl, bc                                   ;; 17:7910 $09
    ld   [hl], 2 | ENTITY_PHYSICS_HARMLESS | ENTITY_PHYSICS_PROJECTILE_NOCLIP ;; 17:7911 $36 $C2
    ldh  a, [hIsGBC]                              ;; 17:7913 $F0 $FE
    and  a                                        ;; 17:7915 $A7
    jr   z, .jr_791D                              ;; 17:7916 $28 $05

    call func_017_795E                            ;; 17:7918 $CD $5E $79
    jr   jr_017_7923                              ;; 17:791B $18 $06

.jr_791D
    ld   de, Unknown002SpriteVariants             ;; 17:791D $11 $EF $78
    call RenderActiveEntitySpritesPair            ;; 17:7920 $CD $C0 $3B

jr_017_7923:
    call GetEntityTransitionCountdown             ;; 17:7923 $CD $05 $0C
    jr   nz, jr_017_793E                          ;; 17:7926 $20 $16

    push hl                                       ;; 17:7928 $E5
    ld   hl, wEntitiesSpriteVariantTable          ;; 17:7929 $21 $B0 $C3
    add  hl, bc                                   ;; 17:792C $09
    ld   a, [hl]                                  ;; 17:792D $7E
    inc  a                                        ;; 17:792E $3C
    cp   $06                                      ;; 17:792F $FE $06
    jr   nz, .jr_7934                             ;; 17:7931 $20 $01

    xor  a                                        ;; 17:7933 $AF

.jr_7934
    ld   [hl], a                                  ;; 17:7934 $77
    ld   e, a                                     ;; 17:7935 $5F
    ld   d, b                                     ;; 17:7936 $50
    ld   hl, Data_017_7907                        ;; 17:7937 $21 $07 $79
    add  hl, de                                   ;; 17:793A $19
    ld   a, [hl]                                  ;; 17:793B $7E
    pop  hl                                       ;; 17:793C $E1
    ld   [hl], a                                  ;; 17:793D $77

jr_017_793E:
    ld   hl, wEntitiesInertiaTable                ;; 17:793E $21 $D0 $C3
    add  hl, bc                                   ;; 17:7941 $09
    ld   a, [hl]                                  ;; 17:7942 $7E
    inc  a                                        ;; 17:7943 $3C
    ld   [hl], a                                  ;; 17:7944 $77
    and  $1F                                      ;; 17:7945 $E6 $1F
    jr   nz, .jr_7953                             ;; 17:7947 $20 $0A

    ld   hl, wEntitiesSpeedYTable                 ;; 17:7949 $21 $50 $C2
    add  hl, bc                                   ;; 17:794C $09
    ld   a, [hl]                                  ;; 17:794D $7E
    cp   $FF                                      ;; 17:794E $FE $FF
    jr   z, .jr_7953                              ;; 17:7950 $28 $01

    inc  [hl]                                     ;; 17:7952 $34

.jr_7953
    call UpdateEntityPosWithSpeed_17              ;; 17:7953 $CD $2D $7E
    ldh  a, [hActiveEntityPosX]                   ;; 17:7956 $F0 $EE
    cp   $B0                                      ;; 17:7958 $FE $B0
    jp   nc, label_017_7CC2                       ;; 17:795A $D2 $C2 $7C

    ret                                           ;; 17:795D $C9

func_017_795E::
    ld   hl, wFarcallParams                       ;; 17:795E $21 $01 $DE
    ld   a, BANK(func_027_73C7)                   ;; 17:7961 $3E $27
    ld   [hl+], a                                 ;; 17:7963 $22
    ld   a, HIGH(func_027_73C7)                   ;; 17:7964 $3E $73
    ld   [hl+], a                                 ;; 17:7966 $22
    ld   a, LOW(func_027_73C7)                    ;; 17:7967 $3E $C7
    ld   [hl+], a                                 ;; 17:7969 $22
    ld   a, BANK(@)                               ;; 17:796A $3E $17
    ld   [hl], a                                  ;; 17:796C $77
    jp   Farcall                                  ;; 17:796D $C3 $D7 $0B

func_017_7970::
    ret                                           ;; 17:7970 $C9

func_017_7971::
    ldh  a, [hIsGBC]                              ;; 17:7971 $F0 $FE
    and  a                                        ;; 17:7973 $A7

.jr_7974
    ret  z                                        ;; 17:7974 $C8

    ld   hl, wFarcallParams                       ;; 17:7975 $21 $01 $DE
    ld   a, BANK(func_027_74E3)                   ;; 17:7978 $3E $27

.jr_797A
    ld   [hl+], a                                 ;; 17:797A $22
    ld   a, HIGH(func_027_74E3)                   ;; 17:797B $3E $74
    ld   [hl+], a                                 ;; 17:797D $22
    ld   a, LOW(func_027_74E3)                    ;; 17:797E $3E $E3

.jr_7980
    ld   [hl+], a                                 ;; 17:7980 $22
    ld   a, BANK(@)                               ;; 17:7981 $3E $17
    ld   [hl], a                                  ;; 17:7983 $77
    jp   Farcall                                  ;; 17:7984 $C3 $D7 $0B

Data_017_7987::
    db   $D0, $01, $D2, $01, $D4, $01, $D6, $01, $D8, $01, $DA, $01, $DC, $01, $DE, $01
    db   $E0, $01, $E2, $01, $E4, $01, $E6, $01, $E8, $01, $EA, $01, $EC, $01, $EE, $01

func_017_79A7::
    ld   hl, wEntitiesPrivateState2Table          ;; 17:79A7 $21 $C0 $C2
    add  hl, bc                                   ;; 17:79AA $09
    ld   a, [hl]                                  ;; 17:79AB $7E
    add  $50                                      ;; 17:79AC $C6 $50
    ldh  [hMultiPurpose0], a                      ;; 17:79AE $E0 $D7
    call func_017_7A01                            ;; 17:79B0 $CD $01 $7A
    ld   de, Data_017_7987                        ;; 17:79B3 $11 $87 $79
    call func_017_7A29                            ;; 17:79B6 $CD $29 $7A
    call GetEntitySlowTransitionCountdown         ;; 17:79B9 $CD $FB $0B
    ret  z                                        ;; 17:79BC $C8

    call UpdateEntityPosWithSpeed_17              ;; 17:79BD $CD $2D $7E
    ret                                           ;; 17:79C0 $C9

Data_017_79C1::
    db   $80, $26, $95, $63, $20, $3A, $75, $6B, $A0, $51, $35, $73, $08, $7D, $18, $7F
    db   $AD, $78, $F9, $7E, $50, $5C, $DA, $76, $12, $40, $BB, $6A, $15, $30, $BC, $66
    db   $17, $14, $BD, $5E, $D7, $04, $FD, $56, $37, $05, $1D, $57, $97, $09, $3D, $5B
    db   $F5, $09, $5C, $5B, $10, $0A, $5A, $5B, $4B, $06, $79, $57, $A0, $02, $95, $57

func_017_7A01::
    ldh  a, [hIsGBC]                              ;; 17:7A01 $F0 $FE
    and  a                                        ;; 17:7A03 $A7
    ret  z                                        ;; 17:7A04 $C8

    ld   a, [wCreditsSubscene]                    ;; 17:7A05 $FA $0E $D0
    cp   $13                                      ;; 17:7A08 $FE $13
    ret  nc                                       ;; 17:7A0A $D0

    ldh  a, [hFrameCounter]                       ;; 17:7A0B $F0 $E7
    srl  a                                        ;; 17:7A0D $CB $3F
    and  $3C                                      ;; 17:7A0F $E6 $3C
    ld   e, a                                     ;; 17:7A11 $5F
    ld   d, $00                                   ;; 17:7A12 $16 $00
    ld   hl, Data_017_79C1                        ;; 17:7A14 $21 $C1 $79
    add  hl, de                                   ;; 17:7A17 $19
    ld   de, wObjPal2 + 2*2                       ;; 17:7A18 $11 $5C $DC

.loop_7A1B
    ld   a, [hl+]                                 ;; 17:7A1B $2A
    ld   [de], a                                  ;; 17:7A1C $12
    inc  de                                       ;; 17:7A1D $13
    ld   a, e                                     ;; 17:7A1E $7B
    and  $03                                      ;; 17:7A1F $E6 $03
    jr   nz, .loop_7A1B                           ;; 17:7A21 $20 $F8

    ld   a, $02                                   ;; 17:7A23 $3E $02
    ld   [wPaletteDataFlags], a                   ;; 17:7A25 $EA $D1 $DD
    ret                                           ;; 17:7A28 $C9

func_017_7A29::
    push bc                                       ;; 17:7A29 $C5
    push de                                       ;; 17:7A2A $D5
    ldh  a, [hMultiPurpose0]                      ;; 17:7A2B $F0 $D7
    ld   e, a                                     ;; 17:7A2D $5F
    ld   d, b                                     ;; 17:7A2E $50
    ld   hl, wOAMBuffer                           ;; 17:7A2F $21 $00 $C0
    add  hl, de                                   ;; 17:7A32 $19
    push hl                                       ;; 17:7A33 $E5
    pop  de                                       ;; 17:7A34 $D1
    ldh  a, [hActiveEntityVisualPosY]             ;; 17:7A35 $F0 $EC
    ld   [de], a                                  ;; 17:7A37 $12
    inc  de                                       ;; 17:7A38 $13
    ld   a, [wScreenShakeHorizontal]              ;; 17:7A39 $FA $55 $C1
    ld   c, a                                     ;; 17:7A3C $4F
    ldh  a, [hActiveEntityFlipAttribute]          ;; 17:7A3D $F0 $ED
    and  OAMF_XFLIP                               ;; 17:7A3F $E6 $20
    rra                                           ;; 17:7A41 $1F
    rra                                           ;; 17:7A42 $1F
    ld   hl, hActiveEntityPosX                    ;; 17:7A43 $21 $EE $FF
    add  [hl]                                     ;; 17:7A46 $86
    sub  c                                        ;; 17:7A47 $91
    ld   [de], a                                  ;; 17:7A48 $12
    inc  de                                       ;; 17:7A49 $13
    ldh  a, [hActiveEntitySpriteVariant]          ;; 17:7A4A $F0 $F1
    ld   c, a                                     ;; 17:7A4C $4F
    ld   b, $00                                   ;; 17:7A4D $06 $00
    sla  c                                        ;; 17:7A4F $CB $21
    rl   b                                        ;; 17:7A51 $CB $10
    sla  c                                        ;; 17:7A53 $CB $21
    rl   b                                        ;; 17:7A55 $CB $10
    pop  hl                                       ;; 17:7A57 $E1
    add  hl, bc                                   ;; 17:7A58 $09
    ld   a, [hl+]                                 ;; 17:7A59 $2A
    ld   [de], a                                  ;; 17:7A5A $12
    inc  de                                       ;; 17:7A5B $13
    ld   a, [hl+]                                 ;; 17:7A5C $2A
    push hl                                       ;; 17:7A5D $E5
    ld   hl, hActiveEntityFlipAttribute           ;; 17:7A5E $21 $ED $FF
    xor  [hl]                                     ;; 17:7A61 $AE
    ld   [de], a                                  ;; 17:7A62 $12
    inc  de                                       ;; 17:7A63 $13
    ldh  a, [hActiveEntityVisualPosY]             ;; 17:7A64 $F0 $EC
    ld   [de], a                                  ;; 17:7A66 $12
    inc  de                                       ;; 17:7A67 $13
    ld   a, [wScreenShakeHorizontal]              ;; 17:7A68 $FA $55 $C1
    ld   c, a                                     ;; 17:7A6B $4F
    ldh  a, [hActiveEntityFlipAttribute]          ;; 17:7A6C $F0 $ED
    and  OAMF_XFLIP                               ;; 17:7A6E $E6 $20
    xor  OAMF_XFLIP                               ;; 17:7A70 $EE $20
    rra                                           ;; 17:7A72 $1F
    rra                                           ;; 17:7A73 $1F
    ld   hl, hActiveEntityPosX                    ;; 17:7A74 $21 $EE $FF
    sub  c                                        ;; 17:7A77 $91
    add  [hl]                                     ;; 17:7A78 $86
    ld   [de], a                                  ;; 17:7A79 $12
    inc  de                                       ;; 17:7A7A $13
    pop  hl                                       ;; 17:7A7B $E1
    ld   a, [hl+]                                 ;; 17:7A7C $2A
    ld   [de], a                                  ;; 17:7A7D $12
    inc  de                                       ;; 17:7A7E $13
    ld   a, [hl]                                  ;; 17:7A7F $7E
    ld   hl, hActiveEntityFlipAttribute           ;; 17:7A80 $21 $ED $FF
    xor  [hl]                                     ;; 17:7A83 $AE
    ld   [de], a                                  ;; 17:7A84 $12
    pop  bc                                       ;; 17:7A85 $C1
    ret                                           ;; 17:7A86 $C9

EndingOwlStairClimbingEntityHandler::
    ld   hl, wEntitiesPrivateState1Table          ;; 17:7A87 $21 $B0 $C2
    add  hl, bc                                   ;; 17:7A8A $09
    ld   a, [hl]                                  ;; 17:7A8B $7E
    JP_TABLE                                      ;; 17:7A8C $C7
._00 dw func_017_7AB1
._01 dw func_017_7B99
._02 dw func_017_7C1B
._03 dw func_017_79A7
._04 dw func_017_77F1
._05 dw func_017_783C
._06 dw func_017_7772
._07 dw func_017_7757
._08 dw func_017_7885
._09 dw func_017_790D
._0A dw func_017_76DE
._0B dw func_017_75AA
._0C dw func_017_7545
._0D dw func_017_74CB
._0E dw func_017_7398
._0F dw func_017_7171
._10 dw func_017_725F
._11 dw func_017_7970

func_017_7AB1::
    call func_017_7B5F                            ;; 17:7AB1 $CD $5F $7B
    ldh  a, [hActiveEntityState]                  ;; 17:7AB4 $F0 $F0
    JP_TABLE                                      ;; 17:7AB6 $C7
._00 dw func_017_7AC1
._01 dw func_017_7B06
._02 dw func_017_7B41
._03 dw func_017_7B43
._04 dw func_017_7B5B_2

func_017_7AC1::
    ldh  a, [hActiveEntityVisualPosY]             ;; 17:7AC1 $F0 $EC
    cp   $60                                      ;; 17:7AC3 $FE $60
    jp   z, IncrementEntityState                  ;; 17:7AC5 $CA $12 $3B

    ld   hl, wEntitiesSpeedYTable                 ;; 17:7AC8 $21 $50 $C2
    add  hl, bc                                   ;; 17:7ACB $09
    ld   [hl], $08                                ;; 17:7ACC $36 $08
    call UpdateEntityYPosWithSpeed_17             ;; 17:7ACE $CD $30 $7E
    ld   hl, wEntitiesPosYTable                   ;; 17:7AD1 $21 $10 $C2
    add  hl, bc                                   ;; 17:7AD4 $09
    ld   a, [hl]                                  ;; 17:7AD5 $7E
    cp   $F0                                      ;; 17:7AD6 $FE $F0
    jr   nz, .jr_7AEB                             ;; 17:7AD8 $20 $11

    ld   hl, wEntitiesPrivateState2Table          ;; 17:7ADA $21 $C0 $C2
    add  hl, bc                                   ;; 17:7ADD $09
    ld   a, [hl]                                  ;; 17:7ADE $7E
    cp   $08                                      ;; 17:7ADF $FE $08
    jr   nc, .jr_7AEB                             ;; 17:7AE1 $30 $08

    inc  a                                        ;; 17:7AE3 $3C
    ld   [hl], a                                  ;; 17:7AE4 $77
    ld   hl, wEntitiesPosYTable                   ;; 17:7AE5 $21 $10 $C2
    add  hl, bc                                   ;; 17:7AE8 $09
    ld   [hl], $E0                                ;; 17:7AE9 $36 $E0

.jr_7AEB
    ld   a, $FF                                   ;; 17:7AEB $3E $FF
    ldh  [hLinkSpeedY], a                         ;; 17:7AED $E0 $9B

func_017_7AEF::
    ldh  a, [hFrameCounter]                       ;; 17:7AEF $F0 $E7
    rra                                           ;; 17:7AF1 $1F
    rra                                           ;; 17:7AF2 $1F
    rra                                           ;; 17:7AF3 $1F
    and  $01                                      ;; 17:7AF4 $E6 $01
    add  $00                                      ;; 17:7AF6 $C6 $00
    ldh  [hLinkAnimationState], a                 ;; 17:7AF8 $E0 $9D

func_017_7AFA::
    push bc                                       ;; 17:7AFA $C5
    xor  a                                        ;; 17:7AFB $AF
    ldh  [hLinkSpeedX], a                         ;; 17:7AFC $E0 $9A
    call UpdateFinalLinkPosition                  ;; 17:7AFE $CD $A8 $21
    call func_017_7D34                            ;; 17:7B01 $CD $34 $7D
    pop  bc                                       ;; 17:7B04 $C1
    ret                                           ;; 17:7B05 $C9

func_017_7B06::
    ld   a, $F8                                   ;; 17:7B06 $3E $F8
    ldh  [hLinkSpeedY], a                         ;; 17:7B08 $E0 $9B
    call func_017_7AEF                            ;; 17:7B0A $CD $EF $7A
    ldh  a, [hLinkPositionY]                      ;; 17:7B0D $F0 $99
    cp   $5C                                      ;; 17:7B0F $FE $5C
    jr   nz, .ret_7B40                            ;; 17:7B11 $20 $2D

    xor  a                                        ;; 17:7B13 $AF
    ldh  [hLinkSpeedY], a                         ;; 17:7B14 $E0 $9B
    ld   a, $02                                   ;; 17:7B16 $3E $02
    ldh  [hLinkAnimationState], a                 ;; 17:7B18 $E0 $9D
    ld   a, ENTITY_ENDING_OWL_STAIR_CLIMBING      ;; 17:7B1A $3E $E8
    call SpawnNewEntity_trampoline                ;; 17:7B1C $CD $86 $3B
    ld   hl, wEntitiesPrivateState1Table          ;; 17:7B1F $21 $B0 $C2
    add  hl, de                                   ;; 17:7B22 $19
    ld   [hl], $02                                ;; 17:7B23 $36 $02
    ld   hl, wEntitiesPosXTable                   ;; 17:7B25 $21 $00 $C2
    add  hl, de                                   ;; 17:7B28 $19
    ld   [hl], $50                                ;; 17:7B29 $36 $50
    ld   hl, wEntitiesPosYTable                   ;; 17:7B2B $21 $10 $C2
    add  hl, de                                   ;; 17:7B2E $19
    ld   [hl], $00                                ;; 17:7B2F $36 $00
    ld   hl, wEntitiesSpeedYTable                 ;; 17:7B31 $21 $50 $C2
    add  hl, de                                   ;; 17:7B34 $19
    ld   [hl], $14                                ;; 17:7B35 $36 $14
    ld   hl, wEntitiesTransitionCountdownTable    ;; 17:7B37 $21 $E0 $C2
    add  hl, de                                   ;; 17:7B3A $19
    ld   [hl], $30                                ;; 17:7B3B $36 $30
    call IncrementEntityState                     ;; 17:7B3D $CD $12 $3B

.ret_7B40
    ret                                           ;; 17:7B40 $C9

func_017_7B41::
    jr   func_017_7B5B_2                          ;; 17:7B41 $18 $18

func_017_7B43::
    call func_017_7AFA                            ;; 17:7B43 $CD $FA $7A
    call GetEntityTransitionCountdown             ;; 17:7B46 $CD $05 $0C
    jr   nz, func_017_7B5B                        ;; 17:7B49 $20 $10

    ld   [hl], $08                                ;; 17:7B4B $36 $08
    ld   hl, wEntitiesSpriteVariantTable          ;; 17:7B4D $21 $B0 $C3
    add  hl, bc                                   ;; 17:7B50 $09
    ld   a, [hl]                                  ;; 17:7B51 $7E
    inc  a                                        ;; 17:7B52 $3C
    ld   [hl], a                                  ;; 17:7B53 $77
    cp   $05                                      ;; 17:7B54 $FE $05
    jr   nz, func_017_7B5B                        ;; 17:7B56 $20 $03

    call IncrementEntityState                     ;; 17:7B58 $CD $12 $3B

func_017_7B5B::
IF LANG_DE
    call func_017_7AFA
    ret
ENDC

func_017_7B5B_2::
    call func_017_7AFA                            ;; 17:7B5B $CD $FA $7A
    ret                                           ;; 17:7B5E $C9

func_017_7B5F::
    ld   hl, wFarcallParams                       ;; 17:7B5F $21 $01 $DE
    ld   a, BANK(func_020_7BA5)                   ;; 17:7B62 $3E $20
    ld   [hl+], a                                 ;; 17:7B64 $22
    ld   a, HIGH(func_020_7BA5)                   ;; 17:7B65 $3E $7B
    ld   [hl+], a                                 ;; 17:7B67 $22
    ld   a, LOW(func_020_7BA5)                    ;; 17:7B68 $3E $A5
    ld   [hl+], a                                 ;; 17:7B6A $22
    ld   a, BANK(@)                               ;; 17:7B6B $3E $17
    ld   [hl], a                                  ;; 17:7B6D $77
    jp   Farcall                                  ;; 17:7B6E $C3 $D7 $0B

Data_017_7B71::
    db   $20, $40, $60, $78, $10, $48, $68, $90, $30, $50, $80, $90, $18, $38, $68, $78

Data_017_7B81::
    db   $28, $08, $28, $00, $48, $40, $4C, $38, $68, $70, $58, $68, $78, $88, $98, $80

Data_017_7B91::
    db   $1E, $1E, $1E, $2E, $2E, $3E, $2E, $2E

func_017_7B99::
    ld   de, wDynamicOAMBuffer+$60                ;; 17:7B99 $11 $90 $C0
    push bc                                       ;; 17:7B9C $C5
    ldh  a, [hFrameCounter]                       ;; 17:7B9D $F0 $E7
    and  $01                                      ;; 17:7B9F $E6 $01
    ld   c, a                                     ;; 17:7BA1 $4F

jr_017_7BA2:
    ld   hl, Data_017_7B81                        ;; 17:7BA2 $21 $81 $7B
    add  hl, bc                                   ;; 17:7BA5 $09
    ldh  a, [hActiveEntityVisualPosY]             ;; 17:7BA6 $F0 $EC
    add  [hl]                                     ;; 17:7BA8 $86
    cp   $98                                      ;; 17:7BA9 $FE $98
    jr   c, .jr_7BAF                              ;; 17:7BAB $38 $02

    sub  $88                                      ;; 17:7BAD $D6 $88

.jr_7BAF
    ld   [de], a                                  ;; 17:7BAF $12
    inc  de                                       ;; 17:7BB0 $13
    ld   hl, Data_017_7B71                        ;; 17:7BB1 $21 $71 $7B
    add  hl, bc                                   ;; 17:7BB4 $09
    ld   a, [hl]                                  ;; 17:7BB5 $7E
    ld   [de], a                                  ;; 17:7BB6 $12

.jr_7BB7
    inc  de                                       ;; 17:7BB7 $13
    push bc                                       ;; 17:7BB8 $C5
    ldh  a, [hFrameCounter]                       ;; 17:7BB9 $F0 $E7
    rra                                           ;; 17:7BBB $1F
    rra                                           ;; 17:7BBC $1F
    rra                                           ;; 17:7BBD $1F
    rra                                           ;; 17:7BBE $1F
    nop                                           ;; 17:7BBF $00
    xor  c                                        ;; 17:7BC0 $A9
    and  $07                                      ;; 17:7BC1 $E6 $07
    ld   c, a                                     ;; 17:7BC3 $4F
    ld   b, $00                                   ;; 17:7BC4 $06 $00
    ld   hl, Data_017_7B91                        ;; 17:7BC6 $21 $91 $7B
    add  hl, bc                                   ;; 17:7BC9 $09
    ld   a, [hl]                                  ;; 17:7BCA $7E

.jr_7BCB
    ld   [de], a                                  ;; 17:7BCB $12
    inc  de                                       ;; 17:7BCC $13
    pop  bc                                       ;; 17:7BCD $C1
    ld   a, $96                                   ;; 17:7BCE $3E $96
    ld   [de], a                                  ;; 17:7BD0 $12
    inc  de                                       ;; 17:7BD1 $13
    inc  c                                        ;; 17:7BD2 $0C
    inc  c                                        ;; 17:7BD3 $0C
    ld   a, c                                     ;; 17:7BD4 $79
    cp   $10                                      ;; 17:7BD5 $FE $10
    jr   c, jr_017_7BA2                           ;; 17:7BD7 $38 $C9

    pop  bc                                       ;; 17:7BD9 $C1
    ret                                           ;; 17:7BDA $C9

Data_017_7BDB::
    db   $00, $F8, $58, $01, $00, $00, $68, $01, $00, $08, $68, $21, $00, $10, $58, $21
    db   $00, $F8, $5A, $01, $00, $00, $6A, $01, $00, $08, $6A, $21, $00, $10, $5A, $21
    db   $00, $F8, $5C, $01, $00, $00, $6C, $01, $00, $08, $6C, $21, $00, $10, $5C, $21
    db   $00, $F8, $5E, $01, $00, $00, $6E, $01, $00, $08, $6E, $21, $00, $10, $5E, $21

func_017_7C1B::
    ld   a, $50
    ld   [wOAMNextAvailableSlot], a               ;; 17:7C1D $EA $C0 $C3
    ld   hl, Data_017_7BDB                        ;; 17:7C20 $21 $DB $7B
    ldh  a, [hActiveEntitySpriteVariant]          ;; 17:7C23 $F0 $F1
    rla                                           ;; 17:7C25 $17
    rla                                           ;; 17:7C26 $17
    rla                                           ;; 17:7C27 $17
    rla                                           ;; 17:7C28 $17
    and  $F0                                      ;; 17:7C29 $E6 $F0
    ld   e, a                                     ;; 17:7C2B $5F
    ld   d, b                                     ;; 17:7C2C $50
    add  hl, de                                   ;; 17:7C2D $19
    ld   c, $04                                   ;; 17:7C2E $0E $04
    call RenderActiveEntitySpritesRect            ;; 17:7C30 $CD $E6 $3C
    ld   a, $04                                   ;; 17:7C33 $3E $04
    call func_015_7964_trampoline                 ;; 17:7C35 $CD $A0 $3D
    ldh  a, [hFrameCounter]                       ;; 17:7C38 $F0 $E7
    rra                                           ;; 17:7C3A $1F
    rra                                           ;; 17:7C3B $1F
    rra                                           ;; 17:7C3C $1F
    and  $03                                      ;; 17:7C3D $E6 $03
    call SetEntitySpriteVariant                   ;; 17:7C3F $CD $0C $3B
    ldh  a, [hActiveEntityState]                  ;; 17:7C42 $F0 $F0
    JP_TABLE                                      ;; 17:7C44
._00 dw func_017_7C4D                             ;; 17:7C45
._01 dw func_017_7C7B                             ;; 17:7C47
._02 dw func_017_7CA5                             ;; 17:7C49
._03 dw func_017_7CB7                             ;; 17:7C4B

func_017_7C4D::
    call GetEntityTransitionCountdown             ;; 17:7C4D $CD $05 $0C
    jr   nz, .ret_7C6A                            ;; 17:7C50 $20 $18

    call UpdateEntityYPosWithSpeed_17             ;; 17:7C52 $CD $30 $7E
    ldh  a, [hFrameCounter]                       ;; 17:7C55 $F0 $E7
    and  $03                                      ;; 17:7C57 $E6 $03
    jr   nz, .ret_7C6A                            ;; 17:7C59 $20 $0F

    ld   hl, wEntitiesSpeedYTable                 ;; 17:7C5B $21 $50 $C2
    add  hl, bc                                   ;; 17:7C5E $09
    dec  [hl]                                     ;; 17:7C5F $35
    jr   nz, .ret_7C6A                            ;; 17:7C60 $20 $08

    call GetEntityTransitionCountdown             ;; 17:7C62 $CD $05 $0C
    ld   [hl], $80                                ;; 17:7C65 $36 $80
    call IncrementEntityState                     ;; 17:7C67 $CD $12 $3B

.ret_7C6A
    ret                                           ;; 17:7C6A $C9

Data_017_7C6B::
    db   $00, $00, $00, $01, $01, $02, $03, $03, $04, $04, $04, $03, $03, $02, $01, $01

; Open Owl Speech dialog
func_017_7C7B::
    call GetEntityTransitionCountdown             ;; 17:7C7B $CD $05 $0C
    jr   nz, func_017_7C8D                        ;; 17:7C7E $20 $0D

    ld_dialog_low a, Dialog0CF ; "Hoot yound lad" ;; 17:7C80 $3E $CF
    call CreditsOpenDialog                        ;; 17:7C82 $CD $F0 $7C
    ld   a, $19                                   ;; 17:7C85 $3E $19
    ld   [wDialogSFX], a                          ;; 17:7C87 $EA $AB $C5
    call IncrementEntityState                     ;; 17:7C8A $CD $12 $3B

func_017_7C8D::
    ld   hl, wEntitiesInertiaTable                ;; 17:7C8D $21 $D0 $C3
    add  hl, bc                                   ;; 17:7C90 $09
    ld   a, [hl]                                  ;; 17:7C91 $7E
    ld   a, [hl]                                  ;; 17:7C92 $7E
    inc  [hl]                                     ;; 17:7C93 $34
    rra                                           ;; 17:7C94 $1F
    rra                                           ;; 17:7C95 $1F
    and  $0F                                      ;; 17:7C96 $E6 $0F
    ld   e, a                                     ;; 17:7C98 $5F
    ld   d, b                                     ;; 17:7C99 $50
    ld   hl, Data_017_7C6B                        ;; 17:7C9A $21 $6B $7C
    add  hl, de                                   ;; 17:7C9D $19
    ld   a, [hl]                                  ;; 17:7C9E $7E
    ld   hl, wEntitiesPosZTable                   ;; 17:7C9F $21 $10 $C3
    add  hl, bc                                   ;; 17:7CA2 $09
    ld   [hl], a                                  ;; 17:7CA3 $77
    ret                                           ;; 17:7CA4 $C9

func_017_7CA5::
    call func_017_7C8D                            ;; 17:7CA5 $CD $8D $7C
    ld   a, [wDialogState]                        ;; 17:7CA8 $FA $9F $C1
    and  a                                        ;; 17:7CAB $A7
    jr   nz, .ret_7CB6                            ;; 17:7CAC $20 $08

    call GetEntityTransitionCountdown             ;; 17:7CAE $CD $05 $0C
    ld   [hl], $FF                                ;; 17:7CB1 $36 $FF
    call IncrementEntityState                     ;; 17:7CB3 $CD $12 $3B

.ret_7CB6
    ret                                           ;; 17:7CB6 $C9

func_017_7CB7::
    call func_017_7C8D                            ;; 17:7CB7 $CD $8D $7C
    call GetEntityTransitionCountdown             ;; 17:7CBA $CD $05 $0C
    jr   nz, jr_017_7CC8                          ;; 17:7CBD $20 $09

jr_017_7CBF:
    call IncrementCreditsSubscene                 ;; 17:7CBF $CD $D9 $4C

label_017_7CC2:
    ld   hl, wEntitiesStatusTable                 ;; 17:7CC2 $21 $80 $C2
    add  hl, bc                                   ;; 17:7CC5 $09
    ld   [hl], b                                  ;; 17:7CC6 $70
    ret                                           ;; 17:7CC7 $C9

jr_017_7CC8:
    cp   $E0                                      ;; 17:7CC8 $FE $E0
    jr   nc, ret_017_7CEF                         ;; 17:7CCA $30 $23

    cp   $DF                                      ;; 17:7CCC $FE $DF
    jr   nz, .jr_7CD4                             ;; 17:7CCE $20 $04

    ld   a, JINGLE_DISAPPEAR                      ;; 17:7CD0 $3E $26
    ldh  [hJingle], a                             ;; 17:7CD2 $E0 $F2

.jr_7CD4
    ld   hl, wEntitiesPrivateState3Table          ;; 17:7CD4 $21 $D0 $C2
    add  hl, bc                                   ;; 17:7CD7 $09
    ld   e, [hl]                                  ;; 17:7CD8 $5E
    ld   a, [hl]                                  ;; 17:7CD9 $7E
    cp   $FC                                      ;; 17:7CDA $FE $FC
    jr   nc, jr_017_7CBF                          ;; 17:7CDC $30 $E1

    add  $02                                      ;; 17:7CDE $C6 $02
    ld   [hl], a                                  ;; 17:7CE0 $77
    ld   hl, wEntitiesPrivateState4Table          ;; 17:7CE1 $21 $40 $C4
    add  hl, bc                                   ;; 17:7CE4 $09
    ld   a, [hl]                                  ;; 17:7CE5 $7E
    add  e                                        ;; 17:7CE6 $83
    ld   [hl], a                                  ;; 17:7CE7 $77
    jr   nc, ret_017_7CEF                         ;; 17:7CE8 $30 $05

    ld   a, $FF                                   ;; 17:7CEA $3E $FF
    call SetEntitySpriteVariant                   ;; 17:7CEC $CD $0C $3B

ret_017_7CEF:
    ret                                           ;; 17:7CEF $C9

CreditsOpenDialog::
    ld   e, a                                     ;; 17:7CF0 $5F
    ldh  a, [hLinkPositionY]                      ;; 17:7CF1 $F0 $99
    push af                                       ;; 17:7CF3 $F5
    ld   a, $10                                   ;; 17:7CF4 $3E $10
    ldh  [hLinkPositionY], a                      ;; 17:7CF6 $E0 $99
    ld   a, e                                     ;; 17:7CF8 $7B
    call OpenDialogInTable0                       ;; 17:7CF9 $CD $85 $23
    pop  af                                       ;; 17:7CFC $F1
    ldh  [hLinkPositionY], a                      ;; 17:7CFD $E0 $99
    ret                                           ;; 17:7CFF $C9

Data_017_7D00::
    db   $00, $00, $02, $00, $02, $20, $00, $20, $44, $00, $46, $00, $48, $00, $4A, $00
    db   $4C, $00, $4C, $20, $D8, $20, $D6, $20, $D4, $00, $D4, $20, $D6, $00, $D8, $00
    db   $DA, $00, $DC, $00, $DE, $00, $E0, $00, $E2, $00, $E2, $20, $E0, $20, $DE, $20
    db   $DC, $20, $DA, $20

func_017_7D34::
    ldh  a, [hLinkAnimationState]                 ;; 17:7D34 $F0 $9D
    rla                                           ;; 17:7D36 $17
    rla                                           ;; 17:7D37 $17
    and  $FC                                      ;; 17:7D38 $E6 $FC
    ld   e, a                                     ;; 17:7D3A $5F
    ld   d, $00                                   ;; 17:7D3B $16 $00
    ld   hl, Data_017_7D00                        ;; 17:7D3D $21 $00 $7D
    add  hl, de                                   ;; 17:7D40 $19
    push hl                                       ;; 17:7D41 $E5
    pop  de                                       ;; 17:7D42 $D1
    ld   hl, wOAMBuffer+4                         ;; 17:7D43 $21 $04 $C0
    ldh  a, [hLinkPositionY]                      ;; 17:7D46 $F0 $99
    ld   [hl+], a                                 ;; 17:7D48 $22
    ld   a, [wScreenShakeHorizontal]              ;; 17:7D49 $FA $55 $C1
    ld   c, a                                     ;; 17:7D4C $4F

.jr_7D4D
    ldh  a, [hLinkPositionX]                      ;; 17:7D4D $F0 $98
    sub  c                                        ;; 17:7D4F $91
    ld   [hl+], a                                 ;; 17:7D50 $22
    ld   a, [de]                                  ;; 17:7D51 $1A
    inc  de                                       ;; 17:7D52 $13
    ld   [hl+], a                                 ;; 17:7D53 $22
    push hl                                       ;; 17:7D54 $E5
    ld   hl, hMultiPurpose0                       ;; 17:7D55 $21 $D7 $FF
    ld   a, [wTunicType]                          ;; 17:7D58 $FA $0F $DC
    and  a                                        ;; 17:7D5B $A7
    jr   z, .jr_7D5F                              ;; 17:7D5C $28 $01

    inc  a                                        ;; 17:7D5E $3C

.jr_7D5F
    ld   [hl], a                                  ;; 17:7D5F $77
    ld   a, [de]                                  ;; 17:7D60 $1A
    or   [hl]                                     ;; 17:7D61 $B6
    pop  hl                                       ;; 17:7D62 $E1
    inc  de                                       ;; 17:7D63 $13
    ld   [hl+], a                                 ;; 17:7D64 $22
    ldh  a, [hLinkPositionY]                      ;; 17:7D65 $F0 $99
    ld   [hl+], a                                 ;; 17:7D67 $22
    ldh  a, [hLinkPositionX]                      ;; 17:7D68 $F0 $98
    sub  c                                        ;; 17:7D6A $91
    add  $08                                      ;; 17:7D6B $C6 $08
    ld   [hl+], a                                 ;; 17:7D6D $22
    ld   a, [de]                                  ;; 17:7D6E $1A
    inc  de                                       ;; 17:7D6F $13
    ld   [hl+], a                                 ;; 17:7D70 $22
    push hl                                       ;; 17:7D71 $E5
    ld   hl, hMultiPurpose0                       ;; 17:7D72 $21 $D7 $FF
    ld   a, [de]                                  ;; 17:7D75 $1A
    or   [hl]                                     ;; 17:7D76 $B6
    pop  hl                                       ;; 17:7D77 $E1
    ld   [hl], a                                  ;; 17:7D78 $77
    ret                                           ;; 17:7D79 $C9

DialogArrowOAMYTable::
    db   $37 ; top
    db   $7F ; bottom

DrawDialogArrow::
    ldh  a, [hFrameCounter]                       ;; 17:7D7C $F0 $E7
    and  $10                                      ;; 17:7D7E $E6 $10
    ret  nz                                       ;; 17:7D80 $C0

    ld   e, $00                                   ;; 17:7D81 $1E $00
    ld   a, [wDialogState]                        ;; 17:7D83 $FA $9F $C1
    and  DIALOG_BOX_BOTTOM_FLAG                   ;; 17:7D86 $E6 $80
    jr   z, .doneSettingY                         ;; 17:7D88 $28 $01

    inc  e                                        ;; 17:7D8A $1C

.doneSettingY
    ld   d, $00                                   ;; 17:7D8B $16 $00
    ld   a, [wGameplayType]                       ;; 17:7D8D $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ;; 17:7D90 $FE $01
    jr   z, .credits                              ;; 17:7D92 $28 $18

    ld   hl, DialogArrowOAMYTable                 ;; 17:7D94 $21 $7A $7D
    add  hl, de                                   ;; 17:7D97 $19
    ld   a, [hl]                                  ;; 17:7D98 $7E
    ld   [wOAMBuffer+$18], a                      ;; 17:7D99 $EA $18 $C0
    ld   a, $97 ; X position                      ;; 17:7D9C $3E $97
    ld   [wOAMBuffer+$19], a                      ;; 17:7D9E $EA $19 $C0
    ld   a, $A2 ; Arrow tile                      ;; 17:7DA1 $3E $A2
    ld   [wOAMBuffer+$1A], a                      ;; 17:7DA3 $EA $1A $C0
    ld   a, OAMF_YFLIP | OAM_GBC_PAL_2            ;; 17:7DA6 $3E $42
    ld   [wOAMBuffer+$1B], a                      ;; 17:7DA8 $EA $1B $C0
    ret                                           ;; 17:7DAB $C9

.credits
    ld   hl, DialogArrowOAMYTable                 ;; 17:7DAC $21 $7A $7D
    add  hl, de                                   ;; 17:7DAF $19
    ld   a, [hl]                                  ;; 17:7DB0 $7E
    ld   hl, hBaseScrollY                         ;; 17:7DB1 $21 $97 $FF
    sub  [hl]                                     ;; 17:7DB4 $96
    ld   [wOAMBuffer], a                          ;; 17:7DB5 $EA $00 $C0
    ld   a, $97 ; X position                      ;; 17:7DB8 $3E $97
    ld   [wOAMBuffer+1], a                        ;; 17:7DBA $EA $01 $C0
    ld   a, $FE ; Arrow tile                      ;; 17:7DBD $3E $FE
    ld   [wOAMBuffer+2], a                        ;; 17:7DBF $EA $02 $C0
    ld   a, OAMF_YFLIP                            ;; 17:7DC2 $3E $40
    ld   [wOAMBuffer+3], a                        ;; 17:7DC4 $EA $03 $C0
    ret                                           ;; 17:7DC7 $C9

ChoiceSelectionMarkerYTable::
    db   $30 ; top
    db   $78 ; bottom

ChoiceSelectionMarkerXTable::
    db   $30 ; top
    db   $58 ; bottom

DrawDialogChoiceMarker::
    ld   e, $00                                   ;; 17:7DCC $1E $00
    ld   a, [wDialogState]                        ;; 17:7DCE $FA $9F $C1
    and  DIALOG_BOX_BOTTOM_FLAG                   ;; 17:7DD1 $E6 $80
    jr   z, .doneSettingY                         ;; 17:7DD3 $28 $01

    inc  e                                        ;; 17:7DD5 $1C

.doneSettingY
    ld   d, $00                                   ;; 17:7DD6 $16 $00
    ld   a, [wGameplayType]                       ;; 17:7DD8 $FA $95 $DB
    cp   GAMEPLAY_CREDITS                         ;; 17:7DDB $FE $01
    jr   z, .credits                              ;; 17:7DDD $28 $25

    ld   hl, ChoiceSelectionMarkerYTable          ;; 17:7DDF $21 $C8 $7D
    add  hl, de                                   ;; 17:7DE2 $19
    ld   a, [hl]                                  ;; 17:7DE3 $7E
    ld   [wOAMBuffer+$18], a                      ;; 17:7DE4 $EA $18 $C0
    ld   e, $00                                   ;; 17:7DE7 $1E $00
    ld   a, [wDialogAskSelectionIndex]            ;; 17:7DE9 $FA $77 $C1
    and  $01                                      ;; 17:7DEC $E6 $01
    jr   z, .doneSettingX                         ;; 17:7DEE $28 $01

    inc  e                                        ;; 17:7DF0 $1C

.doneSettingX
    ld   hl, ChoiceSelectionMarkerXTable          ;; 17:7DF1 $21 $CA $7D
    add  hl, de                                   ;; 17:7DF4 $19
    ld   a, [hl]                                  ;; 17:7DF5 $7E
    ld   [wOAMBuffer+$19], a                      ;; 17:7DF6 $EA $19 $C0
    ld   a, $3E ; Marker tile                     ;; 17:7DF9 $3E $3E
    ld   [wOAMBuffer+$1A], a                      ;; 17:7DFB $EA $1A $C0
    ld   a, $00                                   ;; 17:7DFE $3E $00
    ld   [wOAMBuffer+$1B], a                      ;; 17:7E00 $EA $1B $C0
    ret                                           ;; 17:7E03 $C9

; Dead code? The credits don't contain any dialog with choices
.credits:
    ld   hl, ChoiceSelectionMarkerYTable          ;; 17:7E04 $21 $C8 $7D
    add  hl, de                                   ;; 17:7E07 $19
    ld   a, [hl]                                  ;; 17:7E08 $7E
    ld   hl, hBaseScrollY                         ;; 17:7E09 $21 $97 $FF
    sub  [hl]                                     ;; 17:7E0C $96
    ld   [wOAMBuffer], a                          ;; 17:7E0D $EA $00 $C0
    ld   e, $00                                   ;; 17:7E10 $1E $00
    ld   a, [wDialogAskSelectionIndex]            ;; 17:7E12 $FA $77 $C1
    and  $01                                      ;; 17:7E15 $E6 $01
    jr   z, .jr_7E1A                              ;; 17:7E17 $28 $01

    inc  e                                        ;; 17:7E19 $1C

.jr_7E1A
    ld   hl, ChoiceSelectionMarkerXTable          ;; 17:7E1A $21 $CA $7D
    add  hl, de                                   ;; 17:7E1D $19
    ld   a, [hl]                                  ;; 17:7E1E $7E
    ld   [wOAMBuffer+1], a                        ;; 17:7E1F $EA $01 $C0
    ld   a, $9E ; Marker tile                     ;; 17:7E22 $3E $9E
    ld   [wOAMBuffer+2], a                        ;; 17:7E24 $EA $02 $C0
    ld   a, $00                                   ;; 17:7E27 $3E $00
    ld   [wOAMBuffer+3], a                        ;; 17:7E29 $EA $03 $C0
    ret                                           ;; 17:7E2C $C9

UpdateEntityPosWithSpeed_17::
    call AddEntitySpeedToPos_17                   ;; 17:7E2D $CD $3A $7E

UpdateEntityYPosWithSpeed_17::
    push bc                                       ;; 17:7E30 $C5
    ld   a, c                                     ;; 17:7E31 $79
    add  $10                                      ;; 17:7E32 $C6 $10
    ld   c, a                                     ;; 17:7E34 $4F
    call AddEntitySpeedToPos_17                   ;; 17:7E35 $CD $3A $7E
    pop  bc                                       ;; 17:7E38 $C1
    ret                                           ;; 17:7E39 $C9

; Update the entity's position using its speed.
;
; The values in the entity speed tables are the number of pixels to
; move within 16 frames. For example, if it's 8, the entity will move
; 1 pixel every other frame (8/16). If it's -16, the entity will move
; -1 pixel every frame (-16/16).
;
; Inputs:
;   bc  entity index
AddEntitySpeedToPos_17::
    ld   hl, wEntitiesSpeedXTable                 ;; 17:7E3A $21 $40 $C2
    add  hl, bc                                   ;; 17:7E3D $09
    ld   a, [hl]                                  ;; 17:7E3E $7E
    and  a                                        ;; 17:7E3F $A7
    ; No need to update the position if it's not moving
    jr   z, .return                               ;; 17:7E40 $28 $23

    push af                                       ;; 17:7E42 $F5
    ; Multiply speed by 16 so the carry is set if greater than $0F
    swap a                                        ;; 17:7E43 $CB $37
    and  $F0                                      ;; 17:7E45 $E6 $F0
    ld   hl, wEntitiesSpeedXAccTable              ;; 17:7E47 $21 $60 $C2
    add  hl, bc                                   ;; 17:7E4A $09
    add  [hl]                                     ;; 17:7E4B $86
    ld   [hl], a                                  ;; 17:7E4C $77
    ; Save carry in bit 0 of d
    rl   d                                        ;; 17:7E4D $CB $12
    ld   hl, wEntitiesPosXTable                   ;; 17:7E4F $21 $00 $C2

.updatePosition
    add  hl, bc                                   ;; 17:7E52 $09
    pop  af                                       ;; 17:7E53 $F1
    ; Sign extension for high nibble
    ld   e, $00                                   ;; 17:7E54 $1E $00
    bit  7, a                                     ;; 17:7E56 $CB $7F
    jr   z, .positive                             ;; 17:7E58 $28 $02

    ld   e, $F0                                   ;; 17:7E5A $1E $F0

.positive
    swap a                                        ;; 17:7E5C $CB $37
    and  $0F                                      ;; 17:7E5E $E6 $0F
    or   e                                        ;; 17:7E60 $B3
    ; Get carry back from d
    rr   d                                        ;; 17:7E61 $CB $1A
    adc  [hl]                                     ;; 17:7E63 $8E
    ld   [hl], a                                  ;; 17:7E64 $77

.return
    ret                                           ;; 17:7E65 $C9

AddEntityZSpeedToPos_17::
    ld   hl, wEntitiesSpeedZTable                 ;; 17:7E66 $21 $20 $C3
    add  hl, bc                                   ;; 17:7E69 $09
    ld   a, [hl]                                  ;; 17:7E6A $7E
    and  a                                        ;; 17:7E6B $A7
    jr   z, AddEntitySpeedToPos_17.return         ;; 17:7E6C $28 $F7

    push af                                       ;; 17:7E6E $F5
    swap a                                        ;; 17:7E6F $CB $37
    and  $F0                                      ;; 17:7E71 $E6 $F0
    ld   hl, wEntitiesSpeedZAccTable              ;; 17:7E73 $21 $30 $C3
    add  hl, bc                                   ;; 17:7E76 $09
    add  [hl]                                     ;; 17:7E77 $86
    ld   [hl], a                                  ;; 17:7E78 $77
    rl   d                                        ;; 17:7E79 $CB $12
    ld   hl, wEntitiesPosZTable                   ;; 17:7E7B $21 $10 $C3
    jr   AddEntitySpeedToPos_17.updatePosition    ;; 17:7E7E $18 $D2

; Blend palettes with varying degree of white for a fade-in effect.
; Inputs:
;   a: blending amount, between 0 (white) and 0B (non-blended original colors)
CreditsBlendPalettes::
    and  $01                                      ;; 17:7E80 $E6 $01
    jr   z, .jr_7E88                              ;; 17:7E82 $28 $04

    ld   a, $02                                   ;; 17:7E84 $3E $02
    jr   jr_017_7EA0                              ;; 17:7E86 $18 $18

.jr_7E88
IF __PATCH_1__
    ld   hl, wFarcallParams
    ld   a, BANK(func_020_7E0E)
    ld   [hl+], a
    ld   a, HIGH(func_020_7E0E)
    ld   [hl+], a
    ld   a, LOW(func_020_7E0E)
    ld   [hl+], a
    ld   a, BANK(@)
    ld   [hl], a
    call Farcall
ELSE
    ld   a, $06                                   ;; 17:7E88 $3E $06
    ldh  [hMultiPurposeD], a                      ;; 17:7E8A $E0 $E4
    ld   a, $0C                                   ;; 17:7E8C $3E $0C
    ldh  [hMultiPurposeE], a                      ;; 17:7E8E $E0 $E5
    ld   a, $18                                   ;; 17:7E90 $3E $18
    ldh  [hMultiPurposeF], a                      ;; 17:7E92 $E0 $E6
    ld   hl, wBGPal1                              ;; 17:7E94 $21 $10 $DC
    ld   a, $40                                   ;; 17:7E97 $3E $40
    ldh  [hMultiPurpose3], a                      ;; 17:7E99 $E0 $DA
    call func_017_7EA4                            ;; 17:7E9B $CD $A4 $7E
ENDC
    ld   a, $01                                   ;; 17:7E9E $3E $01

jr_017_7EA0:
    ld   [wPaletteDataFlags], a                   ;; 17:7EA0 $EA $D1 $DD
    ret                                           ;; 17:7EA3 $C9

IF !__PATCH_1__
func_017_7EA4::
    push hl                                       ;; 17:7EA4 $E5
    ld   a, $02                                   ;; 17:7EA5 $3E $02
    ldh  [rSVBK], a                               ;; 17:7EA7 $E0 $70
    ld   a, [hl+]                                 ;; 17:7EA9 $2A
    ld   e, a                                     ;; 17:7EAA $5F
    ld   a, [hl]                                  ;; 17:7EAB $7E
    ld   d, a                                     ;; 17:7EAC $57
    dec  hl                                       ;; 17:7EAD $2B
    xor  a                                        ;; 17:7EAE $AF
    ldh  [rSVBK], a                               ;; 17:7EAF $E0 $70
    ldh  a, [hMultiPurposeD]                      ;; 17:7EB1 $F0 $E4
    ld   c, a                                     ;; 17:7EB3 $4F
    ld   a, e                                     ;; 17:7EB4 $7B
    and  $1F                                      ;; 17:7EB5 $E6 $1F
    ld   b, a                                     ;; 17:7EB7 $47
    ld   a, [hl]                                  ;; 17:7EB8 $7E
    and  $1F                                      ;; 17:7EB9 $E6 $1F
    cp   b                                        ;; 17:7EBB $B8
    jr   c, jr_017_7EC6                           ;; 17:7EBC $38 $08

    jr   z, jr_017_7EC6                           ;; 17:7EBE $28 $06

    sub  c                                        ;; 17:7EC0 $91
    jr   c, jr_017_7EC6                           ;; 17:7EC1 $38 $03

    cp   b                                        ;; 17:7EC3 $B8
    jr   nc, jr_017_7EC7                          ;; 17:7EC4 $30 $01

jr_017_7EC6:
    ld   a, b                                     ;; 17:7EC6 $78

jr_017_7EC7:
    ldh  [hMultiPurpose0], a                      ;; 17:7EC7 $E0 $D7
    ld   a, e                                     ;; 17:7EC9 $7B
    and  $E0                                      ;; 17:7ECA $E6 $E0
    swap a                                        ;; 17:7ECC $CB $37
    ld   b, a                                     ;; 17:7ECE $47
    ld   a, d                                     ;; 17:7ECF $7A
    and  $03                                      ;; 17:7ED0 $E6 $03
    swap a                                        ;; 17:7ED2 $CB $37
    or   b                                        ;; 17:7ED4 $B0
    ld   b, a                                     ;; 17:7ED5 $47
    ld   a, [hl+]                                 ;; 17:7ED6 $2A
    and  $E0                                      ;; 17:7ED7 $E6 $E0
    swap a                                        ;; 17:7ED9 $CB $37
    ld   c, a                                     ;; 17:7EDB $4F
    ld   a, [hl]                                  ;; 17:7EDC $7E
    and  $03                                      ;; 17:7EDD $E6 $03
    swap a                                        ;; 17:7EDF $CB $37
    or   c                                        ;; 17:7EE1 $B1
    push af                                       ;; 17:7EE2 $F5
    ldh  a, [hMultiPurposeE]                      ;; 17:7EE3 $F0 $E5
    ld   c, a                                     ;; 17:7EE5 $4F
    pop  af                                       ;; 17:7EE6 $F1
    cp   b                                        ;; 17:7EE7 $B8
    jr   c, jr_017_7EF2                           ;; 17:7EE8 $38 $08

    jr   z, jr_017_7EF2                           ;; 17:7EEA $28 $06

    sub  c                                        ;; 17:7EEC $91
    jr   c, jr_017_7EF2                           ;; 17:7EED $38 $03

    cp   b                                        ;; 17:7EEF $B8
    jr   nc, jr_017_7EF3                          ;; 17:7EF0 $30 $01

jr_017_7EF2:
    ld   a, b                                     ;; 17:7EF2 $78

jr_017_7EF3:
    ldh  [hMultiPurpose1], a                      ;; 17:7EF3 $E0 $D8
    ldh  a, [hMultiPurposeF]                      ;; 17:7EF5 $F0 $E6
    ld   c, a                                     ;; 17:7EF7 $4F
    ld   a, d                                     ;; 17:7EF8 $7A
    and  $7C                                      ;; 17:7EF9 $E6 $7C
    ld   b, a                                     ;; 17:7EFB $47
    ld   a, [hl]                                  ;; 17:7EFC $7E
    and  $7C                                      ;; 17:7EFD $E6 $7C
    cp   b                                        ;; 17:7EFF $B8
    jr   c, jr_017_7F0A                           ;; 17:7F00 $38 $08

    jr   z, jr_017_7F0A                           ;; 17:7F02 $28 $06

    sub  c                                        ;; 17:7F04 $91
    jr   c, jr_017_7F0A                           ;; 17:7F05 $38 $03

    cp   b                                        ;; 17:7F07 $B8
    jr   nc, jr_017_7F0B                          ;; 17:7F08 $30 $01

jr_017_7F0A:
    ld   a, b                                     ;; 17:7F0A $78

jr_017_7F0B:
    ldh  [hMultiPurpose2], a                      ;; 17:7F0B $E0 $D9
    pop  hl                                       ;; 17:7F0D $E1
    ldh  a, [hMultiPurpose0]                      ;; 17:7F0E $F0 $D7
    ld   b, a                                     ;; 17:7F10 $47
    ldh  a, [hMultiPurpose1]                      ;; 17:7F11 $F0 $D8
    swap a                                        ;; 17:7F13 $CB $37
    ld   c, a                                     ;; 17:7F15 $4F
    and  $E0                                      ;; 17:7F16 $E6 $E0
    or   b                                        ;; 17:7F18 $B0
    ld   [hl+], a                                 ;; 17:7F19 $22
    ldh  a, [hMultiPurpose2]                      ;; 17:7F1A $F0 $D9
    ld   b, a                                     ;; 17:7F1C $47
    ld   a, c                                     ;; 17:7F1D $79
    and  $03                                      ;; 17:7F1E $E6 $03
    or   b                                        ;; 17:7F20 $B0
    ld   [hl+], a                                 ;; 17:7F21 $22
    ldh  a, [hMultiPurpose3]                      ;; 17:7F22 $F0 $DA
    dec  a                                        ;; 17:7F24 $3D
    ldh  [hMultiPurpose3], a                      ;; 17:7F25 $E0 $DA
    and  a                                        ;; 17:7F27 $A7
    jp   nz, func_017_7EA4                        ;; 17:7F28 $C2 $A4 $7E

    xor  a                                        ;; 17:7F2B $AF
    ld   [wPaletteUnknownE], a                    ;; 17:7F2C $EA $D5 $DD
    ret                                           ;; 17:7F2F $C9
ENDC

func_017_7F30::
    and  $01                                      ;; 17:7F30 $E6 $01
    jr   z, .jr_7F3C                              ;; 17:7F32 $28 $08

    xor  a                                        ;; 17:7F34 $AF
    ld   [wD01F], a                               ;; 17:7F35 $EA $1F $D0
    ld   a, $02                                   ;; 17:7F38 $3E $02
    jr   jr_017_7F52                              ;; 17:7F3A $18 $16

.jr_7F3C
IF __PATCH_1__
    ld   hl, wFarcallBank
    ld   a, BANK(func_020_7EB1)
    ld   [hl+], a
    ld   a, HIGH(func_020_7EB1)
    ld   [hl+], a
    ld   a, LOW(func_020_7EB1)
    ld   [hl+], a
    ld   a, BANK(@)
    ld   [hl], a
    call Farcall
ELSE
    ld   a, $06                                   ;; 17:7F3C $3E $06
    ldh  [hMultiPurposeD], a                      ;; 17:7F3E $E0 $E4
    ld   a, $0C                                   ;; 17:7F40 $3E $0C
    ldh  [hMultiPurposeE], a                      ;; 17:7F42 $E0 $E5
    ld   a, $18                                   ;; 17:7F44 $3E $18
    ldh  [hFreeWarpDataAddress], a                ;; 17:7F46 $E0 $E6
    ld   hl, wBGPal1                              ;; 17:7F48 $21 $10 $DC
    ld   d, $40                                   ;; 17:7F4B $16 $40
    call func_017_7F57                            ;; 17:7F4D $CD $57 $7F
ENDC
    ld   a, $01                                   ;; 17:7F50 $3E $01

jr_017_7F52:
    ld   [wPaletteDataFlags], a                   ;; 17:7F52 $EA $D1 $DD
    xor  a                                        ;; 17:7F55 $AF
    ret                                           ;; 17:7F56 $C9

IF !__PATCH_1__
func_017_7F57::
    push hl                                       ;; 17:7F57 $E5
    ldh  a, [hMultiPurposeD]                      ;; 17:7F58 $F0 $E4
    ld   c, a                                     ;; 17:7F5A $4F
    ld   a, [hl]                                  ;; 17:7F5B $7E
    and  $1F                                      ;; 17:7F5C $E6 $1F
    add  c                                        ;; 17:7F5E $81
    cp   $20                                      ;; 17:7F5F $FE $20
    jr   c, jr_017_7F65                           ;; 17:7F61 $38 $02

    ld   a, $1F                                   ;; 17:7F63 $3E $1F

jr_017_7F65:
    ldh  [hMultiPurpose0], a                      ;; 17:7F65 $E0 $D7
    ldh  a, [hMultiPurposeE]                      ;; 17:7F67 $F0 $E5
    ld   c, a                                     ;; 17:7F69 $4F
    ld   a, [hl+]                                 ;; 17:7F6A $2A
    and  $E0                                      ;; 17:7F6B $E6 $E0
    swap a                                        ;; 17:7F6D $CB $37
    ld   b, a                                     ;; 17:7F6F $47
    ld   a, [hl]                                  ;; 17:7F70 $7E
    and  $03                                      ;; 17:7F71 $E6 $03
    swap a                                        ;; 17:7F73 $CB $37
    or   b                                        ;; 17:7F75 $B0
    and  $3E                                      ;; 17:7F76 $E6 $3E
    add  c                                        ;; 17:7F78 $81
    cp   $40                                      ;; 17:7F79 $FE $40
    jr   c, jr_017_7F7F                           ;; 17:7F7B $38 $02

    ld   a, $3E                                   ;; 17:7F7D $3E $3E

jr_017_7F7F:
    ldh  [hMultiPurpose1], a                      ;; 17:7F7F $E0 $D8
    ldh  a, [hFreeWarpDataAddress]                ;; 17:7F81 $F0 $E6
    ld   c, a                                     ;; 17:7F83 $4F
    ld   a, [hl]                                  ;; 17:7F84 $7E
    and  $7C                                      ;; 17:7F85 $E6 $7C
    add  c                                        ;; 17:7F87 $81
    cp   $80                                      ;; 17:7F88 $FE $80
    jr   c, jr_017_7F8E                           ;; 17:7F8A $38 $02

    ld   a, $7C                                   ;; 17:7F8C $3E $7C

jr_017_7F8E:
    ldh  [hMultiPurpose2], a                      ;; 17:7F8E $E0 $D9
    pop  hl                                       ;; 17:7F90 $E1
    ldh  a, [hMultiPurpose0]                      ;; 17:7F91 $F0 $D7
    ld   b, a                                     ;; 17:7F93 $47
    ldh  a, [hMultiPurpose1]                      ;; 17:7F94 $F0 $D8
    swap a                                        ;; 17:7F96 $CB $37
    ld   c, a                                     ;; 17:7F98 $4F
    and  $E0                                      ;; 17:7F99 $E6 $E0
    or   b                                        ;; 17:7F9B $B0
    ld   [hl+], a                                 ;; 17:7F9C $22
    ldh  a, [hMultiPurpose2]                      ;; 17:7F9D $F0 $D9
    ld   b, a                                     ;; 17:7F9F $47
    ld   a, c                                     ;; 17:7FA0 $79
    and  $03                                      ;; 17:7FA1 $E6 $03
    or   b                                        ;; 17:7FA3 $B0
    ld   [hl+], a                                 ;; 17:7FA4 $22
    dec  d                                        ;; 17:7FA5 $15
    jr   nz, func_017_7F57                        ;; 17:7FA6 $20 $AF

    ret                                           ;; 17:7FA8 $C9
ENDC

func_017_7FA9::
    ld   hl, wFarcallParams                       ;; 17:7FA9 $21 $01 $DE
    ld   a, BANK(func_020_7D7C)                   ;; 17:7FAC $3E $20
    ld   [hl+], a                                 ;; 17:7FAE $22
    ld   a, HIGH(func_020_7D7C)                   ;; 17:7FAF $3E $7D
    ld   [hl+], a                                 ;; 17:7FB1 $22
    ld   a, LOW(func_020_7D7C)                    ;; 17:7FB2 $3E $7C
    ld   [hl+], a                                 ;; 17:7FB4 $22
    ld   a, BANK(@)                               ;; 17:7FB5 $3E $17
    ld   [hl], a                                  ;; 17:7FB7 $77
    jp   Farcall                                  ;; 17:7FB8 $C3 $D7 $0B
