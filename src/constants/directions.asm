; Used for:
; - hLinkDirection
; - wRoomTransitionDirection
DEF DIRECTION_RIGHT     EQU $00
DEF DIRECTION_LEFT      EQU $01
DEF DIRECTION_UP        EQU $02
DEF DIRECTION_DOWN      EQU $03
DEF DIRECTION_ENTER     EQU $04
DEF DIRECTION_KEEP      EQU $0F

DEF DIRECTION_VERTICAL_MASK EQU $02 ; use with AND, result is not zero if it is vertical
