; Check if one of the inventory item should be used
CheckItemsToUse::
    ld   a, [wBlockItemUsage]                     ;; 00:1177 $FA $0A $C5
    ld   hl, wC167                                ;; 00:117A $21 $67 $C1
    or   [hl]                                     ;; 00:117D $B6
    ld   hl, wC1A4                                ;; 00:117E $21 $A4 $C1
    or   [hl]                                     ;; 00:1181 $B6
    ret  nz                                       ;; 00:1182 $C0

    ;
    ; Configure the sword and shield
    ;

    ld   a, [wIsRunningWithPegasusBoots]          ;; 00:1183 $FA $4A $C1
    and  a                                        ;; 00:1186 $A7
    jr   z, .notRunning                           ;; 00:1187 $28 $33

    ld   a, [wInventoryItems.AButtonSlot]         ;; 00:1189 $FA $01 $DB
    cp   INVENTORY_SWORD                          ;; 00:118C $FE $01
    jr   z, .swordEquipped                        ;; 00:118E $28 $1A
    ld   a, [wInventoryItems.BButtonSlot]         ;; 00:1190 $FA $00 $DB
    cp   INVENTORY_SWORD                          ;; 00:1193 $FE $01
    jr   z, .swordEquipped                        ;; 00:1195 $28 $13
    ld   a, [wInventoryItems.AButtonSlot]         ;; 00:1197 $FA $01 $DB
    cp   INVENTORY_SHIELD                         ;; 00:119A $FE $04
    jr   z, .shieldEquipped                       ;; 00:119C $28 $07
    ld   a, [wInventoryItems.BButtonSlot]         ;; 00:119E $FA $00 $DB
    cp   INVENTORY_SHIELD                         ;; 00:11A1 $FE $04
    jr   nz, .shieldEnd                           ;; 00:11A3 $20 $15

.shieldEquipped
    call SetShieldVals                            ;; 00:11A5 $CD $40 $13
    jr   .shieldEnd                               ;; 00:11A8 $18 $10

.swordEquipped
    ld   a, [wSwordAnimationState]                ;; 00:11AA $FA $37 $C1
    dec  a                                        ;; 00:11AD $3D
    cp   SWORD_ANIMATION_STATE_SWING_END          ;; 00:11AE $FE $04
    jr   c, .shieldEnd                            ;; 00:11B0 $38 $08
    ld   a, SWORD_ANIMATION_STATE_HOLDING         ;; 00:11B2 $3E $05
    ld   [wSwordAnimationState], a                ;; 00:11B4 $EA $37 $C1
    ld   [wC16A], a                               ;; 00:11B7 $EA $6A $C1

.shieldEnd
    jr   .swordShieldEnd                          ;; 00:11BA $18 $07

.notRunning
    xor  a                                        ;; 00:11BC $AF
    ld   [wIsUsingShield], a                      ;; 00:11BD $EA $5B $C1
    ld   [wHasMirrorShield], a                    ;; 00:11C0 $EA $5A $C1

.swordShieldEnd

    ld   a, [wIsGelClingingToLink]                ;; 00:11C3 $FA $17 $C1
    and  a                                        ;; 00:11C6 $A7
    jp   nz, UseItem.return                       ;; 00:11C7 $C2 $ED $12
    ; if Link does carry something, exit
    ld   a, [wIsCarryingLiftedObject]             ;; 00:11CA $FA $5C $C1
    and  a                                        ;; 00:11CD $A7
    jp   nz, UseItem.return                       ;; 00:11CE $C2 $ED $12
    ; if in sword animation check if motion is possible
    ld   a, [wSwordAnimationState]                ;; 00:11D1 $FA $37 $C1
    and  a                                        ;; 00:11D4 $A7
    jr   z, .checkMotionBlocked                   ;; 00:11D5 $28 $0B
    cp   SWORD_ANIMATION_STATE_SWING_MIDDLE       ;; 00:11D7 $FE $03
    jr   nz, .checkMotionBlocked                  ;; 00:11D9 $20 $07
    ld   a, [wC138]                               ;; 00:11DB $FA $38 $C1
    cp   $03                                      ;; 00:11DE $FE $03
    jr   nc, .pegasusBootsB                       ;; 00:11E0 $30 $06

.checkMotionBlocked
    ldh  a, [hLinkInteractiveMotionBlocked]       ;; 00:11E2 $F0 $A1
    and  a                                        ;; 00:11E4 $A7
    jp   nz, UseItem.return                       ;; 00:11E5 $C2 $ED $12

.pegasusBootsB
    ; if Pegasus boots are not equipped in slot B check slot A
    ld   a, [wInventoryItems.BButtonSlot]         ;; 00:11E8 $FA $00 $DB
    cp   INVENTORY_PEGASUS_BOOTS                  ;; 00:11EB $FE $08
    jr   nz, .pegasusBootsA                       ;; 00:11ED $20 $0F
    ; reset boots if button not longer pressed down
    ldh  a, [hPressedButtonsMask]                 ;; 00:11EF $F0 $CB
    and  J_B                                      ;; 00:11F1 $E6 $20
    jr   z, .resetPegasusBootsChargeMeterB        ;; 00:11F3 $28 $05
    ; use the boots and check for slot A
    call UsePegasusBoots                          ;; 00:11F5 $CD $05 $17
    jr   .pegasusBootsA                           ;; 00:11F8 $18 $04

.resetPegasusBootsChargeMeterB
    ; $wPegasusBootsChargeMeter = 0
    xor  a                                        ;; 00:11FA $AF
    ld   [wPegasusBootsChargeMeter], a            ;; 00:11FB $EA $4B $C1

.pegasusBootsA
    ; if Pegasus boots are not equipped in slot A check slot A for shield
    ld   a, [wInventoryItems.AButtonSlot]         ;; 00:11FE $FA $01 $DB
    cp   INVENTORY_PEGASUS_BOOTS                  ;; 00:1201 $FE $08
    jr   nz, .shieldA                             ;; 00:1203 $20 $0F
    ; reset boots if button not longer pressed down
    ldh  a, [hPressedButtonsMask]                 ;; 00:1205 $F0 $CB
    and  J_A                                      ;; 00:1207 $E6 $10
    ; use the boots and check for slot A for shield
    jr   z, .resetPegasusBootsChargeMeterA        ;; 00:1209 $28 $05
    call UsePegasusBoots                          ;; 00:120B $CD $05 $17
    jr   .shieldA                                 ;; 00:120E $18 $04

.resetPegasusBootsChargeMeterA
    ; $wPegasusBootsChargeMeter = 0
    xor  a                                        ;; 00:1210 $AF
    ld   [wPegasusBootsChargeMeter], a            ;; 00:1211 $EA $4B $C1

.shieldA
    ; if shield is not equipped in slot A
    ld   a, [wInventoryItems.AButtonSlot]         ;; 00:1214 $FA $01 $DB
    cp   INVENTORY_SHIELD                         ;; 00:1217 $FE $04
    jr   nz, .shieldB                             ;; 00:1219 $20 $1A
    ; update shield status
    ld   a, [wShieldLevel]                        ;; 00:121B $FA $44 $DB
    ld   [wHasMirrorShield], a                    ;; 00:121E $EA $5A $C1
    ; reset shield if button no longer pressed down
    ldh  a, [hPressedButtonsMask]                 ;; 00:1221 $F0 $CB
    and  J_A                                      ;; 00:1223 $E6 $10
    jr   z, .shieldB                              ;; 00:1225 $28 $0E
    ; check if we're near an NPC, and if so,
    ; pressing A should initiate dialog instead
    ; of using the shield
    ld   a, [wItemUsageContext]                   ;; 00:1227 $FA $AD $C1
    cp   ITEM_USAGE_NEAR_NPC                      ;; 00:122A $FE $01
    jr   z, .shieldB                              ;; 00:122C $28 $07
    ; check if we're currently reading text from
    ; a sign/owl statue/etc, and if so, pressing
    ; A should only advance the text instead of
    ; using the shield
    cp   ITEM_USAGE_READING_TEXT                  ;; 00:122E $FE $02
    jr   z, .shieldB                              ;; 00:1230 $28 $03
    ; use the shield
    call SetShieldVals                            ;; 00:1232 $CD $40 $13

.shieldB
    ; if shield is not equipped in slot B
    ld   a, [wInventoryItems.BButtonSlot]         ;; 00:1235 $FA $00 $DB
    cp   INVENTORY_SHIELD                         ;; 00:1238 $FE $04
    jr   nz, .nextItemB                           ;; 00:123A $20 $0F
    ; update shield status
    ld   a, [wShieldLevel]                        ;; 00:123C $FA $44 $DB
    ld   [wHasMirrorShield], a                    ;; 00:123F $EA $5A $C1
    ; reset shield if button not longer pressed down
    ldh  a, [hPressedButtonsMask]                 ;; 00:1242 $F0 $CB
    and  J_B                                      ;; 00:1244 $E6 $20
    jr   z, .nextItemB                            ;; 00:1246 $28 $03

    ; possibly a minor bug here: we're not
    ; checking if we're near an NPC or currently
    ; reading text from a sign, so if the shield
    ; is equipped to B, we can press and hold B
    ; at the final text line to close a text box
    ; and immediately raise the shield. This is
    ; not possible if the shield is equipped to A.

    ; use the shield
    call SetShieldVals                            ;; 00:1248 $CD $40 $13

.nextItemB
    ldh  a, [hJoypadState]                        ;; 00:124B $F0 $CC
    and  J_B                                      ;; 00:124D $E6 $20
    jr   z, .nextItemA                            ;; 00:124F $28 $0D
    ld   a, [wItemUsageContext]                   ;; 00:1251 $FA $AD $C1
    cp   ITEM_USAGE_READING_TEXT                  ;; 00:1254 $FE $02
    jr   z, .nextItemA                            ;; 00:1256 $28 $06

    ; Use item in B slot
    ld   a, [wInventoryItems.BButtonSlot]         ;; 00:1258 $FA $00 $DB
    call UseItem                                  ;; 00:125B $CD $9C $12

.nextItemA
    ldh  a, [hJoypadState]                        ;; 00:125E $F0 $CC
    and  J_A                                      ;; 00:1260 $E6 $10
    jr   z, .swordB                               ;; 00:1262 $28 $11
    ld   a, [wItemUsageContext]                   ;; 00:1264 $FA $AD $C1
    cp   ITEM_USAGE_NEAR_NPC                      ;; 00:1267 $FE $01
    jr   z, .swordB                               ;; 00:1269 $28 $0A
    cp   ITEM_USAGE_READING_TEXT                  ;; 00:126B $FE $02
    jr   z, .swordB                               ;; 00:126D $28 $06

    ; Use item in A slot
    ld   a, [wInventoryItems.AButtonSlot]         ;; 00:126F $FA $01 $DB
    call UseItem                                  ;; 00:1272 $CD $9C $12

.swordB
    ; skip if button is not pressed
    ldh  a, [hPressedButtonsMask]                 ;; 00:1275 $F0 $CB
    and  J_B                                      ;; 00:1277 $E6 $20
    jr   z, .swordA                               ;; 00:1279 $28 $06
    ld   a, [wInventoryItems.BButtonSlot]         ;; 00:127B $FA $00 $DB
    call label_1321                               ;; 00:127E $CD $21 $13

.swordA
    ldh  a, [hPressedButtonsMask]                 ;; 00:1281 $F0 $CB
    and  J_A                                      ;; 00:1283 $E6 $10
    jr   z, .jr_128D                              ;; 00:1285 $28 $06
    ld   a, [wInventoryItems.AButtonSlot]         ;; 00:1287 $FA $01 $DB
    call label_1321                               ;; 00:128A $CD $21 $13

.jr_128D
    ; Special code for the Color Dungeon
    callsb func_020_48CA                          ;; 00:128D $3E $20 $EA $00 $21 $CD $CA $48
    ld   a, [wCurrentBank]                        ;; 00:1295 $FA $AF $DB
    ld   [rSelectROMBank], a                      ;; 00:1298 $EA $00 $21
    ret                                           ;; 00:129B $C9
