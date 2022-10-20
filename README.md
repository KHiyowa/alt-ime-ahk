# alt-ime-ahk

## 概要

左右 Alt キーの空打ちで IME を OFF/ON する AutoHotKey スクリプトです。

* 左 Alt キーの空打ちで IME を「英数」に切り替え
* 右 Alt キーの空打ちで IME を「かな」に切り替え
* Alt キーを押している間に他のキーを打つと通常の Alt キーとして動作

## 動作環境

* Windows11
* Windows10
* Windows8.1

## 使い方

AutoHotKeyをインストールし、alt-ime-ahk.ahkファイルから単体プログラムをビルドしてください。

終了する場合はタスクトレイのアイコンを右クリックし、「終了」をクリックしてください。

アンインストールは alt-ime-ahk.exe を削除するだけで OK です。

## オリジナルからの変更点

* 仮想キーコードをvkFFに変更
* Altキーを単押しした際に、仮想キーを上げるコマンドを発行するように変更
* Altキーの単体2回押しでAltキーを単押ししたものとして動作するように変更
* Windows 10 1703以降で、大宮技研製「英数・かなキーボード」に対応

## 英数・かなキーボードの使用

英数・かなキーボードを使用する場合は、Windows向けのファームウェアを書き込む必要があります。

## JetBrains 製の IDE で使う場合は Tool Buttons をオンに

IntelliJ IDEA, PhpStorm など JetBrains 製の IDE をお使いの方は「上部メニューバー　＞　View　＞　Tool Buttons」をオンにしてください。

オフのまま使うと Alt キーを離した際に alt-ime-ahk.exe がエラー終了します。

## 原作者ブログの紹介ページ

[Altの空打ちで日本語入力(IME)を切り替えるツールを作った](http://www.karakaram.com/alt-ime-on-off)
