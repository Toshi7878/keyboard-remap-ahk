#Requires AutoHotkey v2.0
#UseHook
#SingleInstance Force

!a::{
	ErrorLevel := ProcessExist("chrome.exe") ;起動しているかどうかを調べる
	if (ErrorLevel != 0) ;起動していた場合(ErrorLevel変数にプロセスIDが格納される)
		WinActivate("ahk_pid " ErrorLevel) ;そのプロセスのウィンドウをアクティブにする
	Else ;起動していなかった場合
		Run("`"C:\Program Files\Google\Chrome\Application\chrome.exe`"--disable-features=DownloadBubble") ;起動する
	return
}

!q::{
	ErrorLevel := ProcessExist("code.exe")
	if (ErrorLevel != 0)
		WinActivate("ahk_pid " ErrorLevel)
	Else
		Run("`"C:\Users\Toshi\AppData\Local\Programs\Microsoft VS Code\Code.exe`"")
	return
}