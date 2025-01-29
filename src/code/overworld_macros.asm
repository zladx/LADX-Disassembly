; Unpack an overworld macro object into its several actual objects.
; Inputs;
;   d    object type
;   e    object position
ExpandOverworldObjectMacro::
    push de                                       ;; 24:7578 $D5
    ld   a, d                                     ;; 24:7579 $7A
    sub  OBJECT_MACROS_SECTION                    ;; 24:757A $D6 $F5
    sla  a                                        ;; 24:757C $CB $27
    ld   d, $00                                   ;; 24:757E $16 $00
    ld   e, a                                     ;; 24:7580 $5F

    ; Custom jump-table to execute the correct handler
    ld   hl, OverworldMacrosHandlers              ;; 24:7581 $21 $8B $75
    add  hl, de                                   ;; 24:7584 $19
    ldi  a, [hl]                                  ;; 24:7585 $2A
    ld   h, [hl]                                  ;; 24:7586 $66
    ld   l, a                                     ;; 24:7587 $6F
    pop  de                                       ;; 24:7588 $D1
    ld   a, e                                     ;; 24:7589 $7B
    jp   hl                                       ;; 24:758A $E9

OverworldMacrosHandlers::                         ;; 24:758B
._F5 dw TreeMacroHandler
._F6 dw TwoDoorsHouseMacroHandler
._F7 dw LargeHouseMacroHandler
._F8 dw CatfishMawMacroHandler
._F9 dw PalaceDoorMacroHandler
._FA dw StonePigHeadMacroHandler
._FB dw PalmTreeMacroHandler
._FC dw WalledPitMacroHandler
._FD dw SmallHouseMacroHandler

; Paint a tree, or a series of trees in a strip
TreeMacroHandler::
    dec  bc                                       ;; 24:759D $0B
    add  $11                                      ;; 24:759E $C6 $11
    ld   e, a                                     ;; 24:75A0 $5F
    and  $0F                                      ;; 24:75A1 $E6 $0F
    jr   nz, .jr_75A9                             ;; 24:75A3 $20 $04
    ld   a, e                                     ;; 24:75A5 $7B
    sub  $10                                      ;; 24:75A6 $D6 $10
    ld   e, a                                     ;; 24:75A8 $5F
.jr_75A9

    ld   d, $00                                   ;; 24:75A9 $16 $00
    ld   hl, wRoomObjectsArea                     ;; 24:75AB $21 $00 $D7
    add  hl, de                                   ;; 24:75AE $19

    ; If there is only a single tree, expand it directly
    ldh  a, [hMultiPurpose0]                      ;; 24:75AF $F0 $D7
    and  a                                        ;; 24:75B1 $A7
    jr   z, CopyTreeObjectsToRoom                 ;; 24:75B2 $28 $19

    ; … otherwise prepare a loop
    and  $0F                                      ;; 24:75B4 $E6 $0F
    ld   e, a                                     ;; 24:75B6 $5F

; For each tree to be expanded…
.loop
    call CopyTreeObjectsToRoom                    ;; 24:75B7 $CD $CD $75

    dec  bc                                       ;; 24:75BA $0B
    ldh  a, [hMultiPurpose0]                      ;; 24:75BB $F0 $D7
    and  $40                                      ;; 24:75BD $E6 $40
    ld   d, $F1                                   ;; 24:75BF $16 $F1
    jr   z, .jr_75C5                              ;; 24:75C1 $28 $02
    ld   d, $0F                                   ;; 24:75C3 $16 $0F
.jr_75C5

    ld   a, l                                     ;; 24:75C5 $7D
    add  d                                        ;; 24:75C6 $82
    ld   l, a                                     ;; 24:75C7 $6F
    dec  e                                        ;; 24:75C8 $1D
    jr   nz, .loop                                ;; 24:75C9 $20 $EC

    inc  bc                                       ;; 24:75CB $03
    ret                                           ;; 24:75CC $C9

; Copy the four objects for a single tree to a location in the room.
; Actual objects may change depending on:
;  - whether the tree is overlapping another tree
;  - whether the tree is over bushes
CopyTreeObjectsToRoom::
    ; Top right
    ld   a, [hl]                                  ;; 24:75CD $7E
    cp   $10                                      ;; 24:75CE $FE $10
    ld   a, OBJECT_TREE_TOP_LEFT                  ;; 24:75D0 $3E $25
    jr   c, .copyTopLeft                          ;; 24:75D2 $38 $02
    add  $04 ; OBJECT_TREE_OVERLAP_LEFT           ;; 24:75D4 $C6 $04
.copyTopLeft
    ld   [hl+], a                                 ;; 24:75D6 $22

    ; Top left
    ld   a, [hl]                                  ;; 24:75D7 $7E
    cp   $10                                      ;; 24:75D8 $FE $10
    ld   a, OBJECT_TREE_TOP_RIGHT                 ;; 24:75DA $3E $26
    jr   c, .copyTopRight                         ;; 24:75DC $38 $02
    add  $04 ; OBJECT_TREE_OVERLAP_RIGHT          ;; 24:75DE $C6 $04
.copyTopRight
    ld   [hl-], a                                 ;; 24:75E0 $32

    ; Bottom left
    ld   a, l                                     ;; 24:75E1 $7D
    add  $10                                      ;; 24:75E2 $C6 $10
    ld   l, a                                     ;; 24:75E4 $6F
    ld   a, [hl]                                  ;; 24:75E5 $7E
    cp   $8A                                      ;; 24:75E6 $FE $8A
    jr   nc, .bottomLeftOverBushes                ;; 24:75E8 $30 $0A
    cp   $10                                      ;; 24:75EA $FE $10
    ld   a, OBJECT_TREE_BOTTOM_LEFT               ;; 24:75EC $3E $27
    jr   c, .copyBottomLeft                       ;; 24:75EE $38 $06
    ld   a, OBJECT_TREE_OVERLAP_RIGHT             ;; 24:75F0 $3E $2A
    jr   .copyBottomLeft                          ;; 24:75F2 $18 $02
.bottomLeftOverBushes
    ld   a, OBJECT_TREE_BUSHES_BOTTOM_LEFT        ;; 24:75F4 $3E $82
.copyBottomLeft
    ld   [hl+], a                                 ;; 24:75F6 $22

    ; Bottom right
    ld   a, [hl]                                  ;; 24:75F7 $7E
    cp   $8A                                      ;; 24:75F8 $FE $8A
    jr   nc, .bottomRightOverBushes               ;; 24:75FA $30 $0A
    cp   $10                                      ;; 24:75FC $FE $10
    ld   a, OBJECT_TREE_BOTTOM_RIGHT              ;; 24:75FE $3E $28
    jr   c, .copyBottomRightObject                ;; 24:7600 $38 $06
    ld   a, OBJECT_TREE_OVERLAP_LEFT              ;; 24:7602 $3E $29
    jr   .copyBottomRightObject                   ;; 24:7604 $18 $02
.bottomRightOverBushes
    ld   a, OBJECT_TREE_BUSHES_BOTTOM_RIGHT       ;; 24:7606 $3E $83
.copyBottomRightObject
    ld   [hl], a                                  ;; 24:7608 $77

    ; Done
    inc  bc                                       ;; 24:7609 $03
    ret                                           ;; 24:760A

CatfishMawObjectOffsets::
    db   $00, $01, $02
    db   $10, $11, $12
    db   $FF

CatfishMawObjectIds::
    db   $B6, $B7, $66
    db   $67, $E3, $68

CatfishMawMacroHandler::
    push bc                                       ;; 24:7618 $C5
    call func_024_7625                            ;; 24:7619 $CD $25 $76
    ld   bc, CatfishMawObjectOffsets              ;; 24:761C $01 $0B $76
    ld   de, CatfishMawObjectIds                  ;; 24:761F $11 $12 $76
    jp   CopyOutdoorsMacroObjectsToRoom           ;; 24:7622 $C3 $8B $35

func_024_7625::
    dec  bc                                       ;; 24:7625 $0B
    ld   e, a                                     ;; 24:7626 $5F
    ld   d, $00                                   ;; 24:7627 $16 $00
    ld   hl, wRoomObjects                         ;; 24:7629 $21 $11 $D7
    add  hl, de                                   ;; 24:762C $19
    ret                                           ;; 24:762D $C9

TwoDoorsHouseObjectOffsets::
    db   $00, $01, $02, $03, $04
    db   $10, $11, $12, $13, $14
    db   $20, $21, $22, $23, $24
    db   $FF

TwoDoorsHouseObjectIds::
    db   $55, $5A, $5A, $5A, $56
    db   $57, $59, $59, $59, $58
    db   $5B, $E2, $5B, $E2, $5B

TwoDoorsHouseMacroHandler::
    push bc                                       ;; 24:764D $C5
    call func_024_7625                            ;; 24:764E $CD $25 $76
    ld   bc, TwoDoorsHouseObjectOffsets           ;; 24:7651 $01 $2E $76
    ld   de, TwoDoorsHouseObjectIds               ;; 24:7654 $11 $3E $76
    jp   CopyOutdoorsMacroObjectsToRoom           ;; 24:7657 $C3 $8B $35

LargeHouseObjectOffsets::
    db   $00, $01, $02
    db   $10, $11, $12
    db   $20, $21, $22
    db   $FF

LargeHouseObjectIds::
    db   $55, $5A, $56
    db   $57, $59, $58
    db   $5B, $E2, $5B

LargeHouseMacroHandler::
    push bc                                       ;; 24:766D $C5
    call func_024_7625                            ;; 24:766E $CD $25 $76
    ld   bc, LargeHouseObjectOffsets              ;; 24:7671 $01 $5A $76
    ld   de, LargeHouseObjectIds                  ;; 24:7674 $11 $64 $76
    jp   CopyOutdoorsMacroObjectsToRoom           ;; 24:7677 $C3 $8B $35

PalaceDoorObjectOffsets::
    db   $00, $01, $02
    db   $10, $11, $12
    db   $FF

PalaceDoorObjectIds::
    db   $A4, $A5, $A6
    db   $A7, $E3, $A8

PalaceDoorMacroHandler::
    push bc                                       ;; 24:7687 $C5
    call func_024_7625                            ;; 24:7688 $CD $25 $76
    ld   bc, PalaceDoorObjectOffsets              ;; 24:768B $01 $7A $76
    ld   de, PalaceDoorObjectIds                  ;; 24:768E $11 $81 $76
    jp   CopyOutdoorsMacroObjectsToRoom           ;; 24:7691 $C3 $8B $35

StonePigHeadObjectOffsets::
    db   $00, $01
    db   $10, $11
    db   $FF

StonePigHeadObjectIds_Intact::
    db   $BB, $BC
    db   $BD, $BE

StonePigHeadObjectIds_Blasted::
    db   $09, $09
    db   $09, $09

StonePigHeadMacroHandler::
    push bc                                       ;; 24:76A1 $C5
    call func_024_7625                            ;; 24:76A2 $CD $25 $76
    ld   bc, StonePigHeadObjectOffsets            ;; 24:76A5 $01 $94 $76
    ld   de, StonePigHeadObjectIds_Intact         ;; 24:76A8 $11 $99 $76
    ldh  a, [hRoomStatus]                         ;; 24:76AB $F0 $F8
    and  ROOM_STATUS_DOOR_OPEN_UP                 ;; 24:76AD $E6 $04
    jr   z, .jr_76B4                              ;; 24:76AF $28 $03
    ld   de, StonePigHeadObjectIds_Blasted        ;; 24:76B1 $11 $9D $76
.jr_76B4

    jp   CopyOutdoorsMacroObjectsToRoom           ;; 24:76B4 $C3 $8B $35

PalmTreeObjectOffsets::
    db   $00, $01
    db   $10, $11
    db   $FF

PalmTreeObjectIds::
    db   $B6, $B7
    db   $CD, $CE

PalmTreeMacroHandler::
    push bc                                       ;; 24:76C0 $C5
    call func_024_7625                            ;; 24:76C1 $CD $25 $76
    ld   bc, PalmTreeObjectOffsets                ;; 24:76C4 $01 $B7 $76
    ld   de, PalmTreeObjectIds                    ;; 24:76C7 $11 $BC $76
    jp   CopyOutdoorsMacroObjectsToRoom           ;; 24:76CA $C3 $8B $35

WalledPitObjectOffsets::
    db        $00, $01, $02,
    db        $10, $11, $12,
    db   $1F, $20, $21, $22, $23
    db        $30, $31, $32
    db   $FF

WalledPitObjectIds::
    db        $2B, $2C, $2D
    db        $37, $E8, $38,
    db   $0A, $33, $2F, $34, $0A
    db        $0A, $0A, $0A

WalledPitMacroHandler::
    push bc                                       ;; 24:76EA $C5
    call func_024_7625                            ;; 24:76EB $CD $25 $76
    ld   bc, WalledPitObjectOffsets               ;; 24:76EE $01 $CD $76
    ld   de, WalledPitObjectIds                   ;; 24:76F1 $11 $DC $76
    jp   CopyOutdoorsMacroObjectsToRoom           ;; 24:76F4 $C3 $8B $35

SmallHouseObjectOffsets::
    db   $00, $01, $02
    db   $10, $11, $12
    db   $FF

SmallHouseObjectIds::
    db   $52, $52, $52
    db   $5B, $E2, $5B

SmallHouseMacroHandler::
    push bc                                       ;; 24:7704 $C5
    call func_024_7625                            ;; 24:7705 $CD $25 $76
    ld   bc, SmallHouseObjectOffsets              ;; 24:7708 $01 $F7 $76
    ld   de, SmallHouseObjectIds                  ;; 24:770B $11 $FE $76
    jp   CopyOutdoorsMacroObjectsToRoom           ;; 24:770E $C3 $8B $35
