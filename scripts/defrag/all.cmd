@echo off
REM Keszitette: Tim Andras @ 2008

echo  * Merevlemezek t”redezetts‚g-mentes¡t‚se...
start "" /wait "%aMAPP%\all_seged.vbs"
call "%dirTMP%\tmp_defrag.cmd"
del "%dirTMP%\tmp_defrag.cmd"