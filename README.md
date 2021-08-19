# AutoHotkey functions for Spelunky 2

These provide some automation for Spelunky 2. You can configure a single key-press
to perform a series of steps

## Usage

1. Install [AutoHotkey](https://www.autohotkey.com/)
2. Save [Spelunky2.ahk](Spelunky2.ahk) on your computer
3. Add your hotkeys at the bottom

## Provided functions

FastStart()
: Skips opening scenes, goes to Adventure mode

InstantReset()
:  Opens pause menu, instant resets (assumes no confirmation)

ResetForAST()
: Opens pause menu, resets shortcuts, goes to Adventure mode

ResetForAC()
: Opens pause menu, resets characters, goes to Adventure mode

ResetForAJE()
: Opens pause menu, resets journal, goes to Adventure mode

### Warnings

- You can't switch to another app while a function is running.
  The script tries to detect this quickly and stops sending inputs.
- Pressing buttons can interfere with the functions

### Caveats

- All of the functions assume the game isn't paused (except `FastStart()`)
- The resets for AST, AC, and AJE typically take around 8 seconds.
  The game simply doesn't recognize inputs for substantial periods of time
- Character selection and base camp aren't scripted

## Examples

Your hotkeys must be at the bottom of the file to work.

### Ctrl+Shift+R for instant reset

```autohotkey
^+R::
    InstantReset()
return
```

### PS button reset for AS+T

```autohotkey
Joy13::
    ResetForAST()
return
```

## Controller Quick Reference

These are the buttons that can be easily used. Unfortunately, the D-Pad
appears as an analog stick direction and can't be used directly.

### PS4 buttons

| Controller | AutoHotkey |
| ---------- | ---------- |
| X          | Joy2       |
| Square     | Joy1       |
| Triangle   | Joy4       |
| Circle     | Joy3       |
| L1         | Joy5       |
| R1         | Joy6       |
| L2         | Joy7       |
| R2         | Joy8       |
| Sharing    | Joy9       |
| Options    | Joy10      |
| Touchpad   | Joy14      |
| PS         | Joy13      |
| L Stick    | Joy11      |
| R Stick    | Joy12      |

### XBox buttons

| Controller | AutoHotkey |
| ---------- | ---------- |
| A          | Joy2       |
| X          | Joy1       |
| Y          | Joy4       |
| B          | Joy3       |
| LB         | Joy5       |
| RB         | Joy6       |
| LT         | Joy7       |
| RT         | Joy8       |
| View       | Joy9       |
| Menu       | Joy10      |
| L Stick    | Joy11      |
| R Stick    | Joy12      |
