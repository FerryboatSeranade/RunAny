global RunAny_Plugins_Version:="1.0.0"
#NoTrayIcon             ;~不显示托盘图标
#Persistent             ;~让脚本持久运行
#SingleInstance, Force   ;~运行替换旧实例

#h::Left
#l::Right
#j::Down
#k::Up


#w::!F4

;win+c和win+v替代ctrl+insert和 shift+insert
#c::
Send, {Ctrl Down}{Insert}{Ctrl Up}
return

#v::
Send, {Shift Down}{Insert}{Shift Up}
return

/*
#[::
Send, #P
Sleep, 300
Send, {Down}{Down}{Down}{Enter}
Return
*/