; Abort if RGBDS version is too low
IF(!DEF(__RGBDS_MAJOR__) || !DEF(__RGBDS_MINOR__) || !DEF(__RGBDS_PATCH__))
FAIL "Requires RGBDS version >= 0.9.3"
ENDC
IF(__RGBDS_MAJOR__ == 0 && (__RGBDS_MINOR__ < 9 || (__RGBDS_MINOR__ == 9 && __RGBDS_PATCH__ < 3)))
FAIL "Requires RGBDS version >= 0.9.3, not {d:__RGBDS_MAJOR__}.{d:__RGBDS_MINOR__}.{d:__RGBDS_PATCH__}"
ENDC
