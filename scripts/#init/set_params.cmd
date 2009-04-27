@echo off
REM Keszitette: Tim Andras @ 2010

set BASE=_
set NORMAL=_
set ALL=_
rem -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
set temporary=_
set recent=_
set logs=_
set usn=_
set defrag=_
set memvirscan=_
set virscan=_
set poweroff=_
rem -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

set i=1
:ciKiertekeles
	if /i "%1" == "/?" goto sugo
	if /i "%1" == "-?" goto sugo
	if /i "%1" == "--help" goto sugo

	if /i "%1" == "-BASE" set BASE=B
	if /i "%1" == "-NORMAL" set NORMAL=N
	if /i "%1" == "-ALL" set ALL=A

	if /i "%1" == "-MVScan" set memvirscan=M
	if /i "%1" == "-Temporary" set temporary=T
	if /i "%1" == "-Recent" set recent=R
	if /i "%1" == "-Log" set logs=L
	if /i "%1" == "-USN" set usn=U
	if /i "%1" == "-Defrag" set defrag=D
	if /i "%1" == "-VScan" set virscan=V
	if /i "%1" == "-PowerOff" set poweroff=P
shift && if %i% LSS 9 set /A i=i+1 && goto ciKiertekeles

if "%BASE%" == "B" (
	rem set memvirscan=M
	set temporary=T
	rem set recent=R
	set logs=L
	rem set usn=U
	rem set defrag=D
	rem set virscan=V
	rem set poweroff=P
)

if "%NORMAL%" == "N" (
	rem set memvirscan=M
	set temporary=T
	rem set recent=R
	set logs=L
	set usn=U
	set defrag=D
	rem set virscan=V
	rem set poweroff=P
)

if "%ALL%" == "A" (
	set memvirscan=M
	set temporary=T
	set recent=R
	set logs=L
	set usn=U
	set defrag=D
	set virscan=V
	rem set poweroff=P
)

if "%virscan%" == "V" (
    set memvirscan=M
)

goto tovabb

:sugo
echo TiA Karbantart†s - Tim Andras @ 2010
echo.
echo ParamÇterek:
echo   -Temporary   BîngÇszãk gyors°t¢t†rainak tîrtlÇse
echo   -Recent      ElãzmÇnyek tîrlÇse
echo   -Log         Napl¢f†jlok tîrtlÇse
echo   -USN         USN napl¢ År°tÇse
echo   -Defrag      F†jlrendszer tîredeztettsÇg mentes°tÇse
echo   -MVScan      Mem¢ria v°rusellenãrzÇse
echo   -VScan       Meme¢ria Çs a f†jlrendszer v°rusellenãrzÇse
echo   -PowerOff    A feladatok vÇgÇn a sz†m°t¢gÇp kikapcsol†sa
echo.
echo Profilok:
echo   -BASE        Temporary, Log 
echo   -NORMAL      Temporary, Log, USN, Defrag (nincs Recent)
echo   -ALL         Az îsszes paramÇter kivÇve a PowerOff
echo.
exit

:tovabb