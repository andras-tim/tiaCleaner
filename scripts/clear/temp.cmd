@echo off
REM Keszitette: Tim Andras @ 2008

echo  * Ideiglenes mapp k r¡t‚se...
echo      * Alap‚rtelmezett...
set mappa=%TEMP%
call "%aMAPP%\#erase-d.cmd"

echo      * Lok lis...
set mappa=%USERPROFILE%\Local Settings\Temp
call "%aMAPP%\#erase-d.cmd"

echo      * Windows...
set mappa=%SYSTEMROOT%\Temp
call "%aMAPP%\#erase-d.cmd"

echo      * Programspecifikus...
rmdir /s /q "%WINDIR%\..\CloneDVDTemp" > "%null1%" 2> "%null2%"
rmdir /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files\Content.MSO" > "%null1%" 2> "%null2%"
rmdir /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files\Content.Word" > "%null1%" 2> "%null2%"
rmdir /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files\Content.Excel" > "%null1%" 2> "%null2%"
rmdir /s /q "%USERPROFILE%\Local Settings\Temporary Internet Files\OLK???" > "%null1%" 2> "%null2%"

rem del "%USERPROFILE%\Local Settings\Application Data\Google\GoogleEarth\dbCache.dat" > "%null1%" 2> "%null2%"
rem del "%USERPROFILE%\Local Settings\Application Data\Google\GoogleEarth\dbCache.dat.index" > "%null1%" 2> "%null2%"

rem MSOCache
start "" /wait "%aMAPP%\temp_seged.vbs"
call "%dirTMP%\tmp_clear_temp.cmd"
del "%dirTMP%\tmp_clear_temp.cmd"

rem Intel
rmdir /s /q "%WINDIR%\..\Intel\Logs" > "%null1%" 2> "%null2%"
rmdir "%WINDIR%\..\Intel" > "%null1%" 2> "%null2%