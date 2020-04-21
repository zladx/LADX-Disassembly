;
; Build options
;
; Ideally this would be command-line build flags but for the time being
; options will be listed here (and can optionally be enabled)
;


;
; Debug flag 1
;
; Effects:
; - Writes a pre-made save file to slot 1 on startup
; - Pause the game     (Hold a D-Pad direction and push Select to pause, push Select again to unpause)
; - Free-movement mode (Use the above (toggles at the same time))
; - Warp anywhere      (Push B + Select on the map screen to warp to the center of that room)
; - Dialogue debugger  (Marin will become a text-debugging object if your name begins with one space)
; - Jump to credits    (Marin will trigger the ending if your name begins with two spaces)

;ENABLE_DEBUG_1 equ 1


;
; Debug flag 2
;
; Effects:
; - Subscreen no longer redraws itself properly.
; - (JP only) Subscreen inventory doesn't update.
; - (JP only) Rupees and hearts don't update
; - Dungeon minimap entrance arrows aren't drawn.
; - Ending scene skipping (Left / Right during credits will move between scenes, Up / Down restarts)

;ENABLE_DEBUG_2 equ 1


;
; Debug flag 3
;
; Effects:
; - Free-movement mode   (Push Select on the subscreen to toggle)
; - Reset photo album    (Push Select on the subscreen)
; - Full photo album     (View the photo album to get all 12 images)
; - Jump to ending       (Push Start on the map screen)

;ENABLE_DEBUG_3 equ 1


