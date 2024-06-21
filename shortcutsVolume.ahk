#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
#Persistent
#InstallKeybdHook
#SingleInstance force    ;Skips the dialog box and replaces the old instance automatically
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;+=Shift
;!=Alt
;^=Strg
;#=WIN


$^!WheelUp::GoSub, GeometricVolumeUp
$^!WheelDown::GoSub, GeometricVolumeDown

^!NumpadAdd::Send   {GeometricVolumeUp}
^!NumpadSub::Send   {GeometricVolumeDown}

#If MouseIsOver("ahk_class Shell_TrayWnd")
WheelUp::GoSub, GeometricVolumeUp
WheelDown::GoSub, GeometricVolumeDown

;volume keys


GeometricVolumeUp:

SoundGet, current_volume

volume_change := current_volume//10

SoundSet, +%volume_change%

Send {Volume_Up}

return

GeometricVolumeDown:

SoundGet, current_volume

volume_change := current_volume//10

SoundSet, -%volume_change%

Send {Volume_Down}

return

MouseIsOver(WinTitle) {
    MouseGetPos,,, Win
    return WinExist(WinTitle . " ahk_id " . Win)
}
