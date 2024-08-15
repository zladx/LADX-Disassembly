; Entry point for the Sfx sound system
SoundSystemInit::
    jp   _SoundSystemInit                         ;; 1F:4000 $C3 $09 $40

func_01F_4003::
    jp   func_01F_7B5C                            ;; 1F:4003 $C3 $5C $7B

PlaySfx::
    jp   _PlaySfx                                 ;; 1F:4006 $C3 $1E $40

_SoundSystemInit::
    ; Clear 16 bytes of memory, starting from wAudioSection
    ld   hl, wAudioSection                        ;; 1F:4009 $21 $00 $D3
.loop
    ld   [hl], $00                                ;; 1F:400C $36 $00
    inc  l                                        ;; 1F:400E $2C
    jr   nz, .loop                                ;; 1F:400F $20 $FB

    ld   a, $80                                   ;; 1F:4011 $3E $80
    ldh  [rNR52], a                               ;; 1F:4013 $E0 $26
    ld   a, $77                                   ;; 1F:4015 $3E $77
    ldh  [rNR50], a                               ;; 1F:4017 $E0 $24
    ld   a, $FF                                   ;; 1F:4019 $3E $FF
    ldh  [rNR51], a                               ;; 1F:401B $E0 $25
    ret                                           ;; 1F:401D $C9

_PlaySfx::
    call PlayActiveJingle                         ;; 1F:401E $CD $04 $42
    call PlayActiveWaveSfx                        ;; 1F:4021 $CD $ED $53
    call PlayActiveNoiseSfx                       ;; 1F:4024 $CD $EC $64
    xor  a                                        ;; 1F:4027 $AF
    ld   [wActiveJingle], a                       ;; 1F:4028 $EA $60 $D3
    ld   [wActiveWaveSfx], a                      ;; 1F:402B $EA $70 $D3
    ld   [wActiveNoiseSfx], a                     ;; 1F:402E $EA $78 $D3
    ret                                           ;; 1F:4031 $C9
