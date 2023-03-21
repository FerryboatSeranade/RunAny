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

;win+s 复制并且搜索!!! 要是有可选项那就更棒了!//todo
#s::
clipboard :=
Send, {ctrl down}{insert}{ctrl up}
;MsgBox, %clipboard%
; ToolTip, %clipboard%
clipwait
if(1==Instr(clipboard,"http")){ ; 要做trim操作!
    run %clipboard%
}else if(RegExMatch(clipboard,"^[CDEFGH]:")){
    run explore %clipboard%
}else{
    run https://www.google.com/search?q=%Clipboard%
}
return


/*
#[::
Send, #P
Sleep, 300
Send, {Down}{Down}{Down}{Enter}
Return
*/