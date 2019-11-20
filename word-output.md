## 短语输出

RunAny可以储存邮箱、手机号，想用时就快捷输出，更支持AHK实时变量，输出当前时间。

末尾分号 `;`识别为短语，会用剪贴板粘贴输出，如输出此刻的时分秒：

`hui0.0713@gmail.com;` 输出 `hui0.0713@gmail.com`

`时间-|%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec%;` 输出 `2018-08-08 08:08:08` 

<details>
<summary>【点此展开】写入RunAny.ini文件使用不同格式短语</summary>

```ini
-短语
	日期:*X:date!|%A_YYYY%%A_MM%%A_DD%;
	日期-:*X:date@|%A_YYYY%-%A_MM%-%A_DD%;
	日期中文_:*X:date#|%A_YYYY%年%A_MM%月%A_DD%日;
	时间:*X:time!|%A_YYYY%%A_MM%%A_DD%%A_Hour%%A_Min%%A_Sec%;
	时间-:*X:time@|%A_YYYY%-%A_MM%-%A_DD% %A_Hour%:%A_Min%:%A_Sec%;
	时间中文_:*X:time#|%A_YYYY%年%A_MM%月%A_DD%日 %A_Hour%时%A_Min%分%A_Sec%秒;
```

</details>


?> AHK实时变量语法参考[AHK文档](https://wyagd001.github.io/zh-cn/docs/Variables.htm)

## 模拟打字短语【进阶用法】

末尾分号`;;`识别为模拟打字短语，会模拟键盘按键来输出短语

> \`r 或 \`n 或 \`r\`n 都为回车键<kbd>Enter</kbd>功能 <br>
> \`t 为 制表键<kbd>Capslock</kbd>功能 <br>
> \`b 为退格键<kbd>Backspace</kbd>功能

```ini
粘贴输入:*X:test1|abc`t123`n;
键盘输入:*X:test2|abc`t123`n;;
```

![RunAny键盘输出短语](/assets/images/RunAny键盘输出短语.gif)