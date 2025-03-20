#Requires AutoHotkey 2.0+
#SingleInstance Force

; Hide desktop icons with Win + Alt + D
#HotIf WinActive("ahk_class Progman") || WinActive("ahk_class WorkerW")
#!d::DesktopIcons()
#HotIf

DesktopIcons(){
  hProgman:=WinExist("ahk_class WorkerW","FolderView")?WinExist():WinExist("ahk_class Progman","FolderView")
  hShellDefView:=DllCall("user32.dll\GetWindow","ptr",hProgman,"int",5,"ptr")
  hSysListView:=DllCall("user32.dll\GetWindow","ptr",hShellDefView,"int",5,"ptr")
  If (DllCall("user32.dll\IsWindowVisible","ptr",hSysListView)!=-1)
    DllCall("user32.dll\SendMessage","ptr",hShellDefView,"ptr",0x111,"ptr",0x7402,"ptr",0)
}

; Win + Enter Terminal
#Enter::Run("wt.exe")