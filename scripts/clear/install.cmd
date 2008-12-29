@echo off
REM Keszitette: Tim Andras @ 2008

echo  * Telep¡t‹k f jljai...
echo      * Ideiglenes f jlok...
start "" /wait "%aMAPP%\install_seged.vbs"
call "%dirTMP%\tmp_clear_install.cmd"
del "%dirTMP%\tmp_clear_install.cmd"

set mappa=%WINDIR%\SoftwareDistribution\Download
call "%aMAPP%\#erase-d.cmd"

rmdir /s /q "%WINDIR%\..\ATI" > "%null1%" 2> "%null2%"
rmdir /s /q "%WINDIR%\..\NVIDIA" > "%null1%" 2> "%null2%"

reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall | find "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\KB" > "%dirTMP%\tmp_install.tmp"
start "" /wait "%aMAPP%\install-win_seged.vbs"
del "%dirTMP%\tmp_install.tmp"
call "%dirTMP%\tmp_clear_install.cmd"
del "%dirTMP%\tmp_clear_install.cmd"
