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

IF(!DEF(VERSION))
VERSION equs "0"
ENDC

FALSE equ 0
TRUE equ 1

LANG_JP = FALSE
LANG_EN = FALSE
LANG_FR = FALSE
LANG_DE = FALSE

BANK_1C_VAR = 1


; @TODO Patch effects and changes:
;
; __PATCH_4__
;   Changes ADD to OR one place, and removes the possibility to press
;   START to skip some part of the fisherman photo
;
; __PATCH_8__
;   1: Removes the debug feature that allows you to jump to the ending
;      by pushing START on the map screen if debug flag 3 is enabled
;
; __PATCH_A__
;   1: Skips updating the status bar's hearts, rupees,
;      and subscreen inventory if debug flag 2 is set.
;   2: Swaps the order of the subscreen and heart/rupee updates.
;      Purpose unknown.
;
; __DIACRITICS_SUPPORT__
;   Adds support for two diacritical marks on separate tiles above
;   letters.
;
; __SKIP_DIALOG_SUPPORT__
;   Pressing the B button will skip the remaining dialog and close the
;   text box immediately (for most dialog; some is marked as unskippable).
;
; __WEAK_GENIE__
;   The Genie (the boss in Level 2, Bottle Grotto) is weaker. The bottle
;   only needs to be thrown into the wall two times instead of three, and
;   the Genie himself has less HP.
;
; __RECALCULATE_MAX_HEARTS__
;   Makes sure the player's maximum health is legal by:
;   - clamping the maximum health between 3 and 4 when displaying the file menu
;   - clamping the maximum health between 3 and 14 before loading a saved file
;   - recalculating the maximum health to the actual, legal amount before saving,
;     based on map room flags for defeated bosses and collected heart containers
;
; __OPTIMIZATIONS_1__
;   Optimizations that were implemented in version 1.1 of the Japanese and English
;   revisions, and also in 1.0 of the French and German releases
;
; __OPTIMIZATIONS_2__
;   Small optimizations that were likely bundled in when adding diacritics support,
;   and so appear in the Japanese and German versions, but not any others
;
; __OPTIMIZATIONS_3__
;   Small optimizations that were implemented in version 1.1 of the Japanese and English
;   revisions, but not backported to other language releases

__PATCH_0__ = FALSE ; Applies to JP1+, EN1+, DE, FR
__PATCH_1__ = FALSE ; Applies to DE, FR
__PATCH_2__ = FALSE ; Applies to DE, JP1+, EN2+, FR
__PATCH_3__ = FALSE ; Applies to JP1+, EN1+
__PATCH_4__ = FALSE ; Applies to DE1+, JP2+, EN2+, FR1+
__PATCH_8__ = FALSE ; Applies to JP1+
__PATCH_A__ = 0 ; 1 in JP, 2 in DE
__SKIP_DIALOG_SUPPORT__ = FALSE ; TRUE in DE, FR
__DIACRITICS_SUPPORT__ = FALSE ; TRUE in JP, DE
__WEAK_GENIE__ = FALSE ; TRUE in FR, DE
__USE_FIXED_DIALOG_BANKS__ = FALSE ; TRUE in JP
__RECALCULATE_MAX_HEARTS__ = FALSE ; Applies to DE1+, JP2+, EN2+, FR1+
__OPTIMIZATIONS_1__ = FALSE ; Applies to JP1+, EN1+, DE, FR
__OPTIMIZATIONS_2__ = FALSE ; Applies to DE, JP
__OPTIMIZATIONS_3__ = FALSE ; Applies to JP1+, EN1+

; If the Key Cavern map is split into 1F and B1F on the subscreen.
; See also: https://tcrf.net/The_Legend_of_Zelda:_Link%27s_Awakening/Version_Differences#Key_Cavern
__SPLIT_KEY_CAVERN_MAP__ = TRUE ; FALSE in EN


; -------------------------------------------------------------------
; Default values

; Configures if the debug save file writer writes to max bombs or arrows first.
; FALSE: Arrows, then bombs
; TRUE: Bombs, then arrows
; This has no impact on gameplay - it just reorders the assignments.
DEBUG_SAVE_SWITCH_ARROWS = FALSE

; Tiles used for the "floor numbers" in split-floor dungeon maps.
; These are functionally unused in the DX version due to the map being moved
; to make space for the "PUSH SELECT" notice.
; Table of versions and replaced values:
;    *   FR  DE
; 0  EC  --  7F
; 1  E8  B1  EC
; 2  E8  B1  --
; FR changes "[B-][1F]" into "[SS][1]", DE changes it into just "[ ][KI]".
; See also: https://tcrf.net/The_Legend_of_Zelda:_Link%27s_Awakening/Version_Differences#Key_Cavern
; (examples of different languages)
MINIMAP_VAR_0 = $EC
MINIMAP_VAR_1 = $E8
MINIMAP_VAR_2 = $E8


CREDITS_VAR_0 = $1A
CREDITS_VAR_1 = $1B
CREDITS_VAR_2 = $0F



IF ("{LANG}" == "JP")
LANG_JP = TRUE
FILE_28 = $14
FILE_6C = $6C
FILE_2C = $54
FILE_64 = $74
EASTER_EGG_FILENAME_1 equs "ぜるだ" ; Zelda
EASTER_EGG_SONG_1 equ $60 ; MUSIC_FILE_SELECT_ZELDA
EASTER_EGG_FILENAME_2 equs "とたけけ" ; Totakeke
EASTER_EGG_SONG_2 equ $3C ; MUSIC_FILE_SELECT_TOTAKA
THIEF_NAME equs "どろぼ－"
DEBUG_SAVE_FILE_NAME equs "えすばはら" ; Sbahara (abbreviation of Shibahara, nickname of programmer Kuzuhara)
BANK_1C_VAR = 0
DEBUG_SAVE_BOMB_COUNT equ $59
DEBUG_SAVE_MAGIC_COUNT equ $39
DEBUG_SAVE_SWITCH_ARROWS = TRUE
GAMEOVER_OPTION_SAVE_CONTINUE_Y equ 72
GAMEOVER_OPTION_SAVE_QUIT_Y equ 88
GAMEOVER_OPTION_CONTINUE_Y equ 104
SAVE_OPTION_X equ 36
__USE_FIXED_DIALOG_BANKS__ = TRUE
__DIACRITICS_SUPPORT__ = TRUE
__OPTIMIZATIONS_2__ = TRUE
__PATCH_A__ = 1
IF (VERSION > 0)
__PATCH_0__ = TRUE
__PATCH_2__ = TRUE
__PATCH_3__ = TRUE
__PATCH_8__ = TRUE
__OPTIMIZATIONS_1__ = TRUE
__OPTIMIZATIONS_3__ = TRUE
ENDC
IF (VERSION > 1)
__PATCH_4__ = TRUE
__RECALCULATE_MAX_HEARTS__ = TRUE
ENDC

ELIF ("{LANG}" == "EN")
LANG_EN = TRUE
FILE_28 = $28
FILE_6C = $6C
FILE_2C = $2C
FILE_64 = $64
EASTER_EGG_FILENAME_1 equs "ZELDA"
EASTER_EGG_SONG_1 equ $60 ; MUSIC_FILE_SELECT_ZELDA
THIEF_NAME equs "THIEF"
__SPLIT_KEY_CAVERN_MAP__ = FALSE
IF (VERSION > 0)
__PATCH_0__ = TRUE
__PATCH_3__ = TRUE
__OPTIMIZATIONS_1__ = TRUE
__OPTIMIZATIONS_3__ = TRUE
ENDC
IF (VERSION > 1)
__PATCH_2__ = TRUE
__PATCH_4__ = TRUE
__RECALCULATE_MAX_HEARTS__ = TRUE
ENDC

ELIF ("{LANG}" == "FR")
LANG_FR = TRUE
FILE_28 = $1E
FILE_6C = $6D
FILE_2C = $2E
FILE_64 = $68
EASTER_EGG_FILENAME_1 equs "LOLO"
EASTER_EGG_SONG_1 equ $60 ; MUSIC_FILE_SELECT_ZELDA
THIEF_NAME equs "VOYOU"
MINIMAP_VAR_1 = $B1
MINIMAP_VAR_2 = $B1
CREDITS_VAR_0 = $1E
CREDITS_VAR_1 = $1F
CREDITS_VAR_2 = $13
GAMEOVER_OPTION_SAVE_CONTINUE_Y equ 56
GAMEOVER_OPTION_SAVE_QUIT_Y equ 80
GAMEOVER_OPTION_CONTINUE_Y equ 104
__PATCH_0__ = TRUE
__PATCH_1__ = TRUE
__PATCH_2__ = TRUE
__OPTIMIZATIONS_1__ = TRUE
IF (VERSION > 0)
__PATCH_4__ = TRUE
__RECALCULATE_MAX_HEARTS__ = TRUE
ENDC
__SKIP_DIALOG_SUPPORT__ = TRUE
__WEAK_GENIE__ = TRUE

ELIF ("{LANG}" == "DE")
LANG_DE = TRUE
FILE_28 = $1E
FILE_6C = $66
FILE_2C = $2E
FILE_64 = $66

EASTER_EGG_FILENAME_1 equs "MOYSE"
EASTER_EGG_SONG_1 equ $3C ; MUSIC_FILE_SELECT_TOTAKA
EASTER_EGG_FILENAME_2 equs "ZELDA"
EASTER_EGG_SONG_2 equ $60 ; MUSIC_FILE_SELECT_ZELDA
THIEF_NAME equs "DIEB"
MINIMAP_VAR_0 = $7F
MINIMAP_VAR_1 = $EC
CREDITS_VAR_0 = $1F
CREDITS_VAR_1 = $20
CREDITS_VAR_2 = $13
DEBUG_SAVE_SWITCH_ARROWS = TRUE
GAMEOVER_OPTION_X equ 20
__DIACRITICS_SUPPORT__ = TRUE
__PATCH_0__ = TRUE
__PATCH_1__ = TRUE
__PATCH_2__ = TRUE
__OPTIMIZATIONS_1__ = TRUE
__OPTIMIZATIONS_2__ = TRUE
__PATCH_A__ = 2
IF (VERSION > 0)
__PATCH_4__ = TRUE
__RECALCULATE_MAX_HEARTS__ = TRUE
ENDC
__SKIP_DIALOG_SUPPORT__ = TRUE
__WEAK_GENIE__ = TRUE
ENDC

IF !DEF(DEBUG_SAVE_BOMB_COUNT)
DEBUG_SAVE_BOMB_COUNT equ $60
ENDC

IF !DEF(DEBUG_SAVE_MAGIC_COUNT)
DEBUG_SAVE_MAGIC_COUNT equ $40
ENDC

IF !DEF(DEBUG_SAVE_FILE_NAME)
DEBUG_SAVE_FILE_NAME equs "ZELDA"
ENDC

macro SET_DEFAULT
IF !DEF(\1)
\1 equ \2
ENDC
endm

    SET_DEFAULT GAMEOVER_OPTION_X, 28
    SET_DEFAULT GAMEOVER_OPTION_SAVE_CONTINUE_Y, 64
    SET_DEFAULT GAMEOVER_OPTION_SAVE_QUIT_Y, 80
    SET_DEFAULT GAMEOVER_OPTION_CONTINUE_Y, 96
    SET_DEFAULT SAVE_OPTION_X, 28
