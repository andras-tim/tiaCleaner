@echo off
REM Keszitette: Tim Andras @ 2009

rem Binarisok mappaja
set dirBIN=%dirPRG%\..\bin
set dirDLBIN=%dirPRG%\bin

rem Szkriptek mappaja
set dirSCRIPTS=%dirPRG%\scripts
if not exist "%dirSCRIPTS%" exit
set sScript="%dirSCRIPTS%\#init\start_script.cmd"

rem Megosztott fajlok
set dirSHARED=%dirSCRIPTS%\#shared

rem Log mappa
if not defined sdirLOG set sdirLOG=%dirPRG%\..\MyLogs
if "%1" == "" set dirLOG=%sdirLOG%\#USER
if not "%1" == "" set dirLOG=%sdirLOG%\%1
if not exist "%dirLOG%" md "%dirLOG%"
if not exist "%dirLOG%" set %dirLOG%=C:

rem Ideiglenes mappa
set dirTMP=%TEMP%
if not exist "%dirTMP%" md "%dirTMP%"
if not exist "%dirTMP%" set %dirTMP%=C:

rem "NULL driver"
set null="%dirTMP%\1.log"
set null1=%null%
set null2="%dirTMP%\2.log"