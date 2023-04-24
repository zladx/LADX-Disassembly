; Check if one of the inventory item should be used
CheckItemsToUse::
    ld   a, [wBlockItemUsage]                     ; $1177: $FA $0A $C5
    ld   hl, wC167                                ; $117A: $21 $67 $C1
    or   [hl]                                     ; $117D: $B6
    ld   hl, wC1A4                                ; $117E: $21 $A4 $C1
    or   [hl]                                     ; $1181: $B6
    ret  nz                                       ; $1182: $C0

    ;
    ; Configure the sword and shield
    ;

    ld   a, [wIsRunningWithPegasusBoots]          ; $1183: $FA $4A $C1
    and  a                                        ; $1186: $A7
    jr   z, .notRunning                           ; $1187: $28 $33

    ld   a, [wInventoryItems.AButtonSlot]         ; $1189: $FA $01 $DB
    cp   INVENTORY_SWORD                          ; $118C: $FE $01
    jr   z, .swordEquipped                        ; $118E: $28 $1A
    ld   a, [wInventoryItems.BButtonSlot]         ; $1190: $FA $00 $DB
    cp   INVENTORY_SWORD                          ; $1193: $FE $01
    jr   z, .swordEquipped                        ; $1195: $28 $13
    ld   a, [wInventoryItems.AButtonSlot]         ; $1197: $FA $01 $DB
    cp   INVENTORY_SHIELD                         ; $119A: $FE $04
    jr   z, .shieldEquipped                       ; $119C: $28 $07
    ld   a, [wInventoryItems.BButtonSlot]         ; $119E: $FA $00 $DB
    cp   INVENTORY_SHIELD                         ; $11A1: $FE $04
    jr   nz, .shieldEnd                           ; $11A3: $20 $15

.shieldEquipped
    call SetShieldVals                            ; $11A5: $CD $40 $13
    jr   .shieldEnd                               ; $11A8: $18 $10

.swordEquipped
    ld   a, [wSwordAnimationState]                ; $11AA: $FA $37 $C1
    dec  a                                        ; $11AD: $3D
    cp   SWORD_ANIMATION_STATE_SWING_END          ; $11AE: $FE $04
    jr   c, .shieldEnd                            ; $11B0: $38 $08
    ld   a, SWORD_ANIMATION_STATE_HOLDING         ; $11B2: $3E $05
    ld   [wSwordAnimationState], a                ; $11B4: $EA $37 $C1
    ld   [wC16A], a                               ; $11B7: $EA $6A $C1

.shieldEnd
    jr   .swordShieldEnd                          ; $11BA: $18 $07

.notRunning
    xor  a                                        ; $11BC: $AF
    ld   [wIsUsingShield], a                      ; $11BD: $EA $5B $C1
    ld   [wHasMirrorShield], a                    ; $11C0: $EA $5A $C1

.swordShieldEnd

    ld   a, [wC117]                               ; $11C3: $FA $17 $C1
    and  a                                        ; $11C6: $A7
    jp   nz, UseItem.return                       ; $11C7: $C2 $ED $12
    ; if Link does carry something, exit
    ld   a, [wIsCarryingLiftedObject]             ; $11CA: $FA $5C $C1
    and  a                                        ; $11CD: $A7
    jp   nz, UseItem.return                       ; $11CE: $C2 $ED $12
    ; if in sword animation check if motion is possible
    ld   a, [wSwordAnimationState]                ; $11D1: $FA $37 $C1
    and  a                                        ; $11D4: $A7
    jr   z, .checkMotionBlocked                   ; $11D5: $28 $0B
    cp   SWORD_ANIMATION_STATE_SWING_MIDDLE       ; $11D7: $FE $03
    jr   nz, .checkMotionBlocked                  ; $11D9: $20 $07
    ld   a, [wC138]                               ; $11DB: $FA $38 $C1
    cp   $03                                      ; $11DE: $FE $03
    jr   nc, .pegasusBootsB                       ; $11E0: $30 $06

.checkMotionBlocked
    ldh  a, [hLinkInteractiveMotionBlocked]       ; $11E2: $F0 $A1
    and  a                                        ; $11E4: $A7
    jp   nz, UseItem.return                       ; $11E5: $C2 $ED $12

.pegasusBootsB
    ; if Pegasus boots are not equipped in slot B check slot A
    ld   a, [wInventoryItems.BButtonSlot]         ; $11E8: $FA $00 $DB
    cp   INVENTORY_PEGASUS_BOOTS                  ; $11EB: $FE $08
    jr   nz, .pegasusBootsA                       ; $11ED: $20 $0F
    ; reset boots if button not longer pressed down
    ldh  a, [hPressedButtonsMask]                 ; $11EF: $F0 $CB
    and  J_B                                      ; $11F1: $E6 $20
    jr   z, .resetPegasusBootsChargeMeterB        ; $11F3: $28 $05
    ; use the boots and check for slot A
    call UsePegasusBoots                          ; $11F5: $CD $05 $17
    jr   .pegasusBootsA                           ; $11F8: $18 $04

.resetPegasusBootsChargeMeterB
    ; $wPegasusBootsChargeMeter = 0
    xor  a                                        ; $11FA: $AF
    ld   [wPegasusBootsChargeMeter], a            ; $11FB: $EA $4B $C1

.pegasusBootsA
    ; if Pegasus boots are not equipped in slot A check slot A for shield
    ld   a, [wInventoryItems.AButtonSlot]         ; $11FE: $FA $01 $DB
    cp   INVENTORY_PEGASUS_BOOTS                  ; $1201: $FE $08
    jr   nz, .shieldA                             ; $1203: $20 $0F
    ; reset boots if button not longer pressed down
    ldh  a, [hPressedButtonsMask]                 ; $1205: $F0 $CB
    and  J_A                                      ; $1207: $E6 $10
    ; use the boots and check for slot A for shield
    jr   z, .resetPegasusBootsChargeMeterA        ; $1209: $28 $05
    call UsePegasusBoots                          ; $120B: $CD $05 $17
    jr   .shieldA                                 ; $120E: $18 $04

.resetPegasusBootsChargeMeterA
    ; $wPegasusBootsChargeMeter = 0
    xor  a                                        ; $1210: $AF
    ld   [wPegasusBootsChargeMeter], a            ; $1211: $EA $4B $C1

.shieldA
    ; if shield is not equipped in slot A
    ld   a, [wInventoryItems.AButtonSlot]         ; $1214: $FA $01 $DB
    cp   INVENTORY_SHIELD                         ; $1217: $FE $04
    jr   nz, .shieldB                             ; $1219: $20 $1A
    ; update shield status
    ld   a, [wShieldLevel]                        ; $121B: $FA $44 $DB
    ld   [wHasMirrorShield], a                    ; $121E: $EA $5A $C1
    ; reset shield if button no longer pressed down
    ldh  a, [hPressedButtonsMask]                 ; $1221: $F0 $CB
    and  J_A                                      ; $1223: $E6 $10
    jr   z, .shieldB                              ; $1225: $28 $0E
    ; check if we're near an NPC, and if so,
    ; pressing A should initiate dialog instead
    ; of using the shield
    ld   a, [wItemUsageContext]                   ; $1227: $FA $AD $C1
    cp   ITEM_USAGE_NEAR_NPC                      ; $122A: $FE $01
    jr   z, .shieldB                              ; $122C: $28 $07
    ; check if we're currently reading text from
    ; a sign/owl statue/etc, and if so, pressing
    ; A should only advance the text instead of
    ; using the shield
    cp   ITEM_USAGE_READING_TEXT                  ; $122E: $FE $02
    jr   z, .shieldB                              ; $1230: $28 $03
    ; use the shield
    call SetShieldVals                            ; $1232: $CD $40 $13

.shieldB
    ; if shield is not equipped in slot B
    ld   a, [wInventoryItems.BButtonSlot]         ; $1235: $FA $00 $DB
    cp   INVENTORY_SHIELD                         ; $1238: $FE $04
    jr   nz, .nextItemB                           ; $123A: $20 $0F
    ; update shield status
    ld   a, [wShieldLevel]                        ; $123C: $FA $44 $DB
    ld   [wHasMirrorShield], a                    ; $123F: $EA $5A $C1
    ; reset shield if button not longer pressed down
    ldh  a, [hPressedButtonsMask]                 ; $1242: $F0 $CB
    and  J_B                                      ; $1244: $E6 $20
    jr   z, .nextItemB                            ; $1246: $28 $03

    ; possibly a minor bug here: we're not
    ; checking if we're near an NPC or currently
    ; reading text from a sign, so if the shield
    ; is equipped to B, we can press and hold B
    ; at the final text line to close a text box
    ; and immediately raise the shield. This is
    ; not possible if the shield is equipped to A.

    ; use the shield
    call SetShieldVals                            ; $1248: $CD $40 $13

.nextItemB
    ldh  a, [hJoypadState]                        ; $124B: $F0 $CC
    and  J_B                                      ; $124D: $E6 $20
    jr   z, .nextItemA                            ; $124F: $28 $0D
    ld   a, [wItemUsageContext]                   ; $1251: $FA $AD $C1
    cp   ITEM_USAGE_READING_TEXT                  ; $1254: $FE $02
    jr   z, .nextItemA                            ; $1256: $28 $06

    ; Use item in B slot
    ld   a, [wInventoryItems.BButtonSlot]         ; $1258: $FA $00 $DB
    call UseItem                                  ; $125B: $CD $9C $12

.nextItemA
    ldh  a, [hJoypadState]                        ; $125E: $F0 $CC
    and  J_A                                      ; $1260: $E6 $10
    jr   z, .swordB                               ; $1262: $28 $11
    ld   a, [wItemUsageContext]                   ; $1264: $FA $AD $C1
    cp   ITEM_USAGE_NEAR_NPC                      ; $1267: $FE $01
    jr   z, .swordB                               ; $1269: $28 $0A
    cp   ITEM_USAGE_READING_TEXT                  ; $126B: $FE $02
    jr   z, .swordB                               ; $126D: $28 $06

    ; Use item in A slot
    ld   a, [wInventoryItems.AButtonSlot]         ; $126F: $FA $01 $DB
    call UseItem                                  ; $1272: $CD $9C $12

.swordB
    ; skip if button is not pressed
    ldh  a, [hPressedButtonsMask]                 ; $1275: $F0 $CB
    and  J_B                                      ; $1277: $E6 $20
    jr   z, .swordA                               ; $1279: $28 $06
    ld   a, [wInventoryItems.BButtonSlot]         ; $127B: $FA $00 $DB
    call label_1321                               ; $127E: $CD $21 $13

.swordA
    ldh  a, [hPressedButtonsMask]                 ; $1281: $F0 $CB
    and  J_A                                      ; $1283: $E6 $10
    jr   z, .jr_128D                              ; $1285: $28 $06
    ld   a, [wInventoryItems.AButtonSlot]         ; $1287: $FA $01 $DB
    call label_1321                               ; $128A: $CD $21 $13

.jr_128D
    ; Special code for the Color Dungeon
    callsb func_020_48CA                          ; $128D: $3E $20 $EA $00 $21 $CD $CA $48
    ld   a, [wCurrentBank]                        ; $1295: $FA $AF $DB
    ld   [rSelectROMBank], a                      ; $1298: $EA $00 $21
    ret                                           ; $129B: $C9
