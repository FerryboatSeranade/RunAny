# 重要目录说明
- RunAny.ini: 每次运行程序RunAny.ahk或者RunAny.exe就会读取该配置
- RunAnyConfig.ini
  - 配置开机启动
- MyPlugins
  - third_party: 第三方库or应用程序
  - call_third_party.ahk: 定义hotkey or hotstring 调用第三方库或应用
  - hotkey: 
    - force_disable: 为了训练更优秀的操作习惯,强制禁止某些原生操作
  - hotstring: 可能废弃，因为不常用的就很容易忘。初步想法PhraseExpander.exe 或者utools里面编写一些插件来替代