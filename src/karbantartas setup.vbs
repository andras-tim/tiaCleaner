Set objFSO = CreateObject("Scripting.FileSystemObject")
Set objFile = objFSO.GetFile("karbantartas.cmd")

If objFile.Size > 0 Then
    Set objReadFile = objFSO.OpenTextFile("karbantartas.cmd", 1)
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

Set FileTxt = objFSO.OpenTextFile("karbantartas.cmd", ForWriting ,True)
  strContents=replace(strContents, ">#FN#<", aUser)
  strContents=replace(strContents, ">#PDIR#<", objFile.ParentFolder.Path)
  FileTxt.WriteLine(strContents)
FileTxt.Close


objFSO.GetFile("karbantartas setup.vbs").Delete




