Const ForWriting = 2
Set shell = WScript.CreateObject("WScript.Shell")
  dirTMP = shell.ExpandEnvironmentStrings("%dirTMP%")
Set fso = CreateObject("Scripting.FileSystemObject")
  Set dc = fso.Drives


Set filetxt = fso.OpenTextFile(dirTMP & "\tmp_clear_temp.cmd", ForWriting ,True)
filetxt.WriteLine("@echo off" & vbcrlf & _
                  "REM Keszitette: Tim Andras @ 2008" & vbcrlf)

For Each d in dc
  If d.DriveType = 2 Then
    filetxt.WriteLine("rmdir /s /q """ & d & "\MSOCache"" > ""%null1%"" 2> ""%null2%""")
  End If
Next

filetxt.Close