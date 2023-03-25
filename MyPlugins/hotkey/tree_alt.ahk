global RunAny_Plugins_Version:="1.0.0"
#NoTrayIcon             ;~不显示托盘图标
#Persistent             ;~让脚本持久运行
#SingleInstance,Force   ;~运行替换旧实例

/*
要在浏览器中配置好沙拉的快捷键才能生效
*/
shortcut= !w
HotKey, %shortcut%, salad_dict_query
salad_dict_query:
    Send, ^c
    Sleep, 200
    Send, %shortcut%
    Send, {Alt Up}
Return