
ahk_options:

; その他のオプションについて
; http://ahkwiki.net/Commands_Name
; などをご覧ください.

; 環境変数が変数名に侵食するのを防ぐ.
#NoEnv
; ワークディレクトリを本スクリのディレクトリに
SetWorkingDir %A_ScriptDir%
; デフォは座標指定がアクティブウィンドウ相対になっているので
; スクリーン絶対に直す.
CoordMode Menu, Screen

configs:

; 別の ahk スクリから本スクリを Run で呼び出した場合に
; SetWorkingDir だけでは Include できないため
; 明示的に絶対パスとして指定する必要がある.
#Include %A_ScriptDir%\menu_config.ahk

menu_creation:

Menu, menuname1, Add, &Build,       label_build_this_script
Menu, menuname1, Add
Menu, menuname1, Add, &Notepad,     label_notepad
Menu, menuname1, Add, &Copy help,   label_copy_help_contents
Menu, menuname1, Add
Menu, menuname1, Add, &batch.bat,   label_open_batch
Menu, menuname1, Add, &index.html,  label_open_indexhtml
Menu, menuname1, Add, &Folder,      label_open_dir_with_explorer
Menu, menuname1, Add
Menu, menuname1, Add, Edit This,    label_edit_this_script
Menu, menuname1, Add, Edit Config,  label_edit_this_config
Menu, menuname1, Add, AHK &Version, label_version
Menu, menuname1, Add, &Quit,        label_exit

menu_showing:

; お好きな方を使ってください.
posobj := get_mouse_pos()
;posobj := get_display_center_pos()

showx := posobj.x
showy := posobj.y
Menu, menuname1, Show, %showx%, %showy%
Return

label_build_this_script:
; このスクリプトを実行ファイル化する.
; menu_config.ahk の BIN_AHK2EXE に ahk2exe のパスを入れてください.
; 例: C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe
Run "%BIN_AHK2EXE%" /in "%A_ScriptFullPath%" /out "%A_ScriptDir%\menu.exe"
Return

label_notepad:
Run, notepad
Return

label_copy_help_contents:
; コマンドプロンプトの各種コマンドは直接実行できないので
; cmd /c "..." を使う.
msgbox "OKボタンを押すと、クリップボードに if コマンドのヘルプをコピーします."
Run, cmd /c "if /? | clip"
Return

label_open_batch:
Run, batch.bat
Return

label_open_indexhtml:
Run, "%BIN_BROWSER%" index.html
Return

label_open_dir_with_explorer:
Run, explorer "%A_ScriptDir%"
Return

label_edit_this_script:
Run, "%BIN_TEXT_EDITOR%" "%A_ScriptFullPath%"
Return

label_edit_this_config:
Run, "%BIN_TEXT_EDITOR%" "%A_ScriptDir%\menu_config.ahk"
Return

label_version:
msgbox % "Your AHK version is " A_AhkVersion
Return

label_exit:
Return

funcs:
Return

get_mouse_pos(){
  MouseGetPos, mousex, mousey

  mousepos := {}
  mousepos.x := mousex
  mousepos.y := mousey
  Return mousepos
}

get_display_center_pos(){
  ; 本当は現在アクティブなモニタの中央に表示したかったが
  ; 簡単に取得する方法はないのでプライマリモニタ固定で...
  SysGet, rectmonitor, Monitor
  centerx := (rectmonitorRight - rectmonitorLeft)/2
  centery := (rectmonitorBottom - rectmonitorTop)/2

  centerpos := {}
  centerpos.x := centerx
  centerpos.y := centery
  Return centerpos
}
