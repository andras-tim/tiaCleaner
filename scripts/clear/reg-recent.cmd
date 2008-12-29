@echo off
REM Keszitette: Tim Andras @ 2008

echo  * Registry takar¡t sa...
echo      * Legut¢bbi dokumentumok...
REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f > "%null1%" 2> "%null2%"
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" > "%null1%"

REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Player\RecentFileList" /f > "%null1%" 2> "%null2%"
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\MediaPlayer\Player\RecentFileList" > "%null1%"

REG DELETE "HKEY_CURRENT_USER\Software\TechSmith\SnagIt\8\Recent Captures" /f > "%null1%" 2> "%null2%"
REG ADD "HKEY_CURRENT_USER\Software\TechSmith\SnagIt\8\Recent Captures" > "%null1%"