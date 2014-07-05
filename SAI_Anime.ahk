;
; SAI_Anime.ahk: an AHK script for animator who uses SAI.
;
; Copyright (C) 2014 OPAP-JP contributors.
;
; License: The MIT License (MIT)
;

;****************************
;* �ݒ� 
;****************************

; X�����̈ړ���
MOVE_DX :=  0

; Y�����̈ړ���
MOVE_DY := 44

; ���C�������̃N���X��
LAYER_CLASS:="sfl_window_class41"

; �J�����g���C���̂ݕ\�����邽�߂ɑ��M����L�[
HOTKEY_SHOW_CURRENT_LAYER:="g"

; �L���ɂ���E�B���h�E
GroupAdd, TARGET_WIN, ahk_class sfl_window_class


;****************************
;* �C�x���g���� 
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
;* �֐�
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
