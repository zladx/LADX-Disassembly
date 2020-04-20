; Dungeon minimaps, visible on the subscreen

; The actual tile used for a visited room
; is based off of the room data itself and the save file
; using specific "doorway" objects in each room,
; rather than being coded into the minimaps themselves

; This is kind of a silly way to write them out in assembly
; but hopefully a better visual metaphor than raw values.


; Fun rgbds gotcha: NEWCHARMAP also switches to it.
; This is not indicated in the manual. -___-
PUSHC
NEWCHARMAP MinimapCharmap
CHARMAP "  ", $7D   ; Blank (not shown on map)
CHARMAP "##", $EF   ; Room (shows up on map)
CHARMAP "Ch", $ED   ; Room with chest
CHARMAP "Nm", $EE   ; Nightmare boss marker

Minimap0::
    db "                "
    db "                "
    db "            ##  "
    db "  ######    Nm  "
    db "Ch  ##Ch##Ch##  "
    db "####ChCh######  "
    db "##  ##ChCh      "
    db "  Ch####        "

Minimap1::
    db "                "
    db "  ChChCh######  "
    db "    Ch    Ch    "
    db "  ####    ##Nm  "
    db "  ##        ##  "
    db "  Ch        ##  "
    db "  ############  "
    db "    ChChChCh    "

Minimap2::
    db "####Ch##        "
    db "Ch##ChCh        "
    db "########    ##  "
    db "  Ch##    ######"
    db "  Ch        ##  "
    db "  ChCh      ##  "
    db "  Ch        Nm  "
    db "  ##Ch      ####"

Minimap3::
    db "                "
    db "      Ch##      "
    db "  ##  ####  Ch  "
    db "  Nm##Ch##Ch##  "
    db "  ##ChCh####Ch  "
    db "    ######Ch    "
    db "    Ch##ChCh    "
    db "      ##Ch      "

Minimap4::
    db "  ######Ch##    "
    db "      Nm  ##Ch  "
    db "  ##########ChCh"
    db "          ######"
    db "      ########  "
    db "    Ch######    "
    db "      Ch####    "
    db "        Ch##Ch##"

Minimap5::
    db "                "
    db "Ch            Ch"
    db "##Ch  ####  Ch##"
    db "##Ch####Nm##Ch##"
    db "Ch##  ####  ####"
    db "  ##Ch########  "
    db "  ChCh    ##Ch  "
    db "  ############  "

Minimap6::
    db "  ChCh          "
    db "########  ####  "
    db "######Ch  ##Nm  "
    db "##Ch####        "
    db "Ch####Ch  ##Ch  "
    db "##############Ch"
    db "Ch##############"
    db "########  ####  "

Minimap7::
    db "      ####      "
    db "Ch    NmCh    Ch"
    db "####Ch####Ch####"
    db "  Ch##########  "
    db "  Ch##########  "
    db "##Ch##Ch########"
    db "##Ch######Ch####"
    db "Ch    ####    Ch"

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


POPC
