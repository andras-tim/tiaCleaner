@echo off
REM Keszitette: Tim Andras @ 2010

title RENDSZER KARBANTARTµSA   [Ind¡t s...]

if defined dirPRG goto Inditoval
  echo           (b rmikor le ll¡thatod a jobb fels‹ sarokban l‚v‹ 'X'-szel.)
  echo.
  set dirPRG=%cd%

:Inditoval
call "%dirPRG%\scripts\#init\set_path.cmd" %1

rem ---KIERTEKELES-------------------------------------------------------------------------------------------------------------------
call "%dirPRG%\scripts\#init\set_params.cmd" %*
title RENDSZER KARBANTARTµSA   [%memvirscan%%temporary%%recent%%logs%%usn%%defrag%%virscan%%poweroff%]

rem =======================================================================================================================================================================================
rem =======================================================================================================================================================================================

rem ---MEM VIRSCAN---------------------------------------------------------------------------------------------------------------------------
if "%memvirscan%" == "M" call %sScript% virscan starter.cmd -mem

rem ---CLEAR---------------------------------------------------------------------------------------------------------------------------------
call %sScript% clear temp.cmd
call %sScript% clear install.cmd
if "%temporary%" == "T" call %sScript% clear temporary.cmd
if "%recent%" == "R" call %sScript% clear reg-recent.cmd
if "%recent%" == "R" call %sScript% clear recent.cmd
if "%logs%" == "L" call %sScript% clear logs.cmd
if "%usn%" == "U" call %sScript% clear fs.cmd

rem ---DEFRAG--------------------------------------------------------------------------------------------------------------------------------
if "%defrag%" == "D" call %sScript% defrag all.cmd"

rem ---VIRSCAN-------------------------------------------------------------------------------------------------------------------------------
if "%virscan%" == "V" call %sScript% virscan starter.cmd -hdd

rem ---POWER OFF---------------------------------------------------------------------------------------------------------------------------
if "%poweroff%" == "P" shutdown -s -t 60 -c "A KARBANTARTµS BEFEJEZŠD™TT!   (A be ll¡t sok alapj n a g‚p ki fog kapcsolni. Ha ezt meg k¡v nja szak¡tani, futtassa a 'SHUTDOWN -A' parancsot)"


rem =======================================================================================================================================================================================
rem =======================================================================================================================================================================================

exit
