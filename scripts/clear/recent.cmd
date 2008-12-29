@echo off
REM Keszitette: Tim Andras @ 2008

echo  * Napl¢z¢ mapp†k År°tÇse...
echo      * Legut¢bbi dokumentumok...
set mappa=%USERPROFILE%\Recent
call "%aMAPP%\#erase-d.cmd"

echo      * BîngÇszÇsi elãzmÇnyek...
set mappa=%USERPROFILE%\Local Settings\History\History.IE5
call "%aMAPP%\#erase-d.cmd"