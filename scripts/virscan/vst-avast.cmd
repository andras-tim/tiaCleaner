@echo off
REM Keszitette: Tim Andras @ 2008

echo          * V¡ruskeres‚s...
"%dirTMP%\tmp_virscan_tool.exe" /R /L

:vege
if exist "%dirTMP%\tmp_virscan_tool.tmp" del "%dirTMP%\tmp_virscan_tool.tmp"