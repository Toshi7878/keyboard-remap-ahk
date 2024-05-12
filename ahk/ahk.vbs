Option Explicit

' ファイル操作用のオブジェクトを作成
Dim objFileSystem

' カレントディレクトリのファイル一覧を取得
Sub GetFilesInCurrentDirectory(fileList)
    Set objFileSystem = CreateObject("Scripting.FileSystemObject")
    Dim objCurrentFolder
    Set objCurrentFolder = objFileSystem.GetFolder(".")

    ' ファイル一覧を取得
    Dim objFile
    For Each objFile In objCurrentFolder.Files
        If LCase(objFileSystem.GetExtensionName(objFile.Name)) <> "vbs" Then
            fileList.Add objFile.Path
        End If
    Next

    ' Fn.ahkファイルがあれば、それを配列の最後に移動する
    MoveFnAhkToLastPosition fileList
End Sub

' Fn.ahkファイルがあれば、それを配列の最後に移動する
Sub MoveFnAhkToLastPosition(fileList)
    Dim fnAhkIndex
    fnAhkIndex = -1

    ' Fn.ahkファイルのインデックスを取得する
    Dim i
    For i = 0 To fileList.Count - 1
        If InStr(LCase(fileList(i)), "fn.ahk") > 0 Then
            fnAhkIndex = i
            Exit For
        End If
    Next

    ' Fn.ahkファイルを配列の最後に移動する
    If fnAhkIndex > -1 Then
        Dim temp
        temp = fileList(fnAhkIndex)
        For i = fnAhkIndex To fileList.Count - 2
            fileList(i) = fileList(i + 1)
        Next
        fileList(fileList.Count - 1) = temp
    End If
End Sub

' ファイルを開く
Sub OpenFiles(fileList)
    Dim shell
    Set shell = CreateObject("WScript.Shell")

    ' 各ファイルを開く
    Dim fileName
    For Each fileName In fileList
        ' Fn.ahkファイルを開く前に10秒待機する
        If InStr(LCase(fileName), "fn.ahk") > 0 Then
            WScript.Sleep 10000
        End If

        ' ファイルを開く
        shell.Run """" & fileName & """", 1, False
    Next

    ' オブジェクトを解放する
    Set shell = Nothing
    Set objFileSystem = Nothing
End Sub

' メイン処理
Sub Main()
    Dim fileList
    Set fileList = CreateObject("System.Collections.ArrayList")

    ' カレントディレクトリのファイル一覧を取得
    GetFilesInCurrentDirectory fileList

    ' ファイルを開く
    OpenFiles fileList

    Set fileList = Nothing
End Sub

Main