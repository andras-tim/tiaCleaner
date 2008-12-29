@echo off
REM Keszitette: Tim Andras @ 2008

copy "%VST%\stinger.opt" "%dirTMP%\tmp_virscan_tool.opt" > "%null1%" 2> "%null2%"

echo          * V¡ruskeres‚s...
"%dirTMP%\tmp_virscan_tool.exe"  /adl /go

:vege
if exist "%dirTMP%\tmp_virscan_tool.opt" del "%dirTMP%\tmp_virscan_tool.opt"