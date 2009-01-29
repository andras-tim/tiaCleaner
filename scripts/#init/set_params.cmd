@echo off
REM Keszitette: Tim Andras @ 2009

set ALL=_
rem -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
set temporary=_
set logs=_
set usn=_
set defrag=_
set virscan=_
set poweroff=_
rem -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

set i=1
:ciKiertekeles
	if /i "%1" == "-ALL" set ALL=A
	if /i "%1" == "-Temporary" set temporary=T
	if /i "%1" == "-Log" set logs=L
	if /i "%1" == "-USN" set usn=U
	if /i "%1" == "-Defrag" set defrag=D
	if /i "%1" == "-VScan" set virscan=V
	if /i "%1" == "-PowerOff" set poweroff=P
shift && if %i% LSS 9 set /A i=i+1 && goto ciKiertekeles

if "%ALL%" == "A" (
	set temporary=T
	set logs=L
	set usn=U
	set defrag=D
	set virscan=V
)
