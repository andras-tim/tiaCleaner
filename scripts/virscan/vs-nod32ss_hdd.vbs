'Keszitette: Tim Andras @ 2010

Const PrgDir = "C:\Program Files\ESET\ESET Smart Security"
Const Prg = """C:\Program Files\ESET\ESET Smart Security\ecls.exe"""
LogF = """%dirLOG%\%date%"
DefParams = " --base-dir=""" & PrgDir & """ --adv-heur --aind --action=clean --quarantine --log-rewrite --log-file=" & LogF

'Deklaracios resz
Const ForWriting = 2
Set shell = WScript.CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
dirTMP = shell.ExpandEnvironmentStrings("%dirTMP%")

'Mod kivalasztas
mode = "hdd"
If Wscript.Arguments.Count = 1 Then
  If Wscript.Arguments(0) = "-mem" Then mode = "mem"
End If

'Cmd fajl keszitese
Set filetxt = fso.OpenTextFile(dirTMP & "\tmp_virscan.cmd", ForWriting ,True)
filetxt.WriteLine("@echo off" & vbcrlf & _
                  "REM Keszitette: Tim Andras @ 2010" & vbcrlf)

Case Select mode
  Case "mem"
    filetxt.WriteLine("echo      * Mem¢ria kl”n ellen‹rz‚se nem t mogatott")
    'filetxt.WriteLine("echo      * Mem¢ria ‚s Boot szektorok...")

  Case "hdd"
    Set dc = fso.Drives
    For Each d in dc
      If d.DriveType = 2 Then
        filetxt.WriteLine("echo      * " & d & " meghajt¢...")
        filetxt.WriteLine(Prg & " " & d & DefParams & "Mght-" & left(d,1) & "-HIBA.txt"" > ""%null%""")
        filetxt.WriteLine("if errorlevel 0 del " & LogF & "Mght-" & left(d,1) & "-HIBA.txt"" & goto ciklus" & left(d,1) & "v")
        filetxt.WriteLine("ren " & LogF & "Mght-" & left(d,1) & "-HIBA.txt"" " & LogF & "-mght-" & left(d,1) & "-VIR.txt"" & goto ciklus" & left(d,1) & "v")
        filetxt.WriteLine(":ciklus" & left(d,1) & "v")
      End If
    Next
End Select

filetxt.Close
