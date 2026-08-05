
InventoryPalettes::
    rgb   #F8F8A8, #20B048, #084828, #000000
    rgb   #F8F8A8, #8888A0, #283050, #000000
    rgb   #F8F8A8, #F81858, #700028, #000000
    rgb   #F8F8A8, #C87020, #703020, #000000
    rgb   #F8F8A8, #70A8F8, #0000F8, #000000
    rgb   #F8F8A8, #F8F8F8, #109008, #000000
    rgb   #F8F8A8, #D8A820, #885000, #000000
    rgb   #F8F8A8, #10C050, #008010, #000000

    rgb   #F8F8A8, #000000, #10A840, #F8B898
    rgb   #0000F8, #000000, #F87808, #F8B898
    rgb   #0000F8, #000000, #1880F8, #F8B898
    rgb   #0000F8, #000000, #8888A0, #F8F8F8
    rgb   #0000F8, #F8B030, #E81830, #000000
    rgb   #0000F8, #000000, #10A840, #F8F8F8
    rgb   #0000F8, #000000, #F80000, #F8F8F8
    rgb   #0000F8, #000000, #0000F8, #F8F8F8

InventoryTradingItemPalettes::
    ; Replaces the second and third color in the fifth BG palette line
    ; Used for trading sequence items
    rgb            #F8F8F8, #109008          ; Yoshi doll
    rgb            #F0E818, #988000          ; bananas
    rgb            #F8D818, #007810          ; pineapple
    rgb            #F8B060, #E81830          ; hibiscus
    rgb            #F8F8F8, #E80810          ; letter
    rgb            #70A8F8, #0000F8          ; magnifying lens
    rgb            #F8F8F8, #8888A0          ; dog food

InventoryTradingItemPaletteTable::
    ; Pointers to InventoryTradingItemPalettes
    ; POI: This seems really inefficent compared to just adding the index... but w/e
    dw   InventoryTradingItemPalettes
    dw   InventoryTradingItemPalettes + $04
    dw   InventoryTradingItemPalettes + $08
    dw   InventoryTradingItemPalettes + $0C
    dw   InventoryTradingItemPalettes + $10
    dw   InventoryTradingItemPalettes + $14
    dw   InventoryTradingItemPalettes + $18

InventoryTradingItemPaletteIndex::
    ; Which trading item palette should be used, per trading item
    db  $00  ; TRADING_ITEM_NONE
    db  $01  ; TRADING_ITEM_YOSHI_DOLL
    db  $00  ; TRADING_ITEM_RIBBON
    db  $07  ; TRADING_ITEM_DOG_FOOD
    db  $02  ; TRADING_ITEM_BANANAS
    db  $00  ; TRADING_ITEM_STICK
    db  $00  ; TRADING_ITEM_HONEYCOMB
    db  $03  ; TRADING_ITEM_PINEAPPLE
    db  $04  ; TRADING_ITEM_HIBISCUS
    db  $05  ; TRADING_ITEM_LETTER
    db  $00  ; TRADING_ITEM_BROOM
    db  $00  ; TRADING_ITEM_FISHING_HOOK
    db  $00  ; TRADING_ITEM_NECKLACE
    db  $00  ; TRADING_ITEM_SCALE
    db  $06  ; TRADING_ITEM_MAGNIFYING_LENS
