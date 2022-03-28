SetWorkingDir, %A_ScriptDir%\apps

#IfWinActive

global g_stock1 := 
global g_stock2 := 
global g_stock3 := 
global g_stock4 := 
global g_stock5 := 
global g_stock6 := 
global g_stock7 := 
global g_stock8 := 
global g_stock9 := 
global g_stock0 := 

global g_active_id := 
global g_string := 
global g_num := 

global g_is_default := False
global g_is_serial := False
global g_first_num := 
global g_last_num := 
global g_is_enter := 1
global g_is_down := 0

;copy stock function
^1::
    backup_cb = %ClipboardAll%
    Clipboard = 
    Send, ^c
    g_stock1 = %ClipboardAll%
    Clipboard = %backup_cb%
    MsgBox, Stock1
    Return
^2::
    backup_cb = %ClipboardAll%
    Clipboard = 
    Send, ^c
    g_stock2 = %ClipboardAll%
    Clipboard = %backup_cb%
    MsgBox, Stock2
    Return
^3::
    backup_cb = %ClipboardAll%
    Clipboard = 
    Send, ^c
    g_stock3 = %ClipboardAll%
    Clipboard = %backup_cb%
    MsgBox, Stock3
    Return
^4::
    backup_cb = %ClipboardAll%
    Clipboard = 
    Send, ^c
    g_stock4 = %ClipboardAll%
    Clipboard = %backup_cb%
    MsgBox, Stock4
    Return
^5::
    backup_cb = %ClipboardAll%
    Clipboard = 
    Send, ^c
    g_stock5 = %ClipboardAll%
    Clipboard = %backup_cb%
    MsgBox, Stock5
    Return
^6::
    backup_cb = %ClipboardAll%
    Clipboard = 
    Send, ^c
    g_stock6 = %ClipboardAll%
    Clipboard = %backup_cb%
    MsgBox, Stock6
    Return
^7::
    backup_cb = %ClipboardAll%
    Clipboard = 
    Send, ^c
    g_stock7 = %ClipboardAll%
    Clipboard = %backup_cb%
    MsgBox, Stock7
    Return
^8::
    backup_cb = %ClipboardAll%
    Clipboard = 
    Send, ^c
    g_stock8 = %ClipboardAll%
    Clipboard = %backup_cb%
    MsgBox, Stock8
    Return
^9::
    backup_cb = %ClipboardAll%
    Clipboard = 
    Send, ^c
    g_stock9 = %ClipboardAll%
    Clipboard = %backup_cb%
    MsgBox, Stock9
    Return
^0::
    backup_cb = %ClipboardAll%
    Clipboard = 
    Send, ^c
    g_stock0 = %ClipboardAll%
    Clipboard = %backup_cb%
    MsgBox, Stock0
    Return
!1::
    backup_cb = %ClipboardAll%
    Clipboard = %g_stock1%
    Send, ^v
    Clipboard = %backup_cb%
    Return
!2::
    backup_cb = %ClipboardAll%
    Clipboard = %g_stock2%
    Send, ^v
    Clipboard = %backup_cb%
    Return
!3::
    backup_cb = %ClipboardAll%
    Clipboard = %g_stock3%
    Send, ^v
    Clipboard = %backup_cb%
    Return
!4::
    backup_cb = %ClipboardAll%
    Clipboard = %g_stock4%
    Send, ^v
    Clipboard = %backup_cb%
    Return
!5::
    backup_cb = %ClipboardAll%
    Clipboard = %g_stock5%
    Send, ^v
    Clipboard = %backup_cb%
    Return
!6::
    backup_cb = %ClipboardAll%
    Clipboard = %g_stock6%
    Send, ^v
    Clipboard = %backup_cb%
    Return
!7::
    backup_cb = %ClipboardAll%
    Clipboard = %g_stock7%
    Send, ^v
    Clipboard = %backup_cb%
    Return
!8::
    backup_cb = %ClipboardAll%
    Clipboard = %g_stock8%
    Send, ^v
    Clipboard = %backup_cb%
    Return
!9::
    backup_cb = %ClipboardAll%
    Clipboard = %g_stock9%
    Send, ^v
    Clipboard = %backup_cb%
    Return
!0::
    backup_cb = %ClipboardAll%
    Clipboard = %g_stock0%
    Send, ^v
    Clipboard = %backup_cb%
    Return
^+A::
    stock1 := "Empty"
    stock2 := "Empty"
    stock3 := "Empty"
    stock4 := "Empty"
    stock5 := "Empty"
    stock6 := "Empty"
    stock7 := "Empty"
    stock8 := "Empty"
    stock9 := "Empty"
    stock0 := "Empty"
    If(g_stock1)
        stock1 := "Full"
    If(g_stock2)
        stock2 := "Full"
    If(g_stock3)
        stock3 := "Full"
    If(g_stock4)
        stock4 := "Full"
    If(g_stock5)
        stock5 := "Full"
    If(g_stock6)
        stock6 := "Full"
    If(g_stock7)
        stock7 := "Full"
    If(g_stock8)
        stock8 := "Full"
    If(g_stock9)
        stock9 := "Full"
    If(g_stock0)
        stock0 := "Full"
    MsgBox, Stock1 = %stock1%`nStock2 = %stock2%`nStock3 = %stock3%`nStock4 = %stock4%`nStock5 = %stock5%`nStock6 = %stock6%`nStock7 = %stock7%`nStock8 = %stock8%`nStock9 = %stock9%`nStock0 = %stock0%
    Return
^+C::
    g_stock1 := 
    g_stock2 := 
    g_stock3 := 
    g_stock4 := 
    g_stock5 := 
    g_stock6 := 
    g_stock7 := 
    g_stock8 := 
    g_stock9 := 
    g_stock0 := 
    MsgBox, All Clear
    Return

;paste function
^+V::
    WinGet, active_id, ID, A
    g_active_id := active_id
    g_is_default := True
    g_is_serial := False
    Gui, Add, Text
    Gui, Add, Text, , Please input string.
    Gui, Add, Edit, W200 vg_string
    Gui, Add, Text
    Gui, Add, Text, , Please input repeat count.
    Gui, Add, Edit, W200 vg_num
    Gui, Add, Text
    Gui, Add, Radio, Group vg_is_enter, Enter
    Gui, Add, Radio, x+0 vg_is_down, Down
    If(g_is_enter)
    {
        GuiControl, , g_is_enter, 1
    }
    Else If(g_is_down)
    {
        GuiControl, , g_is_down, 1
    }
    Gui, Add, Text
    Gui, Add, Text
    Gui, Add, Button, W100 X25 Default, OK
    Gui, Add, Button, W100 X+0, Cancel
    Gui, Show
    Return
^+!V::
    WinGet, active_id, ID, A
    g_active_id := active_id
    g_is_default := False
    g_is_serial := True
    Gui, Add, Text
    Gui, Add, Text, , Please input first number.
    Gui, Add, Edit, W200 vg_first_num
    Gui, Add, Text
    Gui, Add, Text, , Please input last number.
    Gui, Add, Edit, W200 vg_last_num
    Gui, Add, Text
    Gui, Add, Radio, Group vg_is_enter, Enter
    Gui, Add, Radio, x+0 vg_is_down, Down
    If(g_is_enter)
    {
        GuiControl, , g_is_enter, 1
    }
    Else If(g_is_down)
    {
        GuiControl, , g_is_down, 1
    }
    Gui, Add, Text
    Gui, Add, Text
    Gui, Add, Button, W100 X25 Default, OK
    Gui, Add, Button, W100 X+0, Cancel
    Gui, Show
    Return
ButtonOK:
    Gui, Submit
    Gui, Destroy
    If(g_is_default)
    {
        DefaultStep()
    }
    Else If(g_is_serial)
    {
        SerialStep()
    }
    g_active_id := 
    Return
ButtonCancel:
GuiClose:
    Gui, Destroy
    WinActivate, ahk_id %g_active_id%
    g_active_id := 
    Return

DefaultStep()
{
    If(g_num == "" || RegExMatch(g_num, "\D"))
    {
        MsgBox, Please input a half-width natural number.`nTry again by pressing the hotkey.
        Return
    }
    backup_cb = %ClipboardAll%
    Clipboard = %g_string%
    i := 1
    If(g_is_enter)
    {
        Loop, %g_num%
        {
            If(!CancelProcess())
            {
                Clipboard = %backup_cb%
                g_string := 
                g_num := 
                Return
            }
            WinActivate, ahk_id %g_active_id%
            Send, ^v
            If(i != g_num)
                Send, {Enter}
            i++
        }
    }
    Else If(g_is_down)
    {
        Loop, %g_num%
        {
            If(!CancelProcess())
            {
                Clipboard = %backup_cb%
                g_string := 
                g_num := 
                Return
            }
            WinActivate, ahk_id %g_active_id%
            Send, ^v
            If(i != g_num)
                Send, {Down}{End}
            i++
        }
    }
    Clipboard = %backup_cb%
    g_string := 
    g_num := 
    MsgBox, Finish
}

SerialStep()
{
    If(g_first_num == "" || g_last_num == "" || RegExMatch(g_first_num, "\D") || RegExMatch(g_last_num, "\D"))
    {
        MsgBox, Please input a half-width natural number.`nTry again by pressing the hotkey.
        Return
    }
    backup_cb = %ClipboardAll%
    i = %g_first_num%
    num := g_last_num - g_first_num + 1
    If(g_is_enter)
    {
        Loop, %num%
        {
            If(!CancelProcess())
            {
                Clipboard = %backup_cb%
                g_string := 
                g_num := 
                Return
            }
            Clipboard = %i%
            WinActivate, ahk_id %g_active_id%
            Send, ^v
            If(i != g_last_num)
                Send, {Enter}
            i++
        }
    }
    Else If(g_is_down)
    {
        Loop, %num%
        {
            If(!CancelProcess())
            {
                Clipboard = %backup_cb%
                g_string := 
                g_num := 
                Return
            }
            Clipboard = %i%
            WinActivate, ahk_id %g_active_id%
            Send, ^v
            If(i != g_last_num)
                Send, {Down}{End}
            i++
        }
    }
    Clipboard = %backup_cb%
    g_first_num := 
    g_last_num := 
    MsgBox, Finish
}

CancelProcess()
{
    ;long press
    GetKeyState, result, F4, P
    If(result == "D")
    {
        MsgBox, Processing has stopped.
        Return False
    }
    
    Return True
}

;general custom
!Esc::Send, !{F4}
^Esc::Send, ^{F4}

;Snipping Tool
!PrintScreen::Run, Snipping Tool

#IfWinActive