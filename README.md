# Wrapopup
ポップアップメニューによる GUI ラッパーを作るための AutoHotkey テンプレートです。

![gui_menu_wrapper_with_autohotkey](https://user-images.githubusercontent.com/23325839/39992829-fa7467ca-57ae-11e8-90ee-b27f082179c9.jpg)

## Q: GUI ラッパー？
各種操作はコマンドを叩いて行うかと思いますが、それが面倒くさい時もあります。そんな時に GUI で、たとえばポップアップメニューで操作を一覧表示して、選択するだけで実行できるようにすると楽です。

本テンプレートはそのような楽をするための「ポップアップメニューによる GUI ラッパー」を作ることを目的としています。

## Q: なぜ AHK を使う？
- GUI を作るのが簡単（複雑な Windows プログラミングは不要）
- 他のプログラムやスクリプトをキックしやすい
- 実行ファイル化が簡単
- 実行ファイルは単体で動作する（他ランタイムのインストールは不要）

ちなみに [GitHub](https://github.com/Lexikos/AutoHotkey_L) では 2018/05/14 現在で 1700 star がついており、Windows 用ソフトウェアにしては異例の人気を誇っています。

また AHK の文法は [GitHub のシンタックスハイライトとしても採用](https://github.com/github/linguist/blob/master/lib/linguist/languages.yml#L325) されており、いかに流行っているかがうかがえます。

## Requirement
- Windows 7+
- AutoHotkey v1.1.10+

## 使い方
- [menu_config.ahk.sample](menu_config.ahk.sample) を menu_config.ahk にコピーした後、値を埋める
- [menu.ahk](menu.ahk) を開く

## 書き方
詳しくは [menu.ahk](menu.ahk) の中身を見ていただくのが早いですが、簡単に全体構造について説明しておきます。

```ahk

ahk_options:

; ここに AHK 関連の設定を書く.
; 設定一覧は http://ahkwiki.net/Commands_Name あたりを参照のこと.

configs:

; ここで外部スクリプトを Include する.

; 本スクリプトでは menu_config を Include している.
; (menu_config にはテキストエディタパスなど環境固有情報を書く.)
#Include %A_ScriptDir%\menu_config.ahk

menu_creation:

; ここでポップアップメニューを作る.
; 詳しい文法は http://ahkwiki.net/Menu を参照.
Menu, menuname1, Add, &Build,       label_build_this_script
...

menu_showing:

; ここでメニューを表示する.

; ... (表示位置を決めてから) ...
Menu, menuname1, Show, %showx%, %showy%
Return

; 各メニュー項目に対するサブルーチンを定義.
; -----------------------------------------

label_build_this_script:
; ...
Return

; ...
; ...
; ...

; サブルーチンを定義.
; -------------------

get_mouse_pos(){
  MouseGetPos, mousex, mousey

  mousepos := {}
  mousepos.x := mousex
  mousepos.y := mousey
  Return mousepos
}

; ...
; ...
; ...
```

ちょっとしたラッパースクリプト程度なら、この書き方で十分事足りると思います。

なお AHK の文法については [スクリプト仕様 - AutoHotkey Wiki](http://ahkwiki.net/Scripts) あたりをご覧ください。

## (参考) AHK に関する情報源
お世話になりました。

- [AutoHotkey Wiki](http://ahkwiki.net/Top)
  - 国内で最も充実しているリファレンス
- [AutoHotkeyのチュートリアルを読んだ - もうカツ丼でいいよな](http://d.hatena.ne.jp/Rion778/20091208/1260241968)
  - プログラマ向けに端的にまとまってある
- [AutoHotkey スクリプトを ahk2exe でコンパイルしてつくった実行ファイルの仕様 - stamemo](http://stakiran.hatenablog.com/entry/2018/05/10/194620)
  - 実行ファイル化を行う ahk2exe に関する話
- [[AHK基礎] AutoHotkeyはどんな言語か - ITジョー](https://itjo.jp/autohotkey/what-is-autohotkey/)
  - GUI 作って配布しやすいことを端的に説明＆検証している

## License
[NYSL](http://www.kmonos.net/nysl/)

## Author
[stakiran](https://github.com/stakiran)
