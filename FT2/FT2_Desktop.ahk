;FT2_Desktop.ahk
;(c) 2019-2025, yoshiki
;
;when used,
;Install>   http://www.autohotkey.com/download/
;modifier key>   ^ Ctrl , ! Alt , + Shift , # Win

;size 23inch
;resolution 1920x1080
;aspect ratio 16:9

#HotkeyInterval 1000
#MaxHotkeysPerInterval 500

SetDefaultMouseSpeed, 0
SetMouseDelay, -1

SetWorkingDir,%A_ScriptDir%\sounds



;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

GroupAdd, FT2_Windows, ahk_class TMainForm.UnicodeClass
GroupAdd, FT2_Windows, ahk_class TMarketOrderFrm.UnicodeClass
GroupAdd, FT2_Windows, ahk_class TClosePartialFrm.UnicodeClass

#IfWinActive ahk_group FT2_Windows


;nothing


#IfWinActive



;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#IfWinActive ahk_class TMainForm.UnicodeClass


; ******************
; *     Cursur     *
; ******************
;Ctrl+ F,X → cross cursor
X::
    Send ^f
    MouseGetPos, xpos, ypos
    xxpos := xpos + 1
    yypos := ypos + 1
    MouseMove, %xxpos%, %yypos%
    Return


; ******************
; *      Line      *
; ******************
;vertical line
V::
    PostMessage, 0x111, 100, 0
    MouseGetPos, xpos, ypos
    yypos := ypos + 1
    MouseMove, %xpos%, %yypos%
    Return

;horizontal line
H::
    PostMessage, 0x111, 101, 0
    MouseGetPos, xpos, ypos
    xxpos := xpos + 1
    MouseMove, %xxpos%, %ypos%
    Return

;trend line
T::
    PostMessage, 0x111, 103, 0
    MouseGetPos, xpos, ypos
    xxpos := xpos + 1
    yypos := ypos + 1
    MouseMove, %xxpos%, %yypos%
    Return


; ******************
; * Object Control *
; ******************
;delete object
Z::Send {Del}


; ******************
; *    Interface   *
; ******************
;data window
^D::PostMessage, 0x111,59,0

;terminal
^T::PostMessage, 0x111,60,0


; *********************
; *      Terminal     *
; *********************
;hold position
F1::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 40
    MouseGetPos, xpos, ypos
    MouseClick, left, 90, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;limit order
F2::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 40
    MouseGetPos, xpos, ypos
    MouseClick, left, 200, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;account history
F3::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 40
    MouseGetPos, xpos, ypos
    MouseClick, left, 285, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;operation history
F4::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 40
    MouseGetPos, xpos, ypos
    MouseClick, left, 350, %yylen%
    MouseMove, %xpos%, %ypos%
    Return


; ******************
; *      Chart     *
; ******************
;line chart
W::PostMessage, 0x111, 62, 0

;candle stick
Q::PostMessage, 0x111, 64, 0

;auto scroll
E::PostMessage, 0x111, 75, 0

;right shift
R::PostMessage, 0x111, 76, 0

;step forward
Enter::PostMessage, 0x111, 143, 0


; ******************
; *      Order     *
; ******************
;order
Space::
    Send {F2}
    SoundPlay, please_order-_buy_or_sell.mp3
    Return

;close position after selection
Numpad0 & NumpadEnter::
    Send {F5}
    Return

;close part after selection
NumpadDot & NumpadEnter::
    Send ^{F5}
    Return

;close all
NumpadEnter::
    Send ^c
    Return


; ******************
; *   Timeframe    *
; ******************
;timeframe M1
`;::
    WinGet active_hundle, ID, A
    hBuf := DllCall("user32\FindWindowEx", "UInt", active_hundle, "UInt", 0, "Str", "MDIClient", "UInt", 0, "UInt")
    hBuf := DllCall("user32\FindWindowEx", "UInt", hBuf, "UInt", 0, "Str", "TChartWindow.UnicodeClass", "UInt", 0, "UInt")
    ControlGet , Hundle, Hwnd, , , ahk_id %hBuf%
    if (ErrorLevel = 0) {
        PostMessage, 0x111, 70, 0
    }
    Return

;timeframe M5
L::
    WinGet active_hundle, ID, A
    hBuf := DllCall("user32\FindWindowEx", "UInt", active_hundle, "UInt", 0, "Str", "MDIClient", "UInt", 0, "UInt")
    hBuf := DllCall("user32\FindWindowEx", "UInt", hBuf, "UInt", 0, "Str", "TChartWindow.UnicodeClass", "UInt", 0, "UInt")
    ControlGet , Hundle, Hwnd, , , ahk_id %hBuf%
    if (ErrorLevel = 0) {
        PostMessage, 0x111, 71, 0
    }
    Return

;timeframe M15
K::
    WinGet active_hundle, ID, A
    hBuf := DllCall("user32\FindWindowEx", "UInt", active_hundle, "UInt", 0, "Str", "MDIClient", "UInt", 0, "UInt")
    hBuf := DllCall("user32\FindWindowEx", "UInt", hBuf, "UInt", 0, "Str", "TChartWindow.UnicodeClass", "UInt", 0, "UInt")
    ControlGet , Hundle, Hwnd, , , ahk_id %hBuf%
    if (ErrorLevel = 0) {
        PostMessage, 0x111, 72, 0
    }
    Return

;timeframe H1
J::
    WinGet active_hundle, ID, A
    hBuf := DllCall("user32\FindWindowEx", "UInt", active_hundle, "UInt", 0, "Str", "MDIClient", "UInt", 0, "UInt")
    hBuf := DllCall("user32\FindWindowEx", "UInt", hBuf, "UInt", 0, "Str", "TChartWindow.UnicodeClass", "UInt", 0, "UInt")
    ControlGet , Hundle, Hwnd, , , ahk_id %hBuf%
    if (ErrorLevel = 0) {
        PostMessage, 0x111, 186, 0
    }
    Return

;timeframe H4
P::
    WinGet active_hundle, ID, A
    hBuf := DllCall("user32\FindWindowEx", "UInt", active_hundle, "UInt", 0, "Str", "MDIClient", "UInt", 0, "UInt")
    hBuf := DllCall("user32\FindWindowEx", "UInt", hBuf, "UInt", 0, "Str", "TChartWindow.UnicodeClass", "UInt", 0, "UInt")
    ControlGet , Hundle, Hwnd, , , ahk_id %hBuf%
    if (ErrorLevel = 0) {
        PostMessage, 0x111, 187, 0
    }
    Return

;timeframe D1
O::
    WinGet active_hundle, ID, A
    hBuf := DllCall("user32\FindWindowEx", "UInt", active_hundle, "UInt", 0, "Str", "MDIClient", "UInt", 0, "UInt")
    hBuf := DllCall("user32\FindWindowEx", "UInt", hBuf, "UInt", 0, "Str", "TChartWindow.UnicodeClass", "UInt", 0, "UInt")
    ControlGet , Hundle, Hwnd, , , ahk_id %hBuf%
    if (ErrorLevel = 0) {
        PostMessage, 0x111, 188, 0
    }
    Return

;timeframe W1
I::
    WinGet active_hundle, ID, A
    hBuf := DllCall("user32\FindWindowEx", "UInt", active_hundle, "UInt", 0, "Str", "MDIClient", "UInt", 0, "UInt")
    hBuf := DllCall("user32\FindWindowEx", "UInt", hBuf, "UInt", 0, "Str", "TChartWindow.UnicodeClass", "UInt", 0, "UInt")
    ControlGet , Hundle, Hwnd, , , ahk_id %hBuf%
    if (ErrorLevel = 0) {
        PostMessage, 0x111, 189, 0
    }
    Return

;timeframe MN
U::
    WinGet active_hundle, ID, A
    hBuf := DllCall("user32\FindWindowEx", "UInt", active_hundle, "UInt", 0, "Str", "MDIClient", "UInt", 0, "UInt")
    hBuf := DllCall("user32\FindWindowEx", "UInt", hBuf, "UInt", 0, "Str", "TChartWindow.UnicodeClass", "UInt", 0, "UInt")
    ControlGet , Hundle, Hwnd, , , ahk_id %hBuf%
    if (ErrorLevel = 0) {
        PostMessage, 0x111, 190, 0
    }
    Return


; ******************
; *    Project     *
; ******************
;open project
1::PostMessage, 0x111, 36, 0

;save project
2::
    PostMessage, 0x111, 37, 0
    SoundPlay, wait.mp3
    Return

;save new name project
3::PostMessage, 0x111, 38, 0


#IfWinActive



;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#IfWinActive ahk_class TMarketOrderFrm.UnicodeClass


; ******************
; *   The Order    *
; ******************
;select lots
NumpadDiv::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 205
    MouseGetPos, xpos, ypos
    MouseClick, left, 140, %yylen%
    MouseClick, left, 140, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;sell
NumpadMult & NumpadSub::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 20
    MouseGetPos, xpos, ypos
    MouseClick, left, 200, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;buy
NumpadMult & NumpadAdd::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 20
    MouseGetPos, xpos, ypos
    MouseClick, left, 305, %yylen%
    MouseMove, %xpos%, %ypos%
    Return


#IfWinActive



;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#IfWinActive ahk_class TClosePartialFrm.UnicodeClass


; ******************
; * The Part Close *
; ******************
;select lots
NumpadDiv::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 70
    MouseGetPos, xpos, ypos
    MouseClick, left, 80, %yylen%
    MouseClick, left, 80, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;close ok
NumpadEnter::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 20
    MouseGetPos, xpos, ypos
    MouseClick, left, 60, %yylen%
    MouseMove, %xpos%, %ypos%
    Return


#IfWinActive



;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
