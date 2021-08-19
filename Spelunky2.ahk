; AutoHotKey functions for Spelunky 2
;
; These must be in a file ending in .ahk
; Add hotkeys at the bottom.
;
; Provided functions:
;   FastStart() - Skips opening scenes, goes to Adventure mode
;   InstantReset() - Opens pause menu, instant resets (assumes no confirmation)
;   ResetForAST() - Opens pause menu, resets shortcuts, goes to Adventure mode
;   ResetForAC() - Opens pause menu, resets characters, goes to Adventure mode
;   ResetForAJE() - Opens pause menu, resets characters, goes to Adventure mode
; 
; Example: Ctrl+Shift+R for instant
;   ^+R::
;       InstantReset()
;   return
;
; Example: PS4 controller L1 + L2 reset for AS+T
;   Joy5 & Joy6::
;       ResetForAllShortcuts()
; 
; PS4 buttons
; L1       Joy5
; R1       Joy6
; L2       Joy7
; R2       Joy8
; X        Joy2
; Square   Joy1
; Triangle Joy4
; Circle   Joy3
; Sharing  Joy9
; Options  Joy10
; Touchpad Joy14
; PS       Joy13
; L Stick  Joy11
; R Stick  Joy12
;
; XBox buttons
; LB       Joy5
; RB       Joy6
; LT       Joy7
; RT       Joy8
; A        Joy2
; X        Joy1
; Y        Joy4
; B        Joy3
; View     Joy9
; Menu     Joy10
; L Stick  Joy11
; R Stick  Joy12
;

#SingleInstance, Force
SetKeyDelay, 34, 34
journal_index = 0
shortcuts_index = 1
characters_index = 2

; keeps track of where we are in Data Management
dm_menu_pos = 0

IsSpelunky2() {
    Return WinActive("Spelunky 2 ahk_exe Spel2.exe") != 0
}

FastStart() {
    if (!IsSpelunky2())
        Return

    Send {Enter 5}
    Sleep 1500
    Send {Enter}
    Sleep 600
    Send {Enter}
    Sleep 600
    Send {Enter}
    Sleep 600
    Send {Enter}
}

InstantReset() {
    if (!IsSpelunky2())
        Return
    Send {Esc}{Down 2}{Enter}
}

ResetForAST() {
    ResetToDataManagement()
    DMResetShortcuts()
    DMReturnToAdventure()
}

ResetForAJE() {
    ResetToDataManagement()
    DMResetJournal()
    DMReturnToAdventure()
}

ResetForAC() {
    ResetToDataManagement()
    DMResetJournal()
    DMReturnToAdventure()
}

ResetToDataManagement() {
    global dm_menu_pos
    if (!IsSpelunky2())
        Return

    Send {Esc}{Down 4}
    Send {Enter}
    Sleep 200
    Send {Enter}
    Sleep 1800
    Send {Down 2}{Enter}
    Sleep 2000
    Send {Up 2}{Enter}
    Sleep 1000
    dm_menu_pos = 0
}

DMReturnToAdventure() {
    if (!IsSpelunky2())
        Return
    Send {Escape}
    Sleep 600
    Send {Escape}
    Sleep 2000
    Send {Up 2}
    Sleep 600
    Send {Enter}
    Sleep 600
    Send {Enter}
}

DMReset() {
    if (!IsSpelunky2())
        Return

    Send {Enter}
    Sleep 200
    Send {Down}
    Send {Enter}
    Sleep 200
}

DMMoveTo(target_index) {
    global dm_menu_pos
    if (!IsSpelunky2())
        Return

    while (dm_menu_pos < target_index) {
        Send {Down}
        dm_menu_pos++
    }

    while (dm_menu_pos > target_index) {
        Send {Up}
        dm_menu_pos--
    }
}

DMResetJournal() {
    global journal_index
    DMMoveTo(journal_index)
    DMReset()
}

DMResetShortcuts() {
    global shortcuts_index
    DMMoveTo(shortcuts_index)
    DMReset()
}

DMResetCharacters() {
    global characters_index
    DMMoveTo(characters_index)
    DMReset()
}
