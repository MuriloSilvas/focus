Set objShell = CreateObject("WScript.Shell")
Set objFSO = CreateObject("Scripting.FileSystemObject")

strDir = objFSO.GetParentFolderName(WScript.ScriptFullName)
strScript = strDir & "\myapp.py"

' Tenta encontrar pythonw no PATH
Dim strPython
strPython = ""

' Verifica py launcher (mais confiavel no Windows)
If objFSO.FileExists("C:\Windows\py.exe") Then
    strPython = "pythonw"
End If

' Tenta caminhos comuns do Python
If strPython = "" Then
    Dim arrPaths(5)
    arrPaths(0) = objShell.ExpandEnvironmentStrings("%LOCALAPPDATA%") & "\Programs\Python\Python313\pythonw.exe"
    arrPaths(1) = objShell.ExpandEnvironmentStrings("%LOCALAPPDATA%") & "\Programs\Python\Python312\pythonw.exe"
    arrPaths(2) = objShell.ExpandEnvironmentStrings("%LOCALAPPDATA%") & "\Programs\Python\Python311\pythonw.exe"
    arrPaths(3) = objShell.ExpandEnvironmentStrings("%LOCALAPPDATA%") & "\Programs\Python\Python310\pythonw.exe"
    arrPaths(4) = "C:\Python313\pythonw.exe"
    arrPaths(5) = "C:\Python312\pythonw.exe"
    
    Dim i
    For i = 0 To 5
        If objFSO.FileExists(arrPaths(i)) Then
            strPython = """" & arrPaths(i) & """"
            Exit For
        End If
    Next
End If

' Fallback para pythonw no PATH
If strPython = "" Then
    strPython = "pythonw"
End If

objShell.CurrentDirectory = strDir
objShell.Run strPython & " """ & strScript & """", 0, False
