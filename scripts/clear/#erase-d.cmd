@echo off
REM Keszitette: Tim Andras @ 2008

if "%mappa%" == "" exit
if not exist "%mappa%\desktop.ini" goto CsakTorol


attrib "%mappa%\desktop.ini" -s -h > "%null1%" 2> "%null2%"
move "%mappa%\desktop.ini" "%mappa%_desktop.ini" > "%null1%" 2> "%null2%"

rmdir /s /q "%mappa%" > "%null1%" 2> "%null2%"
mkdir "%mappa%" > "%null1%" 2> "%null2%"

move "%mappa%_desktop.ini" "%mappa%\desktop.ini" > "%null1%" 2> "%null2%"
attrib "%mappa%\desktop.ini" +s +h > "%null1%" 2> "%null2%"
goto vege

:CsakTorol
rmdir /s /q "%mappa%" > "%null1%" 2> "%null2%"
mkdir "%mappa%" > "%null1%" 2> "%null2%"

:vege