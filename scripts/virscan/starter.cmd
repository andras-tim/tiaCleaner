@echo off
REM Keszitette: Tim Andras @ 2009

set vst=%aMAPP%\vst
set vir=
rem Kereso motorok felsorolasa (vir: az inditando parancsfajl neve)
if exist "C:\Program Files\ESET\ESET NOD32 Antivirus\ecls.exe" set vir=nod32
if exist "C:\Program Files\ESET\ESET Smart Security\ecls.exe" set vir=nod32ss
if exist "C:\program files\Alwil Software\Avast4\ashCmd.exe" set vir=avast
if not "%vir%" == "" if exist "%aMAPP%\vs-%vir%.vbs" goto VirScan
goto VirScanTool

:VirScan
  echo  * V¡rusellen‹rz‚s...
  start "" /wait "%aMAPP%\vs-%vir%.vbs" %1
  call "%dirTMP%\tmp_virscan.cmd"
  del "%dirTMP%\tmp_virscan.cmd"
goto vege

:VirScanTool
  echo  * V¡rusellen‹rz‚s cs”kkentett tud s£ v¡rusirt¢kkal
	echo    (Nincs t mogatott v¡rus¡rt¢ feltelep¡tve)
	
    set vstID=avast
	set vstNev=avast! Virus Cleaner Tool
	set vstSTART=0
	set vstCOPY=
	set vstDL=http://files.avast.com/files/eng/aswclnr.exe
	call "%aMAPP%\#tool.cmd" %1

    set vstID=stinger
	set vstNev=McAfee Stinger
	set vstSTART=0
	set vstCOPY=
	set vstDL=http://download.nai.com/products/mcafee-avert/stinger.exe
	call "%aMAPP%\#tool.cmd" %1

:vege