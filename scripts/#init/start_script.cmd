@echo off
REM Keszitette: Tim Andras @ 2008

if exist "%null1%" del "%null1%"
if exist "%null2%" del "%null2%"

set aMAPP=%dirSCRIPTS%\%1
call "%aMAPP%\%2"

if exist "%null1%" del "%null1%"
if exist "%null2%" del "%null2%"