; Some bank numbers have the high bit set. This is a flag that
; marks the dialog as unskippable; otherwise, the dialog can
; be skipped with the B button. This is only relevant if
; __SKIP_DIALOG_SUPPORT__ is enabled; if not, all dialog is
; unskippable (the routine DialogDrawNextCharacterHandler
; does `and $1f`, so the bit is dropped).
;
; All textboxes with a prompt - e.g. 'yes/no', or a red
; 'press a button to continue' arrow - are unskippable.

DialogBankTable::
; dialog_1.asm starts here
    db BANK(Dialog000)
    db BANK(Dialog001) | DIALOG_UNSKIPPABLE
    db BANK(Dialog002)
    db BANK(Dialog003)
    db BANK(Dialog004)
    db BANK(Dialog005)
    db BANK(Dialog006)
    db BANK(Dialog007)
    db BANK(Dialog008)
    db BANK(Dialog009)
    db BANK(Dialog00A)
    db BANK(Dialog00B)
    db BANK(Dialog00C)
    db BANK(Dialog00D)
    db BANK(Dialog00E)
    db BANK(Dialog00F) | DIALOG_UNSKIPPABLE
    db BANK(Dialog010)
    db BANK(Dialog011)
    db BANK(Dialog012)
    db BANK(Dialog013) | DIALOG_UNSKIPPABLE
    db BANK(Dialog014)
    db BANK(Dialog015)
    db BANK(Dialog016) | DIALOG_UNSKIPPABLE
    db BANK(Dialog017)
    db BANK(Dialog018)
    db BANK(Dialog019)
    db BANK(Dialog01A)
    db BANK(Dialog01B)
    db BANK(Dialog01C)
    db BANK(Dialog01D)
    db BANK(Dialog01E)
    db BANK(Dialog01F)
    db BANK(Dialog020)
    db BANK(Dialog021)
    db BANK(Dialog022)
    db BANK(Dialog023)
    db BANK(Dialog024)
    db BANK(Dialog025)
    db BANK(Dialog026) | DIALOG_UNSKIPPABLE
    db BANK(Dialog027)
    db BANK(Dialog028)
    db BANK(Dialog029)
    db BANK(Dialog02A)
    db BANK(Dialog02B)
    db BANK(Dialog02C)
    db BANK(Dialog02D)
    db BANK(Dialog02E)
    db BANK(Dialog02F)
    db BANK(Dialog030)
    db BANK(Dialog031)
    db BANK(Dialog032)
    db BANK(Dialog033)
    db BANK(Dialog034)
    db BANK(Dialog035)
    db BANK(Dialog036) | DIALOG_UNSKIPPABLE
    db BANK(Dialog037)
    db BANK(Dialog038) | DIALOG_UNSKIPPABLE
    db BANK(Dialog039)
    db BANK(Dialog03A)
    db BANK(Dialog03B)
    db BANK(Dialog03C)
    db BANK(Dialog03D)
    db BANK(Dialog03E)
    db BANK(Dialog03F)
    db BANK(Dialog040)
    db BANK(Dialog041)
    db BANK(Dialog042)
    db BANK(Dialog043)
    db BANK(Dialog044)
    db BANK(Dialog045) | DIALOG_UNSKIPPABLE
    db BANK(Dialog046) | DIALOG_UNSKIPPABLE
    db BANK(Dialog047) | DIALOG_UNSKIPPABLE
    db BANK(Dialog048) | DIALOG_UNSKIPPABLE
    db BANK(Dialog049) | DIALOG_UNSKIPPABLE
    db BANK(Dialog04A) | DIALOG_UNSKIPPABLE
    db BANK(Dialog04B) | DIALOG_UNSKIPPABLE
    db BANK(Dialog04C) | DIALOG_UNSKIPPABLE
    db BANK(Dialog04D) | DIALOG_UNSKIPPABLE
    db BANK(Dialog04E) | DIALOG_UNSKIPPABLE
    db BANK(Dialog04F) | DIALOG_UNSKIPPABLE
    db BANK(Dialog050) | DIALOG_UNSKIPPABLE
    db BANK(Dialog051) | DIALOG_UNSKIPPABLE
    db BANK(Dialog052) | DIALOG_UNSKIPPABLE
    db BANK(Dialog053) | DIALOG_UNSKIPPABLE
    db BANK(Dialog054) | DIALOG_UNSKIPPABLE
    db BANK(Dialog055)
    db BANK(Dialog056)
    db BANK(Dialog057)
    db BANK(Dialog058)
    db BANK(Dialog059)
    db BANK(Dialog05A)
    db BANK(Dialog05B)
    db BANK(Dialog05C)
    db BANK(Dialog05D)
    db BANK(Dialog05E)
    db BANK(Dialog05F)
    db BANK(Dialog060)
    db BANK(Dialog061)
    db BANK(Dialog062)
    db BANK(Dialog063)
    db BANK(Dialog064)
    db BANK(Dialog065)
    db BANK(Dialog066)
    db BANK(Dialog067)
    db BANK(Dialog068)
    db BANK(Dialog069)
    db BANK(Dialog06A)
    db BANK(Dialog06B)
    db BANK(Dialog06C)
    db BANK(Dialog06D)
    db BANK(Dialog06E)
    db BANK(Dialog06F)
    db BANK(Dialog070)
    db BANK(Dialog071)
    db BANK(Dialog072)
    db BANK(Dialog073)
    db BANK(Dialog074)
    db BANK(Dialog075)
    db BANK(Dialog076)
    db BANK(Dialog077)
    db BANK(Dialog078)
    db BANK(Dialog079)
    db BANK(Dialog07A)
    db BANK(Dialog07B)
    db BANK(Dialog07C)
    db BANK(Dialog07D)
    db BANK(Dialog07E)
    db BANK(Dialog07F)
    db BANK(Dialog080)
    db BANK(Dialog081)
    db BANK(Dialog082)
    db BANK(Dialog083)
    db BANK(Dialog084)
    db BANK(Dialog085)
    db BANK(Dialog086)
    db BANK(Dialog087)
    db BANK(Dialog088)
    db BANK(Dialog089)
    db BANK(Dialog08A)
    db BANK(Dialog08B)
    db BANK(Dialog08C)
    db BANK(Dialog08D)
    db BANK(Dialog08E)
    db BANK(Dialog08F)
    db BANK(Dialog090) | DIALOG_UNSKIPPABLE
    db BANK(Dialog091) | DIALOG_UNSKIPPABLE
    db BANK(Dialog092) | DIALOG_UNSKIPPABLE
    db BANK(Dialog093) | DIALOG_UNSKIPPABLE
    db BANK(Dialog094) | DIALOG_UNSKIPPABLE
    db BANK(Dialog095) | DIALOG_UNSKIPPABLE
    db BANK(Dialog096) | DIALOG_UNSKIPPABLE
    db BANK(Dialog097) | DIALOG_UNSKIPPABLE
    db BANK(Dialog098) | DIALOG_UNSKIPPABLE
    db BANK(Dialog099) | DIALOG_UNSKIPPABLE
    db BANK(Dialog09A) | DIALOG_UNSKIPPABLE
    db BANK(Dialog09B) | DIALOG_UNSKIPPABLE
    db BANK(Dialog09C) | DIALOG_UNSKIPPABLE
    db BANK(Dialog09D) | DIALOG_UNSKIPPABLE
    db BANK(Dialog09E) | DIALOG_UNSKIPPABLE
    db BANK(Dialog09F) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0A0) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0A1) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0A2) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0A3) | DIALOG_UNSKIPPABLE

; dialog_2.asm starts here
    db BANK(Dialog0A4) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0A5) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0A6) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0A7) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0A8) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0A9) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0AA) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0AB) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0AC) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0AD) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0AE) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0AF) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0B0) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0B1) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0B2) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0B3) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0B4) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0B5) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0B6) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0B7) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0B8) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0B9) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0BA) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0BB) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0BC) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0BD) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0BE) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0BF) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0C0) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0C1) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0C2) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0C3) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0C4) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0C5) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0C6) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0C7) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0C8) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0C9) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0CA) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0CB) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0CC) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0CD) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0CE) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0CF) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0D0) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0D1) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0D2) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0D3) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0D4) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0D5) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0D6) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0D7) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0D8) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0D9) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0DA)
    db BANK(Dialog0DB)
    db BANK(Dialog0DC) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0DD)
    db BANK(Dialog0DE)
    db BANK(Dialog0DF)
    db BANK(Dialog0E0)
    db BANK(Dialog0E1) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0E2) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0E3) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0E4) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0E5) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0E6)
    db BANK(Dialog0E7)
    db BANK(Dialog0E8)
    db BANK(Dialog0E9) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0EA)
    db BANK(Dialog0EB)
    db BANK(Dialog0EC)
    db BANK(Dialog0ED)
    db BANK(Dialog0EE)
    db BANK(Dialog0EF)
    db BANK(Dialog0F0)
    db BANK(Dialog0F1)
    db BANK(Dialog0F2)
    db BANK(Dialog0F3)
    db BANK(Dialog0F4)
    db BANK(Dialog0F5) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0F6) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0F7) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0F8)
    db BANK(Dialog0F9)
    db BANK(Dialog0FA)
    db BANK(Dialog0FB)
    db BANK(Dialog0FC)
    db BANK(Dialog0FD)
    db BANK(Dialog0FE) | DIALOG_UNSKIPPABLE
    db BANK(Dialog0FF)
    db BANK(Dialog100)
    db BANK(Dialog101)
    db BANK(Dialog102)
    db BANK(Dialog103)
    db BANK(Dialog104)
    db BANK(Dialog105)
    db BANK(Dialog106)
    db BANK(Dialog107)

; dialog_3.asm starts here
    db BANK(Dialog108) | DIALOG_UNSKIPPABLE
    db BANK(Dialog109) | DIALOG_UNSKIPPABLE
    db BANK(Dialog10A) | DIALOG_UNSKIPPABLE
    db BANK(Dialog10B) | DIALOG_UNSKIPPABLE
    db BANK(Dialog10C) | DIALOG_UNSKIPPABLE
    db BANK(Dialog10D) | DIALOG_UNSKIPPABLE
    db BANK(Dialog10E) | DIALOG_UNSKIPPABLE
    db BANK(Dialog10F) | DIALOG_UNSKIPPABLE
    db BANK(Dialog110) | DIALOG_UNSKIPPABLE
    db BANK(Dialog111) | DIALOG_UNSKIPPABLE
    db BANK(Dialog112)
    db BANK(Dialog113)
    db BANK(Dialog114)
    db BANK(Dialog115)
    db BANK(Dialog116)
    db BANK(Dialog117)
    db BANK(Dialog118)
    db BANK(Dialog119)
    db BANK(Dialog11A)
    db BANK(Dialog11B)
    db BANK(Dialog11C)
    db BANK(Dialog11D)
    db BANK(Dialog11E)
    db BANK(Dialog11F)
    db BANK(Dialog120)
    db BANK(Dialog121)
    db BANK(Dialog122)
    db BANK(Dialog123)
    db BANK(Dialog124)
    db BANK(Dialog125)
    db BANK(Dialog126)
    db BANK(Dialog127)
    db BANK(Dialog128)
    db BANK(Dialog129)
    db BANK(Dialog12A)
    db BANK(Dialog12B)
    db BANK(Dialog12C)
    db BANK(Dialog12D)
    db BANK(Dialog12E)
    db BANK(Dialog12F)
    db BANK(Dialog130)
    db BANK(Dialog131)
    db BANK(Dialog132)
    db BANK(Dialog133)
    db BANK(Dialog134)
    db BANK(Dialog135)
    db BANK(Dialog136)
    db BANK(Dialog137)
    db BANK(Dialog138)
    db BANK(Dialog139)
    db BANK(Dialog13A)
    db BANK(Dialog13B)
    db BANK(Dialog13C)
    db BANK(Dialog13D)
    db BANK(Dialog13E)
    db BANK(Dialog13F)
    db BANK(Dialog140)
    db BANK(Dialog141)
    db BANK(Dialog142)
    db BANK(Dialog143)
    db BANK(Dialog144)
    db BANK(Dialog145)
    db BANK(Dialog146)
    db BANK(Dialog147)
    db BANK(Dialog148)
    db BANK(Dialog149)
    db BANK(Dialog14A)
    db BANK(Dialog14B)
    db BANK(Dialog14C)
    db BANK(Dialog14D)
    db BANK(Dialog14E)
    db BANK(Dialog14F)
    db BANK(Dialog150)
    db BANK(Dialog151)
    db BANK(Dialog152)
    db BANK(Dialog153)
    db BANK(Dialog154)
    db BANK(Dialog155)
    db BANK(Dialog156)
    db BANK(Dialog157)
    db BANK(Dialog158)
    db BANK(Dialog159)
    db BANK(Dialog15A)
    db BANK(Dialog15B)
    db BANK(Dialog15C)
    db BANK(Dialog15D)
    db BANK(Dialog15E)
    db BANK(Dialog15F)
    db BANK(Dialog160)
    db BANK(Dialog161)
    db BANK(Dialog162)
    db BANK(Dialog163)
    db BANK(Dialog164)
    db BANK(Dialog165)
    db BANK(Dialog166)
    db BANK(Dialog167) | DIALOG_UNSKIPPABLE
    db BANK(Dialog168)
    db BANK(Dialog169)
    db BANK(Dialog16A)
    db BANK(Dialog16B)
    db BANK(Dialog16C)
    db BANK(Dialog16D)
    db BANK(Dialog16E)
    db BANK(Dialog16F)
    db BANK(Dialog170)
    db BANK(Dialog171)
    db BANK(Dialog172)
    db BANK(Dialog173)
    db BANK(Dialog174)
    db BANK(Dialog175)
    db BANK(Dialog176)
    db BANK(Dialog177)
    db BANK(Dialog178)
    db BANK(Dialog179)
    db BANK(Dialog17A)
    db BANK(Dialog17B)
    db BANK(Dialog17C)
    db BANK(Dialog17D)
    db BANK(Dialog17E)
    db BANK(Dialog17F)
    db BANK(Dialog180)
    db BANK(Dialog181)
    db BANK(Dialog182)
    db BANK(Dialog183)
    db BANK(Dialog184)
    db BANK(Dialog185)
    db BANK(Dialog186)
    db BANK(Dialog187)
    db BANK(Dialog188)
    db BANK(Dialog189)
    db BANK(Dialog18A)
    db BANK(Dialog18B)
    db BANK(Dialog18C)
    db BANK(Dialog18D)
    db BANK(Dialog18E)
    db BANK(Dialog18F)

; dialog_4.asm starts here
    db BANK(Dialog190)
    db BANK(Dialog191) | DIALOG_UNSKIPPABLE
    db BANK(Dialog192)
    db BANK(Dialog193)
    db BANK(Dialog194) | DIALOG_UNSKIPPABLE
    db BANK(Dialog195)
    db BANK(Dialog196)
    db BANK(Dialog197)
    db BANK(Dialog198)
    db BANK(Dialog199)
    db BANK(Dialog19A)
    db BANK(Dialog19B)
    db BANK(Dialog19C)
    db BANK(Dialog19D)
    db BANK(Dialog19E)
    db BANK(Dialog19F)
    db BANK(Dialog1A0)
    db BANK(Dialog1A1)
    db BANK(Dialog1A2)
    db BANK(Dialog1A3)
    db BANK(Dialog1A4)
    db BANK(Dialog1A5)
    db BANK(Dialog1A6)
    db BANK(Dialog1A7)
    db BANK(Dialog1A8)
    db BANK(Dialog1A9)
    db BANK(Dialog1AA)
    db BANK(Dialog1AB)
    db BANK(Dialog1AC)
    db BANK(Dialog1AD)
    db BANK(Dialog1AE)
    db BANK(Dialog1AF)
    db BANK(Dialog1B0)
    db BANK(Dialog1B1)
    db BANK(Dialog1B2)
    db BANK(Dialog1B3)
    db BANK(Dialog1B4)
    db BANK(Dialog1B5)
    db BANK(Dialog1B6)
    db BANK(Dialog1B7)
    db BANK(Dialog1B8)
    db BANK(Dialog1B9)
    db BANK(Dialog1BA)
    db BANK(Dialog1BB)
    db BANK(Dialog1BC)
    db BANK(Dialog1BD)
    db BANK(Dialog1BE)
    db BANK(Dialog1BF)
    db BANK(Dialog1C0)
    db BANK(Dialog1C1) | DIALOG_UNSKIPPABLE
    db BANK(Dialog1C2)
    db BANK(Dialog1C3)
    db BANK(Dialog1C4)
    db BANK(Dialog1C5)
    db BANK(Dialog1C6)
    db BANK(Dialog1C7)
    db BANK(Dialog1C8)
    db BANK(Dialog1C9)
    db BANK(Dialog1CA)
    db BANK(Dialog1CB)
    db BANK(Dialog1CC)
    db BANK(Dialog1CD)
    db BANK(Dialog1CE)
    db BANK(Dialog1CF)
    db BANK(Dialog1D0)
    db BANK(Dialog1D1)
    db BANK(Dialog1D2)
    db BANK(Dialog1D3)
    db BANK(Dialog1D4)
    db BANK(Dialog1D5) | DIALOG_UNSKIPPABLE
    db BANK(Dialog1D6)
    db BANK(Dialog1D7)
    db BANK(Dialog1D8) | DIALOG_UNSKIPPABLE
    db BANK(Dialog1D9) | DIALOG_UNSKIPPABLE
    db BANK(Dialog1DA)
    db BANK(Dialog1DB)
    db BANK(Dialog1DC)
    db BANK(Dialog1DD)
    db BANK(Dialog1DE)
    db BANK(Dialog1DF)
    db BANK(Dialog1E0)
    db BANK(Dialog1E1)
    db BANK(Dialog1E2)
    db BANK(Dialog1E3)
    db BANK(Dialog1E4)
    db BANK(Dialog1E5)
    db BANK(Dialog1E6)
    db BANK(Dialog1E7)
    db BANK(Dialog1E8)
    db BANK(Dialog1E9)
    db BANK(Dialog1EA)
    db BANK(Dialog1EB) | DIALOG_UNSKIPPABLE
    db BANK(Dialog1EC)
    db BANK(Dialog1ED)
    db BANK(Dialog1EE)
    db BANK(Dialog1EF)
    db BANK(Dialog1F0)
    db BANK(Dialog1F1)
    db BANK(Dialog1F2)
    db BANK(Dialog1F3)
    db BANK(Dialog1F4)
    db BANK(Dialog1F5) | DIALOG_UNSKIPPABLE
    db BANK(Dialog1F6)
    db BANK(Dialog1F7)
    db BANK(Dialog1F8)
    db BANK(Dialog1F9)
    db BANK(Dialog1FA)
    db BANK(Dialog1FB)
    db BANK(Dialog1FC)
    db BANK(Dialog1FD)
    db BANK(Dialog1FE) | DIALOG_UNSKIPPABLE
    db BANK(Dialog1FF) | DIALOG_UNSKIPPABLE
    db BANK(Dialog200)
    db BANK(Dialog201)
    db BANK(Dialog202)
    db BANK(Dialog203)
    db BANK(Dialog204)
    db BANK(Dialog205)
    db BANK(Dialog206)
    db BANK(Dialog207)
    db BANK(Dialog208)
    db BANK(Dialog209)
    db BANK(Dialog20A)
    db BANK(Dialog20B)
    db BANK(Dialog20C)
    db BANK(Dialog20D)
    db BANK(Dialog20E)
    db BANK(Dialog20F)
    db BANK(Dialog210) | DIALOG_UNSKIPPABLE
    db BANK(Dialog211) | DIALOG_UNSKIPPABLE
    db BANK(Dialog212)
    db BANK(Dialog213) | DIALOG_UNSKIPPABLE
    db BANK(Dialog214) | DIALOG_UNSKIPPABLE
    db BANK(Dialog215) | DIALOG_UNSKIPPABLE
    db BANK(Dialog216) | DIALOG_UNSKIPPABLE
    db BANK(Dialog217)
    db BANK(Dialog218)
    db BANK(Dialog219)
    db BANK(Dialog21A)
    db BANK(Dialog21B)
    db BANK(Dialog21C)
    db BANK(Dialog21D)
    db BANK(Dialog21E)
    db BANK(Dialog21F)
    db BANK(Dialog220)
    db BANK(Dialog221)
    db BANK(Dialog222)
    db BANK(Dialog223)
    db BANK(Dialog224)
    db BANK(Dialog225)
    db BANK(Dialog226)
    db BANK(Dialog227)
    db BANK(Dialog228)
    db BANK(Dialog229)
    db BANK(Dialog22A)
    db BANK(Dialog22B)
    db BANK(Dialog22C)
    db BANK(Dialog22D)
    db BANK(Dialog22E)
    db BANK(Dialog22F)
    db BANK(Dialog230)
    db BANK(Dialog231)
    db BANK(Dialog232)
    db BANK(Dialog233)
    db BANK(Dialog234)
    db BANK(Dialog235) | DIALOG_UNSKIPPABLE
    db BANK(Dialog236) | DIALOG_UNSKIPPABLE
    db BANK(Dialog237) | DIALOG_UNSKIPPABLE
    db BANK(Dialog238) | DIALOG_UNSKIPPABLE
    db BANK(Dialog239) | DIALOG_UNSKIPPABLE
    db BANK(Dialog23A) | DIALOG_UNSKIPPABLE
    db BANK(Dialog23B) | DIALOG_UNSKIPPABLE
    db BANK(Dialog23C)
    db BANK(Dialog23D)
    db BANK(Dialog23E)
    db BANK(Dialog23F)
    db BANK(Dialog240)
    db BANK(Dialog241)
    db BANK(Dialog242)
    db BANK(Dialog243)
    db BANK(Dialog244)
    db BANK(Dialog245)
    db BANK(Dialog246)
    db BANK(Dialog247)
    db BANK(Dialog248)
    db BANK(Dialog249)
    db BANK(Dialog24A)
    db BANK(Dialog24B)
    db BANK(Dialog24C)
    db BANK(Dialog24D)

; dialog_dx.asm starts here
    db BANK(Dialog24E)
    db BANK(Dialog24F)
    db BANK(Dialog250)
    db BANK(Dialog251)
    db BANK(Dialog252)
    db BANK(Dialog253)
    db BANK(Dialog254)
    db BANK(Dialog255)
    db BANK(Dialog256)
    db BANK(Dialog257)
    db BANK(Dialog258)
    db BANK(Dialog259)
    db BANK(Dialog25A) | DIALOG_UNSKIPPABLE
    db BANK(Dialog25B) | DIALOG_UNSKIPPABLE
    db BANK(Dialog25C) | DIALOG_UNSKIPPABLE
    db BANK(Dialog25D) | DIALOG_UNSKIPPABLE
    db BANK(Dialog25E)
    db BANK(Dialog25F)
    db BANK(Dialog260)
    db BANK(Dialog261)
    db BANK(Dialog262)
    db BANK(Dialog263)
    db BANK(Dialog264)
    db BANK(Dialog265)
    db BANK(Dialog266)
    db BANK(Dialog267)
    db BANK(Dialog268) | DIALOG_UNSKIPPABLE
    db BANK(Dialog269)
    db BANK(Dialog26A)
    db BANK(Dialog26B) | DIALOG_UNSKIPPABLE
    db BANK(Dialog26C) | DIALOG_UNSKIPPABLE
    db BANK(Dialog26D)
    db BANK(Dialog26E)
    db BANK(Dialog26F)
    db BANK(Dialog270)
    db BANK(Dialog271)
    db BANK(Dialog272)
    db BANK(Dialog273)
    db BANK(Dialog274)
    db BANK(Dialog275)
    db BANK(Dialog276)
    db BANK(Dialog277)
    db BANK(Dialog278)
    db BANK(Dialog279)
    db BANK(Dialog27A)
    db BANK(Dialog27B)
    db BANK(Dialog27C)
    db BANK(Dialog27D)
    db BANK(Dialog27E)
    db BANK(Dialog27F)
    db BANK(Dialog280) | DIALOG_UNSKIPPABLE
    db BANK(Dialog281) | DIALOG_UNSKIPPABLE
    db BANK(Dialog282) | DIALOG_UNSKIPPABLE
    db BANK(Dialog283) | DIALOG_UNSKIPPABLE
    db BANK(Dialog284) | DIALOG_UNSKIPPABLE
    db BANK(Dialog285) | DIALOG_UNSKIPPABLE
    db BANK(Dialog286) | DIALOG_UNSKIPPABLE
    db BANK(Dialog287) | DIALOG_UNSKIPPABLE
    db BANK(Dialog288) | DIALOG_UNSKIPPABLE
    db BANK(Dialog289) | DIALOG_UNSKIPPABLE
    db BANK(Dialog28A) | DIALOG_UNSKIPPABLE
    db BANK(Dialog28B) | DIALOG_UNSKIPPABLE
    db BANK(Dialog28C) | DIALOG_UNSKIPPABLE
    db BANK(Dialog28D) | DIALOG_UNSKIPPABLE
    db BANK(Dialog28E) | DIALOG_UNSKIPPABLE
    db BANK(Dialog28F) | DIALOG_UNSKIPPABLE
    db BANK(Dialog290) | DIALOG_UNSKIPPABLE
    db BANK(Dialog291) | DIALOG_UNSKIPPABLE
    db BANK(Dialog292) | DIALOG_UNSKIPPABLE
    db BANK(Dialog293) | DIALOG_UNSKIPPABLE
    db BANK(Dialog294) | DIALOG_UNSKIPPABLE
    db BANK(Dialog295) | DIALOG_UNSKIPPABLE
    db BANK(Dialog296)
    db BANK(Dialog297)
    db BANK(Dialog298) | DIALOG_UNSKIPPABLE
    db BANK(Dialog299) | DIALOG_UNSKIPPABLE
    db BANK(Dialog29A) | DIALOG_UNSKIPPABLE
    db BANK(Dialog29B) | DIALOG_UNSKIPPABLE
    db BANK(Dialog29C) | DIALOG_UNSKIPPABLE
    db BANK(Dialog29D) | DIALOG_UNSKIPPABLE
    db BANK(Dialog29E) | DIALOG_UNSKIPPABLE
    db BANK(Dialog29F) | DIALOG_UNSKIPPABLE
    db BANK(Dialog2A0) | DIALOG_UNSKIPPABLE
    db BANK(Dialog2A1) | DIALOG_UNSKIPPABLE
    db BANK(Dialog2A2) | DIALOG_UNSKIPPABLE
    db BANK(Dialog2A3) | DIALOG_UNSKIPPABLE
    db BANK(Dialog2A4) | DIALOG_UNSKIPPABLE
    db BANK(Dialog2A5) | DIALOG_UNSKIPPABLE
    db BANK(Dialog2A6)
    db BANK(Dialog2A7)
    db BANK(Dialog2A8)
    db BANK(Dialog2A9)
    db BANK(Dialog2AA)
    db BANK(Dialog2AB)
    db BANK(Dialog2AC)
    db BANK(Dialog2AD)
    db BANK(Dialog2AE)
    db BANK(Dialog2AF) | DIALOG_UNSKIPPABLE
