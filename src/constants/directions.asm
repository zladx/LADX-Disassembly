; Used for:
; - hLinkDirection
; - wRoomTransitionDirection
DIRECTION_RIGHT     EQU $00
DIRECTION_LEFT      EQU $01
DIRECTION_UP        EQU $02
DIRECTION_DOWN      EQU $03
DIRECTION_ENTER     EQU $04
DIRECTION_KEEP      EQU $0F

DIRECTION_VERTICAL_MASK EQU $02 ; use with AND, result is not zero if it is vertical
