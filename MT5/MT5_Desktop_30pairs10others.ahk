;MT5_Desktop_30pairs10others.ahk
;(c) 2022-2024, pgming
;
;when used,
;Install>       http://www.autohotkey.com/download/
;modifier key>  ^ Ctrl , ! Alt , + Shift , # Win

;;a function that returns 1 if Fast Navigation has focus.
;CheckFN() {
;    ControlGetFocus, control
;    IfNotInString, control, Edit, Return 0
;    Return 1
;}
;
;;example
;1::
;    if Check FN()==0
;        ;1 minute candlestick switching instruction.
;        PostMessage, 0x111,33137,0
;    else
;        ;send 1 key (assigned key).
;        Send 1
;    Return

;size 23inch
;resolution 1920x1080
;aspect ratio 16:9

#HotkeyInterval 1000
#MaxHotkeysPerInterval 500

SetDefaultMouseSpeed, 0
SetMouseDelay, -1

SetWorkingDir, %A_ScriptDir%\sounds



;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

GroupAdd, MT5_Windows, ahk_class MetaQuotes::MetaTrader::5.00
GroupAdd, MT5_Windows, ahk_class #32770

#IfWinActive ahk_group MT5_Windows


;global variable
global u := 0
global k := 0
global g_unit := 
global g_capital := 
global g_risk := 
global g_active_id := 

;default text
unittext := "100000"
capitext := "100000"
risktext := "100"


; ******************
; *  Lot Manager   *
; ******************
;lot management (set)
Home::
    WinGet, active_id, ID, A
    g_active_id := active_id
    Gui, Add, Text
    Gui, Add, Text, , 通貨単位
    Gui, Add, Edit, W200 vg_unit, 100000
    Gui, Add, Text
    Gui, Add, Text, , 元本[円]
    Gui, Add, Edit, W200 vg_capital, 100000
    Gui, Add, Text
    Gui, Add, Text, , リスク率[`%]
    Gui, Add, Edit, W200 vg_risk, 100
    Gui, Add, Text
    Gui, Add, Button, W100 X25 Default , OK
    Gui, Add, Button, W100 X+0, Cancel
    Gui, Show
    Return

;result
ButtonOK:
    Gui, Submit
    Gui, Destroy
    global u := g_unit
    global k := (g_capital * g_risk) / u  ;(capital * (risk * 100) * 0.01) / u
    SoundPlay, it_was_processed.mp3
    MsgBox, , Lot Manager, `n
        . unit 		= %u%`n
        . capital 		= %g_capital%円`n
        . risk 		= %g_risk%`%`n
        . k 		= %k%
    WinActivate, ahk_id %g_active_id%
    Return
ButtonCancel:
GuiClose:
    Gui, Destroy
    Return

;lot management (unset)
End::
    global k := 0
    SoundPlay, it_was_processed.mp3
    MsgBox, , Lot Manager, Unset
    return


#IfWinActive



;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#IfWinActive ahk_class MetaQuotes::MetaTrader::5.00


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
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 775, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;horizontal line
H::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 810, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;trend line
T::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 845, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

; ******************
; * Object Control *
; ******************
;delete object
Z::Send {Del}


; *********************
; *      Terminal     *
; *********************
;hold position
F1::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 50
    MouseGetPos, xpos, ypos
    MouseClick, left, 50, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;operation ratio
F2::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 50
    MouseGetPos, xpos, ypos
    MouseClick, left, 105, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;account history
F3::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 50
    MouseGetPos, xpos, ypos
    MouseClick, left, 165, %yylen%
    MouseMove, %xpos%, %ypos%
    Return


; ******************
; *      Chart     *
; ******************
;auto scroll
E::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 30, %yylen%
    MouseMove, %xpos%, %ypos%
    Return


; ******************
; *      Order     *
; ******************
;order
Space::
    Send {F9}
    SoundPlay, please_order-_buy_or_sell.mp3
    Return

;option (one click order ← check)
!Space::Send ^o


; ******************
; *   Timeframe    *
; ******************
;timeframe M1
`;::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 510, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;timeframe M5
L::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 545, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;timeframe M15
K::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 580, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;timeframe H1
J::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 610, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;timeframe H4
P::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 645, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;timeframe D1
O::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 675, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;timeframe W1
I::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 705, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;timeframe MN
U::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 740, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

; ******************
; *    Profile     *
; ******************
;12
;-------------------------------------------------------------------
;Default
D::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send d
    Return

;11NZDJPY
1 & Space::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send +`;
    Return

;12NZDCHF
1 & 2::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send `,
    Return

;13NZDCAD
1 & 3::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send -
    Return

;14NZDUSD
1 & 4::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send .
    Return

;21AUDNZD
2 & 1::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send 0
    Return

;22AUDJPY
2 & Space::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send 1
    Return

;23AUDCHF
2 & 3::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send 2
    Return

;24AUDCAD
2 & 4::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send 3
    Return

;25AUDUSD
2 & 5::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send 4
    Return

;31EURNZD
3 & 1::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send 5
    Return

;32EURAUD
3 & 2::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send 6
    Return

;33EURJPY
3 & Space::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send 7
    Return

;34EURCHF
3 & 4::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send 8
    Return

;35EURNOK
3 & 5::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send 9
    Return

;36EURGBP
3 & 6::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send `;
    Return

;37EURCAD
3 & 7::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send +-
    Return

;38EURUSD
3 & 8::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send @
    Return

;41CHFJPY
4 & 1::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send [
    Return

;51GBPNZD
5 & 1::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send ]
    Return

;52GBPAUD
5 & 2::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send a
    Return

;53GBPJPY
5 & 3::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send b
    Return

;54GBPCHF
5 & 4::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send c
    Return

;55GBPCAD
5 & Space::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send e
    Return

;56GBPUSD
5 & 6::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send f
    Return

;61CADJPY
6 & 1::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send g
    Return

;62CADCHF
6 & 2::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send h
    Return

;71USDJPY
7 & 1::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send i
    Return

;72USDCHF
7 & 2::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send j
    Return

;73USDNOK
7 & 3::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send k
    Return

;74USDCAD
7 & 4::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send l
    Return

;81GOLD
8 & 1::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send m
    Return

;82SILVER
8 & 2::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send o
    Return

;91JP225Cash
9 & 1::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send q
    Return

;92EU50Cash
9 & 2::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send t
    Return

;93GER40Cash
9 & 3::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send u
    Return

;94UK100Cash
9 & 4::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send v
    Return

;95US30Cash(Dow Jones 30-Stock Industrial Average [NY Dow 30])
9 & 5::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send w
    Return

;96US500Cash(Standard & Poor's 500 Stock Index [S&P 500])
9 & 6::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send x
    Return

;97US100Cash(NASDAQ-100 [NDX])
9 & 7::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send y
    Return

;999OILCash
9 & Alt::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 990
    MouseGetPos, xpos, ypos
    MouseClick, left, 110, %yylen%
    MouseMove, %xpos%, %ypos%
    Send z
    Return


#IfWinActive



;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#IfWinActive ahk_class #32770


; ******************
; *   The Order    *
; ******************
;lots, lot management (run)
NumpadDiv::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 270
    MouseGetPos, xpos, ypos
    MouseClick, left, 485, %yylen%
    MouseClick, left, 485, %yylen%
    MouseMove, %xpos%, %ypos%
    if(k == 0) {
        Return
    }
    
    ;===============================================================
    ;<lot management formula>
    ;lots                                           = capital [jpy] / (currency unit * pips * pip value multiple * 0.01)
    ;pip value multiple [basic currency jpy]        = pip value * 0.001
    ;※1 pip value [basic currency jpy]             = (1pip [currency pair pip] / exchange rate [x/y]) * lot size [currency unit] * exchange rate [x/jpy]
    ;※2 pip value [basic currency jpy] (non pair)  = 1pip [non pair pip] * lot size [currency unit] * exchange rate [x/jpy] (none for JP225Cash)
    ;===============================================================
    ;<onepip>
    ;X/JPY PAIR = 0.01
    ;ELSE PAIR  = 0.0001
    
    ;onepip                 = origin onepip * multiple method
    ;GOLD       = 0.0001    = 0.1           * 0.001
    ;SIlVER     = 0.0005    = 0.01          * 0.05
    ;JP225Cash  = 0.0001    = 10            * 0.00001
    ;EU50Cash   = 0.000001  = 0.1           * 0.00001
    ;GER40Cash  = 0.000001  = 0.1           * 0.00001
    ;UK100Cash  = 0.000001  = 0.1           * 0.00001
    ;US30Cash   = 0.000001  = 0.1           * 0.00001
    ;US500Cash  = 0.000001  = 0.1           * 0.00001
    ;US100Cash  = 0.000001  = 0.1           * 0.00001
    ;OILCash    = 0.0001    = 0.1           * 0.001
    ;===============================================================
    ;<origin onepip>
    ;GOLD       = 0.1
    ;SILVER     = 0.01
    ;JP225Cash  = 10
    ;EU50Cash   = 0.1
    ;GER40Cash  = 0.1
    ;UK100Cash  = 0.1
    ;US30Cash   = 0.1
    ;US500Cash  = 0.1
    ;US100Cash  = 0.1
    ;OILCash    = 0.1
    ;===============================================================
    ;<multiple method>
    ;GOLD       = 0.001
    ;SILVER     = 0.05
    ;JP225Cash  = 0.00001
    ;EU50Cash   = 0.00001
    ;GER40Cash  = 0.00001
    ;UK100Cash  = 0.00001
    ;US30Cash   = 0.00001
    ;US500Cash  = 0.00001
    ;US100Cash  = 0.00001
    ;OILCash    = 0.001
    ;===============================================================
    
    ;run
    InputBox, pips, Lot Manager, Pips, , , , 0
    if(ErrorLevel <> 0) {
        return
    }
    path := "C:\Users\[User Name]\AppData\Roaming\MetaQuotes\Terminal\[MT5 Serial]\MQL5\Files\ExchangeRate.txt"
    FileReadLine, pair, %path%, 1
    MsgBox, %pair%
    onepip := 0
    if(pair = "NZDCHF" || pair = "NZDCAD" || pair = "NZDUSD" || pair = "AUDNZD" || pair = "AUDCHF" || pair = "AUDCAD" || pair = "AUDUSD" || pair = "EURNZD" || pair = "EURAUD" || pair = "EURCHF" || pair = "EURNOK" || pair = "EURGBP" || pair = "EURCAD" || pair = "EURUSD" || pair = "GBPNZD" || pair = "GBPAUD" || pair = "GBPCHF" || pair = "GBPCAD" || pair = "GBPUSD" || pair = "CADCHF" || pair = "USDCHF" || pair = "USDNOK" || pair = "USDCAD" || pair = "GOLD" || pair = "JP225Cash" || pair = "OILCash") {
        onepip := 0.0001
    }
    else if(pair = "NZDJPY" || pair = "AUDJPY" || pair = "EURJPY" || pair = "CHFJPY" || pair = "GBPJPY" || pair = "CADJPY" || pair = "USDJPY") {
        onepip := 0.01
    }
    else if(pair = "EU50Cash" || pair = "GER40Cash" || pair = "UK100Cash" || pair = "US30Cash" || pair = "US500Cash" || pair = "US100Cash") {
        onepip := 0.000001
    }
    else if(pair = "SILVER") {
        onepip := 0.0005
    }
    else {
        MsgBox, , Lot Manager, Error.`nUnsupported pair.
        MsgBox, , Lot Manager, Please try again from the beginning.
        return
    }
    l           := 0
    multiple    := 0
    lots        := 0
    slot        := 0
    l := k / pips
    if(pair = "GOLD" || pair = "SILVER" || pair = "JP225Cash" || pair = "EU50Cash" || pair = "GER40Cash" || pair = "UK100Cash" || pair = "US30Cash" || pair = "US500Cash" || pair = "US100Cash" || pair = "OILCash") {
        if(pair = "JP225Cash") {
            multiple := onepip * u * 0.001
            xy := 
            xjpy := 
        }
        else {
            FileReadLine, crossjpy, %path%, 3
            FileReadLine, xjpy, %path%, 4
            MsgBox, %crossjpy%`n%xjpy%
            multiple := onepip * u * xjpy * 0.001
            xy := 
        }
        lots := l / multiple
        if(pair = "GOLD" || pair = "SILVER" || pair = "OILCash") {
            i := Round(lots, 2) - lots
            if(i <= 0) {
                slot := Round(lots, 2)
            }
            else {
                slot := Round(lots, 2) - 0.01
            }
        }
        else {
            i := Round(lots, 1) - lots
            if(i <= 0) {
                slot := Round(lots, 1)
            }
            else {
                slot := Round(lots, 1) - 0.1
            }
        }
    }
    else {
        FileReadLine, xy, %path%, 2
        MsgBox, %pair%`n%xy%
        if(pair = "NZDJPY" || pair = "AUDJPY" || pair = "EURJPY" || pair = "CHFJPY" || pair = "GBPJPY" || pair = "CADJPY" || pair = "USDJPY") {
            multiple := (onepip / xy) * u * xy * 0.001
            xjpy := 
        }
        else {
            FileReadLine, crossjpy, %path%, 3
            FileReadLine, xjpy, %path%, 4
            MsgBox, %crossjpy%`n%xjpy%
            multiple := (onepip / xy) * u * xjpy * 0.001
        }
        lots := l / multiple
        i := Round(lots, 2) - lots
        if(i <= 0) {
            slot := Round(lots, 2)
        }
        else {
            slot := Round(lots, 2) - 0.01
        }
    }
    StringUpper, pairup, pair
    SoundPlay, it_was_processed.mp3
    MsgBox, , Lot Manager, `n
        . pips					= %pips%`n
        . pair [x/y]				= %pairup%`n
        . 1pip [x/y]				= %onepip%`n
        . exchange rate [x/y] 			= %xy%`n
        . lot size					= %u%`n
        . exchange rate [x/jpy] 			= %xjpy%`n
        . multiple				= %multiple%`n
        . lots					= %lots%`n
        . slot					= %slot%
    
    ;output
    cb_bk       = %ClipboardAll%
    Clipboard   =
    Clipboard   = %slot%
    Send, ^v
    Sleep, 200
    Clipboard   = %cb_bk%
    
    Return

;sell
NumpadMult & NumpadSub::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 80
    MouseGetPos, xpos, ypos
    MouseClick, left, 440, %yylen%
    MouseMove, %xpos%, %ypos%
    Return

;buy
NumpadMult & NumpadAdd::
    WinGetPos , , , ,ylen, A
    yylen := ylen - 80
    MouseGetPos, xpos, ypos
    MouseClick, left, 650, %yylen%
    MouseMove, %xpos%, %ypos%
    Return


#IfWinActive



;+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
