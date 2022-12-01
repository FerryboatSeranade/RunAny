
global RunAny_Plugins_Version:="1.0.0"
#NoTrayIcon             ;~不显示托盘图标
#Persistent             ;~让脚本持久运行
#SingleInstance,Force   ;~运行替换旧实例

class RunAnyObj {
	
}

RemoveToolTip:
ToolTip,
return

; ::pro::D:\Program Files\
; ::pro32::D:\Program Files (x86)\
:*:qmail..::1064295398@qq.com
:*:gmail..::ferryboatseranade@gmail.com
:*:wymail..::ss1064295398@163.com
:*:qa1..::我遇到一个关于==()==的问题，问题如下图：`n
:*:qa2..::我查阅了以下网址资料：`n
:*:qa3..::但是有些问题❓目前还没有搜索到答案，具体来说是：`n
:*:qa4..::问题得到解答❗，解决方案如下：`n
:*:qa5..::可能的拓展资料是:`n
:*:qa6..::在探索这个问题的过程中，我还增添了如下疑问，不过目前无关紧要，暂且搁置，有契机再去解决:`n
:*:qatemplate..::我遇到一个关于==()==的问题，问题如下图：`n`n我查阅了以下网址资料：`n`n但是有些问题❓目前还没有搜索到答案，具体来说是：`n`n问题得到解答❗，解决方案如下：`n`n可能的拓展资料是:`n`n在探索这个问题的过程中，我还增添了如下疑问，不过目前无关紧要，暂且搁置，有契机再去解决:`n`n
; :*:dd..::System.out.println("end");//offer breakpoint for debug

; for powershell
:*:pf..::powershell -file 

; ::page..::Send http://shu_shen.gitee.io/my-vuepress-blog
:*:page..::
    run http://shu_shen.gitee.io/my-vuepress-blog
return
:*:.gitee..::
    run https://gitee.com/shu_shen/projects
return
:*:github..::
    run https://github.com/
return

:*:pro..::D:/Program Files/
:*:pro32..::D:/Program Files (x86)/
:*:down..::D:/Download/
:*:proc..::C:/Program Files/
:*:pro32c..::C:/Program Files (x86)/
:*:downc..::C:/Download/

; for git 
:*:gpush..::git add . && git commit -m "." && git push
:*:gpull..::git pull 


; for mysql
; :*:sql..::select 查询列表 `n from 表1 `n left/right/full join 表2 on `n where `n group by `n having `n order by `n limit  

:*:sql..::
SendRaw, select 查询列表 `n 
SendRaw, from 表1 `n 
SendRaw, left/right/full join 表2 on `n 
SendRaw, where `n 
SendRaw, group by `n
SendRaw, having `n 
SendRaw, order by `n 
SendRaw, limit  
return

; for ahk
; hotstring

:*:hs..:: 
ToolTip, hs..
SetTimer, RemoveToolTip, -3000
Send, :*:..::{Left}{Left}{Left}{Left}
return


; for offical website
:*:ahkdoc..::
run https://www.autohotkey.com/docs/AutoHotkey.htm
return

:*:ahkcndoc..::
run https://wyagd001.github.io/zh-cn/docs/KeyList.htm
return

:*:jet..::
    run https://www.jetbrains.com/store/#personal?billing=yearly
return


; for java
:*:test..::
SendRaw, @Test`n
SendRaw, public void test(){`n`n}
return
; totalCommander
; #IfWinActive, ahk_class ConsoleWindowCla
; #IfWinActive, ahk_class TTOTAL_CMD
; ::prod..::cd "D:/Program Files\"
; ::pro32d..::cd "D:/Program Files (x86)\"
; ::downd..::cd "D:/Download\"
; ::proc..::cd "C:/Program Files\"
; ::pro32c..::cd "C:/Program Files (x86)\"
; ::downc..::cd "C:/Download\"
; Return


:*:kitty..::kitty_portable.exe

; for linux man page
:*:man..::
SendRaw, \s{2,}
return
; 
:*:dk..::
Send, docker{Space}
return
:*:dkrun..::
SendRaw, docker run --detach --publish : --name  <id>
return
:*:dkps..::
SendRaw, docker ps --all
return
:*:dkex..::
SendRaw, docker exec -it <> /bin/bash
return

:*:dkrm..::
SendRaw, docker rm --force <>
return

:*:dkcommit..::
; SendRaw, docker commit -m="描述信息" -a="shu.shen" <container_id> image_id:tag
SendRaw, docker commit -m="提交到dockerhub----private" -a="shu.shen" <container_id> ferryboatseranade/mytomcat:tag
return

:*:dklogin..::
SendRaw, docker login -u ferryboatseranade
return

:*:dktag..::
SendRaw, docker tag tomcat-demo:0.0.0 ferryboatseranade/mytomcat:0.0.0
return

:*:dkpush..::
; dockerId/repository:tag
SendRaw, docker push ferryboatseranade/mytomcat:0.0.0
return

; for edit mode
:*:dd..::
Send, {End}
Send, +{Home}
Send, {BackSpace}
return

:*:lss..::
SendRaw, ss -tulwn
return

; for edge
:*:pass..::edge://settings/passwords?search=密码
:*:extensions..::edge://extensions/


; vim replace ip
:*:vrip..::
SendRaw, `%s/\v<((\d|\d{2}|1\d{2}|2[0-5][0-5])\.){3}(\d|\d{2}|1\d{2}|2[0-5][0-5])>/127.0.0.1/gc
return
; vim find ip
:*:vfip..::
SendRaw, \v<((\d|\d{2}|1\d{2}|2[0-5][0-5])\.){3}(\d|\d{2}|1\d{2}|2[0-5][0-5])>
return

; for embeded html in notion
:*:iframe..::
; msgbox, % A_ScriptDir
; oldClipboard := clipboard
FileRead, clipboard,  %A_ScriptDir%\text\iframe.html
SendInput, ^v
Return


:*:sqlage..::
SendRaw, timestampdiff(YEAR, birthday, CURDATE()) as age
return

:*:wfcmd..::
SendRaw, Get-WmiObject Win32_Process | Select ProcessId, CommandLine | select-string java | select-string
return

:*:shfori..::
SendRaw, for ( )
SendRaw, do
SendRaw,        echo "$e is protected"
SendRaw, done


; windows
; 快速构建大文件
:*:winfile..::
SendRaw, fsutil file createnew 1M.zip 1024
return
:*:wintemp..::
SendRaw, cd D:\temp
return

:*:porttops..::
SendRaw, netstat -aon | findstr "8080"
return
:*:killps..::
SendRaw, taskkill /F /PID 
return

:*:....::
SendRaw, ``
return
