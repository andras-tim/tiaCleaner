'Keszitette: Tim Andras @ 2009

Const ForWriting = 2
Set shell = WScript.CreateObject("WScript.Shell")
  dirTMP = shell.ExpandEnvironmentStrings("%dirTMP%")
Set fso = CreateObject("Scripting.FileSystemObject")
  Set dc = fso.Drives


Set filetxt = fso.OpenTextFile(dirTMP & "\tmp_clear_fs_usn.cmd", ForWriting ,True)
filetxt.WriteLine("@echo off" & vbcrlf & _
                  "REM Keszitette: Tim Andras @ 2009" & vbcrlf)

For Each d in dc
  If d.DriveType = 2 Then
    filetxt.WriteLine("fsutil usn deletejournal /D " & d & " > ""%null1%"" 2> ""%null2%""")
  End If
Next

filetxt.Close