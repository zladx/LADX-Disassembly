; World tilesets
; Each tileset is shared by 2x2 adjacent rooms.
; $OF means "don't change"

; TODO: Replace these by references to the real tileset address, like:
; W_TILESET_CAMERA_SHOP      equ HIGH(Overworld2Tiles - $4000 + $0000)
; W_TILESET_TURTLE_ROCK      equ HIGH(Overworld2Tiles - $4000 + $0200)

W_TILESET_KEEP               equ $0F
W_TILESET_CAMERA_SHOP        equ $1A
W_TILESET_TURTLE_ROCK        equ $1C
W_TILESET_SEASHELL_MANSION   equ $1E
W_TILESET_MYSTERIOUS_WOODS   equ $20
W_TILESET_BEACH              equ $22
W_TILESET_PRAIRIE_STONE_HEAD equ $24
W_TILESET_MABE_VILLAGE       equ $26
W_TILESET_KANALET_CASTLE     equ $28
W_TILESET_FACE_SHRINE        equ $2A
W_TILESET_2C                 equ $2C
W_TILESET_PRAIRIE_SOUTH      equ $2E
W_TILESET_30                 equ $30
W_TILESET_RAFTING_GAME       equ $32
W_TILESET_ANGLERS_TUNNEL     equ $34
W_TILESET_YARNA_DESERT       equ $35
W_TILESET_GOPONGO_SWAMP      equ $36
W_TILESET_GRAVEYARD          equ $38
W_TILESET_EAGLES_TOWER       equ $39
W_TILESET_MARTHAS_BAY        equ $3A
W_TILESET_EGG                equ $3C
W_TILESET_TARAMANCH_MIDDLE   equ $3E
W_TILESET_NO_UPDATE          equ $FF
