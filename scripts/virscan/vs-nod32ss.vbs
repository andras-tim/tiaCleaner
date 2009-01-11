'Keszitette: Tim Andras @ 2009

Const PrgDir = "C:\Program Files\ESET\ESET Smart Security"
Const Prg = """C:\Program Files\ESET\ESET Smart Security\ecls.exe"""
LogF = """%dirLOG%\%date%"
DefParams = " --base-dir=""" & PrgDir & """ --adv-heur --aind --action=clean --quarantine --log-rewrite --log-file=" & LogF


Const ForWriting = 2
Set shell = WScript.CreateObject("WScript.Shell")
  dirTMP = shell.ExpandEnvironmentStrings("%dirTMP%")
Set fso = CreateObject("Scripting.FileSystemObject")
  Set dc = fso.Drives

Set filetxt = fso.OpenTextFile(dirTMP & "\tmp_virscan.cmd", ForWriting ,True)
filetxt.WriteLine("@echo off" & vbcrlf & _
                  "REM Keszitette: Tim Andras @ 2009" & vbcrlf)

For Each d in dc
  If d.DriveType = 2 Then
    filetxt.WriteLine("echo      * " & d & " meghajt¢...")
    filetxt.WriteLine(Prg & " " & d & DefParams & "Mght-" & left(d,1) & "-HIBA.txt"" > ""%null%""")
		filetxt.WriteLine("if errorlevel 0 del " & LogF & "Mght-" & left(d,1) & "-HIBA.txt"" & goto ciklus" & left(d,1) & "v")
		filetxt.WriteLine("ren " & LogF & "Mght-" & left(d,1) & "-HIBA.txt"" " & LogF & "-mght-" & left(d,1) & "-VIR.txt"" & goto ciklus" & left(d,1) & "v")
		filetxt.WriteLine(":ciklus" & left(d,1) & "v")
  End If
Next
filetxt.Close
