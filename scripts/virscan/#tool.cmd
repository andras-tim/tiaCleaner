@echo off
REM Keszitette: Tim Andras @ 2010

if not exist "%aMAPP%\vst-%vstID%.cmd" goto vege
if "%vstCOPY%" == "" goto download
if not exist "%VST%\%vstCOPY%" goto vege

echo      * %vstNev%
echo          * Elt vol¡t¢ eszkoz el‹k‚sz¡t‚se...
copy "%VST%\%vstCOPY%" "%dirTMP%\tmp_virscan_tool.exe" > "%null1%" 2> "%null2%"
goto virscan

:download
echo      * %vstNev%
echo          * Let”lt‚s...
start "" /wait "%dirDLBIN%\wget" -Nc %vstDL% -O "%dirDLBIN%\dl_%vstID%_virscan_tool.exe"
copy "%dirDLBIN%\dl_%vstID%_virscan_tool.exe" "%dirTMP%\tmp_virscan_tool.exe" > "%null1%" 2> "%null2%"

:virscan
if not exist "%dirTMP%\tmp_virscan_tool.exe" goto vege
if "%vstSTART%" == "1" goto tarsitottstart
call "%aMAPP%\vst-%vstID%.cmd" %1
goto clean
:tarsitottstart
start "" /wait "%aMAPP%\vst-%vstID%.cmd" %1

:vege