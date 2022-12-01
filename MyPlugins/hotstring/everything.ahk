
global RunAny_Plugins_Version:="1.0.0"
#NoTrayIcon             ;~不显示托盘图标
#Persistent             ;~让脚本持久运行
#SingleInstance,Force   ;~运行替换旧实例
SendMode Input
SetWorkingDir, %A_ScriptDir%

/*
在everything中 ctrl+L : 快速定位到搜索框
*/
#IfWinActive, ahk_class EVERYTHING
<^L::
ControlFocus, Edit1, ahk_class EVERYTHING
Send ^A
return

; for snipaste
#IfWinActive, ahk_exe Snipaste.exe
<^e::
Send ^8 ;擦子
return
<^1::
Send ^4 ;笔
return
<^2::
Send ^7 ;文本
return
; <^r::
; Send ^y ;重做
; return

#IfWinActive, ahk_exe MindManager.exe
<!f::
Send +!0 ;折叠
return
<!d::
Send +!. ;显示
return
<!1::
Send +!1 ;显示一个级别
return
<!2::
Send +!2 ;显示两个级别
return

#IfWinActive, ahk_exe MindMaster.exe
<^+Enter
Send !{Enter}
return


; for 7hero
#IfWinActive, ahk_exe 7hero.exe
x::RButton