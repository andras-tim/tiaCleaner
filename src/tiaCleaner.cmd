@echo off
REM Keszitette: Tim Andras @ 2011

title RENDSZER KARBANTARTµSA - tiaCleaner
echo           (b rmikor le ll¡thatod a jobb fels‹ sarokban l‚v‹ 'X'-szel.)
echo.

set pcName=>#FN#<
set dirPRG=>#PDIR#<
set server=github.com
set urlVer=http://andras-tim.github.com/tiaCleaner/ver.txt
set urlDL=http://github.com/andras-tim/tiaCleaner/zipball/master
rem set sdirLOG=

set null="%temp%\ping.tmp"

rem ---Jelenlegi verzio megallapitasa--------------------------------------------------------------------------------
if exist "%dirPRG%\ver.txt" (
  set /p ldate= < "%dirPRG%\ver.txt"
) else (
  set ldate=ismeretlen
)

rem ---Sajat meghivas volt?------------------------------------------------------------------------------------------
if "%*" == "#$Ñ$#" goto INSTALLER

rem ---Szerver ellenorzese-------------------------------------------------------------------------------------------
echo * Csatlakoz s a szerverhez...
set VanPC=0
ping %server% -n 1 > %null% && set VanPC=1

rem ---Offline zemm¢d-----------------------------------------------------------------------------------------------
if "%VanPC%" == "0" (
:Offline
  echo      * Offline zemm¢d,     Verzi¢: %ldate%
  set sdirLOG=%dirPRG%\dl\MyLogs
  rem Offline installer
  if exist "%dirPRG%\libs.zip" goto update
  goto Start
)

rem ---Online zemm¢d------------------------------------------------------------------------------------------------
echo      * Online zemm¢d       Verzi¢: %ldate%
echo      * T voli verzi¢ lek‚rdez‚se...

set DlOK=0
"%dirPRG%\bin\wget" %urlVer% -O "%dirPRG%\rver.txt" 2> %null% && set DlOK=1
title RENDSZER KARBANTARTµSA - tiaCleaner
if "%DlOK%" == "0" (
  echo                                     HIBA l‚pett fel szerver lek‚rdez‚se k”zben!
  goto Offline
)

rem ---Tavoli verzio kinyerese--------------------------------------------------------------------------------------
if exist "%dirPRG%\rver.txt" (
  set /p rdate= < "%dirPRG%\rver.txt"
) else (
  set rdate=ismeretlen
)

if "%ldate%" == "%rdate%" (
  echo     * Nem kellett friss¡teni
  goto start
)

:update
echo     * Csomag friss¡t‚se... Verzi¢: %rdate%
start /WAIT "" %0 #$Ñ$#
if not exist "%dirPRG%\libs_autodl.zip" goto nincs

:Start
rem ---Takaritas-----------------------------------------------------------------------------------------------------
if exist "%dirPRG%\libs_autodl.zip" del "%dirPRG%\libs_autodl.zip"
if exist "%dirPRG%\rver.txt" del "%dirPRG%\rver.txt"
if exist %null% del %null%


rem ---Futtatas kiertekelese-----------------------------------------------------------------------------------------
echo.
if not exist "%dirPRG%\dl\maxi_karbantartas.cmd" goto nincs
set dirPRG=%dirPRG%\dl
"%dirPRG%\maxi_karbantartas.cmd" %pcName% %*
exit


:nincs
if exist "%dirPRG%\ver.txt" del "%dirPRG%\ver.txt"
echo.
echo Nem ‚rhet‹ el a karbantart¢ Script k‚szlet!
echo.
pause
exit



:INSTALLER
cls
set t=Csomag beszerz‚se... [ 1 / 5 ]
title %t%
if not exist "%dirPRG%\libs.zip" goto dl
ren "%dirPRG%\libs.zip" "libs_autodl.zip"
goto cleanup

:dl
if exist "%dirPRG%\libs_autodl.zip" del "%dirPRG%\libs_autodl.zip"
set pOK=0
call "%dirPRG%\bin\wget" %urlDL% -O "%dirPRG%\libs_autodl.zip" && set pOK=1
title %t%
if "pOK" == "0" (
  if exist "%dirPRG%\libs_autodl.zip" (
    del "%dirPRG%\libs_autodl.zip"
    del "%dirPRG%\ver.txt"
  )
  goto dlhiba
)

:cleanup
if not exist dl goto unpack
set t=El‹z‹ csomag elt vol¡t sa   [ 2 / 5 ]
title %t%
if exist "%dirPRG%\dl" call rmdir /s /q "%dirPRG%\dl"
if exist "%dirPRG%\Unpack" call rmdir /s /q "%dirPRG%\unpack"

:unpack
if not exist "%dirPRG%\unpack" mkdir "%dirPRG%\unpack"
echo.
echo.
set t=Csomag kit”m”r¡t‚se... [ 3 / 5 ]
title %t%
set pOK=0
"%dirPRG%\bin\unzip" -x "%dirPRG%\libs_autodl.zip" -d "%dirPRG%\unpack" && set pOK=1
if "pOK" == "0" (
  if exist "%dirPRG%\dl\maxi_karbantartas.cmd" del "%dirPRG%\dl\maxi_karbantartas.cmd"
  goto dlhiba
)

echo.
echo.
set t=Csomag mozgat sa... [ 4 / 5 ]
title %t%
set pOK=0
"%dirPRG%\bin\mv" "%dirPRG%\unpack\*" "%dirPRG%\dl" && set pOK=1
if "pOK" == "0" (
  if exist "%dirPRG%\dl\maxi_karbantartas.cmd" del "%dirPRG%\dl\maxi_karbantartas.cmd"
  goto dlhiba
)
rmdir /s /q "%dirPRG%\unpack"

echo.
echo.
set t=Csomag ‚rv‚nyes¡t‚se... [ 5 / 5 ]
title %t%
set pOK=0
del "%dirPRG%\ver.txt"
ren "%dirPRG%\rver.txt" "ver.txt" && set pOK=1
if "pOK" == "0" (
  if exist "%dirPRG%\dl\maxi_karbantartas.cmd" del "%dirPRG%\dl\maxi_karbantartas.cmd"
  goto dlhiba
)
exit

:dlhiba
echo.
echo.
echo HIBA LPETT FEL A K™VETKEZŠ FOLYAMAT ELVGZSE SORµN:
echo %t%
echo.
echo.
pause
exit

