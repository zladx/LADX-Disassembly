IF (DEF(__RGBDS_MAJOR__) && DEF(__RGBDS_MINOR__) && DEF(__RGBDS_PATCH__))
    IF (__RGBDS_MAJOR__ > 0 || __RGBDS_MINOR__ >= 5)
        ; Distinguish RGBDS >= 0.5.0
        IF (DEF(MAJOR))
            PRINT "{d:__RGBDS_MAJOR__}"
        ELIF (DEF(MINOR))
            PRINT "{d:__RGBDS_MINOR__}"
        ELIF (DEF(PATCH))
            PRINT "{d:__RGBDS_PATCH__}"
        ENDC
    ELSE
        ; RGBDS < 0.5.0 did not support all of 'PRINT', 'd:', and 'ELIF'
        PRINTT "0"
    ENDC
ELSE
    ; RGBDS < 0.3.3 had no defined version
    PRINTT "0"
ENDC
