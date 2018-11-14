﻿;**************************************
;* 【ObjReg窗口操作脚本[窗口函数.ini]】 *
;*                          by hui-Zz *
;**************************************
global RunAny_Plugins_Version:="1.0.1"
#NoEnv                  ;~不检查空变量为环境变量
#NoTrayIcon             ;~不显示托盘图标
#Persistent			 ;~让脚本持久运行
#WinActivateForce       ;~强制激活窗口
#SingleInstance,Force   ;~运行替换旧实例
ListLines,Off           ;~不显示最近执行的脚本行
SendMode,Input          ;~使用更速度和可靠方式发送键鼠点击
SetBatchLines,-1        ;~脚本全速执行(默认10ms)
SetControlDelay,0       ;~控件修改命令自动延时(默认20)
SetWinDelay,0            ;~执行窗口命令自动延时(默认100)
SetTitleMatchMode,2     ;~窗口标题模糊匹配
CoordMode,Menu,Window   ;~坐标相对活动窗口
;WWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWWW
#Include %A_ScriptDir%\RunAny_ObjReg.ahk

class RunAnyObj {
	;[窗口居中]
	win_center_zz(){
		WinGetActiveStats,zTitle,var_width,var_height,var_x,var_y
		WinMove,%zTitle%,,(A_ScreenWidth-var_width)/2,(A_ScreenHeight-var_height)/2+15,var_width,var_height
	}
	;[窗口改变大小]
	win_size_zz(var_width,var_height){
		WinMove,A,,,,%var_width%,%var_height%
	}
	;[窗口置顶]
	win_top_zz(t=1){
		if(t=1){
			WinSet,AlwaysOnTop,On,A
		}else{
			WinSet,AlwaysOnTop,Off,A
		}
	}
	;[窗口边角置顶观影]
	;参数说明：
	;mode：1-左上,2-右上,3-左下,4-右下
	;x：正数向左偏移像素，负数向右偏移像素
	;y：正数向下偏移像素，负数向上偏移像素
	;title：0-显示标题栏，1-隐藏标题栏
	win_movie_zz(mode=1,x=0,y=0,title=0){
		MouseGetPos,,,zId
		WinGetTitle,zTitle,ahk_id %zId%
		WinSet,AlwaysOnTop,on,ahk_id %zId%
		if(title)
			WinSet,Style,-0xC00000,ahk_id %zId%
		else
			WinSet,Style,+0xC00000,ahk_id %zId%
		WinGetPos,var_x,var_y,var_width,var_height,ahk_id %zId%
		if(mode=1){
			var_x:=0
			var_y:=0
		}else if(mode=2){
			var_x:=A_ScreenWidth-var_width
			var_y:=0
		}else if(mode=3){
			var_x:=0
			var_y:=A_ScreenHeight-var_height
		}else if(mode=4){
			var_x:=A_ScreenWidth-var_width
			var_y:=A_ScreenHeight-var_height
		}
		WinMove,%zTitle%,,% var_x + x,% var_y + y
	}
	;[窗口透明度]
	win_transparency_zz(flag = 1,amount = 10)
	{
		WinGetTitle, ActiveTitle, A
		static t = 255
		If(flag=0)
			tmp := t + amount
		else if(flag=1)
			tmp := t - amount
		If(tmp > 255)
			tmp = 255
		else if(tmp < 0)
			tmp = 0
		WinSet,Transparent,%tmp%,%ActiveTitle%
		ToolTip,当前透明度:%tmp%
		Sleep,1000
		ToolTip
		t := tmp
	}
	;[窗口置顶时设置透明，第二次还原]
	win_transparent_top_zz(){
		Suspend,Permit
		global nhwnd
		WinGet, temp, ExStyle, A
		if(temp & 0x8){  ; 0x8 表示 WS_EX_TOPMOST.
			;这个分支是当前激活窗口是置顶窗口
			SetTimer, transparEnter, Off ;关闭时钟
			WinSet,AlwaysOnTop,off, A ;关闭置顶
			;关闭窗口置顶后取消窗口透明
			WinSet, Transparent, 255, A ;帮助中说,先设置255会让透明关闭的比较稳定
			WinSet, Transparent, off, A
			nhwnd:=""
		}else{
			;这个分支是当前激活窗口不是置顶窗口,这时什么也不做
			WinSet,AlwaysOnTop,on,A  ;开启置顶
			SetTimer, transparEnter, 250
			MouseGetPos, , , nhwnd
		}
		transparEnter: ;当前置顶窗口执行透明子程序
			WinGet, temp, ExStyle, A ;获取当前激活窗口是否置顶状态
			if(temp & 0x8){  ; 0x8 表示 WS_EX_TOPMOST.
				;这个分支是当前激活窗口是置顶窗口,如果当前置顶窗口获取焦点了则取消透明
				WinGet, TransparEnter, Transparent, A
				if(TransparEnter <> 255){
					WinSet, Transparent, 255, A
				}
			}else{
				;这个分支是当前激活窗口不是置顶窗口,这时设置置顶的那个窗口透明
				WinSet, Transparent, 128,ahk_id %nhwnd%
				;MsgBox,%nhwnd%
			}
		return
	}
	;[窗口最大化并隐藏标题栏，第二次还原]
	win_max_zz(){
		MouseGetPos,,,wh
		WinGet,zW,MinMax,ahk_id %wh%
		if zW=1
		{
			WinRestore,ahk_id %wh%
			WinSet,Style,+0xC00000,ahk_id %wh%
		}else{
			WinMaximize,ahk_id %wh%
			WinSet,Style,-0xC00000,ahk_id %wh%
		}
		return
	}
}

;独立使用方式
;F1::
	;RunAnyObj.win_center_zz()
;return
