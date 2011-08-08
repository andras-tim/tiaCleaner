@echo off
REM Keszitette: Tim Andras @ 2011
title RENDSZER KARBANTARTµSA - tiaCleaner

set pcName=>#FN#<
set dirPRG=>#PDIR#<
set server=github.com
set urlVer=http://andras-tim.github.com/tiaCleaner/ver.txt
set urlDL=http://github.com/andras-tim/tiaCleaner/zipball/master
rem set sdirLOG=

rem ---Uzemmod kivalasztas---
if "%*" == "#$INSTALLER$#" goto installer


rem ======MAIN==========================================================================================================
echo           (b rmikor le ll¡thatod a jobb fels‹ sarokban l‚v‹ 'X'-szel.)
echo.

if "%sdirLOG%" == "" set sdirLOG="%dirPRG%\dl\MyLogs"
rem ---Karbantartas---
if not exist "%dirPRG%\ver.txt" if exist "%dirPRG%\libs.zip" del "%dirPRG%\libs.zip"
if not exist "%dirPRG%\dl" if exist "%dirPRG%\ver-local.txt" del "%dirPRG%\ver-local.txt"
if exist "%dirPRG%\libs.zip" ren "%dirPRG%\libs.zip" "%dirPRG%\libs_autodl.zip"

echo * Friss¡t‚sek keres‚se...
rem ---Jelenlegi verzio megallapitasa---
if exist "%dirPRG%\ver-local.txt" (
  set /p ver_local= < "%dirPRG%\ver-local.txt"
) else (
  set ver_local=n/a
)
echo      * Lok lis verzi¢: %ver_local%

rem ---Cel verzio megallapitasa---
set null="%temp%\tiac_ping.tmp"
if not exist "%dirPRG%\ver.txt" (
  ping %server% -n 1 > "%null%" && "%dirPRG%\bin\wget" "%urlVer%" -O "%dirPRG%\ver.txt" 2> "%null%"
  title RENDSZER KARBANTARTµSA - tiaCleaner
  if exist "%null%" del "%null%"
)
if exist "%dirPRG%\ver.txt" (
  set /p ver_remote= < "%dirPRG%\ver.txt"
) else (
  set ver_remote=n/a
)
echo      * T voli verzi¢: %ver_remote%
rem ---Ellenorzes---
if "%ver_local%%ver_remote%" == "n/an/a" (
  if exist "%dirPRG%\ver.txt" del "%dirPRG%\ver.txt"
  goto nincs
)
if not "%ver_local%" == "%ver_remote%" (
  echo * Friss¡t‚s...
  start /WAIT "" %0 #$INSTALLER$#
  echo * Scriptk‚szlet felfriss¡tve
)
if exist "%dirPRG%\ver.txt" del "%dirPRG%\ver.txt"
rem ---Futtatas---
echo.
echo.
if not exist "%dirPRG%\dl\maxi_karbantartas.cmd" goto nincs
set dirPRG="%dirPRG%\dl"
"%dirPRG%\maxi_karbantartas.cmd" %pcName% %*
exit %errorlevel%

:nincs
echo.
echo Nem ‚rhet‹ el a karbantart¢ Script k‚szlet!
echo.
pause
exit 1


rem ======INSTALLER=====================================================================================================
:installer
echo    Friss¡t‚s...
echo --------------------------------------------------------------------------------
echo.
set t=Jelenlegi  llapot biztons gi ment‚se... [ 1 / 5 ]
title %t%
set dirBACKUP="%dirPRG%\dl_backup_%date%"
if exist "%dirBACKUP%" (
  echo.
  echo Nem lehet elv‚gezni a jelenlegi verzi¢ biztons gi ment‚s‚t, mert m r l‚tezik a "%dirBACKUP%" mappa!
  echo.
  pause
  exit 1
)
mkdir "%dirBACKUP%"
if exist "%dirPRG%\dl" move "%dirPRG%\dl" "%dirBACKUP%\" || goto installer_error
if exist "%dirPRG%\ver-local.txt" move "%dirPRG%\ver-local.txt" "%dirBACKUP%\" || goto installer_error

set t=Inicializ l s... [ 2 / 5 ]
title %t%
if exist "%dirPRG%\unpack" rmdir /s /q "%dirPRG%\unpack" || goto installer_error
if exist "%dirPRG%\libs.zip" move /y "%dirPRG%\libs.zip" "libs_autodl.zip" || goto installer_error
if exist "%dirPRG%\libs_autodl.zip" goto installer_unpack

set t=Friss¡t‚s let”lt‚se... [ 3 / 5 ]
title %t%
set pOK=0
"%dirPRG%\bin\wget" %urlDL% -O "%dirPRG%\libs_autodl.zip" && set pOK=1
title %t%
if "%pOK%" == "0" (
  if exist "%dirPRG%\libs_autodl.zip" del "%dirPRG%\libs_autodl.zip"
  goto installer_error
)

:installer_unpack
set t=Friss¡t‚s  kicsomagol sa... [ 4 / 5 ]
title %t%
mkdir "%dirPRG%\unpack"
"%dirPRG%\bin\unzip" -x "%dirPRG%\libs_autodl.zip" -d "%dirPRG%\unpack" || goto installer_error

set t=Friss¡t‚s ‚rv‚nyes¡t‚se... [ 5 / 5 ]
title %t%
set pOK=0
move "%dirPRG%\unpack\andras-tim-tiaCleaner-*" "%dirPRG%\dl" || goto installer_error
move /y "%dirPRG%\ver.txt" "ver-local.txt" || goto installer_error
rmdir /s /q "%dirPRG%\unpack"
del "%dirPRG%\libs_autodl.zip"
rmdir /s /q "%dirBACKUP%"
exit 0

:installer_error
echo.
echo.
echo HIBA LPETT FEL A K™VETKEZŠ FOLYAMAT ELVGZSE SORµN:
echo %t%
echo.
if exist "%dirBACKUP%" (
  echo Legutols¢ mûk”d‹  llapot vissza ll¡t sa... "%dirBACKUP%"
  if exist "%dirPRG%\dl" rmdir /s /q "%dirPRG%\dl" || goto installer_restore_error
  if exist "%dirPRG%\ver-local.txt" del "%dirPRG%\ver-local.txt" || goto installer_restore_error
  if exist "%dirBACKUP%\dl" copy "%dirBACKUP%\dl" "%dirPRG%\" || goto installer_restore_error
  if exist "%dirBACKUP%\ver-local.txt" copy "%dirBACKUP%\ver-local.txt" "%dirPRG%\" || goto installer_restore_error
  echo     K‚sz
)
echo.
pause
exit 1

:installer_restore_error
echo     HIBA
echo.
pause
exit 1

