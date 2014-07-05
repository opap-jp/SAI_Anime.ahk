;
; SAI_Anime.ahk: an AHK script for animator who uses SAI.
;
; Copyright (C) 2014 OPAP-JP contributors.
;
; License: The MIT License (MIT)
;

;****************************
;* 設定 
;****************************

; X方向の移動量
MOVE_DX :=  0

; Y方向の移動量
MOVE_DY := 44

; レイヤ部分のクラス名
LAYER_CLASS:="sfl_window_class41"

; カレントレイヤのみ表示するために送信するキー
HOTKEY_SHOW_CURRENT_LAYER:="g"

; 有効にするウィンドウ
GroupAdd, TARGET_WIN, ahk_class sfl_window_class


;****************************
;* イベント処理 
;****************************

#IfWinActive, ahk_group TARGET_WIN

!Up::
!WheelUp::
    Main(-1)
    Return

!Down::
!WheelDown::
    Main(+1)
    Return

#IfWinActive


;****************************
;* 関数
;****************************

Main(direction) {
    global MOVE_DX
    global MOVE_DY
    global LAYER_CLASS
    global HOTKEY_SHOW_CURRENT_LAYER
    
    MouseGetPos,,,,ctrl
    If(ctrl <> LAYER_CLASS) {
        Return
    }
    
    MouseMove, (MOVE_DX * direction), (MOVE_DY * direction), 0, R
    
    MouseGetPos,,,,ctrl
    If(ctrl <> LAYER_CLASS) {
        Return
    }
    
    Send, %HOTKEY_SHOW_CURRENT_LAYER%
    MouseClick,L,0,0,1,0,,R
    Send, %HOTKEY_SHOW_CURRENT_LAYER%
    
    Return
}
