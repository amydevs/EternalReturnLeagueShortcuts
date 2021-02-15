#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

CheckIfActive()
{
    var := WinActive("BlackSurvivalER")
    Return %var%
}

rightClicked := False

~RButton & q::
~RButton & w::
~RButton & e::
~RButton & r::
    %rightClicked% := True
Return

~q up:: 
~w up:: 
~e up:: 
~r up:: 
    if CheckIfActive() && !%rightClicked% {
        Sleep, 2
        MouseClick, left
    }
    %rightClicked% := False
Return

~Shift & ~RButton::
    if CheckIfActive() {
        Send, "a"
        while (GetKeyState("RButton", "P")) {
            MouseClick, left
            Sleep, 25
        }
    }
Return

