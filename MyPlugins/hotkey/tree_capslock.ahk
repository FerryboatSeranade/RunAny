;************************
;* 【ObjReg插件脚本 1】 *
;************************
global RunAny_Plugins_Version:="1.0.0"
#NoTrayIcon             ;~不显示托盘图标
#Persistent             ;~让脚本持久运行
#SingleInstance,Force   ;~运行替换旧实例


; https://github.com/fabiofortkamp/homectrl/blob/master/homectrl.ahk
SetCapsLockState, AlwaysOff ;-- disable CapsLock
;-- when pressing CapsLock alone, it will activate the Escpae button
CapsLock::LCtrl
;
Capslock Up::
SendInput, {LControl Up}  ;--For stability
If A_TimeSincePriorHotkey < 250 ;选择一个合适你的时间,
{
  SendInput, {Escape}   
}
Else
return
