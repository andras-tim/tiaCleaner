@echo off
REM Keszitette: Tim Andras @ 2010

if exist "%null1%" del "%null1%"
if exist "%null2%" del "%null2%"

set aMAPP=%dirSCRIPTS%\%1
shift
set aSCRIPT=%1
shift
call "%aMAPP%\%aSCRIPT%" %1 %2 %3 %4 %5 %6 %7

if exist "%null1%" del "%null1%"
if exist "%null2%" del "%null2%"