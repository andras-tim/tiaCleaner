@echo off
REM Keszitette: Tim Andras @ 2010

echo  * Internetes gyors�t�t�rak ki�r�t�se...
echo      * Internet Explorer...
set mappa=%ALLUSERSPROFILE%\..\LocalService\Local Settings\Temporary Internet Files\Content.IE5
call "%aMAPP%\#erase-d.cmd"

set mappa=%ALLUSERSPROFILE%\..\NetworkService\Local Settings\Temporary Internet Files\Content.IE5
call "%aMAPP%\#erase-d.cmd"

set mappa=%USERPROFILE%\Local Settings\Temporary Internet Files\Content.IE5
call "%aMAPP%\#erase-d.cmd"

echo      * Google Chrome...
set mappa=%USERPROFILE%\Local Settings\Application Data\Google\Chrome\User Data\Default\Cache
call "%aMAPP%\#erase-d.cmd"
