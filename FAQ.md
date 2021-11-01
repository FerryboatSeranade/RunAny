## 1. 无法获取QQ聊天内容问题解决

使用<kbd>Win</kbd>+<kbd>字母</kbd>热键无法取得QQ聊天窗口内容

**原因**：因为QQ聊天窗口是绘制的特殊窗体，不是Windows系统常见控件，所以目前无法用AHK的<kbd>Win</kbd>+热键去获取其内容

**解决**：换一个其他的比如<kbd>Alt</kbd>+<kbd>字母</kbd>、<kbd>Ctrl</kbd>+<kbd>字母</kbd>、<kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>字母</kbd>之类就正常了

---


## 2. RunAny菜单无法消失问题解决

#### Win10 1709版本使用<kbd>Win</kbd>+<kbd>`</kbd>热键显示RunAny菜单后，菜单不消失

**原因**：因为1709系统对<kbd>Win</kbd>+热键的控制，导致出现菜单后需要点一下菜单中的内容才会关闭菜单

**解决**：不升级系统的情况下，更换RunAny的热键，不带有Win键

#### 极少情况下在Win10中安装360安全卫士导致RunAny菜单无法消失

**原因**：目前尚未清楚是360安全卫士哪项设置导致，欢迎告知

**解决**：卸载360安全卫士后菜单恢复正常

---


## 3. 在Total Command，Directory Opus中RunAny没有获取到选中文件

**原因**：因某些不明配置原因，导致在TC、DO中按<kbd>Ctrl</kbd>+<kbd>C</kbd>复制文件速度变慢，没在短时间给RunAny文件信息误判断为无选中文件

**解决**：手动修改RunAny配置`RunAnyConfig.ini`，使用隐藏配置延长等待复制时间： 
**（RunAny5.7.2版本后可以在设置-高级配置中进行配置，另外在电脑为固态硬盘时可有效减少此情况的发生）**

```ini
[Config]
ClipWaitApp=TotalCMD64.exe
ClipWaitTime=1.5
```

> 在[Config]下添加 <br>
> ClipWaitApp（在什么应用界面延长等待复制时间, 多个逗号分隔） <br>
> ClipWaitTime（最长等待复制的时间（2秒）大概在1.5秒以上可以稳定获取到）

---


## 4. 开机后RunAny加载慢和RunAny调用Everything缓慢问题

鼠标移动到任务栏托盘图标后显示，调用Everything搜索应用全路径时间过长：
![RunAny调用Everything缓慢问题](/assets/images/faq/RunAny调用Everything缓慢问题.png)

**原因**：因Everything正在索引、或是数据库在不同磁盘导致读写缓慢等原因。（可以开机后马上尝试能不能用Everything来验证）

**解决**：
- 在Everything搜索框中搜索“Everything”，查看`Everything.exe`和文件`Everything.db`是否不在同一硬盘  
在Everything窗口最上面菜单的“工具”——“选项”——找到选中左边的“索引”——修改右边的数据库路径到`Everything.exe`同一硬盘，加快读写速度

- 若计算机中文件过多导致的Everything创建索引缓慢，则需要尽量减少Everything设置中的 索引磁盘、文件夹、文件属性等

- **觉得上面方法比较麻烦，可以把Windows系统和Everything安装在固态硬盘上即可解决**

---

## 5. AutoHotkey 1.1.30 导致RunAny热字符串功能失效

使用 AutoHotkey 1.1.28 老版本
或升级至 AutoHotkey 1.1.31 及以上版本

---

## 6. 0x800401F3 - 无效的类字符串 `ComObjCreate("HTMLfile")`
![HTMLfile](/assets/images/faq/HTMLfile.png ':size=577x585')

**原因**：是360安全卫士、电脑管家……等等 启用 **浏览器锁定** 开关后 导致  
一旦锁定浏览器，安全卫士就会阻止任何软件去调用浏览器相关的一些功能  
而 `一键计算` 和 `huiZz_Text.ahk` 里面 中文转换为URI编码 等功能是需要依赖 `HTMLfile` 来完成功能的

**解决**：
关闭360安全卫士、电脑管家……等等的 **浏览器锁定** 的开关

---
