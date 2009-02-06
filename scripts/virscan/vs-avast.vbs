'Keszitette: Tim Andras @ 2010

Const Prg = """C:\program files\Alwil Software\Avast4\ashCmd.exe"""
LogF = """%dirLOG%\%date%"
DefParams = " --console --soundoff --continue /R=" & LogF

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

Select Case mode
  Case "mem"
    filetxt.WriteLine("echo      * Mem¢ria ‚s Boot szektorok...")
    filetxt.WriteLine(Prg & " --boot" & DefParams & "Mem-HIBA"" > ""%null%""")
    filetxt.WriteLine("if errorlevel 1 ren " & LogF & "Mem-HIBA.txt"" " & LogF & "-mem-VIR.txt"" & goto vege" )
    filetxt.WriteLine("if errorlevel 0 del " & LogF & "Mem-HIBA.txt"" & goto vege" )
    filetxt.WriteLine(":vege")

  Case "hdd"
    Set dc = fso.Drives
    For Each d in dc
      If d.DriveType = 2 Then
        filetxt.WriteLine("echo      * " & d & " meghajt¢...")
        filetxt.WriteLine(Prg & " " & d & DefParams & "Mght-" & left(d,1) & "-HIBA"" > ""%null%""")
        filetxt.WriteLine("if errorlevel 1 ren " & LogF & "Mght-" & left(d,1) & "-HIBA.txt"" " & LogF & "-mght-" & left(d,1) & "-VIR.txt"" & goto ciklus" & left(d,1) & "v")
        filetxt.WriteLine("if errorlevel 0 del " & LogF & "Mght-" & left(d,1) & "-HIBA.txt"" & goto ciklus" & left(d,1) & "v")
        filetxt.WriteLine(":ciklus" & left(d,1) & "v")
      End If
    Next
End Select

filetxt.Close
