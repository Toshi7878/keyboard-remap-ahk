#Requires AutoHotkey v2.0
#UseHook
#SingleInstance Force

SendMode("Input")
SetWorkingDir(A_ScriptDir)

isEnterFlagOn := false

; 関数定義
CtrlKeyDown(key) {
    global isEnterFlagOn
    isEnterFlagOn := false
    Send("{Ctrl Down}")

    If GetKeyState("Tab", "P") Or GetKeyState("Space", "P")
        Send("{Shift Down}")

    Send("{Blind}{" key "}")
    Send("{Ctrl Up}{Shift Up}")
}

ShiftKeyDown(key) {
    global isEnterFlagOn
    isEnterFlagOn := false
    Send("{Shift Down}{Blind}{" key "}{Shift Up}")
}



KeyDown(key) {
    global isEnterFlagOn
    isEnterFlagOn := false

    If GetKeyState("Tab", "P") Or GetKeyState("Space", "P")
        Send("{Shift Down}")

    Send("{Blind}{" key "}{Shift Up}")
}

; ホットキー定義
F13 & Tab::{
	global isEnterFlagOn
    isEnterFlagOn := true
	return
}


F13 & Tab Up::{
	global isEnterFlagOn

    If (isEnterFlagOn) {
        ShiftKeyDown("Enter")
        isEnterFlagOn := false
    }

return
}



F13 & A::CtrlKeyDown("Left")
F13 & D::CtrlKeyDown("Right")
F13 & Q::ctrlKeyDown("BS")
F13 & E::CtrlKeyDown("Delete")
F13 & Z::CtrlKeyDown("z")
F13 & X::CtrlKeyDown("x")
F13 & C::CtrlKeyDown("c")
F13 & V::CtrlKeyDown("v")
F13 & F::CtrlKeyDown("f")
F13 & Y::CtrlKeyDown("y")
F13 & R::CtrlKeyDown("a")
+F13::ShiftKeyDown("Capslock")
F13 & Space::return
F13 & G::KeyDown("PgDn")
F13 & T::KeyDown("PgUp")
F13::KeyDown("Enter")
F13 & W::KeyDown("Up")
F13 & S:: KeyDown("Down")

;右
F13 & H::KeyDown("Left")
F13 & J::KeyDown("Down")
F13 & K::KeyDown("Up")
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