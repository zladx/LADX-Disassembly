; Code for bank 0 ("Home").
; Unlike other banks, this code is always adressable at `00:xxxx`, without
; the need to switch banks.

include "code/home/init.asm"
include "code/home/render_loop.asm"
include "code/home/interrupts.asm"

; Switch to the bank defined in a, and save the active bank
SwitchBank::
    ld   [wCurrentBank], a                        ;; 00:080C $EA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:080F $EA $00 $21
    ret                                           ;; 00:0812 $C9

; Switch to the bank defined in a, depending on GB or GBC mode
SwitchAdjustedBank::
    call AdjustBankNumberForGBC                   ;; 00:0813 $CD $0B $0B
    ld   [wCurrentBank], a                        ;; 00:0816 $EA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:0819 $EA $00 $21
    ret                                           ;; 00:081C $C9

ReloadSavedBank::
    push af                                       ;; 00:081D $F5
    ld   a, [wCurrentBank]                        ;; 00:081E $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:0821 $EA $00 $21
    pop  af                                       ;; 00:0824 $F1
    ret                                           ;; 00:0825 $C9

; Load the dungeon minimap tiles and palettes.
;
; The loading is done in several stages. hBGTilesLoadingStage controls which stage
; is to be executed. At the end of this function, hBGTilesLoadingStage is incremented by 1.
LoadDungeonMinimapTiles::
    ; Select the bank containing the dungeon minimap tiles
    ld   a, BANK(DungeonMinimapTiles)             ;; 00:0826 $3E $12
    call AdjustBankNumberForGBC                   ;; 00:0828 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:082B $EA $00 $21

    ; If hBGTilesLoadingStage < 8, load the tiles
    ldh  a, [hBGTilesLoadingStage]                ;; 00:082E $F0 $92
    cp   $08                                      ;; 00:0830 $FE $08
    jr   c, .loadTiles                            ;; 00:0832 $38 $3F

    ; If hBGTilesLoadingStage == 8, load the palette stage 1
    jr   nz, .paletteStage1End                    ;; 00:0834 $20 $0D
    callsb CopyDungeonMinimapPalette              ;; 00:0836 $3E $02 $EA $00 $21 $CD $43 $68
    ld   hl, hBGTilesLoadingStage                 ;; 00:083E $21 $92 $FF
    inc  [hl]                                     ;; 00:0841 $34
    ret                                           ;; 00:0842 $C9
.paletteStage1End

    ; If hBGTilesLoadingStage == 9, load the palette stage 2
    cp   $09                                      ;; 00:0843 $FE $09
    jr   nz, .paletteStage2End                    ;; 00:0845 $20 $0D
    callsb label_002_6827                         ;; 00:0847 $3E $02 $EA $00 $21 $CD $27 $68
    ld   hl, hBGTilesLoadingStage                 ;; 00:084F $21 $92 $FF
    inc  [hl]                                     ;; 00:0852 $34
    ret                                           ;; 00:0853 $C9
.paletteStage2End

    ; If hBGTilesLoadingStage == $0A, load the palette stage 3
    cp   $0A                                      ;; 00:0854 $FE $0A
    jr   nz, .paletteStage3End                    ;; 00:0856 $20 $0D
    callsb label_002_680B                         ;; 00:0858 $3E $02 $EA $00 $21 $CD $0B $68
    ld   hl, hBGTilesLoadingStage                 ;; 00:0860 $21 $92 $FF
    inc  [hl]                                     ;; 00:0863 $34
    ret                                           ;; 00:0864 $C9
.paletteStage3End

    ; else if hBGTilesLoadingStage >= $0B, load the palette stage 4…
    callsb label_002_67E5                         ;; 00:0865 $3E $02 $EA $00 $21 $CD $E5 $67
    ; … and reset the loading stage to zero.
    xor  a                                        ;; 00:086D $AF
    ldh  [hNeedsUpdatingBGTiles], a               ;; 00:086E $E0 $90
    ldh  [hBGTilesLoadingStage], a                ;; 00:0870 $E0 $92
    ret                                           ;; 00:0872 $C9

.loadTiles
    ; tiles offset = [hBGTilesLoadingStage] * $40
    ld   c, a                                     ;; 00:0873 $4F
    ld   b, $00                                   ;; 00:0874 $06 $00
    sla  c                                        ;; 00:0876 $CB $21
    rl   b                                        ;; 00:0878 $CB $10
    sla  c                                        ;; 00:087A $CB $21
    rl   b                                        ;; 00:087C $CB $10
    sla  c                                        ;; 00:087E $CB $21
    rl   b                                        ;; 00:0880 $CB $10
    sla  c                                        ;; 00:0882 $CB $21
    rl   b                                        ;; 00:0884 $CB $10
    sla  c                                        ;; 00:0886 $CB $21
    rl   b                                        ;; 00:0888 $CB $10
    sla  c                                        ;; 00:088A $CB $21
    rl   b                                        ;; 00:088C $CB $10
    ; destination = (vTiles1 + $500) + tiles offset
    ld   hl, vTiles1 + $500                       ;; 00:088E $21 $00 $8D
    add  hl, bc                                   ;; 00:0891 $09
    ld   e, l                                     ;; 00:0892 $5D
    ld   d, h                                     ;; 00:0893 $54
    ; origin = DungeonMinimapTiles + tiles offset
    ld   hl, DungeonMinimapTiles                  ;; 00:0894 $21 $00 $7E
    add  hl, bc                                   ;; 00:0897 $09
    ld   bc, $40                                  ;; 00:0898 $01 $40 $00
    ; Copy the tiles from ROM to tiles memory
    call CopyData                                 ;; 00:089B $CD $14 $29
    ; Increment hBGTilesLoadingStage
    ldh  a, [hBGTilesLoadingStage]                ;; 00:089E $F0 $92
    inc  a                                        ;; 00:08A0 $3C
    ldh  [hBGTilesLoadingStage], a                ;; 00:08A1 $E0 $92
    ret                                           ;; 00:08A3 $C9

PlayAudioStep::
    callsw PlaySfx                                ;; 00:08A4 $3E $1F $CD $0C $08 $CD $06 $40

    ; If a wave SFX is playing, return early
    ldh  a, [hWaveSfx]                            ;; 00:08AC $F0 $F3
    and  a                                        ;; 00:08AE $A7
    jr   nz, .return                              ;; 00:08AF $20 $25

    ; If wMusicTrackTiming != 0…
    ld   a, [wMusicTrackTiming]                   ;; 00:08B1 $FA $0B $C1
    and  a                                        ;; 00:08B4 $A7
    jr   z, .doAudioStep                          ;; 00:08B5 $28 $0F
    ; … and wMusicTrackTiming != 2…
    cp   $02                                      ;; 00:08B7 $FE $02
    ; … play two audio steps (double speed)
    jr   nz, .doAudioStepTwice                    ;; 00:08B9 $20 $08
    ; Otherwise, play the audio step only on odd frames (half speed)
    ldh  a, [hFrameCounter]                       ;; 00:08BB $F0 $E7
    and  $01                                      ;; 00:08BD $E6 $01
    jr   nz, .return                              ;; 00:08BF $20 $15

    jr   .doAudioStep                             ;; 00:08C1 $18 $03

.doAudioStepTwice
    call .doAudioStep                             ;; 00:08C3 $CD $C6 $08
    ; Fallthrough to doAudioStep a second time

.doAudioStep
    ; TODO: clarify the respective purpose of these two functions
    callsw PlayMusicTrack_1B                      ;; 00:08C6 $3E $1B $CD $0C $08 $CD $06 $40
    callsw PlayMusicTrack_1E                      ;; 00:08CE $3E $1E $CD $0C $08 $CD $06 $40

.return
    ret                                           ;; 00:08D6 $C9

;
; Palette-related code in bank $20
;

func_020_6A30_trampoline::
    callsb func_020_6A30                          ;; 00:08D7 $3E $20 $EA $00 $21 $CD $30 $6A

RestoreBankAndReturn::
    ld   a, [wCurrentBank]                        ;; 00:08DF $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:08E2 $EA $00 $21
    ret                                           ;; 00:08E5 $C9

func_020_6AC1_trampoline::
    callsb func_020_6AC1                          ;; 00:08E6 $3E $20 $EA $00 $21 $CD $C1 $6A
    jr   RestoreBankAndReturn                     ;; 00:08EE $18 $EF

UpdateIntroSeaBGPalettes_trampoline::
    callsb UpdateIntroSeaBGPalettes               ;; 00:08F0 $3E $20 $EA $00 $21 $CD $A4 $6B
    jr   RestoreBankAndReturn                     ;; 00:08F8 $18 $E5

ClearFileMenuBG_trampoline::
    push af                                       ;; 00:08FA $F5
    callsb func_020_6BDC                          ;; 00:08FB $3E $20 $EA $00 $21 $CD $DC $6B
    jr   RestoreStackedBankAndReturn              ;; 00:0903 $18 $6E

; Load file menu background and palette, then switch back to bank 1
LoadFileMenuBG_trampoline::
    callsb LoadFileMenuBG                         ;; 00:0905 $3E $20 $EA $00 $21 $CD $00 $6C
    jr   LoadBank1AndReturn                       ;; 00:090D $18 $08

CopyLinkTunicPalette_trampoline::
    callsb CopyLinkTunicPalette                   ;; 00:090F $3E $20 $EA $00 $21 $CD $24 $6C

LoadBank1AndReturn::
    ld   a, $01                                   ;; 00:0917 $3E $01
    ld   [rSelectROMBank], a                      ;; 00:0919 $EA $00 $21
    ret                                           ;; 00:091C $C9

func_91D::
    push af                                       ;; 00:091D $F5
    ld   b, $00                                   ;; 00:091E $06 $00
    ld   a, [wDDD8]                               ;; 00:0920 $FA $D8 $DD
    sla  a                                        ;; 00:0923 $CB $27
    rl   b                                        ;; 00:0925 $CB $10
    sla  a                                        ;; 00:0927 $CB $27
    rl   b                                        ;; 00:0929 $CB $10
    ld   c, a                                     ;; 00:092B $4F
    jr   .jp_92F                                  ;; 00:092C $18 $01

.jp_92E
    push af                                       ;; 00:092E $F5

.jp_92F
    callsb GetBGAttributesAddressForObject        ;; 00:092F $3E $1A $EA $00 $21 $CD $76 $65
    ldh  a, [hMultiPurpose8]                      ;; 00:0937 $F0 $DF
    ld   [rSelectROMBank], a                      ;; 00:0939 $EA $00 $21
    ld   hl, wDrawCommandVRAM1                    ;; 00:093C $21 $91 $DC
    ld   a, [wDrawCommandsVRAM1Size]              ;; 00:093F $FA $90 $DC
    ld   e, a                                     ;; 00:0942 $5F
    add  a, $0A                                   ;; 00:0943 $C6 $0A
    ld   [wDrawCommandsVRAM1Size], a              ;; 00:0945 $EA $90 $DC
    ld   d, $00                                   ;; 00:0948 $16 $00
    add  hl, de                                   ;; 00:094A $19
    ldh  a, [hMultiPurpose9]                      ;; 00:094B $F0 $E0
    ld   d, a                                     ;; 00:094D $57
    ldh  a, [hMultiPurposeA]                      ;; 00:094E $F0 $E1
    ld   e, a                                     ;; 00:0950 $5F
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 00:0951 $F0 $CF
    ldi  [hl], a                                  ;; 00:0953 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 00:0954 $F0 $D0
    ldi  [hl], a                                  ;; 00:0956 $22
    ld   a, $81                                   ;; 00:0957 $3E $81
    ldi  [hl], a                                  ;; 00:0959 $22
    ld   a, [de]                                  ;; 00:095A $1A
    ldi  [hl], a                                  ;; 00:095B $22
    inc  de                                       ;; 00:095C $13
    inc  de                                       ;; 00:095D $13
    ld   a, [de]                                  ;; 00:095E $1A
    ldi  [hl], a                                  ;; 00:095F $22
    dec  de                                       ;; 00:0960 $1B
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 00:0961 $F0 $CF
    ldi  [hl], a                                  ;; 00:0963 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 00:0964 $F0 $D0
    inc  a                                        ;; 00:0966 $3C
    ldi  [hl], a                                  ;; 00:0967 $22
    ld   a, $81                                   ;; 00:0968 $3E $81
    ldi  [hl], a                                  ;; 00:096A $22
    ld   a, [de]                                  ;; 00:096B $1A
    ldi  [hl], a                                  ;; 00:096C $22
    inc  de                                       ;; 00:096D $13
    inc  de                                       ;; 00:096E $13
    ld   a, [de]                                  ;; 00:096F $1A
    ldi  [hl], a                                  ;; 00:0970 $22
    xor  a                                        ;; 00:0971 $AF
    ldi  [hl], a                                  ;; 00:0972 $22

; Restore bank saved on stack and return
RestoreStackedBankAndReturn::
    pop  af                                       ;; 00:0973 $F1
    ld   [rSelectROMBank], a                      ;; 00:0974 $EA $00 $21
    ret                                           ;; 00:0977 $C9

func_020_6D0E_trampoline::
    push af                                       ;; 00:0978 $F5
    callsb func_020_6D0E                          ;; 00:0979 $3E $20 $EA $00 $21 $CD $0E $6D
    jr   RestoreStackedBankAndReturn              ;; 00:0981 $18 $F0

; Load palette data
; Inputs:
;   b   ???
;   de  ???
; Returns:
;   a   palette data
func_983::
    ; Retrieve and store palette data into hMultiPurpose9 and hMultiPurposeA
    callsb func_01A_6710                          ;; 00:0983 $3E $1A $EA $00 $21 $CD $10 $67

    ; Switch to the bank containing this room's palettes
    ldh  a, [hMultiPurpose8]                      ;; 00:098B $F0 $DF
    ld   [rSelectROMBank], a                      ;; 00:098D $EA $00 $21

    ; Read value from address [hMultiPurposeA hMultiPurpose9]
    ldh  a, [hMultiPurpose9]                      ;; 00:0990 $F0 $E0
    ld   h, a                                     ;; 00:0992 $67
    ldh  a, [hMultiPurposeA]                      ;; 00:0993 $F0 $E1
    ld   l, a                                     ;; 00:0995 $6F
    ld   a, [hl]                                  ;; 00:0996 $7E

    inc  de                                       ;; 00:0997 $13
    ret                                           ;; 00:0998 $C9

; Inputs:
;   a   ???
;   b   ???
;   de  ???
func_999::
    push af                                       ;; 00:0999 $F5
    push bc                                       ;; 00:099A $C5
    call func_983                                 ;; 00:099B $CD $83 $09

    ldh  [hMultiPurpose0], a                      ;; 00:099E $E0 $D7
    pop  bc                                       ;; 00:09A0 $C1
    call func_983                                 ;; 00:09A1 $CD $83 $09
    ldh  [hMultiPurpose1], a                      ;; 00:09A4 $E0 $D8
    ld   a, [wDrawCommandsVRAM1Size]              ;; 00:09A6 $FA $90 $DC
    ld   c, a                                     ;; 00:09A9 $4F
    ld   b, $00                                   ;; 00:09AA $06 $00
    add  a, $05                                   ;; 00:09AC $C6 $05
    ld   [wDrawCommandsVRAM1Size], a              ;; 00:09AE $EA $90 $DC
    ld   hl, wDrawCommandVRAM1                    ;; 00:09B1 $21 $91 $DC
    add  hl, bc                                   ;; 00:09B4 $09
    ldh  a, [hIntersectedObjectBGAddressHigh]     ;; 00:09B5 $F0 $CF
    ldi  [hl], a                                  ;; 00:09B7 $22
    ldh  a, [hIntersectedObjectBGAddressLow]      ;; 00:09B8 $F0 $D0
    ldi  [hl], a                                  ;; 00:09BA $22
    ld   a, $01                                   ;; 00:09BB $3E $01
    ldi  [hl], a                                  ;; 00:09BD $22
    ldh  a, [hMultiPurpose0]                      ;; 00:09BE $F0 $D7
    ldi  [hl], a                                  ;; 00:09C0 $22
    ldh  a, [hMultiPurpose1]                      ;; 00:09C1 $F0 $D8
    ldi  [hl], a                                  ;; 00:09C3 $22
    xor  a                                        ;; 00:09C4 $AF
    ldi  [hl], a                                  ;; 00:09C5 $22
    jr   RestoreStackedBankAndReturn              ;; 00:09C6 $18 $AB

IF !__OPTIMIZATIONS_1__
CheckPushedTombStone_trampoline::
    push af                                       ;; 00:09C8 $F5
    callsb CheckPushedTombStone                   ;; 00:09C9 $3E $20 $EA $00 $21 $CD $85 $49
    jr   RestoreStackedBankAndReturn              ;; 00:09D1 $18 $A0
ENDC

GetEntityInitHandler_trampoline::
    push af                                       ;; 00:09D3 $F5
    ; Will lookup something in an entity id table
    callsb GetEntityInitHandler                   ;; 00:09D4 $3E $20 $EA $00 $21 $CD $18 $45
    jr   RestoreStackedBankAndReturn              ;; 00:09DC $18 $95

func_020_4874_trampoline::
    push af                                       ;; 00:09DE $F5
    callsb func_020_4874                          ;; 00:09DF $3E $20 $EA $00 $21 $CD $74 $48
    jr   RestoreStackedBankAndReturn              ;; 00:09E7 $18 $8A

func_020_4954_trampoline::
    push af                                       ;; 00:09E9 $F5
    callsb func_020_4954                          ;; 00:09EA $3E $20 $EA $00 $21 $CD $54 $49
    jp   RestoreStackedBankAndReturn              ;; 00:09F2 $C3 $73 $09

ReplaceObjects56and57_trampoline::
    push af                                       ;; 00:09F5 $F5
    callsb ReplaceObjects56and57                  ;; 00:09F6 $3E $20 $EA $00 $21 $CD $2D $48
    jp   RestoreStackedBankAndReturn              ;; 00:09FE $C3 $73 $09

;
; Specific data-copying routines
;

; Copy $100 bytes without DMA (used on DMG), then switch back to bank at h.
;
; Inputs:
;  b   source address high byte
;  c   destination address high byte (starting from $8000)
;  h   bank to switch back after the transfer
CopyDataToVRAM_noDMA::
    ; Save h
    push hl                                       ;; 00:0A01 $E5

    ; Copy $100 bytes from "${b}00" to "$8000 + ${c}00"
    ld   l, $00                                   ;; 00:0A02 $2E $00
    ld   e, l                                     ;; 00:0A04 $5D
    ld   h, b                                     ;; 00:0A05 $60
    ld   a, c                                     ;; 00:0A06 $79
    add  a, $80                                   ;; 00:0A07 $C6 $80
    ld   d, a                                     ;; 00:0A09 $57
    ld   bc, $100                                 ;; 00:0A0A $01 $00 $01
    call CopyData                                 ;; 00:0A0D $CD $14 $29

    ; Switch back to the bank in h
    pop  hl                                       ;; 00:0A10 $E1
    jr   CopyDataToVRAM.restoreBankAndReturn      ;; 00:0A11 $18 $1A

; Copy $100 bytes to VRAM, then switch back to bank at h.
;
; Uses GDMA if available (and otherwise fallbacks to direct CPU copy).
;
; Inputs:
;  a   source bank
;  b   source address high byte
;  c   destination address high byte (starting from $8000)
;  h   bank to switch back after the transfer
CopyDataToVRAM::
    ; Switch to bank in a
    ld   [rSelectROMBank], a                      ;; 00:0A13 $EA $00 $21

    ; If running on DMG, use a loop to copy the data
    ldh  a, [hIsGBC]                              ;; 00:0A16 $F0 $FE
    and  a                                        ;; 00:0A18 $A7
    jr   z, CopyDataToVRAM_noDMA                  ;; 00:0A19 $28 $E6

    ; On CGB, configure a GDMA transfer
    ; to copy $0F bytes from "${b}00" to "$8000 + ${c}00"
    ld   a, b                                     ;; 00:0A1B $78
    ldh  [rHDMA1], a                              ;; 00:0A1C $E0 $51
    ld   a, $00                                   ;; 00:0A1E $3E $00
    ldh  [rHDMA2], a                              ;; 00:0A20 $E0 $52
    ld   a, c                                     ;; 00:0A22 $79
    ldh  [rHDMA3], a                              ;; 00:0A23 $E0 $53
    ld   a, $00                                   ;; 00:0A25 $3E $00
    ldh  [rHDMA4], a                              ;; 00:0A27 $E0 $54
    ld   a, $0F                                   ;; 00:0A29 $3E $0F
    ldh  [rHDMA5], a                              ;; 00:0A2B $E0 $55

    ; Fallthrough to switch back to the bank in h
.restoreBankAndReturn
    ld   a, h                                     ;; 00:0A2D $7C
    ld   [rSelectROMBank], a                      ;; 00:0A2E $EA $00 $21
    ret                                           ;; 00:0A31 $C9

; Copy Color Dungeon tiles?
CopyColorDungeonSymbols::
    push af                                       ;; 00:0A32 $F5
    ld   a, BANK(ColorDungeonNpcTiles)            ;; 00:0A33 $3E $35
    ld   [rSelectROMBank], a                      ;; 00:0A35 $EA $00 $21
    ld   hl, ColorDungeonNpcTiles + $F00          ;; 00:0A38 $21 $00 $4F
    ld   de, wAnimatedScrollingTilesStorage       ;; 00:0A3B $11 $C0 $DC
    ld   bc, $20                                  ;; 00:0A3E $01 $20 $00
    call CopyData                                 ;; 00:0A41 $CD $14 $29
    jp   RestoreStackedBankAndReturn              ;; 00:0A44 $C3 $73 $09

;
; Various trampolines
;

func_036_505F_trampoline::
    push af                                       ;; 00:0A47 $F5
    callsb func_036_505F                          ;; 00:0A48 $3E $36 $EA $00 $21 $CD $5F $50
    jp   RestoreStackedBankAndReturn              ;; 00:0A50 $C3 $73 $09

func_036_4F9B_trampoline::
    push af                                       ;; 00:0A53 $F5
    callsb func_036_4F9B                          ;; 00:0A54 $3E $36 $EA $00 $21 $CD $9B $4F
    jp   RestoreStackedBankAndReturn              ;; 00:0A5C $C3 $73 $09

func_A5F::
    push af                                       ;; 00:0A5F $F5
    ld   a, $20                                   ;; 00:0A60 $3E $20
    ld   [rSelectROMBank], a                      ;; 00:0A62 $EA $00 $21
    call RenderActiveEntitySpritesRect            ;; 00:0A65 $CD $E6 $3C
    jp   RestoreStackedBankAndReturn              ;; 00:0A68 $C3 $73 $09

func_003_5A2E_trampoline::
    push af                                       ;; 00:0A6B $F5
    callsb func_003_5A2E                          ;; 00:0A6C $3E $03 $EA $00 $21 $CD $2E $5A
    jp   RestoreStackedBankAndReturn              ;; 00:0A74 $C3 $73 $09

func_036_4F68_trampoline::
    push af                                       ;; 00:0A77 $F5
    callsb func_036_4F68                          ;; 00:0A78 $3E $36 $EA $00 $21 $CD $68 $4F
    jp   RestoreStackedBankAndReturn              ;; 00:0A80 $C3 $73 $09

func_020_6D52_trampoline::
    push af                                       ;; 00:0A83 $F5
    callsb func_020_6D52                          ;; 00:0A84 $3E $20 $EA $00 $21 $CD $52 $6D
    jp   RestoreStackedBankAndReturn              ;; 00:0A8C $C3 $73 $09

func_036_4BE8_trampoline::
    push af                                       ;; 00:0A8F $F5
    callsb func_036_4BE8                          ;; 00:0A90 $3E $36 $EA $00 $21 $CD $E8 $4B
    jp   RestoreStackedBankAndReturn              ;; 00:0A98 $C3 $73 $09

func_A9B::
    push af                                       ;; 00:0A9B $F5
    ld   a, BANK(FontTiles)                       ;; 00:0A9C $3E $0F
    call SwitchBank                               ;; 00:0A9E $CD $0C $08
    call ExecuteDialog                            ;; 00:0AA1 $CD $21 $23
    jp   RestoreStackedBankAndReturn              ;; 00:0AA4 $C3 $73 $09

Spawn2x2RubbleEntities_trampoline::
    push af                                       ;; 00:0AA7 $F5
    callsw Spawn2x2RubbleEntities                 ;; 00:0AA8 $3E $36 $CD $0C $08 $CD $5A $70

RestoreStackedBank::
    pop  af                                       ;; 00:0AB0 $F1
    call SwitchBank                               ;; 00:0AB1 $CD $0C $08
    ret                                           ;; 00:0AB4 $C9

ChangeBGColumnPaletteAndExecuteDrawCommands::
    push af                                       ;; 00:0AB5 $F5
    callsb ChangeBGColumnPalette                  ;; 00:0AB6 $3E $24 $EA $00 $21 $CD $1A $5C
    ld   de, wDrawCommand                         ;; 00:0ABE $11 $01 $D6
    call ExecuteDrawCommands                      ;; 00:0AC1 $CD $27 $29
    jr   RestoreStackedBank                       ;; 00:0AC4 $18 $EA

func_036_703E_trampoline::
    push af                                       ;; 00:0AC6 $F5
    callsb func_036_703E                          ;; 00:0AC7 $3E $36 $EA $00 $21 $CD $3E $70
    jp   RestoreStackedBankAndReturn              ;; 00:0ACF $C3 $73 $09

cycleInstrumentItemColor_trampoline::
    push af                                       ;; 00:0AD2 $F5
    callsb cycleInstrumentItemColor               ;; 00:0AD3 $3E $36 $EA $00 $21 $CD $D6 $70
    jp   RestoreStackedBankAndReturn              ;; 00:0ADB $C3 $73 $09

func_036_4A77_trampoline::
    push af                                       ;; 00:0ADE $F5
    callsw func_036_4A77                          ;; 00:0ADF $3E $36 $CD $0C $08 $CD $77 $4A
    jp   RestoreStackedBankAndReturn              ;; 00:0AE7 $C3 $73 $09

GetOwlStatueDialogId_trampoline::
    push af                                       ;; 00:0AEA $F5
    callsb GetOwlStatueDialogId                   ;; 00:0AEB $3E $36 $EA $00 $21 $CD $4C $4A
    jp   RestoreStackedBankAndReturn              ;; 00:0AF3 $C3 $73 $09

SpawnPhotographer_trampoline::
    push af                                       ;; 00:0AF6 $F5
    callsb SpawnPhotographer                      ;; 00:0AF7 $3E $36 $EA $00 $21 $CD $61 $71
    jp   RestoreStackedBankAndReturn              ;; 00:0AFF $C3 $73 $09

; Load Background map and attributes for photo
LoadPhotoBgMap_trampoline::
    callsb LoadPhotoBgMap                         ;; 00:0B02 $3E $3D $EA $00 $21 $CD $29 $40
    ret                                           ;; 00:0B0A $C9

IF __PATCH_3__
; Unused code?
func_036_72D5_trampoline::
    push af
    callsb func_036_72D5
    jp   RestoreStackedBankAndReturn
ENDC

; Toogle an extra byte to the bank number on GBC (on DMG, does nothing)
; Input:  a: the bank number to adjust
; Output: a: the adjusted bank number
AdjustBankNumberForGBC::
    push bc                                       ;; 00:0B0B $C5
    ld   b, a                                     ;; 00:0B0C $47
    ldh  a, [hIsGBC]                              ;; 00:0B0D $F0 $FE
    and  a           ; if !isGBC                  ;; 00:0B0F $A7
    jr   z, .notGBC  ;   handle standard GB       ;; 00:0B10 $28 $05
    ld   a, b        ; else                       ;; 00:0B12 $78
    or   $20         ;   set 6-th bit of `a` to 1 ;; 00:0B13 $F6 $20
    pop  bc          ;   restore registers        ;; 00:0B15 $C1
    ret              ;   return a                 ;; 00:0B16 $C9
.notGBC
    ld   a, b        ; return the original value of a ;; 00:0B17 $78
    pop  bc                                       ;; 00:0B18 $C1
    ret                                           ;; 00:0B19 $C9

; Copy a block of data from a given bank to a target address in WRAM2,
; then return to bank 20.
; Inputs:
;   hMultiPurpose0 : source bank
;   bc :        number of bytes to copy
;   de :        destination address
;   hl :        source address
CopyObjectsAttributesToWRAM2::
    ldh  a, [hMultiPurpose0]                      ;; 00:0B1A $F0 $D7
    ld   [rSelectROMBank], a                      ;; 00:0B1C $EA $00 $21
    ld   a, $02                                   ;; 00:0B1F $3E $02
    ldh  [rSVBK], a                               ;; 00:0B21 $E0 $70
    call CopyData                                 ;; 00:0B23 $CD $14 $29
    xor  a                                        ;; 00:0B26 $AF
    ldh  [rSVBK], a                               ;; 00:0B27 $E0 $70
    ; Restore bank $20
    ld   a, $20                                   ;; 00:0B29 $3E $20
    ld   [rSelectROMBank], a                      ;; 00:0B2B $EA $00 $21
    ret                                           ;; 00:0B2E $C9

; On GBC, copy the overworld object at [hl] to ram bank 2.
;
; This is used when the inventory menu is exited to restore the background objects
; as they were modified (i.e. cut grass, holes dug with the shovel, etc.)
;
;
; Inputs:
;   a  bit7: If not set, check if the object at address hl is in a specific ignore list.
;      bit0-6: Bank number to return to after this function is finished.
;   hl source in RAM bank 0 and destination in RAM bank 2
BackupObjectInRAM2::
    ldh  [hMultiPurpose2], a                      ;; 00:0B2F $E0 $D9
    ldh  a, [hIsGBC]                              ;; 00:0B31 $F0 $FE
    and  a                                        ;; 00:0B33 $A7
    ret  z                                        ;; 00:0B34 $C8

    ld   a, [wIsIndoor]                           ;; 00:0B35 $FA $A5 $DB
    and  a                                        ;; 00:0B38 $A7
    ret  nz                                       ;; 00:0B39 $C0

    push bc                                       ;; 00:0B3A $C5
    ldh  a, [hMultiPurpose2]                      ;; 00:0B3B $F0 $D9
    and  $80                                      ;; 00:0B3D $E6 $80
    jr   nz, .else                                ;; 00:0B3F $20 $0A
    callsb CheckOverworldObjectIgnoreList         ;; 00:0B41 $3E $20 $EA $00 $21 $CD $50 $6E
    jr   c, .endIf                                ;; 00:0B49 $38 $09
.else
    ld   b, [hl]                                  ;; 00:0B4B $46
    ld   a, $02                                   ;; 00:0B4C $3E $02
    ldh  [rSVBK], a                               ;; 00:0B4E $E0 $70
    ld   [hl], b                                  ;; 00:0B50 $70
    xor  a                                        ;; 00:0B51 $AF
    ldh  [rSVBK], a                               ;; 00:0B52 $E0 $70
.endIf

    ldh  a, [hMultiPurpose2]                      ;; 00:0B54 $F0 $D9
    and  $7F                                      ;; 00:0B56 $E6 $7F
    ld   [rSelectROMBank], a                      ;; 00:0B58 $EA $00 $21
    pop  bc                                       ;; 00:0B5B $C1
    ret                                           ;; 00:0B5C $C9

; Copy data from bank in a, then switch back to bank $28
CopyData_trampoline::
    ld   [rSelectROMBank], a                      ;; 00:0B5D $EA $00 $21
    call CopyData                                 ;; 00:0B60 $CD $14 $29
    ld   a, $28                                   ;; 00:0B63 $3E $28
    ld   [rSelectROMBank], a                      ;; 00:0B65 $EA $00 $21
    ret                                           ;; 00:0B68 $C9

; Copy data to vBGMap0
; Inputs:
;   a           source bank
;   hl          source address
;   hhMultiPurposeF  return bank to restore
CopyBGMapFromBank::
    push hl                                       ;; 00:0B69 $E5
    ld   [rSelectROMBank], a                      ;; 00:0B6A $EA $00 $21

    ; If on GBC…
    ldh  a, [hIsGBC]                              ;; 00:0B6D $F0 $FE
    and  a                                        ;; 00:0B6F $A7
    jr   z, .gbcEnd                               ;; 00:0B70 $28 $0E
    ; hl += $168
    ld   de, $168                                 ;; 00:0B72 $11 $68 $01
    add  hl, de                                   ;; 00:0B75 $19
    ; Switch to VRAM bank 1
    ld   a, $01                                   ;; 00:0B76 $3E $01
    ldh  [rVBK], a                                ;; 00:0B78 $E0 $4F
    call CopyToBGMap0                             ;; 00:0B7A $CD $96 $0B
    ; Switch back to VRAM bank 0
    xor  a                                        ;; 00:0B7D $AF
    ldh  [rVBK], a                                ;; 00:0B7E $E0 $4F
.gbcEnd

    pop  hl                                       ;; 00:0B80 $E1
    push hl                                       ;; 00:0B81 $E5
    call CopyToBGMap0                             ;; 00:0B82 $CD $96 $0B
    pop  hl                                       ;; 00:0B85 $E1

    ld   a, [wGameplayType]                       ;; 00:0B86 $FA $95 $DB
    cp   GAMEPLAY_PHOTO_ALBUM                     ;; 00:0B89 $FE $0D
    jr   nz, .photoAlbumEnd                       ;; 00:0B8B $20 $03
    call func_BB5                                 ;; 00:0B8D $CD $B5 $0B
.photoAlbumEnd

    ldh  a, [hMultiPurposeF]                      ;; 00:0B90 $F0 $E6
    ld   [rSelectROMBank], a                      ;; 00:0B92 $EA $00 $21
    ret                                           ;; 00:0B95 $C9

CopyToBGMap0::
    ld   de, vBGMap0                              ;; 00:0B96 $11 $00 $98

.loop
    ld   a, [hli]                                 ;; 00:0B99 $2A
    ld   [de], a                                  ;; 00:0B9A $12
    inc  e                                        ;; 00:0B9B $1C
    ld   a, e                                     ;; 00:0B9C $7B
    and  $1F                                      ;; 00:0B9D $E6 $1F
    cp   $14                                      ;; 00:0B9F $FE $14
    jr   nz, .loop                                ;; 00:0BA1 $20 $F6
    ld   a, e                                     ;; 00:0BA3 $7B
    add  a, $0C                                   ;; 00:0BA4 $C6 $0C
    ld   e, a                                     ;; 00:0BA6 $5F
    ld   a, d                                     ;; 00:0BA7 $7A
    adc  a, $00                                   ;; 00:0BA8 $CE $00
    ld   d, a                                     ;; 00:0BAA $57
    cp   $9A                                      ;; 00:0BAB $FE $9A
    jr   nz, .loop                                ;; 00:0BAD $20 $EA
    ld   a, e                                     ;; 00:0BAF $7B
    cp   $40                                      ;; 00:0BB0 $FE $40
    jr   nz, .loop                                ;; 00:0BB2 $20 $E5
    ret                                           ;; 00:0BB4 $C9

func_BB5::
    ld   bc, $168                                 ;; 00:0BB5 $01 $68 $01
    ld   de, wIsFileSelectionArrowShifted         ;; 00:0BB8 $11 $00 $D0
    jp   CopyData                                 ;; 00:0BBB $C3 $14 $29

LoadBaseTiles_trampoline::
    push af                                       ;; 00:0BBE $F5
    call LoadBaseTiles                            ;; 00:0BBF $CD $CF $2B
    jp   RestoreStackedBankAndReturn              ;; 00:0BC2 $C3 $73 $09

func_BC5::
    ld   a, [w2_D16A]                             ;; 00:0BC5 $FA $6A $D1
    ld   [rSelectROMBank], a                      ;; 00:0BC8 $EA $00 $21
.loop
    ld   a, [hli]                                 ;; 00:0BCB $2A
    ld   [de], a                                  ;; 00:0BCC $12
    inc  de                                       ;; 00:0BCD $13
    dec  b                                        ;; 00:0BCE $05
    jr   nz, .loop                                ;; 00:0BCF $20 $FA

    ld   a, $28                                   ;; 00:0BD1 $3E $28
    ld   [rSelectROMBank], a                      ;; 00:0BD3 $EA $00 $21
    ret                                           ;; 00:0BD6 $C9

; Generic trampoline, for calling a function into another bank.
Farcall::
    ; Switch to bank wFarcallBank
    ld   a, [wFarcallBank]                        ;; 00:0BD7 $FA $01 $DE
    ld   [rSelectROMBank], a                      ;; 00:0BDA $EA $00 $21
    ; Call the target function
    call Farcall_trampoline                       ;; 00:0BDD $CD $E7 $0B
    ; Switch back to bank wFarcallReturnBank
    ld   a, [wFarcallReturnBank]                  ;; 00:0BE0 $FA $04 $DE
    ld   [rSelectROMBank], a                      ;; 00:0BE3 $EA $00 $21
    ret                                           ;; 00:0BE6 $C9

; Jump to address in wFarcallAdressHigh, wFarcallAdressLow
Farcall_trampoline::
    ld   a, [wFarcallAdressHigh]                  ;; 00:0BE7 $FA $02 $DE
    ld   h, a                                     ;; 00:0BEA $67
    ld   a, [wFarcallAdressLow]                   ;; 00:0BEB $FA $03 $DE
    ld   l, a                                     ;; 00:0BEE $6F
    jp   hl                                       ;; 00:0BEF $E9

UpdateLinkWalkingAnimation_trampoline::
    ld   a, BANK(LinkAnimationsLists)             ;; 00:0BF0 $3E $02
    ld   [rSelectROMBank], a                      ;; 00:0BF2 $EA $00 $21
    call UpdateLinkWalkingAnimation               ;; 00:0BF5 $CD $50 $1A
    jp   ReloadSavedBank                          ;; 00:0BF8 $C3 $1D $08

; Retrieve the slow transition countdown for the given entity.
; Input:
;   bc   entity index
; Output:
;   hl   address of the slow transition countdown for this entity
;   a    value of the slow transition countdown for this entity
;   z    whether the slow transition countdown is zero
GetEntitySlowTransitionCountdown::
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 00:0BFB $21 $50 $C4
    jr   IsZero                                   ;; 00:0BFE $18 $08

; Retrieve the private counter 1 for the given entity.
; Input:
;   bc   entity index
; Output:
;   hl   address of the private counter for this entity
;   a    value of the private counter for this entity
;   z    whether the private counter is zero
GetEntityPrivateCountdown1::
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 00:0C00 $21 $F0 $C2
    jr   IsZero                                   ;; 00:0C03 $18 $03

; Retrieve the transition counter for the given entity.
; Input:
;   bc   entity index
; Output:
;   hl   address of the transition counter for this entity
;   a    value of the transition counter for this entity
;   z    whether the transition counter is zero
GetEntityTransitionCountdown::
    ld   hl, wEntitiesTransitionCountdownTable    ;; 00:0C05 $21 $E0 $C2

; Test if the value at given address is equal to zero
; Inputs:
;  - hl: an address
;  - bc: an offset
; Output:
;  - a: the value read
;  - z: whether the value equal to zero
IsZero::
    add  hl, bc                                   ;; 00:0C08 $09
    ld   a, [hl]                                  ;; 00:0C09 $7E
    and  a                                        ;; 00:0C0A $A7
    ret                                           ;; 00:0C0B $C9

; Create a new temporary entity with the current trading item.
; Used when Link trades a new item.
CreateTradingItemEntity::
    ld   a, ENTITY_TRADING_ITEM                   ;; 00:0C0C $3E $AF
    call SpawnNewEntity_trampoline                ;; 00:0C0E $CD $86 $3B
    ldh  a, [hLinkPositionX]                      ;; 00:0C11 $F0 $98
    ld   hl, wEntitiesPosXTable                   ;; 00:0C13 $21 $00 $C2
    add  hl, de                                   ;; 00:0C16 $19
    ld   [hl], a                                  ;; 00:0C17 $77
    ldh  a, [hLinkPositionY]                      ;; 00:0C18 $F0 $99
    ld   hl, wEntitiesPosYTable                   ;; 00:0C1A $21 $10 $C2
    add  hl, de                                   ;; 00:0C1D $19
    ld   [hl], a                                  ;; 00:0C1E $77
    ret                                           ;; 00:0C1F $C9

PlayWrongAnswerJingle::
    ld   a, JINGLE_WRONG_ANSWER                   ;; 00:0C20 $3E $1D
    ldh  [hJingle], a                             ;; 00:0C22 $E0 $F2
    ret                                           ;; 00:0C24 $C9

ReadTileValueFromAsciiTable::
    ld   hl, CodepointToTileMap                   ;; 00:0C25 $21 $41 $46
    jr   ReadValueInDialogsBank                   ;; 00:0C28 $18 $03

ReadTileValueFromDiacriticsTable::
    ld   hl, CodepointToDiacritic                 ;; 00:0C2A $21 $41 $47

ReadValueInDialogsBank::
    ld   a, BANK(CodepointToTileMap) ; or BANK(DialogBankTable) ;; 00:0C2D $3E $1C
    ld   [rSelectROMBank], a                      ;; 00:0C2F $EA $00 $21
    add  hl, bc                                   ;; 00:0C32 $09
    ld   a, [hl]                                  ;; 00:0C33 $7E
    ld   hl, rSelectROMBank                       ;; 00:0C34 $21 $00 $21
    ld   [hl], $01                                ;; 00:0C37 $36 $01
    ret                                           ;; 00:0C39 $C9

; Copy 4 tiles from bank $0C, then return to bank 1.
; Inputs:
;   hl:  target address of the instrument tiles
CopySirenInstrumentTiles::
    ld   a, BANK(SirenInstrumentsTiles)           ;; 00:0C3A $3E $0C
    ld   [rSelectROMBank], a                      ;; 00:0C3C $EA $00 $21
    ld   bc, $40                                  ;; 00:0C3F $01 $40 $00
    call CopyData                                 ;; 00:0C42 $CD $14 $29
    ld   a, $01                                   ;; 00:0C45 $3E $01
    ld   [rSelectROMBank], a                      ;; 00:0C47 $EA $00 $21
    ret                                           ;; 00:0C4A $C9

PlayBombExplosionSfx::
    ld   hl, hNoiseSfx                            ;; 00:0C4B $21 $F4 $FF
    ld   [hl], NOISE_SFX_EXPLOSION                ;; 00:0C4E $36 $0C

func_C50::
    ld   hl, wC502                                ;; 00:0C50 $21 $02 $C5
    ld   [hl], $04                                ;; 00:0C53 $36 $04
    ret                                           ;; 00:0C55 $C9

; Decrement the wEntitiesIgnoreHitsCountdownTable value for the given entity.
;
; Inputs:
;   bc   entity index
DecrementEntityIgnoreHitsCountdown::
    ld   hl, wEntitiesIgnoreHitsCountdownTable    ;; 00:0C56 $21 $10 $C4
    add  hl, bc                                   ;; 00:0C59 $09
    ld   a, [hl]                                  ;; 00:0C5A $7E
    and  a                                        ;; 00:0C5B $A7
    jr   z, .endIf                                ;; 00:0C5C $28 $01
    dec  [hl]                                     ;; 00:0C5E $35
.endIf
    ret                                           ;; 00:0C5F $C9

MarkTriggerAsResolved::
    push af                                       ;; 00:0C60 $F5

    ; If the event effect was already executed, return.
    ld   a, [wRoomEventEffectExecuted]            ;; 00:0C61 $FA $8F $C1
    and  a                                        ;; 00:0C64 $A7
    jr   nz, .return                              ;; 00:0C65 $20 $14

    ; wC1CF = 0
    ld   [wC1CF], a                               ;; 00:0C67 $EA $CF $C1
    ; wRoomEventEffectExecuted = wC5A6 = 1
    inc  a                                        ;; 00:0C6A $3C
    ld   [wRoomEventEffectExecuted], a            ;; 00:0C6B $EA $8F $C1
    ld   [wC5A6], a                               ;; 00:0C6E $EA $A6 $C5

    ; If wC19D == 0…
    ld   a, [wC19D]                               ;; 00:0C71 $FA $9D $C1
    and  a                                        ;; 00:0C74 $A7
    jr   nz, .return                              ;; 00:0C75 $20 $04
    ; play puzzle solved jingle
    ld   a, JINGLE_PUZZLE_SOLVED                  ;; 00:0C77 $3E $02
    ldh  [hJingle], a                             ;; 00:0C79 $E0 $F2
.return
    pop  af                                       ;; 00:0C7B $F1
    ret                                           ;; 00:0C7C $C9

ApplyMapFadeOutTransitionWithNoise::
    ld   a, $30                                   ;; 00:0C7D $3E $30
    ; Timer that counts down and ends when the track has completely faded out. *Might* be used for the visual effect when entering a house as well.
    ldh  [hMusicFadeOutTimer], a                  ;; 00:0C7F $E0 $A8
    jr   playNoiseStairs                          ;; 00:0C81 $18 $17

ApplyMapFadeOutTransition::
    ld   a, $30                                   ;; 00:0C83 $3E $30
    ldh  [hMusicFadeOutTimer], a                  ;; 00:0C85 $E0 $A8
    jr   disableMovementInTransition              ;; 00:0C87 $18 $15

ApplyMapFadeOutTransitionWithSound::
    ; check if wWarp0MapCategory is 1
    ld   a, [wWarp0MapCategory]                   ;; 00:0C89 $FA $01 $D4
    cp   $01                                      ;; 00:0C8C $FE $01
    jr   nz, ApplyMapFadeOutTransitionWithNoise   ;; 00:0C8E $20 $ED
    ; check if outdoors
    ld   a, [wIsIndoor]                           ;; 00:0C90 $FA $A5 $DB
    and  a                                        ;; 00:0C93 $A7
    jr   z, ApplyMapFadeOutTransitionWithNoise    ;; 00:0C94 $28 $E7
    ; Link is indoors
    ld   a, $01                                   ;; 00:0C96 $3E $01
    ldh  [hContinueMusicAfterWarp], a             ;; 00:0C98 $E0 $BC

playNoiseStairs::
    ld   a, NOISE_SFX_STAIRS                      ;; 00:0C9A $3E $06
    ldh  [hNoiseSfx], a                           ;; 00:0C9C $E0 $F4

disableMovementInTransition::
    ; Prevent Link from moving during the transition
    ld   a, LINK_MOTION_MAP_FADE_OUT              ;; 00:0C9E $3E $03
    ld   [wLinkMotionState], a                    ;; 00:0CA0 $EA $1C $C1

    ; Reset the transition variables
    xor  a                                        ;; 00:0CA3 $AF
    ld   [wTransitionSequenceCounter], a          ;; 00:0CA4 $EA $6B $C1
    ld   [wC16C], a                               ;; 00:0CA7 $EA $6C $C1
    ld   [wD478], a                               ;; 00:0CAA $EA $78 $D4
    and  a                                        ;; 00:0CAD $A7
    ret                                           ;; 00:0CAE $C9

ResetSpinAttack::
    xor  a                                        ;; 00:0CAF $AF
    ld   [wIsUsingSpinAttack], a                  ;; 00:0CB0 $EA $21 $C1
    ld   [wSwordCharge], a                        ;; 00:0CB3 $EA $22 $C1

ResetPegasusBoots::
    xor  a                                        ;; 00:0CB6 $AF
    ld   [wPegasusBootsChargeMeter], a            ;; 00:0CB7 $EA $4B $C1
    ld   [wIsRunningWithPegasusBoots], a          ;; 00:0CBA $EA $4A $C1
    ret                                           ;; 00:0CBD $C9

CopyLinkFinalPositionToPosition::
    ldh  a, [hLinkFinalPositionX]                 ;; 00:0CBE $F0 $9F
    ldh  [hLinkPositionX], a                      ;; 00:0CC0 $E0 $98
    ldh  a, [hLinkFinalPositionY]                 ;; 00:0CC2 $F0 $A0
    ldh  [hLinkPositionY], a                      ;; 00:0CC4 $E0 $99
    ret                                           ;; 00:0CC6 $C9

; Display a temporary visual effect as a non-interacting sprite.
; The effect is automatically removed after a while.
;
; Inputs:
;   a           visual effect type
;   hMultiPurpose0   effect X position
;   hMultiPurpose1   effect Y position
AddTranscientVfx::
    push af                                       ;; 00:0CC7 $F5
    ld   e, $0F                                   ;; 00:0CC8 $1E $0F
    ld   d, $00                                   ;; 00:0CCA $16 $00

    ; Find index of the last zero in the transcient VFXs table
.loop
    ld   hl, wTranscientVfxTypeTable              ;; 00:0CCC $21 $10 $C5
    add  hl, de                                   ;; 00:0CCF $19
    ld   a, [hl]                                  ;; 00:0CD0 $7E
    and  a                                        ;; 00:0CD1 $A7
    jr   z, .jp_CEC                               ;; 00:0CD2 $28 $18
    dec  e                                        ;; 00:0CD4 $1D
    ld   a, e                                     ;; 00:0CD5 $7B
    cp   -1                                       ;; 00:0CD6 $FE $FF
    jr   nz, .loop                                ;; 00:0CD8 $20 $F2

    ; If a zero value is not found, decrement wC5C0
    ld   hl, wC5C0                                ;; 00:0CDA $21 $C0 $C5
    dec  [hl]                                     ;; 00:0CDD $35
    ; (wrap wC5C0 to $0F if it reached 0)
    ld   a, [hl]                                  ;; 00:0CDE $7E
    cp   -1                                       ;; 00:0CDF $FE $FF
    jr   nz, .wrapEnd                             ;; 00:0CE1 $20 $05
    ld   a, $0F                                   ;; 00:0CE3 $3E $0F
    ld   [wC5C0], a                               ;; 00:0CE5 $EA $C0 $C5
.wrapEnd

    ; e = wC5C0
    ld   a, [wC5C0]                               ;; 00:0CE8 $FA $C0 $C5
    ld   e, a                                     ;; 00:0CEB $5F

.jp_CEC
    pop  af                                       ;; 00:0CEC $F1
    ld   hl, wTranscientVfxTypeTable              ;; 00:0CED $21 $10 $C5
    add  hl, de                                   ;; 00:0CF0 $19
    ld   [hl], a                                  ;; 00:0CF1 $77
    ldh  a, [hMultiPurpose1]                      ;; 00:0CF2 $F0 $D8
    ld   hl, wTranscientVfxPosYTable              ;; 00:0CF4 $21 $40 $C5
    add  hl, de                                   ;; 00:0CF7 $19
    ld   [hl], a                                  ;; 00:0CF8 $77
    ldh  a, [hMultiPurpose0]                      ;; 00:0CF9 $F0 $D7
    ld   hl, wTranscientVfxPosXTable              ;; 00:0CFB $21 $30 $C5
    add  hl, de                                   ;; 00:0CFE $19
    ld   [hl], a                                  ;; 00:0CFF $77
    ld   hl, wTranscientVfxCountdownTable         ;; 00:0D00 $21 $20 $C5
    add  hl, de                                   ;; 00:0D03 $19
    ld   [hl], $0F                                ;; 00:0D04 $36 $0F
    ret                                           ;; 00:0D06 $C9

label_D07::
    ld   a, [wC140]                               ;; 00:0D07 $FA $40 $C1
    sub  a, $08                                   ;; 00:0D0A $D6 $08
    ldh  [hMultiPurpose0], a                      ;; 00:0D0C $E0 $D7
    ld   a, [wC142]                               ;; 00:0D0E $FA $42 $C1
    sub  a, $08                                   ;; 00:0D11 $D6 $08
    ldh  [hMultiPurpose1], a                      ;; 00:0D13 $E0 $D8

label_D15::
    ld   a, JINGLE_SWORD_POKING                   ;; 00:0D15 $3E $07
    ldh  [hJingle], a                             ;; 00:0D17 $E0 $F2
    ld   a, TRANSCIENT_VFX_SWORD_POKE             ;; 00:0D19 $3E $05
    jp   AddTranscientVfx                         ;; 00:0D1B $C3 $C7 $0C

; Schedule the loading of object and OAM tilesets for the next room,
; (either during a map transition or a room transition).
;
; Actual loading will be done during the next vblank period.
SelectRoomTilesets::
    ld   a, BANK(TilesetTables)                   ;; 00:0D1E $3E $20
    ld   [rSelectROMBank], a                      ;; 00:0D20 $EA $00 $21

    ; ------------------------------------------------------------
    ;
    ; Select the new BG objects tileset
    ;
    ; ------------------------------------------------------------

    ld   a, [wIsIndoor]                           ;; 00:0D23 $FA $A5 $DB
    and  a                                        ;; 00:0D26 $A7
    jr   z, .overworld                            ;; 00:0D27 $28 $30

    ;
    ; Indoor BG tileset
    ;

    ; de = [hMapRoom]
    ldh  a, [hMapRoom]                            ;; 00:0D29 $F0 $F6
    ld   e, a                                     ;; 00:0D2B $5F
    ld   d, $00                                   ;; 00:0D2C $16 $00
    ld   hl, IndoorsTilesetsTable                 ;; 00:0D2E $21 $B3 $6E

    ; Use a special table for the Color Dungeon
    ldh  a, [hMapId]                              ;; 00:0D31 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:0D33 $FE $FF
    jr   nz, .colorDungeonEnd                     ;; 00:0D35 $20 $05
    ld   hl, ColorDungeonTilesetsTable            ;; 00:0D37 $21 $B3 $70
    jr   .readTilesetFromTable                    ;; 00:0D3A $18 $09
.colorDungeonEnd

    ; If the map uses rooms in the indoors_b rooms group, add $100 to the table address
    cp   MAP_INDOORS_B_END                        ;; 00:0D3C $FE $1A
    jr   nc, .readTilesetFromTable                ;; 00:0D3E $30 $05
    cp   MAP_INDOORS_B_START                      ;; 00:0D40 $FE $06
    jr   c, .readTilesetFromTable                 ;; 00:0D42 $38 $01
    inc  h                                        ;; 00:0D44 $24

.readTilesetFromTable
    add  hl, de                                   ;; 00:0D45 $19

    ; a = Table[hMapRoom]
    ; e = previous tileset
    ldh  a, [hWorldTileset]                       ;; 00:0D46 $F0 $94
    ld   e, a                                     ;; 00:0D48 $5F
    ld   a, [hl]                                  ;; 00:0D49 $7E

    ; If the tileset didn't change, nothing to do.
    cp   e                                        ;; 00:0D4A $BB
    jr   z, .indoorTilesetEnd                     ;; 00:0D4B $28 $0A

    ; Apply the new tileset
    ldh  [hWorldTileset], a                       ;; 00:0D4D $E0 $94

    ; Schedule the tiles loading operation for the next vblank
    ; (except if the tileset is W_TILESET_NO_UPDATE)
    cp   W_TILESET_NO_UPDATE                      ;; 00:0D4F $FE $FF
    jr   z, .indoorTilesetEnd                     ;; 00:0D51 $28 $04
    ld   a, TILESET_LOAD_WORLD                    ;; 00:0D53 $3E $01
    ldh  [hNeedsUpdatingBGTiles], a               ;; 00:0D55 $E0 $90

.indoorTilesetEnd
    jr   .tilesetEnd                              ;; 00:0D57 $18 $38

.overworld
    ;
    ; Overworld BG tileset
    ;

    ldh  a, [hMapRoom]                            ;; 00:0D59 $F0 $F6
    ; hack: for overworld room $07 (right of the Egg), use tilset of the taramanch center
    cp   ROOM_OW_RIGHT_OF_EGG                     ;; 00:0D5B $FE $07
    jr   nz, .eggHackEnd                          ;; 00:0D5D $20 $01
    inc  a                                        ;; 00:0D5F $3C
.eggHackEnd

    ; de = hMapRoom / 4
    ld   d, a                                     ;; 00:0D60 $57
    srl  a                                        ;; 00:0D61 $CB $3F
    srl  a                                        ;; 00:0D63 $CB $3F
    and  $F8                                      ;; 00:0D65 $E6 $F8
    ld   e, a                                     ;; 00:0D67 $5F
    ld   a, d                                     ;; 00:0D68 $7A
    srl  a                                        ;; 00:0D69 $CB $3F
    and  $07                                      ;; 00:0D6B $E6 $07
    or   e                                        ;; 00:0D6D $B3
    ld   e, a                                     ;; 00:0D6E $5F
    ld   d, $00                                   ;; 00:0D6F $16 $00

    ; a = OverworldTilesetsTable[hMapRoom / 4]
    ; e = previous tileset
    ld   hl, OverworldTilesetsTable               ;; 00:0D71 $21 $73 $6E
    add  hl, de                                   ;; 00:0D74 $19
    ldh  a, [hWorldTileset]                       ;; 00:0D75 $F0 $94
    ld   e, a                                     ;; 00:0D77 $5F
    ld   a, [hl]                                  ;; 00:0D78 $7E

    ; If the tileset didn't change, nothing to do.
    cp   e                                        ;; 00:0D79 $BB
    jr   z, .tilesetEnd                           ;; 00:0D7A $28 $15
    ; If the tileset is TILESET_KEEP, nothing to do.
    cp   W_TILESET_KEEP                           ;; 00:0D7C $FE $0F
    jr   z, .tilesetEnd                           ;; 00:0D7E $28 $11

    ; If on prairie north, but not on the Camera Shoop room,
    ; treat the tileset as TILESET_KEEP: nothing to do.
    cp   W_TILESET_CAMERA_SHOP                    ;; 00:0D80 $FE $1A
    jr   nz, .cameraShopEnd                       ;; 00:0D82 $20 $07
    ldh  a, [hMapRoom]                            ;; 00:0D84 $F0 $F6
    cp   ROOM_OW_CAMERA_SHOP                      ;; 00:0D86 $FE $37
    jr   nz, .tilesetEnd                          ;; 00:0D88 $20 $07
    ld   a, [hl]                                  ;; 00:0D8A $7E
.cameraShopEnd

    ldh  [hWorldTileset], a                       ;; 00:0D8B $E0 $94
    ; Schedule the tiles loading operation for the next vblank
    ld   a, TILESET_LOAD_WORLD                    ;; 00:0D8D $3E $01
    ldh  [hNeedsUpdatingBGTiles], a               ;; 00:0D8F $E0 $90
.tilesetEnd

    ; ------------------------------------------------------------
    ;
    ; Select the new OAM tileset
    ;
    ; First lookup the spritesheet group index for the room.
    ; Then this group index references a 4-bytes value, where each
    ; byte is a spritesheet.
    ; ------------------------------------------------------------

    ; [hMultiPurpose0] = 0
    xor  a                                        ;; 00:0D91 $AF
    ldh  [hMultiPurpose0], a                      ;; 00:0D92 $E0 $D7
    ; de = [hMapRoom]
    ldh  a, [hMapRoom]                            ;; 00:0D94 $F0 $F6
    ld   e, a                                     ;; 00:0D96 $5F
    ld   d, $00                                   ;; 00:0D97 $16 $00
    ; Data starts at RoomSpritesheetGroupsTable
    ld   hl, RoomSpritesheetGroupsTable           ;; 00:0D99 $21 $D3 $70
    ; If indoors, add $100 to de
    ld   a, [wIsIndoor]                           ;; 00:0D9C $FA $A5 $DB
    ld   d, a                                     ;; 00:0D9F $57
    ; If the map uses rooms in the indoors_b rooms group, add $100 to de again
    ldh  a, [hMapId]                              ;; 00:0DA0 $F0 $F7
    cp   MAP_INDOORS_B_END                        ;; 00:0DA2 $FE $1A
    jr   nc, .indoorsBEnd                         ;; 00:0DA4 $30 $05
    cp   MAP_INDOORS_B_START                      ;; 00:0DA6 $FE $06
    jr   c, .indoorsBEnd                          ;; 00:0DA8 $38 $01
    inc  d                                        ;; 00:0DAA $14
.indoorsBEnd

    ; Read the spritesheet group for the room.
    ; e = RoomSpritesheetGroupsTable[de + roomId]
    add  hl, de                                   ;; 00:0DAB $19
    ld   e, [hl]                                  ;; 00:0DAC $5E

    ; Special cases for the spritesheet group

    ; If not the overworld…
    ld   a, d                                     ;; 00:0DAD $7A
    and  a                                        ;; 00:0DAE $A7
    jr   z, .oamTilesetOnOverworld                ;; 00:0DAF $28 $10
    ; …and inside the camera shop…
    ldh  a, [hMapId]                              ;; 00:0DB1 $F0 $F7
    cp   MAP_HOUSE                                ;; 00:0DB3 $FE $10
    jr   nz, .spritesheetGroupDone                ;; 00:0DB5 $20 $24
    ldh  a, [hMapRoom]                            ;; 00:0DB7 $F0 $F6
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ;; 00:0DB9 $FE $B5
    jr   nz, .spritesheetGroupDone                ;; 00:0DBB $20 $1E
    ; e = 0x3D
    ld   e, $3D                                   ;; 00:0DBD $1E $3D
    jr   .spritesheetGroupDone                    ;; 00:0DBF $18 $1A

.oamTilesetOnOverworld
    ld   a, e                                     ;; 00:0DC1 $7B
    cp   $23                                      ;; 00:0DC2 $FE $23
    jr   nz, .sirenRoomEnd                        ;; 00:0DC4 $20 $08
    ld   a, [wOverworldRoomStatus + ROOM_OW_SIREN] ;; 00:0DC6 $FA $C9 $D8
    and  OW_ROOM_STATUS_OWL_TALKED                ;; 00:0DC9 $E6 $20
    jr   z, .sirenRoomEnd                         ;; 00:0DCB $28 $01
    inc  e                                        ;; 00:0DCD $1C
.sirenRoomEnd

    ld   a, e                                     ;; 00:0DCE $7B
    cp   $21                                      ;; 00:0DCF $FE $21
    jr   nz, .spritesheetGroupDone                ;; 00:0DD1 $20 $08
    ld   a, [wOverworldRoomStatus + ROOM_OW_WALRUS] ;; 00:0DD3 $FA $FD $D8
    and  $20                                      ;; 00:0DD6 $E6 $20
    jr   z, .spritesheetGroupDone                 ;; 00:0DD8 $28 $01
    inc  e                                        ;; 00:0DDA $1C

.spritesheetGroupDone

    ; Compute the starting address of the 4 spritesheets ids

    ; de = e * 4
    ld   d, $00                                   ;; 00:0DDB $16 $00
    sla  e                                        ;; 00:0DDD $CB $23
    rl   d                                        ;; 00:0DDF $CB $12
    sla  e                                        ;; 00:0DE1 $CB $23
    rl   d                                        ;; 00:0DE3 $CB $12

    ; On the Color Dungeon, spritesheets are loaded in a different way. Exit now.
    ldh  a, [hMapId]                              ;; 00:0DE5 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:0DE7 $FE $FF
    jr   nz, .useStandardSpritesheetsTables       ;; 00:0DE9 $20 $06
    ld   a, TRUE                                  ;; 00:0DEB $3E $01
    ldh  [hNeedsUpdatingEntityTilesA], a          ;; 00:0DED $E0 $91
    jr   .return                                  ;; 00:0DEF $18 $40
.useStandardSpritesheetsTables
    ; Select which spritesheets table to use (overworld or indoors)
    ld   hl, OverworldEntitySpritesheetsTable     ;; 00:0DF1 $21 $F3 $73
    ld   a, [wIsIndoor]                           ;; 00:0DF4 $FA $A5 $DB
    and  a                                        ;; 00:0DF7 $A7
    jr   z, .spritesheetsTableEnd                 ;; 00:0DF8 $28 $03
    ld   hl, IndoorEntitySpritesheetsTable        ;; 00:0DFA $21 $3B $76
.spritesheetsTableEnd

    ; Make hl point at the first of the 4-bytes spritesheets
    ; hl = spritesheets-table[spritesheet-group]
    add  hl, de                                   ;; 00:0DFD $19

    ; ------------------------------------------------------------
    ;
    ; Schedule spritesheets copy
    ;
    ; ------------------------------------------------------------

    ;
    ; This loop iterates on the 4 spritesheet values for this room, and
    ; schedule the loading for at most two of them.
    ;
    ; It looks for the currently loaded spritesheets, and request the ones
    ; that are not loaded yet. (If more than two spritesheets are different,
    ; only the last two ones are scheduled.)
    ;

    ld   d, $00                                   ;; 00:0DFE $16 $00
    ld   bc, wLoadedEntitySpritesheets            ;; 00:0E00 $01 $93 $C1

.loop
    ld   e, [hl]                                  ;; 00:0E03 $5E
    ld   a, [bc]                                  ;; 00:0E04 $0A
    ; If the spritesheet is already loaded, skip to the next
    cp   e                                        ;; 00:0E05 $BB
    jr   z, .continue                             ;; 00:0E06 $28 $21
    ; If the spritesheet is "KEEP CURRENT", skip to the next
    ld   a, e                                     ;; 00:0E08 $7B
    cp   $FF                                      ;; 00:0E09 $FE $FF
    jr   z, .continue                             ;; 00:0E0B $28 $1C
    ; Copy the spritesheet value to the wLoadedEntitySpritesheets slot
    ld   [bc], a                                  ;; 00:0E0D $02

    ; Request the first spritesheet using hNeedsUpdatingEntityTilesA,
    ; and the second using wNeedsUpdatingEntityTilesB.
    ldh  a, [hMultiPurpose0]                      ;; 00:0E0E $F0 $D7
    and  a                                        ;; 00:0E10 $A7
    jr   z, .useVariantA                          ;; 00:0E11 $28 $0B
    ld   a, d                                     ;; 00:0E13 $7A
    ld   [wEntityTilesSpriteslotIndexB], a        ;; 00:0E14 $EA $0D $C1
    ld   a, TRUE                                  ;; 00:0E17 $3E $01
    ld   [wNeedsUpdatingEntityTilesB], a          ;; 00:0E19 $EA $0E $C1
    jr   .continue                                ;; 00:0E1C $18 $0B

.useVariantA
    inc  a                                        ;; 00:0E1E $3C
    ldh  [hMultiPurpose0], a                      ;; 00:0E1F $E0 $D7
    ld   a, d                                     ;; 00:0E21 $7A
    ld   [wEntityTilesSpriteslotIndexA], a        ;; 00:0E22 $EA $97 $C1
    ld   a, TRUE                                  ;; 00:0E25 $3E $01
    ldh  [hNeedsUpdatingEntityTilesA], a          ;; 00:0E27 $E0 $91

.continue
    ; Loop until all four slots are done
    inc  hl                                       ;; 00:0E29 $23
    inc  bc                                       ;; 00:0E2A $03
    inc  d                                        ;; 00:0E2B $14
    ld   a, d                                     ;; 00:0E2C $7A
    cp   $04                                      ;; 00:0E2D $FE $04
    jr   nz, .loop                                ;; 00:0E2F $20 $D2

.return
    jp   ReloadSavedBank                          ;; 00:0E31 $C3 $1D $08

ExecuteGameplayHandler::
    ld   a, [wGameplayType]                       ;; 00:0E34 $FA $95 $DB
    cp   GAMEPLAY_WORLD_MAP; If GameplayType < MINI_MAP ;; 00:0E37 $FE $07
    jr   c, jumpToGameplayHandler                 ;; 00:0E39 $38 $4A
    cp   GAMEPLAY_WORLD ; If GameplayType != World ;; 00:0E3B $FE $0B
    jr   nz, presentSaveScreenIfNeeded            ;; 00:0E3D $20 $07
    ; If GameplayType == WORLD
    ld   a, [wGameplaySubtype]                    ;; 00:0E3F $FA $96 $DB
    cp   GAMEPLAY_WORLD_INTERACTIVE ; If GameplaySubtype != 7 (interactive overworld gameplay) ;; 00:0E42 $FE $07
    jr   nz, jumpToGameplayHandler                ;; 00:0E44 $20 $3F

presentSaveScreenIfNeeded::
    ; If a indoor/outdoor transition is running...
    ld   a, [wTransitionSequenceCounter]          ;; 00:0E46 $FA $6B $C1
    cp   $04                                      ;; 00:0E49 $FE $04
    ; ...don't open the save screen.
    jr   nz, jumpToGameplayHandler                ;; 00:0E4B $20 $38

    ; If a dialog is visible...
    ld   a, [wDialogState]                        ;; 00:0E4D $FA $9F $C1
    ; ...or wC167 is non-zero...
    ld   hl, wC167                                ;; 00:0E50 $21 $67 $C1
    or   [hl]                                     ;; 00:0E53 $B6
    ; ...or the screen is currently scrolling from one room to another...
    ;
    ; (POI: This last check was added in 1.1 of the non-DX version of the game,
    ; and patches the screen warp glitch. However, removing this check doesn't
    ; re-introduce the glitch into the DX version, perhaps because of another
    ; check somewhere else.)
    ld   hl, wRoomTransitionState                 ;; 00:0E54 $21 $24 $C1
    or   [hl]                                     ;; 00:0E57 $B6
    ; ...don't open the save screen.
    jr   nz, jumpToGameplayHandler                ;; 00:0E58 $20 $2B

    ; If GameplayType > INVENTORY (i.e. photo album and pictures)
    ld   a, [wGameplayType]                       ;; 00:0E5A $FA $95 $DB
    cp   GAMEPLAY_INVENTORY                       ;; 00:0E5D $FE $0C
    jr   nc, jumpToGameplayHandler                ;; 00:0E5F $30 $24

    ; If not all A + B + Start + Select buttons are pressed
    ldh  a, [hPressedButtonsMask]                 ;; 00:0E61 $F0 $CB
    cp   J_A | J_B | J_START | J_SELECT           ;; 00:0E63 $FE $F0
    jr   nz, jumpToGameplayHandler                ;; 00:0E65 $20 $1E

    ; If wD474 != 0
    ld   a, [wD474]                               ;; 00:0E67 $FA $74 $D4
    and  a                                        ;; 00:0E6A $A7
    jr   nz, jumpToGameplayHandler                ;; 00:0E6B $20 $18

    ; If wD464 != 0
    ld   a, [wD464]                               ;; 00:0E6D $FA $64 $D4
    and  a                                        ;; 00:0E70 $A7
    jr   nz, jumpToGameplayHandler                ;; 00:0E71 $20 $12

    ; Present save screen
    xor  a ; Clear variables                      ;; 00:0E73 $AF
    ld   [wTransitionSequenceCounter], a          ;; 00:0E74 $EA $6B $C1
    ld   [wC16C], a                               ;; 00:0E77 $EA $6C $C1
    ld   [wDialogState], a                        ;; 00:0E7A $EA $9F $C1
    ld   [wGameplaySubtype], a                    ;; 00:0E7D $EA $96 $DB
    ld   a, GAMEPLAY_FILE_SAVE ; Set GameplayType to FILE_SAVE ;; 00:0E80 $3E $06
    ld   [wGameplayType], a                       ;; 00:0E82 $EA $95 $DB

jumpToGameplayHandler::
    ld   a, [wGameplayType]                       ;; 00:0E85 $FA $95 $DB
    JP_TABLE                                      ;; 00:0E88 $C7
._00 dw IntroHandler                              ;; 00:0E89
._01 dw EndCreditsHandler                         ;; 00:0E8B
._02 dw FileSelectionHandler                      ;; 00:0E8D
._03 dw FileCreationHandler                       ;; 00:0E8F
._04 dw FileDeletionHandler                       ;; 00:0E91
._05 dw FileCopyHandler                           ;; 00:0E93
._06 dw FileSaveHandler                           ;; 00:0E95
._07 dw WorldMapHandler                           ;; 00:0E97
._08 dw PeachPictureHandler                       ;; 00:0E99
._09 dw MarinBeachHandler                         ;; 00:0E9B
._0A dw FaceShrineMuralHandler                    ;; 00:0E9D
._0B dw WorldHandler                              ;; 00:0E9F
._0C dw InventoryHandler                          ;; 00:0EA1
._0D dw PhotoAlbumHandler                         ;; 00:0EA3
._0E dw PhotoPictureHandler ; Dizzy Link photo    ;; 00:0EA5
._0F dw PhotoPictureHandler ; Good-looking Link photo ;; 00:0EA7
._10 dw PhotoPictureHandler ; Marin cliff photo (with cutscene) ;; 00:0EA9
._11 dw PhotoPictureHandler ; Marin well photo    ;; 00:0EAB
._12 dw PhotoPictureHandler ; Mabe village photo (with cutscene) ;; 00:0EAD
._13 dw PhotoPictureHandler ; Ulrira photo        ;; 00:0EAF
._14 dw PhotoPictureHandler ; Bow-wow photo (with cutscene) ;; 00:0EB1
._15 dw PhotoPictureHandler ; Thief photo         ;; 00:0EB3
._16 dw PhotoPictureHandler ; Fisherman photo     ;; 00:0EB5
._17 dw PhotoPictureHandler ; Zora photo          ;; 00:0EB7
._18 dw PhotoPictureHandler ; Kanalet Castle photo (with cutscene) ;; 00:0EB9
._19 dw PhotoPictureHandler ; Ghost photo         ;; 00:0EBB
._1A dw PhotoPictureHandler ; Bridge photo        ;; 00:0EBD

FaceShrineMuralHandler::
    call FaceShrineMuralEntryPoint                ;; 00:0EBF $CD $F8 $6A
    jp   returnFromGameplayHandler                ;; 00:0EC2 $C3 $1A $10

PeachPictureHandler::
    call PeachPictureEntryPoint                   ;; 00:0EC5 $CD $EE $67
    jp   returnFromGameplayHandler                ;; 00:0EC8 $C3 $1A $10

MarinBeachHandler::
    call MarinBeachEntryPoint                     ;; 00:0ECB $CD $03 $62
    jp   returnFromGameplayHandler                ;; 00:0ECE $C3 $1A $10

WorldMapHandler::
    call WorldMapEntryPoint                       ;; 00:0ED1 $CD $26 $56
    jp   returnFromGameplayHandler                ;; 00:0ED4 $C3 $1A $10

FileSaveHandler::
    jpsw FileSaveEntryPoint                       ;; 00:0ED7 $3E $01 $CD $0C $08 $C3 $00 $40

IntroHandler::
    jp   IntroHandlerEntryPoint                   ;; 00:0EDF $C3 $1D $6E

EndCreditsHandler::
    callsw EndCreditsEntryPoint                   ;; 00:0EE2 $3E $17 $CD $0C $08 $CD $B7 $4A
    jp   returnFromGameplayHandler                ;; 00:0EEA $C3 $1A $10

AnimateEntitiesAndRestoreBank17::
    ld   a, $03                                   ;; 00:0EED $3E $03
    ld   [rSelectROMBank], a                      ;; 00:0EEF $EA $00 $21
    ld   a, $17                                   ;; 00:0EF2 $3E $17

; Call AnimateEntities, then restore bank in a
AnimateEntitiesAndRestoreBank::
    push af                                       ;; 00:0EF4 $F5
    call AnimateEntities                          ;; 00:0EF5 $CD $8D $39
    pop  af                                       ;; 00:0EF8 $F1
    jp   SwitchBank                               ;; 00:0EF9 $C3 $0C $08

AnimateEntitiesAndRestoreBank01::
    ld   a, $03                                   ;; 00:0EFC $3E $03
    ld   [rSelectROMBank], a                      ;; 00:0EFE $EA $00 $21
    ld   a, $01                                   ;; 00:0F01 $3E $01
    jr   AnimateEntitiesAndRestoreBank            ;; 00:0F03 $18 $EF

AnimateEntitiesAndRestoreBank02::
    ld   a, $03                                   ;; 00:0F05 $3E $03
    ld   [rSelectROMBank], a                      ;; 00:0F07 $EA $00 $21
    ld   a, $02                                   ;; 00:0F0A $3E $02
    jr   AnimateEntitiesAndRestoreBank            ;; 00:0F0C $18 $E6

FileSelectionHandler::
    jp   FileSelectionEntryPoint                  ;; 00:0F0E $C3 $CE $47

FileCreationHandler::
    jp   FileCreationEntryPoint                   ;; 00:0F11 $C3 $07 $4A

FileDeletionHandler::
    jp   FileDeletionEntryPoint                   ;; 00:0F14 $C3 $FB $4C

FileCopyHandler::
    jp   FileCopyEntryPoint                       ;; 00:0F17 $C3 $8C $4F

WorldHandler::
    callsb UpdatePaletteEffectForInteractiveObjects ;; 00:0F1A $3E $14 $EA $00 $21 $CD $4B $4C
    call PerformOverworldAudioTasks               ;; 00:0F22 $CD $BC $4A
    jpsw WorldHandlerEntryPoint                   ;; 00:0F25 $3E $01 $CD $0C $08 $C3 $71 $43

InventoryHandler::
    jpsw InventoryEntryPoint                      ;; 00:0F2D $3E $20 $CD $0C $08 $C3 $04 $59

PhotoAlbumHandler::
    callsw PhotoAlbumEntryPoint                   ;; 00:0F35 $3E $28 $CD $0C $08 $CD $00 $40
    jp   returnFromGameplayHandler                ;; 00:0F3D $C3 $1A $10

PhotoPictureHandler::
    jpsw PhotosEntryPoint                         ;; 00:0F40 $3E $37 $CD $0C $08 $C3 $00 $40

; World handler for GAMEPLAY_WORLD_INTERACTIVE (dispatched from WorldHandlerEntryPoint)
WorldInteractiveHandler::
    ld   a, $02                                   ;; 00:0F48 $3E $02
    call SwitchBank                               ;; 00:0F4A $CD $0C $08
    ; If a dialog is already open, continue to the normal flow
    ld   a, [wDialogState]                        ;; 00:0F4D $FA $9F $C1
    and  a                                        ;; 00:0F50 $A7
    jr   nz, .normalFlow                          ;; 00:0F51 $20 $3C

    ; If the dungeon name should be displayed…
    ld   hl, hDungeonTitleMessageCountdown        ;; 00:0F53 $21 $B4 $FF
    ld   a, [hl]                                  ;; 00:0F56 $7E
    and  a                                        ;; 00:0F57 $A7
    jr   z, .noDungeonName                        ;; 00:0F58 $28 $1B
    ; … and inventory window is not visible…
    ld   a, [wWindowY]                            ;; 00:0F5A $FA $9A $DB
    cp   $80                                      ;; 00:0F5D $FE $80
    jr   nz, .noDungeonName                       ;; 00:0F5F $20 $14
    ; … and inventory is not opening…
    ld   a, [wInventoryAppearing]                 ;; 00:0F61 $FA $4F $C1
    and  a                                        ;; 00:0F64 $A7
    jr   nz, .noDungeonName                       ;; 00:0F65 $20 $0E
    ; … display the dungeon name.
    dec  [hl]                                     ;; 00:0F67 $35
    jr   nz, .noDungeonName                       ;; 00:0F68 $20 $0B
    callsb OpenDungeonNameDialog                  ;; 00:0F6A $3E $01 $EA $00 $21 $CD $EE $61
    call ReloadSavedBank                          ;; 00:0F72 $CD $1D $08
.noDungeonName

    ; If still no dialog is open…
    ld   a, [wDialogState]                        ;; 00:0F75 $FA $9F $C1
    and  a                                        ;; 00:0F78 $A7
    jr   nz, .normalFlow                          ;; 00:0F79 $20 $14

    ; … and a countdown to load the previous map is > 0…
    ld   a, [wLoadPreviousMapCountdown]           ;; 00:0F7B $FA $BC $C1
    and  a                                        ;; 00:0F7E $A7
    jr   z, .normalFlow                           ;; 00:0F7F $28 $0E

    ; … decrement the counter
    ld   hl, hLinkInteractiveMotionBlocked        ;; 00:0F81 $21 $A1 $FF
    ld   [hl], $02                                ;; 00:0F84 $36 $02
    dec  a                                        ;; 00:0F86 $3D
    ld   [wLoadPreviousMapCountdown], a           ;; 00:0F87 $EA $BC $C1

    ; If the countdown reached zero, apply the transition
    jr   nz, .normalFlow                          ;; 00:0F8A $20 $03
    jp   ApplyMapFadeOutTransitionWithNoise       ;; 00:0F8C $C3 $7D $0C

.normalFlow

    ; If wInvincibilityCounter > 0, decrement it
    ld   hl, wInvincibilityCounter                ;; 00:0F8F $21 $C7 $DB
    ld   a, [hl]                                  ;; 00:0F92 $7E
    and  a                                        ;; 00:0F93 $A7
    jr   z, .wInvincibilityAtZero                 ;; 00:0F94 $28 $01
    dec  [hl]                                     ;; 00:0F96 $35
.wInvincibilityAtZero

    ; Copy Link's position into Link's final position
    ldh  a, [hLinkPositionX]                      ;; 00:0F97 $F0 $98
    ldh  [hLinkFinalPositionX], a                 ;; 00:0F99 $E0 $9F
    ldh  a, [hLinkPositionY]                      ;; 00:0F9B $F0 $99
    ldh  [hLinkFinalPositionY], a                 ;; 00:0F9D $E0 $A0
    ld   hl, hLinkPositionZ                       ;; 00:0F9F $21 $A2 $FF
    sub  a, [hl]                                  ;; 00:0FA2 $96
    ldh  [hLinkPositionZModified], a              ;; 00:0FA3 $E0 $B3

    call func_002_60E0                            ;; 00:0FA5 $CD $E0 $60

    xor  a                                        ;; 00:0FA8 $AF
    ld   [wC140], a                               ;; 00:0FA9 $EA $40 $C1
    ld   [wC13C], a                               ;; 00:0FAC $EA $3C $C1
    ld   [wC13B], a                               ;; 00:0FAF $EA $3B $C1

    ld   hl, wC11D                                ;; 00:0FB2 $21 $1D $C1
    res  7, [hl]                                  ;; 00:0FB5 $CB $BE

    ld   hl, wC11E                                ;; 00:0FB7 $21 $1E $C1
    res  7, [hl]                                  ;; 00:0FBA $CB $BE

    ; Execute room events
    call label_002_593B                           ;; 00:0FBC $CD $3B $59

    callsw ApplyRoomTransition                    ;; 00:0FBF $3E $02 $CD $0C $08 $CD $E8 $78

    call ApplyGotItem                             ;; 00:0FC7 $CD $33 $10

    ld   a, [wIsCarryingLiftedObject]             ;; 00:0FCA $FA $5C $C1
    ld   [wC3CF], a                               ;; 00:0FCD $EA $CF $C3

    callsb func_20_4B1F                           ;; 00:0FD0 $3E $20 $EA $00 $21 $CD $1F $4B

    callsw func_019_7A9A                          ;; 00:0FD8 $3E $19 $CD $0C $08 $CD $9A $7A

    call AnimateEntities                          ;; 00:0FE0 $CD $8D $39
    callsw label_002_5487                         ;; 00:0FE3 $3E $02 $CD $0C $08 $CD $87 $54

    ld   hl, wDrawCommand                         ;; 00:0FEB $21 $01 $D6
    ldh  a, [hFrameCounter]                       ;; 00:0FEE $F0 $E7
    and  $03                                      ;; 00:0FF0 $E6 $03
    or   [hl]                                     ;; 00:0FF2 $B6
    jr   nz, label_1012                           ;; 00:0FF3 $20 $1D
    ld   a, [wLinkMotionState]                    ;; 00:0FF5 $FA $1C $C1
    cp   LINK_MOTION_TYPE_NON_INTERACTIVE         ;; 00:0FF8 $FE $02
    jr   nc, label_1012                           ;; 00:0FFA $30 $16
    ld   c, $01                                   ;; 00:0FFC $0E $01
    ld   b, $00                                   ;; 00:0FFE $06 $00
    ld   e, $00                                   ;; 00:1000 $1E $00
    ldh  a, [hFrameCounter]                       ;; 00:1002 $F0 $E7
    and  $04                                      ;; 00:1004 $E6 $04
    jr   z, .label_100A                           ;; 00:1006 $28 $02
    dec  c                                        ;; 00:1008 $0D
    dec  e                                        ;; 00:1009 $1D

.label_100A
    callsb DrawInventorySlots                     ;; 00:100A $3E $20 $EA $00 $21 $CD $9C $5C

label_1012::
    callsw func_014_54F8                          ;; 00:1012 $3E $14 $CD $0C $08 $CD $F8 $54

returnFromGameplayHandler::
    ; Present dialog if needed
    ld   a, BANK(FontTiles)                       ;; 00:101A $3E $0F
    call SwitchBank                               ;; 00:101C $CD $0C $08
    call ExecuteDialog                            ;; 00:101F $CD $21 $23

    ; If on DMG, return now to the main game loop
    ldh  a, [hIsGBC]                              ;; 00:1022 $F0 $FE
    and  a                                        ;; 00:1024 $A7
    ret  z                                        ;; 00:1025 $C8

    ; Load Background palettes if needed
    ; (and then return to the main game loop)
    ld   a, BANK(LoadBGPalettes)                  ;; 00:1026 $3E $24
    call SwitchBank                               ;; 00:1028 $CD $0C $08
    jp   LoadBGPalettes                           ;; 00:102B $C3 $05 $74

; Dialog to open, indexed by wDialogGotItem value
DialogForItem::
.gotItem1 db_dialog_low Dialog008 ; Piece of Power ;; 00:102E
.gotItem2 db_dialog_low Dialog00E ; Toadstool      ;; 00:102F
.gotItem3 db_dialog_low Dialog099 ; Magic powder   ;; 00:1030
.gotItem4 db_dialog_low Dialog028 ; Break pots (?) ;; 00:1031
.gotItem5 db_dialog_low Dialog0EC ; Guardian Acorn ;; 00:1032

ApplyGotItem::
    ldh  a, [hLinkPositionY]                      ;; 00:1033 $F0 $99
    ld   hl, hLinkPositionZ                       ;; 00:1035 $21 $A2 $FF
    sub  a, [hl]                                  ;; 00:1038 $96
    ld   [wC145], a                               ;; 00:1039 $EA $45 $C1
    ld   a, [wDialogGotItem]                      ;; 00:103C $FA $A9 $C1
    and  a                                        ;; 00:103F $A7
    jr   z, InitGotItemSequence                   ;; 00:1040 $28 $3D
    ld   a, [wDialogState]                        ;; 00:1042 $FA $9F $C1
    and  a                                        ;; 00:1045 $A7
    jr   nz, .dispatchItemType                    ;; 00:1046 $20 $25

    ; Did the "got item" dialog countdown reached the target value yet?
    ld   hl, wDialogGotItemCountdown              ;; 00:1048 $21 $AA $C1
    dec  [hl]                                     ;; 00:104B $35
    ld   a, [hl]                                  ;; 00:104C $7E
    cp   $02                                      ;; 00:104D $FE $02
    jr   nz, .countdownNotFinished                ;; 00:104F $20 $10

    ; Dialog countdown reached the target value: open the "Got item" dialog
    ld   a, [wDialogGotItem]                      ;; 00:1051 $FA $A9 $C1
    ld   e, a                                     ;; 00:1054 $5F
    ld   d, $00                                   ;; 00:1055 $16 $00
    ld   hl, DialogForItem - $01                  ;; 00:1057 $21 $2D $10
    add  hl, de                                   ;; 00:105A $19
    ld   a, [hl]                                  ;; 00:105B $7E
    call OpenDialogInTable0                       ;; 00:105C $CD $85 $23
    ld   a, $01                                   ;; 00:105F $3E $01

.countdownNotFinished
    and  a                                        ;; 00:1061 $A7
    jr   nz, .dispatchItemType                    ;; 00:1062 $20 $09
    xor  a                                        ;; 00:1064 $AF
    ld   [wDialogGotItem], a                      ;; 00:1065 $EA $A9 $C1
    ld   [wC1A8], a                               ;; 00:1068 $EA $A8 $C1
    jr   InitGotItemSequence                      ;; 00:106B $18 $12

.dispatchItemType
    ld   a, [wDialogGotItem]                      ;; 00:106D $FA $A9 $C1
    ld   [wC1A8], a                               ;; 00:1070 $EA $A8 $C1
    dec  a                                        ;; 00:1073 $3D
    JP_TABLE                                      ;; 00:1074 $C7
._00 dw HandleGotItemA                            ;; 00:1075
._01 dw HandleGotItemB                            ;; 00:1077
._02 dw HandleGotItemB                            ;; 00:1079
._03 dw HandleGotItemB                            ;; 00:107B
._04 dw HandleGotItemA                            ;; 00:107D

InitGotItemSequence::
    ldh  a, [hPressedButtonsMask]                 ;; 00:107F $F0 $CB
    and  J_A | J_B | J_START                      ;; 00:1081 $E6 $B0
    jr   nz, .jp_10DB                             ;; 00:1083 $20 $56
    ldh  a, [hPressedButtonsMask]                 ;; 00:1085 $F0 $CB
    and  J_SELECT                                 ;; 00:1087 $E6 $40
    jr   z, .jp_10DB                              ;; 00:1089 $28 $50
    ld   a, [wD45F]                               ;; 00:108B $FA $5F $D4
    inc  a                                        ;; 00:108E $3C
    ld   [wD45F], a                               ;; 00:108F $EA $5F $D4
    cp   $04                                      ;; 00:1092 $FE $04
    jr   c, .jp_10DF                              ;; 00:1094 $38 $49
    ldh  a, [hLinkInteractiveMotionBlocked]       ;; 00:1096 $F0 $A1
    cp   $02                                      ;; 00:1098 $FE $02
    jr   z, .jp_10DB                              ;; 00:109A $28 $3F
    ldh  a, [hLinkAnimationState]                 ;; 00:109C $F0 $9D
    cp   LINK_ANIMATION_STATE_HIDDEN              ;; 00:109E $FE $FF
    jr   z, .jp_10DB                              ;; 00:10A0 $28 $39
    ld   a, [wLinkMotionState]                    ;; 00:10A2 $FA $1C $C1
    cp   LINK_MOTION_TYPE_NON_INTERACTIVE         ;; 00:10A5 $FE $02
    jr   nc, .jp_10DB                             ;; 00:10A7 $30 $32
    ld   a, [wDialogState]                        ;; 00:10A9 $FA $9F $C1
    ld   hl, wC167                                ;; 00:10AC $21 $67 $C1
    or   [hl]                                     ;; 00:10AF $B6
    ld   hl, wRoomTransitionState                 ;; 00:10B0 $21 $24 $C1
    or   [hl]                                     ;; 00:10B3 $B6
    jr   nz, .jp_10DB                             ;; 00:10B4 $20 $25
    ld   a, [wD464]                               ;; 00:10B6 $FA $64 $D4
    and  a                                        ;; 00:10B9 $A7
    jr   nz, .jp_10DB                             ;; 00:10BA $20 $1F

    ; Show a location on the mini-map
    xor  a                                        ;; 00:10BC $AF
    ld   [wTransitionSequenceCounter], a          ;; 00:10BD $EA $6B $C1
    ld   [wC16C], a                               ;; 00:10C0 $EA $6C $C1
    ld   [wGameplaySubtype], a                    ;; 00:10C3 $EA $96 $DB
    ld   a, GAMEPLAY_WORLD_MAP                    ;; 00:10C6 $3E $07
    ld   [wGameplayType], a                       ;; 00:10C8 $EA $95 $DB
    callsb func_002_755B                          ;; 00:10CB $3E $02 $EA $00 $21 $CD $5B $75
    call DrawLinkSprite                           ;; 00:10D3 $CD $2E $1D
    call AnimateEntities                          ;; 00:10D6 $CD $8D $39
    pop  af                                       ;; 00:10D9 $F1
    ret                                           ;; 00:10DA $C9

.jp_10DB
    xor  a                                        ;; 00:10DB $AF
    ld   [wD45F], a                               ;; 00:10DC $EA $5F $D4
.jp_10DF

    ; Decrement hLinkCountdown timer if needed
    ldh  a, [hLinkCountdown]                      ;; 00:10DF $F0 $B7
    and  a                                        ;; 00:10E1 $A7
    jr   z, .linkCountdownEnd                     ;; 00:10E2 $28 $03
    dec  a                                        ;; 00:10E4 $3D
    ldh  [hLinkCountdown], a                      ;; 00:10E5 $E0 $B7
.linkCountdownEnd

    ; Decrement the hLinkPunchedAwayCountdown timer if needed
    ldh  a, [hLinkPunchedAwayCountdown]           ;; 00:10E7 $F0 $B6
    and  a                                        ;; 00:10E9 $A7
    jr   z, .punchedAwayDecrementEnd              ;; 00:10EA $28 $03
    dec  a                                        ;; 00:10EC $3D
    ldh  [hLinkPunchedAwayCountdown], a           ;; 00:10ED $E0 $B6
.punchedAwayDecrementEnd

    ld   a, [wDialogState]                        ;; 00:10EF $FA $9F $C1
    and  a                                        ;; 00:10F2 $A7
    jp   nz, ApplyLinkMotionState                 ;; 00:10F3 $C2 $94 $17
    ld   a, [wRoomTransitionState]                ;; 00:10F6 $FA $24 $C1
    and  a                                        ;; 00:10F9 $A7
    jp   nz, label_114F                           ;; 00:10FA $C2 $4F $11
    ld   a, [wLinkMotionState]                    ;; 00:10FD $FA $1C $C1
    cp   LINK_MOTION_PASS_OUT                     ;; 00:1100 $FE $07
    jr   z, .linkMotionJumpTable                  ;; 00:1102 $28 $34
    ld   a, [wHealth]                             ;; 00:1104 $FA $5A $DB
    ld   hl, wBlockItemUsage                      ;; 00:1107 $21 $0A $C5
    or   [hl]                                     ;; 00:110A $B6
    ld   hl, wInventoryAppearing                  ;; 00:110B $21 $4F $C1
    or   [hl]                                     ;; 00:110E $B6
    jr   nz, .handleLinkMotion                    ;; 00:110F $20 $24
    ld   a, LINK_MOTION_PASS_OUT                  ;; 00:1111 $3E $07
    ld   [wLinkMotionState], a                    ;; 00:1113 $EA $1C $C1
    ; Set the pass out animation duration
    ld   a, $BF                                   ;; 00:1116 $3E $BF
    ldh  [hLinkCountdown], a                      ;; 00:1118 $E0 $B7
    ld   a, $10                                   ;; 00:111A $3E $10
    ld   [wBGPaletteEffectAddress], a             ;; 00:111C $EA $CC $C3
    xor  a                                        ;; 00:111F $AF
    ld   [wInvincibilityCounter], a               ;; 00:1120 $EA $C7 $DB
    ldh  [hLinkPhysicsModifier], a                ;; 00:1123 $E0 $9C
    ld   [wBGPaletteTransitionEffect], a          ;; 00:1125 $EA $D6 $DD
    ld   [wDDD7], a                               ;; 00:1128 $EA $D7 $DD
    ld   [wD464], a                               ;; 00:112B $EA $64 $D4
    call label_27F2                               ;; 00:112E $CD $F2 $27
    ld   a, WAVE_SFX_LINK_DIES                    ;; 00:1131 $3E $08
    ldh  [hWaveSfx], a                            ;; 00:1133 $E0 $F3

.handleLinkMotion
    ld   a, [wLinkMotionState]                    ;; 00:1135 $FA $1C $C1
.linkMotionJumpTable
    JP_TABLE                                      ;; 00:1138 $C7
._00 dw LinkMotionDefaultHandler                  ;; 00:1139
._01 dw LinkMotionSwimmingHandler                 ;; 00:113B
._02 dw LinkMotionUnstuckingHandler               ;; 00:113D
._03 dw LinkMotionMapFadeOutHandler               ;; 00:113F
._04 dw LinkMotionMapFadeInHandler                ;; 00:1141
._05 dw LinkMotionRevolvingDoorHandler            ;; 00:1143
._06 dw LinkMotionFallingDownHandler              ;; 00:1145
._07 dw LinkMotionPassOutHandler                  ;; 00:1147
._08 dw LinkMotionRecoverHandler                  ;; 00:1149
._09 dw LinkMotionTeleportUpHandler               ;; 00:114B
._0F dw LinkMotionUnknownHandler                  ;; 00:114D

label_114F::
    call ApplyLinkMotionState                     ;; 00:114F $CD $94 $17
    jp   DrawLinkSpriteAndReturn                  ;; 00:1152 $C3 $2E $1D

LinkMotionTeleportUpHandler::
    jpsw func_019_5D6A                            ;; 00:1155 $3E $19 $CD $0C $08 $C3 $6A $5D

LinkMotionPassOutHandler::
    jpsw LinkPassOut                              ;; 00:115D $3E $01 $CD $0C $08 $C3 $C2 $41

LinkMotionDefaultHandler::
    callsb IsInteractiveMotionAllowed             ;; 00:1165 $3E $36 $EA $00 $21 $CD $5A $72
    and  a                                        ;; 00:116D $A7
    ret  z                                        ;; 00:116E $C8

    jpsw LinkMotionDefault                        ;; 00:116F $3E $02 $CD $0C $08 $C3 $87 $42

include "code/home/check_items_to_use.asm"

; Use an inventory item.
;
; Input:
;   a    inventory item to use
UseItem::
    ld   c, a                                     ;; 00:129C $4F
    cp   INVENTORY_SWORD                          ;; 00:129D $FE $01
    jp   z, UseSword                              ;; 00:129F $CA $28 $15
    cp   INVENTORY_SHIELD                         ;; 00:12A2 $FE $04
    jp   z, UseShield                             ;; 00:12A4 $CA $EE $12
    cp   INVENTORY_BOMBS                          ;; 00:12A7 $FE $02
    jp   z, PlaceBomb                             ;; 00:12A9 $CA $5A $13
    cp   INVENTORY_POWER_BRACELET                 ;; 00:12AC $FE $03
    jp   z, UsePowerBracelet                      ;; 00:12AE $CA $82 $13
    cp   INVENTORY_BOW                            ;; 00:12B1 $FE $05
    jp   z, ShootArrow                            ;; 00:12B3 $CA $BD $13
    cp   INVENTORY_BOOMERANG                      ;; 00:12B6 $FE $0D
    jp   z, UseBoomerang                          ;; 00:12B8 $CA $83 $13
    cp   INVENTORY_HOOKSHOT                       ;; 00:12BB $FE $06
    jp   z, UseHookshot                           ;; 00:12BD $CA $19 $13
    cp   INVENTORY_ROCS_FEATHER                   ;; 00:12C0 $FE $0A
    jp   z, UseRocsFeather                        ;; 00:12C2 $CA $CB $14
    cp   INVENTORY_OCARINA                        ;; 00:12C5 $FE $09
    jp   z, UseOcarina                            ;; 00:12C7 $CA $FC $41
    cp   INVENTORY_MAGIC_POWDER                   ;; 00:12CA $FE $0C
    jp   z, UseMagicPowder                        ;; 00:12CC $CA $8D $14
    cp   INVENTORY_SHOVEL                         ;; 00:12CF $FE $0B
    jp   z, UseShovel                             ;; 00:12D1 $CA $F8 $12
    cp   INVENTORY_MAGIC_ROD                      ;; 00:12D4 $FE $07
    jr   nz, .return                              ;; 00:12D6 $20 $15
    ; fallthrough

.useMagicRod
    ld   hl, wSwordAnimationState                 ;; 00:12D8 $21 $37 $C1
    ld   a, [wLinkAttackStepAnimationCountdown]   ;; 00:12DB $FA $9B $C1
    or   [hl]                                     ;; 00:12DE $B6
    jr   nz, .return                              ;; 00:12DF $20 $0C

    ld   a, [wActiveProjectileCount]              ;; 00:12E1 $FA $4D $C1
    cp   $02                                      ;; 00:12E4 $FE $02
    jr   nc, .return                              ;; 00:12E6 $30 $05

    ld   a, $0E | ATTACK_STEP_ITEM_MAGIC_ROD      ;; 00:12E8 $3E $8E
    ld   [wLinkAttackStepAnimationCountdown], a   ;; 00:12EA $EA $9B $C1

.return
    ret                                           ;; 00:12ED $C9

UseShield::
    ld   a, [wIsLinkPushing]                      ;; 00:12EE $FA $44 $C1
    and  a                                        ;; 00:12F1 $A7
    ret  nz                                       ;; 00:12F2 $C0
    ld   a, NOISE_SFX_DRAW_SHIELD                 ;; 00:12F3 $3E $16
    ldh  [hNoiseSfx], a                           ;; 00:12F5 $E0 $F4
    ret                                           ;; 00:12F7 $C9

UseShovel::
    ld   a, [wLinkUsingShovel]                    ;; 00:12F8 $FA $C7 $C1
    ld   hl, wIsLinkInTheAir                      ;; 00:12FB $21 $46 $C1
    or   [hl]                                     ;; 00:12FE $B6
    ret  nz                                       ;; 00:12FF $C0

    call func_002_4D20                            ;; 00:1300 $CD $20 $4D
    jr   nc, .notPoking                           ;; 00:1303 $30 $06

    ld   a, JINGLE_SWORD_POKING                   ;; 00:1305 $3E $07
    ldh  [hJingle], a                             ;; 00:1307 $E0 $F2
    jr   .endIf                                   ;; 00:1309 $18 $04

.notPoking
    ld   a, NOISE_SFX_SHOVEL_DIG                  ;; 00:130B $3E $0E
    ldh  [hNoiseSfx], a                           ;; 00:130D $E0 $F4
.endIf

IF __PATCH_0__
    call ResetPegasusBoots
ENDC

    ld   a, $01                                   ;; 00:130F $3E $01
    ld   [wLinkUsingShovel], a                    ;; 00:1311 $EA $C7 $C1
    xor  a                                        ;; 00:1314 $AF
    ld   [wLinkUsingShovelTimer], a               ;; 00:1315 $EA $C8 $C1
    ret                                           ;; 00:1318 $C9

UseHookshot::
    ld   a, [wC1A4]                               ;; 00:1319 $FA $A4 $C1
    and  a                                        ;; 00:131C $A7
    ret  nz                                       ;; 00:131D $C0
    jp   FireHookshot                             ;; 00:131E $C3 $54 $42

; Inputs:
;   a    inventory item
label_1321::
    ; if inventory item is not sword, exit
    cp   INVENTORY_SWORD                          ;; 00:1321 $FE $01
    ret  nz                                       ;; 00:1323 $C0
    ; normal attack
    ld   hl, wSwordAnimationState                 ;; 00:1324 $21 $37 $C1
    ld   a, [wItemUsageContext]                   ;; 00:1327 $FA $AD $C1
    and  ITEM_USAGE_NEAR_NPC | ITEM_USAGE_READING_TEXT ;; 00:132A $E6 $03
    or   [hl]                                     ;; 00:132C $B6
    ret  nz                                       ;; 00:132D $C0
    ; sword held
    ld   a, [wC160]                               ;; 00:132E $FA $60 $C1
    and  a                                        ;; 00:1331 $A7
    ret  nz                                       ;; 00:1332 $C0

    xor  a                                        ;; 00:1333 $AF
    ld   [wC1AC], a                               ;; 00:1334 $EA $AC $C1
    ld   a, SWORD_ANIMATION_STATE_HOLDING         ;; 00:1337 $3E $05
    ld   [wSwordAnimationState], a                ;; 00:1339 $EA $37 $C1
    ; enable sword collision
    ld   [wSwordCollisionEnabled], a              ;; 00:133C $EA $B0 $C5
    ret                                           ;; 00:133F $C9

SetShieldVals::
    ld   a, $01                                   ;; 00:1340 $3E $01
    ld   [wIsUsingShield], a                      ;; 00:1342 $EA $5B $C1
    ld   a, [wShieldLevel]                        ;; 00:1345 $FA $44 $DB
    ld   [wHasMirrorShield], a                    ;; 00:1348 $EA $5A $C1
    ; fallthrough

func_020_4B4A_trampoline::
    callsb func_020_4B4A                          ;; 00:134B $3E $20 $EA $00 $21 $CD $4A $4B
    ld   a, [wCurrentBank]                        ;; 00:1353 $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:1356 $EA $00 $21
    ret                                           ;; 00:1359 $C9

PlaceBomb::
    ld   a, [wHasPlacedBomb]                      ;; 00:135A $FA $4E $C1
    cp   $01                                      ;; 00:135D $FE $01
    ret  nc                                       ;; 00:135F $D0

    ld   a, [wBombCount]                          ;; 00:1360 $FA $4D $DB
    and  a                                        ;; 00:1363 $A7
    jp   z, PlayWrongAnswerJingle                 ;; 00:1364 $CA $20 $0C

    sub  a, $01                                   ;; 00:1367 $D6 $01
    daa                                           ;; 00:1369 $27
    ld   [wBombCount], a                          ;; 00:136A $EA $4D $DB
    ld   a, ENTITY_BOMB                           ;; 00:136D $3E $02
    call SpawnPlayerProjectile                    ;; 00:136F $CD $2F $14
    ret  c                                        ;; 00:1372 $D8

    callsb ConvertToBombArrowIfNeeded             ;; 00:1373 $3E $20 $EA $00 $21 $CD $81 $4B
    ld   a, [wCurrentBank]                        ;; 00:137B $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:137E $EA $00 $21
    ret                                           ;; 00:1381 $C9

UsePowerBracelet::
    ret                                           ;; 00:1382 $C9

UseBoomerang::
    ld   a, [wActiveProjectileCount]              ;; 00:1383 $FA $4D $C1
    and  a                                        ;; 00:1386 $A7
    ret  nz                                       ;; 00:1387 $C0

    ld   a, ENTITY_BOOMERANG                      ;; 00:1388 $3E $01
    call SpawnPlayerProjectile                    ;; 00:138A $CD $2F $14
    ret  c                                        ;; 00:138D $D8

    callsb func_020_4BFF                          ;; 00:138E $3E $20 $EA $00 $21 $CD $FF $4B
    ld   a, [wCurrentBank]                        ;; 00:1396 $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:1399 $EA $00 $21
    ret                                           ;; 00:139C $C9

data_139D::
    db   0, 0, 0, 0                               ;; 00:139D

data_13A1::
    db   0, 0, 0, 0                               ;; 00:13A1

data_13A5::
    db   $20, $E0, 0, 0                           ;; 00:13A5

data_13A9::
    db   0, 0, $E0, $20                           ;; 00:13A9

data_13AD::
.rightWithPieceOfPower      db  $30
.leftWithPieceOfPower       db  $D0
.upWithPieceOfPower         db  0
.downWithPieceOfPower       db  0
.rightWithoutPieceOfPower   db  $40
.leftWithoutPieceOfPower    db  $C0
.upWithoutPieceOfPower      db  0
.downWithoutPieceOfPower    db  0

data_13B5::
    db   0, 0, $D0, $30, 0, 0, $C0, $40           ;; 00:13B5

ShootArrow::
    ; return if Link is not shooting an arrow
    ld   a, [wIsShootingArrow]                    ;; 00:13BD $FA $4C $C1
    and  a                                        ;; 00:13C0 $A7
    ret  nz                                       ;; 00:13C1 $C0
    ; return if maximal amount of arrows are allready in the air
    ld   a, [wActiveProjectileCount]              ;; 00:13C2 $FA $4D $C1
    cp   ARROW_MAX_ACTIVE_COUNT                   ;; 00:13C5 $FE $02
    jr   nc, label_140F.return                    ;; 00:13C7 $30 $65
    ld   a, $10                                   ;; 00:13C9 $3E $10
    ld   [wIsShootingArrow], a                    ;; 00:13CB $EA $4C $C1
    ld   a, [wArrowCount]                         ;; 00:13CE $FA $45 $DB
    and  a                                        ;; 00:13D1 $A7
    jp   z, PlayWrongAnswerJingle                 ;; 00:13D2 $CA $20 $0C
    sub  a, $01                                   ;; 00:13D5 $D6 $01
    daa                                           ;; 00:13D7 $27
    ld   [wArrowCount], a                         ;; 00:13D8 $EA $45 $DB
    call func_157C                                ;; 00:13DB $CD $7C $15
    ld   a, ENTITY_ARROW                          ;; 00:13DE $3E $00
    call SpawnPlayerProjectile                    ;; 00:13E0 $CD $2F $14
    ret  c                                        ;; 00:13E3 $D8
    ld   a, e                                     ;; 00:13E4 $7B
    ld   [wLatestShotArrowEntityIndex], a         ;; 00:13E5 $EA $C2 $C1
    ld   a, [wBombArrowCooldown]                  ;; 00:13E8 $FA $C0 $C1
    and  a                                        ;; 00:13EB $A7
    jr   z, .initBombArrowCooldown                ;; 00:13EC $28 $13
    ld   a, [wLatestDroppedBombEntityIndex]       ;; 00:13EE $FA $C1 $C1
    ld   c, a                                     ;; 00:13F1 $4F
    ld   b, d                                     ;; 00:13F2 $42
    ld   hl, wEntitiesStatusTable                 ;; 00:13F3 $21 $80 $C2
    add  hl, bc                                   ;; 00:13F6 $09
    ld   [hl], b                                  ;; 00:13F7 $70
    ld   hl, wEntitiesStateTable                  ;; 00:13F8 $21 $90 $C2
    add  hl, de                                   ;; 00:13FB $19
    ld   [hl], $01                                ;; 00:13FC $36 $01
    xor  a                                        ;; 00:13FE $AF
    jr   .setBombArrowCooldown                    ;; 00:13FF $18 $06

.initBombArrowCooldown
    ld   a, NOISE_SFX_WHOOSH                      ;; 00:1401 $3E $0A
    ldh  [hNoiseSfx], a                           ;; 00:1403 $E0 $F4
    ld   a, BOMB_ARROW_COOLDOWN                   ;; 00:1405 $3E $06

.setBombArrowCooldown
    ld   [wBombArrowCooldown], a                  ;; 00:1407 $EA $C0 $C1

    ldh  a, [hLinkDirection]                      ;; 00:140A $F0 $9E
    ld   c, a                                     ;; 00:140C $4F
    ld   b, $00                                   ;; 00:140D $06 $00

label_140F::
    ; if piece of power is not active do not offset direction
    ld   a, [wActivePowerUp]                      ;; 00:140F $FA $7C $D4
    cp   POWER_UP_PIECE_OF_POWER                  ;; 00:1412 $FE $01
    jr   nz, .label_141A                          ;; 00:1414 $20 $04
    ; offset table by 4
    ld   a, c                                     ;; 00:1416 $79
    add  a, $04                                   ;; 00:1417 $C6 $04
    ld   c, a                                     ;; 00:1419 $4F

.label_141A::
    ; a = [data_13AD + hLinkDirection] + [wEntitiesSpeedXTable + hLinkDirecetion] + [wEntitiesSpeedYTable + hLinkDirection]
    ld   hl, data_13AD                            ;; 00:141A $21 $AD $13
    add  hl, bc                                   ;; 00:141D $09
    ld   a, [hl]                                  ;; 00:141E $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 00:141F $21 $40 $C2
    add  hl, de                                   ;; 00:1422 $19
    ld   [hl], a                                  ;; 00:1423 $77
    ld   hl, data_13B5                            ;; 00:1424 $21 $B5 $13
    add  hl, bc                                   ;; 00:1427 $09
    ld   a, [hl]                                  ;; 00:1428 $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 00:1429 $21 $50 $C2
    add  hl, de                                   ;; 00:142C $19
    ld   [hl], a                                  ;; 00:142D $77

.return::
    ret                                           ;; 00:142E $C9

; Spawn a arrow, liftable rock, hookshot element…
; with the same X, Y, Z and speed than the player.
SpawnPlayerProjectile::
    call SpawnNewEntity_trampoline                ;; 00:142F $CD $86 $3B
    ret  c                                        ;; 00:1432 $D8

    ld   a, $0C | ATTACK_STEP_ITEM_ANY            ;; 00:1433 $3E $0C
    ld   [wLinkAttackStepAnimationCountdown], a   ;; 00:1435 $EA $9B $C1

    push bc                                       ;; 00:1438 $C5
    ldh  a, [hLinkDirection]                      ;; 00:1439 $F0 $9E
    ld   c, a                                     ;; 00:143B $4F
    ld   b, $00                                   ;; 00:143C $06 $00
    ld   hl, data_139D                            ;; 00:143E $21 $9D $13
    add  hl, bc                                   ;; 00:1441 $09
    ldh  a, [hLinkPositionX]                      ;; 00:1442 $F0 $98
    add  a, [hl]                                  ;; 00:1444 $86
    ld   hl, wEntitiesPosXTable                   ;; 00:1445 $21 $00 $C2
    add  hl, de                                   ;; 00:1448 $19
    ld   [hl], a                                  ;; 00:1449 $77
    ld   hl, data_13A1                            ;; 00:144A $21 $A1 $13
    add  hl, bc                                   ;; 00:144D $09
    ldh  a, [hLinkPositionY]                      ;; 00:144E $F0 $99
    add  a, [hl]                                  ;; 00:1450 $86
    ld   hl, wEntitiesPosYTable                   ;; 00:1451 $21 $10 $C2
    add  hl, de                                   ;; 00:1454 $19
    ld   [hl], a                                  ;; 00:1455 $77
    ldh  a, [hLinkPositionZ]                      ;; 00:1456 $F0 $A2
    inc  a                                        ;; 00:1458 $3C
    ld   hl, wEntitiesPosZTable                   ;; 00:1459 $21 $10 $C3
    add  hl, de                                   ;; 00:145C $19
    ld   [hl], a                                  ;; 00:145D $77
    ld   hl, data_13A5                            ;; 00:145E $21 $A5 $13
    add  hl, bc                                   ;; 00:1461 $09
    ld   a, [hl]                                  ;; 00:1462 $7E
    ld   hl, wEntitiesSpeedXTable                 ;; 00:1463 $21 $40 $C2
    add  hl, de                                   ;; 00:1466 $19
    ld   [hl], a                                  ;; 00:1467 $77
    ld   hl, data_13A9                            ;; 00:1468 $21 $A9 $13
    add  hl, bc                                   ;; 00:146B $09
    ld   a, [hl]                                  ;; 00:146C $7E
    ld   hl, wEntitiesSpeedYTable                 ;; 00:146D $21 $50 $C2
    add  hl, de                                   ;; 00:1470 $19
    ld   [hl], a                                  ;; 00:1471 $77
    ldh  a, [hLinkDirection]                      ;; 00:1472 $F0 $9E
    ld   hl, wEntitiesSpriteVariantTable          ;; 00:1474 $21 $B0 $C3
    add  hl, de                                   ;; 00:1477 $19
    ld   [hl], a                                  ;; 00:1478 $77
    ld   hl, wEntitiesDirectionTable              ;; 00:1479 $21 $80 $C3
    add  hl, de                                   ;; 00:147C $19
    ld   [hl], a                                  ;; 00:147D $77
    ld   hl, wEntitiesThrownDirectionTable        ;; 00:147E $21 $D0 $C5
    add  hl, de                                   ;; 00:1481 $19
    ld   [hl], a                                  ;; 00:1482 $77
    ld   hl, wEntitiesUnknowTableJ                ;; 00:1483 $21 $F0 $C4
    add  hl, de                                   ;; 00:1486 $19
    ld   [hl], $01                                ;; 00:1487 $36 $01
    pop  bc                                       ;; 00:1489 $C1
    scf                                           ;; 00:148A $37
    ccf                                           ;; 00:148B $3F
    ret                                           ;; 00:148C $C9

UseMagicPowder::
    ld   a, [wLinkAttackStepAnimationCountdown]   ;; 00:148D $FA $9B $C1
    and  a                                        ;; 00:1490 $A7
    ret  nz                                       ;; 00:1491 $C0

    ld   a, [wHasToadstool]                       ;; 00:1492 $FA $4B $DB
    and  a                                        ;; 00:1495 $A7
    jr   z, .jr_14A7                              ;; 00:1496 $28 $0F
    ldh  a, [hLinkPositionZ]                      ;; 00:1498 $F0 $A2
    and  a                                        ;; 00:149A $A7
    ret  nz                                       ;; 00:149B $C0
    ld   a, DIALOG_GOT_TOADSTOOL                  ;; 00:149C $3E $02
    ld   [wDialogGotItem], a                      ;; 00:149E $EA $A9 $C1
    ld   a, $2A                                   ;; 00:14A1 $3E $2A
    ld   [wDialogGotItemCountdown], a             ;; 00:14A3 $EA $AA $C1
    ret                                           ;; 00:14A6 $C9

.jr_14A7
    ld   a, [wMagicPowderCount]                   ;; 00:14A7 $FA $4C $DB
    and  a                                        ;; 00:14AA $A7
    jp   z, PlayWrongAnswerJingle                 ;; 00:14AB $CA $20 $0C

    ld   a, ENTITY_MAGIC_POWDER_SPRINKLE          ;; 00:14AE $3E $08
    call SpawnNewEntity_trampoline                ;; 00:14B0 $CD $86 $3B
    ret  c                                        ;; 00:14B3 $D8
    callsb SprinkleMagicPowder                    ;; 00:14B4 $3E $20 $EA $00 $21 $CD $47 $4C
    ld   a, [wCurrentBank]                        ;; 00:14BC $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:14BF $EA $00 $21
    ret                                           ;; 00:14C2 $C9

; Horizontal speed boost when jumping while using Pegasus Boots
; Indexed by hLinkDirection
PegasusBootsJumpBoostXTable::
    db 28, -28, 0, 0                              ;; 00:14C3

; Vertical speed boost when jumping while using Pegasus Boots
; Indexed by hLinkDirection
PegasusBootsJumpBoostYTable::
    db 0, 0, -28, 28                              ;; 00:14C7

UseRocsFeather::
    ld   a, [wC130]                               ;; 00:14CB $FA $30 $C1
    cp   $07                                      ;; 00:14CE $FE $07
    ret  z                                        ;; 00:14D0 $C8
    ld   a, [wIsLinkInTheAir]                     ;; 00:14D1 $FA $46 $C1
    and  a                                        ;; 00:14D4 $A7
    ret  nz                                       ;; 00:14D5 $C0
    ld   a, $01                                   ;; 00:14D6 $3E $01
    ld   [wIsLinkInTheAir], a                     ;; 00:14D8 $EA $46 $C1
    xor  a                                        ;; 00:14DB $AF
    ld   [wC152], a                               ;; 00:14DC $EA $52 $C1
    ld   [wC153], a                               ;; 00:14DF $EA $53 $C1
    ld   a, JINGLE_FEATHER_JUMP                   ;; 00:14E2 $3E $0D
    ldh  [hJingle], a                             ;; 00:14E4 $E0 $F2
    ldh  a, [hIsSideScrolling]                    ;; 00:14E6 $F0 $F9
    and  a                                        ;; 00:14E8 $A7
    jr   z, .label_1508                           ;; 00:14E9 $28 $1D
    call .label_1508                              ;; 00:14EB $CD $08 $15
    ldh  a, [hPressedButtonsMask]                 ;; 00:14EE $F0 $CB
    and  J_LEFT | J_RIGHT                         ;; 00:14F0 $E6 $03
    ld   a, $EA                                   ;; 00:14F2 $3E $EA
    jr   z, .label_14F8                           ;; 00:14F4 $28 $02
    ld   a, $E8                                   ;; 00:14F6 $3E $E8

.label_14F8
    ldh  [hLinkSpeedY], a                         ;; 00:14F8 $E0 $9B
    xor  a                                        ;; 00:14FA $AF
    ldh  [hLinkVelocityZ], a                      ;; 00:14FB $E0 $A3
    call UpdateFinalLinkPosition                  ;; 00:14FD $CD $A8 $21
    jpsw CheckPositionForMapTransition            ;; 00:1500 $3E $02 $CD $0C $08 $C3 $75 $6C

.label_1508
    ld   a, $20                                   ;; 00:1508 $3E $20
    ldh  [hLinkVelocityZ], a                      ;; 00:150A $E0 $A3

    ; If running with Pegasus Boots, jump further
    ld   a, [wIsRunningWithPegasusBoots]          ;; 00:150C $FA $4A $C1
    and  a                                        ;; 00:150F $A7
    ret  z                                        ;; 00:1510 $C8

    ldh  a, [hLinkDirection]                      ;; 00:1511 $F0 $9E
    ld   e, a                                     ;; 00:1513 $5F
    ld   d, b                                     ;; 00:1514 $50
    ld   hl, PegasusBootsJumpBoostXTable          ;; 00:1515 $21 $C3 $14
    add  hl, de                                   ;; 00:1518 $19
    ld   a, [hl]                                  ;; 00:1519 $7E
    ldh  [hLinkSpeedX], a                         ;; 00:151A $E0 $9A
    ld   hl, PegasusBootsJumpBoostYTable          ;; 00:151C $21 $C7 $14
    add  hl, de                                   ;; 00:151F $19
    ld   a, [hl]                                  ;; 00:1520 $7E
    ldh  [hLinkSpeedY], a                         ;; 00:1521 $E0 $9B
    ret                                           ;; 00:1523 $C9

SwordRandomSfxTable::
    db   NOISE_SFX_SWORD_SWING_A, NOISE_SFX_SWORD_SWING_B, NOISE_SFX_SWORD_SWING_C, NOISE_SFX_SWORD_SWING_D ;; 00:1524

UseSword::
    ld   a, [wC16D]                               ;; 00:1528 $FA $6D $C1
    ld   hl, wIsUsingSpinAttack                   ;; 00:152B $21 $21 $C1
    or   [hl]                                     ;; 00:152E $B6
    ret  nz                                       ;; 00:152F $C0
    ld   a, $03                                   ;; 00:1530 $3E $03
    ld   [wC138], a                               ;; 00:1532 $EA $38 $C1
    ld   a, SWORD_ANIMATION_STATE_DRAW            ;; 00:1535 $3E $01
    ld   [wSwordAnimationState], a                ;; 00:1537 $EA $37 $C1
    ; enable sword collision
    ld   [wSwordCollisionEnabled], a              ;; 00:153A $EA $B0 $C5
    xor  a                                        ;; 00:153D $AF
    ld   [wC160], a                               ;; 00:153E $EA $60 $C1
    ld   [wC1AC], a                               ;; 00:1541 $EA $AC $C1

    ; Play a random SFX
    call GetRandomByte                            ;; 00:1544 $CD $0D $28
    and  $03                                      ;; 00:1547 $E6 $03
    ld   e, a                                     ;; 00:1549 $5F
    ld   d, $00                                   ;; 00:154A $16 $00
    ld   hl, SwordRandomSfxTable                  ;; 00:154C $21 $24 $15
    add  hl, de                                   ;; 00:154F $19
    ld   a, [hl]                                  ;; 00:1550 $7E
    ldh  [hNoiseSfx], a                           ;; 00:1551 $E0 $F4

    call func_157C                                ;; 00:1553 $CD $7C $15
    ld   a, [wIsLinkInTheAir]                     ;; 00:1556 $FA $46 $C1
    and  a                                        ;; 00:1559 $A7
    jr   nz, label_1562                           ;; 00:155A $20 $06
    call ResetSpinAttack                          ;; 00:155C $CD $AF $0C
    call ClearLinkPositionIncrement               ;; 00:155F $CD $8E $17

label_1562::
    ld   a, [wActiveProjectileCount]              ;; 00:1562 $FA $4D $C1
    and  a                                        ;; 00:1565 $A7
    ret  nz                                       ;; 00:1566 $C0
    ld   a, [wFullHearts]                         ;; 00:1567 $FA $A9 $C5
    and  a                                        ;; 00:156A $A7
    ret  z                                        ;; 00:156B $C8
    ld   a, [wSwordLevel]                         ;; 00:156C $FA $4E $DB
    cp   $02                                      ;; 00:156F $FE $02
    ret  nz                                       ;; 00:1571 $C0
    ld   a, ENTITY_SWORD_BEAM                     ;; 00:1572 $3E $DF
    call SpawnPlayerProjectile                    ;; 00:1574 $CD $2F $14

    xor  a                                        ;; 00:1577 $AF
    ld   [wLinkAttackStepAnimationCountdown], a   ;; 00:1578 $EA $9B $C1

    ret                                           ;; 00:157B $C9

func_157C::
    ldh  a, [hPressedButtonsMask]                 ;; 00:157C $F0 $CB
    and  J_RIGHT | J_LEFT | J_UP | J_DOWN         ;; 00:157E $E6 $0F
    ld   e, a                                     ;; 00:1580 $5F
    ld   d, $00                                   ;; 00:1581 $16 $00
    ld   hl, JoypadToLinkDirection                ;; 00:1583 $21 $05 $49
    add  hl, de                                   ;; 00:1586 $19
    ld   a, [hl]                                  ;; 00:1587 $7E
    cp   DIRECTION_KEEP                           ;; 00:1588 $FE $0F
    jr   z, .return                               ;; 00:158A $28 $02
    ldh  [hLinkDirection], a                      ;; 00:158C $E0 $9E
.return
    ret                                           ;; 00:158E $C9

SwordCollisionMapX::
    ; Single sword swing (right-left-top-bottom)
    db $16, $FA, $08, $08                         ;; 00:158F
    ; Spin attack (anti-clockwise from right)
    db $16, $16, $08, $FA, $FA, $FA, $08, $16     ;; 00:1593

SwordCollisionMapY::
    ; Single sword swing (right-left-top-bottom)
    db $08, $08, $FA, $16                         ;; 00:159B
    ; Spin attack (anti-clockwise from right)
    db $08, $16, $16, $16, $08, $FA, $FA, $FA     ;; 00:159F

; Check sword collisions with static elements and objects, then return to bank 2
CheckStaticSwordCollision_trampoline::
    call CheckStaticSwordCollision                ;; 00:15A7 $CD $AF $15
    ld   a, $02                                   ;; 00:15AA $3E $02
    jp   SwitchBank                               ;; 00:15AC $C3 $0C $08

; Check sword collision with static elements (bushes, grasses)
; and items lying on the floor.
CheckStaticSwordCollision::
    ld   a, [wC1C4]                               ;; 00:15AF $FA $C4 $C1
    and  a                                        ;; 00:15B2 $A7
    ret  nz                                       ;; 00:15B3 $C0
    ld   a, [wIsRunningWithPegasusBoots]          ;; 00:15B4 $FA $4A $C1
    and  a                                        ;; 00:15B7 $A7
    jr   nz, .label_15C0                          ;; 00:15B8 $20 $06
    ld   a, [wC16A]                               ;; 00:15BA $FA $6A $C1
    cp   $05                                      ;; 00:15BD $FE $05
    ret  z                                        ;; 00:15BF $C8
.label_15C0

    ; a = IsUsingSpinAttack ? (SwordDirection + 4) : LinkDirection
    ld   a, [wIsUsingSpinAttack]                  ;; 00:15C0 $FA $21 $C1
    and  a                                        ;; 00:15C3 $A7
    jr   z, .notSpinning                          ;; 00:15C4 $28 $07
    ld   a, [wSwordDirection]                     ;; 00:15C6 $FA $36 $C1
    add  a, $04                                   ;; 00:15C9 $C6 $04
    jr   .end                                     ;; 00:15CB $18 $02
.notSpinning
    ldh  a, [hLinkDirection]                      ;; 00:15CD $F0 $9E
.end

    ; Compute the horizontal intersected area
    ld   e, a                                     ;; 00:15CF $5F
    ld   d, $00                                   ;; 00:15D0 $16 $00
    ld   hl, SwordCollisionMapX                   ;; 00:15D2 $21 $8F $15
    add  hl, de                                   ;; 00:15D5 $19
    ldh  a, [hLinkPositionX]                      ;; 00:15D6 $F0 $98
    add  a, [hl]                                  ;; 00:15D8 $86
    sub  a, $08                                   ;; 00:15D9 $D6 $08
    and  $F0                                      ;; 00:15DB $E6 $F0
    ldh  [hIntersectedObjectLeft], a              ;; 00:15DD $E0 $CE

    ; Compute the vertical intersected area
    swap a                                        ;; 00:15DF $CB $37
    ld   c, a                                     ;; 00:15E1 $4F
    ld   hl, SwordCollisionMapY                   ;; 00:15E2 $21 $9B $15
    add  hl, de                                   ;; 00:15E5 $19
    ldh  a, [hLinkPositionY]                      ;; 00:15E6 $F0 $99
    add  a, [hl]                                  ;; 00:15E8 $86
    sub  a, $10                                   ;; 00:15E9 $D6 $10
    and  $F0                                      ;; 00:15EB $E6 $F0
    ldh  [hIntersectedObjectTop], a               ;; 00:15ED $E0 $CD

    ; Set hObjectUnderEntity
    or   c                                        ;; 00:15EF $B1
    ld   e, a                                     ;; 00:15F0 $5F
    ld   hl, wRoomObjects                         ;; 00:15F1 $21 $11 $D7
    add  hl, de                                   ;; 00:15F4 $19
    ld   a, h                                     ;; 00:15F5 $7C
    cp   $D7                                      ;; 00:15F6 $FE $D7
    ret  nz                                       ;; 00:15F8 $C0
    push de                                       ;; 00:15F9 $D5
    ld   a, [hl]                                  ;; 00:15FA $7E
    ldh  [hObjectUnderEntity], a                  ;; 00:15FB $E0 $AF

    ld   e, a                                     ;; 00:15FD $5F
    ld   a, [wIsIndoor]                           ;; 00:15FE $FA $A5 $DB
    ld   d, a                                     ;; 00:1601 $57
    call GetObjectPhysicsFlags_trampoline         ;; 00:1602 $CD $26 $2A
    pop  de                                       ;; 00:1605 $D1

    cp   $D0                                      ;; 00:1606 $FE $D0
    jp   c, .label_1610                           ;; 00:1608 $DA $10 $16

    cp   $D4                                      ;; 00:160B $FE $D4
    jp   c, CheckItemsSwordCollision              ;; 00:160D $DA $C2 $16

.label_1610
    cp   $90                                      ;; 00:1610 $FE $90
    jp   nc, CheckItemsSwordCollision             ;; 00:1612 $D2 $C2 $16

    cp   $01                                      ;; 00:1615 $FE $01
    jp   z, CheckItemsSwordCollision              ;; 00:1617 $CA $C2 $16

    ld   c, $00                                   ;; 00:161A $0E $00
    ld   a, [wIsIndoor]                           ;; 00:161C $FA $A5 $DB
    and  a                                        ;; 00:161F $A7
    ldh  a, [hObjectUnderEntity]                  ;; 00:1620 $F0 $AF
    jr   z, label_1629                            ;; 00:1622 $28 $05

    cp   $DD                                      ;; 00:1624 $FE $DD
    jr   z, label_1637                            ;; 00:1626 $28 $0F

    ret                                           ;; 00:1628 $C9

label_1629::
    inc  c                                        ;; 00:1629 $0C
    cp   $D3                                      ;; 00:162A $FE $D3
    jr   z, label_1637                            ;; 00:162C $28 $09
    cp   $5C                                      ;; 00:162E $FE $5C
    jr   z, label_1637                            ;; 00:1630 $28 $05
    cp   $0A                                      ;; 00:1632 $FE $0A
    ret  nz                                       ;; 00:1634 $C0
    ld   c, $FF                                   ;; 00:1635 $0E $FF

label_1637::
    ld   a, c                                     ;; 00:1637 $79
    ldh  [hActiveEntitySpriteVariant], a          ;; 00:1638 $E0 $F1
    call func_014_5526_trampoline                 ;; 00:163A $CD $78 $21
    ld   a, [wIsRunningWithPegasusBoots]          ;; 00:163D $FA $4A $C1
    and  a                                        ;; 00:1640 $A7
    jr   nz, label_1653                           ;; 00:1641 $20 $10
    ld   a, [wC16A]                               ;; 00:1643 $FA $6A $C1
    cp   $05                                      ;; 00:1646 $FE $05
    jr   nz, label_1653                           ;; 00:1648 $20 $09
    ; reset sword charge
    xor  a                                        ;; 00:164A $AF
    ld   [wSwordCharge], a                        ;; 00:164B $EA $22 $C1
    ld   a, $0C                                   ;; 00:164E $3E $0C
    ld   [wC16D], a                               ;; 00:1650 $EA $6D $C1

label_1653::
    ld   a, ENTITY_LIFTABLE_ROCK                  ;; 00:1653 $3E $05
    call SpawnPlayerProjectile                    ;; 00:1655 $CD $2F $14
    jr   c, .dropRandomItem                       ;; 00:1658 $38 $22

    xor  a                                        ;; 00:165A $AF
    ld   [wLinkAttackStepAnimationCountdown], a   ;; 00:165B $EA $9B $C1

    ld   hl, wEntitiesPosXTable                   ;; 00:165E $21 $00 $C2
    add  hl, de                                   ;; 00:1661 $19
    ldh  a, [hIntersectedObjectLeft]              ;; 00:1662 $F0 $CE
    add  a, $08                                   ;; 00:1664 $C6 $08
    ld   [hl], a                                  ;; 00:1666 $77
    ld   hl, wEntitiesPosYTable                   ;; 00:1667 $21 $10 $C2
    add  hl, de                                   ;; 00:166A $19
    ldh  a, [hIntersectedObjectTop]               ;; 00:166B $F0 $CD
    add  a, $10                                   ;; 00:166D $C6 $10
    ld   [hl], a                                  ;; 00:166F $77
    ld   hl, wEntitiesSpriteVariantTable          ;; 00:1670 $21 $B0 $C3
    add  hl, de                                   ;; 00:1673 $19
    ldh  a, [hActiveEntitySpriteVariant]          ;; 00:1674 $F0 $F1
    ld   [hl], a                                  ;; 00:1676 $77
    ld   c, e                                     ;; 00:1677 $4B
    ld   b, d                                     ;; 00:1678 $42
    call label_3942                               ;; 00:1679 $CD $42 $39

.dropRandomItem
    ; In some random cases, don't drop anything.
    ; (~ 1/8 chance to drop an item)
    call GetRandomByte                            ;; 00:167C $CD $0D $28
    and  $07                                      ;; 00:167F $E6 $07
    ret  nz                                       ;; 00:1681 $C0

    ; If stairs are hiding behind the cut bush, don't drop anything.
    ldh  a, [hObjectUnderEntity]                  ;; 00:1682 $F0 $AF
    cp   OBJECT_BUSH_GROUND_STAIRS                ;; 00:1684 $FE $D3
    ret  z                                        ;; 00:1686 $C8

    ; Randomly drop a rupee or heart
    call GetRandomByte                            ;; 00:1687 $CD $0D $28
    rra                                           ;; 00:168A $1F
    ld   a, ENTITY_DROPPABLE_RUPEE                ;; 00:168B $3E $2E
    jr   nc, .randomEnd                           ;; 00:168D $30 $02
    ld   a, ENTITY_DROPPABLE_HEART                ;; 00:168F $3E $2D
.randomEnd
    call SpawnNewEntity_trampoline                ;; 00:1691 $CD $86 $3B
    ret  c                                        ;; 00:1694 $D8

    ; Configure the dropped entity
    ld   hl, wEntitiesPosXTable                   ;; 00:1695 $21 $00 $C2
    add  hl, de                                   ;; 00:1698 $19
    ldh  a, [hIntersectedObjectLeft]              ;; 00:1699 $F0 $CE
    add  a, $08                                   ;; 00:169B $C6 $08
    ld   [hl], a                                  ;; 00:169D $77
    ld   hl, wEntitiesPosYTable                   ;; 00:169E $21 $10 $C2
    add  hl, de                                   ;; 00:16A1 $19
    ldh  a, [hIntersectedObjectTop]               ;; 00:16A2 $F0 $CD
    add  a, $10                                   ;; 00:16A4 $C6 $10
    ld   [hl], a                                  ;; 00:16A6 $77
    ld   hl, wEntitiesSlowTransitionCountdownTable ;; 00:16A7 $21 $50 $C4
    add  hl, de                                   ;; 00:16AA $19
    ld   [hl], $80                                ;; 00:16AB $36 $80
    ld   hl, wEntitiesPrivateCountdown1Table      ;; 00:16AD $21 $F0 $C2
    add  hl, de                                   ;; 00:16B0 $19
    ld   [hl], $18                                ;; 00:16B1 $36 $18
    ld   hl, wEntitiesSpeedZTable                 ;; 00:16B3 $21 $20 $C3
    add  hl, de                                   ;; 00:16B6 $19
    ld   [hl], $10                                ;; 00:16B7 $36 $10
    ret                                           ;; 00:16B9 $C9

LinkDirectionToSwordCollisionRangeX::
.right: db  $12                                    ;; 00:16BA
.left:  db  $EE                                    ;; 00:16BB
.up:    db  $FC                                    ;; 00:16BC
.down:  db  4                                      ;; 00:16BD

LinkDirectionToSwordCollisionRangeY::
.right: db  4                                      ;; 00:16BE
.left:  db  4                                      ;; 00:16BF
.up:    db  $EE                                    ;; 00:16C0
.down:  db  $12                                    ;; 00:16C1

; Check sword collision with items lying on the ground
CheckItemsSwordCollision::
    ld   c, a                                     ;; 00:16C2 $4F
    ld   a, [wC16D]                               ;; 00:16C3 $FA $6D $C1
    and  a                                        ;; 00:16C6 $A7
    ret  z                                        ;; 00:16C7 $C8
    ldh  a, [hLinkDirection]                      ;; 00:16C8 $F0 $9E
    ld   e, a                                     ;; 00:16CA $5F
    ld   d, $00                                   ;; 00:16CB $16 $00
    ld   hl, LinkDirectionToSwordCollisionRangeX  ;; 00:16CD $21 $BA $16
    add  hl, de                                   ;; 00:16D0 $19
    ldh  a, [hLinkPositionX]                      ;; 00:16D1 $F0 $98
    add  a, [hl]                                  ;; 00:16D3 $86
    ldh  [hMultiPurpose0], a                      ;; 00:16D4 $E0 $D7
    ld   hl, LinkDirectionToSwordCollisionRangeY  ;; 00:16D6 $21 $BE $16
    add  hl, de                                   ;; 00:16D9 $19
    ldh  a, [hLinkPositionY]                      ;; 00:16DA $F0 $99
    add  a, [hl]                                  ;; 00:16DC $86
    ldh  [hMultiPurpose1], a                      ;; 00:16DD $E0 $D8
    ld   a, $04                                   ;; 00:16DF $3E $04
    ld   [wC502], a                               ;; 00:16E1 $EA $02 $C5
    call label_D15                                ;; 00:16E4 $CD $15 $0D
    ld   a, $10                                   ;; 00:16E7 $3E $10
    ld   [wC1C4], a                               ;; 00:16E9 $EA $C4 $C1
    ld   a, c                                     ;; 00:16EC $79
    and  $F0                                      ;; 00:16ED $E6 $F0
    cp   $90                                      ;; 00:16EF $FE $90
    jr   z, .label_16F8                           ;; 00:16F1 $28 $05
    ld   a, JINGLE_SWORD_POKING                   ;; 00:16F3 $3E $07
    ldh  [hJingle], a                             ;; 00:16F5 $E0 $F2
    ret                                           ;; 00:16F7 $C9

.label_16F8
    ld   a, NOISE_SFX_CLINK                       ;; 00:16F8 $3E $17
    ldh  [hNoiseSfx], a                           ;; 00:16FA $E0 $F4
    ret                                           ;; 00:16FC $C9

XPositionIncrementPegasusRunning::
.right: db  32                                     ;; 00:16FD
.left:  db  -32                                    ;; 00:16FE
.up:    db  0                                      ;; 00:16FF
.down:  db  0                                      ;; 00:1700

YPositionIncrementPegasusRunning::
.right: db  0                                      ;; 00:1701
.left:  db  0                                      ;; 00:1702
.up:    db  -32                                    ;; 00:1703
.down:  db  32                                     ;; 00:1704

UsePegasusBoots::
    ; Disable running with Pegasus Boots vertically in side-scrolling sections
    ldh  a, [hIsSideScrolling]                    ;; 00:1705 $F0 $F9
    and  a                                        ;; 00:1707 $A7
    jr   z, .sideScrollingEnd                     ;; 00:1708 $28 $09
    ldh  a, [hLinkPhysicsModifier]                ;; 00:170A $F0 $9C
    and  a                                        ;; 00:170C $A7
    ret  nz                                       ;; 00:170D $C0
    ldh  a, [hLinkDirection]                      ;; 00:170E $F0 $9E
    and  DIRECTION_VERTICAL_MASK                  ;; 00:1710 $E6 $02
    ret  nz                                       ;; 00:1712 $C0
.sideScrollingEnd

    ld   a, [wIsRunningWithPegasusBoots]          ;; 00:1713 $FA $4A $C1
    and  a                                        ;; 00:1716 $A7
    ret  nz                                       ;; 00:1717 $C0

    ; Don't apply running effect when in the air
    ldh  a, [hLinkPositionZ]                      ;; 00:1718 $F0 $A2
    ld   hl, wIsLinkInTheAir                      ;; 00:171A $21 $46 $C1
    or   [hl]                                     ;; 00:171D $B6
    ret  nz                                       ;; 00:171E $C0

    ; Increment wConsecutiveStepsCount
    ld   a, [wConsecutiveStepsCount]              ;; 00:171F $FA $20 $C1
    add  a, $02                                   ;; 00:1722 $C6 $02
    ld   [wConsecutiveStepsCount], a              ;; 00:1724 $EA $20 $C1

    call DisplayTransientVfxForLinkRunning        ;; 00:1727 $CD $56 $17

    ; Increment wPegasusBootsChargeMeter
    ld   a, [wPegasusBootsChargeMeter]            ;; 00:172A $FA $4B $C1
    inc  a                                        ;; 00:172D $3C
    ld   [wPegasusBootsChargeMeter], a            ;; 00:172E $EA $4B $C1

    cp   MAX_PEGASUS_BOOTS_CHARGE                 ;; 00:1731 $FE $20
    ret  nz                                       ;; 00:1733 $C0

    ld   [wIsRunningWithPegasusBoots], a          ;; 00:1734 $EA $4A $C1

    ; reset spin marker and sword charge
    xor  a                                        ;; 00:1737 $AF
    ld   [wIsUsingSpinAttack], a                  ;; 00:1738 $EA $21 $C1
    ld   [wSwordCharge], a                        ;; 00:173B $EA $22 $C1
    ldh  a, [hLinkDirection]                      ;; 00:173E $F0 $9E
    ld   e, a                                     ;; 00:1740 $5F
    ld   d, $00                                   ;; 00:1741 $16 $00
    ld   hl, XPositionIncrementPegasusRunning     ;; 00:1743 $21 $FD $16
    add  hl, de                                   ;; 00:1746 $19
    ld   a, [hl]                                  ;; 00:1747 $7E
    ldh  [hLinkSpeedX], a                         ;; 00:1748 $E0 $9A
    ld   hl, YPositionIncrementPegasusRunning     ;; 00:174A $21 $01 $17
    add  hl, de                                   ;; 00:174D $19
    ld   a, [hl]                                  ;; 00:174E $7E
    ldh  [hLinkSpeedY], a                         ;; 00:174F $E0 $9B
    xor  a                                        ;; 00:1751 $AF
    ld   [wC1AC], a                               ;; 00:1752 $EA $AC $C1
    ret                                           ;; 00:1755 $C9

; When Link is running using Pegasus Boots, display a transient VFX
; every 8 frame.
;
; The effect may be either the boots dust poofs (when running on the ground),
; or water splashes (when running on shallow water).
DisplayTransientVfxForLinkRunning::
    ldh  a, [hFrameCounter]                       ;; 00:1756 $F0 $E7
    and  $07                                      ;; 00:1758 $E6 $07
    ld   hl, hLinkPositionZ                       ;; 00:175A $21 $A2 $FF
    or   [hl]                                     ;; 00:175D $B6
    ld   hl, hLinkInteractiveMotionBlocked        ;; 00:175E $21 $A1 $FF
    or   [hl]                                     ;; 00:1761 $B6
    ld   hl, wIsLinkInTheAir                      ;; 00:1762 $21 $46 $C1
    or   [hl]                                     ;; 00:1765 $B6
    ret  nz                                       ;; 00:1766 $C0

    ldh  a, [hLinkPositionX]                      ;; 00:1767 $F0 $98
    ldh  [hMultiPurpose0], a                      ;; 00:1769 $E0 $D7

    ld   a, [wLinkObjectPhysics]                  ;; 00:176B $FA $81 $C1
    cp   OBJ_PHYSICS_SHALLOW_WATER                ;; 00:176E $FE $05
    jr   z, .shallowWater                         ;; 00:1770 $28 $0F

    ld   a, NOISE_SFX_FOOTSTEP                    ;; 00:1772 $3E $07
    ldh  [hNoiseSfx], a                           ;; 00:1774 $E0 $F4
    ldh  a, [hLinkPositionY]                      ;; 00:1776 $F0 $99
    add  a, $06                                   ;; 00:1778 $C6 $06
    ldh  [hMultiPurpose1], a                      ;; 00:177A $E0 $D8
    ld   a, TRANSCIENT_VFX_PEGASUS_DUST           ;; 00:177C $3E $0B
    jp   AddTranscientVfx                         ;; 00:177E $C3 $C7 $0C

.shallowWater
    ldh  a, [hLinkPositionY]                      ;; 00:1781 $F0 $99
    ldh  [hMultiPurpose1], a                      ;; 00:1783 $E0 $D8
    ld   a, JINGLE_WATER_SPLASH                   ;; 00:1785 $3E $0E
    ldh  [hJingle], a                             ;; 00:1787 $E0 $F2
    ld   a, TRANSCIENT_VFX_PEGASUS_SPLASH         ;; 00:1789 $3E $0C
    jp   AddTranscientVfx                         ;; 00:178B $C3 $C7 $0C

ClearLinkPositionIncrement::
    xor  a                                        ;; 00:178E $AF
    ldh  [hLinkSpeedX], a                         ;; 00:178F $E0 $9A
    ldh  [hLinkSpeedY], a                         ;; 00:1791 $E0 $9B
    ret                                           ;; 00:1793 $C9

; Animate Link motion?
ApplyLinkMotionState::
    call func_002_753A                            ;; 00:1794 $CD $3A $75
.skipInitialCall
    ld   a, [wLinkMotionState]                    ;; 00:1797 $FA $1C $C1
    cp   LINK_MOTION_SWIMMING                     ;; 00:179A $FE $01
    ret  z                                        ;; 00:179C $C8

    ld   a, [wC16A]                               ;; 00:179D $FA $6A $C1
    and  a                                        ;; 00:17A0 $A7
    jr   z, .label_17DB                           ;; 00:17A1 $28 $38
    ld   bc, wLinkOAMBuffer+$10                   ;; 00:17A3 $01 $10 $C0
    ld   a, [wC145]                               ;; 00:17A6 $FA $45 $C1
    ld   hl, wC13B                                ;; 00:17A9 $21 $3B $C1
    add  a, [hl]                                  ;; 00:17AC $86
    ldh  [hMultiPurpose0], a                      ;; 00:17AD $E0 $D7
    ldh  a, [hLinkPositionX]                      ;; 00:17AF $F0 $98
    ldh  [hMultiPurpose1], a                      ;; 00:17B1 $E0 $D8
    ld   hl, hMultiPurpose3                       ;; 00:17B3 $21 $DA $FF
    ld   [hl], $00                                ;; 00:17B6 $36 $00
    ld   a, [wSwordCharge]                        ;; 00:17B8 $FA $22 $C1
    cp   MAX_SWORD_CHARGE                         ;; 00:17BB $FE $28
    jr   c, .label_17C6                           ;; 00:17BD $38 $07
    ldh  a, [hFrameCounter]                       ;; 00:17BF $F0 $E7
    rla                                           ;; 00:17C1 $17
    rla                                           ;; 00:17C2 $17
    and  $10                                      ;; 00:17C3 $E6 $10
    ld   [hl], a                                  ;; 00:17C5 $77

.label_17C6
    ld   a, [wC139]                               ;; 00:17C6 $FA $39 $C1
    ld   h, a                                     ;; 00:17C9 $67
    ld   a, [wC13A]                               ;; 00:17CA $FA $3A $C1
    ld   l, a                                     ;; 00:17CD $6F
    ld   a, [wSwordDirection]                     ;; 00:17CE $FA $36 $C1
    ldh  [hMultiPurpose2], a                      ;; 00:17D1 $E0 $D9
    ldh  a, [hLinkPositionY]                      ;; 00:17D3 $F0 $99
    cp   $88                                      ;; 00:17D5 $FE $88
    ret  nc                                       ;; 00:17D7 $D0
    jp   func_1819                                ;; 00:17D8 $C3 $19 $18

.label_17DB
    ld   a, [wLinkAttackStepAnimationCountdown]   ;; 00:17DB $FA $9B $C1
    push af                                       ;; 00:17DE $F5
    bit  7, a ; extract the highest-bit (ATTACK_STEP_ITEM_MAGIC_ROD) ;; 00:17DF $CB $7F
    jp   z, .magicRodEnd                          ;; 00:17E1 $CA $14 $18

    ;
    ; The attack step was triggered by firing the magic rod
    ;

    callsw label_002_5310                         ;; 00:17E4 $3E $02 $CD $0C $08 $CD $10 $53

    ; If this is exactly the second frame of the magic rod attack step animation…
    ld   a, [wLinkAttackStepAnimationCountdown]   ;; 00:17EC $FA $9B $C1
    and  ATTACK_STEP_DURATION_MASK                ;; 00:17EF $E6 $7F
    cp   $0C                                      ;; 00:17F1 $FE $0C
    jr   nz, .magicRodEnd                         ;; 00:17F3 $20 $1F
    ; … and no dialog or room transition is happening…
    ld   hl, wDialogState                         ;; 00:17F5 $21 $9F $C1
    ld   a, [wRoomTransitionState]                ;; 00:17F8 $FA $24 $C1
    or   [hl]                                     ;; 00:17FB $B6
    jr   nz, .magicRodEnd                         ;; 00:17FC $20 $16
    ; … fire a magic rod fireball projectile
    call func_157C                                ;; 00:17FE $CD $7C $15
    ld   a, ENTITY_MAGIC_ROD_FIREBALL             ;; 00:1801 $3E $04
    call SpawnPlayerProjectile                    ;; 00:1803 $CD $2F $14
    jr   c, .magicRodEnd                          ;; 00:1806 $38 $0C
    ld   a, NOISE_SFX_MAGIC_ROD                   ;; 00:1808 $3E $0D
    ldh  [hNoiseSfx], a                           ;; 00:180A $E0 $F4
    callsw label_002_538B                         ;; 00:180C $3E $02 $CD $0C $08 $CD $8B $53
.magicRodEnd

    pop  af                                       ;; 00:1814 $F1
    ld   [wLinkAttackStepAnimationCountdown], a   ;; 00:1815 $EA $9B $C1
    ret                                           ;; 00:1818 $C9

func_1819::
    callsb func_020_4AB3                          ;; 00:1819 $3E $20 $EA $00 $21 $CD $B3 $4A
    ld   a, [wCurrentBank]                        ;; 00:1821 $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:1824 $EA $00 $21
    ret                                           ;; 00:1827 $C9

func_1828::
    callsb func_020_49BA                          ;; 00:1828 $3E $20 $EA $00 $21 $CD $BA $49
    ld   a, [wCurrentBank]                        ;; 00:1830 $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:1833 $EA $00 $21
    ret                                           ;; 00:1836 $C9

LinkMotionMapFadeOutHandler::
    call func_002_754F                            ;; 00:1837 $CD $4F $75
    ld   a, [wC3C9]                               ;; 00:183A $FA $C9 $C3
    and  a                                        ;; 00:183D $A7
    jr   z, .label_1847                           ;; 00:183E $28 $07
    xor  a                                        ;; 00:1840 $AF
    ld   [wC3C9], a                               ;; 00:1841 $EA $C9 $C3
    jp   ApplyMapFadeOutTransitionWithNoise       ;; 00:1844 $C3 $7D $0C

.label_1847
    call func_1A22                                ;; 00:1847 $CD $22 $1A
    xor  a                                        ;; 00:184A $AF
    ld   [wScreenShakeCountdown], a               ;; 00:184B $EA $57 $C1
    inc  a                                        ;; 00:184E $3C
    ld   [wC1A8], a                               ;; 00:184F $EA $A8 $C1
    ld   a, [wTransitionSequenceCounter]          ;; 00:1852 $FA $6B $C1
    cp   $04                                      ;; 00:1855 $FE $04
    jp   nz, SetSpawnLocation.return              ;; 00:1857 $C2 $D9 $19
    xor  a                                        ;; 00:185A $AF
    ldh  [hBaseScrollX], a                        ;; 00:185B $E0 $96
    ldh  [hBaseScrollY], a                        ;; 00:185D $E0 $97
    ldh  [hDungeonTitleMessageCountdown], a       ;; 00:185F $E0 $B4
    ld   [wBGPaletteTransitionEffect], a          ;; 00:1861 $EA $D6 $DD
    ld   [wDDD7], a                               ;; 00:1864 $EA $D7 $DD

    ld   e, $10                                   ;; 00:1867 $1E $10
    ld   hl, wEntitiesStatusTable                 ;; 00:1869 $21 $80 $C2
.clearEntitiesStatusLoop
    ldi  [hl], a                                  ;; 00:186C $22
    dec  e                                        ;; 00:186D $1D
    jr   nz, .clearEntitiesStatusLoop             ;; 00:186E $20 $FC

    ld   a, [wItemPickedUpInShop]                 ;; 00:1870 $FA $09 $C5
    and  a                                        ;; 00:1873 $A7
    jr   z, .label_1898                           ;; 00:1874 $28 $22
    push af                                       ;; 00:1876 $F5
    ld   a, BANK(label_004_7A5F)                  ;; 00:1877 $3E $04
    call SwitchBank                               ;; 00:1879 $CD $0C $08
    pop  af                                       ;; 00:187C $F1
    call label_004_7A5F                           ;; 00:187D $CD $5F $7A
    ld   hl, wIsThief                             ;; 00:1880 $21 $6E $DB
    inc  [hl]                                     ;; 00:1883 $34
    ld   hl, wHasStolenFromShop                   ;; 00:1884 $21 $46 $DB
    inc  [hl]                                     ;; 00:1887 $34
    ld   a, [wPhotos1]                            ;; 00:1888 $FA $0C $DC
    or   $40                                      ;; 00:188B $F6 $40
    ld   [wPhotos1], a                            ;; 00:188D $EA $0C $DC
    ld   a, $01                                   ;; 00:1890 $3E $01
    ld   [wDidStealItem], a                       ;; 00:1892 $EA $7E $D4
    xor  a                                        ;; 00:1895 $AF
    ldh  [hLinkAnimationState], a                 ;; 00:1896 $E0 $9D

.label_1898
    ldh  a, [hIsSideScrolling]                    ;; 00:1898 $F0 $F9
    ldh  [hMultiPurposeD], a                      ;; 00:189A $E0 $E4
    ld   a, GAMEPLAY_WORLD                        ;; 00:189C $3E $0B
    ld   [wGameplayType], a                       ;; 00:189E $EA $95 $DB
    xor  a                                        ;; 00:18A1 $AF
    ld   [wGameplaySubtype], a                    ;; 00:18A2 $EA $96 $DB
    ld   [wObjectAffectingBGPalette], a           ;; 00:18A5 $EA $CB $C3
    ldh  [hIsSideScrolling], a                    ;; 00:18A8 $E0 $F9
    ld   hl, wWarpStructs                         ;; 00:18AA $21 $01 $D4
    ld   a, [wIsIndoor]                           ;; 00:18AD $FA $A5 $DB
    ldh  [hFreeWarpDataAddress], a                ;; 00:18B0 $E0 $E6
    and  a                                        ;; 00:18B2 $A7
    jr   nz, .label_18DF                          ;; 00:18B3 $20 $2A
    ld   hl, wWarpPositions                       ;; 00:18B5 $21 $16 $D4
    ld   c, $00                                   ;; 00:18B8 $0E $00

; Loop over the four possible warp tile position in the current room and
; compare them with Link's position. For Link's tile position, we use
; the tile that is under the pixel in the center of Link's sprite.
; If a warp tile is found, the index is stored in c. If not tile is
; found, then c=4 after this loop, which is an unintended value and
; a reason for the dog house glitch.
.loop
    ldh  a, [hLinkPositionX]                      ;; 00:18BA $F0 $98
    swap a                                        ;; 00:18BC $CB $37
    and  $0F                                      ;; 00:18BE $E6 $0F
    ld   e, a                                     ;; 00:18C0 $5F
    ldh  a, [hLinkPositionY]                      ;; 00:18C1 $F0 $99
    sub  a, $08                                   ;; 00:18C3 $D6 $08
    and  $F0                                      ;; 00:18C5 $E6 $F0
    or   e                                        ;; 00:18C7 $B3
    cp   [hl]                                     ;; 00:18C8 $BE
    jr   z, .break                                ;; 00:18C9 $28 $07
    inc  hl                                       ;; 00:18CB $23
    inc  c                                        ;; 00:18CC $0C
    ld   a, c                                     ;; 00:18CD $79
    cp   $04                                      ;; 00:18CE $FE $04
    jr   nz, .loop                                ;; 00:18D0 $20 $E8

.break
    ; de = 5*c
    ld   a, c                                     ;; 00:18D2 $79
    sla  a                                        ;; 00:18D3 $CB $27
    sla  a                                        ;; 00:18D5 $CB $27
    add  a, c                                     ;; 00:18D7 $81
    ld   e, a                                     ;; 00:18D8 $5F
    ld   d, $00                                   ;; 00:18D9 $16 $00
    ; hl = start of the c'th warp struct
    ld   hl, wWarp0MapCategory                    ;; 00:18DB $21 $01 $D4
    add  hl, de                                   ;; 00:18DE $19

.label_18DF
    push hl                                       ;; 00:18DF $E5
    ld   a, [hli]                                 ;; 00:18E0 $2A
    ld   [wIsIndoor], a                           ;; 00:18E1 $EA $A5 $DB
    cp   $02                                      ;; 00:18E4 $FE $02
    jr   nz, .label_18F2                          ;; 00:18E6 $20 $0A
    ldh  [hIsSideScrolling], a                    ;; 00:18E8 $E0 $F9
    dec  a                                        ;; 00:18EA $3D
    ld   [wIsIndoor], a                           ;; 00:18EB $EA $A5 $DB
    ld   a, $01                                   ;; 00:18EE $3E $01
    ldh  [hLinkPhysicsModifier], a                ;; 00:18F0 $E0 $9C

.label_18F2
    ld   a, [hli]                                 ;; 00:18F2 $2A
    ldh  [hMapId], a                              ;; 00:18F3 $E0 $F7
    ld   a, [wIsIndoor]                           ;; 00:18F5 $FA $A5 $DB
    and  a                                        ;; 00:18F8 $A7
    ld   a, [hli]                                 ;; 00:18F9 $2A
    ldh  [hMapRoom], a                            ;; 00:18FA $E0 $F6
    jr   nz, .label_1909                          ;; 00:18FC $20 $0B
    ldh  a, [hFreeWarpDataAddress]                ;; 00:18FE $F0 $E6
    and  a                                        ;; 00:1900 $A7
    jr   z, .label_1907                           ;; 00:1901 $28 $04
    xor  a                                        ;; 00:1903 $AF
    ld   [wActivePowerUp], a            ; Clear any active powerup on room change ;; 00:1904 $EA $7C $D4

.label_1907
    jr   .label_196F                              ;; 00:1907 $18 $66

.label_1909
    ld   c, a                                     ;; 00:1909 $4F
    ld   a, $14                                   ;; 00:190A $3E $14
    call SwitchBank                               ;; 00:190C $CD $0C $08
    push hl                                       ;; 00:190F $E5
    ; This code tries to set de = 64*[hMapId].
    ; However, it assumes that [hMapId] < $10, i.e. that the upper
    ; nibble is 0. If [hMapId] >= $10, the result will be wrong.
    ; Probably does not matter, since maps with id > $0A do not have
    ; a map layout.
    ldh  a, [hMapId]                              ;; 00:1910 $F0 $F7
    swap a                                        ;; 00:1912 $CB $37
    ld   e, a                                     ;; 00:1914 $5F
    ld   d, $00                                   ;; 00:1915 $16 $00
    sla  e                                        ;; 00:1917 $CB $23
    rl   d                                        ;; 00:1919 $CB $12
    sla  e                                        ;; 00:191B $CB $23
    rl   d                                        ;; 00:191D $CB $12
    ld   hl, MapLayout0                           ;; 00:191F $21 $20 $42
    add  hl, de                                   ;; 00:1922 $19
    ldh  a, [hMapId]                              ;; 00:1923 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:1925 $FE $FF
    jr   nz, .colorDungeonEnd                     ;; 00:1927 $20 $05
    ld   hl, MapLayout11                          ;; 00:1929 $21 $E0 $44
    jr   .label_193C                              ;; 00:192C $18 $0E
.colorDungeonEnd

    cp   MAP_EAGLES_TOWER           ; Is this Eagle's Tower? ;; 00:192E $FE $06
    jr   nz, .label_193C            ; If not, skip this... ;; 00:1930 $20 $0A
    ld   a, [wHasInstrument7]       ; Otherwise, check if the pillars have all been dunked... ;; 00:1932 $FA $6B $DB
    and  $04                                      ;; 00:1935 $E6 $04
    jr   z, .label_193C             ; If not, skip this... ;; 00:1937 $28 $03
    ld   hl, MapLayout12            ; Otherwise, swap to the alternate Eagle's Tower map (post-3F collapse) ;; 00:1939 $21 $20 $45

.label_193C
    ld   e, $00                                   ;; 00:193C $1E $00

; Search the room with id c in the map layout...
.loop_193E
    ld   a, [hli]                                 ;; 00:193E $2A
    cp   c                                        ;; 00:193F $B9
    jr   z, .break_1948                           ;; 00:1940 $28 $06
    inc  e                                        ;; 00:1942 $1C
    ld   a, e                                     ;; 00:1943 $7B
    cp   $40                                      ;; 00:1944 $FE $40
    jr   nz, .loop_193E                           ;; 00:1946 $20 $F6
.break_1948

; ...and save the position of the room in [wIndoorRoom].
    ld   a, e                                     ;; 00:1948 $7B
    ld   [wIndoorRoom], a                         ;; 00:1949 $EA $AE $DB

    ldh  a, [hFreeWarpDataAddress]                ;; 00:194C $F0 $E6
    and  a                                        ;; 00:194E $A7
    jr   nz, .label_196E                          ;; 00:194F $20 $1D
    xor  a                                        ;; 00:1951 $AF
    ld   [wActivePowerUp], a        ; Clear any active powerup ;; 00:1952 $EA $7C $D4
    ldh  a, [hMapId]                              ;; 00:1955 $F0 $F7
    cp   MAP_CAVE_B                               ;; 00:1957 $FE $0A
    jr   nc, .label_196E                          ;; 00:1959 $30 $13
    callsw LoadMinimap                            ;; 00:195B $3E $02 $CD $0C $08 $CD $09 $67
    ld   a, $30                                   ;; 00:1963 $3E $30
    ldh  [hDungeonTitleMessageCountdown], a       ;; 00:1965 $E0 $B4
    xor  a                                        ;; 00:1967 $AF
    ld   [wSwitchBlocksState], a                  ;; 00:1968 $EA $FB $D6
    ld   [wSwitchableObjectAnimationStage], a     ;; 00:196B $EA $F8 $D6

.label_196E
    pop  hl                                       ;; 00:196E $E1

.label_196F
    ld   a, [hli]                                 ;; 00:196F $2A
    ld   [wMapEntrancePositionX], a               ;; 00:1970 $EA $9D $DB
    ld   a, [hl]                                  ;; 00:1973 $7E
    ld   [wMapEntrancePositionY], a               ;; 00:1974 $EA $9E $DB
    pop  hl                                       ;; 00:1977 $E1
    ldh  a, [hIsSideScrolling]                    ;; 00:1978 $F0 $F9
    and  a                                        ;; 00:197A $A7
    jr   nz, label_19DA                           ;; 00:197B $20 $5D
    ldh  a, [hMultiPurposeD]                      ;; 00:197D $F0 $E4
    and  a                                        ;; 00:197F $A7
    jr   nz, SetSpawnLocation.return              ;; 00:1980 $20 $57
    ld   a, [wIsIndoor]                           ;; 00:1982 $FA $A5 $DB
    and  a                                        ;; 00:1985 $A7
    jr   z, SetSpawnLocation                      ;; 00:1986 $28 $3A
    ldh  a, [hMapId]                              ;; 00:1988 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:198A $FE $FF
    jr   nz, .label_1993                          ;; 00:198C $20 $05
    ld   hl, Data_014_4E3C                        ;; 00:198E $21 $3C $4E
    jr   .label_19A4                              ;; 00:1991 $18 $11

.label_1993
    cp   $0A                                      ;; 00:1993 $FE $0A
    jr   nc, SetSpawnLocation                     ;; 00:1995 $30 $2B
    ld   e, a                                     ;; 00:1997 $5F
    sla  a                                        ;; 00:1998 $CB $27
    sla  a                                        ;; 00:199A $CB $27
    add  a, e                                     ;; 00:199C $83
    ld   e, a                                     ;; 00:199D $5F
    ld   d, $00                                   ;; 00:199E $16 $00
    ld   hl, Data_014_4DF1                        ;; 00:19A0 $21 $F1 $4D
    add  hl, de                                   ;; 00:19A3 $19

.label_19A4
    ld   a, $14                                   ;; 00:19A4 $3E $14
    ld   [rSelectROMBank], a                      ;; 00:19A6 $EA $00 $21
    call SetSpawnLocation                         ;; 00:19A9 $CD $C2 $19
    push de                                       ;; 00:19AC $D5
    ldh  a, [hMapId]                              ;; 00:19AD $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:19AF $FE $FF
    jr   nz, .label_19B7                          ;; 00:19B1 $20 $04
    ld   a, $3A                                   ;; 00:19B3 $3E $3A
    jr   .label_19BF                              ;; 00:19B5 $18 $08

.label_19B7
    ld   e, a                                     ;; 00:19B7 $5F
    ld   d, $00                                   ;; 00:19B8 $16 $00
    ld   hl, Data_014_4E41                        ;; 00:19BA $21 $41 $4E
    add  hl, de                                   ;; 00:19BD $19
    ld   a, [hl]                                  ;; 00:19BE $7E

.label_19BF
    pop  de                                       ;; 00:19BF $D1
    ld   [de], a                                  ;; 00:19C0 $12
    ret                                           ;; 00:19C1 $C9

; Record Link's spawn point, that will be used when loading the save file
; or starting after a game over.
SetSpawnLocation::
    ; Initialize counter
IF __OPTIMIZATIONS_1__
    xor  a
ELSE
    ld   a, $00                                   ;; 00:19C2 $3E $00
ENDC
    ldh  [hMultiPurpose0], a                      ;; 00:19C4 $E0 $D7
    ld   de, wSpawnLocationData                   ;; 00:19C6 $11 $5F $DB

    ; Copy warp data (5 bytes) from wWarp1 to wSpawnLocationData
.loop
    ld   a, [hli]                                 ;; 00:19C9 $2A
    ld   [de], a                                  ;; 00:19CA $12
    inc  de                                       ;; 00:19CB $13
    ldh  a, [hMultiPurpose0]                      ;; 00:19CC $F0 $D7
    inc  a                                        ;; 00:19CE $3C
    ldh  [hMultiPurpose0], a                      ;; 00:19CF $E0 $D7
    cp   $05                                      ;; 00:19D1 $FE $05
    jr   nz, .loop                                ;; 00:19D3 $20 $F4

    ; Save the indoor room
    ld   a, [wIndoorRoom]                         ;; 00:19D5 $FA $AE $DB
    ld   [de], a                                  ;; 00:19D8 $12

.return
    ret                                           ;; 00:19D9 $C9

label_19DA::
    xor  a                                        ;; 00:19DA $AF
    ldh  [hLinkDirection], a                      ;; 00:19DB $E0 $9E
    ret                                           ;; 00:19DD $C9

LinkMotionMapFadeInHandler::
    call func_002_754F                            ;; 00:19DE $CD $4F $75
    ld   a, [wD474]                               ;; 00:19E1 $FA $74 $D4
    and  a                                        ;; 00:19E4 $A7
    jr   z, .label_19FC                           ;; 00:19E5 $28 $15
    xor  a                                        ;; 00:19E7 $AF
    ld   [wD474], a                               ;; 00:19E8 $EA $74 $D4
    ld   a, $30                                   ;; 00:19EB $3E $30
    ld   [wTransitionGfxFrameCount], a            ;; 00:19ED $EA $80 $C1
    ld   a, TRANSITION_GFX_MANBO_OUT              ;; 00:19F0 $3E $03
    ld   [wTransitionGfx], a                      ;; 00:19F2 $EA $7F $C1
    ld   a, $04                                   ;; 00:19F5 $3E $04
    ld   [wTransitionSequenceCounter], a          ;; 00:19F7 $EA $6B $C1
    jr   .label_1A06                              ;; 00:19FA $18 $0A

.label_19FC
    call func_1A39                                ;; 00:19FC $CD $39 $1A
    ld   a, [wTransitionSequenceCounter]          ;; 00:19FF $FA $6B $C1
    cp   $04                                      ;; 00:1A02 $FE $04
IF __OPTIMIZATIONS_1__
    ret  nz
ELSE
    jr   nz, .return                              ;; 00:1A04 $20 $1B
ENDC

.label_1A06
    ld   a, [wD463]                               ;; 00:1A06 $FA $63 $D4
    cp   $01                                      ;; 00:1A09 $FE $01
    jr   z, .label_1A0F                           ;; 00:1A0B $28 $02
    ld   a, LINK_MOTION_DEFAULT                   ;; 00:1A0D $3E $00

.label_1A0F
    ld   [wLinkMotionState], a                    ;; 00:1A0F $EA $1C $C1
    ld   a, [wDidStealItem]                       ;; 00:1A12 $FA $7E $D4
    and  a                                        ;; 00:1A15 $A7
IF __OPTIMIZATIONS_1__
    ret  z
ELSE
    jr   z, .return                               ;; 00:1A16 $28 $09
ENDC
    xor  a                                        ;; 00:1A18 $AF
    ld   [wDidStealItem], a                       ;; 00:1A19 $EA $7E $D4
    jp_open_dialog Dialog036                      ;; 00:1A1C $3E $36 $C3 $85 $23

IF !__OPTIMIZATIONS_1__
.return
    ret                                           ;; 00:1A21 $C9
ENDC


func_1A22::
    callsb func_020_6C4F                          ;; 00:1A22 $3E $20 $EA $00 $21 $CD $4F $6C
    callsb FadeOutMusic                           ;; 00:1A2A $3E $20 $EA $00 $21 $CD $CA $55
    ; Return to previous ROM bank callsite
    ld   a, [wCurrentBank]                        ;; 00:1A32 $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:1A35 $EA $00 $21
    ret                                           ;; 00:1A38 $C9

func_1A39::
    callsb func_020_6C7A                          ;; 00:1A39 $3E $20 $EA $00 $21 $CD $7A $6C
    callsb func_020_563B                          ;; 00:1A41 $3E $20 $EA $00 $21 $CD $3B $56
    ; Return to previous ROM bank callsite
    ld   a, [wCurrentBank]                        ;; 00:1A49 $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:1A4C $EA $00 $21
    ret                                           ;; 00:1A4F $C9

; Update hLinkAnimationState with the correct walking animation id.
;
; It uses Link's state to tell if Link has its shield, is side-scrolling, etc,
; and uses the number of steps walked to alternate between different variants.
UpdateLinkWalkingAnimation::
    ; d = (wConsecutiveStepsCount / 8) % 2
    ld   a, [wConsecutiveStepsCount]              ;; 00:1A50 $FA $20 $C1
    sra  a                                        ;; 00:1A53 $CB $2F
    sra  a                                        ;; 00:1A55 $CB $2F
    sra  a                                        ;; 00:1A57 $CB $2F
    and  $01                                      ;; 00:1A59 $E6 $01
    ld   d, a                                     ;; 00:1A5B $57

    ; bc = d + ([hLinkDirection] * 2
    ldh  a, [hLinkDirection]                      ;; 00:1A5C $F0 $9E
    sla  a                                        ;; 00:1A5E $CB $27
    or   d                                        ;; 00:1A60 $B2
    ld   c, a                                     ;; 00:1A61 $4F
    ld   b, $00                                   ;; 00:1A62 $06 $00

    ld   hl, Data_002_4948                        ;; 00:1A64 $21 $48 $49
    ld   a, [wLinkMotionState]                    ;; 00:1A67 $FA $1C $C1
    cp   LINK_MOTION_SWIMMING                     ;; 00:1A6A $FE $01
    jr   nz, .notSwimming                         ;; 00:1A6C $20 $0A
    ldh  a, [hLinkPhysicsModifier]                ;; 00:1A6E $F0 $9C
    and  a                                        ;; 00:1A70 $A7
    jr   z, .swimmingEnd                          ;; 00:1A71 $28 $03
    ld   hl, Data_002_4950                        ;; 00:1A73 $21 $50 $49
.swimmingEnd
    jr   .done                                    ;; 00:1A76 $18 $4F

.notSwimming
    ldh  a, [hIsSideScrolling]                    ;; 00:1A78 $F0 $F9
    and  a                                        ;; 00:1A7A $A7
    jr   z, .notSideScrolling                     ;; 00:1A7B $28 $0B
    ldh  a, [hLinkPhysicsModifier]                ;; 00:1A7D $F0 $9C
    cp   $02                                      ;; 00:1A7F $FE $02
    jr   nz, .notSideScrolling                    ;; 00:1A81 $20 $05
    ld   hl, LinkAnimationsList_WalkSideScrolling ;; 00:1A83 $21 $58 $49
    jr   .done                                    ;; 00:1A86 $18 $3F

.notSideScrolling
    ld   a, [wIsCarryingLiftedObject]             ;; 00:1A88 $FA $5C $C1
    cp   $01                                      ;; 00:1A8B $FE $01
    jr   z, .liftingObject                        ;; 00:1A8D $28 $35
    ldh  a, [hLinkSlowWalkingSpeed]               ;; 00:1A8F $F0 $B2
    and  a                                        ;; 00:1A91 $A7
    jr   nz, .label_1A9A                          ;; 00:1A92 $20 $06
    ld   a, [wIsLinkPushing]                      ;; 00:1A94 $FA $44 $C1
    and  a                                        ;; 00:1A97 $A7
    jr   nz, .pushingObject                       ;; 00:1A98 $20 $25

.label_1A9A
    ld   a, [wHasMirrorShield]                    ;; 00:1A9A $FA $5A $C1
    and  a                                        ;; 00:1A9D $A7
    jr   nz, .hasShield                           ;; 00:1A9E $20 $05
    ld   hl, LinkAnimationsList_WalkingNoShield   ;; 00:1AA0 $21 $10 $49
    jr   .done                                    ;; 00:1AA3 $18 $22
.hasShield
    ld   hl, LinkAnimationsList_WalkCarryingDefaultShield ;; 00:1AA5 $21 $18 $49
    cp   $02                                      ;; 00:1AA8 $FE $02
    jr   nz, .shieldDone                          ;; 00:1AAA $20 $03
    ld   hl, LinkAnimationsList_WalkCarryingMirrorShield ;; 00:1AAC $21 $28 $49
.shieldDone

    ; If the carried shield is actually being used, add 8 to the animation list address
    ld   a, [wIsUsingShield]                      ;; 00:1AAF $FA $5B $C1
    and  a                                        ;; 00:1AB2 $A7
    jr   z, .shieldNotUsed                        ;; 00:1AB3 $28 $08
    ld   a, l                                     ;; 00:1AB5 $7D
    add  a, $08                                   ;; 00:1AB6 $C6 $08
    ld   l, a                                     ;; 00:1AB8 $6F
    ld   a, h                                     ;; 00:1AB9 $7C
    adc  a, $00                                   ;; 00:1ABA $CE $00
    ld   h, a                                     ;; 00:1ABC $67
.shieldNotUsed
    jr   .done                                    ;; 00:1ABD $18 $08

.pushingObject
    ld   hl, LinkAnimationsList_PushingObject     ;; 00:1ABF $21 $38 $49
    jr   .done                                    ;; 00:1AC2 $18 $03

.liftingObject
    ld   hl, LinkAnimationsList_LiftingObject     ;; 00:1AC4 $21 $40 $49
.done

    ; Read the value in the animation list…
    add  hl, bc                                   ;; 00:1AC7 $09
    ld   a, [hl]                                  ;; 00:1AC8 $7E
    ; … and set Link's animation state.
    ldh  [hLinkAnimationState], a                 ;; 00:1AC9 $E0 $9D
    ret                                           ;; 00:1ACB $C9

include "code/home/animated_tiles.asm"

ReplaceMagicPowderTilesByToadstool::
    ld   hl, LinkCharacter2Tiles + $10C0 ; toadstool tiles ;; 00:1E2B $21 $C0 $68
    ld   de, $88E0                                ;; 00:1E2E $11 $E0 $88
    jr   ReplaceTilesPairAndDrawLinkSprite        ;; 00:1E31 $18 $74

; During the ending, progressively load the Sirens Instruments tiles
; over the dialog text tiles (when Link faces the screen to play the
; song of Awakening).
;
; Each call loads one instrument (4 tiles).
;
; Inputs:
;   wCreditsScratch0  index of the instrument to load (0-7)
ReplaceDialogTilesByInstruments::
    ld   a, BANK(Npc2Tiles)                       ;; 00:1E33 $3E $11
    call AdjustBankNumberForGBC                   ;; 00:1E35 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:1E38 $EA $00 $21

    ld   a, [wCreditsScratch0]                    ;; 00:1E3B $FA $00 $D0
    swap a                                        ;; 00:1E3E $CB $37
    and  $F0                                      ;; 00:1E40 $E6 $F0
    ld   e, a                                     ;; 00:1E42 $5F
    ld   d, $00                                   ;; 00:1E43 $16 $00
    sla  e                                        ;; 00:1E45 $CB $23
    rl   d                                        ;; 00:1E47 $CB $12
    sla  e                                        ;; 00:1E49 $CB $23
    rl   d                                        ;; 00:1E4B $CB $12

    ld   hl, vTiles1 + $500                       ;; 00:1E4D $21 $00 $8D
    add  hl, de                                   ;; 00:1E50 $19
    push hl                                       ;; 00:1E51 $E5
    ld   hl, Npc2Tiles + $1000                    ;; 00:1E52 $21 $00 $50

ReplaceEndCreditsTiles::
    add  hl, de                                   ;; 00:1E55 $19
    pop  de                                       ;; 00:1E56 $D1
    ld   bc, TILE_SIZE * $4                       ;; 00:1E57 $01 $40 $00
    call CopyData                                 ;; 00:1E5A $CD $14 $29

    xor  a                                        ;; 00:1E5D $AF
    ldh  [hReplaceTiles], a                       ;; 00:1E5E $E0 $A5

    ld   a, $0C                                   ;; 00:1E60 $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:1E62 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:1E65 $EA $00 $21
    ret                                           ;; 00:1E68 $C9

ReplaceTiles_08::
    ld   a, BANK(EndingTiles)                     ;; 00:1E69 $3E $13
    call AdjustBankNumberForGBC                   ;; 00:1E6B $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:1E6E $EA $00 $21

    ld   a, [wCreditsScratch0]                    ;; 00:1E71 $FA $00 $D0
    swap a                                        ;; 00:1E74 $CB $37
    and  $F0                                      ;; 00:1E76 $E6 $F0
    ld   e, a                                     ;; 00:1E78 $5F
    ld   d, $00                                   ;; 00:1E79 $16 $00
    sla  e                                        ;; 00:1E7B $CB $23
    rl   d                                        ;; 00:1E7D $CB $12
    sla  e                                        ;; 00:1E7F $CB $23
    rl   d                                        ;; 00:1E81 $CB $12
    ld   hl, vTiles1 + $500                       ;; 00:1E83 $21 $00 $8D
    add  hl, de                                   ;; 00:1E86 $19
    push hl                                       ;; 00:1E87 $E5
    ld   hl, EndingTiles + $D00                   ;; 00:1E88 $21 $00 $4D
    jr   ReplaceEndCreditsTiles                   ;; 00:1E8B $18 $C8

ReplaceToadstoolTilesByMagicPowder::
    ld   hl, InventoryEquipmentItemsTiles + $E0   ;; 00:1E8D $21 $E0 $48
    ld   de, $88E0                                ;; 00:1E90 $11 $E0 $88
    ld   a, BANK(InventoryEquipmentItemsTiles)    ;; 00:1E93 $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:1E95 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:1E98 $EA $00 $21
    ld   bc, TILE_SIZE * 2                        ;; 00:1E9B $01 $20 $00
    jp   CopyDataAndDrawLinkSprite                ;; 00:1E9E $C3 $3B $1F

ReplaceSlimeKeyTilesByGoldenLeaf::
    ld   hl, LinkCharacter2Tiles + $10E0          ;; 00:1EA1 $21 $E0 $68
    ld   de, vTiles1 + $4A0                       ;; 00:1EA4 $11 $A0 $8C
    ; fallthrough to ReplaceTilesPairAndDrawLinkSprite

; Replace two tiles in VRAM by the content at hl, then
; draw link sprite.

; Inputs:
;   hl   tiles source address
;   de   tiles destination in VRAM
ReplaceTilesPairAndDrawLinkSprite::
    ld   a, BANK(LinkCharacter2Tiles)             ;; 00:1EA7 $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:1EA9 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:1EAC $EA $00 $21
    ld   bc, TILE_SIZE * $2                       ;; 00:1EAF $01 $20 $00
    jp   CopyDataAndDrawLinkSprite                ;; 00:1EB2 $C3 $3B $1F

; TODO: label this.
; Seems to be related to the tiles for a floor button being
; pressed or not (but the tiles location don't match?)
ReplaceTilesButtonPressed::
    ld   hl, DungeonMinimapTiles + TILE_SIZE * 16 ;; 00:1EB5 $21 $00 $7F
    ld   a, BANK(DungeonMinimapTiles)             ;; 00:1EB8 $3E $12
    jr   ReplaceTiles_04.replaceTiles             ;; 00:1EBA $18 $05

; TODO: label this.
ReplaceTiles_04::
    ld   hl, DungeonsTiles + $C40                 ;; 00:1EBC $21 $40 $4C
    ld   a, BANK(DungeonsTiles)                   ;; 00:1EBF $3E $0D

.replaceTiles
    call AdjustBankNumberForGBC                   ;; 00:1EC1 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:1EC4 $EA $00 $21
    ld   de, vTiles2 + $140                       ;; 00:1EC7 $11 $40 $91
    jp   Copy4TilesAndDrawLinkSprite              ;; 00:1ECA $C3 $38 $1F

; Tiles for switch blocks during a transition
; Indexed by block kind.
SwitchBlockTransitionTilesTable:: ;; 00:1ECD
.kindA dw SwitchBlockTiles + $40 ; half-raised
.kindB dw SwitchBlockTiles + $40 ; half-raised

; Tiles for switch blocks in state 0
; (blocks of kind A lowered, blocks of kind B raised).
;
; Indexed by block kind.
SwitchBlockState0TilesTable:: ;; 00:1ED1
.kindA dw SwitchBlockTiles ; lowered
.kindB ; uses the first item below

; Tiles for switch blocks in state 1
; (blocks of kind A raised, blocks of kind B lowered).
;
; Indexed by block kind.
SwitchBlockState1TilesTable:: ;; 00:1ED3
.kindA dw SwitchBlockTiles + $80 ; raised
.kindB dw SwitchBlockTiles + $00 ; lowered

; Modify switch block tiles during V-blank, depending on the blocks state
; and animation frame.
;
; This may be called either when loading a new room from scratch, when transitioning
; to a new room, or when switching the blocks interactively by hitting a crystal switch.
;
; As there are two kind of blocks in the game (normal and inverted), two sets of 2x2 tiles
; are used in vram: when one has tiles for lowered blocks, the other has tiles for raised
; blocks.
;
; Input:
;   a   current animation frame
;       (usually the content wSwitchableObjectAnimationStage, but may be set explicitely when loading a new room).
UpdateSwitchBlockTiles::
    ; Select graphics bank
    push af                                       ;; 00:1ED7 $F5
    ld   a, BANK(SwitchBlockTiles)                ;; 00:1ED8 $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:1EDA $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:1EDD $EA $00 $21
    pop  af                                       ;; 00:1EE0 $F1

    ; Mark Link as not interactive during the animation
    ld   hl, hLinkInteractiveMotionBlocked        ;; 00:1EE1 $21 $A1 $FF
    ld   [hl], $01                                ;; 00:1EE4 $36 $01

    ; de = [wSwitchBlocksState]
    ld   hl, wSwitchBlocksState                   ;; 00:1EE6 $21 $FB $D6
    ld   e, [hl]                                  ;; 00:1EE9 $5E
    ld   d, $00                                   ;; 00:1EEA $16 $00
    inc  a                                        ;; 00:1EEC $3C

    ; On stage 3…
    cp   03                                       ;; 00:1EED $FE $03
    jr   nz, .stage3End                           ;; 00:1EEF $20 $0A
    ; Invert second bit of wSwitchBlocksState (toggle between 0 and 2)
    push af                                       ;; 00:1EF1 $F5
    ld   a, [wSwitchBlocksState]                  ;; 00:1EF2 $FA $FB $D6
    xor  $02                                      ;; 00:1EF5 $EE $02
    ld   [wSwitchBlocksState], a                  ;; 00:1EF7 $EA $FB $D6
    pop  af                                       ;; 00:1EFA $F1
.stage3End

    ; Increment wSwitchableObjectAnimationStage
    ld   [wSwitchableObjectAnimationStage], a     ;; 00:1EFB $EA $F8 $D6

    ; On stage 4…
    cp   04                                       ;; 00:1EFE $FE $04
    jr   nz, .stage4End                           ;; 00:1F00 $20 $05
    ; … use tiles with both kind of blocks being half-raised
    ld   hl, SwitchBlockTransitionTilesTable      ;; 00:1F02 $21 $CD $1E
    jr   .configureCopyForSwitchBlockA            ;; 00:1F05 $18 $07
.stage4End

    ; On stage 8…
    cp   08                                       ;; 00:1F07 $FE $08
    jr   nz, .stage8End                           ;; 00:1F09 $20 $09
    ld   hl, SwitchBlockState0TilesTable          ;; 00:1F0B $21 $D1 $1E

.configureCopyForSwitchBlockA
    add  hl, de                                   ;; 00:1F0E $19
    ld   de, vTilesSwitchBlockA                   ;; 00:1F0F $11 $40 $90
    jr   .copyData                                ;; 00:1F12 $18 $18
.stage8End

    ; On stage 6…
    cp   06                                       ;; 00:1F14 $FE $06
    jr   nz, .stage6End                           ;; 00:1F16 $20 $05
    ld   hl, SwitchBlockTransitionTilesTable      ;; 00:1F18 $21 $CD $1E
    jr   .configureCopyForSwitchBlockB            ;; 00:1F1B $18 $0B
.stage6End

    ; On stage 10…
    cp   10                                       ;; 00:1F1D $FE $0A
    jr   nz, .skipCopyData                        ;; 00:1F1F $20 $14
    ; Clear wSwitchableObjectAnimationStage
    xor  a                                        ;; 00:1F21 $AF
    ld   [wSwitchableObjectAnimationStage], a     ;; 00:1F22 $EA $F8 $D6
    ; Copy final tiles for switch block B
    ld   hl, SwitchBlockState1TilesTable          ;; 00:1F25 $21 $D3 $1E

.configureCopyForSwitchBlockB
    add  hl, de                                   ;; 00:1F28 $19
    ld   de, vTilesSwitchBlockB                   ;; 00:1F29 $11 $80 $90

.copyData
    ; Copy the tiles from ROM to VRAM
    ld   bc, $40                                  ;; 00:1F2C $01 $40 $00
    ld   a, [hli]                                 ;; 00:1F2F $2A
    ld   h, [hl]                                  ;; 00:1F30 $66
    ld   l, a                                     ;; 00:1F31 $6F
    jp   CopyData                                 ;; 00:1F32 $C3 $14 $29

.skipCopyData
    jp   DrawLinkSpriteAndReturn                  ;; 00:1F35 $C3 $2E $1D

Copy4TilesAndDrawLinkSprite::
    ld   bc, TILE_SIZE * 4                        ;; 00:1F38 $01 $40 $00

CopyDataAndDrawLinkSprite::
    call CopyData                                 ;; 00:1F3B $CD $14 $29

.drawLinkSprite
    xor  a                                        ;; 00:1F3E $AF
    ldh  [hReplaceTiles], a                       ;; 00:1F3F $E0 $A5
    ld   a, BANK(LinkCharacterTiles)              ;; 00:1F41 $3E $0C
    ld   [rSelectROMBank], a                      ;; 00:1F43 $EA $00 $21
    jp   DrawLinkSpriteAndReturn                  ;; 00:1F46 $C3 $2E $1D

; Number of horizontal pixels the sword reaches in Link's direction when drawing the sword
SwordAreaXForDirection::
.right: db $0C                                     ;; 00:1F49
.left:  db $03                                     ;; 00:1F4A
.up:    db $08                                     ;; 00:1F4B
.down:  db $08                                     ;; 00:1F4C

; Number of vertical pixels the sword reaches in Link's direction when drawing the sword
SwordAreaYForDirection::
.right: db $0A                                     ;; 00:1F4D
.left:  db $0A                                     ;; 00:1F4E
.up:    db $05                                     ;; 00:1F4F
.down:  db $10                                     ;; 00:1F50

; Array of constants for Link animation state
LinkDirectionToLinkAnimationState_2::
.right: db  LINK_ANIMATION_STATE_GRABBING_RIGHT
.left:  db  LINK_ANIMATION_STATE_GRABBING_LEFT
.up:    db  LINK_ANIMATION_STATE_GRABBING_UP
.down:  db  LINK_ANIMATION_STATE_GRABBING_DOWN    ;; 00:1F51

LinkDirectionToLiftDirectionButton::
    db   2, 1, 8, 4                               ;; 00:1F55

data_1F59::
    db   $FC, 4, 0, 0                             ;; 00:1F59

data_1F5D::
    db   0, 0, 4, 0                               ;; 00:1F5D

; Call label_1F69, then restore bank 2
; (Only ever called from LinkMotionDefault)
label_1F69_trampoline::
    call label_1F69                               ;; 00:1F61 $CD $69 $1F
    ld   a, $02                                   ;; 00:1F64 $3E $02
    jp   SwitchBank                               ;; 00:1F66 $C3 $0C $08

; Physics for Link interactive motion?
; (Only ever called from LinkMotionDefault)
label_1F69::
    ; If running with pegagus boots, or hLinkPositionZ != 0, or Link's motion != LINK_MOTION_DEFAULT, return
    ld   hl, wIsRunningWithPegasusBoots           ;; 00:1F69 $21 $4A $C1
    ld   a, [wIsCarryingLiftedObject]             ;; 00:1F6C $FA $5C $C1
    or   [hl]                                     ;; 00:1F6F $B6
    ld   hl, hLinkPositionZ                       ;; 00:1F70 $21 $A2 $FF
    or   [hl]                                     ;; 00:1F73 $B6
    ld   hl, wLinkMotionState                     ;; 00:1F74 $21 $1C $C1
    or   [hl]                                     ;; 00:1F77 $B6
IF __OPTIMIZATIONS_1__
    ret  nz
ELSE
    jp   nz, func_2165.return                     ;; 00:1F78 $C2 $77 $21
ENDC

    ; Update hIntersectedObjectLeft according to Link's position and direction
    ldh  a, [hLinkDirection]                      ;; 00:1F7B $F0 $9E
    ld   e, a                                     ;; 00:1F7D $5F
    ld   d, $00                                   ;; 00:1F7E $16 $00
    ld   hl, SwordAreaXForDirection               ;; 00:1F80 $21 $49 $1F
    add  hl, de                                   ;; 00:1F83 $19

    ldh  a, [hLinkPositionX]                      ;; 00:1F84 $F0 $98
    add  a, [hl]                                  ;; 00:1F86 $86
    sub  a, $08                                   ;; 00:1F87 $D6 $08
    and  $F0                                      ;; 00:1F89 $E6 $F0
    ldh  [hIntersectedObjectLeft], a              ;; 00:1F8B $E0 $CE

    ; Update hIntersectedObjectTop according to Link's position and direction
    swap a                                        ;; 00:1F8D $CB $37
    ld   c, a                                     ;; 00:1F8F $4F
    ld   hl, SwordAreaYForDirection               ;; 00:1F90 $21 $4D $1F
    add  hl, de                                   ;; 00:1F93 $19
    ldh  a, [hLinkPositionY]                      ;; 00:1F94 $F0 $99
    add  a, [hl]                                  ;; 00:1F96 $86
    sub  a, $10                                   ;; 00:1F97 $D6 $10
    and  $F0                                      ;; 00:1F99 $E6 $F0
    ldh  [hIntersectedObjectTop], a               ;; 00:1F9B $E0 $CD

    ; hl = address of the room object that would intersect with the sword
    or   c                                        ;; 00:1F9D $B1
    ld   e, a                                     ;; 00:1F9E $5F
    ldh  [hMultiPurpose1], a                      ;; 00:1F9F $E0 $D8
    ld   hl, wRoomObjects                         ;; 00:1FA1 $21 $11 $D7
    add  hl, de                                   ;; 00:1FA4 $19

    ; (Sanity check: if HIGH(hl) != $D7, then we're far out of bounds: return)
    ld   a, h                                     ;; 00:1FA5 $7C
    cp   $D7                                      ;; 00:1FA6 $FE $D7
    jp   nz, .clearPullCounterAndReturn           ;; 00:1FA8 $C2 $4E $21

    ; hMultiPurpose0 = id of room object under the sword
    ld   a, [hl]                                  ;; 00:1FAB $7E
    ldh  [hMultiPurpose0], a                      ;; 00:1FAC $E0 $D7

    ; hMultiPurpose5 = unknown value read from the objects tilesets table
    ; d = map group id
    ; e = room object
    ld   e, a                                     ;; 00:1FAE $5F
    ld   a, [wIsIndoor]                           ;; 00:1FAF $FA $A5 $DB
    ld   d, a                                     ;; 00:1FB2 $57
    call GetObjectPhysicsFlags_trampoline         ;; 00:1FB3 $CD $26 $2A
    ldh  [hMultiPurpose5], a                      ;; 00:1FB6 $E0 $DC

    ; If the object is $9A, skip this section

    ldh  a, [hMultiPurpose0]                      ;; 00:1FB8 $F0 $D7
    cp   $9A                                      ;; 00:1FBA $FE $9A
    jr   z, .notObject9AEnd                       ;; 00:1FBC $28 $40

    ldh  a, [hMultiPurpose5]                      ;; 00:1FBE $F0 $DC
    cp   $00                                      ;; 00:1FC0 $FE $00
    jp   z, .clearPullCounterAndReturn            ;; 00:1FC2 $CA $4E $21
    cp   $01                                      ;; 00:1FC5 $FE $01
    jr   z, .jp_1FE6                              ;; 00:1FC7 $28 $1D
    cp   $50                                      ;; 00:1FC9 $FE $50
    jp   z, .clearPullCounterAndReturn            ;; 00:1FCB $CA $4E $21
    cp   $51                                      ;; 00:1FCE $FE $51
    jp   z, .clearPullCounterAndReturn            ;; 00:1FD0 $CA $4E $21
    cp   $11                                      ;; 00:1FD3 $FE $11
    jp  c, .clearPullCounterAndReturn             ;; 00:1FD5 $DA $4E $21
    cp   $D4                                      ;; 00:1FD8 $FE $D4
    jp   nc, .clearPullCounterAndReturn           ;; 00:1FDA $D2 $4E $21
    cp   $D0                                      ;; 00:1FDD $FE $D0
    jr   nc, .jp_1FE6                             ;; 00:1FDF $30 $05
    cp   $7C                                      ;; 00:1FE1 $FE $7C
    jp   nc, .clearPullCounterAndReturn           ;; 00:1FE3 $D2 $4E $21

.jp_1FE6
    ldh  a, [hMultiPurpose0]                      ;; 00:1FE6 $F0 $D7
    ld   e, a                                     ;; 00:1FE8 $5F
    cp   $6F                                      ;; 00:1FE9 $FE $6F
    jr   z, .jp_1FF6                              ;; 00:1FEB $28 $09
    cp   $5E                                      ;; 00:1FED $FE $5E
    jr   z, .jp_1FF6                              ;; 00:1FEF $28 $05
    cp   $D4                                      ;; 00:1FF1 $FE $D4
    jp   nz, .jp_2098                             ;; 00:1FF3 $C2 $98 $20

.jp_1FF6
    ld   a, [wIsIndoor]                           ;; 00:1FF6 $FA $A5 $DB
    and  a                                        ;; 00:1FF9 $A7

    ld   a, e                                     ;; 00:1FFA $7B
    jp   nz, .jp_2098                             ;; 00:1FFB $C2 $98 $20
.notObject9AEnd

    ld   e, a                                     ;; 00:1FFE $5F

    ; If Link is facing up, handle some special cases.
    ldh  a, [hLinkDirection]                      ;; 00:1FFF $F0 $9E
    cp   DIRECTION_UP                             ;; 00:2001 $FE $02
    jp   nz, .specialCasesEnd                     ;; 00:2003 $C2 $CF $20
    ld   a, ITEM_USAGE_READING_TEXT               ;; 00:2006 $3E $02
    ld   [wItemUsageContext], a                   ;; 00:2008 $EA $AD $C1

    ; If A or B is pressed…
    ldh  a, [hJoypadState]                        ;; 00:200B $F0 $CC
    and  J_A | J_B                                ;; 00:200D $E6 $30
    jp   z, .specialCasesEnd                      ;; 00:200F $CA $CF $20
    ld   a, e                                     ;; 00:2012 $7B
    cp   OBJECT_WEATHER_VANE_BASE                 ;; 00:2013 $FE $5E
    ld_dialog_low a, Dialog18E ; "Here sleeps..." ;; 00:2015 $3E $8E
    jr   z, .openDialogInTable1                   ;; 00:2017 $28 $6F
    ld   a, e                                     ;; 00:2019 $7B
    cp   OBJECT_OWL_STATUE                        ;; 00:201A $FE $6F
    jr   z, .signpost                             ;; 00:201C $28 $2B
    cp   OBJECT_SIGNPOST                          ;; 00:201E $FE $D4
    jr   z, .signpost                             ;; 00:2020 $28 $27
    ld   a, [wIsMarinFollowingLink]               ;; 00:2022 $FA $73 $DB
    and  a                                        ;; 00:2025 $A7
    jr   z, .jr_2030                              ;; 00:2026 $28 $08
    ; Open Marin's "Do you look in people's drawers?" dialog
    call_open_dialog Dialog278                    ;; 00:2028 $3E $78 $CD $7C $23
    jp   .specialCasesEnd                         ;; 00:202D $C3 $CF $20

.jr_2030
    ; If no sword yet…
    ld   a, [wSwordLevel]                         ;; 00:2030 $FA $4E $DB
    and  a                                        ;; 00:2033 $A7
    ldh  a, [hMapRoom]                            ;; 00:2034 $F0 $F6
    jr   nz, .noSwordEnd                          ;; 00:2036 $20 $06
    ld_dialog_low e, Dialog0FF                    ;; 00:2038 $1E $FF
    cp   ROOM_INDOOR_B_MARIN_HOUSE                ;; 00:203A $FE $A3
    jr   z, .jr_2046                              ;; 00:203C $28 $08
.noSwordEnd

    ld_dialog_low e, Dialog0FC ; "This is not a chest"     ;; 00:203E $1E $FC
    cp   UNKNOWN_ROOM_FA                          ;; 00:2040 $FE $FA
    jr   z, .jr_2046                              ;; 00:2042 $28 $02
    ld_dialog_low e, Dialog0FD ; "XXXXX checked the chest" ;; 00:2044 $1E $FD

.jr_2046
    ld   a, e                                     ;; 00:2046 $7B
    jr   .openDialogInTable0                      ;; 00:2047 $18 $45

.signpost
    ;
    ; Activating an OBJECT_SIGNPOST
    ; de = [hMapRoom]
    ;

    ; a = SignpostDialogTable[hMapRoom]
    ; e = wOcarinaSongFlags
    ldh  a, [hMapRoom]                            ;; 00:2049 $F0 $F6
    ld   e, a                                     ;; 00:204B $5F
    ld   d, $00                                   ;; 00:204C $16 $00
    ld   a, BANK(SignpostDialogTable)             ;; 00:204E $3E $14
    ld   [rSelectROMBank], a                      ;; 00:2050 $EA $00 $21
    ld   hl, SignpostDialogTable                  ;; 00:2053 $21 $18 $51
    add  hl, de                                   ;; 00:2056 $19
    ld   a, [wOcarinaSongFlags]                   ;; 00:2057 $FA $49 $DB
    ld   e, a                                     ;; 00:205A $5F
    ld   a, [hl]                                  ;; 00:205B $7E

    ; If the signpost dialog is "Down", and player has the Frog song…
    cp_dialog_low Dialog1A9 ; Dialog1A9 ; "Down"           ;; 00:205C $FE $A9
    jr   nz, .mamuGoneEnd                         ;; 00:205E $20 $06
    bit  0, e                                     ;; 00:2060 $CB $43
    jr   z, .mamuGoneEnd                          ;; 00:2062 $28 $02
    ; … use the "Gone" dialog
    ld_dialog_low a, Dialog1AF ; "Gone on tour, Mamu" ;; 00:2064 $3E $AF
.mamuGoneEnd

    cp_dialog_low Dialog1AF                       ;; 00:2066 $FE $AF
    jr   nz, .selectSignpostDialogTable           ;; 00:2068 $20 $16
    bit  0, e                                     ;; 00:206A $CB $43
    jr   nz, .selectSignpostDialogTable           ;; 00:206C $20 $12
    ldh  a, [hIntersectedObjectLeft]              ;; 00:206E $F0 $CE
    swap a                                        ;; 00:2070 $CB $37
    and  $0F                                      ;; 00:2072 $E6 $0F
    ld   e, a                                     ;; 00:2074 $5F
    ldh  a, [hIntersectedObjectTop]               ;; 00:2075 $F0 $CD
    and  $F0                                      ;; 00:2077 $E6 $F0
    or   e                                        ;; 00:2079 $B3
    ld   [wMazeSignpostPos], a                    ;; 00:207A $EA $73 $D4
    jp   .specialCasesEnd                         ;; 00:207D $C3 $CF $20

.selectSignpostDialogTable
    cp_dialog_low Dialog083 ; use table 0 for Dialog083    ;; 00:2080 $FE $83
    jr   z, .openDialogInTable0                   ;; 00:2082 $28 $0A
    cp_dialog_low Dialog22D ; use table 2 for Dialog22D    ;; 00:2084 $FE $2D
    jr   z, .openDialogInTable2                   ;; 00:2086 $28 $0B
    ; otherwise use table 1

.openDialogInTable1
    call OpenDialogInTable1                       ;; 00:2088 $CD $73 $23
    jp   .specialCasesEnd                         ;; 00:208B $C3 $CF $20

.openDialogInTable0
    call OpenDialogInTable0                       ;; 00:208E $CD $85 $23
    jr   .specialCasesEnd                         ;; 00:2091 $18 $3C

.openDialogInTable2
    call OpenDialogInTable2                       ;; 00:2093 $CD $7C $23
    jr   .specialCasesEnd                         ;; 00:2096 $18 $37

.jp_2098

    ; When throwing a pot at a chest in the right room, open the chest
    cp   OBJECT_CHEST_CLOSED                      ;; 00:2098 $FE $A0
    jr   nz, .specialCasesEnd                     ;; 00:209A $20 $33
    ld   a, [wRoomEvent]                          ;; 00:209C $FA $8E $C1
    and  EVENT_TRIGGER_MASK                       ;; 00:209F $E6 $1F
    cp   TRIGGER_THROW_POT_AT_CHEST               ;; 00:20A1 $FE $0D
    jr   z, .specialCasesEnd                      ;; 00:20A3 $28 $2A
    ldh  a, [hLinkDirection]                      ;; 00:20A5 $F0 $9E
    cp   DIRECTION_UP                             ;; 00:20A7 $FE $02
    jr   nz, .specialCasesEnd                     ;; 00:20A9 $20 $24
    ld   [wItemUsageContext], a                   ;; 00:20AB $EA $AD $C1
    ldh  a, [hJoypadState]                        ;; 00:20AE $F0 $CC
    and  J_A | J_B                                ;; 00:20B0 $E6 $30
    jr   z, .specialCasesEnd                      ;; 00:20B2 $28 $1B
    ldh  a, [hIsSideScrolling]                    ;; 00:20B4 $F0 $F9
    and  a                                        ;; 00:20B6 $A7
    jr   nz, .label_20BF                          ;; 00:20B7 $20 $06
    ldh  a, [hLinkDirection]                      ;; 00:20B9 $F0 $9E
    cp   DIRECTION_UP                             ;; 00:20BB $FE $02
    jr   nz, .specialCasesEnd                     ;; 00:20BD $20 $10

.label_20BF
    callsb func_014_5900                          ;; 00:20BF $3E $14 $EA $00 $21 $CD $00 $59
    callsb SpawnChestWithItem                     ;; 00:20C7 $3E $02 $EA $00 $21 $CD $D0 $41

.specialCasesEnd

    ld   a, [wInventoryItems.BButtonSlot]         ;; 00:20CF $FA $00 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 00:20D2 $FE $03
    jr   nz, .checkAButtonSlot                    ;; 00:20D4 $20 $07
    ldh  a, [hPressedButtonsMask]                 ;; 00:20D6 $F0 $CB
    and  J_B                                      ;; 00:20D8 $E6 $20
    jr   nz, .jr_20EC                             ;; 00:20DA $20 $10
    ret                                           ;; 00:20DC $C9

.checkAButtonSlot
    ld   a, [wInventoryItems.AButtonSlot]         ;; 00:20DD $FA $01 $DB
    cp   INVENTORY_POWER_BRACELET                 ;; 00:20E0 $FE $03
IF __OPTIMIZATIONS_1__
    ret  nz
ELSE
    jp   nz, func_2165.return                     ;; 00:20E2 $C2 $77 $21
ENDC
    ldh  a, [hPressedButtonsMask]                 ;; 00:20E5 $F0 $CB
    and  J_A                                      ;; 00:20E7 $E6 $10
IF __OPTIMIZATIONS_1__
    ret  z
ELSE
    jp   z, func_2165.return                      ;; 00:20E9 $CA $77 $21
ENDC

.jr_20EC
    callsb label_002_48B0                         ;; 00:20EC $3E $02 $EA $00 $21 $CD $B0 $48
    ld   a, TRUE                                  ;; 00:20F4 $3E $01
    ldh  [hLinkInteractiveMotionBlocked], a       ;; 00:20F6 $E0 $A1
    ldh  a, [hLinkDirection]                      ;; 00:20F8 $F0 $9E
    ld   e, a                                     ;; 00:20FA $5F
    ld   d, $00                                   ;; 00:20FB $16 $00
    ld   hl, LinkDirectionToLinkAnimationState_2  ;; 00:20FD $21 $51 $1F

    add  hl, de                                   ;; 00:2100 $19
    ld   a, [hl]                                  ;; 00:2101 $7E
    ldh  [hLinkAnimationState], a                 ;; 00:2102 $E0 $9D
    ld   hl, LinkDirectionToLiftDirectionButton   ;; 00:2104 $21 $55 $1F
    add  hl, de                                   ;; 00:2107 $19
    ldh  a, [hPressedButtonsMask]                 ;; 00:2108 $F0 $CB
    and  [hl]                                     ;; 00:210A $A6
    jr   z, .clearPullCounterAndReturn            ;; 00:210B $28 $41
    ld   hl, data_1F59                            ;; 00:210D $21 $59 $1F
    add  hl, de                                   ;; 00:2110 $19
    ld   a, [hl]                                  ;; 00:2111 $7E
    ld   [wC13C], a                               ;; 00:2112 $EA $3C $C1
    ld   hl, data_1F5D                            ;; 00:2115 $21 $5D $1F
    add  hl, de                                   ;; 00:2118 $19
    ld   a, [hl]                                  ;; 00:2119 $7E
    ld   [wC13B], a                               ;; 00:211A $EA $3B $C1
    ld   hl, hLinkAnimationState                  ;; 00:211D $21 $9D $FF
    inc  [hl]                                     ;; 00:2120 $34
    ld   e, $08                                   ;; 00:2121 $1E $08
    ld   a, [wActivePowerUp]                      ;; 00:2123 $FA $7C $D4
    cp   ACTIVE_POWER_UP_PIECE_OF_POWER           ;; 00:2126 $FE $01
    jr   nz, .jp_212C                             ;; 00:2128 $20 $02
    ld   e, $03                                   ;; 00:212A $1E $03

.jp_212C
    ld   hl, wPullCounter                         ;; 00:212C $21 $5F $C1
    inc  [hl]                                     ;; 00:212F $34
    ld   a, [hl]                                  ;; 00:2130 $7E
    cp   e                                        ;; 00:2131 $BB
IF __OPTIMIZATIONS_1__
    ret  c
ELSE
    jr   c, .return                               ;; 00:2132 $38 $19
ENDC
    xor  a                                        ;; 00:2134 $AF
    ldh  [hMultiPurposeE], a                      ;; 00:2135 $E0 $E5
    ldh  a, [hMultiPurpose0]                      ;; 00:2137 $F0 $D7
    cp   $8E                                      ;; 00:2139 $FE $8E
    jr   z, .jr_2153                              ;; 00:213B $28 $16
    cp   $20                                      ;; 00:213D $FE $20
    jr   z, .jr_2153                              ;; 00:213F $28 $12
    ld   a, [wIsIndoor]                           ;; 00:2141 $FA $A5 $DB
    and  a                                        ;; 00:2144 $A7
IF __OPTIMIZATIONS_1__
    ret  nz
ELSE
    jr   nz, .return                              ;; 00:2145 $20 $06
ENDC
    ldh  a, [hMultiPurpose0]                      ;; 00:2147 $F0 $D7
    cp   $5C                                      ;; 00:2149 $FE $5C
    jr   z, .jr_2161                              ;; 00:214B $28 $14

.return
    ret                                           ;; 00:214D $C9

.clearPullCounterAndReturn:
    xor  a                                        ;; 00:214E $AF
    ld   [wPullCounter], a                        ;; 00:214F $EA $5F $C1
    ret                                           ;; 00:2152 $C9

.jr_2153
    call func_2165                                ;; 00:2153 $CD $65 $21
    callsb func_014_50C3                          ;; 00:2156 $3E $14 $EA $00 $21 $CD $C3 $50
    jp   ReloadSavedBank                          ;; 00:215E $C3 $1D $08

.jr_2161
    ld   a, $01                                   ;; 00:2161 $3E $01
    ldh  [hMultiPurposeE], a                      ;; 00:2163 $E0 $E5

func_2165::
    ldh  a, [hMultiPurpose1]                      ;; 00:2165 $F0 $D8
    ld   e, a                                     ;; 00:2167 $5F
    ldh  a, [hMultiPurpose0]                      ;; 00:2168 $F0 $D7
    ldh  [hObjectUnderEntity], a                  ;; 00:216A $E0 $AF
    call func_014_5526_trampoline                 ;; 00:216C $CD $78 $21
    ldh  a, [hLinkDirection]                      ;; 00:216F $F0 $9E
    ld   [wC15D], a                               ;; 00:2171 $EA $5D $C1
    jp   label_2183                               ;; 00:2174 $C3 $83 $21

IF !__OPTIMIZATIONS_1__
.return
    ret                                           ;; 00:2177 $C9
ENDC

func_014_5526_trampoline::
    callsb func_014_5526                          ;; 00:2178 $3E $14 $EA $00 $21 $CD $26 $55
    jp   ReloadSavedBank                          ;; 00:2180 $C3 $1D $08

label_2183::
    ld   a, ENTITY_LIFTABLE_ROCK                  ;; 00:2183 $3E $05
    call SpawnPlayerProjectile                    ;; 00:2185 $CD $2F $14

IF __OPTIMIZATIONS_1__
    ret  c
ELSE
    jr   c, .return                               ;; 00:2188 $38 $1D
ENDC

    ld   a, WAVE_SFX_LIFT_UP                      ;; 00:218A $3E $02
    ldh  [hWaveSfx], a                            ;; 00:218C $E0 $F3

    ld   hl, wEntitiesStatusTable                 ;; 00:218E $21 $80 $C2
    add  hl, de                                   ;; 00:2191 $19
    ld   [hl], $07                                ;; 00:2192 $36 $07
    ld   hl, wEntitiesSpriteVariantTable          ;; 00:2194 $21 $B0 $C3
    add  hl, de                                   ;; 00:2197 $19
    ldh  a, [hMultiPurposeE]                      ;; 00:2198 $F0 $E5
    ld   [hl], a                                  ;; 00:219A $77
    ld   c, e                                     ;; 00:219B $4B
    ld   b, d                                     ;; 00:219C $42
    ld   e, $01                                   ;; 00:219D $1E $01
    jpsw func_003_5795                            ;; 00:219F $3E $03 $CD $0C $08 $C3 $95 $57

IF !__OPTIMIZATIONS_1__
.return
    ret                                           ;; 00:21A7 $C9
ENDC

UpdateFinalLinkPosition::
    ; If inventory is appearing, return
    ld   a, [wInventoryAppearing]                 ;; 00:21A8 $FA $4F $C1
    and  a                                        ;; 00:21AB $A7
    ret  nz                                       ;; 00:21AC $C0

    ; Compute next Link vertical position
    ld   c, $01                                   ;; 00:21AD $0E $01
    call ComputeLinkPosition                      ;; 00:21AF $CD $B6 $21

.horizontal
   ; Compute next Link horizontal position
    ld   c, $00                                   ;; 00:21B2 $0E $00
    ldh  [hMultiPurpose0], a                      ;; 00:21B4 $E0 $D7

; Update Link position from its speed, in either horizontal
; or vertical direction.
;
; Inputs:
;   c : direction (0: horizontal ; 1: vertical)
ComputeLinkPosition::
    ; Read hLinkSpeedX or hLinkSpeedY (depending on the direction)
    ld   b, $00                                   ;; 00:21B6 $06 $00
    ld   hl, hLinkSpeedX                          ;; 00:21B8 $21 $9A $FF
    add  hl, bc                                   ;; 00:21BB $09
    ld   a, [hl]                                  ;; 00:21BC $7E

    ; Write swap(speed) & $F0 to wC11A or wC11B (depending on the direction)
    push af                                       ;; 00:21BD $F5
    swap a                                        ;; 00:21BE $CB $37
    and  $F0                                      ;; 00:21C0 $E6 $F0
    ld   hl, wC11A                                ;; 00:21C2 $21 $1A $C1
    add  hl, bc                                   ;; 00:21C5 $09
    add  a, [hl]                                  ;; 00:21C6 $86
    ld   [hl], a                                  ;; 00:21C7 $77

    rl   d                                        ;; 00:21C8 $CB $12

    ; hl = hLinkPositionX or hLinkPositionY
    ld   hl, hLinkPositionX                       ;; 00:21CA $21 $98 $FF
    add  hl, bc                                   ;; 00:21CD $09

    pop  af                                       ;; 00:21CE $F1

    ; e = speed mask (avoids the speed from overflowing the max speed and wrapping around)
    ld   e, $00                                   ;; 00:21CF $1E $00
    bit  7, a                                     ;; 00:21D1 $CB $7F
    jr   z, .positiveSpeedEnd                     ;; 00:21D3 $28 $02
    ld   e, $F0                                   ;; 00:21D5 $1E $F0
.positiveSpeedEnd

    ; Add the speed to the horizontal or vertical position
    swap a                                        ;; 00:21D7 $CB $37
    and  $0F                                      ;; 00:21D9 $E6 $0F
    or   e                                        ;; 00:21DB $B3
    rr   d                                        ;; 00:21DC $CB $1A
    adc  a, [hl]                                  ;; 00:21DE $8E
    ld   [hl], a                                  ;; 00:21DF $77
    ret                                           ;; 00:21E0 $C9

func_21E1::
    ldh  a, [hLinkVelocityZ]                      ;; 00:21E1 $F0 $A3
    push af                                       ;; 00:21E3 $F5
    swap a                                        ;; 00:21E4 $CB $37
    and  $F0                                      ;; 00:21E6 $E6 $F0
    ld   hl, wC149                                ;; 00:21E8 $21 $49 $C1
    add  a, [hl]                                  ;; 00:21EB $86
    ld   [hl], a                                  ;; 00:21EC $77
    rl   d                                        ;; 00:21ED $CB $12
    ld   hl, hLinkPositionZ                       ;; 00:21EF $21 $A2 $FF
    pop  af                                       ;; 00:21F2 $F1
    ld   e, $00                                   ;; 00:21F3 $1E $00
    bit  7, a                                     ;; 00:21F5 $CB $7F
    jr   z, .label_21FB                           ;; 00:21F7 $28 $02
    ld   e, $F0                                   ;; 00:21F9 $1E $F0
.label_21FB
    swap a                                        ;; 00:21FB $CB $37
    and  $0F                                      ;; 00:21FD $E6 $0F
    or   e                                        ;; 00:21FF $B3
    rr   d                                        ;; 00:2200 $CB $1A
    adc  a, [hl]                                  ;; 00:2202 $8E
    ld   [hl], a                                  ;; 00:2203 $77
    ret                                           ;; 00:2204 $C9

; Increment the BG map offset by this amount during room transition,
; depending on the transition direction.
BGRegionIncrement::
.right: db $10                                    ;; 00:2205
.left:  db $10                                    ;; 00:2206
.top    db $01                                    ;; 00:2207
.bottom db $01                                    ;; 00:2208

; Update a region (row or column) of the BG map during room transition
UpdateBGRegion::
    ; Switch to Map Data bank
    ld   a, $08                                   ;; 00:2209 $3E $08
    ld   [rSelectROMBank], a                      ;; 00:220B $EA $00 $21
    call DoUpdateBGRegion                         ;; 00:220E $CD $34 $22
    ; Reload saved bank and return
    jp   ReloadSavedBank                          ;; 00:2211 $C3 $1D $08

; Copy two horizontally-adjacent bytes, from the object tilemap/attrmap to the BG tilemap.
;
; The object tilemap/attrmap is made of 4 bytes (one for each tile), laid out as:
;  0 1
;  2 3
;
; This function will copy either bytes 0 and 1, or bytes 2 and 3.
;
; Inputs:
;   hl   pointer to the object tilemap/attrmap (4 bytes)
;   bc   the BG map location to copy the tiles to
CopyObjectRowToBGMap::
    ; If copying the lower part of the tilemap/attrmap…
    ld   a, [wBGUpdateRegionOriginLow]            ;; 00:2214 $FA $27 $C1
    and  $20                                      ;; 00:2217 $E6 $20
    jr   z, .lowerPartEnd                         ;; 00:2219 $28 $02
    ; …skip bytes 0 and 1 (the bytes of the upper part)
    inc  hl                                       ;; 00:221B $23
    inc  hl                                       ;; 00:221C $23
.lowerPartEnd

    ; Copy the first byte of the row
    ld   a, [hli]                                 ;; 00:221D $2A
    ld   [bc], a                                  ;; 00:221E $02

    ; Copy the second byte of the row
    inc  bc                                       ;; 00:221F $03
    ld   a, [hl]                                  ;; 00:2220 $7E
    ld   [bc], a                                  ;; 00:2221 $02

    ; bc = bc + 1
    inc  bc                                       ;; 00:2222 $03
    ret                                           ;; 00:2223 $C9

; Copy two vertically-adjacent bytes, from the object tilemap/attrmap to the BG tilemap.
;
; The object tilemap/attrmap is made of 4 bytes (one for each tile), laid out as:
;  0 1
;  2 3
;
; This function will copy either bytes 0 and 2, or bytes 1 and 3.
;
; Inputs:
;   hl   pointer to the object tilemap/attrmap (4 bytes)
;   bc   the BG map location to copy the tiles to
CopyObjectColumnToBGMap::
    ; If copying the right side of the tilemap/attrmap…
    ld   a, [wBGUpdateRegionOriginLow]            ;; 00:2224 $FA $27 $C1
    and  $01                                      ;; 00:2227 $E6 $01
    jr   z, .rightHandEnd                         ;; 00:2229 $28 $01
    ; …start the copy from byte 1 (the first byte of the right side)
    inc  hl                                       ;; 00:222B $23
.rightHandEnd

    ; Copy the first byte of the column
    ; [bc] = [hl]
    ld   a, [hli]                                 ;; 00:222C $2A
    ld   [bc], a                                  ;; 00:222D $02

    ; Copy the second byte of the column
    ; [bc + 1] = [hl + 2]
    inc  hl                                       ;; 00:222E $23
    inc  bc                                       ;; 00:222F $03
    ld   a, [hl]                                  ;; 00:2230 $7E
    ld   [bc], a                                  ;; 00:2231 $02

    ; bc = bc + 1
    inc  bc                                       ;; 00:2232 $03
    ret                                           ;; 00:2233 $C9

; Update a region (row or column) of the BG map with object tiles
; and attributes during a room transition
DoUpdateBGRegion::
    ; Configures an async data request to copy the BG tilemap
    callsb func_020_4A76                          ;; 00:2234 $3E $20 $EA $00 $21 $CD $76 $4A

    ; Switch back to the objects tilemap bank
    ld   a, $08                                   ;; 00:223C $3E $08
    ld   [rSelectROMBank], a                      ;; 00:223E $EA $00 $21

.loop
    push bc                                       ;; 00:2241 $C5
    push de                                       ;; 00:2242 $D5

    ; Store the room object to be copied into bc
    ; bc = wRoomObjects[hMultiPurpose2]
    ldh  a, [hMultiPurpose2]                      ;; 00:2243 $F0 $D9
    ld   c, a                                     ;; 00:2245 $4F
    ld   b, $00                                   ;; 00:2246 $06 $00
    ld   hl, wRoomObjects                         ;; 00:2248 $21 $11 $D7
    add  hl, bc                                   ;; 00:224B $09
    ld   b, $00                                   ;; 00:224C $06 $00
    ld   c, [hl]                                  ;; 00:224E $4E

    ; When on the GBC Overworld, read the object value from WRAM2 instead
    ; (See BackupObjectInRAM2)
    ldh  a, [hIsGBC]                              ;; 00:224F $F0 $FE
    and  a                                        ;; 00:2251 $A7
    jr   z, .ramSwitchEnd                         ;; 00:2252 $28 $0E
    ld   a, [wIsIndoor]                           ;; 00:2254 $FA $A5 $DB
    and  a                                        ;; 00:2257 $A7
    jr   nz, .ramSwitchEnd                        ;; 00:2258 $20 $08
    ; Switch to RAM Bank 2,
    ld   a, $02                                   ;; 00:225A $3E $02
    ldh  [rSVBK], a                               ;; 00:225C $E0 $70
    ; read the object value,
    ld   c, [hl]                                  ;; 00:225E $4E
    ; switch back to RAM Bank 0.
    xor  a                                        ;; 00:225F $AF
    ldh  [rSVBK], a                               ;; 00:2260 $E0 $70
.ramSwitchEnd

    ; bc = bc * 4
    sla  c                                        ;; 00:2262 $CB $21
    rl   b                                        ;; 00:2264 $CB $10
    sla  c                                        ;; 00:2266 $CB $21
    rl   b                                        ;; 00:2268 $CB $10

    ;
    ; Select the base objects tilemap
    ;

    ; If IsIndoor…
    ld   a, [wIsIndoor]                           ;; 00:226A $FA $A5 $DB
    and  a                                        ;; 00:226D $A7
    jr   z, .baseAddress_isOverworld              ;; 00:226E $28 $16
    ld   hl, IndoorObjectsTilemapDMG              ;; 00:2270 $21 $00 $40
    ; if IsGBC…
    ldh  a, [hIsGBC]                              ;; 00:2273 $F0 $FE
    and  a                                        ;; 00:2275 $A7
    jr   z, .palettesskipEntityLoad               ;; 00:2276 $28 $21
    ; … hl = (MapId == MAP_COLOR_DUNGEON ? ColorDungeonObjectsTilemap : IndoorObjectsTilemapCGB)
    ld   hl, IndoorObjectsTilemapCGB              ;; 00:2278 $21 $B0 $43
    ldh  a, [hMapId]                              ;; 00:227B $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:227D $FE $FF
    jr   nz, .configureAttributesAddress          ;; 00:227F $20 $10
    ld   hl, ColorDungeonObjectsTilemap           ;; 00:2281 $21 $60 $47
    jr   .configureAttributesAddress              ;; 00:2284 $18 $0B

.baseAddress_isOverworld
    ld   hl, OverworldObjectsTilemapDMG           ;; 00:2286 $21 $49 $67

    ; On GBC, use the GBC objects tilemap, and configure the objects attributes
    ldh  a, [hIsGBC]                              ;; 00:2289 $F0 $FE
    and  a                                        ;; 00:228B $A7
    jr   z, .palettesskipEntityLoad               ;; 00:228C $28 $0B
    ld   hl, OverworldObjectsTilemapCGB           ;; 00:228E $21 $1D $6B

    ;
    ; Tile attributes configuration (GBC only)
    ;

.configureAttributesAddress
    ; Set the object attributes bank in hMultiPurpose8,
    ; and the target BG attributes address in FFE0-FFE1
    callsb GetBGAttributesAddressForObject        ;; 00:2291 $3E $1A $EA $00 $21 $CD $76 $65
.palettesskipEntityLoad

    ;
    ; Copy a single row or column of the object tilemap and attributes
    ;

    ; Switch to the bank containing the objects tilemap
    call SwitchToObjectsTilemapBank               ;; 00:2299 $CD $05 $39
    ; hl = objects tilemap address + object index
    add  hl, bc                                   ;; 00:229C $09
    pop  de                                       ;; 00:229D $D1
    pop  bc                                       ;; 00:229E $C1

    ; If the Room transition is vertical…
    ld   a, [wRoomTransitionDirection]            ;; 00:229F $FA $25 $C1
    and  DIRECTION_VERTICAL_MASK                  ;; 00:22A2 $E6 $02
    jr   z, .horizontalRoomTransition             ;; 00:22A4 $28 $2D

    ; Copy a row of the object tilemap
    call CopyObjectRowToBGMap                     ;; 00:22A6 $CD $14 $22

    ; On GBC, load object attributes data
    ldh  a, [hIsGBC]                              ;; 00:22A9 $F0 $FE
    and  a                                        ;; 00:22AB $A7
    jr   z, .verticalTileAttributesEnd            ;; 00:22AC $28 $23
    push bc                                       ;; 00:22AE $C5
    push de                                       ;; 00:22AF $D5
    callsb func_020_49D9                          ;; 00:22B0 $3E $20 $EA $00 $21 $CD $D9 $49

    ; Select object attributes bank
    ldh  a, [hMultiPurpose8]                      ;; 00:22B8 $F0 $DF
    ld   [rSelectROMBank], a                      ;; 00:22BA $EA $00 $21
    ; Copy a row of the object attributes
    call CopyObjectRowToBGMap                     ;; 00:22BD $CD $14 $22
    ld   a, b                                     ;; 00:22C0 $78
    ldh  [hMultiPurposeB], a                      ;; 00:22C1 $E0 $E2
    ld   a, c                                     ;; 00:22C3 $79
    ldh  [hMultiPurposeC], a                      ;; 00:22C4 $E0 $E3
    ld   a, d                                     ;; 00:22C6 $7A
    ldh  [hMultiPurposeD], a                      ;; 00:22C7 $E0 $E4
    ld   a, e                                     ;; 00:22C9 $7B
    ldh  [hMultiPurposeE], a                      ;; 00:22CA $E0 $E5
    ; Restore state
    call SwitchToObjectsTilemapBank               ;; 00:22CC $CD $05 $39
    pop  de                                       ;; 00:22CF $D1
    pop  bc                                       ;; 00:22D0 $C1
.verticalTileAttributesEnd

    jr   .horizontalTileAttributesEnd             ;; 00:22D1 $18 $2B

.horizontalRoomTransition
    ; Copy a column of the object tilemap
    call CopyObjectColumnToBGMap                  ;; 00:22D3 $CD $24 $22

    ; If IsGBC…
    ldh  a, [hIsGBC]                              ;; 00:22D6 $F0 $FE
    and  a                                        ;; 00:22D8 $A7
    jr   z, .horizontalTileAttributesEnd          ;; 00:22D9 $28 $23
    ; Load BG palette data
    push bc                                       ;; 00:22DB $C5
    push de                                       ;; 00:22DC $D5
    callsb func_020_49D9                          ;; 00:22DD $3E $20 $EA $00 $21 $CD $D9 $49
    ; Select BG attributes bank
    ldh  a, [hMultiPurpose8]                      ;; 00:22E5 $F0 $DF
    ld   [rSelectROMBank], a                      ;; 00:22E7 $EA $00 $21
    ; Copy a column of the object attributes
    call CopyObjectColumnToBGMap                  ;; 00:22EA $CD $24 $22
    ld   a, b                                     ;; 00:22ED $78
    ldh  [hMultiPurposeB], a                      ;; 00:22EE $E0 $E2
    ld   a, c                                     ;; 00:22F0 $79
    ldh  [hMultiPurposeC], a                      ;; 00:22F1 $E0 $E3
    ld   a, d                                     ;; 00:22F3 $7A
    ldh  [hMultiPurposeD], a                      ;; 00:22F4 $E0 $E4
    ld   a, e                                     ;; 00:22F6 $7B
    ldh  [hMultiPurposeE], a                      ;; 00:22F7 $E0 $E5
    ; Cleanup
    call SwitchToObjectsTilemapBank               ;; 00:22F9 $CD $05 $39
    pop  de                                       ;; 00:22FC $D1
    pop  bc                                       ;; 00:22FD $C1
.horizontalTileAttributesEnd

    push bc                                       ;; 00:22FE $C5
    ; Increment BG destination address
    ; (by a column or by a row)
    ld   a, [wRoomTransitionDirection]            ;; 00:22FF $FA $25 $C1
    ld   c, a                                     ;; 00:2302 $4F
    ld   b, $00                                   ;; 00:2303 $06 $00
    ld   hl, BGRegionIncrement                    ;; 00:2305 $21 $05 $22
    add  hl, bc                                   ;; 00:2308 $09
    ldh  a, [hMultiPurpose2]                      ;; 00:2309 $F0 $D9
    add  a, [hl]                                  ;; 00:230B $86
    ldh  [hMultiPurpose2], a                      ;; 00:230C $E0 $D9
    pop  bc                                       ;; 00:230E $C1

    ; Decrement loop counter
    ld   a, [wBGUpdateRegionTilesCount]           ;; 00:230F $FA $28 $C1
    dec  a                                        ;; 00:2312 $3D
    ld   [wBGUpdateRegionTilesCount], a           ;; 00:2313 $EA $28 $C1

    ; Loop until BG map data for the whole region is copied
    jp   nz, .loop                                ;; 00:2316 $C2 $41 $22

    ; Set next BG region origin, and decrement wRoomTransitionFramesBeforeMidScreen
    jpsb UpdateBGRegionOrigin                     ;; 00:2319 $3E $20 $EA $00 $21 $C3 $70 $55

include "code/home/dialog.asm"

; Set the music track to play on the world
; Input:
;   a:   soundtrack id to load
SetWorldMusicTrack::
    ld   [wMusicTrackToPlay], a                   ;; 00:27C3 $EA $68 $D3
    ldh  [hNextDefaultMusicTrack], a              ;; 00:27C6 $E0 $BF
    ; Sets the music fade in timer to $38
    ld   a, $38                                   ;; 00:27C8 $3E $38
    ldh  [hMusicFadeInTimer], a                   ;; 00:27CA $E0 $AB
    ; Prematurely sets the timer to zero, to skip a tiny part of the fade at the end and skip straight to playing the new area's music track.
    xor  a                                        ;; 00:27CC $AF
    ldh  [hMusicFadeOutTimer], a                  ;; 00:27CD $E0 $A8
    ret                                           ;; 00:27CF $C9

EnableSRAM::
    push hl                                       ;; 00:27D0 $E5
    ld   hl, rRAMB                                ;; 00:27D1 $21 $00 $40
    ld   [hl], $00 ; Switch to RAM bank 0         ;; 00:27D4 $36 $00
    ld   hl, rRAMG                                ;; 00:27D6 $21 $00 $00
    ld   [hl], CART_SRAM_ENABLE ; Enable external RAM ;; 00:27D9 $36 $0A
    pop  hl                                       ;; 00:27DB $E1
    ret                                           ;; 00:27DC $C9

; Load soudtrack after map or gameplay transition
label_27DD::
    ld   a, BANK(SelectMusicTrackAfterTransition) ;; 00:27DD $3E $02
    ld   [rSelectROMBank], a                      ;; 00:27DF $EA $00 $21
    push bc                                       ;; 00:27E2 $C5
    call SelectMusicTrackAfterTransition          ;; 00:27E3 $CD $46 $41
    pop  bc                                       ;; 00:27E6 $C1
    jp   ReloadSavedBank                          ;; 00:27E7 $C3 $1D $08

ResetMusicFadeTimer::
    ; set fade out timer to max
    ld   a, MUSIC_FADE_OUT_TIMER_MAX              ;; 00:27EA $3E $38
    ldh  [hMusicFadeOutTimer], a                  ;; 00:27EC $E0 $A8
    ; set fade in timer to 0
    xor  a                                        ;; 00:27EE $AF
    ldh  [hMusicFadeInTimer], a                   ;; 00:27EF $E0 $AB
    ret                                           ;; 00:27F1 $C9

label_27F2::
    ldh  a, [hContinueMusicAfterWarp]             ;; 00:27F2 $F0 $BC
    and  a                                        ;; 00:27F4 $A7
    jr   nz, .skip                                ;; 00:27F5 $20 $08
    callsb func_01F_4003                          ;; 00:27F7 $3E $1F $EA $00 $21 $CD $03 $40
.skip
    jp   ReloadSavedBank                          ;; 00:27FF $C3 $1D $08

SynchronizeDungeonsItemFlags_trampoline::
    callsb SynchronizeDungeonsItemFlags           ;; 00:2802 $3E $01 $EA $00 $21 $CD $67 $5E
    jp   ReloadSavedBank                          ;; 00:280A $C3 $1D $08

; Return a random number in `a`
GetRandomByte::
    push hl                                       ;; 00:280D $E5
    ldh  a, [hFrameCounter]                       ;; 00:280E $F0 $E7
    ld   hl, wRandomSeed                          ;; 00:2810 $21 $3D $C1
    add  a, [hl]                                  ;; 00:2813 $86
    ld   hl, rLY                                  ;; 00:2814 $21 $44 $FF
    add  a, [hl]                                  ;; 00:2817 $86
    rrca                                          ;; 00:2818 $0F
    ld   [wRandomSeed], a ; wRandomSeed += FrameCounter + rrca(rLY) ;; 00:2819 $EA $3D $C1
    pop  hl                                       ;; 00:281C $E1
    ret                                           ;; 00:281D $C9

ReadJoypadState::
    ; Ignore joypad during map transitions
    ld   a, [wRoomTransitionState]                ;; 00:281E $FA $24 $C1
    and  a                                        ;; 00:2821 $A7
    jr   nz, .return                              ;; 00:2822 $20 $62

    ; Ignore joypad while the world is not interactive
    ld   a, [wGameplayType]                       ;; 00:2824 $FA $95 $DB
    cp   GAMEPLAY_WORLD                           ;; 00:2827 $FE $0B
    jr   nz, .readState                           ;; 00:2829 $20 $27
    ld   a, [wGameplaySubtype]                    ;; 00:282B $FA $96 $DB
    cp   GAMEPLAY_WORLD_INTERACTIVE               ;; 00:282E $FE $07
    jr   nz, .notInteractive                      ;; 00:2830 $20 $1A

    ; TODO: document this case
    ld   a, [wLinkMotionState]                    ;; 00:2832 $FA $1C $C1
    cp   LINK_MOTION_PASS_OUT                     ;; 00:2835 $FE $07
    jr   nz, .linkPassingOutEnd                   ;; 00:2837 $20 $06
    ldh  a, [hLinkPhysicsModifier]                ;; 00:2839 $F0 $9C
    cp   $04                                      ;; 00:283B $FE $04
    jr   z, .readState                            ;; 00:283D $28 $13
.linkPassingOutEnd

    ld   a, [wTransitionSequenceCounter]          ;; 00:283F $FA $6B $C1
    cp   $04                                      ;; 00:2842 $FE $04
    jr   nz, .notInteractive                      ;; 00:2844 $20 $06
    ld   a, [wPaletteUnknownE]                    ;; 00:2846 $FA $D5 $DD
    and  a                                        ;; 00:2849 $A7
    jr   z, .readState                            ;; 00:284A $28 $06

.notInteractive
    ; Clear joypad and return
    xor  a                                        ;; 00:284C $AF
    ldh  [hPressedButtonsMask], a                 ;; 00:284D $E0 $CB
    ldh  [hJoypadState], a                        ;; 00:284F $E0 $CC

    ret                                           ;; 00:2851 $C9

.readState
    ld   a, J_BUTTONS                             ;; 00:2852 $3E $20
    ldh  [rP1], a                                 ;; 00:2854 $E0 $00
    ldh  a, [rP1]                                 ;; 00:2856 $F0 $00
    ldh  a, [rP1]                                 ;; 00:2858 $F0 $00
    cpl                                           ;; 00:285A $2F
    and  $0F                                      ;; 00:285B $E6 $0F
    ld   b, a                                     ;; 00:285D $47
    ld   a, J_DPAD                                ;; 00:285E $3E $10
    ldh  [rP1], a                                 ;; 00:2860 $E0 $00
    ldh  a, [rP1]                                 ;; 00:2862 $F0 $00
    ldh  a, [rP1]                                 ;; 00:2864 $F0 $00
    ldh  a, [rP1]                                 ;; 00:2866 $F0 $00
    ldh  a, [rP1]                                 ;; 00:2868 $F0 $00
    ldh  a, [rP1]                                 ;; 00:286A $F0 $00
    ldh  a, [rP1]                                 ;; 00:286C $F0 $00
    ldh  a, [rP1]                                 ;; 00:286E $F0 $00
    ldh  a, [rP1]                                 ;; 00:2870 $F0 $00
    swap a                                        ;; 00:2872 $CB $37
    cpl                                           ;; 00:2874 $2F
    and  $F0                                      ;; 00:2875 $E6 $F0
    or   b                                        ;; 00:2877 $B0
    ld   c, a                                     ;; 00:2878 $4F
    ldh  a, [hPressedButtonsMask]                 ;; 00:2879 $F0 $CB
    xor  c                                        ;; 00:287B $A9
    and  c                                        ;; 00:287C $A1
    ldh  [hJoypadState], a                        ;; 00:287D $E0 $CC
    ld   a, c                                     ;; 00:287F $79
    ldh  [hPressedButtonsMask], a                 ;; 00:2880 $E0 $CB
    ld   a, J_BUTTONS | J_DPAD                    ;; 00:2882 $3E $30
    ldh  [rP1], a                                 ;; 00:2884 $E0 $00

.return
    ret                                           ;; 00:2886 $C9

; Get BG address of the object under hIntersectedObjectLeft/Y
; Return:
;   hIntersectedObjectBGAddressHigh / hIntersectedObjectBGAddressLow: BG address of the top-left tile of the object
label_2887::
    push bc                                       ;; 00:2887 $C5

    ;
    ; de = ([hIntersectedObjectTop]  + [hBaseScrollY]) / 8
    ldh  a, [hIntersectedObjectTop]               ;; 00:2888 $F0 $CD
    ld   hl, hBaseScrollY                         ;; 00:288A $21 $97 $FF
    add  a, [hl]                                  ;; 00:288D $86
    and  $F8 ; a - a % $8                         ;; 00:288E $E6 $F8
    srl  a                                        ;; 00:2890 $CB $3F
    srl  a                                        ;; 00:2892 $CB $3F
    srl  a                                        ;; 00:2894 $CB $3F
    ld   de, $00                                  ;; 00:2896 $11 $00 $00
    ld   e, a                                     ;; 00:2899 $5F

    ; hl = hl + (de * $20)
    ld   hl, vBGMap0                              ;; 00:289A $21 $00 $98
    ld   b, $20                                   ;; 00:289D $06 $20
.loop
    add  hl, de                                   ;; 00:289F $19
    dec  b                                        ;; 00:28A0 $05
    jr   nz, .loop                                ;; 00:28A1 $20 $FC
    push hl                                       ;; 00:28A3 $E5

    ; a = (([hIntersectedObjectLeft] + [hBaseScrollX]) / 8)
    ldh  a, [hIntersectedObjectLeft]              ;; 00:28A4 $F0 $CE
    ld   hl, hBaseScrollX                         ;; 00:28A6 $21 $96 $FF
    add  a, [hl]                                  ;; 00:28A9 $86
    pop  hl                                       ;; 00:28AA $E1
    and  $F8 ; a - a % $8                         ;; 00:28AB $E6 $F8
    srl  a                                        ;; 00:28AD $CB $3F
    srl  a                                        ;; 00:28AF $CB $3F
    srl  a                                        ;; 00:28B1 $CB $3F
    ld   de, $00                                  ;; 00:28B3 $11 $00 $00
    ld   e, a                                     ;; 00:28B6 $5F
    add  hl, de                                   ;; 00:28B7 $19

    ld   a, h                                     ;; 00:28B8 $7C
    ldh  [hIntersectedObjectBGAddressHigh], a     ;; 00:28B9 $E0 $CF
    ld   a, l                                     ;; 00:28BB $7D
    ldh  [hIntersectedObjectBGAddressLow], a      ;; 00:28BC $E0 $D0
    pop  bc                                       ;; 00:28BE $C1
    ret                                           ;; 00:28BF $C9

; Jump to the routine defined at the given index in the jump table.
;
; Usage:
;   ld   a, <routine_index>
;   rst  0
;   dw   Func_0E00 ; jump address for index 0
;   dw   Func_0F00 ; jump address for index 1
;   ...
;
; Input:
;   a:  index of the routine address in the jump table
TableJump::
    ld   e, a    ; \                              ;; 00:28C0 $5F
    ld   d, $00  ; | Multiply the index by 2, and store it in de ;; 00:28C1 $16 $00
    sla  e       ; |                              ;; 00:28C3 $CB $23
    rl   d       ; /                              ;; 00:28C5 $CB $12
    pop  hl                                       ;; 00:28C7 $E1
    add  hl, de  ; Add the base address and the offset ;; 00:28C8 $19
    ld   e, [hl] ; Load the low byte of the target address ;; 00:28C9 $5E
    inc  hl                                       ;; 00:28CA $23
    ld   d, [hl] ; Load the high byte of the target address ;; 00:28CB $56
    ld   l, e                                     ;; 00:28CC $6B
    ld   h, d                                     ;; 00:28CD $62
    jp   hl    ; Jump to the target address       ;; 00:28CE $E9

; Turn off LCD at next vertical blanking
LCDOff::
    ; Save interrupts configuration
    ldh  a, [rIE]                                 ;; 00:28CF $F0 $FF
    ldh  [hInterrupts], a                         ;; 00:28D1 $E0 $D2
    ; Disable VBlank interrupt
    res  IEB_VBLANK, a                            ;; 00:28D3 $CB $87
    ldh  [rIE], a                                 ;; 00:28D5 $E0 $FF

    ; Wait for row 145
.waitForEndOfLine
    ldh  a, [rLY]                                 ;; 00:28D7 $F0 $44
    cp   SCRN_Y + 1                               ;; 00:28D9 $FE $91
    jr   nz, .waitForEndOfLine                    ;; 00:28DB $20 $FA

    ; Switch off LCD screen
    ldh  a, [rLCDC]                               ;; 00:28DD $F0 $40
    and  ~LCDCF_ON                                ;; 00:28DF $E6 $7F
    ldh  [rLCDC], a                               ;; 00:28E1 $E0 $40

    ; Restore interrupts configuration
    ldh  a, [hInterrupts]                         ;; 00:28E3 $F0 $D2
    ldh  [rIE], a                                 ;; 00:28E5 $E0 $FF

    ret                                           ;; 00:28E7 $C9

LoadTileset0F_trampoline::
    jpsw LoadTileset0F                            ;; 00:28E8 $3E $01 $CD $0C $08 $C3 $E3 $6C

; Fill the Background Map with black tiles
FillBGMapBlack::
    ld   a, DIALOG_BG_TILE_DARK   ; value         ;; 00:28F0 $3E $7E
    ld   bc, $400 ; count                         ;; 00:28F2 $01 $00 $04
    jr   FillBGMap                                ;; 00:28F5 $18 $05

; Fill the Background Map with white tiles
FillBGMapWhite::
    ld   a, $7F    ; value                        ;; 00:28F7 $3E $7F
    ld   bc, $800 ; count                         ;; 00:28F9 $01 $00 $08
    ; fallthrough to FillBGMap

; Fill the Background map with a value
; Inputs:
;   a  : value to fill
;   bc : count
FillBGMap::
    ld   d, a                                     ;; 00:28FC $57
    ld   hl, vBGMap0                              ;; 00:28FD $21 $00 $98
.loop
    ld   a, d                                     ;; 00:2900 $7A
    ldi  [hl], a                                  ;; 00:2901 $22
    dec  bc                                       ;; 00:2902 $0B
    ld   a, b                                     ;; 00:2903 $78
    or   c                                        ;; 00:2904 $B1
    jr   nz, .loop                                ;; 00:2905 $20 $F9
    ret                                           ;; 00:2907 $C9

include "code/home/copy_data.asm"

include "code/home/clear_memory.asm"

GetChestsStatusForRoom_trampoline::
    callsb GetChestsStatusForRoom                 ;; 00:29ED $3E $14 $EA $00 $21 $CD $84 $58
    jp   ReloadSavedBank                          ;; 00:29F5 $C3 $1D $08

; Play the boomerang sound effect, then reload the current bank
PlayBoomerangSfx_trampoline::
    callsb PlayBoomerangSfx                       ;; 00:29F8 $3E $20 $EA $00 $21 $CD $98 $4C
    ld   a, [wCurrentBank]                        ;; 00:2A00 $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:2A03 $EA $00 $21
    ret                                           ;; 00:2A06 $C9

label_2A07::
    callsb func_001_5A59                          ;; 00:2A07 $3E $01 $EA $00 $21 $CD $59 $5A
    jp   ReloadSavedBank                          ;; 00:2A0F $C3 $1D $08

; Read the physics flags for a given static object.
; Inputs:
;   d    map group id
;   e    room object id
; Return:
;   a    physics flags for the object
GetObjectPhysicsFlags::
    ld   a, BANK(OverworldObjectPhysicFlags)      ;; 00:2A12 $3E $08
    ld   [rSelectROMBank], a                      ;; 00:2A14 $EA $00 $21
    ld   hl, OverworldObjectPhysicFlags           ;; 00:2A17 $21 $D4 $4A
    ldh  a, [hMapId]                              ;; 00:2A1A $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:2A1C $FE $FF
    jr   nz, .colorDungeonEnd                     ;; 00:2A1E $20 $03
    ld   hl, Indoors1ObjectPhysicFlags            ;; 00:2A20 $21 $D4 $4B
.colorDungeonEnd
    add  hl, de                                   ;; 00:2A23 $19
    ld   a, [hl]                                  ;; 00:2A24 $7E
    ret                                           ;; 00:2A25 $C9

GetObjectPhysicsFlags_trampoline::
    call GetObjectPhysicsFlags                    ;; 00:2A26 $CD $12 $2A
    jp   ReloadSavedBank                          ;; 00:2A29 $C3 $1D $08

GetObjectPhysicsFlagsAndRestoreBank3::
    call GetObjectPhysicsFlags                    ;; 00:2A2C $CD $12 $2A
    push af                                       ;; 00:2A2F $F5
    ld   a, $03                                   ;; 00:2A30 $3E $03
    ld   [rSelectROMBank], a                      ;; 00:2A32 $EA $00 $21
    pop  af                                       ;; 00:2A35 $F1
    ret                                           ;; 00:2A36 $C9

LoadCreditsKoholintDisappearingTiles::
    ld   a, BANK(EndingTiles)                     ;; 00:2A37 $3E $13
    call AdjustBankNumberForGBC                   ;; 00:2A39 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2A3C $EA $00 $21

    ld   hl, EndingTiles + $2800                  ;; 00:2A3F $21 $00 $68
    ld   de, vTiles2                              ;; 00:2A42 $11 $00 $90
    ld   bc, TILE_SIZE * $80                      ;; 00:2A45 $01 $00 $08
    call CopyData                                 ;; 00:2A48 $CD $14 $29

    ld   hl, EndingTiles + $3000                  ;; 00:2A4B $21 $00 $70
    ld   de, vTiles1                              ;; 00:2A4E $11 $00 $88
    ld   bc, TILE_SIZE * $80                      ;; 00:2A51 $01 $00 $08
    jp   CopyData                                 ;; 00:2A54 $C3 $14 $29

; Copy tiles for the stairs sequence of credits to tiles memory
LoadCreditsStairsTiles::
    call LoadTileset15                            ;; 00:2A57 $CD $66 $2A

    ld   de, vTiles0 + $400                       ;; 00:2A5A $11 $00 $84
    ld   hl, EndingTiles + $3600                  ;; 00:2A5D $21 $00 $76
    ld   bc, TILE_SIZE * $10                      ;; 00:2A60 $01 $00 $01
    jp   CopyData                                 ;; 00:2A63 $C3 $14 $29

LoadTileset15::
    ld   a, BANK(EndingTiles)                     ;; 00:2A66 $3E $13
    call AdjustBankNumberForGBC                   ;; 00:2A68 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2A6B $EA $00 $21

    ld   hl, EndingTiles                          ;; 00:2A6E $21 $00 $40
    ld   de, vTiles0                              ;; 00:2A71 $11 $00 $80
    ld   bc, TILE_SIZE * $180                     ;; 00:2A74 $01 $00 $18
    call CopyData                                 ;; 00:2A77 $CD $14 $29

    ld   a, BANK(Overworld1Tiles)                 ;; 00:2A7A $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:2A7C $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2A7F $EA $00 $21
    ld   hl, Overworld1Tiles + $8E0 ; filler color ;; 00:2A82 $21 $E0 $57
    ld   de, vTiles2 + $7F0                       ;; 00:2A85 $11 $F0 $97
    ld   bc, TILE_SIZE                            ;; 00:2A88 $01 $10 $00
    call CopyData                                 ;; 00:2A8B $CD $14 $29

    ld   a, BANK(Npc4Tiles)                       ;; 00:2A8E $3E $12
    call AdjustBankNumberForGBC                   ;; 00:2A90 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2A93 $EA $00 $21
    ld   hl, Npc4Tiles + $100                     ;; 00:2A96 $21 $00 $75
    ld   de, vTiles0                              ;; 00:2A99 $11 $00 $80
    ld   bc, TILE_SIZE * 4                        ;; 00:2A9C $01 $40 $00
    call CopyData                                 ;; 00:2A9F $CD $14 $29

    ld   de, vTiles1 + $500                       ;; 00:2AA2 $11 $00 $8D
    ld   hl, Npc4Tiles + $100                     ;; 00:2AA5 $21 $00 $75
    ld   bc, TILE_SIZE * $20                      ;; 00:2AA8 $01 $00 $02
    jp   CopyData                                 ;; 00:2AAB $C3 $14 $29

; Copy tiles for the various Koholint views while the instruments are
; playing to tiles memory
LoadCreditsKoholintViewsTiles::
    ld   a, BANK(Overworld1Tiles)                 ;; 00:2AAE $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:2AB0 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2AB3 $EA $00 $21
    ld   hl, Overworld1Tiles + $100               ;; 00:2AB6 $21 $00 $50
    ld   de, vTiles2                              ;; 00:2AB9 $11 $00 $90
    ld   bc, TILE_SIZE * $80                      ;; 00:2ABC $01 $00 $08
    call CopyData                                 ;; 00:2ABF $CD $14 $29

    ld   a, BANK(Npc3Tiles)                       ;; 00:2AC2 $3E $12
    call AdjustBankNumberForGBC                   ;; 00:2AC4 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2AC7 $EA $00 $21
    ld   hl, Npc3Tiles + $2000                    ;; 00:2ACA $21 $00 $60
    ld   de, vTiles0                              ;; 00:2ACD $11 $00 $80
    ld   bc, TILE_SIZE * $80                      ;; 00:2AD0 $01 $00 $08
    call CopyData                                 ;; 00:2AD3 $CD $14 $29

    ld   a, BANK(Overworld2Tiles)                 ;; 00:2AD6 $3E $0F
    call AdjustBankNumberForGBC                   ;; 00:2AD8 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2ADB $EA $00 $21
    ld   hl, Overworld2Tiles + $600               ;; 00:2ADE $21 $00 $60
    ld   de, vTiles1                              ;; 00:2AE1 $11 $00 $88
    ld   bc, TILE_SIZE * $80                      ;; 00:2AE4 $01 $00 $08
    jp   CopyData                                 ;; 00:2AE7 $C3 $14 $29

LoadCreditsLinkOnSeaCloseTiles::
    ld   hl, EndingTiles                          ;; 00:2AEA $21 $00 $40
    ldh  a, [hIsGBC]                              ;; 00:2AED $F0 $FE
    and  a                                        ;; 00:2AEF $A7
    jr   z, label_2B01                            ;; 00:2AF0 $28 $0F
    ld   hl, PhotoAlbumTiles                      ;; 00:2AF2 $21 $00 $68
    ld   a, BANK(PhotoAlbumTiles)                 ;; 00:2AF5 $3E $35
    jr   label_2B06                               ;; 00:2AF7 $18 $0D

LoadCreditsSunAboveTiles::
    ld   hl, EndingTiles + $800                   ;; 00:2AF9 $21 $00 $48
    jr   label_2B01                               ;; 00:2AFC $18 $03

LoadCreditsLinkOnSeaLargeTiles::
    ld   hl, EndingTiles + $2000                  ;; 00:2AFE $21 $00 $60

label_2B01::
    ld   a, BANK(EndingTiles)                     ;; 00:2B01 $3E $13
    call AdjustBankNumberForGBC                   ;; 00:2B03 $CD $0B $0B

label_2B06::
    ld   [rSelectROMBank], a                      ;; 00:2B06 $EA $00 $21
    ld   de, vTiles0                              ;; 00:2B09 $11 $00 $80
    ld   bc, TILE_SIZE * $80                      ;; 00:2B0C $01 $00 $08
    call CopyData                                 ;; 00:2B0F $CD $14 $29

    ld   a, BANK(EndingTiles)                     ;; 00:2B12 $3E $13
    call AdjustBankNumberForGBC                   ;; 00:2B14 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2B17 $EA $00 $21
    ld   hl, EndingTiles + $1800                  ;; 00:2B1A $21 $00 $58
    ld   de, vTiles0 + TILE_SIZE * $80            ;; 00:2B1D $11 $00 $88
    ld   bc, TILE_SIZE * $100                     ;; 00:2B20 $01 $00 $10
    jp   CopyData                                 ;; 00:2B23 $C3 $14 $29

LoadCreditsRollTiles::
    call PlayAudioStep                            ;; 00:2B26 $CD $A4 $08

    ld   hl, FontLargeTiles + $100                ;; 00:2B29 $21 $00 $68
    ld   a, BANK(FontLargeTiles)                  ;; 00:2B2C $3E $10
    call func_2B92                                ;; 00:2B2E $CD $92 $2B

    call PlayAudioStep                            ;; 00:2B31 $CD $A4 $08

    ld   a, BANK(Npc3Tiles)                       ;; 00:2B34 $3E $12
    call AdjustBankNumberForGBC                   ;; 00:2B36 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2B39 $EA $00 $21
    ld   hl, Npc3Tiles + $2600                    ;; 00:2B3C $21 $00 $66
    ld   de, vTiles0                              ;; 00:2B3F $11 $00 $80
    ld   bc, TILE_SIZE * $8                       ;; 00:2B42 $01 $80 $00
    call CopyData                                 ;; 00:2B45 $CD $14 $29

    call PlayAudioStep                            ;; 00:2B48 $CD $A4 $08

IF __PATCH_1__
    ld   a, BANK(CharacterVfxTiles)
    ld   [rSelectROMBank], a
    ld   hl, CharacterVfxTiles + TILE_SIZE * $2
    ld   de, $8080
    ld   bc, TILE_SIZE * $2
    call CopyData
ENDC

    ldh  a, [hIsGBC]                              ;; 00:2B4B $F0 $FE
    and  a                                        ;; 00:2B4D $A7
    jr   nz, .cgbOnly                             ;; 00:2B4E $20 $11

IF __PATCH_1__
.dmgOnly
    ld   a, BANK(FontLargeTiles)
    ld   hl, FontLargeTiles + $200
    jr   .both

.cgbOnly
    ld   a, BANK(CreditsRollTiles)
    ld   hl, CreditsRollTiles + $100

.both
    ld   [rSelectROMBank], a
    ld   de, vTiles0 + $100
    ld   bc, TILE_SIZE * $70
    call CopyData

    ld   a, BANK(CreditsRollTiles)
    ld   [rSelectROMBank], a
    ld   hl, CreditsRollTiles + $0c0
    ld   de, vTiles0 + $C0
    ld   bc, TILE_SIZE * $4
    jp   CopyData
ELSE
.dmgOnly
    ld   a, BANK(FontLargeTiles)                  ;; 00:2B50 $3E $10
    ld   [rSelectROMBank], a                      ;; 00:2B52 $EA $00 $21
    ld   hl, FontLargeTiles + $200                ;; 00:2B55 $21 $00 $69
    ld   de, vTiles0 + $100                       ;; 00:2B58 $11 $00 $81
    ld   bc, TILE_SIZE * $70                      ;; 00:2B5B $01 $00 $07
    jp   CopyData                                 ;; 00:2B5E $C3 $14 $29

.cgbOnly
    ld   a, BANK(CreditsRollTiles)                ;; 00:2B61 $3E $38
    ld   [rSelectROMBank], a                      ;; 00:2B63 $EA $00 $21
    ld   hl, CreditsRollTiles                     ;; 00:2B66 $21 $00 $50
    ld   de, vTiles0                              ;; 00:2B69 $11 $00 $80
    ld   bc, TILE_SIZE * $80                      ;; 00:2B6C $01 $00 $08
    jp   CopyData                                 ;; 00:2B6F $C3 $14 $29
ENDC

LoadCreditsLinkFaceCloseUpTiles::
    ld   hl, EndingTiles + $3800                  ;; 00:2B72 $21 $00 $78
    ldh  a, [hIsGBC]                              ;; 00:2B75 $F0 $FE
    and  a                                        ;; 00:2B77 $A7
    jr   z, label_2B90                            ;; 00:2B78 $28 $16
    ld   hl, EndingCGBAltTiles                    ;; 00:2B7A $21 $00 $78
    ld   a, BANK(EndingCGBAltTiles)               ;; 00:2B7D $3E $35
    jr   label_2B95                               ;; 00:2B7F $18 $14

LoadCreditsLinkSeatedOnLogTiles::
    ld   hl, EndingTiles + $800                   ;; 00:2B81 $21 $00 $48
    ldh  a, [hIsGBC]                              ;; 00:2B84 $F0 $FE
    and  a                                        ;; 00:2B86 $A7
    jr   z, label_2B90                            ;; 00:2B87 $28 $07
    ld   hl, PhotoAlbumTiles + $800               ;; 00:2B89 $21 $00 $70
    ld   a, BANK(PhotoAlbumTiles)                 ;; 00:2B8C $3E $35
    jr   label_2B95                               ;; 00:2B8E $18 $05

label_2B90::
    ld   a, BANK(EndingTiles)                     ;; 00:2B90 $3E $13

func_2B92::
    call AdjustBankNumberForGBC                   ;; 00:2B92 $CD $0B $0B

label_2B95::
    ld   [rSelectROMBank], a                      ;; 00:2B95 $EA $00 $21
    ld   de, vTiles0                              ;; 00:2B98 $11 $00 $80
    ld   bc, TILE_SIZE * $80                      ;; 00:2B9B $01 $00 $08
    call CopyData                                 ;; 00:2B9E $CD $14 $29

    ld   a, BANK(EndingTiles)                     ;; 00:2BA1 $3E $13
    call AdjustBankNumberForGBC                   ;; 00:2BA3 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2BA6 $EA $00 $21
    ld   hl, EndingTiles + $3000                  ;; 00:2BA9 $21 $00 $70
    ld   de, vTiles1                              ;; 00:2BAC $11 $00 $88
    ld   bc, TILE_SIZE * $80                      ;; 00:2BAF $01 $00 $08
    call CopyData                                 ;; 00:2BB2 $CD $14 $29

    ld   hl, EndingTiles + $2800                  ;; 00:2BB5 $21 $00 $68
    ld   de, vTiles2                              ;; 00:2BB8 $11 $00 $90
    ld   bc, TILE_SIZE * $80                      ;; 00:2BBB $01 $00 $08
    jp   CopyData                                 ;; 00:2BBE $C3 $14 $29

label_2BC1::
    push bc                                       ;; 00:2BC1 $C5
    callsb func_014_5838                          ;; 00:2BC2 $3E $14 $EA $00 $21 $CD $38 $58
    call ReloadSavedBank                          ;; 00:2BCA $CD $1D $08
    pop  bc                                       ;; 00:2BCD $C1
    ret                                           ;; 00:2BCE $C9

; Load the basic tiles (Link's character, items icons) to tile memory
LoadBaseTiles::
    ; Select the tiles sheet bank ($0C on DMG, $2C on GBC)
    ld   a, BANK(LinkCharacterTiles)              ;; 00:2BCF $3E $0C
    call SwitchAdjustedBank                       ;; 00:2BD1 $CD $13 $08
    ; Copy $400 bytes from the link's tile sheet to Tiles map 0
    ld   hl, LinkCharacterTiles                   ;; 00:2BD4 $21 $00 $40
    ld   de, vTiles0                              ;; 00:2BD7 $11 $00 $80
    ld   bc, TILE_SIZE * $40                      ;; 00:2BDA $01 $00 $04
    call CopyData                                 ;; 00:2BDD $CD $14 $29

    ; Select the tiles sheet bank ($0C on DMG, $2C on GBC)
    ld   a, BANK(InventoryEquipmentItemsTiles)    ;; 00:2BE0 $3E $0C
    call SwitchAdjustedBank                       ;; 00:2BE2 $CD $13 $08
    ; Copy $1000 bytes from the items tile sheet to Tiles Map 1
    ld   hl, InventoryEquipmentItemsTiles         ;; 00:2BE5 $21 $00 $48
    ld   de, vTiles1                              ;; 00:2BE8 $11 $00 $88
    ld   bc, TILE_SIZE * $100                     ;; 00:2BEB $01 $00 $10
    call CopyData                                 ;; 00:2BEE $CD $14 $29

    ; Copy two tiles from the items tile sheet to a portion of Tiles Map 1
    ld   hl, Items1Tiles + $3A0                   ;; 00:2BF1 $21 $A0 $47
    ld   de, vTiles1 + $600                       ;; 00:2BF4 $11 $00 $8E
    ld   bc, TILE_SIZE * $2                       ;; 00:2BF7 $01 $20 $00
    call CopyData                                 ;; 00:2BFA $CD $14 $29

    ; Switch back to bank 1
    ld   a, $01                                   ;; 00:2BFD $3E $01
    call SwitchBank                               ;; 00:2BFF $CD $0C $08
    ret                                           ;; 00:2C02 $C9

; Copy base tiles and tiles used for menus to tiles memory
LoadMenuTiles::
    call LoadBaseTiles                            ;; 00:2C03 $CD $CF $2B

    ; Select the tiles sheet bank ($0F on DMG, $2F on GBC)
    ld   a, BANK(MenuTiles)                       ;; 00:2C06 $3E $0F
    call SwitchAdjustedBank                       ;; 00:2C08 $CD $13 $08
    ; Copy $400 bytes from the menu tile sheet to Tiles Map 1
    ld   hl, MenuTiles                            ;; 00:2C0B $21 $00 $40
    ld   de, vTiles1                              ;; 00:2C0E $11 $00 $88
    ld   bc, $400                                 ;; 00:2C11 $01 $00 $04
    call CopyData                                 ;; 00:2C14 $CD $14 $29

    ; Select the tiles sheet bank ($0F on DMG, $2F on GBC)
    ld   a, BANK(FontTiles)                       ;; 00:2C17 $3E $0F
    call SwitchAdjustedBank                       ;; 00:2C19 $CD $13 $08
    ; Copy $800 bytes from the menu tile sheet to Tiles Map 2
    ld   hl, FontTiles                            ;; 00:2C1C $21 $00 $50
    ld   de, vTiles2                              ;; 00:2C1F $11 $00 $90
    ld   bc, $800                                 ;; 00:2C22 $01 $00 $08
    jp   CopyData ; tail-call                     ;; 00:2C25 $C3 $14 $29

; Copy tiles for an indoor room (floor, objects, walls, items, inventory)
; to tile memory.
LoadIndoorTiles::
    ;
    ; Load floor tiles
    ;

    ld   a, BANK(DungeonFloorTilesPointers)       ;; 00:2C28 $3E $20
    call SwitchBank                               ;; 00:2C2A $CD $0C $08
    ld   hl, DungeonFloorTilesPointers            ;; 00:2C2D $21 $89 $45

    ; If inside the Color Dungeon…
    ldh  a, [hMapId]                              ;; 00:2C30 $F0 $F7
    ld   e, a                                     ;; 00:2C32 $5F
    ld   d, $00                                   ;; 00:2C33 $16 $00
    cp   MAP_COLOR_DUNGEON                        ;; 00:2C35 $FE $FF
    jr   nz, .notColorDungeon                     ;; 00:2C37 $20 $1A

    ld   a, BANK(ColorDungeonTiles)               ;; 00:2C39 $3E $35
    ld   [rSelectROMBank], a                      ;; 00:2C3B $EA $00 $21
    ld   hl, ColorDungeonTiles + $200             ;; 00:2C3E $21 $00 $62
    ld   de, vTiles2                              ;; 00:2C41 $11 $00 $90
    ld   bc, TILE_SIZE * $10                      ;; 00:2C44 $01 $00 $01
    call CopyData                                 ;; 00:2C47 $CD $14 $29

    ld   e, $00                                   ;; 00:2C4A $1E $00
    ld   d, e                                     ;; 00:2C4C $53
    ld   hl, ColorDungeonTiles                    ;; 00:2C4D $21 $00 $60
    push de                                       ;; 00:2C50 $D5
    jr   .endIf                                   ;; 00:2C51 $18 $0A

.notColorDungeon
    ; Read a data pointer from DungeonFloorTilesPointers
    push de                                       ;; 00:2C53 $D5
    add  hl, de                                   ;; 00:2C54 $19
    ld   h, [hl]                                  ;; 00:2C55 $66
    ld   l, $00                                   ;; 00:2C56 $2E $00
    ld   a, BANK(DungeonsTiles)                   ;; 00:2C58 $3E $0D
    call SwitchAdjustedBank                       ;; 00:2C5A $CD $13 $08
.endIf

    ld   de, vTiles2 + $100                       ;; 00:2C5D $11 $00 $91
    ld   bc, TILE_SIZE * $10                      ;; 00:2C60 $01 $00 $01
    call CopyData                                 ;; 00:2C63 $CD $14 $29

    ;
    ; Load dungeon shared objects (doors, stairs, torches, etc)
    ;

    ld   a, BANK(DungeonsTiles)                   ;; 00:2C66 $3E $0D
    call SwitchAdjustedBank                       ;; 00:2C68 $CD $13 $08
    ld   hl, DungeonsTiles                        ;; 00:2C6B $21 $00 $40
    ld   de, vTiles2 + $200                       ;; 00:2C6E $11 $00 $92
    ld   bc, TILE_SIZE * $60                      ;; 00:2C71 $01 $00 $06
    call CopyData                                 ;; 00:2C74 $CD $14 $29

    ;
    ; Load indoor walls
    ;

    ld   a, BANK(DungeonWallsTilesPointers)       ;; 00:2C77 $3E $20
    ld   [rSelectROMBank], a                      ;; 00:2C79 $EA $00 $21
    pop  de                                       ;; 00:2C7C $D1
    push de                                       ;; 00:2C7D $D5
    ld   hl, DungeonWallsTilesPointers            ;; 00:2C7E $21 $A9 $45
    ldh  a, [hMapId]                              ;; 00:2C81 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:2C83 $FE $FF
    jr   nz, .colorDungeonEnd                     ;; 00:2C85 $20 $03
    ld   hl, ColorDungeonWallsTilesPointers       ;; 00:2C87 $21 $C9 $45
.colorDungeonEnd

    add  hl, de                                   ;; 00:2C8A $19
    ld   h, [hl]                                  ;; 00:2C8B $66
    ld   l, $00                                   ;; 00:2C8C $2E $00
    call ReloadSavedBank                          ;; 00:2C8E $CD $1D $08
    ld   de, vTiles2 + $200                       ;; 00:2C91 $11 $00 $92
    ld   bc, TILE_SIZE * $20                      ;; 00:2C94 $01 $00 $02
    call CopyData                                 ;; 00:2C97 $CD $14 $29

    ld   a, BANK(Items1Tiles)                     ;; 00:2C9A $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:2C9C $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2C9F $EA $00 $21
    ld   hl, Items1Tiles + $3C0                   ;; 00:2CA2 $21 $C0 $47
    ld   de, wAnimatedScrollingTilesStorage       ;; 00:2CA5 $11 $C0 $DC
    ld   bc, TILE_SIZE * $4                       ;; 00:2CA8 $01 $40 $00
    call CopyData                                 ;; 00:2CAB $CD $14 $29

    call func_2D50                                ;; 00:2CAE $CD $50 $2D

    ;
    ; Load indoor objects
    ;

    ; Read the pointer to the objects tiles for this hMapId
    ld   a, BANK(DungeonItemsTilesPointers)       ;; 00:2CB1 $3E $20
    ld   [rSelectROMBank], a                      ;; 00:2CB3 $EA $00 $21
    pop  de                                       ;; 00:2CB6 $D1
    ld   hl, DungeonItemsTilesPointers            ;; 00:2CB7 $21 $CA $45
    add  hl, de                                   ;; 00:2CBA $19
    ld   h, [hl]                                  ;; 00:2CBB $66
    ld   l, $00                                   ;; 00:2CBC $2E $00

    ld   a, BANK(DungeonItemsTiles)               ;; 00:2CBE $3E $12
    call SwitchAdjustedBank                       ;; 00:2CC0 $CD $13 $08

    ldh  a, [hMapId]                              ;; 00:2CC3 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:2CC5 $FE $FF
    jr   nz, .colorDungeonEnd2                    ;; 00:2CC7 $20 $08
    ld   hl, ColorDungeonTiles + $100             ;; 00:2CC9 $21 $00 $61
    ld   a, BANK(ColorDungeonTiles)               ;; 00:2CCC $3E $35
    ld   [rSelectROMBank], a                      ;; 00:2CCE $EA $00 $21
.colorDungeonEnd2

    ld   de, vTiles1 + $700                       ;; 00:2CD1 $11 $00 $8F
    ld   bc, TILE_SIZE * $10                      ;; 00:2CD4 $01 $00 $01
    call CopyData                                 ;; 00:2CD7 $CD $14 $29

    ;
    ; Load indoor items (map, compass, keys, etc)
    ;

    ld   a, [wCurrentBank]                        ;; 00:2CDA $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:2CDD $EA $00 $21
    ld   hl, InventoryIndoorItemsTiles            ;; 00:2CE0 $21 $00 $7D

    ; If indoor, but not in a dungeon…
    ldh  a, [hMapId]                              ;; 00:2CE3 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:2CE5 $FE $FF
    jr   z, .inventoryItemsEnd                    ;; 00:2CE7 $28 $0C
    cp   MAP_CAVE_B                               ;; 00:2CE9 $FE $0A
    jr   c, .inventoryItemsEnd                    ;; 00:2CEB $38 $08
    ; …use the overworld inventory items (instead of the dungeon ones)
    ld   a, BANK(InventoryOverworldItemsTiles)    ;; 00:2CED $3E $0C
    call SwitchAdjustedBank                       ;; 00:2CEF $CD $13 $08
    ld   hl, InventoryOverworldItemsTiles         ;; 00:2CF2 $21 $00 $4C
.inventoryItemsEnd

    ld   de, vTiles1 + $400                       ;; 00:2CF5 $11 $00 $8C
    ld   bc, TILE_SIZE * $30                      ;; 00:2CF8 $01 $00 $03
    call CopyData                                 ;; 00:2CFB $CD $14 $29

.patchInventoryTiles

    ; Replace Magic Powder tile by Toadstool if needed
    ld   a, [wHasToadstool]                       ;; 00:2CFE $FA $4B $DB
    and  a                                        ;; 00:2D01 $A7
    jr   z, .noToadstoolEnd                       ;; 00:2D02 $28 $03
    call ReplaceMagicPowderTilesByToadstool       ;; 00:2D04 $CD $2B $1E
.noToadstoolEnd

    ; Replace Slime Key tile by Golden Leaf if needed
    ld   a, [wIsIndoor]                           ;; 00:2D07 $FA $A5 $DB
    and  a                                        ;; 00:2D0A $A7
    jr   z, .jr_2D17                              ;; 00:2D0B $28 $0A
    ldh  a, [hMapId]                              ;; 00:2D0D $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:2D0F $FE $FF
    jr   z, .goldenLeafEnd                        ;; 00:2D11 $28 $0E
    cp   MAP_CAVE_B                               ;; 00:2D13 $FE $0A
    jr   c, .goldenLeafEnd                        ;; 00:2D15 $38 $0A
.jr_2D17
    ld   a, [wGoldenLeavesCount]                  ;; 00:2D17 $FA $15 $DB
    cp   SLIME_KEY                                ;; 00:2D1A $FE $06
    jr   c, .goldenLeafEnd                        ;; 00:2D1C $38 $03
    call ReplaceSlimeKeyTilesByGoldenLeaf         ;; 00:2D1E $CD $A1 $1E
.goldenLeafEnd

    ; Update the trading sequence item tile if needed
    ld   a, [wTradeSequenceItem]                  ;; 00:2D21 $FA $0E $DB
    cp   TRADING_ITEM_RIBBON                      ;; 00:2D24 $FE $02
    jr   c, .return                               ;; 00:2D26 $38 $04
    ld   a, REPLACE_TILES_TRADING_ITEM            ;; 00:2D28 $3E $0D
    ldh  [hReplaceTiles], a                       ;; 00:2D2A $E0 $A5

.return
    ret                                           ;; 00:2D2C $C9

; Copy default tiles for the Overworld rooms to tiles memory.
; This includes tiles available to all Overworld room.
;
; TODO: does it also includes default tiles for the room-specific section?
LoadBaseOverworldTiles::
    ;
    ; Load Overworld landscape
    ;

    ld   a, BANK(OverworldLandscapeTiles)         ;; 00:2D2D $3E $0C
    call SwitchAdjustedBank                       ;; 00:2D2F $CD $13 $08
    ld   hl, OverworldLandscapeTiles              ;; 00:2D32 $21 $00 $52
    ld   de, vTiles2 + $200                       ;; 00:2D35 $11 $00 $92
    ld   bc, TILE_SIZE * $60                      ;; 00:2D38 $01 $00 $06
    call CopyData                                 ;; 00:2D3B $CD $14 $29

    ;
    ; Load dungeon keys
    ;

    ld   hl, InventoryOverworldItemsTiles         ;; 00:2D3E $21 $00 $4C
    ld   de, vTiles1 + $400                       ;; 00:2D41 $11 $00 $8C
    ld   bc, TILE_SIZE * $40                      ;; 00:2D44 $01 $00 $04
    call CopyData                                 ;; 00:2D47 $CD $14 $29

    call func_2D50                                ;; 00:2D4A $CD $50 $2D

    jp   LoadIndoorTiles.patchInventoryTiles      ;; 00:2D4D $C3 $FE $2C

; Copy animated tiles, inventory items and character tiles to tile memory
func_2D50::
    xor  a                                        ;; 00:2D50 $AF
    ldh  [hAnimatedTilesFrameCount], a            ;; 00:2D51 $E0 $A6
    ldh  [hAnimatedTilesDataOffset], a            ;; 00:2D53 $E0 $A7
    call AnimateTiles.jumpTable                   ;; 00:2D55 $CD $D2 $1B

    ld   a, BANK(InventoryEquipmentItemsTiles)    ;; 00:2D58 $3E $0C
    call AdjustBankNumberForGBC                   ;; 00:2D5A $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2D5D $EA $00 $21

    ld   hl, InventoryEquipmentItemsTiles         ;; 00:2D60 $21 $00 $48
    ld   de, vTiles1                              ;; 00:2D63 $11 $00 $88
    ld   bc, TILE_SIZE * $80                      ;; 00:2D66 $01 $00 $08
    call CopyData                                 ;; 00:2D69 $CD $14 $29

    ld   hl, LinkCharacterTiles + $200            ;; 00:2D6C $21 $00 $42
    ld   de, vTiles0 + $200                       ;; 00:2D6F $11 $00 $82
    ld   bc, TILE_SIZE * $10                      ;; 00:2D72 $01 $00 $01
    call CopyData                                 ;; 00:2D75 $CD $14 $29
    ret                                           ;; 00:2D78 $C9

; Copy opening sequence tiles to tiles memory
LoadIntroSequenceTiles::
    ; Load rain tiles
    ld   a, BANK(IntroRainTiles)                  ;; 00:2D79 $3E $01
    call SwitchBank                               ;; 00:2D7B $CD $0C $08
    ld   hl, IntroRainTiles                       ;; 00:2D7E $21 $4A $6D
    ld   de, vTiles0 + $700                       ;; 00:2D81 $11 $00 $87
    ld   bc, TILE_SIZE * $8                       ;; 00:2D84 $01 $80 $00
    call CopyData                                 ;; 00:2D87 $CD $14 $29

    ; Load intro sequence misc tiles
    ld   a, BANK(IntroTiles)                      ;; 00:2D8A $3E $10
    call SwitchAdjustedBank                       ;; 00:2D8C $CD $13 $08
    ld   hl, Intro3Tiles                          ;; 00:2D8F $21 $00 $54
    ld   de, vTiles0                              ;; 00:2D92 $11 $00 $80
    ld   bc, TILE_SIZE * $60                      ;; 00:2D95 $01 $00 $06
    call CopyData                                 ;; 00:2D98 $CD $14 $29

    ; Load intro sequence misc tiles
    ld   hl, Intro1Tiles                          ;; 00:2D9B $21 $00 $40
    ld   de, vTiles1                              ;; 00:2D9E $11 $00 $88
    ld   bc, TILE_SIZE * $100                     ;; 00:2DA1 $01 $00 $10
    jp   CopyData                                 ;; 00:2DA4 $C3 $14 $29

; Copy title screen tiles to tiles memory
LoadTitleScreenTiles::
    ; Load title logo
    ld   a, BANK(TitleLogoTiles)                  ;; 00:2DA7 $3E $0F
    call SwitchAdjustedBank                       ;; 00:2DA9 $CD $13 $08
    ld   hl, TitleLogoTiles                       ;; 00:2DAC $21 $00 $49
    ld   de, vTiles1                              ;; 00:2DAF $11 $00 $88
    ld   bc, TILE_SIZE * $70                      ;; 00:2DB2 $01 $00 $07
    call CopyData                                 ;; 00:2DB5 $CD $14 $29

    ; Load tiles for large "DX" text
    ld   a, BANK(TitleDXTiles)                    ;; 00:2DB8 $3E $38
    call SwitchBank                               ;; 00:2DBA $CD $0C $08

    ldh  a, [hIsGBC]                              ;; 00:2DBD $F0 $FE
    and  a                                        ;; 00:2DBF $A7
    jr   nz, .dxTilesCGB                          ;; 00:2DC0 $20 $05
    ld   hl, TitleDXTilesDMG                      ;; 00:2DC2 $21 $00 $5C
    jr   .dxTilesEnd                              ;; 00:2DC5 $18 $03
.dxTilesCGB
    ld   hl, TitleDXTilesCGB                      ;; 00:2DC7 $21 $00 $58
.dxTilesEnd

    ld   de, vTiles0 + $400                       ;; 00:2DCA $11 $00 $84
    ld   bc, TILE_SIZE * $40                      ;; 00:2DCD $01 $00 $04
    call CopyData                                 ;; 00:2DD0 $CD $14 $29

    ; Load OAM tiles for the large "DX" text
    ; (used to fade-in the "DX" progressively, by updating the OAM palette)
    ldh  a, [hIsGBC]                              ;; 00:2DD3 $F0 $FE
    and  a                                        ;; 00:2DD5 $A7
    jr   nz, .else                                ;; 00:2DD6 $20 $05
    ld   hl, TitleDXOAMTiles + $100               ;; 00:2DD8 $21 $00 $66
    jr   .endIf                                   ;; 00:2DDB $18 $03
.else
    ld   hl, TitleDXOAMTiles                      ;; 00:2DDD $21 $00 $65
.endIf

    ld   de, vTiles0 + $200                       ;; 00:2DE0 $11 $00 $82
    ld   bc, TILE_SIZE * $10                      ;; 00:2DE3 $01 $00 $01
    jp   CopyData                                 ;; 00:2DE6 $C3 $14 $29

; Copy tiles for the World Map to tiles memory
LoadWorldMapTiles::
    ; Load world map tiles
    ld   a, BANK(WorldMapTiles)                   ;; 00:2DE9 $3E $0C
    call SwitchAdjustedBank                       ;; 00:2DEB $CD $13 $08
    ld   hl, WorldMapTiles                        ;; 00:2DEE $21 $00 $78
    ld   de, vTiles1 + $700                       ;; 00:2DF1 $11 $00 $8F
    ld   bc, TILE_SIZE * $80                      ;; 00:2DF4 $01 $00 $08
    call CopyData                                 ;; 00:2DF7 $CD $14 $29

    ; Load some overworld objects tiles (house, owl, etc),
    ; to display them when the cursor hovers a specific room.
    ld   hl, Overworld1Tiles + $100               ;; 00:2DFA $21 $00 $50
    ld   de, vTiles0 + $200                       ;; 00:2DFD $11 $00 $82
    ld   bc, TILE_SIZE * $10                      ;; 00:2E00 $01 $00 $01
    jp   CopyData                                 ;; 00:2E03 $C3 $14 $29

; Copy tiles for Face Shrine mural to tiles memory
LoadFaceShrineReliefTiles::
    ld   hl, ReliefTiles                          ;; 00:2E06 $21 $00 $70
    jr   LoadStaticPictureTiles                   ;; 00:2E09 $18 $08

; Copy tiles for the Schule painting to tiles memory
LoadSchulePaintingTiles::
    ld   hl, PaintingTiles                        ;; 00:2E0B $21 $00 $78
    jr   LoadStaticPictureTiles                   ;; 00:2E0E $18 $03

; Copy tiles for Christine portrait to tiles memory
LoadChristinePortraitTiles::
    ld   hl, ChristineTiles                       ;; 00:2E10 $21 $00 $58
    ; fallthrough

; Copy tiles for a static full-screen picture to vTiles2
; Inputs:
;   hl   tiles source address
LoadStaticPictureTiles::
    ld   a, BANK(StaticPicturesTiles)             ;; 00:2E13 $3E $10
    call SwitchAdjustedBank                       ;; 00:2E15 $CD $13 $08
    ld   de, vTiles2                              ;; 00:2E18 $11 $00 $90
    ld   bc, TILE_SIZE * $80                      ;; 00:2E1B $01 $00 $08
    jp   CopyData                                 ;; 00:2E1E $C3 $14 $29

LoadEaglesTowerTopTiles::
    ld   a, BANK(EaglesTowerTop1Tiles)            ;; 00:2E21 $3E $13
    call AdjustBankNumberForGBC                   ;; 00:2E23 $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2E26 $EA $00 $21
    ld   hl, EaglesTowerTop2Tiles                 ;; 00:2E29 $21 $00 $7C
    ld   de, vTiles1 + $400                       ;; 00:2E2C $11 $00 $8C
    ld   bc, TILE_SIZE * $40                      ;; 00:2E2F $01 $00 $04
    call CopyData                                 ;; 00:2E32 $CD $14 $29

    ld   hl, EaglesTowerTop1Tiles                 ;; 00:2E35 $21 $00 $68
    ld   de, vTiles2                              ;; 00:2E38 $11 $00 $90
    ld   bc, TILE_SIZE * $40                      ;; 00:2E3B $01 $00 $04
    jp   CopyData                                 ;; 00:2E3E $C3 $14 $29

; Copy tiles for Marin's beach sequence to tiles memory
LoadMarinBeachTiles::
    ld   a, BANK(FontLargeTiles)                  ;; 00:2E41 $3E $10
    call SwitchAdjustedBank                       ;; 00:2E43 $CD $13 $08

    ld   hl, FontLargeTiles                       ;; 00:2E46 $21 $00 $67
    ld   de, vTiles0 + $400                       ;; 00:2E49 $11 $00 $84
    ld   bc, TILE_SIZE * $40                      ;; 00:2E4C $01 $00 $04
    call CopyData                                 ;; 00:2E4F $CD $14 $29

    ld   hl, MarinBeachTiles                      ;; 00:2E52 $21 $00 $60
    ld   de, vTiles2                              ;; 00:2E55 $11 $00 $90
    ld   bc, TILE_SIZE * $60                      ;; 00:2E58 $01 $00 $06
    jp   CopyData                                 ;; 00:2E5B $C3 $14 $29

; Copy tiles for Saving and Game Over screens to tiles memory
LoadSaveMenuTiles::
    ld   a, BANK(SaveMenuTiles)                   ;; 00:2E5E $3E $0F
    call SwitchBank                               ;; 00:2E60 $CD $0C $08
    ld   hl, SaveMenuTiles                        ;; 00:2E63 $21 $00 $44
    ld   de, vTiles1                              ;; 00:2E66 $11 $00 $88
    ld   bc, TILE_SIZE * $50                      ;; 00:2E69 $01 $00 $05
    jp   CopyData                                 ;; 00:2E6C $C3 $14 $29

; NPC tiles banks
NpcTilesBankTable::
    db   $00, BANK(Npc2Tiles), BANK(Npc1Tiles), BANK(Npc3Tiles) ;; 00:2E6F

; For overworld or indoor rooms, load room-specific tiles.
;
; That means:
; - the lower section of OAM tiles (NPCs),
; - the upper section of BG tiles.
LoadRoomSpecificTiles::
    ldh  a, [hMapId]                              ;; 00:2E73 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:2E75 $FE $FF
    jr   nz, .colorDungeonEnd                     ;; 00:2E77 $20 $0B
    callsb LoadColorDungeonTiles                  ;; 00:2E79 $3E $20 $EA $00 $21 $CD $5A $47
    jp   .oamTilesEnd                             ;; 00:2E81 $C3 $12 $2F
.colorDungeonEnd

    ;
    ; Load 4 rows of tiles (64 tiles) to NPCs tiles VRAM
    ;

    xor  a                                        ;; 00:2E84 $AF
    ; Copy a row of 16 tiles
.copyOAMTilesRow
    ldh  [hMultiPurpose0], a                      ;; 00:2E85 $E0 $D7

    ; hl = wLoadedEntitySpritesheets[a]
    ld   hl, wLoadedEntitySpritesheets            ;; 00:2E87 $21 $93 $C1
    ld   e, a                                     ;; 00:2E8A $5F
    ld   d, $00                                   ;; 00:2E8B $16 $00
    add  hl, de                                   ;; 00:2E8D $19

    ;
    ; Override the first spritesheet row with the follower spritesheet (if any)
    ;

    and  a                                        ;; 00:2E8E $A7
    jr   nz, .usePredefinedSpritesheet            ;; 00:2E8F $20 $42

    ld   a, [wIsIndoor]                           ;; 00:2E91 $FA $A5 $DB
    and  a                                        ;; 00:2E94 $A7
    jr   z, .indoorEnd                            ;; 00:2E95 $28 $19

    ldh  a, [hIsSideScrolling]                    ;; 00:2E97 $F0 $F9
    and  a                                        ;; 00:2E99 $A7
    jr   nz, .usePredefinedSpritesheet            ;; 00:2E9A $20 $37

    ldh  a, [hMapId]                              ;; 00:2E9C $F0 $F7
    cp   MAP_KANALET                              ;; 00:2E9E $FE $14
    jr   z, .usePredefinedSpritesheet             ;; 00:2EA0 $28 $31

    cp   MAP_CAVE_B                               ;; 00:2EA2 $FE $0A
    jr   c, .usePredefinedSpritesheet             ;; 00:2EA4 $38 $2D
    ldh  a, [hMapRoom]                            ;; 00:2EA6 $F0 $F6
    cp   ROOM_INDOOR_B_MANBO                      ;; 00:2EA8 $FE $FD
    jr   z, .usePredefinedSpritesheet             ;; 00:2EAA $28 $27
    cp   ROOM_INDOOR_B_FISHING_MINIGAME           ;; 00:2EAC $FE $B1
    jr   z, .usePredefinedSpritesheet             ;; 00:2EAE $28 $23
.indoorEnd

    ld   a, [wIsBowWowFollowingLink]              ;; 00:2EB0 $FA $56 $DB
    cp   BOW_WOW_FOLLOWING                        ;; 00:2EB3 $FE $01
    ld   a, $A4                                   ;; 00:2EB5 $3E $A4
    jr   z, .useOverridenSpritesheet              ;; 00:2EB7 $28 $18
    ld   a, [wIsGhostFollowingLink]               ;; 00:2EB9 $FA $79 $DB
    and  a                                        ;; 00:2EBC $A7
    ld   a, $D8                                   ;; 00:2EBD $3E $D8
    jr   nz, .useOverridenSpritesheet             ;; 00:2EBF $20 $10
    ld   a, [wIsRoosterFollowingLink]             ;; 00:2EC1 $FA $7B $DB
    and  a                                        ;; 00:2EC4 $A7
    ld   a, $DD                                   ;; 00:2EC5 $3E $DD
    jr   nz, .useOverridenSpritesheet             ;; 00:2EC7 $20 $08
    ld   a, [wIsMarinFollowingLink]               ;; 00:2EC9 $FA $73 $DB
    and  a                                        ;; 00:2ECC $A7
    jr   z, .usePredefinedSpritesheet             ;; 00:2ECD $28 $04
    ld   a, $8F                                   ;; 00:2ECF $3E $8F

.useOverridenSpritesheet
    jr   .jr_2ED4                                 ;; 00:2ED1 $18 $01

.usePredefinedSpritesheet
    ld   a, [hl]                                  ;; 00:2ED3 $7E

.jr_2ED4
    and  a                                        ;; 00:2ED4 $A7
    jr   z, .copyskipEntityLoad                   ;; 00:2ED5 $28 $33
    push af                                       ;; 00:2ED7 $F5
    and  $3F                                      ;; 00:2ED8 $E6 $3F
    ld   b, a                                     ;; 00:2EDA $47
    ld   c, $00                                   ;; 00:2EDB $0E $00
    pop  af                                       ;; 00:2EDD $F1
    swap a                                        ;; 00:2EDE $CB $37
    rra                                           ;; 00:2EE0 $1F
    rra                                           ;; 00:2EE1 $1F
    and  $03                                      ;; 00:2EE2 $E6 $03
    ld   e, a                                     ;; 00:2EE4 $5F
    ld   d, $00                                   ;; 00:2EE5 $16 $00
    ld   hl, NpcTilesBankTable                    ;; 00:2EE7 $21 $6F $2E
    add  hl, de                                   ;; 00:2EEA $19
    ld   a, [hl]                                  ;; 00:2EEB $7E
    and  a                                        ;; 00:2EEC $A7
    jr   z, .bankAdjustmentEnd                    ;; 00:2EED $28 $03
    call AdjustBankNumberForGBC                   ;; 00:2EEF $CD $0B $0B
.bankAdjustmentEnd

    ; Do the actual copy to OAM tiles
    ld   [rSelectROMBank], a                      ;; 00:2EF2 $EA $00 $21
    ldh  a, [hMultiPurpose0]                      ;; 00:2EF5 $F0 $D7
    ld   d, a                                     ;; 00:2EF7 $57
    ld   e, $00                                   ;; 00:2EF8 $1E $00
    ; destination = Lower-half of the OAM tiles section (NPCs tiles)
    ld   hl, vTiles0 + $400                       ;; 00:2EFA $21 $00 $84
    add  hl, de                                   ;; 00:2EFD $19
    ld   e, l                                     ;; 00:2EFE $5D
    ld   d, h                                     ;; 00:2EFF $54
    ; Source: NpcTilesDataStart + bc
    ld   hl, NpcTilesDataStart                    ;; 00:2F00 $21 $00 $40
    add  hl, bc                                   ;; 00:2F03 $09
    ld   bc, TILE_SIZE * $10                      ;; 00:2F04 $01 $00 $01
    call CopyData                                 ;; 00:2F07 $CD $14 $29
.copyskipEntityLoad

    ; while hMultiPurpose0 < 4, copy the next row
    ldh  a, [hMultiPurpose0]                      ;; 00:2F0A $F0 $D7
    inc  a                                        ;; 00:2F0C $3C
    cp   $04                                      ;; 00:2F0D $FE $04
    jp   nz, .copyOAMTilesRow                     ;; 00:2F0F $C2 $85 $2E
.oamTilesEnd

    ;
    ; Load 8 rows (128 tiles) to the BG-only tiles
    ;

    ld   de, vTiles2                              ;; 00:2F12 $11 $00 $90

    ld   a, [wIsIndoor]                           ;; 00:2F15 $FA $A5 $DB
    and  a                                        ;; 00:2F18 $A7
    jp   z, .loadOverworldBGTiles                 ;; 00:2F19 $CA $AD $2F

    ld   a, BANK(DungeonsTiles)                   ;; 00:2F1C $3E $0D
    call AdjustBankNumberForGBC                   ;; 00:2F1E $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2F21 $EA $00 $21

    ldh  a, [hIsSideScrolling]                    ;; 00:2F24 $F0 $F9
    and  a                                        ;; 00:2F26 $A7
    jr   z, .loadTopViewTiles                     ;; 00:2F27 $28 $22

    ;
    ; Load tiles for side-scrolling sections
    ;

    ld   hl, DungeonSideview1Tiles                ;; 00:2F29 $21 $00 $70
    ldh  a, [hMapId]                              ;; 00:2F2C $F0 $F7
    cp   MAP_EAGLES_TOWER                         ;; 00:2F2E $FE $06
    jr   z, .label_2F41                           ;; 00:2F30 $28 $0F
    cp   MAP_CAVE_B                               ;; 00:2F32 $FE $0A
    jr   nc, .label_2F3B                          ;; 00:2F34 $30 $05

.label_2F36
    ld   hl, DungeonSideview2Tiles                ;; 00:2F36 $21 $00 $78
    jr   .label_2F41                              ;; 00:2F39 $18 $06

.label_2F3B
    ldh  a, [hMapRoom]                            ;; 00:2F3B $F0 $F6
    cp   ROOM_INDOOR_B_SEASHELL_MANSION           ;; 00:2F3D $FE $E9
    jr   z, .label_2F36                           ;; 00:2F3F $28 $F5
.label_2F41

    ; Copy sideview tiles to the BG tiles
    ld   de, vTiles2                              ;; 00:2F41 $11 $00 $90
    ld   bc, TILE_SIZE * $80                      ;; 00:2F44 $01 $00 $08
    call CopyData                                 ;; 00:2F47 $CD $14 $29
    ret                                           ;; 00:2F4A $C9

.loadTopViewTiles
    ;
    ; Load tiles for top-view dungeon
    ;

    ldh  a, [hMapId]                              ;; 00:2F4B $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:2F4D $FE $FF
    jr   nz, .notColorDungeon                     ;; 00:2F4F $20 $06
    ldh  a, [hMapRoom]                            ;; 00:2F51 $F0 $F6
    cp   UNKNOWN_ROOM_12                          ;; 00:2F53 $FE $12
    jr   nz, .skipBGLoading                       ;; 00:2F55 $20 $12
.notColorDungeon

    ld   hl, IndoorTiles                          ;; 00:2F57 $21 $00 $50
    ldh  a, [hWorldTileset]                       ;; 00:2F5A $F0 $94
    cp   W_TILESET_NO_UPDATE                      ;; 00:2F5C $FE $FF
    jr   z, .skipBGLoading                        ;; 00:2F5E $28 $09

    add  a, $50                                   ;; 00:2F60 $C6 $50
    ld   h, a                                     ;; 00:2F62 $67
    ld   bc, TILE_SIZE * $10                      ;; 00:2F63 $01 $00 $01
    call CopyData                                 ;; 00:2F66 $CD $14 $29
.skipBGLoading

    ; Hack: if inside the camera shop, load a specific tileset
    ldh  a, [hMapId]                              ;; 00:2F69 $F0 $F7
    cp   MAP_HOUSE                                ;; 00:2F6B $FE $10
    jr   nz, .cameraShopEnd                       ;; 00:2F6D $20 $18
    ldh  a, [hMapRoom]                            ;; 00:2F6F $F0 $F6
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ;; 00:2F71 $FE $B5
    jr   nz, .cameraShopEnd                       ;; 00:2F73 $20 $12
    ld   a, BANK(CameraShopIndoorTiles)           ;; 00:2F75 $3E $35
    ld   [rSelectROMBank], a                      ;; 00:2F77 $EA $00 $21
    ld   hl, CameraShopIndoorTiles                ;; 00:2F7A $21 $00 $66
    ld   de, vTiles1 + $700                       ;; 00:2F7D $11 $00 $8F
    ld   bc, TILE_SIZE * $20                      ;; 00:2F80 $01 $00 $02
    call CopyData                                 ;; 00:2F83 $CD $14 $29
    ret                                           ;; 00:2F86 $C9
.cameraShopEnd

    ; Hack: on GBC, load 2 tiles to a specific location
    ; TODO: find out which tiles

    ldh  a, [hIsGBC]                              ;; 00:2F87 $F0 $FE
    and  a                                        ;; 00:2F89 $A7
    ret  z                                        ;; 00:2F8A $C8

    ldh  a, [hMapId]                              ;; 00:2F8B $F0 $F7
    and  a                                        ;; 00:2F8D $A7
    ret  nz                                       ;; 00:2F8E $C0

    ld   a, BANK(PhotoAlbumTiles)                 ;; 00:2F8F $3E $35
    ld   [rSelectROMBank], a                      ;; 00:2F91 $EA $00 $21
    ld   hl, PhotoAlbumTiles + $600               ;; 00:2F94 $21 $00 $6E
    ld   de, vTiles2 + $690                       ;; 00:2F97 $11 $90 $96
    ld   bc, TILE_SIZE                            ;; 00:2F9A $01 $10 $00
    call CopyData                                 ;; 00:2F9D $CD $14 $29

    ld   hl, PhotoAlbumTiles + $610               ;; 00:2FA0 $21 $10 $6E
    ld   de, vTiles2 + $790                       ;; 00:2FA3 $11 $90 $97
    ld   bc, TILE_SIZE                            ;; 00:2FA6 $01 $10 $00
    call CopyData                                 ;; 00:2FA9 $CD $14 $29
    ret                                           ;; 00:2FAC $C9

.loadOverworldBGTiles
    ;
    ; Load 2 rows of tiles for the world BG tileset
    ;
    ld   a, BANK(Overworld2Tiles)                 ;; 00:2FAD $3E $0F
    call AdjustBankNumberForGBC                   ;; 00:2FAF $CD $0B $0B
    ld   [rSelectROMBank], a                      ;; 00:2FB2 $EA $00 $21

    ; If the tileset is W_TILESET_KEEP, do nothing.
    ldh  a, [hWorldTileset]                       ;; 00:2FB5 $F0 $94
    cp   W_TILESET_KEEP                           ;; 00:2FB7 $FE $0F
    jr   z, .return                               ;; 00:2FB9 $28 $0B

    ; hl = ($40 + hWorldTileset) * $100
    add  a, $40                                   ;; 00:2FBB $C6 $40
    ld   h, a                                     ;; 00:2FBD $67
    ld   l, $00                                   ;; 00:2FBE $2E $00
    ld   bc, TILE_SIZE * $20                      ;; 00:2FC0 $01 $00 $02
    call CopyData                                 ;; 00:2FC3 $CD $14 $29

.return
    ret                                           ;; 00:2FC6 $C9

; Copy two bytes from hl to de
CopyWord::
    ld   a, [hli]                                 ;; 00:2FC7 $2A
    ld   [de], a                                  ;; 00:2FC8 $12
    inc  de                                       ;; 00:2FC9 $13
    ld   a, [hli]                                 ;; 00:2FCA $2A
    ld   [de], a                                  ;; 00:2FCB $12
    ret                                           ;; 00:2FCC $C9

; Given an object (overworld or indoors), retrieve its tiles indices,
; and copy them to the BG map.
; (DMG only)
;
; Inputs:
;   hl   pointer to the object in the objects map (see wRoomObjects)
;   de   pointer to the target in the BG map (4 bytes will be written)
WriteObjectToBG_DMG::
    ; bc = [hl] * 4
    ld   a, [hl]                                  ;; 00:2FCD $7E
    ld   c, a                                     ;; 00:2FCE $4F
    ld   b, $00                                   ;; 00:2FCF $06 $00
    sla  c                                        ;; 00:2FD1 $CB $21
    rl   b                                        ;; 00:2FD3 $CB $10
    sla  c                                        ;; 00:2FD5 $CB $21
    rl   b                                        ;; 00:2FD7 $CB $10

    ;
    ; Select the objects tilemap table to use
    ;

    ld   hl, OverworldObjectsTilemapDMG           ;; 00:2FD9 $21 $49 $67

    ; If on Color Dungeon, use the objects tilemap of the Color Dungeon
    ldh  a, [hMapId]                              ;; 00:2FDC $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:2FDE $FE $FF
    jr   z, .ColorDungeonObjectsTilemap           ;; 00:2FE0 $28 $0A

    ; Hack: if on camera shop, also use the objects tilemap of the Color Dungeon
    cp   MAP_HOUSE                                ;; 00:2FE2 $FE $10
    jr   nz, .notCameraShop                       ;; 00:2FE4 $20 $0B
    ldh  a, [hMapRoom]                            ;; 00:2FE6 $F0 $F6
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ;; 00:2FE8 $FE $B5
    jr   nz, .notCameraShop                       ;; 00:2FEA $20 $05
.ColorDungeonObjectsTilemap
    ld   hl, ColorDungeonObjectsTilemap           ;; 00:2FEC $21 $60 $47
    jr   .readValueInTable                        ;; 00:2FEF $18 $09

.notCameraShop
    ; If indoors, use a special objects tilemap
    ld   a, [wIsIndoor]                           ;; 00:2FF1 $FA $A5 $DB
    and  a                                        ;; 00:2FF4 $A7
    jr   z, .readValueInTable                     ;; 00:2FF5 $28 $03
    ld   hl, IndoorObjectsTilemapDMG              ;; 00:2FF7 $21 $00 $40

.readValueInTable
    ; hl = address of the tilemap for the given object
    add  hl, bc                                   ;; 00:2FFA $09

    ; Read the first 2 bytes of the object tilemap, and write them
    ; to the target address in the BG map
    ld   a, [hli]                                 ;; 00:2FFB $2A
    ld   [de], a                                  ;; 00:2FFC $12
    inc  de                                       ;; 00:2FFD $13
    ld   a, [hli]                                 ;; 00:2FFE $2A
    ld   [de], a                                  ;; 00:2FFF $12

    ; Add $1F to the target address (to move one row below in the BG map)
    ld   a, e                                     ;; 00:3000 $7B
    add  a, $1F                                   ;; 00:3001 $C6 $1F
    ld   e, a                                     ;; 00:3003 $5F
    ld   a, d                                     ;; 00:3004 $7A
    adc  a, $00                                   ;; 00:3005 $CE $00
    ld   d, a                                     ;; 00:3007 $57

    ; Read the last 2 bytes of the object tilemap, and write them
    ; to the target address in the BG map
    ld   a, [hli]                                 ;; 00:3008 $2A
    ld   [de], a                                  ;; 00:3009 $12
    inc  de                                       ;; 00:300A $13
    ld   a, [hl]                                  ;; 00:300B $7E
    ld   [de], a                                  ;; 00:300C $12

    ret                                           ;; 00:300D $C9

; Given an overworld object, retrieve its tiles indices and palettes (2x2),
; and copy them to the BG map
; (CGB only)
;
; Inputs:
;   hl   pointer to the object in the objects map (see wRoomObjects)
;   de   pointer to the target in the BG map (4 bytes will be written)
WriteOverworldObjectToBG::
    ; Switch to RAM bank 2 (object attributes?)
    ld   a, $02                                   ;; 00:300E $3E $02
    ldh  [rSVBK], a                               ;; 00:3010 $E0 $70
    ; ObjectAttributeValue = [hl]
    ld   c, [hl]                                  ;; 00:3012 $4E
    ; Switch back to RAM bank 0
    xor  a                                        ;; 00:3013 $AF
    ldh  [rSVBK], a                               ;; 00:3014 $E0 $70
    jr   doCopyObjectToBG                         ;; 00:3016 $18 $01

; Given an indoor object, retrieve its tiles indices and palettes (2x2),
; and copy them to the BG map
; (CGB only)
;
; Inputs:
;   hl   pointer to the object in the objects map (see wRoomObjects)
;   de   pointer to the target in the BG map (4 bytes will be written)
WriteIndoorObjectToBG::
    ld   c, [hl]                                  ;; 00:3018 $4E

doCopyObjectToBG:
    ; bc = ObjectAttributeValue * 4
    ld   b, $00                                   ;; 00:3019 $06 $00
    sla  c                                        ;; 00:301B $CB $21
    rl   b                                        ;; 00:301D $CB $10
    sla  c                                        ;; 00:301F $CB $21
    rl   b                                        ;; 00:3021 $CB $10

    callsb GetBGAttributesAddressForObject        ;; 00:3023 $3E $1A $EA $00 $21 $CD $76 $65

    call SwitchToObjectsTilemapBank               ;; 00:302B $CD $05 $39

    ;
    ; Select the base address for the source tile map
    ;

    ; If IsIndoor…
    ld   a, [wIsIndoor]                           ;; 00:302E $FA $A5 $DB
    and  a                                        ;; 00:3031 $A7
    jr   z, .isOverworld                          ;; 00:3032 $28 $18
    ; … set the default base address
    ld   hl, IndoorObjectsTilemapCGB              ;; 00:3034 $21 $B0 $43

    ; If on Color Dungeon, use the objects tilemap of the Color Dungeon
    ldh  a, [hMapId]                              ;; 00:3037 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:3039 $FE $FF
    jr   z, .useColorDungeonTable                 ;; 00:303B $28 $0A

    ; Hack: if on camera shop, also use the objects tilemap of the Color Dungeon
    cp   MAP_HOUSE                                ;; 00:303D $FE $10
    jr   nz, .baseAddressskipEntityLoad           ;; 00:303F $20 $0E
    ldh  a, [hMapRoom]                            ;; 00:3041 $F0 $F6
    cp   ROOM_INDOOR_B_CAMERA_SHOP                ;; 00:3043 $FE $B5
    jr   nz, .baseAddressskipEntityLoad           ;; 00:3045 $20 $08

.useColorDungeonTable
    ld   hl, ColorDungeonObjectsTilemap           ;; 00:3047 $21 $60 $47
    jr   .baseAddressskipEntityLoad               ;; 00:304A $18 $03

.isOverworld
    ld   hl, OverworldObjectsTilemapCGB           ;; 00:304C $21 $1D $6B
.baseAddressskipEntityLoad

    ; Copy tile numbers to BG map for tiles on the upper row
    push de                                       ;; 00:304F $D5
    add  hl, bc                                   ;; 00:3050 $09
    call CopyWord                                 ;; 00:3051 $CD $C7 $2F
    pop  de                                       ;; 00:3054 $D1

    ; Copy tile attributes to BG map for tiles on the upper row
    push hl                                       ;; 00:3055 $E5
    ldh  a, [hMultiPurpose8]                      ;; 00:3056 $F0 $DF
    ld   [rSelectROMBank], a                      ;; 00:3058 $EA $00 $21
    ldh  a, [hMultiPurpose9]                      ;; 00:305B $F0 $E0
    ld   h, a                                     ;; 00:305D $67
    ldh  a, [hMultiPurposeA]                      ;; 00:305E $F0 $E1
    ld   l, a                                     ;; 00:3060 $6F
    ld   a, $01                                   ;; 00:3061 $3E $01
    ldh  [rVBK], a                                ;; 00:3063 $E0 $4F
    call CopyWord                                 ;; 00:3065 $CD $C7 $2F

    ; Restore RAM and ROM banks
    xor  a                                        ;; 00:3068 $AF
    ldh  [rVBK], a                                ;; 00:3069 $E0 $4F
    call SwitchToObjectsTilemapBank               ;; 00:306B $CD $05 $39

    ; Update palette offset
    ld   a, h                                     ;; 00:306E $7C
    ldh  [hMultiPurpose9], a                      ;; 00:306F $E0 $E0
    ld   a, l                                     ;; 00:3071 $7D
    ldh  [hMultiPurposeA], a                      ;; 00:3072 $E0 $E1
    pop  hl                                       ;; 00:3074 $E1

    ; Move BG target down by one row
    ld   a, e                                     ;; 00:3075 $7B
    add  a, $1F                                   ;; 00:3076 $C6 $1F
    ld   e, a                                     ;; 00:3078 $5F
    ld   a, d                                     ;; 00:3079 $7A
    adc  a, $00                                   ;; 00:307A $CE $00
    ld   d, a                                     ;; 00:307C $57

    ; Copy tile numbers for tiles on the lower row
    push de                                       ;; 00:307D $D5
    call CopyWord                                 ;; 00:307E $CD $C7 $2F
    pop  de                                       ;; 00:3081 $D1

    ; Copy palettes from WRAM1 for tiles on the lower row
    ldh  a, [hMultiPurpose8]                      ;; 00:3082 $F0 $DF
    ld   [rSelectROMBank], a                      ;; 00:3084 $EA $00 $21
    ldh  a, [hMultiPurpose9]                      ;; 00:3087 $F0 $E0
    ld   h, a                                     ;; 00:3089 $67
    ldh  a, [hMultiPurposeA]                      ;; 00:308A $F0 $E1
    ld   l, a                                     ;; 00:308C $6F
    ld   a, $01                                   ;; 00:308D $3E $01
    ldh  [rVBK], a                                ;; 00:308F $E0 $4F
    call CopyWord                                 ;; 00:3091 $CD $C7 $2F

    ; Restore RAM and ROM banks
    xor  a                                        ;; 00:3094 $AF
    ldh  [rVBK], a                                ;; 00:3095 $E0 $4F
    call SwitchToObjectsTilemapBank               ;; 00:3097 $CD $05 $39

    ret                                           ;; 00:309A $C9

; Copy the tilemap of a room to BG video memory.
;
; This is used when loading a map in one go (instead
; of having a sliding screen transition.)
; (called by LoadRequestedGfx)
LoadRoomTilemap:
    call SwitchToObjectsTilemapBank               ;; 00:309B $CD $05 $39
    call SwitchBank                               ;; 00:309E $CD $0C $08
    ld   de, vBGMap0                              ;; 00:30A1 $11 $00 $98
    ld   hl, wRoomObjects                         ;; 00:30A4 $21 $11 $D7
    ld   c, $80                                   ;; 00:30A7 $0E $80

    ; For each object in the room:
.loop
    push de                                       ;; 00:30A9 $D5
    push hl                                       ;; 00:30AA $E5
    push bc                                       ;; 00:30AB $C5

    ; If not running on GBC…
    ldh  a, [hIsGBC]                              ;; 00:30AC $F0 $FE
    and  a                                        ;; 00:30AE $A7
    jr   nz, .dmgEnd                              ;; 00:30AF $20 $05
    ; … copy the object tiles (2x2 tiles) to the BG map
    call WriteObjectToBG_DMG                      ;; 00:30B1 $CD $CD $2F
    jr   .objectCopyEnd                           ;; 00:30B4 $18 $0E
.dmgEnd

    ; Copy the object tiles and palettes (2x2 tiles) to the BG map

    ; If IsIndoor…
    ld   a, [wIsIndoor]                           ;; 00:30B6 $FA $A5 $DB
    and  a                                        ;; 00:30B9 $A7
    jr   z, .isOverworld                          ;; 00:30BA $28 $05
    ; then copy tiles for indoor room
    call WriteIndoorObjectToBG                    ;; 00:30BC $CD $18 $30
    jr   .objectCopyEnd                           ;; 00:30BF $18 $03
.isOverworld
    ; else copy tiles for overworld room
    call WriteOverworldObjectToBG                 ;; 00:30C1 $CD $0E $30
.objectCopyEnd

    pop  bc                                       ;; 00:30C4 $C1
    pop  hl                                       ;; 00:30C5 $E1
    pop  de                                       ;; 00:30C6 $D1

    ; Increment the object pointer in wRoomObjects
    inc  hl                                       ;; 00:30C7 $23
    ; When the end of a objects line is reached, move to the next one.
    ; (NB: this assumes that wRoomObjectsArea is $10-bytes aligned)
ASSERT LOW(wRoomObjectsArea) & $0F == 0, "wRoomObjectsArea must be aligned on $10 addresses"
    ld   a, l                                     ;; 00:30C8 $7D
    and  $0F                                      ;; 00:30C9 $E6 $0F
    cp   OBJECTS_PER_ROW + 1                      ;; 00:30CB $FE $0B
    jr   nz, .lEnd                                ;; 00:30CD $20 $06
    ld   a, l                                     ;; 00:30CF $7D
    and  $F0                                      ;; 00:30D0 $E6 $F0
    add  a, $11                                   ;; 00:30D2 $C6 $11
    ld   l, a                                     ;; 00:30D4 $6F
.lEnd

    ; Increment the tiles pointer in vBGMap0
    ld   a, e                                     ;; 00:30D5 $7B
    add  a, $02                                   ;; 00:30D6 $C6 $02
    ld   e, a                                     ;; 00:30D8 $5F
    ; When the end of a tiles line is reached, move to the next one.
    and  $1F                                      ;; 00:30D9 $E6 $1F
    cp   (SCRN_X / TILE_WIDTH)                    ;; 00:30DB $FE $14
    jr   nz, .eEnd                                ;; 00:30DD $20 $0A
    ld   a, e                                     ;; 00:30DF $7B
    and  $E0                                      ;; 00:30E0 $E6 $E0
    add  a, $40                                   ;; 00:30E2 $C6 $40
    ld   e, a                                     ;; 00:30E4 $5F
    ld   a, d                                     ;; 00:30E5 $7A
    adc  a, $00                                   ;; 00:30E6 $CE $00
    ld   d, a                                     ;; 00:30E8 $57
.eEnd

    ; Loop until all objects of the room are copied to the BG
    dec  c                                        ;; 00:30E9 $0D
    jr   nz, .loop                                ;; 00:30EA $20 $BD

    jpsb UpdateMinimapEntranceArrowAndReturn      ;; 00:30EC $3E $01 $EA $00 $21 $C3 $EA $6D

; Load room objects
LoadRoom::
    ; Disable all interrupts except VBlank
    ld   a, IEF_VBLANK                            ;; 00:30F4 $3E $01
    ldh  [rIE], a                                 ;; 00:30F6 $E0 $FF

    ; Increment wD47F
    ld   hl, wD47F                                ;; 00:30F8 $21 $7F $D4
    inc  [hl]                                     ;; 00:30FB $34

    callsb ResetRoomVariables                     ;; 00:30FC $3E $20 $EA $00 $21 $CD $A3 $4C

    ; If running on GBC…
    ldh  a, [hIsGBC]                              ;; 00:3104 $F0 $FE
    and  a                                        ;; 00:3106 $A7
    jr   z, .gbcEnd                               ;; 00:3107 $28 $10
    ; load palettes
    callsb LoadRoomPalettes                       ;; 00:3109 $3E $21 $EA $00 $21 $CD $B3 $40
    ; load tile attributes
    callsb LoadRoomObjectsAttributes              ;; 00:3111 $3E $20 $EA $00 $21 $CD $AF $6D
.gbcEnd

    ;
    ; Load map pointers bank
    ;

    ld   a, BANK(OverworldRoomPointers)           ;; 00:3119 $3E $09
    ld   [rSelectROMBank], a                      ;; 00:311B $EA $00 $21
    ; If loading an indoor room…
    ld   a, [wIsIndoor]                           ;; 00:311E $FA $A5 $DB
    and  a                                        ;; 00:3121 $A7
    jr   z, .indoorSpecialCodeEnd                 ;; 00:3122 $28 $16
    ; Do some stuff
    ld   a, BANK(func_014_5897)                   ;; 00:3124 $3E $14
    ld   [rSelectROMBank], a                      ;; 00:3126 $EA $00 $21
    ldh  [hRoomBank], a                           ;; 00:3129 $E0 $E8
    call func_014_5897                            ;; 00:312B $CD $97 $58
    ; Reset wKillCount and wKillOrder array
    ld   e, a                                     ;; 00:312E $5F
    ld   hl, wKillCount                           ;; 00:312F $21 $B5 $DB
.loop
    xor  a                                        ;; 00:3132 $AF
    ldi  [hl], a                                  ;; 00:3133 $22
    inc  e                                        ;; 00:3134 $1C
    ld   a, e                                     ;; 00:3135 $7B
    cp   wKillOrder.end - wKillOrder              ;; 00:3136 $FE $11
    jr   nz, .loop                                ;; 00:3138 $20 $F8
.indoorSpecialCodeEnd

    ;
    ; Load the room status
    ;

    ; de = hMapRoom
    ldh  a, [hMapRoom]                            ;; 00:313A $F0 $F6
    ld   e, a                                     ;; 00:313C $5F
    ld   d, $00                                   ;; 00:313D $16 $00
    ; hl = wOverworldRoomStatus
    ld   hl, wOverworldRoomStatus                 ;; 00:313F $21 $00 $D8
    ; If loading an indoor room…
    ld   a, [wIsIndoor]                           ;; 00:3142 $FA $A5 $DB
    and  a                                        ;; 00:3145 $A7
    jr   z, .roomStatusEnd                        ;; 00:3146 $28 $19
    ; … use the room status for indoor map A
    ld   hl, wIndoorARoomStatus                   ;; 00:3148 $21 $00 $D9
    ; If Color Dungeon…
    ldh  a, [hMapId]                              ;; 00:314B $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:314D $FE $FF
    jr   nz, .notColorDungeon                     ;; 00:314F $20 $05
    ; … use the room status for color dungeon
    ld   hl, wColorDungeonRoomStatus              ;; 00:3151 $21 $E0 $DD
    jr   .roomStatusEnd                           ;; 00:3154 $18 $0B
.notColorDungeon
    ; Unless on one of the special rooms, use the room status for the indoor map B
    cp   $1A                                      ;; 00:3156 $FE $1A
    jr   nc, .roomStatusEnd                       ;; 00:3158 $30 $07
    cp   $06                                      ;; 00:315A $FE $06
    jr   c, .roomStatusEnd                        ;; 00:315C $38 $03
    ld   hl, wIndoorBRoomStatus                   ;; 00:315E $21 $00 $DA
.roomStatusEnd

    ; a = RoomStatusTable[hMapRoom]
    add  hl, de                                   ;; 00:3161 $19
    ldh  a, [hIsSideScrolling]                    ;; 00:3162 $F0 $F9
    and  a                                        ;; 00:3164 $A7
    ld   a, [hl]                                  ;; 00:3165 $7E

    ; If the room status was zero (not visited yet), mark the room as visited
    jr   nz, .markVisitedRoomEnd                  ;; 00:3166 $20 $03
    or   ROOM_STATUS_VISITED                      ;; 00:3168 $F6 $80
    ld   [hl], a                                  ;; 00:316A $77
.markVisitedRoomEnd

    ; Set the room status as the current room status
    ldh  [hRoomStatus], a                         ;; 00:316B $E0 $F8

    ;
    ; Select the bank and address for the map pointers table
    ;

    ; bc = hMapRoom
    ldh  a, [hMapRoom]                            ;; 00:316D $F0 $F6
    ld   c, a                                     ;; 00:316F $4F
    ld   b, $00                                   ;; 00:3170 $06 $00
    sla  c                                        ;; 00:3172 $CB $21
    rl   b                                        ;; 00:3174 $CB $10

    ; If the room is indoor…
    ld   a, [wIsIndoor]                           ;; 00:3176 $FA $A5 $DB
    and  a                                        ;; 00:3179 $A7
    jr   z, .isIndoorEnd                          ;; 00:317A $28 $43

    ; …by default use the bank for IndoorsA map
    ld   a, BANK(IndoorsARoomPointers)            ;; 00:317C $3E $0A
    ld   [rSelectROMBank], a                      ;; 00:317E $EA $00 $21
    ldh  [hRoomBank], a                           ;; 00:3181 $E0 $E8

    ; If the room is in the Color Dungeon…
    ldh  a, [hMapId]                              ;; 00:3183 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:3185 $FE $FF
    jr   nz, .colorDungeonEnd                     ;; 00:3187 $20 $06
    ; …use the map pointers table specific to the color dungeon.
    ld   hl, ColorDungeonRoomPointers             ;; 00:3189 $21 $77 $7B
    jp   .fetchRoomAddress                        ;; 00:318C $C3 $24 $32
.colorDungeonEnd

    ; If have the Magnifying Lens, load an alternate Goriya room (where the Goriya NPC is actually present)
    cp   MAP_CAVE_WATER                           ;; 00:318F $FE $1F
    jr   nz, .goriyaRoomEnd                       ;; 00:3191 $20 $13
    ldh  a, [hMapRoom]                            ;; 00:3193 $F0 $F6
    cp   ROOM_INDOOR_A_GORIYA                     ;; 00:3195 $FE $F5
    jr   nz, .goriyaRoomEnd                       ;; 00:3197 $20 $0D
    ld   a, [wTradeSequenceItem]                  ;; 00:3199 $FA $0E $DB
    cp   TRADING_ITEM_MAGNIFYING_LENS             ;; 00:319C $FE $0E
    jr   nz, .goriyaRoomEnd                       ;; 00:319E $20 $06
    ld   bc, IndoorsAF5Alt                        ;; 00:31A0 $01 $55 $78
    jp   .parseRoomHeader                         ;; 00:31A3 $C3 $3A $32
.goriyaRoomEnd

    ; If the map is in between MAP_INDOORS_B_START and MAP_INDOORS_B_END…
    ld   hl, IndoorsARoomPointers                 ;; 00:31A6 $21 $00 $40
    ldh  a, [hMapId]                              ;; 00:31A9 $F0 $F7
    cp   MAP_INDOORS_B_END                        ;; 00:31AB $FE $1A
    jr   nc, .fetchRoomAddress                    ;; 00:31AD $30 $75
    cp   MAP_INDOORS_B_START                      ;; 00:31AF $FE $06
    jr   c, .fetchRoomAddress                     ;; 00:31B1 $38 $71
    ; …use the bank for IndoorB map.
    ld   a, BANK(IndoorsBRoomPointers)            ;; 00:31B3 $3E $0B
    ld   [rSelectROMBank], a                      ;; 00:31B5 $EA $00 $21
    ldh  [hRoomBank], a                           ;; 00:31B8 $E0 $E8
    ld   hl, IndoorsBRoomPointers                 ;; 00:31BA $21 $00 $40
    jr   .fetchRoomAddress                        ;; 00:31BD $18 $65

.isIndoorEnd

    ;
    ; Swap some Overworld rooms with alternative layouts
    ;

    ldh  a, [hMapRoom]                            ;; 00:31BF $F0 $F6
    cp   ROOM_OW_EAGLES_TOWER                     ;; 00:31C1 $FE $0E
    jr   nz, .endEaglesTowerAlt                   ;; 00:31C3 $20 $0C
    ld   a, [wOverworldRoomStatus + ROOM_OW_EAGLES_TOWER] ;; 00:31C5 $FA $0E $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 00:31C8 $E6 $10
    jr   z, .altRoomsEnd                          ;; 00:31CA $28 $55
    ld   bc, Overworld0EAlt ; Eagle's Tower open  ;; 00:31CC $01 $EC $47
    jr   .loadBankForOverworldRooms               ;; 00:31CF $18 $5E
.endEaglesTowerAlt

    cp   $8C                                      ;; 00:31D1 $FE $8C
    jr   nz, .endSouthFaceShrineAlt               ;; 00:31D3 $20 $0C
    ld   a, [wOverworldRoomStatus + $8C]          ;; 00:31D5 $FA $8C $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 00:31D8 $E6 $10
    jr   z, .altRoomsEnd                          ;; 00:31DA $28 $45
    ld   bc, Overworld8CAlt ; South Face Shrine open ;; 00:31DC $01 $4E $43
    jr   .loadBankForOverworldRooms               ;; 00:31DF $18 $4E
.endSouthFaceShrineAlt

    cp   $79                                      ;; 00:31E1 $FE $79
    jr   nz, .endUpperTalTalHeightsAlt            ;; 00:31E3 $20 $0C
    ld   a, [wOverworldRoomStatus + $79]          ;; 00:31E5 $FA $79 $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 00:31E8 $E6 $10
    jr   z, .altRoomsEnd                          ;; 00:31EA $28 $35
    ld   bc, Overworld79Alt ; Kanalet Castle open ;; 00:31EC $01 $13 $65
    jr   .loadBankForOverworldRooms               ;; 00:31EF $18 $3E
.endUpperTalTalHeightsAlt

    cp   $06                                      ;; 00:31F1 $FE $06
    jr   nz, .endWindfishsEggAlt                  ;; 00:31F3 $20 $0C
    ld   a, [wOverworldRoomStatus + $06]          ;; 00:31F5 $FA $06 $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 00:31F8 $E6 $10
    jr   z, .altRoomsEnd                          ;; 00:31FA $28 $25
    ld   bc, Overworld06Alt ; Windfish's Egg open ;; 00:31FC $01 $96 $44
    jr   .loadBankForOverworldRooms               ;; 00:31FF $18 $2E
.endWindfishsEggAlt

    cp   $1B                                      ;; 00:3201 $FE $1B
    jr   nz, .endTalTalHeightsAlt                 ;; 00:3203 $20 $0C
    ld   a, [wOverworldRoomStatus + $2B]          ;; 00:3205 $FA $2B $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 00:3208 $E6 $10
    jr   z, .altRoomsEnd                          ;; 00:320A $28 $15
    ld   bc, Overworld1BAlt ; Angler's Tunnel upper water dry ;; 00:320C $01 $0F $4C
    jr   .loadBankForOverworldRooms               ;; 00:320F $18 $1E
.endTalTalHeightsAlt

    cp   $2B                                      ;; 00:3211 $FE $2B
    jr   nz, .altRoomsEnd                         ;; 00:3213 $20 $0C
    ld   a, [wOverworldRoomStatus + $2B]          ;; 00:3215 $FA $2B $D8
    and  OW_ROOM_STATUS_CHANGED                   ;; 00:3218 $E6 $10
    jr   z, .altRoomsEnd                          ;; 00:321A $28 $05
    ld   bc, Overworld2BAlt ; Angler's Tunnel open ;; 00:321C $01 $9A $50
    jr   .loadBankForOverworldRooms               ;; 00:321F $18 $0E

.altRoomsEnd

    ;
    ; Get room address from index
    ;
    ; hl: rooms base address
    ; bc: room index
    ;

    ; Set the base address for resolving usual room pointers
    ; (except Color Dungeon)
    ld   hl, OverworldRoomPointers                ;; 00:3221 $21 $00 $40

.fetchRoomAddress
    ; b = hl[room index]
    ; c = hl[room index + 1]
    add  hl, bc                                   ;; 00:3224 $09
    ld   a, [hli]                                 ;; 00:3225 $2A
    ld   c, a                                     ;; 00:3226 $4F
    ld   a, [hl]                                  ;; 00:3227 $7E
    ld   b, a                                     ;; 00:3228 $47

    ;
    ; Load proper bank for Overworld rooms
    ;

    ; If in Overworld…
    ld   a, [wIsIndoor]                           ;; 00:3229 $FA $A5 $DB
    and  a                                        ;; 00:322C $A7
    jr   nz, .parseRoomHeader                     ;; 00:322D $20 $0B
.loadBankForOverworldRooms
    ; … and the overworld room index is >= $80…
    ldh  a, [hMapRoom]                            ;; 00:322F $F0 $F6
    cp   ROOM_SECTION_OW_SECOND_HALF              ;; 00:3231 $FE $80
    jr   c, .parseRoomHeader                      ;; 00:3233 $38 $05
    ; … select bank for second half of Overworld rooms
    ld   a, BANK(OverworldRoomsSecondHalf)        ;; 00:3235 $3E $1A
    ld   [rSelectROMBank], a                      ;; 00:3237 $EA $00 $21

    ;
    ; Parse room header
    ; bc: address of room header data
    ;
.parseRoomHeader

    ; Parse header first byte (animated tiles group)
    ld   a, [bc]                                  ;; 00:323A $0A
    cp   ROOM_END                                 ;; 00:323B $FE $FE
    jr   z, .endOfRoom                            ;; 00:323D $28 $4F
    ldh  [hAnimatedTilesGroup], a                 ;; 00:323F $E0 $A4

    ; Parse header second byte
    inc  bc                                       ;; 00:3241 $03
    ld   a, [wIsIndoor]                           ;; 00:3242 $FA $A5 $DB
    and  a                                        ;; 00:3245 $A7
    jr   z, .parseOverworldSecondByte             ;; 00:3246 $28 $10

.parseIndoorsSecondByte
    ; For indoor rooms, the lower nybble is the floor tile…
    ld   a, [bc]                                  ;; 00:3248 $0A
    and  $0F                                      ;; 00:3249 $E6 $0F
    call FillRoomMapWithObject                    ;; 00:324B $CD $E7 $37
    ; … and the upper nybble is the room template
    ld   a, [bc]                                  ;; 00:324E $0A
    swap a                                        ;; 00:324F $CB $37
    and  $0F                                      ;; 00:3251 $E6 $0F
    call LoadRoomTemplate_trampoline              ;; 00:3253 $CD $EA $38
    jr   .parseRoomObjectsLoop                    ;; 00:3256 $18 $04

.parseOverworldSecondByte
    ; For overworld rooms, the second byte is just the floor tile
    ld   a, [bc]                                  ;; 00:3258 $0A
    call FillRoomMapWithObject                    ;; 00:3259 $CD $E7 $37

    ;
    ; Parse room objects
    ;

.parseRoomObjectsLoop
    ; Increment the current address
    inc  bc                                       ;; 00:325C $03
    ; a = object type
    ld   a, [bc]                                  ;; 00:325D $0A

    ; If object is warp data…
    and  %11111100                                ;; 00:325E $E6 $FC
    cp   ROOM_WARP                                ;; 00:3260 $FE $E0
    jr   nz, .warpDataEnd                         ;; 00:3262 $20 $20
    ; …copy object to the first available warp data slot.
    ldh  a, [hFreeWarpDataAddress]                ;; 00:3264 $F0 $E6
    ld   e, a                                     ;; 00:3266 $5F
    ld   d, $00                                   ;; 00:3267 $16 $00
    ld   hl, wWarpStructs                         ;; 00:3269 $21 $01 $D4
    add  hl, de                                   ;; 00:326C $19
    ld   a, [bc]                                  ;; 00:326D $0A
    and  $03                                      ;; 00:326E $E6 $03
    ldi  [hl], a                                  ;; 00:3270 $22
    inc  bc                                       ;; 00:3271 $03
    ld   a, [bc]                                  ;; 00:3272 $0A
    ldi  [hl], a                                  ;; 00:3273 $22
    inc  bc                                       ;; 00:3274 $03
    ld   a, [bc]                                  ;; 00:3275 $0A
    ldi  [hl], a                                  ;; 00:3276 $22
    inc  bc                                       ;; 00:3277 $03
    ld   a, [bc]                                  ;; 00:3278 $0A
    ldi  [hl], a                                  ;; 00:3279 $22
    inc  bc                                       ;; 00:327A $03
    ld   a, [bc]                                  ;; 00:327B $0A
    ldi  [hl], a                                  ;; 00:327C $22
    ; Increment the address of the first available warp data slot
    ld   a, e                                     ;; 00:327D $7B
    add  a, $05                                   ;; 00:327E $C6 $05
    ldh  [hFreeWarpDataAddress], a                ;; 00:3280 $E0 $E6
    jr   .parseRoomObjectsLoop                    ;; 00:3282 $18 $D8
.warpDataEnd

    ; a = object type
    ld   a, [bc]                                  ;; 00:3284 $0A
    ; If we reached the end of the room objects, exit the loop
    cp   ROOM_END                                 ;; 00:3285 $FE $FE
    jr   z, .endOfRoom                            ;; 00:3287 $28 $05

    call LoadRoomObject                           ;; 00:3289 $CD $A9 $32
    jr   .parseRoomObjectsLoop                    ;; 00:328C $18 $CE

.endOfRoom

    ; Surround the objects area defining a room by ROOM_BORDER values
    callsb PadRoomObjectsArea                     ;; 00:328E $3E $01 $EA $00 $21 $CD $CE $6C

    ; Do stuff that returns early if end-of-room
    callsb func_036_6D4D                          ;; 00:3296 $3E $36 $EA $00 $21 $CD $4D $6D

    ; Load palette for room objects?
    callsb func_021_53F3                          ;; 00:329E $3E $21 $EA $00 $21 $CD $F3 $53

    ; Reload saved bank and return
    jp   ReloadSavedBank                          ;; 00:32A6 $C3 $1D $08

; Read an individual room object, and write it to the unpacked room objects area.
; bc : start address of the object
;
; Objects can be 2-bytes objects or 3-bytes objects:
;
; twoBytesObject:
;   ds 1 ; location (YX)
;   ds 1 ; type
;
; threeBytesObject:
;   ds 1 ; direction and length (8X: horizontal + length ; CX: vertical + length)
;   ds 1 ; location (YX)
;   ds 1 ; type
;
LoadRoomObject::
    ; Clear hMultiPurpose0
    xor  a                                        ;; 00:32A9 $AF
    ldh  [hMultiPurpose0], a                      ;; 00:32AA $E0 $D7

    ; If object type first bit is 1…
    ld   a, [bc]                                  ;; 00:32AC $0A
    bit  7, a                                     ;; 00:32AD $CB $7F
    jr   z, .threeBytesObjectEnd                  ;; 00:32AF $28 $07
    ; … and object type 4th bit is 0…
    bit  4, a                                     ;; 00:32B1 $CB $67
    jr   nz, .threeBytesObjectEnd                 ;; 00:32B3 $20 $03
    ; … this is a three-bytes object, that spans more than one block.
    ; The first byte encodes the direction and length of the block:
    ; save it to hMultiPurpose0.
    ldh  [hMultiPurpose0], a                      ;; 00:32B5 $E0 $D7
    ; Skip the parsed direction-and-length byte
    inc  bc                                       ;; 00:32B7 $03
.threeBytesObjectEnd

    ; Increment read pointer to the object type
    inc  bc                                       ;; 00:32B8 $03

    ; e = hRoomStatus
    ldh  a, [hRoomStatus]                         ;; 00:32B9 $F0 $F8
    ld   e, a                                     ;; 00:32BB $5F

    ; If currently on Overworld…
    ld   a, [wIsIndoor]                           ;; 00:32BC $FA $A5 $DB
    and  a                                        ;; 00:32BF $A7
    jr   nz, .loadIndoorObject                    ;; 00:32C0 $20 $17

    ; Overworld objects with type >= $F5 are handled by code in another bank.

    ; If object is an Overworld macro…
    ld   a, [bc]                                  ;; 00:32C2 $0A
    sub  a, OBJECT_MACROS_SECTION                 ;; 00:32C3 $D6 $F5
    jr   c, .loadOverworldObject                  ;; 00:32C5 $38 $3D
    ; d = object type
    ld   a, [bc]                                  ;; 00:32C7 $0A
    ld   d, a                                     ;; 00:32C8 $57
    ; e = object position
    dec  bc                                       ;; 00:32C9 $0B
    ld   a, [bc]                                  ;; 00:32CA $0A
    ld   e, a                                     ;; 00:32CB $5F
    ; (re-increment bc to be at the object type again)
    inc  bc                                       ;; 00:32CC $03
    ; Handle the macro
    callsb ExpandOverworldObjectMacro             ;; 00:32CD $3E $24 $EA $00 $21 $CD $78 $75
    call SetBankForRoom                           ;; 00:32D5 $CD $3B $35
    ; Return early
    ret                                           ;; 00:32D8 $C9

.loadIndoorObject
    ; a = object type - OBJECT_KEY_DOOR_TOP
    ld   a, [bc]                                  ;; 00:32D9 $0A
    sub  a, OBJECT_KEY_DOOR_TOP                   ;; 00:32DA $D6 $EC
    ; If a >= OBJECT_KEY_DOOR_TOP, dispatch to the door object handlers
    jp  c, .loadNonDoorIndoorObject               ;; 00:32DC $DA $CB $33
    JP_TABLE                                      ;; 00:32DF $C7
._EC dw LoadObject_KeyDoorTop                     ;; 00:32E0
._ED dw LoadObject_KeyDoorBottom                  ;; 00:32E2
._EE dw LoadObject_KeyDoorLeft                    ;; 00:32E4
._EF dw LoadObject_KeyDoorRight                   ;; 00:32E6
._F0 dw LoadObject_ClosedDoorTop                  ;; 00:32E8
._F1 dw LoadObject_ClosedDoorBottom               ;; 00:32EA
._F2 dw LoadObject_ClosedDoorLeft                 ;; 00:32EC
._F3 dw LoadObject_ClosedDoorRight                ;; 00:32EE
._F4 dw LoadObject_OpenDoorTop                    ;; 00:32F0
._F5 dw LoadObject_OpenDoorBottom                 ;; 00:32F2
._F6 dw LoadObject_OpenDoorLeft                   ;; 00:32F4
._F7 dw LoadObject_OpenDoorRight                  ;; 00:32F6
._F8 dw LoadObject_BossDoor                       ;; 00:32F8
._F9 dw LoadObject_StairsDoor                     ;; 00:32FA
._FA dw LoadObject_FlipWall                       ;; 00:32FC
._FB dw LoadObject_OneWayArrow                    ;; 00:32FE
._FC dw LoadObject_DungeonEntrance                ;; 00:3300
._FD dw LoadObject_IndoorEntrance                 ;; 00:3302

; Load an Overworld object (that is not a macro)
.loadOverworldObject
    ; Re-increment a to be the object type
    add  a, $F5                                   ;; 00:3304 $C6 $F5
    push af                                       ;; 00:3306 $F5
    ; d = a
    ld   d, a                                     ;; 00:3307 $57

    cp   OBJECT_WATERFALL                         ;; 00:3308 $FE $E9
    jr   nz, .waterfallEnd                        ;; 00:330A $20 $03
    ld   [wC50E], a                               ;; 00:330C $EA $0E $C5
.waterfallEnd

    ;
    ; If the Weather Vane is pushed open, shift it to the top
    ;

    cp   OBJECT_WEATHER_VANE_BASE                 ;; 00:330F $FE $5E
    jr   nz, .weatherVaneBottomEnd                ;; 00:3311 $20 $04
    bit  5, e ; object position                   ;; 00:3313 $CB $6B
    jr   nz, .replaceObjectByGroundStairs         ;; 00:3315 $20 $65
.weatherVaneBottomEnd

    cp   OBJECT_WEATHER_VANE_TOP                  ;; 00:3317 $FE $91
    jr   nz, .weatherVaneTopEnd                   ;; 00:3319 $20 $09
    bit  5, e ; object position                   ;; 00:331B $CB $6B
    jr   z, .weatherVaneTopEnd                    ;; 00:331D $28 $05
    ; replace the top by the vane base
    pop  af                                       ;; 00:331F $F1
    ld   a, OBJECT_WEATHER_VANE_BASE              ;; 00:3320 $3E $5E
    ld   d, a                                     ;; 00:3322 $57
    push af                                       ;; 00:3323 $F5
.weatherVaneTopEnd

    cp   OBJECT_WEATHER_VANE_ABOVE                ;; 00:3324 $FE $DC
    jr   nz, .weatherVaneAboveEnd                 ;; 00:3326 $20 $09
    bit  5, e ; object position                   ;; 00:3328 $CB $6B
    jr   z, .weatherVaneAboveEnd                  ;; 00:332A $28 $05
    ; replace the grass above by the vane top
    pop  af                                       ;; 00:332C $F1
    ld   a, OBJECT_WEATHER_VANE_TOP               ;; 00:332D $3E $91
    ld   d, a                                     ;; 00:332F $57
    push af                                       ;; 00:3330 $F5
.weatherVaneAboveEnd

    ;
    ; If the Monkey Bridge is built yet, display it
    ;

    cp   OBJECT_MONKEY_BRIDGE_TOP                 ;; 00:3331 $FE $D8
    jr   z, .loadMonkeyBridgeObject               ;; 00:3333 $28 $08
    cp   OBJECT_MONKEY_BRIDGE_MIDDLE              ;; 00:3335 $FE $D9
    jr   z, .loadMonkeyBridgeObject               ;; 00:3337 $28 $04
    cp   OBJECT_MONKEY_BRIDGE_BOTTOM              ;; 00:3339 $FE $DA
    jr   nz, .monkeyBridgeEnd                     ;; 00:333B $20 $09

.loadMonkeyBridgeObject
    ; If the monkey bridge is built…
    bit  4, e                                     ;; 00:333D $CB $63
    jr   z, .monkeyBridgeEnd                      ;; 00:333F $28 $05
    ; …replace the object by the monkey bridge
    pop  af                                       ;; 00:3341 $F1
    ld   a, OBJECT_MONKEY_BRIDGE_BUILT            ;; 00:3342 $3E $DB
    ld   d, a                                     ;; 00:3344 $57
    push af                                       ;; 00:3345 $F5
.monkeyBridgeEnd

    ; If a closed gate has been opened…
    cp   OBJECT_CLOSED_GATE                       ;; 00:3346 $FE $C2
    jr   nz, .closedGateEnd                       ;; 00:3348 $20 $09
    bit  4, e                                     ;; 00:334A $CB $63
    jr   z, .closedGateEnd                        ;; 00:334C $28 $05
    ; …replace the object by the open cave entrance
    pop  af                                       ;; 00:334E $F1
    ld   a, OBJECT_CAVE_DOOR                      ;; 00:334F $3E $E3
    ld   d, a                                     ;; 00:3351 $57
    push af                                       ;; 00:3352 $F5
.closedGateEnd

    ; If a bombable cave door has been bombed…
    ld   a, d                                     ;; 00:3353 $7A
    cp   OBJECT_BOMBABLE_CAVE_DOOR                ;; 00:3354 $FE $BA
    jr   nz, .bombableCaveDoorEnd                 ;; 00:3356 $20 $09
    bit  2, e                                     ;; 00:3358 $CB $53
    jr   z, .bombableCaveDoorEnd                  ;; 00:335A $28 $05
    ; …replace the object by the open rocky cave entrance
    pop  af                                       ;; 00:335C $F1
    ld   a, OBJECT_ROCKY_CAVE_DOOR                ;; 00:335D $3E $E1
    ld   d, a                                     ;; 00:335F $57
    push af                                       ;; 00:3360 $F5
.bombableCaveDoorEnd

    ; If a bush masking a cave entrance has been cut…
    ld   a, d                                     ;; 00:3361 $7A
    cp   OBJECT_BUSH_GROUND_STAIRS                ;; 00:3362 $FE $D3
    jr   nz, .bushGroundStairsEnd                 ;; 00:3364 $20 $1B
    bit  4, e                                     ;; 00:3366 $CB $63
    jr   z, .bushGroundStairsEnd                  ;; 00:3368 $28 $17
    ldh  a, [hMapRoom]                            ;; 00:336A $F0 $F6
    cp   UNKNOWN_ROOM_75                          ;; 00:336C $FE $75
    jr   z, .replaceObjectByGroundStairs          ;; 00:336E $28 $0C
    cp   ROOM_OW_RIGHT_OF_EGG                     ;; 00:3370 $FE $07
    jr   z, .replaceObjectByGroundStairs          ;; 00:3372 $28 $08
    cp   UNKNOWN_ROOM_AA                          ;; 00:3374 $FE $AA
    jr   z, .replaceObjectByGroundStairs          ;; 00:3376 $28 $04
    cp   UNKNOWN_ROOM_4A                          ;; 00:3378 $FE $4A
    jr   nz, .bushGroundStairsEnd                 ;; 00:337A $20 $05
.replaceObjectByGroundStairs
    pop  af                                       ;; 00:337C $F1
    ld   a, OBJECT_GROUND_STAIRS                  ;; 00:337D $3E $C6
    ld   d, a                                     ;; 00:337F $57
    push af                                       ;; 00:3380 $F5
.bushGroundStairsEnd

    ; hMultiPurpose9 = object type
    ld   a, d                                     ;; 00:3381 $7A
    ldh  [hMultiPurpose9], a                      ;; 00:3382 $E0 $E0

    ; If object is an entrance to somewhere else…
    cp   OBJECT_CLOSED_GATE                       ;; 00:3384 $FE $C2
    jr   z, .configureDoorWarpData                ;; 00:3386 $28 $20
    cp   OBJECT_ROCKY_CAVE_DOOR                   ;; 00:3388 $FE $E1
    jr   z, .configureDoorWarpData                ;; 00:338A $28 $1C
    cp   $CB                                      ;; 00:338C $FE $CB
    jr   z, .configureDoorWarpData                ;; 00:338E $28 $18
    cp   OBJECT_BOMBABLE_CAVE_DOOR                ;; 00:3390 $FE $BA
    jr   z, .configureDoorWarpData                ;; 00:3392 $28 $14
    cp   $61                                      ;; 00:3394 $FE $61
    jr   z, .configureDoorWarpData                ;; 00:3396 $28 $10
    cp   OBJECT_GROUND_STAIRS                     ;; 00:3398 $FE $C6
    jr   z, .configureDoorWarpData                ;; 00:339A $28 $0C
    cp   $C5                                      ;; 00:339C $FE $C5
    jr   z, .configureDoorWarpData                ;; 00:339E $28 $08
    cp   $E2                                      ;; 00:33A0 $FE $E2
    jr   z, .configureDoorWarpData                ;; 00:33A2 $28 $04
    cp   OBJECT_CAVE_DOOR                         ;; 00:33A4 $FE $E3
    jr   nz, .overworldDoorEnd                    ;; 00:33A6 $20 $14

.configureDoorWarpData
    ld   a, [wC19C]                               ;; 00:33A8 $FA $9C $C1
    ld   e, a                                     ;; 00:33AB $5F
    inc  a                                        ;; 00:33AC $3C
    and  $03                                      ;; 00:33AD $E6 $03
    ld   [wC19C], a                               ;; 00:33AF $EA $9C $C1
    ld   d, $00                                   ;; 00:33B2 $16 $00
    ld   hl, wWarpPositions                       ;; 00:33B4 $21 $16 $D4
    add  hl, de                                   ;; 00:33B7 $19
    dec  bc                                       ;; 00:33B8 $0B
    ld   a, [bc]                                  ;; 00:33B9 $0A
    ld   [hl], a                                  ;; 00:33BA $77
    inc  bc                                       ;; 00:33BB $03
.overworldDoorEnd

    ; a = object type
    ldh  a, [hMultiPurpose9]                      ;; 00:33BC $F0 $E0

    cp   $C5                                      ;; 00:33BE $FE $C5
    jp   z, .configureStairs                      ;; 00:33C0 $CA $7D $34
    cp   OBJECT_GROUND_STAIRS                     ;; 00:33C3 $FE $C6
    jp   z, .configureStairs                      ;; 00:33C5 $CA $7D $34
    jp   .breakableObjectEnd                      ;; 00:33C8 $C3 $CE $34

.loadNonDoorIndoorObject
    ; Re-increment a to be the object type
    add  a, OBJECT_KEY_DOOR_TOP                   ;; 00:33CB $C6 $EC
    ldh  [hMultiPurpose9], a                      ;; 00:33CD $E0 $E0

    ; If object type is a conveyor belt…
    push af                                       ;; 00:33CF $F5
    cp   OBJECT_CONVEYOR_BOTTOM                   ;; 00:33D0 $FE $CF
    jr   c, .conveyorEnd                          ;; 00:33D2 $38 $08
    cp   OBJECT_TRENDY_GAME_BORDER                ;; 00:33D4 $FE $D3
    jr   nc, .conveyorEnd                         ;; 00:33D6 $30 $04
    ; …increment the number of conveyor belts present on screen
    ld   hl, wConveyorBeltsCount                  ;; 00:33D8 $21 $A5 $C1
    inc  [hl]                                     ;; 00:33DB $34
.conveyorEnd

    ; If object is an unlit torch…
    cp   OBJECT_TORCH_UNLIT                       ;; 00:33DC $FE $AB
    jr   nz, .torchEnd                            ;; 00:33DE $20 $27
    ; clear wObjectAffectingBGPalette
    xor  a                                        ;; 00:33E0 $AF
    ld   [wObjectAffectingBGPalette], a           ;; 00:33E1 $EA $CB $C3
    ; POI: Potential bug: Room $1C4 (IndoorA) is the Face Shrine pre-boss room
    ; where you can light two torches to trigger an event. However,
    ; room $2C4 (IndoorB) *also* has an unlit torch. This causes some
    ; weird palette flickering, though $2C4 and $2D4 are inaccessible
    ; (part of an old Kanalet Castle entry before the side-scrolling stuff)
    ; If the room is $C4…
    ldh  a, [hMapRoom]                            ;; 00:33E4 $F0 $F6
    cp   UNKNOWN_ROOM_C4                          ;; 00:33E6 $FE $C4
    ; … and the object type is not zero…
    ldh  a, [hMultiPurpose9]                      ;; 00:33E8 $F0 $E0
    jr   z, .torchEnd                             ;; 00:33EA $28 $1B
    ; …then increment the number of torches in the room
    ld   hl, wTorchesCount                        ;; 00:33EC $21 $C9 $DB
    inc  [hl]                                     ;; 00:33EF $34
    ; mark the torch as affecting the background palette
    ld   [wObjectAffectingBGPalette], a           ;; 00:33F0 $EA $CB $C3
    ; wC3CD += 4
    push af                                       ;; 00:33F3 $F5
    ld   a, [wC3CD]                               ;; 00:33F4 $FA $CD $C3
    add  a, $04                                   ;; 00:33F7 $C6 $04
    ld   [wC3CD], a                               ;; 00:33F9 $EA $CD $C3
    ; If not on GBC…
    ldh  a, [hIsGBC]                              ;; 00:33FC $F0 $FE
    and  a                                        ;; 00:33FE $A7
    jr   nz, .dmgTorchesEnd                       ;; 00:33FF $20 $05
    ; …configure the transition counter that will dim the lights
    ; when entering the room.
    ld   a, $04                                   ;; 00:3401 $3E $04
    ld   [wTransitionSequenceCounter], a          ;; 00:3403 $EA $6B $C1
.dmgTorchesEnd
    pop  af                                       ;; 00:3406 $F1
.torchEnd

    ;
    ; Configure switches and movable blocks
    ;

    cp   OBJECT_POT_WITH_SWITCH                   ;; 00:3407 $FE $8E
    jr   z, .configureSwitchButton                ;; 00:3409 $28 $13
    cp   OBJECT_SWITCH_BUTTON                     ;; 00:340B $FE $AA
    jr   z, .configureSwitchButton                ;; 00:340D $28 $0F

    cp   OBJECT_RAISED_BLOCK                      ;; 00:340F $FE $DC
    jr   z, .configureMovableBlock                ;; 00:3411 $28 $04
    cp   OBJECT_LOWERED_BLOCK                     ;; 00:3413 $FE $DB
    jr   nz, .switchableObjectsEnd                ;; 00:3415 $20 $0C

.configureMovableBlock
    ld   hl, wRoomSwitchableObject                ;; 00:3417 $21 $FA $D6
    ld   [hl], ROOM_SWITCHABLE_OBJECT_MOBILE_BLOCK ;; 00:341A $36 $02
    jr   .switchableObjectsEnd                    ;; 00:341C $18 $05

.configureSwitchButton
    ld   hl, wRoomSwitchableObject                ;; 00:341E $21 $FA $D6
    ld   [hl], ROOM_SWITCHABLE_OBJECT_SWITCH_BUTTON ;; 00:3421 $36 $01
.switchableObjectsEnd

    ;
    ; Configure top and bottom bombable walls
    ;

    cp   OBJECT_BOMBABLE_WALL_TOP                 ;; 00:3423 $FE $3F
    jr   z, .configureBombableWallTop             ;; 00:3425 $28 $04
    cp   OBJECT_HIDDEN_BOMBABLE_WALL_TOP          ;; 00:3427 $FE $47
    jr   nz, .bombableWallBottom                  ;; 00:3429 $20 $04
.configureBombableWallTop
    ; If a top bombable wall has been bombed…
    bit  2, e                                     ;; 00:342B $CB $53
    ; …replace the wall by a bombed passage
    jr   nz, .replaceByVerticalBombedPassage      ;; 00:342D $20 $0C

.bombableWallBottom
    cp   OBJECT_BOMBABLE_WALL_BOTTOM              ;; 00:342F $FE $40
    jr   z, .configureBombableWallBottom          ;; 00:3431 $28 $04
    cp   OBJECT_HIDDEN_BOMBABLE_WALL_BOTTOM       ;; 00:3433 $FE $48
    jr   nz, .verticalBombableWallsEnd            ;; 00:3435 $20 $08
.configureBombableWallBottom
    ; If a bottom bombable wall has been bombed…
    bit  3, e                                     ;; 00:3437 $CB $5B
    jr   z, .verticalBombableWallsEnd             ;; 00:3439 $28 $04
    ; …replace the wall by a bombed passage

.replaceByVerticalBombedPassage
    pop  af                                       ;; 00:343B $F1
    ld   a, OBJECT_BOMBED_PASSAGE_VERTICAL        ;; 00:343C $3E $3D
    push af                                       ;; 00:343E $F5
.verticalBombableWallsEnd

    ;
    ; Configure left and right bombable walls
    ;

    cp   OBJECT_BOMBABLE_WALL_LEFT                ;; 00:343F $FE $41
    jr   z, .configureBombableWallLeft            ;; 00:3441 $28 $04
    cp   OBJECT_HIDDEN_BOMBABLE_WALL_LEFT         ;; 00:3443 $FE $49
    jr   nz, .bombableWallRight                   ;; 00:3445 $20 $04

.configureBombableWallLeft
    ; If a left bombable wall has been bombed…
    bit  1, e                                     ;; 00:3447 $CB $4B
    ; …replace the wall by a bombed passage
    jr   nz, .replaceByHorizontalBombedPassage    ;; 00:3449 $20 $0C

.bombableWallRight
    cp   OBJECT_BOMBABLE_WALL_RIGHT               ;; 00:344B $FE $42
    jr   z, .configureBombableWallRight           ;; 00:344D $28 $04
    cp   OBJECT_HIDDEN_BOMBABLE_WALL_RIGHT        ;; 00:344F $FE $4A
    jr   nz, .horizontalBombableWallsEnd          ;; 00:3451 $20 $08
.configureBombableWallRight
    ; If a right bombable wall has been bombed…
    bit  0, e                                     ;; 00:3453 $CB $43
    ; …replace the wall by a bombed passage
    jr   z, .horizontalBombableWallsEnd           ;; 00:3455 $28 $04

.replaceByHorizontalBombedPassage
    pop  af                                       ;; 00:3457 $F1
    ld   a, OBJECT_BOMBED_PASSAGE_HORIZONTAL      ;; 00:3458 $3E $3E
    push af                                       ;; 00:345A $F5
.horizontalBombableWallsEnd

    ;
    ; Configure chest
    ;

    ; If object is a chest…
    cp   OBJECT_CHEST_OPEN                        ;; 00:345B $FE $A1
    jr   nz, .chestEnd                            ;; 00:345D $20 $08
    ; … and the chest has been opened…
    bit  4, e                                     ;; 00:345F $CB $63
    jr   nz, .chestEnd                            ;; 00:3461 $20 $04
    ; a = [hMultiPurposeH]
    pop  af                                       ;; 00:3463 $F1
    ldh  a, [hMultiPurposeH]                      ;; 00:3464 $F0 $E9
    push af                                       ;; 00:3466 $F5
.chestEnd

    ;
    ; Configure hidden stairs
    ;

    ; If the object is hidden stairs…
    cp   OBJECT_HIDDEN_STAIRS_DOWN                ;; 00:3467 $FE $BF
    jr   nz, .hiddenStairsEnd                     ;; 00:3469 $20 $06
    ; … and the stairs are not visible yet…
    bit  4, e                                     ;; 00:346B $CB $63
    jr   nz, .hiddenStairsEnd                     ;; 00:346D $20 $02
    ; return without loading this object.
    pop  af                                       ;; 00:346F $F1
    ret                                           ;; 00:3470 $C9
.hiddenStairsEnd

    ;
    ; Configure stairs
    ;

    cp   OBJECT_STAIRS_DOWN                       ;; 00:3471 $FE $BE
    jr   z, .configureStairs                      ;; 00:3473 $28 $08
    cp   OBJECT_HIDDEN_STAIRS_DOWN                ;; 00:3475 $FE $BF
    jr   z, .configureStairs                      ;; 00:3477 $28 $04
    cp   OBJECT_STAIRS_UP                         ;; 00:3479 $FE $CB
    jr   nz, .stairsEnd                           ;; 00:347B $20 $19

.configureStairs
    dec  bc                                       ;; 00:347D $0B
    ld   a, STAIRCASE_INACTIVE                    ;; 00:347E $3E $01
    ldh  [hStaircase], a                          ;; 00:3480 $E0 $AC
    ld   a, [bc]                                  ;; 00:3482 $0A
    and  $F0                                      ;; 00:3483 $E6 $F0
    add  a, $10                                   ;; 00:3485 $C6 $10
    ldh  [hStaircasePosY], a                      ;; 00:3487 $E0 $AE
    ld   a, [bc]                                  ;; 00:3489 $0A
    swap a                                        ;; 00:348A $CB $37
    and  $F0                                      ;; 00:348C $E6 $F0
    add  a, $08                                   ;; 00:348E $C6 $08
    ldh  [hStaircasePosX], a                      ;; 00:3490 $E0 $AD
    inc  bc                                       ;; 00:3492 $03
    jp   .breakableObjectEnd                      ;; 00:3493 $C3 $CE $34
.stairsEnd

    ;
    ; Configure raised fences
    ;
    ; Raised fences can be activated: they turn into a wall
    ; jumpable from the top.
    ;
    ; POI: NB: it seems these objects are not used in the final game.
    ;

    cp   OBJECT_RAISED_FENCE_BOTTOM               ;; 00:3496 $FE $D6
    jr   z, .configureVerticalFence               ;; 00:3498 $28 $04
    cp   OBJECT_RAISED_FENCE_TOP                  ;; 00:349A $FE $D5
    jr   nz, .verticalFenceEnd                    ;; 00:349C $20 $08
.configureVerticalFence
    ; If the fence has been lowered…
    bit  4, e                                     ;; 00:349E $CB $63
    jr   nz, .verticalFenceEnd                    ;; 00:34A0 $20 $04
    ; … replace the fence by a jumpable wall
    pop  af                                       ;; 00:34A2 $F1
    ld   a, OBJECT_WALL_TOP                       ;; 00:34A3 $3E $21
    push af                                       ;; 00:34A5 $F5
.verticalFenceEnd

    cp   OBJECT_RAISED_FENCE_LEFT                 ;; 00:34A6 $FE $D7
    jr   z, .configureHorizontalFence             ;; 00:34A8 $28 $04
    cp   OBJECT_RAISED_FENCE_RIGHT                ;; 00:34AA $FE $D8
    jr   nz, .horizontalFenceEnd                  ;; 00:34AC $20 $08

.configureHorizontalFence
    ; If the fence has been lowered…
    bit  4, e                                     ;; 00:34AE $CB $63
    jr   nz, .horizontalFenceEnd                  ;; 00:34B0 $20 $04
    ; … replace the fence by a jumpable wall
    pop  af                                       ;; 00:34B2 $F1
    ld   a, OBJECT_WALL_BOTTOM                    ;; 00:34B3 $3E $22
    push af                                       ;; 00:34B5 $F5
.horizontalFenceEnd

    ;
    ; Configure breakable objects
    ;

    ldh  a, [hMapId]                              ;; 00:34B6 $F0 $F7
    cp   MAP_CAVE_B                               ;; 00:34B8 $FE $0A
    ldh  a, [hMultiPurpose9]                      ;; 00:34BA $F0 $E0
    jr   c, .bombableBlockEnd                     ;; 00:34BC $38 $04
    cp   OBJECT_BOMBABLE_BLOCK                    ;; 00:34BE $FE $A9
    jr   z, .configureBreakableObject             ;; 00:34C0 $28 $04
.bombableBlockEnd

    cp   OBJECT_KEYHOLE_BLOCK                     ;; 00:34C2 $FE $DE
    jr   nz, .breakableObjectEnd                  ;; 00:34C4 $20 $08

.configureBreakableObject
    ; If the object has been broken or activated…
    bit  6, e                                     ;; 00:34C6 $CB $73
    jr   z, .breakableObjectEnd                   ;; 00:34C8 $28 $04
    ; … replace it by an empty floor tile
    pop  af                                       ;; 00:34CA $F1
    ld   a, OBJECT_FLOOR_OD                       ;; 00:34CB $3E $0D
    push af                                       ;; 00:34CD $F5
.breakableObjectEnd

    ;
    ; Configure chest
    ;

    ; If the object is an closed chest…
    cp   OBJECT_CHEST_CLOSED                      ;; 00:34CE $FE $A0
    jr   nz, .closedChestEnd                      ;; 00:34D0 $20 $08
    ; … and the chest has already been opened…
    bit  4, e                                     ;; 00:34D2 $CB $63
    jr   z, .closedChestEnd                       ;; 00:34D4 $28 $04
    ; … replace it by an open chest
    pop  af                                       ;; 00:34D6 $F1
    ld   a, OBJECT_CHEST_OPEN                     ;; 00:34D7 $3E $A1
    push af                                       ;; 00:34D9 $F5
.closedChestEnd

    ; a = multiple-blocks object direction and length
    ld   d, $00                                   ;; 00:34DA $16 $00
    ldh  a, [hMultiPurpose0]                      ;; 00:34DC $F0 $D7
    ; If there are no coordinates for a multiple-blocks object…
    and  a                                        ;; 00:34DE $A7
    ; … this is a single-block object:
    ; copy the object to the unpacked map and return
    jr   z, CopyObjectToActiveRoomMap             ;; 00:34DF $28 $4C


    ; This is a multiple-blocks object.
    ; hl = initial position address
    dec  bc                                       ;; 00:34E1 $0B
    ld   a, [bc]                                  ;; 00:34E2 $0A
    ld   e, a                                     ;; 00:34E3 $5F
    ld   hl, wRoomObjects                         ;; 00:34E4 $21 $11 $D7
    add  hl, de                                   ;; 00:34E7 $19
    ; e = count
    ldh  a, [hMultiPurpose0]                      ;; 00:34E8 $F0 $D7
    and  $0F                                      ;; 00:34EA $E6 $0F
    ld   e, a                                     ;; 00:34EC $5F
    ; d = object type
    pop  af                                       ;; 00:34ED $F1
    ld   d, a                                     ;; 00:34EE $57
    ; fallthrough FillRoomWithConsecutiveObjects

; Fill the active room map with many consecutive objects
; Inputs:
;   d      object type
;   e      count
;   hl     destination address
;   hMultiPurpose0  object data (including the direction)
FillRoomWithConsecutiveObjects::
    ; Copy object type to the active room map
    ld   a, d                                     ;; 00:34EF $7A
    ldi  [hl], a                                  ;; 00:34F0 $22

    ; If the object direction is vertical…
    ldh  a, [hMultiPurpose0]                      ;; 00:34F1 $F0 $D7
    and  $40                                      ;; 00:34F3 $E6 $40
    jr   z, .verticalEnd                          ;; 00:34F5 $28 $04
    ; … increment the target address to move to the next column
    ld   a, l                                     ;; 00:34F7 $7D
    add  a, $0F                                   ;; 00:34F8 $C6 $0F
    ld   l, a                                     ;; 00:34FA $6F
.verticalEnd

    ; While the object count didn't reach 0, loop
    dec  e                                        ;; 00:34FB $1D
    jr   nz, FillRoomWithConsecutiveObjects       ;; 00:34FC $20 $F1

    ; Cleanup
    inc  bc                                       ;; 00:34FE $03
    ret                                           ;; 00:34FF $C9

; On GBC, special case for some overworld objects
label_3500::
    cp   $04                                      ;; 00:3500 $FE $04
    ret  z                                        ;; 00:3502 $C8
    cp   $09                                      ;; 00:3503 $FE $09
    jr   nz, label_350E                           ;; 00:3505 $20 $07
    ldh  a, [hMapRoom]                            ;; 00:3507 $F0 $F6
    cp   ROOM_OW_GIANT_SKULL                      ;; 00:3509 $FE $97
    ret  nz                                       ;; 00:350B $C0
    jr   label_3527                               ;; 00:350C $18 $19

label_350E::
    cp   $E1                                      ;; 00:350E $FE $E1
    jr   nz, label_351D                           ;; 00:3510 $20 $0B
    ldh  a, [hMapRoom]                            ;; 00:3512 $F0 $F6
    cp   ROOM_OW_EAGLES_TOWER                     ;; 00:3514 $FE $0E
    ret  z                                        ;; 00:3516 $C8
    cp   UNKNOWN_ROOM_0C                          ;; 00:3517 $FE $0C
    ret  z                                        ;; 00:3519 $C8
    cp   UNKNOWN_ROOM_1B                          ;; 00:351A $FE $1B
    ret  z                                        ;; 00:351C $C8

label_351D::
    ldh  a, [hMapRoom]                            ;; 00:351D $F0 $F6
    cp   ROOM_SECTION_OW_SECOND_HALF              ;; 00:351F $FE $80
    jr   nc, label_3527                           ;; 00:3521 $30 $04
    ld   a, $09                                   ;; 00:3523 $3E $09
    jr   label_3529                               ;; 00:3525 $18 $02

label_3527::
    ld   a, $1A                                   ;; 00:3527 $3E $1A

label_3529::
    call BackupObjectInRAM2                       ;; 00:3529 $CD $2F $0B
    ret                                           ;; 00:352C $C9

; Copy an object from the room data to the active room
; Inputs:
;  bc        object object address + 1 ([room position, object value])
;  stack[0]  object value
CopyObjectToActiveRoomMap::
    ; Load the position of the object in the room
    dec  bc                                       ;; 00:352D $0B
    ld   a, [bc]                                  ;; 00:352E $0A
    ld   e, a                                     ;; 00:352F $5F
    ld   hl, wRoomObjects                         ;; 00:3530 $21 $11 $D7
    add  hl, de                                   ;; 00:3533 $19
    ; Pop the object value from the stack
    pop  af                                       ;; 00:3534 $F1
    ; Copy the object to the active room
    ld   [hl], a                                  ;; 00:3535 $77
    ; On GBC, do some special-case handling
    call label_3500                               ;; 00:3536 $CD $00 $35
    ; Cleanup
    inc  bc                                       ;; 00:3539 $03
    ret                                           ;; 00:353A $C9

; Use the current overworld room to load the adequate bank
SetBankForRoom::
    ldh  a, [hMapRoom]                            ;; 00:353B $F0 $F6
    cp   ROOM_SECTION_OW_SECOND_HALF              ;; 00:353D $FE $80
    jr   nc, .outside                             ;; 00:353F $30 $04
    ld   a, BANK(OverworldRoomsFirstHalf)         ;; 00:3541 $3E $09
    jr   .inside                                  ;; 00:3543 $18 $02

.outside
    ld   a, BANK(OverworldRoomsSecondHalf)        ;; 00:3545 $3E $1A

.inside
    ; Load the bank $09 or $1A
    ld   [rSelectROMBank], a                      ;; 00:3547 $EA $00 $21
    ret                                           ;; 00:354A $C9

; Load object or objects?
Func_354B::
    push hl                                       ;; 00:354B $E5
    push de                                       ;; 00:354C $D5
    ld   a, [bc]                                  ;; 00:354D $0A
    ld   e, a                                     ;; 00:354E $5F
    ld   d, $00                                   ;; 00:354F $16 $00
    add  hl, de                                   ;; 00:3551 $19
    pop  de                                       ;; 00:3552 $D1
    ld   a, [de]                                  ;; 00:3553 $1A
    cp   $E1                                      ;; 00:3554 $FE $E1
    jr   z, .label_3560                           ;; 00:3556 $28 $08
    cp   $E2                                      ;; 00:3558 $FE $E2
    jr   z, .label_3560                           ;; 00:355A $28 $04
    cp   $E3                                      ;; 00:355C $FE $E3
    jr   nz, .label_357C                          ;; 00:355E $20 $1C

.label_3560
    push af                                       ;; 00:3560 $F5
    push hl                                       ;; 00:3561 $E5
    push de                                       ;; 00:3562 $D5
    ld   a, l                                     ;; 00:3563 $7D
    sub  a, $11                                   ;; 00:3564 $D6 $11
    push af                                       ;; 00:3566 $F5
    ld   a, [wC19C]                               ;; 00:3567 $FA $9C $C1
    ld   e, a                                     ;; 00:356A $5F
    inc  a                                        ;; 00:356B $3C
    and  $03                                      ;; 00:356C $E6 $03
    ld   [wC19C], a                               ;; 00:356E $EA $9C $C1
    ld   d, $00                                   ;; 00:3571 $16 $00
    ld   hl, wWarpPositions                       ;; 00:3573 $21 $16 $D4
    add  hl, de                                   ;; 00:3576 $19
    pop  af                                       ;; 00:3577 $F1
    ld   [hl], a                                  ;; 00:3578 $77
    pop  de                                       ;; 00:3579 $D1
    pop  hl                                       ;; 00:357A $E1
    pop  af                                       ;; 00:357B $F1

.label_357C
    ld   [hl], a                                  ;; 00:357C $77
    call label_3500                               ;; 00:357D $CD $00 $35
    inc  de                                       ;; 00:3580 $13
    inc  bc                                       ;; 00:3581 $03
    pop  hl                                       ;; 00:3582 $E1
    ld   a, [bc]                                  ;; 00:3583 $0A
    and  a                                        ;; 00:3584 $A7
    cp   $FF                                      ;; 00:3585 $FE $FF
    jr   nz, Func_354B                            ;; 00:3587 $20 $C2
    pop  bc                                       ;; 00:3589 $C1
    ret                                           ;; 00:358A $C9

; Copy the objects provided by a macro into the room.
; Inputs:
;   hl   start location of objects (inside wRoomObjects)
;   bc   object offsets list, relative to the object start location ($FF-terminated)
;   de   object ids list (must be the length of bc - 1)
CopyMacroObjectsToRoom::
.loop
    push hl                                       ;; 00:358B $E5
    push de                                       ;; 00:358C $D5

    ; Read the next object offset from [bc]
    ld   a, [bc]                                  ;; 00:358D $0A
    ld   e, a                                     ;; 00:358E $5F
    ld   d, $00                                   ;; 00:358F $16 $00

    ; Update the target position inside wRoomObjects
    add  hl, de                                   ;; 00:3591 $19

    ; Read the next object id from [de]
    pop  de                                       ;; 00:3592 $D1
    ld   a, [de]                                  ;; 00:3593 $1A

    ; Setup warp data if the macro contains a door
    cp   OBJECT_ROCKY_CAVE_DOOR                   ;; 00:3594 $FE $E1
    jr   z, .setupWarpData                        ;; 00:3596 $28 $08
    cp   $E2                                      ;; 00:3598 $FE $E2
    jr   z, .setupWarpData                        ;; 00:359A $28 $04
    cp   OBJECT_CAVE_DOOR                         ;; 00:359C $FE $E3
    jr   nz, .warpDataEnd                         ;; 00:359E $20 $1C
.setupWarpData
    push af                                       ;; 00:35A0 $F5
    push hl                                       ;; 00:35A1 $E5
    push de                                       ;; 00:35A2 $D5
    ld   a, l                                     ;; 00:35A3 $7D
    sub  a, $11                                   ;; 00:35A4 $D6 $11
    push af                                       ;; 00:35A6 $F5
    ld   a, [wC19C]                               ;; 00:35A7 $FA $9C $C1
    ld   e, a                                     ;; 00:35AA $5F
    inc  a                                        ;; 00:35AB $3C
    and  $03                                      ;; 00:35AC $E6 $03
    ld   [wC19C], a                               ;; 00:35AE $EA $9C $C1
    ld   d, $00                                   ;; 00:35B1 $16 $00
    ld   hl, wWarpPositions                       ;; 00:35B3 $21 $16 $D4
    add  hl, de                                   ;; 00:35B6 $19
    pop  af                                       ;; 00:35B7 $F1
    ld   [hl], a                                  ;; 00:35B8 $77
    pop  de                                       ;; 00:35B9 $D1
    pop  hl                                       ;; 00:35BA $E1
    pop  af                                       ;; 00:35BB $F1
.warpDataEnd

    ; Copy the object id to the room objects
    ld   [hl], a                                  ;; 00:35BC $77

    call SetupDestroyableObjectIfNeeded           ;; 00:35BD $CD $CB $35

    ; Move to the next position and object
    inc  de                                       ;; 00:35C0 $13
    inc  bc                                       ;; 00:35C1 $03

    ; Restore the initial start location
    pop  hl                                       ;; 00:35C2 $E1

    ; Loop while the object is not $FF (list-end sentinel)
    ld   a, [bc]                                  ;; 00:35C3 $0A
    and  a                                        ;; 00:35C4 $A7
    cp   $FF                                      ;; 00:35C5 $FE $FF
    jr   nz, CopyMacroObjectsToRoom.loop          ;; 00:35C7 $20 $C2

    ; Done
    pop  bc                                       ;; 00:35C9 $C1
    ret                                           ;; 00:35CA $C9

; Part of the macro objects system
; Input:
;   a    object id
SetupDestroyableObjectIfNeeded::
    ; Short grass cannot be cut
    cp   OBJECT_SHORT_GRASS                       ;; 00:35CB $FE $04
    ret  z                                        ;; 00:35CD $C8

    ; On the Stone Pig Head room, setup the rocky ground (under the head) to be destroyable
    cp   OBJECT_ROCKY_GROUND                      ;; 00:35CE $FE $09
    jr   nz, .rockyGroundEnd                      ;; 00:35D0 $20 $07
    ldh  a, [hMapRoom]                            ;; 00:35D2 $F0 $F6
    cp   ROOM_OW_GIANT_SKULL                      ;; 00:35D4 $FE $97
    ret  nz                                       ;; 00:35D6 $C0
    jr   .setupDestroyableObject                  ;; 00:35D7 $18 $0F
.rockyGroundEnd

    cp   OBJECT_ROCKY_CAVE_DOOR                   ;; 00:35D9 $FE $E1
    jr   nz, .setupDestroyableObject              ;; 00:35DB $20 $0B

    ldh  a, [hMapRoom]                            ;; 00:35DD $F0 $F6
    cp   ROOM_OW_EAGLES_TOWER                     ;; 00:35DF $FE $0E
    ret  z                                        ;; 00:35E1 $C8
    cp   UNKNOWN_ROOM_0C                          ;; 00:35E2 $FE $0C
    ret  z                                        ;; 00:35E4 $C8
    cp   UNKNOWN_ROOM_1B                          ;; 00:35E5 $FE $1B
    ret  z                                        ;; 00:35E7 $C8

.setupDestroyableObject
    ld   a, $24                                   ;; 00:35E8 $3E $24
    call BackupObjectInRAM2                       ;; 00:35EA $CD $2F $0B
    ret                                           ;; 00:35ED $C9

label_35EE::
    dec  bc                                       ;; 00:35EE $0B
    ld   a, [bc]                                  ;; 00:35EF $0A
    ld   e, a                                     ;; 00:35F0 $5F
    ld   d, $00                                   ;; 00:35F1 $16 $00
    ld   hl, wRoomObjects                         ;; 00:35F3 $21 $11 $D7
    add  hl, de                                   ;; 00:35F6 $19
    ret                                           ;; 00:35F7 $C9

data_35F8::
    db $2D, $2E                                   ;; 00:35F8

LoadObject_KeyDoorTop::
    ld   e, 0                                     ;; 00:35FA $1E $00
    call func_373F                                ;; 00:35FC $CD $3F $37
    ldh  a, [hRoomStatus]                         ;; 00:35FF $F0 $F8
    and  ROOM_STATUS_DOOR_OPEN_UP                 ;; 00:3601 $E6 $04
    jp   nz, LoadObject_OpenDoorTop               ;; 00:3603 $C2 $B2 $36
    push bc                                       ;; 00:3606 $C5
    call label_35EE                               ;; 00:3607 $CD $EE $35
    ld   bc, data_37E1                            ;; 00:360A $01 $E1 $37
    ld   de, data_35F8                            ;; 00:360D $11 $F8 $35
    jp   Func_354B                                ;; 00:3610 $C3 $4B $35

data_3613::
    db   $2F, $30                                 ;; 00:3613

LoadObject_KeyDoorBottom::
    ld   e, $01                                   ;; 00:3615 $1E $01
    call func_373F                                ;; 00:3617 $CD $3F $37
    ldh  a, [hRoomStatus]                         ;; 00:361A $F0 $F8
    and  ROOM_STATUS_DOOR_OPEN_DOWN               ;; 00:361C $E6 $08
    jp   nz, LoadObject_OpenDoorBottom            ;; 00:361E $C2 $EA $36

    push bc                                       ;; 00:3621 $C5
    call label_35EE                               ;; 00:3622 $CD $EE $35
    ld   bc, data_37E1                            ;; 00:3625 $01 $E1 $37
    ld   de, data_3613                            ;; 00:3628 $11 $13 $36
    jp   Func_354B                                ;; 00:362B $C3 $4B $35

data_362E::
    db   $31, $32                                 ;; 00:362E

LoadObject_KeyDoorLeft::
    ld   e, $02                                   ;; 00:3630 $1E $02
    call func_373F                                ;; 00:3632 $CD $3F $37
    ldh  a, [hRoomStatus]                         ;; 00:3635 $F0 $F8
    and  ROOM_STATUS_DOOR_OPEN_LEFT               ;; 00:3637 $E6 $02
    jp   nz, LoadObject_OpenDoorLeft              ;; 00:3639 $C2 $FE $36

    push bc                                       ;; 00:363C $C5
    call label_35EE                               ;; 00:363D $CD $EE $35
    ld   bc, data_37E4                            ;; 00:3640 $01 $E4 $37
    ld   de, data_362E                            ;; 00:3643 $11 $2E $36
    jp   Func_354B                                ;; 00:3646 $C3 $4B $35

data_3649::
    db   $33, $34                                 ;; 00:3649

LoadObject_KeyDoorRight::
    ld   e, $03                                   ;; 00:364B $1E $03
    call func_373F                                ;; 00:364D $CD $3F $37
    ldh  a, [hRoomStatus]                         ;; 00:3650 $F0 $F8
    and  ROOM_STATUS_DOOR_OPEN_RIGHT              ;; 00:3652 $E6 $01
    jp   nz, LoadObject_OpenDoorRight             ;; 00:3654 $C2 $12 $37

    push bc                                       ;; 00:3657 $C5
    call label_35EE                               ;; 00:3658 $CD $EE $35
    ld   bc, data_37E4                            ;; 00:365B $01 $E4 $37
    ld   de, data_3649                            ;; 00:365E $11 $49 $36
    jp   Func_354B                                ;; 00:3661 $C3 $4B $35

LoadObject_ClosedDoorTop::
    ld   e, $04                                   ;; 00:3664 $1E $04
    call func_373F                                ;; 00:3666 $CD $3F $37
    ld   a, [wC18A]                               ;; 00:3669 $FA $8A $C1
    or   $01                                      ;; 00:366C $F6 $01
    ld   [wC18A], a                               ;; 00:366E $EA $8A $C1
    ld   [wC18B], a                               ;; 00:3671 $EA $8B $C1
    jp   LoadObject_OpenDoorTop                   ;; 00:3674 $C3 $B2 $36

LoadObject_ClosedDoorBottom::
    ld   e, $05                                   ;; 00:3677 $1E $05
    call func_373F                                ;; 00:3679 $CD $3F $37
    ld   a, [wC18A]                               ;; 00:367C $FA $8A $C1
    or   $02                                      ;; 00:367F $F6 $02
    ld   [wC18A], a                               ;; 00:3681 $EA $8A $C1
    ld   [wC18B], a                               ;; 00:3684 $EA $8B $C1
    jp   LoadObject_OpenDoorBottom                ;; 00:3687 $C3 $EA $36

LoadObject_ClosedDoorLeft::
    ld   e, $06                                   ;; 00:368A $1E $06
    call func_373F                                ;; 00:368C $CD $3F $37
    ld   a, [wC18A]                               ;; 00:368F $FA $8A $C1
    or   $04                                      ;; 00:3692 $F6 $04
    ld   [wC18A], a                               ;; 00:3694 $EA $8A $C1
    ld   [wC18B], a                               ;; 00:3697 $EA $8B $C1
    jp   LoadObject_OpenDoorLeft                  ;; 00:369A $C3 $FE $36

LoadObject_ClosedDoorRight::
    ld   e, $07                                   ;; 00:369D $1E $07
    call func_373F                                ;; 00:369F $CD $3F $37
    ld   a, [wC18A]                               ;; 00:36A2 $FA $8A $C1
    or   $08                                      ;; 00:36A5 $F6 $08
    ld   [wC18A], a                               ;; 00:36A7 $EA $8A $C1
    ld   [wC18B], a                               ;; 00:36AA $EA $8B $C1
    jp   LoadObject_OpenDoorRight                 ;; 00:36AD $C3 $12 $37

data_36B0::
    db   $43, $44                                 ;; 00:36B0

LoadObject_OpenDoorTop::
    ld   a, ROOM_STATUS_DOOR_OPEN_UP              ;; 00:36B2 $3E $04
    call UpdateIndoorRoomStatus                   ;; 00:36B4 $CD $C4 $36
    push bc                                       ;; 00:36B7 $C5
    call label_35EE                               ;; 00:36B8 $CD $EE $35
    ld   bc, data_37E1                            ;; 00:36BB $01 $E1 $37
    ld   de, data_36B0                            ;; 00:36BE $11 $B0 $36
    jp   Func_354B                                ;; 00:36C1 $C3 $4B $35

; Set hRoomStatus depending on the map and room
; a = new rom status
; f = not used, but overridden
UpdateIndoorRoomStatus::
    push af                                       ;; 00:36C4 $F5
    ld   hl, wIndoorARoomStatus                   ;; 00:36C5 $21 $00 $D9
    ; de = 00 | hMapRoom
    ; de works as offset to wIndoorARoomStatus
    ldh  a, [hMapRoom]                            ;; 00:36C8 $F0 $F6
    ld   e, a                                     ;; 00:36CA $5F
    ld   d, $00                                   ;; 00:36CB $16 $00
    ; if hMapId != MAP_COLOR_DUNGEON make more checks
    ldh  a, [hMapId]                              ;; 00:36CD $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:36CF $FE $FF
    jr   nz, .checkForOffsetIncrease              ;; 00:36D1 $20 $05
    ; load wColorDungeonRoomStatus memory location
    ld   hl, wColorDungeonRoomStatus              ;; 00:36D3 $21 $E0 $DD
    jr   .setStatus                               ;; 00:36D6 $18 $09

.checkForOffsetIncrease::
    ; If the map uses rooms in the indoors_b rooms group…
    cp   MAP_INDOORS_B_END                        ;; 00:36D8 $FE $1A
    jr   nc, .setStatus                           ;; 00:36DA $30 $05
    cp   MAP_INDOORS_B_START                      ;; 00:36DC $FE $06
    jr   c, .setStatus                            ;; 00:36DE $38 $01
    ; increase offset in wIndoorARoomStatus by 0x100
    inc  d                                        ;; 00:36E0 $14

.setStatus::
    ; wIndoorARoomStatus += offset
    add  hl, de                                   ;; 00:36E1 $19
    pop  af                                       ;; 00:36E2 $F1
    ; add new status to wIndoorARoomStatus and save it
    ; existing status will not be overridden
    or   [hl]                                     ;; 00:36E3 $B6
    ld   [hl], a                                  ;; 00:36E4 $77
    ldh  [hRoomStatus], a                         ;; 00:36E5 $E0 $F8
    ret                                           ;; 00:36E7 $C9

data_36E8::
    db $8C, 8                                     ;; 00:36E8

LoadObject_OpenDoorBottom::
    ld   a, 8                                     ;; 00:36EA $3E $08
    call UpdateIndoorRoomStatus                   ;; 00:36EC $CD $C4 $36
    push bc                                       ;; 00:36EF $C5
    call label_35EE                               ;; 00:36F0 $CD $EE $35
    ld   bc, data_37E1                            ;; 00:36F3 $01 $E1 $37
    ld   de, data_36E8                            ;; 00:36F6 $11 $E8 $36
    jp   Func_354B                                ;; 00:36F9 $C3 $4B $35

data_36FC::
    db 9, $A                                      ;; 00:36FC

LoadObject_OpenDoorLeft::
    ld   a, $02                                   ;; 00:36FE $3E $02
    call UpdateIndoorRoomStatus                   ;; 00:3700 $CD $C4 $36
    push bc                                       ;; 00:3703 $C5
    call label_35EE                               ;; 00:3704 $CD $EE $35
    ld   bc, data_37E4                            ;; 00:3707 $01 $E4 $37
    ld   de, data_36FC                            ;; 00:370A $11 $FC $36
    jp   Func_354B                                ;; 00:370D $C3 $4B $35

data_3710::
    db $B, $C                                     ;; 00:3710

LoadObject_OpenDoorRight::
    ld   a, $01                                   ;; 00:3712 $3E $01
    call UpdateIndoorRoomStatus                   ;; 00:3714 $CD $C4 $36
    push bc                                       ;; 00:3717 $C5
    call label_35EE                               ;; 00:3718 $CD $EE $35
    ld   bc, data_37E4                            ;; 00:371B $01 $E4 $37
    ld   de, data_3710                            ;; 00:371E $11 $10 $37
    jp   Func_354B                                ;; 00:3721 $C3 $4B $35

data_3724::
    db $A4, $A5                                   ;; 00:3724

LoadObject_BossDoor::
    ld   e, $08                                   ;; 00:3726 $1E $08
    call func_373F                                ;; 00:3728 $CD $3F $37
    ; if boss door is not open load door object
    ldh  a, [hRoomStatus]                         ;; 00:372B $F0 $F8
    and  ROOM_STATUS_DOOR_OPEN_UP                 ;; 00:372D $E6 $04
    jp   nz, LoadObject_OpenDoorTop               ;; 00:372F $C2 $B2 $36
    push bc                                       ;; 00:3732 $C5
    call label_35EE                               ;; 00:3733 $CD $EE $35
    ld   bc, data_37E1                            ;; 00:3736 $01 $E1 $37
    ld   de, data_3724                            ;; 00:3739 $11 $24 $37
    jp   Func_354B                                ;; 00:373C $C3 $4B $35

func_373F::
    ld   d, $00                                   ;; 00:373F $16 $00
    ld   hl, wC1F0                                ;; 00:3741 $21 $F0 $C1
    add  hl, de                                   ;; 00:3744 $19
    dec  bc                                       ;; 00:3745 $0B
    ld   a, [bc]                                  ;; 00:3746 $0A
    ld   [hl], a                                  ;; 00:3747 $77
    push af                                       ;; 00:3748 $F5
    and  $F0                                      ;; 00:3749 $E6 $F0
    ld   hl, wC1E0                                ;; 00:374B $21 $E0 $C1
    add  hl, de                                   ;; 00:374E $19
    ld   [hl], a                                  ;; 00:374F $77
    pop  af                                       ;; 00:3750 $F1
    swap a                                        ;; 00:3751 $CB $37
    and  $F0                                      ;; 00:3753 $E6 $F0
    ld   hl, wC1D0                                ;; 00:3755 $21 $D0 $C1
    add  hl, de                                   ;; 00:3758 $19
    ld   [hl], a                                  ;; 00:3759 $77
    inc  bc                                       ;; 00:375A $03
    ret                                           ;; 00:375B $C9

data_375C::
    db   $AF, $B0                                 ;; 00:375C

LoadObject_StairsDoor::
    push bc                                       ; $375E: $C5 ;; 00:375E $C5
    call label_35EE                               ; $375F: $CD $EE $35 ;; 00:375F $CD $EE $35
    ld   bc, data_37E4                            ; $3762: $01 $E4 $37 ;; 00:3762 $01 $E4 $37
    ld   de, data_375C                            ; $3765: $11 $5C $37 ;; 00:3765 $11 $5C $37
    jp   Func_354B                                ; $3768: $C3 $4B $35 ;; 00:3768 $C3 $4B $35

data_376B::
    db   $B1, $B2                                 ;; 00:376B

LoadObject_FlipWall::
    push bc                                       ; $376D: $C5 ;; 00:376D $C5
    call label_35EE                               ; $376E: $CD $EE $35 ;; 00:376E $CD $EE $35
    ld   bc, data_37E1                            ; $3771: $01 $E1 $37 ;; 00:3771 $01 $E1 $37
    ld   de, data_376B                            ; $3774: $11 $6B $37 ;; 00:3774 $11 $6B $37
    jp   Func_354B                                ; $3777: $C3 $4B $35 ;; 00:3777 $C3 $4B $35

data_377A::
    db   $45, $46                                 ;; 00:377A

LoadObject_OneWayArrow::
    push bc                                       ; $377C: $C5 ;; 00:377C $C5
    call label_35EE                               ; $377D: $CD $EE $35 ;; 00:377D $CD $EE $35
    ld   bc, data_37E1                            ; $3780: $01 $E1 $37 ;; 00:3780 $01 $E1 $37
    ld   de, data_377A                            ; $3783: $11 $7A $37 ;; 00:3783 $11 $7A $37
    jp   Func_354B                                ; $3786: $C3 $4B $35 ;; 00:3786 $C3 $4B $35

data_3789::
    db   0, 1, 2, 3, $10, $11, $12, $13, $20, $21, $22, $23, $FF ;; 00:3789

data_3796::
    db   $B3, $B4, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD ;; 00:3796

LoadObject_DungeonEntrance::
    ld   a, $08                                   ; $37A2: $3E $08 ;; 00:37A2 $3E $08
    call UpdateIndoorRoomStatus                   ; $37A4: $CD $C4 $36 ;; 00:37A4 $CD $C4 $36
    push bc                                       ; $37A7: $C5 ;; 00:37A7 $C5
    call label_35EE                               ; $37A8: $CD $EE $35 ;; 00:37A8 $CD $EE $35
    ld   bc, data_3789                            ; $37AB: $01 $89 $37 ;; 00:37AB $01 $89 $37
    ld   de, data_3796                            ; $37AE: $11 $96 $37 ;; 00:37AE $11 $96 $37
    jp   Func_354B                                ; $37B1: $C3 $4B $35 ;; 00:37B1 $C3 $4B $35

data_37B4::
    db   $C1, $C2                                 ;; 00:37B4

LoadObject_IndoorEntrance::
    ;
    ; @bug
    ;
    ; This code is supposed to replace the Shop's indoor entrance
    ; by a closed door if Link has stolen from the shop
    ; (presumably for dramatic effect).
    ;
    ; However it doesn't work, because:
    ; 1. the Shop's room was moved from $D3 to $A1, but the code was never updated,
    ; 2. even when fixing the room id, the closed door has garbled tiles.
    ;
    ; In the final version, this code is never triggered, because the
    ; $D3 room (Kanalet's Castle main entrance) doesn't have a
    ; IndoorEntrance object at all.
    ;

    ; If on an Indoor B map…
    ldh  a, [hMapId]                              ;; 00:37B6 $F0 $F7
    cp   MAP_INDOORS_B_END                        ;; 00:37B8 $FE $1A
    jr   nc, .end                                 ;; 00:37BA $30 $13
    cp   MAP_INDOORS_B_START                      ;; 00:37BC $FE $06
    jr   c, .end                                  ;; 00:37BE $38 $0F

    ; … and in Kanalet main entrance room (probably used to be the Shop's room)…
    ldh  a, [hMapRoom]                            ;; 00:37C0 $F0 $F6
    cp   ROOM_INDOOR_B_KANALET_MAIN_ENTRANCE      ;; 00:37C2 $FE $D3
    jr   nz, .end                                 ;; 00:37C4 $20 $09

    ; … and has stolen from shop…
    ld   a, [wHasStolenFromShop]                  ;; 00:37C6 $FA $46 $DB
    and  a                                        ;; 00:37C9 $A7
    jr   z, .end                                  ;; 00:37CA $28 $03

    ; … load a closed entrance instead of a open one.
    jp   LoadObject_ClosedDoorBottom              ;; 00:37CC $C3 $77 $36

.end

    ld   a, $01                                   ;; 00:37CF $3E $01
    call UpdateIndoorRoomStatus                   ;; 00:37D1 $CD $C4 $36
    push bc                                       ;; 00:37D4 $C5
    call label_35EE                               ;; 00:37D5 $CD $EE $35
    ld   bc, data_37E1                            ;; 00:37D8 $01 $E1 $37
    ld   de, data_37B4                            ;; 00:37DB $11 $B4 $37
    ; tail-call jump
    jp   Func_354B                                ;; 00:37DE $C3 $4B $35

data_37E1::
    db   $00                                      ;; 00:37E1
    db   $01                                      ;; 00:37E2
    db   $FF                                      ;; 00:37E3

data_37E4::
    db   $00                                      ;; 00:37E4
    db   $10                                      ;; 00:37E5
    db   $FF                                      ;; 00:37E6

; Fill all the active room map with the same object
; Inputs:
;   a   the object type to fill the map with
FillRoomMapWithObject::
    ldh  [hMultiPurposeH], a                      ;; 00:37E7 $E0 $E9
    ld   d, TILES_PER_MAP                         ;; 00:37E9 $16 $80
    ld   hl, wRoomObjects                         ;; 00:37EB $21 $11 $D7
    ld   e, a                                     ;; 00:37EE $5F

.loop
    ld   a, l                                     ;; 00:37EF $7D
    and  $0F                                      ;; 00:37F0 $E6 $0F
    jr   z, .continue                             ;; 00:37F2 $28 $05
    cp   $0B ; TILES_PER_ROW+1                    ;; 00:37F4 $FE $0B
    jr   nc, .continue                            ;; 00:37F6 $30 $01
    ld   [hl], e                                  ;; 00:37F8 $73

.continue
    inc  hl                                       ;; 00:37F9 $23
    dec  d                                        ;; 00:37FA $15
    jr   nz, .loop                                ;; 00:37FB $20 $F2
    ret                                           ;; 00:37FD $C9

; Retrieve the entities list for this room, and load each entity from its definition.
LoadRoomEntities::
    callsb UpdateRecentRoomsList                  ;; 00:37FE $3E $01 $EA $00 $21 $CD $02 $5F

    ld   a, BANK(OverworldEntitiesPointersTable)  ;; 00:3806 $3E $16
    ld   [rSelectROMBank], a                      ;; 00:3808 $EA $00 $21

    ; Reset the entities load order
    xor  a                                        ;; 00:380B $AF
    ldh  [hMultiPurposeD], a                      ;; 00:380C $E0 $E4

    ; bc = [hMapRoom] * 2
    ldh  a, [hMapRoom]                            ;; 00:380E $F0 $F6
    ld   c, a                                     ;; 00:3810 $4F
    ld   b, $00                                   ;; 00:3811 $06 $00
    sla  c                                        ;; 00:3813 $CB $21
    rl   b                                        ;; 00:3815 $CB $10

    ;
    ; Compute the proper entities pointers table for the room
    ;

    ; If on overworld, we're skipEntityLoad.
    ld   hl, OverworldEntitiesPointersTable       ;; 00:3817 $21 $00 $40
    ld   a, [wIsIndoor]                           ;; 00:381A $FA $A5 $DB
    and  a                                        ;; 00:381D $A7
    jr   z, .pointersTableEnd                     ;; 00:381E $28 $48

    ; The room is indoors.

    ; If in Eagle's Tower…
    ldh  a, [hMapId]                              ;; 00:3820 $F0 $F7
    cp   MAP_EAGLES_TOWER                         ;; 00:3822 $FE $06
    jr   nz, .eaglesTowerEnd                      ;; 00:3824 $20 $2A
    ; … and [hMapRoom] == [wWreckingBallRoom]…
    ld   a, [wWreckingBallRoom]                   ;; 00:3826 $FA $6F $DB
    ld   hl, hMapRoom                             ;; 00:3829 $21 $F6 $FF
    cp   [hl]                                     ;; 00:382C $BE
    jr   nz, .eaglesTowerEnd                      ;; 00:382D $20 $21
    ; place the wrecking ball
    ld   a, ENTITY_WRECKING_BALL                  ;; 00:382F $3E $A8
    call SpawnNewEntity_trampoline                ;; 00:3831 $CD $86 $3B
    ld   a, [wWreckingBallPosX]                   ;; 00:3834 $FA $70 $DB
    ld   hl, wEntitiesPosXTable                   ;; 00:3837 $21 $00 $C2
    add  hl, de                                   ;; 00:383A $19
    ld   [hl], a                                  ;; 00:383B $77
    ld   a, [wWreckingBallPosY]                   ;; 00:383C $FA $71 $DB
    ld   hl, wEntitiesPosYTable                   ;; 00:383F $21 $10 $C2
    add  hl, de                                   ;; 00:3842 $19
    ld   [hl], a                                  ;; 00:3843 $77
    call LoadEntityFromDefinition.didLoadEntity   ;; 00:3844 $CD $D4 $38
    ld   hl, wEntitiesLoadOrderTable              ;; 00:3847 $21 $60 $C4
    add  hl, de                                   ;; 00:384A $19
    ld   [hl], $FF                                ;; 00:384B $36 $FF
    xor  a                                        ;; 00:384D $AF
    ldh  [hMultiPurposeD], a                      ;; 00:384E $E0 $E4
.eaglesTowerEnd

    ; By default, use the IndoorsA pointers table
    ld   hl, IndoorsAEntitiesPointersTable        ;; 00:3850 $21 $00 $42

    ; If on the Color Dungeon, use ColorDungeonEntitiesPointersTable
    ldh  a, [hMapId]                              ;; 00:3853 $F0 $F7
    cp   MAP_COLOR_DUNGEON                        ;; 00:3855 $FE $FF
    jr   nz, .useIndoorsBTable                    ;; 00:3857 $20 $05
    ld   hl, ColorDungeonEntitiesPointersTable    ;; 00:3859 $21 $00 $46
    jr   .pointersTableEnd                        ;; 00:385C $18 $0A
.useIndoorsBTable
    ; If the map uses rooms in the indoors_b rooms group…
    cp   MAP_INDOORS_B_END                        ;; 00:385E $FE $1A
    jr   nc, .pointersTableEnd                    ;; 00:3860 $30 $06
    cp   MAP_INDOORS_B_START                      ;; 00:3862 $FE $06
    jr   c, .pointersTableEnd                     ;; 00:3864 $38 $02
    ; … use IndoorsBEntitiesPointersTable
    ; (by incrementing H from $42 to $44)
    inc  h                                        ;; 00:3866 $24
    inc  h                                        ;; 00:3867 $24
.pointersTableEnd

    ; Read the entities list address in the pointers table
    add  hl, bc                                   ;; 00:3868 $09
    ld   a, [hli]                                 ;; 00:3869 $2A
    ld   c, a                                     ;; 00:386A $4F
    ld   a, [hl]                                  ;; 00:386B $7E
    ld   b, a                                     ;; 00:386C $47

    ; For each entity definition in the target list…
.loop
    ; if the end of list is reached, break
    ld   a, [bc]                                  ;; 00:386D $0A
    cp   ENTITIES_END                             ;; 00:386E $FE $FF
    jr   z, .break                                ;; 00:3870 $28 $05
    ; otherwise load the entity definition.
    call LoadEntityFromDefinition                 ;; 00:3872 $CD $83 $38
    jr   .loop                                    ;; 00:3875 $18 $F6
.break

    call ReloadSavedBank                          ;; 00:3877 $CD $1D $08
    ret                                           ;; 00:387A $C9

; Array indexed by load order
EntityMask_387B::
    db   %00000001                                ;; 00:387B
    db   %00000010                                ;; 00:387C
    db   %00000100                                ;; 00:387D
    db   %00001000                                ;; 00:387E
    db   %00010000                                ;; 00:387F
    db   %00100000                                ;; 00:3880
    db   %01000000                                ;; 00:3881
    db   %10000000                                ;; 00:3882

; Load an entity for the current room from an entity definition.
; An entity definition is 2 bytes:
;   - vertical and horizontal position
;   - entity type
; See files in `data/entities/` for more infos.
;
; Inputs:
;   bc   address of the entity definition
LoadEntityFromDefinition::
    ; a = entity load order
    ldh  a, [hMultiPurposeD]                      ;; 00:3883 $F0 $E4

    ; If the load order < 8…
    cp   $08                                      ;; 00:3885 $FE $08
    jr   nc, .skipClearedEntityEnd                ;; 00:3887 $30 $12
    ; and EntityMask_387B[hMultiPurposeD] & wEntitiesClearedRooms[hMapRoom] != 0,
    ld   e, a                                     ;; 00:3889 $5F
    ld   d, $00                                   ;; 00:388A $16 $00
    ld   hl, EntityMask_387B                      ;; 00:388C $21 $7B $38
    add  hl, de                                   ;; 00:388F $19
    ldh  a, [hMapRoom]                            ;; 00:3890 $F0 $F6
    ld   e, a                                     ;; 00:3892 $5F
    ld   a, [hl]                                  ;; 00:3893 $7E
    ld   hl, wEntitiesClearedRooms                ;; 00:3894 $21 $00 $CF
    add  hl, de                                   ;; 00:3897 $19
    and  [hl]                                     ;; 00:3898 $A6
    ; … then the entity has been cleared previously: don't load it.
    jr   nz, .skipEntityLoad                      ;; 00:3899 $20 $12
.skipClearedEntityEnd

    ; de = $0000
    ld   e, $00                                   ;; 00:389B $1E $00
    ld   d, e                                     ;; 00:389D $53
    ; Find the first available slot (i.e. ENTITY_STATUS_DISABLED)
.loop
    ld   hl, wEntitiesStatusTable                 ;; 00:389E $21 $80 $C2
    add  hl, de                                   ;; 00:38A1 $19
    ld   a, [hl]                                  ;; 00:38A2 $7E
    cp   ENTITY_STATUS_DISABLED                   ;; 00:38A3 $FE $00
    jr   z, .createEntityAndReturn                ;; 00:38A5 $28 $0D
    ; If this slot is not available, try until we reach the last slot
    inc  e                                        ;; 00:38A7 $1C
    ld   a, e                                     ;; 00:38A8 $7B
    cp   $10                                      ;; 00:38A9 $FE $10
    jr   nz, .loop                                ;; 00:38AB $20 $F1
    ; If all slots are unavailable, skip this entity

.skipEntityLoad
    ; Increment the entity load order anyway
    ld   hl, hMultiPurposeD                       ;; 00:38AD $21 $E4 $FF
    inc  [hl]                                     ;; 00:38B0 $34
    ; Increment the address to the next definition in the list
    inc  bc                                       ;; 00:38B1 $03
    inc  bc                                       ;; 00:38B2 $03
    ret                                           ;; 00:38B3 $C9

.createEntityAndReturn
    ; Mark the entity as being initialized
    ld   [hl], ENTITY_STATUS_INIT                 ;; 00:38B4 $36 $04
    ; Set the entity horizontal position (lowest nybble of first byte)
    ld   a, [bc]                                  ;; 00:38B6 $0A
    and  $F0                                      ;; 00:38B7 $E6 $F0
    ld   hl, wEntitiesPosYTable                   ;; 00:38B9 $21 $10 $C2
    add  hl, de                                   ;; 00:38BC $19
    add  a, $10                                   ;; 00:38BD $C6 $10
    ld   [hl], a                                  ;; 00:38BF $77
    ; Set the entity horizontal position (highest nybble of first byte)
    ld   a, [bc]                                  ;; 00:38C0 $0A
    inc  bc                                       ;; 00:38C1 $03
    swap a                                        ;; 00:38C2 $CB $37
    and  $F0                                      ;; 00:38C4 $E6 $F0
    ld   hl, wEntitiesPosXTable                   ;; 00:38C6 $21 $00 $C2
    add  hl, de                                   ;; 00:38C9 $19
    add  a, $08                                   ;; 00:38CA $C6 $08
    ld   [hl], a                                  ;; 00:38CC $77
    ; Set the entity type
    ld   hl, wEntitiesTypeTable                   ;; 00:38CD $21 $A0 $C3
    add  hl, de                                   ;; 00:38D0 $19
    ld   a, [bc]                                  ;; 00:38D1 $0A
    inc  bc                                       ;; 00:38D2 $03
    ld   [hl], a                                  ;; 00:38D3 $77

.didLoadEntity
    callsb ConfigureNewEntity_helper              ;; 00:38D4 $3E $03 $EA $00 $21 $CD $24 $65
    callsb PrepareEntityPositionForRoomTransition ;; 00:38DC $3E $01 $EA $00 $21 $CD $AB $5E
    ; Restore bank for entities placement data
    ld   a, BANK(OverworldEntitiesPointersTable)  ;; 00:38E4 $3E $16
    ld   [rSelectROMBank], a                      ;; 00:38E6 $EA $00 $21
    ret                                           ;; 00:38E9 $C9

; Load the template for an indoor room
;   a: the template to use (see ROOM_TEMPLATE_* constants)
LoadRoomTemplate_trampoline::
    ; Load bank for LoadRoomTemplate
    ld   e, a                                     ;; 00:38EA $5F
    ld   a, BANK(LoadRoomTemplate)                ;; 00:38EB $3E $14
    ld   [rSelectROMBank], a                      ;; 00:38ED $EA $00 $21
    ld   a, e                                     ;; 00:38F0 $7B

    ; Call function
    push bc                                       ;; 00:38F1 $C5
    call LoadRoomTemplate                         ;; 00:38F2 $CD $80 $48
    pop  bc                                       ;; 00:38F5 $C1

    ; Restore previous bank
    ldh  a, [hRoomBank]                           ;; 00:38F6 $F0 $E8
    ld   [rSelectROMBank], a                      ;; 00:38F8 $EA $00 $21
    ret                                           ;; 00:38FB $C9

LoadWorldMapBGMap_trampoline::
    callsb LoadWorldMapBGMap                      ;; 00:38FC $3E $20 $EA $00 $21 $CD $8B $58
    ret                                           ;; 00:3904 $C9

SwitchToObjectsTilemapBank::
    ; mapBank = (IsIndoor ? $08 : $1A)
    ld   a, [wIsIndoor]                           ;; 00:3905 $FA $A5 $DB
    and  a                                        ;; 00:3908 $A7
    jr   nz, .indoor                              ;; 00:3909 $20 $04
    ld   a, BANK(OverworldObjectsTilemapDMG)      ;; 00:390B $3E $1A
    jr   .end                                     ;; 00:390D $18 $02
.indoor
    ld   a, BANK(IndoorObjectsTilemapDMG)         ;; 00:390F $3E $08
.end
    ; Switch to map bank
    ld   [rSelectROMBank], a                      ;; 00:3911 $EA $00 $21
    ret                                           ;; 00:3914 $C9

LoadCreditsMarinPortraitTiles_trampoline::
    jpsb LoadCreditsMarinPortraitTiles            ;; 00:3915 $3E $27 $EA $00 $21 $C3 $C5 $7F

LoadThanksForPlayingTiles_trampoline::
    jpsb LoadThanksForPlayingTiles                ;; 00:391D $3E $20 $EA $00 $21 $C3 $E6 $7D

include "code/home/entities.asm"

ReplaceEvilEagleRiderVisibleTiles::
    ld   a, BANK(EvilEagleRiderVisibleTiles)      ;; 00:3F93 $3E $05
    ld   [rSelectROMBank], a                      ;; 00:3F95 $EA $00 $21
    ld   hl, EvilEagleRiderVisibleTiles           ;; 00:3F98 $21 $DE $59
    ld   de, vTiles0 + $460                       ;; 00:3F9B $11 $60 $84
    ld   bc, TILE_SIZE * 1                        ;; 00:3F9E $01 $10 $00
    call CopyData                                 ;; 00:3FA1 $CD $14 $29
    ld   hl, EvilEagleRiderVisibleTiles + TILE_SIZE ;; 00:3FA4 $21 $EE $59
    jr   ReplaceEvilEagleRiderHiddenTiles.copyData ;; 00:3FA7 $18 $14

ReplaceEvilEagleRiderHiddenTiles::
    ld   a, BANK(EvilEagleRiderHiddenTiles)       ;; 00:3FA9 $3E $05
    ld   [rSelectROMBank], a                      ;; 00:3FAB $EA $00 $21
    ld   hl, EvilEagleRiderHiddenTiles            ;; 00:3FAE $21 $FE $59
    ld   de, vTiles0 + $460                       ;; 00:3FB1 $11 $60 $84
    ld   bc, TILE_SIZE * 1                        ;; 00:3FB4 $01 $10 $00
    call CopyData                                 ;; 00:3FB7 $CD $14 $29
    ld   hl, EvilEagleRiderHiddenTiles + TILE_SIZE ;; 00:3FBA $21 $0E $5A

.copyData
    ld   de, vTiles0 + $480                       ;; 00:3FBD $11 $80 $84
    ld   bc, $10                                  ;; 00:3FC0 $01 $10 $00
    call CopyData                                 ;; 00:3FC3 $CD $14 $29

    xor  a                                        ;; 00:3FC6 $AF
    ldh  [hReplaceTiles], a                       ;; 00:3FC7 $E0 $A5

    ld   a, BANK(LinkCharacterTiles)              ;; 00:3FC9 $3E $0C
    ld   [rSelectROMBank], a                      ;; 00:3FCB $EA $00 $21
    jp   DrawLinkSpriteAndReturn                  ;; 00:3FCE $C3 $2E $1D

; Copy data to second half of tiles memory
ReloadColorDungeonNpcTiles::
    ; bank = hIsGBC ? $35 : $34
    ld   b, $34                                   ;; 00:3FD1 $06 $34
    ldh  a, [hIsGBC]                              ;; 00:3FD3 $F0 $FE
    and  a                                        ;; 00:3FD5 $A7
    jr   z, .gbcEnd                               ;; 00:3FD6 $28 $01
    inc  b                                        ;; 00:3FD8 $04
.gbcEnd

    ; Switch to bank $34 or $35
    ld   a, b                                     ;; 00:3FD9 $78
    ld   [rSelectROMBank], a                      ;; 00:3FDA $EA $00 $21

    ld   hl, ColorDungeonNpcTiles                 ;; 00:3FDD $21 $00 $40
    ld   de, vTiles0 + $400                       ;; 00:3FE0 $11 $00 $84
    ld   bc, TILE_SIZE * $40                      ;; 00:3FE3 $01 $00 $04
    call CopyData                                 ;; 00:3FE6 $CD $14 $29
    ld   a, BANK(InventoryEntryPoint)             ;; 00:3FE9 $3E $20
    ld   [rSelectROMBank], a                      ;; 00:3FEB $EA $00 $21
    ret                                           ;; 00:3FEE $C9
