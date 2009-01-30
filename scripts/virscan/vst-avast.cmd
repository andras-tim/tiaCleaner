@echo off
REM Keszitette: Tim Andras @ 2010

if /i "%1" == "-hdd" (
    echo          * Merevlemezek, registry ellen‹rz‚se...
    "%dirTMP%\tmp_virscan_tool.exe" /M /R /L
)
if /i "%1" == "-mem" (
    echo          * Mem¢ria ellen‹rz‚se...
    "%dirTMP%\tmp_virscan_tool.exe" /T /R /L
)

:vege
if exist "%dirTMP%\tmp_virscan_tool.tmp" del "%dirTMP%\tmp_virscan_tool.tmp"