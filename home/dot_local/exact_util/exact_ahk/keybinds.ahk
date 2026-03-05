#Requires AutoHotkey v2.0
#SingleInstance force

; mouse button 6 mapped to F20 in firmware
; for Kando; needs a modifier key for turbo mode
F20::Send("{Ctrl down}{F21}")
F20 UP::Send("{Ctrl up}")

; scrolling modifiers with back and forward buttons
BindScrollShift(button, actionUp, actionDown) {
  Hotkey(button, (*) => Send("{" . button . "}")) ; pass-through on single button press
  Hotkey(button . " & WheelUp", (*) => Send(actionUp))
  Hotkey(button . " & WheelDown", (*) => Send(actionDown))
}
BindScrollShift("XButton1", "{WheelLeft 3}", "{WheelRight 3}")
BindScrollShift("XButton2", "{WheelUp 5}", "{WheelDown 5}")

; right side of keyboard: extend mode keys
SetCapsLockState("AlwaysOff")
CapsLock:: ; disable
CapsLock UP::SetCapsLockState("AlwaysOff") ; helps accidentally capslocking on an elevated window
CapsLock & E::Send("{Down}")
CapsLock & H::Send("{PgDn}")
CapsLock & I::Send("{Right}")
CapsLock & J::Send("{PgUp}")
CapsLock & L::Send("{Home}")
CapsLock & N::Send("{Left}")
CapsLock & O::Send("{Backspace}")
CapsLock & U::Send("{Up}")
CapsLock & Y::Send("{End}")
CapsLock & `;::Send("{Delete}")

; left side of keyboard: capslock as ctrl and some extends
CapsLock & Q::Send("{Esc}")
CapsLock & W::^w
CapsLock & F::^f
CapsLock & P::^p
CapsLock & G::^g
CapsLock & A::Send("{Backspace}")
CapsLock & R::^r
CapsLock & S::^s
CapsLock & T::^t
CapsLock & D::^d
CapsLock & Z::^z
CapsLock & X::^x
CapsLock & C::^c
CapsLock & V::^v
