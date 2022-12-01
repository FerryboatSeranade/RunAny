;TransOther.ahk
; Make transparent all but the active window
;Skrommel @ 2005
 
#SingleInstance,Force
SetWinDelay,0
SetBatchLines,-1
 
applicationname=TransOther
 
OnExit,STOP
Gosub,READINI
Gosub,TRAYMENU
/* start label has a loop, Essence
Winget, OutputVar [, SubCommand, WinTitle, WinText, ExcludeTitle, ExcludeText]
  subcommand:
    List: Retrieves the unique ID numbers of all existing windows that match the title/text parameters.
    Id:
    PID:
    (注意ahk_id和ahk_pid不是一回事)
  excludeTitle:
    program manager:好像是桌面的意思----没解释清楚,我试过把program manager拿掉,没观察到效果有什么不同!
StringTirmLeft,outputVar,inputVar,number   从左边截断多少个字符
StringTirmRight,outputVar,inputVar,number  从右边截断多少个字符
当number=0,其实就是啥都没变,起到的效果是类型转换???
WinSet, SubCommand, Value [, WinTitle, WinText, ExcludeTitle, ExcludeText]
  subcommand:
    transparent:设置透明度,后面的valueq取值范围从0~255! 
*/ 
START:
WinGet,id_,List,,,Program Manager
; WinGet,id_,List,,,
Loop,%id_%
{
  StringTrimRight,id,id_%A_Index%,0
  WinSet,Transparent,%trans%,ahk_id %id%
}
id:=0
/* 将上面的id初始化,id是一个临时变量!!!
- 基本逻辑
等待窗口不激活(其实就是窗口状态发生变化了,激活窗口发生了转移)----刚开始为0是没毛病的,就一次,进程号为0的窗口肯定是不激活的,之后就...
获取此时激活窗口的ahk_id*(winExist("A")和WinActive()都可以做到这一点)
  "A" 表示当前激活窗口---先记着就行
获取当前激活窗口的class 名//?????????????????????
获取之前激活窗口的class名
DllCall("[DllFile\]Function" [, Type1, Arg1, Type2, Arg2, "Cdecl ReturnType"])
  DllFile may be omitted when calling a function that resides in User32.dll, Kernel32.dll, ComCtl32.dll, or Gdi32.dll.
*/ 
Loop
{
  WinWaitNotActive,ahk_id %id%
  WinGet,id,Id,A
  WinGetClass,class,ahk_id %id%
  WinGetClass,oldclass,ahk_id %oldid%
  parent:=DllCall("GetParent","UInt",id)
  parent+=0
  If (id<>oldid)
  {
    If (class="Shell_TrayWnd") ; And oldclass="Progman")
      WinSet,Transparent,255,ahk_id %id%
    Else
      WinSet,Transparent,Off,ahk_id %id%
    If (parent<>oldid)
      WinSet,Transparent,%trans%,ahk_id %oldid%
    oldid:=id
  }
  Sleep,100
}
 
;将透明窗口全部关闭 
STOP:
WinGet,id_,List,,,Program Manager
Loop,%id_%
{
  StringTrimRight,id,id_%A_Index%,0
  WinSet,Transparent,Off,ahk_id %id%
}
WinSet,Transparent,Off,ahk_class Progman
Goto,EXIT
;退出
 
/* 读取配置文件
- 基本逻辑
如果不存在 配置文件
创建ini变量,填写以下内容
持久化为文件(此时ini变量无效,可重置)
有了配置文件后读取配置文件中的trans属性,取"透明度"之意
- api封装
fileAppend(tempVar,PersistentFile)
iniRead(outputvar,fileName,sectionName,keyName) 
在ini文件中有若干章节,用[sectionName]作为标记,每个章节又有若干个key和value,以keyName=value作为标记
*/  
READINI:
IfNotExist,%applicationname%.ini
{
  ini=`;[Settings]
  ini=%ini%`n`;trans=150              `;0-255  Degree of transparency
  ini=%ini%`n
  ini=%ini%`n[Settings]
  ini=%ini%`ntrans=150
  FileAppend,%ini%,%applicationname%.ini
  ini=
}
IniRead,trans,%applicationname%.ini,Settings,trans
Return
 
/* 新建托盘菜单(菜单本质上就是一个标签)
TrayMenu只是一个标签,不是ahk内置的api
- 基本逻辑
删除托盘菜单默认项,使用deleteAll 进行初始化
remove all standard(non-custon) menu items----和上面有啥区别?
Menu,MenuName,Add,[,MenuItemName,LabelOrSubMenu,Options] ;Options有:使能submenu,无:使能label or function,优先label
- api封装
addLabel2TrayMenu(labelName){
  Menu,Tray, Add , itemName, labelName
}
addSubMenu2TrayMenu(subMenuName){
  Menu,Tray, Add , itemName, ":"subMenuName
}
addSplit2TrayMenu(){
  Menu,Tray, Add, 
}
也可以用标志位进一步去封装
;Default的作用是让菜单项加粗,以最后一个指定菜单项为准---在托盘菜单中默认菜单项的激活方式是"双击图标"
;后面执行的Default会让前面执行的Default语句失效
;当"鼠标悬停在托盘图标上"时，将显示托盘图标的工具提示
*/  
TRAYMENU:
Menu,Tray,DeleteAll
Menu,Tray,NoStandard
Menu,Tray,Add,%applicationname%,ABOUT
Menu,Tray,Add,
Menu,Tray,Add,&Settings,SETTINGS
Menu,Tray,Add,&About,ABOUT
Menu,Tray,Add,E&xit,STOP
Menu,Tray,Default,%applicationname%
Menu,Tray,Tip,%applicationname%
Return
 
/* 
打开配置文件
之所以要gosub,readini,是因为可能配置文件不存在(比如被删除了),如这样的话就卡死了!
这是存在性的考量
*/ 
SETTINGS:
Gosub,READINI
RunWait,%applicationname%.ini
Reload
 
/* a label of creating a gui
destroy: delete the window
margin : set minimal distance of control and window's edge. (设置页边距)
add picture: I dont't know. //todo
I guess 99 is the  gui's id or name
font ... +add text +font 是常规操作!
add text 可以添加超链接
- api encapsulation

*/  
ABOUT:
Gui,99:Destroy
Gui,99:Margin,20,20
Gui,99:Add,Picture,xm Icon1,%applicationname%.exe
Gui,99:Font,Bold
Gui,99:Add,Text,x+10 yp+10,%applicationname% v1.0
Gui,99:Font
Gui,99:Add,Text,y+10,Make transparent all but the active window
Gui,99:Add,Text,y+5,- Change transparency using Settings in the tray menu
 
Gui,99:Add,Picture,xm y+20 Icon5,%applicationname%.exe
Gui,99:Font,Bold
Gui,99:Add,Text,x+10 yp+10,1 Hour Software by Skrommel
Gui,99:Font
Gui,99:Add,Text,y+10,For more tools, information and donations, please visit 
Gui,99:Font,CBlue Underline
Gui,99:Add,Text,y+5 G1HOURSOFTWARE,www.1HourSoftware.com
Gui,99:Font
 
Gui,99:Add,Picture,xm y+20 Icon7,%applicationname%.exe
Gui,99:Font,Bold
Gui,99:Add,Text,x+10 yp+10,DonationCoder
Gui,99:Font
Gui,99:Add,Text,y+10,Please support the contributors at
Gui,99:Font,CBlue Underline
Gui,99:Add,Text,y+5 GDONATIONCODER,www.DonationCoder.com
Gui,99:Font
 
Gui,99:Add,Picture,xm y+20 Icon6,%applicationname%.exe
Gui,99:Font,Bold
Gui,99:Add,Text,x+10 yp+10,AutoHotkey
Gui,99:Font
Gui,99:Add,Text,y+10,This tool was made using the powerful
Gui,99:Font,CBlue Underline
Gui,99:Add,Text,y+5 GAUTOHOTKEY,www.AutoHotkey.com
Gui,99:Font
 
Gui,99:Show,,%applicationname% About
hCurs:=DllCall("LoadCursor","UInt",NULL,"Int",32649,"UInt") ;IDC_HAND
; OnMessage(0x200,"WM_MOUSEMOVE") 
Return
 
1HOURSOFTWARE:
  Run,http://www.1hoursoftware.com,,UseErrorLevel
Return
 
DONATIONCODER:
  Run,http://www.donationcoder.com,,UseErrorLevel
Return
 
AUTOHOTKEY:
  Run,http://www.autohotkey.com,,UseErrorLevel
Return
 
99GuiClose:
  Gui,99:Destroy
  OnMessage(0x200,"")
  ; DllCall("DestroyCursor","Uint",hCur)
Return
/* 
global 引用或者创建全局变量
static 是局部变量不能被函数外部访问,但是有点特殊----该函数的多次调用都有记录,一个典型的应用场景是日志.可以记录某个函数被调用了多少次.
local 局部变量,函数内部默认
函数内部单行就一个global 或者首行形如 local myVar,都表明函数变量默认全局模式
 */
; WM_MOUSEMOVE(wParam,lParam)
; {
;   Global hCurs
;   MouseGetPos,,,,ctrl
;   If ctrl in Static8,Static12,Static16
;     DllCall("SetCursor","UInt",hCurs)
;   Return
; }
; Return
 
 
EXIT:
ExitApp