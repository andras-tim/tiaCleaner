'Keszitette: Tim Andras @ 2009

Const aREG = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"

Const ForReading = 1
Const ForWriting = 2
Set shell = WScript.CreateObject("WScript.Shell")
  dirTMP = shell.ExpandEnvironmentStrings("%dirTMP%")
  dirWIN = shell.ExpandEnvironmentStrings("%windir%")
Set fso = CreateObject("Scripting.FileSystemObject")
  Set dc = fso.Drives
  Set wsfc = fso.GetFolder(dirWIN).SubFolders


Set filetxt = fso.OpenTextFile(dirTMP & "\tmp_clear_install.cmd", ForWriting ,True)
filetxt.WriteLine("@echo off" & vbcrlf & _
                  "REM Keszitette: Tim Andras @ 2009" & vbcrlf)

filetxt.WriteLine("echo      * ServicePack elt vol¡t¢k...")
For Each f In wsfc
  If InStr(1, f.Name, "$NtServicePackUninstall", vbTextCompare) = 1 Then
	  filetxt.WriteLine("rmdir /s /q """ & f.Path & """ > ""%null1%"" 2> ""%null2%""")
  End If
Next

filetxt.WriteLine("echo      * Gyorsjav¡t s visszavon¢k...")
For Each f In wsfc
  If Left(f.Name, 1) = "$" Then
    If InStr(1, f.Name, "Uninstall", vbTextCompare) > 0 Then
      filetxt.WriteLine ("rmdir /s /q """ & f.Path & """ > ""%null1%"" 2> ""%null2%""")
    End If
  End If
Next
filetxt.WriteLine (vbcrlf)

filetxt.WriteLine("echo      * Registry karbantart sa...")
'Registry bejegyzések törtése
Set FileForRead = fso.OpenTextFile(dirTMP & "\tmp_install.tmp", ForReading)
  Do Until FileForRead.AtEndOfStream
    filetxt.WriteLine("reg delete """ & FileForRead.ReadLine & """ /f > ""%null1%"" 2> ""%null2%""")
  Loop
FileForRead.Close
filetxt.WriteLine("reg delete """ & aREG & "\Windows XP Service Pack"" /f > ""%null1%"" 2> ""%null2%""")

filetxt.Close
