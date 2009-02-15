@echo off
REM Keszitette: Tim Andras @ 2009

title RENDSZER KARBANTARTµSA
echo           (b rmikor le ll¡thatod a jobb fels‹ sarokban l‚v‹ 'X'-szel.)
echo.

set pcName=>#FN#<
set dirPRG=>#PDIR#<
set server=tia.sytes.net
set spath=public/snail/karbantartas
set sdirLOG=\\szerver\Kliens seg‚dletek\logs

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
  set sdirLOG=%dirPRG%\DL\MyLogs
  rem Offline installer
  if exist "%dirPRG%\sm_karb.rar" goto update
  goto Start
)

rem ---Online zemm¢d------------------------------------------------------------------------------------------------
echo      * Online zemm¢d       Verzi¢: %ldate%
echo      * T voli verzi¢ lek‚rdez‚se...

set DlOK=0
"%dirPRG%\bin\wget" http://%server%/%spath%/ver.txt -O "%dirPRG%\rver.txt" 2> %null% && set DlOK=1
title RENDSZER KARBANTARTµSA
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
if not exist "%dirPRG%\tia_karb_autodl.rar" goto nincs

:Start
rem ---Takaritas-----------------------------------------------------------------------------------------------------
if exist "%dirPRG%\tia_karb_autodl.rar" del "%dirPRG%\tia_karb_autodl.rar"
if exist "%dirPRG%\rver.txt" del "%dirPRG%\rver.txt"
if exist %null% del %null%



rem ---Futtatas kiertekelese-----------------------------------------------------------------------------------------
echo.
if not exist "%dirPRG%\DL\maxi_karbantartas.cmd" goto nincs
set dirPRG=%dirPRG%\DL
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
set t=Csomag beszerz‚se... [ 1 / 4 ]
title %t%
if not exist "%dirPRG%\sm_karb.rar" goto dl
ren "%dirPRG%\sm_karb.rar" "tia_karb_autodl.rar"
goto cleanup

:dl
if exist "%dirPRG%\tia_karb_autodl.rar" del "%dirPRG%\tia_karb_autodl.rar"
set pOK=0
call "%dirPRG%\bin\wget" http://%server%/%spath%/sm_karb.rar -O "%dirPRG%\tia_karb_autodl.rar" && set pOK=1
title %t%
if "pOK" == "0" (
  if exist "%dirPRG%\tia_karb_autodl.rar" (
    del "%dirPRG%\tia_karb_autodl.rar"
    del "%dirPRG%\ver.txt"
  )
  goto dlhiba
)

:cleanup
if not exist dl goto unpack
set t=El‹z‹ csomag elt vol¡t sa   [ 2 / 4 ]
title %t%
call rmdir /s /q "%dirPRG%\dl"

:unpack
if not exist "%dirPRG%\dl" mkdir "%dirPRG%\dl"
echo.
echo.
set t=Csomag kit”m”r¡t‚se... [ 3 / 4 ]
title %t%
set pOK=0
"%dirPRG%\bin\unrar" x -ts -r -o+ "%dirPRG%\tia_karb_autodl.rar" "%dirPRG%\DL\"
if "pOK" == "0" (
  if exist "%dirPRG%\DL\maxi_karbantartas.cmd" del "%dirPRG%\DL\maxi_karbantartas.cmd"
  goto dlhiba
)

echo.
echo.
set t=Csomag ‚rv‚nyes¡t‚se... [ 4 / 4 ]
title %t%
set pOK=0
del "%dirPRG%\ver.txt"
ren "%dirPRG%\rver.txt" "ver.txt" && set pOK=1
if "pOK" == "0" (
  if exist "%dirPRG%\DL\maxi_karbantartas.cmd" del "%dirPRG%\DL\maxi_karbantartas.cmd"
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



