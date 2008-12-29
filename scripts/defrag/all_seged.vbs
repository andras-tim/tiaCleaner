Const ForWriting = 2
Set shell = WScript.CreateObject("WScript.Shell")
  dirTMP = shell.ExpandEnvironmentStrings("%dirTMP%")
Set fso = CreateObject("Scripting.FileSystemObject")
  Set dc = fso.Drives


Set filetxt = fso.OpenTextFile(dirTMP & "\tmp_defrag.cmd", ForWriting ,True)
filetxt.WriteLine("@echo off" & vbcrlf & _
                  "REM Keszitette: Tim Andras @ 2008" & vbcrlf)

For Each d in dc
  If d.DriveType = 2 Then
    filetxt.WriteLine("echo      * " & d & " meghajt¢..." & vbcrlf & _
											"defrag " & d & " /f > ""%null%""")
  End If
Next

filetxt.Close