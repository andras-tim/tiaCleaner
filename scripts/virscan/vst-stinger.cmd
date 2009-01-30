@echo off
REM Keszitette: Tim Andras @ 2010

if /i "%1" == "-hdd" (
    copy "%VST%\stinger_hdd.opt" "%dirTMP%\tmp_virscan_tool.opt" > "%null1%" 2> "%null2%"
    echo          * Merevlemezek ellen‹rz‚se...
    "%dirTMP%\tmp_virscan_tool.exe" /adl /go
)
if /i "%1" == "-mem" (
    copy "%VST%\stinger_mem.opt" "%dirTMP%\tmp_virscan_tool.opt" > "%null1%" 2> "%null2%"
    echo          * Mem¢ria ellen‹rz‚se...
    "%dirTMP%\tmp_virscan_tool.exe" /go
)

:vege
if exist "%dirTMP%\tmp_virscan_tool.opt" del "%dirTMP%\tmp_virscan_tool.opt"