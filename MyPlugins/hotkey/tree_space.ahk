global RunAny_Plugins_Version:="1.0.0"
#NoTrayIcon ;~不显示托盘图标
#Persistent ;~让脚本持久运行
#SingleInstance, Force ;~运行替换旧实例

/*
vim式操作风格的扩展
*/
space & j::Down
space & k::up
space & h::Left
space & l::Right
/*
虚拟桌面的切换
*/
space & a::^#Left
space & f::^#Right
/*
前台进程的切换
*/
space & d::^!Tab

space & e::Enter
space & b::BackSpace
<+Space::Enter
; space & q::Click
/*
快速获得url的markdown
*/
space & q::
    WinGetTitle, title, A
    pos:= InStr(title, "和另外")
    len:= StrLen(title)
    ; MsgBox 'pos:' %pos% ';len' %len%
    delta:= len-pos+1
    if(pos==0){
        delta:= 0
    }
    ; MsgBox %delta%
    StringTrimRight, title, title, %delta%
    res := "["  title "](" ;空格连接字符串..
    ; MsgBox %res%
    Clipboard := ""
    Send yy
    ClipWait, 0.3
    ; MsgBox clip %Clipboard%
    res := res Clipboard ")" 
    MsgBox %res%
    Clipboard:= res
return
space & r::MouseClick, right
/*
鼠标移动
*/
space & up::MouseMove, 0, -10, 0, R  ; Win+UpArrow 热键 => 上移光标
space & Down::MouseMove, 0, 10, 0, R  ; Win+DownArrow => 下移光标
space & Left::MouseMove, -10, 0, 0, R  ; Win+LeftArrow => 左移光标
space & Right::MouseMove, 10, 0, 0, R  ; Win+RightArrow => 右移光标
/*
快捷启动部分软件
*/
space & g::
    #IfWinNotActive ahk_exe AltTabTer.exe ;~如果当前活动窗口是浏览器
        SendInput, #^+!{F1}
    ; WinActivate, 
Return
/*
因为之前的快捷键都是以space作为修饰键，导致了一个副作用，无法输出space。哪怕是alt加space触发utools这类启动器，也都不可以了。
而添加下面这行代码。按键space的行为转成了输入一个空格字符。解决了大部分副作用。
相比原来按住space键，持续不断输出很多空格字符的行为，现在一直按住，一次也只会输出一个空格字符。
*/
$space::space