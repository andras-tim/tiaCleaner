@echo off
REM Keszitette: Tim Andras @ 2010

if not exist "%aMAPP%\vst-%vstCMD%" goto vege
if "%vstCOPY%" == "" goto download
if not exist "%VST%\%vstCOPY%" goto vege

echo      * %vstNev%
echo          * Elt vol¡t¢ eszkoz el‹k‚sz¡t‚se...
copy "%VST%\%vstCOPY%" "%dirTMP%\tmp_virscan_tool.exe" > "%null1%" 2> "%null2%"
goto virscan

:download
echo      * %vstNev%
echo          * Let”lt‚s...
start "" /wait "%dirBIN%\wget" %vstDL% -O "%dirTMP%\tmp_virscan_tool.exe"

:virscan
if not exist "%dirTMP%\tmp_virscan_tool.exe" goto vege
if "%vstSTART%" == "1" goto tarsitottstart
call "%aMAPP%\vst-%vstCMD%"
goto clean
:tarsitottstart
start "" /wait "%aMAPP%\vst-%vstCMD%"

:clean
del "%dirTMP%\tmp_virscan_tool.exe"

:vege