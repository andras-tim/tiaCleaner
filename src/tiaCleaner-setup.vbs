'Keszitette: Tim Andras @ 2009

Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.GetFile("tiaCleaner.cmd")

If objFile.Size > 0 Then
    Set objReadFile = objFSO.OpenTextFile("tiaCleaner.cmd", 1)
    strContents = objReadFile.ReadAll
    objReadFile.Close
Else
    Wscript.Echo "Az átírandó fájl üres!"
End If


Const ForWriting = 2
Set WshNetwork = WScript.CreateObject("WScript.Network")

aUser = LCase(WshNetwork.ComputerName)
if aUser = "" Then aUser = InputBox("Adja meg a felhasználó nevét!", "Személyes beállítások", aUser)
if aUser = "" then aUser = "#user"

Set FileTxt = objFSO.OpenTextFile("tiaCleaner.cmd", ForWriting ,True)
  strContents=replace(strContents, ">#FN#<", aUser)
  strContents=replace(strContents, ">#PDIR#<", objFile.ParentFolder.Path)
  FileTxt.WriteLine(strContents)
FileTxt.Close


objFSO.GetFile("tiaCleaner-setup.vbs").Delete




