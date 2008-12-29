@echo off
REM Keszitette: Tim Andras @ 2008

title RENDSZER KARBANTARTµSA   [Ind¡t s...]

if defined dirPRG goto Inditoval
  echo           (b rmikor le ll¡thatod a jobb fels‹ sarokban l‚v‹ 'X'-szel.)
  echo.
  set dirPRG=%cd%

:Inditoval
call "%dirPRG%\scripts\#init\set_path.cmd" %1

rem =======================================================================================================================================================================================
rem =======================================================================================================================================================================================

rem ---KIERTEKELES-------------------------------------------------------------------------------------------------------------------
set temporary=_
set defrag=_
set virscan=V
set poweroff=_
set usn=_

if /i "%2" == "-ALL" (
  set temporary=T
  set defrag=D
  set usn=P
  goto LetsStart
)

if /i "%2" == "-Temporary" set temporary=T
if /i "%3" == "-Temporary" set temporary=T
if /i "%4" == "-Temporary" set temporary=T
if /i "%5" == "-Temporary" set temporary=T
if /i "%6" == "-Temporary" set temporary=T

if /i "%2" == "-USN" set usn=U
if /i "%3" == "-USN" set usn=U
if /i "%4" == "-USN" set usn=U
if /i "%5" == "-USN" set usn=U
if /i "%6" == "-USN" set usn=U

if /i "%2" == "-Defrag" set defrag=D
if /i "%3" == "-Defrag" set defrag=D
if /i "%4" == "-Defrag" set defrag=D
if /i "%5" == "-Defrag" set defrag=D
if /i "%6" == "-Defrag" set defrag=D

if /i "%2" == "-NoVScan" set virscan=_
if /i "%3" == "-NoVScan" set virscan=_
if /i "%4" == "-NoVScan" set virscan=_
if /i "%5" == "-NoVScan" set virscan=_
if /i "%6" == "-NoVScan" set virscan=_

if /i "%2" == "-PowerOff" set poweroff=P
if /i "%3" == "-PowerOff" set poweroff=P
if /i "%4" == "-PowerOff" set poweroff=P
if /i "%5" == "-PowerOff" set poweroff=P
if /i "%6" == "-PowerOff" set poweroff=P


:LetsStart
title RENDSZER KARBANTARTµSA   [%temporary%%usn%%defrag%%virscan%%poweroff%]




rem ---CLEAR---------------------------------------------------------------------------------------------------------------------------------
call %sScript% clear reg-recent.cmd
rem call %sScript% clear recent.cmd
call %sScript% clear temp.cmd
call %sScript% clear install.cmd
if "%temporary%" == "T" call %sScript% clear temporary.cmd
if "%usn%" == "U" call %sScript% clear fs.cmd

rem ---DEFRAG--------------------------------------------------------------------------------------------------------------------------------
if "%defrag%" == "D" call %sScript% defrag all.cmd"

rem ---VIRSCAN-------------------------------------------------------------------------------------------------------------------------------
if "%virscan%" == "V" call %sScript% virscan all.cmd"

rem ---POWER OFF---------------------------------------------------------------------------------------------------------------------------
if "%poweroff%" == "P" shutdown -s -t 60 -c "A KARBANTARTµS BEFEJEZŠD™TT!   (A be ll¡t sok alapj n a g‚p ki fog kapcsolni. Ha ezt meg k¡v nja szak¡tani, futtassa a 'SHUTDOWN -A' parancsot)"


rem =======================================================================================================================================================================================
rem =======================================================================================================================================================================================

exit
