@echo off
REM Keszitette: Tim Andras @ 2009

echo  * Napl¢z¢ mapp k r¡t‚se...
echo      * Legut¢bbi dokumentumok...
set mappa=%USERPROFILE%\Recent
call "%aMAPP%\#erase-d.cmd"

echo      * B”ng‚sz‚si el‹zm‚nyek...
set mappa=%USERPROFILE%\Local Settings\History\History.IE5
call "%aMAPP%\#erase-d.cmd"

echo      * Registry takar¡t sa...
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f > "%null1%" 2> "%null2%"
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" > "%null1%"

REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Player\RecentFileList" /f > "%null1%" 2> "%null2%"
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Player\RecentFileList" > "%null1%"

REG DELETE "HKEY_CURRENT_USER\Software\TechSmith\SnagIt\8\Recent Captures" /f > "%null1%" 2> "%null2%"
REG ADD "HKEY_CURRENT_USER\Software\TechSmith\SnagIt\8\Recent Captures" > "%null1%"