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

BANK_1C_VAR = 1

__PATCH_0__ = FALSE ; Applies to JP1+, EN1+, DE, FR
__PATCH_1__ = FALSE ; Applies to DE, FR
__PATCH_2__ = FALSE ; Applies to DE, JP1+, EN2+, FR
__PATCH_3__ = FALSE ; Applies to JP1+, EN1+
__PATCH_4__ = FALSE ; Applies to DE1+, JP2+, EN2+, FR1+
__PATCH_5__ = FALSE ; Applies to DE
__PATCH_6__ = FALSE ; Applies to JP
__PATCH_7__ = FALSE ; Applies to FR
__PATCH_8__ = FALSE ; Applies to JP1+
__PATCH_9__ = FALSE ; Applies to DE, JP
__PATCH_A__ = 0 ; 1 in JP, 2 in DE
__PATCH_B__ = 0 ; 1 in JP/DE, 2 in FR
__PATCH_C__ = FALSE ; Applies to EN
__DO_CHECK_DAKUTEN__ = FALSE ; TRUE in JP, DE
__USE_FIXED_DIALOG_BANKS__ = FALSE ; TRUE in JP

; Default values
MINIMAP_VAR_0 = $EC
MINIMAP_VAR_1 = $E8
MINIMAP_VAR_2 = $E8
DEBUG_SAVE_SWITCH_ARROWS = FALSE
CREDITS_VAR_0 = $1A
CREDITS_VAR_1 = $1B
CREDITS_VAR_2 = $0F

IF ("{LANG}" == "JP")
FILE_28 = $14
FILE_6C = $6C
FILE_2C = $54
FILE_64 = $74
EASTER_EGG_FILENAME_1 equs "ぜるだ" ; Zelda
EASTER_EGG_SONG_1 equ $60 ; MUSIC_ZELDA_NICKNAME_EASTER_EGG
EASTER_EGG_FILENAME_2 equs "とたけけ" ; Totakeke
EASTER_EGG_SONG_2 equ $3C ; MUSIC_TOTAKEKE_NICKNAME_EASTER_EGG
THIEF_NAME equs "どろぼ－"
DEBUG_SAVE_FILE_NAME equs "えすばはら"
BANK_1C_VAR = 0
DEBUG_SAVE_BOMB_COUNT equ $59
DEBUG_SAVE_MAGIC_COUNT equ $39
DEBUG_SAVE_SWITCH_ARROWS = TRUE
GAMEOVER_OPTION_SAVE_CONTINUE_Y equ 72
GAMEOVER_OPTION_SAVE_QUIT_Y equ 88
GAMEOVER_OPTION_CONTINUE_Y equ 104
SAVE_OPTION_X equ 36
__USE_FIXED_DIALOG_BANKS__ = TRUE
__DO_CHECK_DAKUTEN__ = TRUE
__PATCH_6__ = TRUE
__PATCH_9__ = TRUE
__PATCH_A__ = 1
__PATCH_B__ = 1
IF (VERSION > 0)
__PATCH_0__ = TRUE
__PATCH_2__ = TRUE
__PATCH_3__ = TRUE
__PATCH_8__ = TRUE
ENDC
IF (VERSION > 1)
__PATCH_4__ = TRUE
ENDC
ELIF ("{LANG}" == "EN")
FILE_28 = $28
FILE_6C = $6C
FILE_2C = $2C
FILE_64 = $64
EASTER_EGG_FILENAME_1 equs "ZELDA"
EASTER_EGG_SONG_1 equ $60 ; MUSIC_ZELDA_NICKNAME_EASTER_EGG
THIEF_NAME equs "THIEF"
__PATCH_C__ = TRUE
IF (VERSION > 0)
__PATCH_0__ = TRUE
__PATCH_3__ = TRUE
ENDC
IF (VERSION > 1)
__PATCH_2__ = TRUE
__PATCH_4__ = TRUE
ENDC
ELIF ("{LANG}" == "FR")
FILE_28 = $1E
FILE_6C = $6D
FILE_2C = $2E
FILE_64 = $68
EASTER_EGG_FILENAME_1 equs "LOLO"
EASTER_EGG_SONG_1 equ $60 ; MUSIC_ZELDA_NICKNAME_EASTER_EGG
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
__PATCH_7__ = TRUE
__PATCH_B__ = 2
IF (VERSION > 0)
__PATCH_4__ = TRUE
ENDC
ELIF ("{LANG}" == "DE")
FILE_28 = $1E
FILE_6C = $66
FILE_2C = $2E
FILE_64 = $66

EASTER_EGG_FILENAME_1 equs "MOYSE"
EASTER_EGG_SONG_1 equ $3C ; MUSIC_TOTAKEKE_NICKNAME_EASTER_EGG
EASTER_EGG_FILENAME_2 equs "ZELDA"
EASTER_EGG_SONG_2 equ $60 ; MUSIC_ZELDA_NICKNAME_EASTER_EGG
THIEF_NAME equs "DIEB"
MINIMAP_VAR_0 = $7F
MINIMAP_VAR_1 = $EC
CREDITS_VAR_0 = $1F
CREDITS_VAR_1 = $20
CREDITS_VAR_2 = $13
DEBUG_SAVE_SWITCH_ARROWS = TRUE
GAMEOVER_OPTION_X equ 20
__DO_CHECK_DAKUTEN__ = TRUE
__PATCH_0__ = TRUE
__PATCH_1__ = TRUE
__PATCH_2__ = TRUE
__PATCH_5__ = TRUE
__PATCH_9__ = TRUE
__PATCH_A__ = 2
__PATCH_B__ = 1
IF (VERSION > 0)
__PATCH_4__ = TRUE
ENDC
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

SET_DEFAULT: macro
IF !DEF(\1)
\1 equ \2
ENDC
endm

    SET_DEFAULT GAMEOVER_OPTION_X, 28
    SET_DEFAULT GAMEOVER_OPTION_SAVE_CONTINUE_Y, 64
    SET_DEFAULT GAMEOVER_OPTION_SAVE_QUIT_Y, 80
    SET_DEFAULT GAMEOVER_OPTION_CONTINUE_Y, 96
    SET_DEFAULT SAVE_OPTION_X, 28
