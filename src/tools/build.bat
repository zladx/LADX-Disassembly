@echo off
call "C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\amd64\vcvars64.bat"

cl -nologo -FC -Wall -wd4820 -wd4710 -Zi -D_CRT_SECURE_NO_WARNINGS Z80Dis.c
cl -nologo -FC -Wall -wd4820 -wd4710 -Zi -D_CRT_SECURE_NO_WARNINGS DumpBanks.c

