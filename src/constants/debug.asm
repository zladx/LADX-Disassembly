; Built-in debug tools for the game.
;
; Setting these ROM addresses to any non-zero value (for instance using
; a cheat code) enables the tools.
;
; See https://tcrf.net/The_Legend_of_Zelda:_Link%27s_Awakening#Debug_Utilities
; for more details.

; Debug Tool 1
;  - Write a precomposed savegame in slot 1 on boot.
;  - Free-Movement Mode.
;  - Pause/unpause the engine.
;  - Warp to any map.
;  - Text debugger.
;  - Jumping to the Ending sequence.
DEF ROM_DebugTool1 EQU $0003

; Debug Tool 2
;  - Disable subscreen redraw.
;  - Reset Photo Album.
DEF ROM_DebugTool2 EQU $0004

; Debug Tool 3
;  - Pressing Select on the sub-screen toggles Free-Movement Mode.
;  - Pressing Select on the sub-screen resets the photo gallery.
;  - Pressing Start on the world map activates the Ending sequence.
;  - Viewing the photo gallery automatically sets all pictures to captured.
DEF ROM_DebugTool3 EQU $0005
