#Requires AutoHotkey v2.0
#UseHook

 #SingleInstance Force

 SendMode("Input")
 SetWorkingDir(A_ScriptDir)

 enterFlag := "false"
 
 ctrlKeyDown(key){
	global enterFlag ;
	enterFlag := "false"
	SendEvent("{Ctrl Down}")

	If GetKeyState("Tab", "P") {
   	 SendEvent("{Shift Down}")
	}

 Send("{Blind}{" key "}")
 SendEvent("{Ctrl Up}")
 SendEvent("{Shift Up}")
 }

 shiftKeyDown(key){
	global enterFlag ;
	enterFlag := "false"
	SendEvent("{Shift Down}")

 Send("{Blind}{" key "}")
 SendEvent("{Shift Up}")
 }


  KeyDown(key){
	global enterFlag ;
	enterFlag := "false"

	If GetKeyState("Tab", "P") {
   	 SendEvent("{Shift Down}")
	}

 Send("{Blind}{" key "}")
 SendEvent("{Shift Up}")
 }

 F13 & Tab::
{ ; V1toV2: Added bracket
 enterFlag := "true"
 return
} ; V1toV2: Added Bracket before hotkey or Hotstring

 F13 & Tab Up::
{ ; V1toV2: Added bracket
If (enterFlag = "true")
 {
  SendEvent("{Shift Down}")
  Send("{Enter}")
  SendEvent("{Shift Up}")
 }
 return
} ; V1toV2: Added Bracket before hotkey or Hotstring

 F13 & A::ctrlKeyDown("Left")
 F13 & D::ctrlKeyDown("Right")
 F13 & Q::ctrlKeyDown("BS")
 F13 & E::ctrlKeyDown("Delete")
 F13 & Z::ctrlKeyDown("z")
 F13 & X::ctrlKeyDown("x")
 F13 & C::ctrlKeyDown("c")
 F13 & V::ctrlKeyDown("v")
 F13 & F::ctrlKeyDown("f")
 F13 & Y::ctrlKeyDown("y")
 F13 & R::ctrlKeyDown("a")
 F13 & Space::shiftKeyDown("Space")
 F13 & G::KeyDown("PgDn")
 F13 & T::KeyDown("PgUp")
 F13::KeyDown("Enter")
 F13 & W::KeyDown("Up")
 F13 & S:: KeyDown("Down")


;右
 F13 & H::KeyDown("Left")
 F13 & J::KeyDown("Up")
 F13 & K::KeyDown("Down")
 F13 & L::KeyDown("Right")
 F13 & U::KeyDown("BS")
 F13 & I::KeyDown("Home")
 F13 & O::KeyDown("End")
 F13 & P::KeyDown("Delete")
; F13 & B::KeyDown("PgDn")
 Pause::BS


 ;Function Key
 F13 & 1::KeyDown("F1")
 F13 & 2::KeyDown("F2")
 F13 & 3::KeyDown("F3")
 F13 & 4::KeyDown("F4")
 F13 & 5::KeyDown("F5")
 F13 & 6::KeyDown("F6")
 F13 & 7::KeyDown("F7")
 F13 & 8::KeyDown("F8")
 F13 & 9::KeyDown("F9")
 F13 & 0::KeyDown("F10")
 F13 & -::KeyDown("F11")
 F13 & ^::KeyDown("F12")

;Right Symbol Keys
 F13 & ,::KeyDown("<")
 F13 & .::KeyDown(">")
 F13 & /::KeyDown("?")
 F13 & @::KeyDown("{")
 F13 & [::KeyDown("}")
 PgUp:: Send("{Enter}")
 PgDn:: Send("{Enter}")

