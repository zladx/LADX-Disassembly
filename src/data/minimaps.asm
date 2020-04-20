; Dungeon minimaps, visible on the subscreen
;
; The actual tile used for a visited room
; is based off of the room data itself and the save file
; using specific "doorway" objects in each room,
; rather than being coded into the minimaps themselves
;
; This is kind of a silly way to write them out in assembly
; but hopefully a better visual metaphor than raw values.


; Fun rgbds gotcha: NEWCHARMAP also switches to it.
; This is not indicated in the manual.
PUSHC
NEWCHARMAP MinimapCharmap
CHARMAP "  ", $7D   ; Blank (not shown on map)
CHARMAP "##", $EF   ; Room (shows up on map)
CHARMAP "Ch", $ED   ; Room with chest
CHARMAP "Nm", $EE   ; Nightmare boss marker


; Temporary macros used only in this file.
; This is a really gross mess i'm sorry
_VARDEF: MACRO
\1 equ \2
         ENDM

_ARROW: MACRO
_temp_\@ equs STRCAT("MINIMAP_ARROW_", "{_N}")
        _VARDEF _temp_\@, \1
        PURGE _temp_\@
        ENDM

_STYLE: MACRO
_temp_\@ equs STRCAT("MINIMAP_STYLE_", "{_N}")
        _VARDEF _temp_\@, \1
        PURGE _N, _temp_\@
        ENDM


    ;    0 1 2 3 4 5 6 7  - Minimap arrow positions. Spaces for visbiility only.
Minimap0::
_N equs "TAIL_CAVE"
    db "                "
    db "                "
    db "            ##  "
    db "  ######    Nm  "
    db "Ch  ##Ch##Ch##  "
    db "####ChCh######  "
    db "##  ##ChCh      "
    db "  Ch####        "
 _ARROW       03
 _STYLE INVENTORY_MINIMAP_SINGLE_FLOOR


Minimap1::
_N equs "BOTTLE_GROTTO"
    db "                "
    db "  ChChCh######  "
    db "    Ch    Ch    "
    db "  ####    ##Nm  "
    db "  ##        ##  "
    db "  Ch        ##  "
    db "  ############  "
    db "    ChChChCh    "
 _ARROW     02
 _STYLE INVENTORY_MINIMAP_SINGLE_FLOOR


Minimap2::
_N equs "KEY_CAVERN"
    db "####Ch##        "
    db "Ch##ChCh        "
    db "########    ##  "
    db "  Ch##    ######"
    db "  Ch        ##  "
    db "  ChCh      ##  "
    db "  Ch        Nm  "
    db "  ##Ch      ####"
 _ARROW   01
 _STYLE INVENTORY_MINIMAP_SINGLE_FLOOR


Minimap3::
_N equs "ANGLERS_TUNNEL"
    db "                "
    db "      Ch##      "
    db "  ##  ####  Ch  "
    db "  Nm##Ch##Ch##  "
    db "  ##ChCh####Ch  "
    db "    ######Ch    "
    db "    Ch##ChCh    "
    db "      ##Ch      "
 _ARROW       03
 _STYLE INVENTORY_MINIMAP_SINGLE_FLOOR


Minimap4::
_N equs "CATFISHS_MAW"
    db "  ######Ch##    "
    db "      Nm  ##Ch  "
    db "  ##########ChCh"
    db "          ######"
    db "      ########  "
    db "    Ch######    "
    db "      Ch####    "
    db "        Ch##Ch##"
 _ARROW               07
 _STYLE INVENTORY_MINIMAP_SINGLE_FLOOR


Minimap5::
_N equs "FACE_SHRINE"
    db "                "
    db "Ch            Ch"
    db "##Ch  ####  Ch##"
    db "##Ch####Nm##Ch##"
    db "Ch##  ####  ####"
    db "  ##Ch########  "
    db "  ChCh    ##Ch  "
    db "  ############  "
 _ARROW       03
 _STYLE INVENTORY_MINIMAP_SINGLE_FLOOR


Minimap6::
_N equs "EAGLES_TOWER"
    db "  ChCh          "
    db "########  ####  "
    db "######Ch  ##Nm  "
    db "##Ch####        "
    db "Ch####Ch  ##Ch  "
    db "##############Ch"
    db "Ch##############"
    db "########  ####  "
 _ARROW   01
 _STYLE INVENTORY_MINIMAP_FOUR_FLOORS_A


Minimap7::
_N equs "TURTLE_ROCK"
    db "      ####      "
    db "Ch    NmCh    Ch"
    db "####Ch####Ch####"
    db "  Ch##########  "
    db "  Ch##########  "
    db "##Ch##Ch########"
    db "##Ch######Ch####"
    db "Ch    ####    Ch"
 _ARROW       03
 _STYLE INVENTORY_MINIMAP_SINGLE_FLOOR


EaglesTowerCollapsedMinimap::
    db "  ChCh          "
    db "########        "
    db "######Ch        "
    db "##Ch####        "
    db "Ch####Ch  ##Ch  "
    db "################"
    db "Ch##########Nm##"
    db "########  ####  "


ColorDungeonMinimap::
_N equs "COLOR_DUNGEON"
    db "                "
    db "                "
    db "                "
    db "  Nm##    Ch##  "
    db "  ####Ch######  "
    db "    ########    "
    db "    ##Ch##Ch    "
    db "    ####Ch##    "
 _ARROW     02
 _STYLE INVENTORY_MINIMAP_SINGLE_FLOOR


PURGE _VARDEF, _ARROW, _STYLE
POPC
