global RunAny_Plugins_Version:="1.0.0"
#NoTrayIcon             ;~不显示托盘图标
#Persistent             ;~让脚本持久运行
#SingleInstance, Force   ;~运行替换旧实例

!t::
; 输出当前目录
;MsgBox %A_ScriptDir%
;Run, Autohotkey %A_ScriptDir%\third_party\CodeQuickTester.ahk
Return