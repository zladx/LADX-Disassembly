;
; Code for save file screen.
; Displays the "Return to Game / Save and Quit" screen.
;

FileSaveEntryPoint::
    ld   a, [wGameplaySubtype]                    ;; 01:4000 $FA $96 $DB
    JP_TABLE                                      ;; 01:4003 $C7
._00 dw FileSaveInitial                           ;; 01:4004
._01 dw FileSaveMapFadeOut                        ;; 01:4006
._02 dw FileSaveDelay1                            ;; 01:4008
._03 dw FileSaveDelay2                            ;; 01:400A
._04 dw FileSaveVisible                           ;; 01:400C
._05 dw FileSaveInteractive                       ;; 01:400E
._06 dw FileSaveFadeOut                           ;; 01:4010

FileSaveInitial::
    call IncrementGameplaySubtype                 ;; 01:4012 $CD $D6 $44

    ; If running on grayscale GB, jump directly to the
    ; next state (map fade-out).
    ldh  a, [hIsGBC]                              ;; 01:4015 $F0 $FE
    and  a                                        ;; 01:4017 $A7
    jr   z, FileSaveMapFadeOut                    ;; 01:4018 $28 $28

    ; Running on GBC: copy data from WRAM0 to WRAM3
    ld   hl, wBGPal1 ; start address              ;; 01:401A $21 $10 $DC
    ld   c, $80      ; bytes count                ;; 01:401D $0E $80

    ; Disable interrupts
    di                                            ;; 01:401F $F3

    ; Select WRAM Bank 3
    ld   a, $03                                   ;; 01:4020 $3E $03
    ldh  [rSVBK], a                               ;; 01:4022 $E0 $70

    ; If wIsFileSelectionArrowShifted == 0...
    ld   a, [wIsFileSelectionArrowShifted]        ;; 01:4024 $FA $00 $D0
    and  a                                        ;; 01:4027 $A7
    jr   nz, .done                                ;; 01:4028 $20 $14

    ; Copy $80 bytes from 00:DC10 to 03:DC10
.loop
    ; Switch to WRAM bank 0
    xor  a                                        ;; 01:402A $AF
    ldh  [rSVBK], a                               ;; 01:402B $E0 $70
    ; Read a byte
    ld   b, [hl]                                  ;; 01:402D $46
    ; Switch to WRAM bank 3
    ld   a, $03                                   ;; 01:402E $3E $03
    ldh  [rSVBK], a                               ;; 01:4030 $E0 $70
    ; Write a byte
    ld   [hl], b                                  ;; 01:4032 $70
    ; Increment the pointer, and loop until done.
    inc  hl                                       ;; 01:4033 $23
    dec  c                                        ;; 01:4034 $0D
    ld   a, c                                     ;; 01:4035 $79
    and  a                                        ;; 01:4036 $A7
    jr   nz, .loop                                ;; 01:4037 $20 $F1

    ; Set wIsFileSelectionArrowShifted to 1
    ld   a, $01                                   ;; 01:4039 $3E $01
    ld   [wIsFileSelectionArrowShifted], a        ;; 01:403B $EA $00 $D0

.done
    ; Switch back to WRAM bank 0
    xor  a                                        ;; 01:403E $AF
    ldh  [rSVBK], a                               ;; 01:403F $E0 $70
    ; Enable interrupts
    ei                                            ;; 01:4041 $FB

FileSaveMapFadeOut::
    call DrawLinkSprite                           ;; 01:4042 $CD $2E $1D
    call AnimateEntitiesAndRestoreBank01          ;; 01:4045 $CD $FC $0E
    call func_1A22                                ;; 01:4048 $CD $22 $1A
    ld   a, [wTransitionSequenceCounter]          ;; 01:404B $FA $6B $C1
    cp   $04                                      ;; 01:404E $FE $04
    jr   nz, .ret_4072                            ;; 01:4050 $20 $20
    ld   a, $03                                   ;; 01:4052 $3E $03
    ldh  [hVolumeRight], a                        ;; 01:4054 $E0 $A9
    ld   a, $30                                   ;; 01:4056 $3E $30
    ldh  [hVolumeLeft], a                         ;; 01:4058 $E0 $AA
    call IncrementGameplaySubtype                 ;; 01:405A $CD $D6 $44
    xor  a                                        ;; 01:405D $AF
    ld   [wScrollXOffset], a                      ;; 01:405E $EA $BF $C1
    ld   [wInventoryAppearing], a                 ;; 01:4061 $EA $4F $C1
    ld   [wOcarinaMenuOpening], a                 ;; 01:4064 $EA $B8 $C1
    ld   [wOcarinaMenuClosing], a                 ;; 01:4067 $EA $B9 $C1
    ld   [wOcarinaMenuOpen], a                    ;; 01:406A $EA $B5 $C1

    ld   a, TILESET_0F                            ;; 01:406D $3E $0F
    ld   [wTilesetToLoad], a                      ;; 01:406F $EA $FE $D6

.ret_4072
    ret                                           ;; 01:4072 $C9

FileSaveDelay1::
    ld   a, TILESET_SAVE_MENU                     ;; 01:4073 $3E $0D
    ld   [wTilesetToLoad], a                      ;; 01:4075 $EA $FE $D6
    xor  a                                        ;; 01:4078 $AF
    ld   [wC13F], a                               ;; 01:4079 $EA $3F $C1
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:407C $C3 $D6 $44

FileSaveDelay2::
    ld   a, TILEMAP_MENU_FILE_SAVE                ;; 01:407F $3E $0D
    ld   [wBGMapToLoad], a                        ;; 01:4081 $EA $FF $D6

    ld   a, $FF                                   ;; 01:4084 $3E $FF
    ld   [wWindowY], a                            ;; 01:4086 $EA $9A $DB
    xor  a                                        ;; 01:4089 $AF
    ldh  [hBaseScrollX], a                        ;; 01:408A $E0 $96
    ldh  [hBaseScrollY], a                        ;; 01:408C $E0 $97
    ld   [wTransitionSequenceCounter], a          ;; 01:408E $EA $6B $C1
    ld   [wC16C], a                               ;; 01:4091 $EA $6C $C1
    ld   a, $01                                   ;; 01:4094 $3E $01
    ld   [wPaletteUnknownE], a                    ;; 01:4096 $EA $D5 $DD
    jp   IncrementGameplaySubtypeAndReturn        ;; 01:4099 $C3 $D6 $44

FileSaveVisible::
    call func_1A39                                ;; 01:409C $CD $39 $1A
    ld   a, [wTransitionSequenceCounter]          ;; 01:409F $FA $6B $C1
    cp   $04                                      ;; 01:40A2 $FE $04
    jr   nz, .return                              ;; 01:40A4 $20 $03
    call IncrementGameplaySubtype                 ;; 01:40A6 $CD $D6 $44
.return
    ret                                           ;; 01:40A9 $C9

FileSaveInteractive::
    call func_001_412A                            ;; 01:40AA $CD $2A $41
    ldh  a, [hJoypadState]                        ;; 01:40AD $F0 $CC
    and  J_A | J_B | J_START                      ;; 01:40AF $E6 $B0
    jr   z, LCDOn.return                          ;; 01:40B1 $28 $74
    ld   a, JINGLE_VALIDATE                       ;; 01:40B3 $3E $13
    ldh  [hJingle], a                             ;; 01:40B5 $E0 $F2
    ld   a, [wC13F]                               ;; 01:40B7 $FA $3F $C1
    cp   $01                                      ;; 01:40BA $FE $01
    jr   z, jr_001_40F9                           ;; 01:40BC $28 $3B
    call IncrementGameplaySubtype                 ;; 01:40BE $CD $D6 $44
    xor  a                                        ;; 01:40C1 $AF
    ld   [wTransitionSequenceCounter], a          ;; 01:40C2 $EA $6B $C1
    ld   [wC16C], a                               ;; 01:40C5 $EA $6C $C1
    ld   a, [wIsIndoor]                           ;; 01:40C8 $FA $A5 $DB
    and  a                                        ;; 01:40CB $A7
    jr   z, .done                                 ;; 01:40CC $28 $07
    xor  a                                        ;; 01:40CE $AF
    ld   [wBlockItemUsage], a                     ;; 01:40CF $EA $0A $C5
    ld   [wC116], a                               ;; 01:40D2 $EA $16 $C1
.done
    ret                                           ;; 01:40D5 $C9

; Unused code?
label_40D6::
    xor  a                                        ;; 01:40D6 $AF
    ld   [wOBJ0Palette], a                        ;; 01:40D7 $EA $98 $DB
    ld   [wOBJ1Palette], a                        ;; 01:40DA $EA $99 $DB
    ldh  [rOBP0], a                               ;; 01:40DD $E0 $48
    ldh  [rOBP1], a                               ;; 01:40DF $E0 $49
    ld   [wBGPalette], a                          ;; 01:40E1 $EA $97 $DB
    ldh  [rBGP], a                                ;; 01:40E4 $E0 $47
    ldh  a, [hLinkPositionX]                      ;; 01:40E6 $F0 $98
    ld   [wMapEntrancePositionX], a               ;; 01:40E8 $EA $9D $DB
    ldh  a, [hLinkPositionY]                      ;; 01:40EB $F0 $99
    ld   [wMapEntrancePositionY], a               ;; 01:40ED $EA $9E $DB
    call LoadSavedFile                            ;; 01:40F0 $CD $A4 $52
    ld   a, $80                                   ;; 01:40F3 $3E $80
    ld   [wInvincibilityCounter], a               ;; 01:40F5 $EA $C7 $DB
    ret                                           ;; 01:40F8 $C9

jr_001_40F9::
    call label_27F2                               ;; 01:40F9 $CD $F2 $27
    call SaveGameToFile                           ;; 01:40FC $CD $E6 $5D
    call ClearWRAMAndLowerHRAM                    ;; 01:40FF $CD $CB $29
    xor  a                                        ;; 01:4102 $AF
    ldh  [hActiveEntityTilesOffset], a            ;; 01:4103 $E0 $F5
    ld   a, $01                                   ;; 01:4105 $3E $01
    ld   [wCurrentBank], a                        ;; 01:4107 $EA $AF $DB
    call func_001_6162                            ;; 01:410A $CD $62 $61
IF __PATCH_3__
    call LCDOff
ENDC
    ; fallthrough

; Enable LCD Screen
LCDOn::
    ; Configure LCD control register
    ;   Bit 7: Enable LDC display
    ;   Bit 6: Window tile map to $9C00-$9FFF
    ;   Bit 5: Window display disabled
    ;   Bit 4: Background & Window Tile Data to $8800-$97FF
    ;   Bit 3: Background Tile Map to $9800-$9BFF
    ;   Bit 2: Sprite size 8x16
    ;   Bit 1: Sprite displayed enabled
    ;   Bit 0: Background display enabled
    ld   a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON ;; 01:410D $3E $C7
    ldh  [rLCDC], a                               ;; 01:410F $E0 $40
    ld   [wLCDControl], a                         ;; 01:4111 $EA $FD $D6

    ; Set Window X position
    ld   a, $07                                   ;; 01:4114 $3E $07
    ldh  [rWX], a                                 ;; 01:4116 $E0 $4B

    ; Set Window Y position (inventory status bar)
    ld   a, $80                                   ;; 01:4118 $3E $80
    ld   [wWindowY], a                            ;; 01:411A $EA $9A $DB
    ldh  [rWY], a                                 ;; 01:411D $E0 $4A

    ; Configure volume
    ld   a, $07                                   ;; 01:411F $3E $07
    ldh  [hVolumeRight], a                        ;; 01:4121 $E0 $A9
    ld   a, $70                                   ;; 01:4123 $3E $70
    ldh  [hVolumeLeft], a                         ;; 01:4125 $E0 $AA
.return
    ret                                           ;; 01:4127 $C9

; OAM Y positions
Data_001_4128::
    db   $38 + $10                                ;; 01:4128
    db   $48 + $10                                ;; 01:4129

; Called by FileSaveInteractive
func_001_412A::
    ld   hl, wC13F                                ;; 01:412A $21 $3F $C1
    call MoveSelect                               ;; 01:412D $CD $A8 $6B
    ldh  a, [hJoypadState]                        ;; 01:4130 $F0 $CC
    and  J_UP | J_DOWN                            ;; 01:4132 $E6 $0C
    jr   z, .jr_413B                              ;; 01:4134 $28 $05
    ld   a, [hl]                                  ;; 01:4136 $7E
    inc  a                                        ;; 01:4137 $3C
    and  $01                                      ;; 01:4138 $E6 $01
    ld   [hl], a                                  ;; 01:413A $77

.jr_413B::
    ld   e, [hl]                                  ;; 01:413B $5E
    ld   d, $00                                   ;; 01:413C $16 $00
    ld   hl, Data_001_4128                        ;; 01:413E $21 $28 $41
    add  hl, de                                   ;; 01:4141 $19
    ld   a, [hl]                                  ;; 01:4142 $7E
    ld   hl, wOAMBuffer+$18                       ;; 01:4143 $21 $18 $C0
    ldi  [hl], a                                  ;; 01:4146 $22
    ld   a, SAVE_OPTION_X + $8                    ;; 01:4147 $3E $24
    ldi  [hl], a                                  ;; 01:4149 $22
    ld   a, $BE                                   ;; 01:414A $3E $BE
    ldi  [hl], a                                  ;; 01:414C $22
    ld   [hl], $00                                ;; 01:414D $36 $00
    ret                                           ;; 01:414F $C9
    ldh  a, [hLinkCountdown]                      ;; 01:4150 $F0 $B7
    and  a                                        ;; 01:4152 $A7
    jp   nz, .cleanup                             ;; 01:4153 $C2 $BB $41
    ld   e, $70                                   ;; 01:4156 $1E $70

.wait1
    xor  a                                        ;; 01:4158 $AF
    ldh  [rBGP], a                                ;; 01:4159 $E0 $47
    nop                                           ;; 01:415B $00
    nop                                           ;; 01:415C $00
    nop                                           ;; 01:415D $00
    nop                                           ;; 01:415E $00
    nop                                           ;; 01:415F $00
    nop                                           ;; 01:4160 $00
    nop                                           ;; 01:4161 $00
    nop                                           ;; 01:4162 $00
    nop                                           ;; 01:4163 $00
    nop                                           ;; 01:4164 $00
    nop                                           ;; 01:4165 $00
    nop                                           ;; 01:4166 $00
    nop                                           ;; 01:4167 $00
    nop                                           ;; 01:4168 $00
    nop                                           ;; 01:4169 $00
    nop                                           ;; 01:416A $00
    nop                                           ;; 01:416B $00
    nop                                           ;; 01:416C $00
    nop                                           ;; 01:416D $00
    nop                                           ;; 01:416E $00
    nop                                           ;; 01:416F $00
    nop                                           ;; 01:4170 $00
    nop                                           ;; 01:4171 $00
    nop                                           ;; 01:4172 $00
    nop                                           ;; 01:4173 $00
    nop                                           ;; 01:4174 $00
    nop                                           ;; 01:4175 $00
    nop                                           ;; 01:4176 $00
    nop                                           ;; 01:4177 $00
    nop                                           ;; 01:4178 $00
    dec  e                                        ;; 01:4179 $1D
    jr   nz, .wait1                               ;; 01:417A $20 $DC
    ld   e, $30                                   ;; 01:417C $1E $30

.loop1
    ld   a, $40                                   ;; 01:417E $3E $40
    ldh  [rBGP], a                                ;; 01:4180 $E0 $47
    dec  e                                        ;; 01:4182 $1D
    jr   nz, .loop1                               ;; 01:4183 $20 $F9
    ld   e, $30                                   ;; 01:4185 $1E $30

.loop2
    ld   a, $80                                   ;; 01:4187 $3E $80
    ldh  [rBGP], a                                ;; 01:4189 $E0 $47
    dec  e                                        ;; 01:418B $1D
    jr   nz, .loop2                               ;; 01:418C $20 $F9
    ld   e, $FF                                   ;; 01:418E $1E $FF

.wait2
    ld   a, $C0                                   ;; 01:4190 $3E $C0
    ldh  [rBGP], a                                ;; 01:4192 $E0 $47
    nop                                           ;; 01:4194 $00
    nop                                           ;; 01:4195 $00
    nop                                           ;; 01:4196 $00
    nop                                           ;; 01:4197 $00
    nop                                           ;; 01:4198 $00
    nop                                           ;; 01:4199 $00
    nop                                           ;; 01:419A $00
    nop                                           ;; 01:419B $00
    nop                                           ;; 01:419C $00
    nop                                           ;; 01:419D $00
    nop                                           ;; 01:419E $00
    nop                                           ;; 01:419F $00
    nop                                           ;; 01:41A0 $00
    nop                                           ;; 01:41A1 $00
    nop                                           ;; 01:41A2 $00
    nop                                           ;; 01:41A3 $00
    nop                                           ;; 01:41A4 $00
    nop                                           ;; 01:41A5 $00
    dec  e                                        ;; 01:41A6 $1D
    jr   nz, .wait2                               ;; 01:41A7 $20 $E7
    ld   e, $30                                   ;; 01:41A9 $1E $30

.loop3
    ld   a, $80                                   ;; 01:41AB $3E $80
    ldh  [rBGP], a                                ;; 01:41AD $E0 $47
    dec  e                                        ;; 01:41AF $1D
    jr   nz, .loop3                               ;; 01:41B0 $20 $F9
    ld   e, $30                                   ;; 01:41B2 $1E $30

.loop4
    ld   a, $40                                   ;; 01:41B4 $3E $40
    ldh  [rBGP], a                                ;; 01:41B6 $E0 $47
    dec  e                                        ;; 01:41B8 $1D
    jr   nz, .loop4                               ;; 01:41B9 $20 $F9

.cleanup
    xor  a                                        ;; 01:41BB $AF
    ld   [wBGPalette], a                          ;; 01:41BC $EA $97 $DB
    ldh  [rBGP], a                                ;; 01:41BF $E0 $47
    ret                                           ;; 01:41C1 $C9
