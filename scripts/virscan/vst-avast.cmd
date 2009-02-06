@echo off
REM Keszitette: Tim Andras @ 2010

if /i "%1" == "-hdd" (
    echo          * Merevlemezek, registry ellen‹rz‚se...
    "%dirTMP%\tmp_virscan_tool.exe" /R /L /M
)
if /i "%1" == "-mem" (
    echo          * Mem¢ria ellen‹rz‚se...
    "%dirTMP%\tmp_virscan_tool.exe" /R /L /T=\__VEGE:__/
)
