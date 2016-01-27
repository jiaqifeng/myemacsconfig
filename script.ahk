#IfWinActive ahk_class Emacs
^Space::^+2
#IfWinActive

#IfWinActive emacs ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;disable below line, seems better, single press as capslock funtion
;;+Capslock::Capslock ; make shift+Caps-Lock the Caps Lock toggle
;;Capslock::Control ; make Caps Lock the control button

;;below use Capslock to lwin as super modifier in emacs
Capslock & i:: send, ^p   ;; previous-line
Capslock & k:: send, ^n   ;; next-line
Capslock & j:: send, ^b   ;; backward-char
Capslock & l:: send, ^f   ;; forward-char
Capslock & u:: send, !b   ;; forward-word
Capslock & o:: send, !f   ;; backward-word
Capslock & h:: send, ^a   ;; move-beginning-of-line

a & l:: send, ^x{Left}    ;; next-buffer
a & j:: send, ^x{Right}    ;; next-buffer
a::a                      ;; a as a

;Capslock & {;}::    ;; move-end-of-line
;send, ^e
;return

;; below is example, use two hotkey together
;Space & j::    ;; move-beginning-of-line
;send, ^a
;return
;Space::    ;; if not set this, space does not work! I dont know why
;send, {Space}
;return

#IfWinActive        ; end if in emacs ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

#f::run D:\programs\Everything\Everything.exe

Capslock & d::
DetectHiddenWindows, on
IfWinNotExist ahk_class Emacs
Run D:\programs\emacs-24.3\bin\runemacs.exe
Else
IfWinNotActive ahk_class Emacs
WinActivate
Else
WinMinimize
Return

Capslock & s::
IfWinNotExist ahk_exe idea.exe
Return
Else
IfWinNotActive ahk_exe idea.exe
WinActivate
Else
WinMinimize
Return


;^Capslock:: ; send ctrl-x, left to emacs to switch buffer, this affect up line to swap Capslock and control key, so disable it
;DetectHiddenWindows, on
;IfWinActive ahk_class Emacs
;send ^x{Left}
;Return

#x:: ; 
RunWait c:\cygwin\bin\python c:\cygwin\home\dell\spdlog.py
IfWinNotExist ahk_class Emacs
{}
Else
IfWinNotActive ahk_class Emacs
WinActivate
send !xslog{Enter}
Return

;#t:: ; 
;RunWait c:\cygwin\bin\python c:\cygwin\home\dell\spdlog.py d:\working\temp\simu.log
;IfWinNotExist ahk_class Emacs
;{}
;Else
;IfWinNotActive ahk_class Emacs
;WinActivate
;send !xslog{Enter}
;Return

#t::
	DetectHiddenWindows, on
	IfWinNotExist ahk_class TTOTAL_CMD
		Run C:\programs\totalcmd\TOTALCMD.EXE
	Else
		IfWinNotActive ahk_class TTOTAL_CMD
		WinActivate
	Else
		WinMinimize
Return

#c:: ; 
RunWait c:\cygwin\bin\python c:\cygwin\home\dell\ldclog.py
IfWinNotExist ahk_class Emacs
{}
Else
IfWinNotActive ahk_class Emacs
WinActivate
send !xslog{Enter}
Return

#w:: ; 
;IfWinNotActive ahk_class dbgviewClass
IfWinExist ahk_class dbgviewClass
{
    WinActivate
    send ^s
    IfWinNotExist ahk_class Emacs
    {}
    Else
    IfWinNotActive ahk_class Emacs
    WinActivate
    send !xslog{Enter}
    return
}

#z::
DetectHiddenWindows, on
IfWinNotExist ahk_class Emacs
Run D:\programs\emacs-24.3\bin\runemacs.exe
Else
IfWinNotActive ahk_class Emacs
WinActivate
Else
WinMinimize
Return

#2::
DetectHiddenWindows, on
IfWinNotExist ahk_class si_Frame
Run "C:\Program Files (x86)\Source Insight 3\Insight3.exe"
Else
IfWinNotActive ahk_class si_Frame
WinActivate
Else
WinMinimize
Return

#a::
DetectHiddenWindows, on
IfWinNotExist ahk_class PuTTY
Run "C:\programs\putty\putty.exe" "-load" "lcygwin"
Else
IfWinNotActive ahk_class PuTTY
WinActivate
Else
WinMinimize
Return

#q::
DetectHiddenWindows, on
IfWinNotActive, Spreadtrum Logel
WinActivate Spreadtrum Logel
IfWinNotActive, DLoaderR
WinActivate DLoaderR
IfWinNotActive, 计算机管理
WinActivate 计算机管理
Return

#0::
DetectHiddenWindows, on
IfWinNotExist ahk_class MozillaUIWindowClass
Run "C:\programs\Mozilla Firefox\firefox.exe"
Else
IfWinNotActive ahk_class MozillaUIWindowClass
WinActivate
Else
WinMinimize
Return

#9::
DetectHiddenWindows, on
IfWinNotExist ahk_class MSBLWindowClass
Run "C:\programs\Mozilla Firefox\firefox.exe"
Else
IfWinNotActive ahk_class MSBLWindowClass
WinActivate
Else
WinMinimize
Return

#d::
WinWait, 注册表编辑器,
IfWinNotActive, 注册表编辑器, , WinActivate, 注册表编辑器, 
WinWaitActive, 注册表编辑器, 

^F12::
InputBox, time, 计时器, 请输入计时分钟数,,180,130,,,,,2
if ErrorLevel
return
else
time := time*60000
Sleep,%time%
SoundBeep, 250, 100
Sleep,50
SoundBeep, 250, 100
Sleep,50
SoundBeep, 250, 500
MsgBox 时间到!休息一下吧
return

;PicSaveCounter=32

;.::
;send {RButton}
;send v
;PicSaveCounter=576
;return

;;  set initial counter
;.::
;InputBox, picPrefixName, input, please input prefix name,,180,130,,,,,2
;PicSaveCounter=0
;return

;; click mouse and send file name
;,::
;send {RButton}
;Sleep,500
;send v
;Sleep,500
;PicSaveCounter+=1
;;filename = %picPrefixName%%PicSaveCounter%
;;MsgBox %filename%
;send ^v
;send %PicSaveCounter%
;send {Enter}
;return

#4::
send ams-install file:///D:/tools/NetBeansProjects/FCTest/dist/FCTest.jad
send {Enter}
return

#5::
loop , 1
{
    send ams-remove 0{Enter}
    Sleep,1000
    send ams-install http://1.203.249.64:8088/test/getNextApp.jad{Enter}
    Sleep,15000
    send ams-run 0{Enter}
    Sleep,2000
}
return

#6::
myyyy_index=2
loop , 49
{
    send AT{+}CMGD=%A_Index%
    send {Enter}
    Sleep,500
    myyyy_index=myyyy_index+1
}
return

;#7::
;IfWinExist, JIAQFEN-CN.cn.oracle.com - PuTTY
;{
;    WinActivate, JIAQFEN-CN.cn.oracle.com - PuTTY
;    send device-list
;}
;return

;v::
;send {alt down}{tab}{alt up}
;return

