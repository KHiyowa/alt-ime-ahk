; ----------------------------------------------------------------------
; Alt-IME (Key Hook / A_PriorKey 版) - AutoHotkey v2.0
;
; Author:       Hiyowa Kyobashi  https://github.com/KHiyowa/alt-ime-ahk
;
; Acknowledge:
;   Original Author: Yosuke Karasawa  https://github.com/karakaram/alt-ime-ahk
; ----------------------------------------------------------------------
;@Ahk2Exe-SetCompanyName Hiyowa Records
;@Ahk2Exe-SetCopyright Hiyowa Kyobashi
;@Ahk2Exe-SetDescription Alt-IME
;@Ahk2Exe-SetFileVersion 2.0.0
;@Ahk2Exe-SetInternalName Alt-IME
;@Ahk2Exe-SetOrigFilename alt-ime-ahk.exe
;@Ahk2Exe-SetProductName Alt-IME
;@Ahk2Exe-SetProductVersion 2.0.0
;@Ahk2Exe-SetMainIcon alt-ime.ico

#Requires AutoHotkey v2.0
#SingleInstance Force
SetStoreCapsLockMode False
A_IconTip := "Alt-IME"

A_MenuMaskKey := "vkE8"     ; Alt単体押し時のメニュー呼び出しを抑制するためのダミーキー

; グローバル変数の初期化
g_LastLAltPress := 0
g_LAltDouble := false
g_LastRAltPress := 0
g_RAltDouble := false

; ----------------------------------------------------------------------
; 左 Alt キー (無変換キー)
; ----------------------------------------------------------------------
; $*~LAlt
;   $ : キーフックを使用する
;   * : 修飾キー(Ctrl等)が押されていても発火する
;   ~ : 元のキー入力もOSに送る（ショートカットキー等を妨害しない）
; ----------------------------------------------------------------------
$~LAlt::
$+~LAlt:: {
    global g_LAltDouble, g_LastLAltPress
    if (A_TickCount - g_LastLAltPress < 200) {
        g_LAltDouble := true
    } else {
        g_LAltDouble := false
        SendInput "{Blind}{vkE8}"
    }
    g_LastLAltPress := A_TickCount
}

$~LAlt up::
$+~LAlt up:: {
    global g_LAltDouble
    ; A_PriorKey は「直前に押された物理キー」を保持する。
    ; これが "LAlt" である場合、Altキーを押している間に他のキーを押さなかったことを意味する。
    if ((A_PriorKey == "LAlt" || A_PriorKey == "vkE8") && !g_LAltDouble) {
        SendInput "{Blind}{vk1D}"
    }
}

; ----------------------------------------------------------------------
; 右 Alt キー (変換キー)
; ----------------------------------------------------------------------
$~RAlt::
$+~RAlt:: {
    global g_RAltDouble, g_LastRAltPress
    if (A_TickCount - g_LastRAltPress < 200) {
        g_RAltDouble := true
    } else {
        g_RAltDouble := false
        SendInput "{Blind}{vkE8}"
    }
    g_LastRAltPress := A_TickCount
}

$~RAlt up::
$+~RAlt up:: {
    global g_RAltDouble
    if ((A_PriorKey == "RAlt" || A_PriorKey == "vkE8") && !g_RAltDouble) {
        SendInput "{Blind}{vk1C}"
    }
}

; ----------------------------------------------------------------------
; 大宮技研 英数・かなキーボード用仮想コード
; sc07B (無変換) -> 無変換
; sc079 (変換)   -> 変換
; ----------------------------------------------------------------------
*sc07B::SendInput "{Blind}{vk1D}"
*sc079::SendInput "{Blind}{vk1C}"
