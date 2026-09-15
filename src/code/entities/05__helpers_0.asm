
; Add item to inventory slot (used for assigning the shield and magic powder)
; POI: This function is identical to GiveInventoryItem, which has a trampoline.
AssignItemToSlot:
    ld   hl, wInventoryItems.BButtonSlot          ;; 05:5321 $21 $00 $DB
    ld   e, INVENTORY_SLOT_COUNT                  ;; 05:5324 $1E $0C

    ; Search if a matching item exists in inventory
.searchLoop
    ld   a, [hl+]                                 ;; 05:5326 $2A
    cp   d                                        ;; 05:5327 $BA
    jr   z, .return                               ;; 05:5328 $28 $13

    dec  e                                        ;; 05:532A $1D
    jr   nz, .searchLoop                          ;; 05:532B $20 $F9

    ld   hl, wInventoryItems.BButtonSlot          ;; 05:532D $21 $00 $DB

    ; Check for first empty slot, add item to it and return
.assignLoop
    ld   a, [hl]                                  ;; 05:5330 $7E
    and  a                                        ;; 05:5331 $A7
    jr   nz, .slotFound                           ;; 05:5332 $20 $02

    ld   [hl], d                                  ;; 05:5334 $72
    ret                                           ;; 05:5335 $C9

.slotFound
    inc  hl                                       ;; 05:5336 $23
    inc  e                                        ;; 05:5337 $1C
    ld   a, e                                     ;; 05:5338 $7B
    cp   INVENTORY_SLOT_COUNT                     ;; 05:5339 $FE $0C
    jr   nz, .assignLoop                          ;; 05:533B $20 $F3

.return
    ret                                           ;; 05:533D $C9
