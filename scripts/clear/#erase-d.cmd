@echo off
REM Keszitette: Tim Andras @ 2010

if "%mappa%" == "" exit
set voltakFajlok=false
if exist "%mappa%\desktop.ini" goto backup
goto clean

:backup
set voltakFajlok=true
attrib "%mappa%\desktop.ini" -s -h > "%null1%" 2> "%null2%"
move "%mappa%\desktop.ini" "%mappa%_tmp_desktop.ini" > "%null1%" 2> "%null2%"

:clean
for /R "%mappa%" /D %%m in (*) do (
    rmdir /s /q "%%m" > "%null1%" 2> "%null2%"
    for %%f in ("%%m\*") do (
        del /f /s /a /q "%%f" > "%null1%" 2> "%null2%"
    )
)
for %%f in ("%mappa%\*") do (
    del /f /s /a /q "%%f" > "%null1%" 2> "%null2%"
)

if "%voltakFajlok%" == "true" goto restore
goto vege

:restore
move "%mappa%_tmp_desktop.ini" "%mappa%\desktop.ini" > "%null1%" 2> "%null2%"
attrib "%mappa%\desktop.ini" +s +h > "%null1%" 2> "%null2%"

:vege