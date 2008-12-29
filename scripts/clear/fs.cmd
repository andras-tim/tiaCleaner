@echo off
REM Keszitette: Tim Andras @ 2008

echo  * F jlrendszer karbantart sa...
echo      * NTFS USN-napl¢ t”rl‚se...
start "" /wait "%aMAPP%\fs_usn.vbs"
call "%dirTMP%\tmp_clear_fs_usn.cmd"
del "%dirTMP%\tmp_clear_fs_usn.cmd"