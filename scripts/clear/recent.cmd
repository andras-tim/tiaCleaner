@echo off
REM Keszitette: Tim Andras @ 2008

echo  * Napl�z� mapp�k �r�t�se...
echo      * Legut�bbi dokumentumok...
set mappa=%USERPROFILE%\Recent
call "%aMAPP%\#erase-d.cmd"

echo      * B�ng�sz�si el�zm�nyek...
set mappa=%USERPROFILE%\Local Settings\History\History.IE5
call "%aMAPP%\#erase-d.cmd"