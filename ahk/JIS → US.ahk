#Requires AutoHotkey v2.0
#UseHook

#SingleInstance Force

SendMode("Input")
SetWorkingDir(A_ScriptDir)

isKeyMappingEnabled := true

^#Up::{
	global isKeyMappingEnabled ;
	isKeyMappingEnabled := !isKeyMappingEnabled
	status := (isKeyMappingEnabled ? "US" : "JIS")
	MsgBox(status)
	return
}

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 1??
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
#HotIf isKeyMappingEnabled
+2:: Send("{!}")  ; Shift + 2         ["] -> @
+1:: Send("{@}")  ; Shift + 2         ["] -> @
+6:: Send("{&}")  ; Shift + 6         [&] -> ^
+7:: Send("{^}")  ; Shift + 7         ['] -> &
 ^:: Send("{+}")  ;                   [^] -> =
+^:: Send("{*}")  ; Shift + ^         [~] -> +

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 2??
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 @::[             ;                   [@] -> [
+@::Send("{{}")    ; Shift + @         [`] -> {
 [:: Send("{]}") ;                  [[] -> ]
+[:: Send("{}}") ;                  [[] -> ]

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; 3??
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
+;:: Send("{:}")  ; Shift + ;         [+] -> :
 ::: Send("{'}")  ;                   [:] -> '
 *:: Send("{`"}") ; Shift + :         [*] -> "
+]:: Send("{~}")  ; Shift + ]         [}] -> ~
 ]:: Send("{``}") ;                   []] -> `
