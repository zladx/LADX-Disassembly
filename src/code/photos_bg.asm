;
; Loading photos Background maps
;

func_03D_4000::
    ldi  a, [hl]                                  ;; 3D:4000 $2A
    ld   [de], a                                  ;; 3D:4001 $12
    inc  e                                        ;; 3D:4002 $1C
    ld   a, e                                     ;; 3D:4003 $7B
    and  %00011111                                ;; 3D:4004 $E6 $1F
    cp   $14                                      ;; 3D:4006 $FE $14
    jr   nz, func_03D_4000                        ;; 3D:4008 $20 $F6

    ld   a, e                                     ;; 3D:400A $7B
    add  $0C                                      ;; 3D:400B $C6 $0C
    ld   e, a                                     ;; 3D:400D $5F
    ld   a, d                                     ;; 3D:400E $7A
    adc  $00                                      ;; 3D:400F $CE $00
    ld   d, a                                     ;; 3D:4011 $57
    cp   $9E                                      ;; 3D:4012 $FE $9E
    jr   nz, func_03D_4000                        ;; 3D:4014 $20 $EA

    ld   a, e                                     ;; 3D:4016 $7B
    cp   $40                                      ;; 3D:4017 $FE $40
    jr   nz, func_03D_4000                        ;; 3D:4019 $20 $E5

    ret                                           ;; 3D:401B $C9

Data_03D_401C::
    db   $00, $00, $4E, $00, $02, $00, $00, $00 ; $401C |..N.....|
    db   $00, $00, $40, $48, $00                ; $4024 |..@H.|

; Load Background map and attributes for photo
;
; Inputs:
; - wGameplayType: the photo to load
LoadPhotoBgMap::
    call LCDOff                                   ;; 3D:4029 $CD $CF $28
    ld   a, [wLCDControl]                         ;; 3D:402C $FA $FD $D6
    and ~LCDCF_ON                                 ;; 3D:402F $E6 $7F
    ldh  [rLCDC], a                               ;; 3D:4031 $E0 $40

    ; Get the BG map pointer for the photo
    ld   hl, PhotosBgMapPointers                  ;; 3D:4033 $21 $34 $65
    ld   a, [wGameplayType]                       ;; 3D:4036 $FA $95 $DB
    sub  GAMEPLAY_PHOTO_DIZZY_LINK                ;; 3D:4039 $D6 $0E
    sla  a                                        ;; 3D:403B $CB $27
    ld   e, a                                     ;; 3D:403D $5F
    ld   d, $00                                   ;; 3D:403E $16 $00
    add  hl, de                                   ;; 3D:4040 $19
    ldi  a, [hl]                                  ;; 3D:4041 $2A
    ld   h, [hl]                                  ;; 3D:4042 $66
    ld   l, a                                     ;; 3D:4043 $6F

    ; Copy the photo BG map to VRAM
    push hl                                       ;; 3D:4044 $E5
    call CopyToBGMap0                             ;; 3D:4045 $CD $96 $0B

    ; If on GBC…
    ldh  a, [hIsGBC]                              ;; 3D:4048 $F0 $FE
    and  a                                        ;; 3D:404A $A7
    jr   z, .copyBgAttributesEnd                  ;; 3D:404B $28 $0A
    ; copy the photo BG attributes to VRAM
    ld   a, $01                                   ;; 3D:404D $3E $01
    ldh  [rVBK], a                                ;; 3D:404F $E0 $4F
    call CopyToBGMap0                             ;; 3D:4051 $CD $96 $0B
    xor  a                                        ;; 3D:4054 $AF
    ldh  [rVBK], a                                ;; 3D:4055 $E0 $4F
.copyBgAttributesEnd

    pop  hl                                       ;; 3D:4057 $E1
    ld   de, $2D0                                 ;; 3D:4058 $11 $D0 $02
    add  hl, de                                   ;; 3D:405B $19
    ld   a, [wGameplayType]                       ;; 3D:405C $FA $95 $DB
    cp   GAMEPLAY_PHOTO_BOW_WOW                   ;; 3D:405F $FE $14
    jr   z, .else_4069_3D                         ;; 3D:4061 $28 $06

    cp   GAMEPLAY_PHOTO_GHOST                     ;; 3D:4063 $FE $19
    jr   z, .else_4069_3D                         ;; 3D:4065 $28 $02

    jr   .else_4081_3D                            ;; 3D:4067 $18 $18

.else_4069_3D:
    ld   de, vBGMap1                              ;; 3D:4069 $11 $00 $9C
    call func_03D_4000                            ;; 3D:406C $CD $00 $40
    ldh  a, [hIsGBC]                              ;; 3D:406F $F0 $FE
    and  a                                        ;; 3D:4071 $A7
    jr   z, .else_4081_3D                         ;; 3D:4072 $28 $0D

    ld   a, $01                                   ;; 3D:4074 $3E $01
    ldh  [rVBK], a                                ;; 3D:4076 $E0 $4F
    ld   de, vBGMap1                              ;; 3D:4078 $11 $00 $9C
    call func_03D_4000                            ;; 3D:407B $CD $00 $40
    xor  a                                        ;; 3D:407E $AF
    ldh  [rVBK], a                                ;; 3D:407F $E0 $4F
.else_4081_3D:
    ld   a, LCDCF_ON | LCDCF_WIN9C00 | LCDCF_OBJ16 | LCDCF_OBJON | LCDCF_BGON ;; 3D:4081 $3E $C7
    ld   [wLCDControl], a                         ;; 3D:4083 $EA $FD $D6
    ldh  [rLCDC], a                               ;; 3D:4086 $E0 $40
    ld   a, [wGameplayType]                       ;; 3D:4088 $FA $95 $DB
    sub  $0E                                      ;; 3D:408B $D6 $0E
    ld   e, a                                     ;; 3D:408D $5F
    ld   d, $00                                   ;; 3D:408E $16 $00
    ld   hl, Data_03D_401C                        ;; 3D:4090 $21 $1C $40
    add  hl, de                                   ;; 3D:4093 $19
    ld   a, [hl]                                  ;; 3D:4094 $7E
    ld   [wMusicTrackToPlay], a                   ;; 3D:4095 $EA $68 $D3
    xor  a                                        ;; 3D:4098 $AF
    ld   [wC16C], a                               ;; 3D:4099 $EA $6C $C1
    ld   [wTransitionSequenceCounter], a          ;; 3D:409C $EA $6B $C1

    ; Increment photo sequence step
    ld   hl, wGameplaySubtype                     ;; 3D:409F $21 $96 $DB
    inc  [hl]                                     ;; 3D:40A2 $34

    ret                                           ;; 3D:40A3 $C9

; Background map and BG attributes for photos or animated scenes when you get the photo.

PhotoDizzyLinkBgMap::
include "data/photos_bg/dizzy_link.asm"

PhotoNiceLinkBgMap::
include "data/photos_bg/nice_link.asm"

PhotoMarinCliffBgMap::
include "data/photos_bg/marin_cliff.asm"

PhotoMabeBgMap::
include "data/photos_bg/mabe.asm"

PhotoUlriraBgMap::
include "data/photos_bg/ulrira.asm"

PhotoBowWowBgMap::
include "data/photos_bg/bow_wow.asm"

PhotoThiefBgMap::
include "data/photos_bg/thief.asm"

PhotoFishermanBgMap::
include "data/photos_bg/fisherman.asm"

PhotoZoraBgMap::
include "data/photos_bg/zora.asm"

PhotoKanaletBgMap::
include "data/photos_bg/kanalet.asm"

PhotoGhostBgMap::
include "data/photos_bg/ghost.asm"

PhotoMarinWellBgMap::
include "data/photos_bg/marin_well.asm"

PhotoBridgeBgMap::
include "data/photos_bg/bridge.asm"

PhotosBgMapPointers::
._0E dw PhotoDizzyLinkBgMap
._0F dw PhotoNiceLinkBgMap
._10 dw PhotoMarinCliffBgMap
._11 dw $0000 ; PhotoMarinWellBgMap (disabled)
._12 dw PhotoMabeBgMap
._13 dw PhotoUlriraBgMap
._14 dw PhotoBowWowBgMap
._15 dw $0000 ; PhotoThiefBgMap (disabled)
._16 dw PhotoFishermanBgMap
._17 dw PhotoZoraBgMap
._18 dw PhotoKanaletBgMap
._19 dw PhotoGhostBgMap
._1A dw PhotoBridgeBgMap
