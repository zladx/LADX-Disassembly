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


    ;    0 1 2 3 4 5 6 7  - Minimap arrow positions. Spaces for visbiility only.
Minimap0::
    db "                "
    db "                "
    db "            ##  "
    db "  ######    Nm  "
    db "Ch  ##Ch##Ch##  "
    db "####ChCh######  "
    db "##  ##ChCh      "
    db "  Ch####        "
MINIMAP_ARROW_TAIL_CAVE equ \
              03


Minimap1::
    db "                "
    db "  ChChCh######  "
    db "    Ch    Ch    "
    db "  ####    ##Nm  "
    db "  ##        ##  "
    db "  Ch        ##  "
    db "  ############  "
    db "    ChChChCh    "
MINIMAP_ARROW_BOTTLE_GROTTO equ \
            02


Minimap2::
    db "####Ch##        "
    db "Ch##ChCh        "
    db "########    ##  "
    db "  Ch##    ######"
    db "  Ch        ##  "
    db "  ChCh      ##  "
    db "  Ch        Nm  "
    db "  ##Ch      ####"
MINIMAP_ARROW_KEY_CAVERN equ \
          01


Minimap3::
    db "                "
    db "      Ch##      "
    db "  ##  ####  Ch  "
    db "  Nm##Ch##Ch##  "
    db "  ##ChCh####Ch  "
    db "    ######Ch    "
    db "    Ch##ChCh    "
    db "      ##Ch      "
MINIMAP_ARROW_ANGLERS_TUNNEL equ \
              03


Minimap4::
    db "  ######Ch##    "
    db "      Nm  ##Ch  "
    db "  ##########ChCh"
    db "          ######"
    db "      ########  "
    db "    Ch######    "
    db "      Ch####    "
    db "        Ch##Ch##"
MINIMAP_ARROW_CATFISHS_MAW equ \
                      07


Minimap5::
    db "                "
    db "Ch            Ch"
    db "##Ch  ####  Ch##"
    db "##Ch####Nm##Ch##"
    db "Ch##  ####  ####"
    db "  ##Ch########  "
    db "  ChCh    ##Ch  "
    db "  ############  "
MINIMAP_ARROW_FACE_SHRINE equ \
              03


Minimap6::
    db "  ChCh          "
    db "########  ####  "
    db "######Ch  ##Nm  "
    db "##Ch####        "
    db "Ch####Ch  ##Ch  "
    db "##############Ch"
    db "Ch##############"
    db "########  ####  "
MINIMAP_ARROW_EAGLES_TOWER equ \
          01


Minimap7::
    db "      ####      "
    db "Ch    NmCh    Ch"
    db "####Ch####Ch####"
    db "  Ch##########  "
    db "  Ch##########  "
    db "##Ch##Ch########"
    db "##Ch######Ch####"
    db "Ch    ####    Ch"
MINIMAP_ARROW_TURTLE_ROCK equ \
              03


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
    db "                "
    db "                "
    db "                "
    db "  Nm##    Ch##  "
    db "  ####Ch######  "
    db "    ########    "
    db "    ##Ch##Ch    "
    db "    ####Ch##    "
MINIMAP_ARROW_COLOR_DUNGEON equ \
            02


POPC
