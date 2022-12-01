global RunAny_Plugins_Version:="1.0.0"
#NoTrayIcon             ;~不显示托盘图标
#Persistent             ;~让脚本持久运行
#SingleInstance, Force   ;~运行替换旧实例

/*
禁用ctrl t,为了更好地习惯Vimium
*/
GroupAdd, BrowsersGroup, ahk_exe msedge.exe
GroupAdd, BrowsersGroup, ahk_exe chrome.exe
GroupAdd, BrowsersGroup, ahk_exe firefox.exe

#IfWinActive ahk_group BrowsersGroup  ;~如果当前活动窗口是浏览器
; 如果当前活动窗口是msedge.exe或者chrome.exe
;~则禁用ctrl t
^t::
Return