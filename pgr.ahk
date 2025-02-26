F12::ExitApp  ; Exit point. F12 stop script

; ==================================================
; Constants
; ==================================================

sleepy_time := 1500
sleepy_time_fluctuation := 500
gamePath := "D:\Games\Punishing Gray Raven\Punishing Gray Raven Game\PGR.exe"
; gamePath := "C:\Punishing Gray Raven\Punishing Gray Raven Game\PGR.exe"
CoordMode "Mouse", "Client"

; ==================================================
; Functions
; ==================================================

mouseClick(x1, y1, x2, y2){
    ; Clicks immediately at a random point within the specified rectangle with a delay.
    ; 
    ; Parameters:
    ; x1, y1 - Coordinates of the top-left corner of the rectangle.
    ; x2, y2 - Coordinates of the bottom-right corner of the rectangle.
    ; 
    ; The function calculates a random point inside the rectangle, moves the mouse to that point,
    ; performs a click, and then applies a random delay.
    delay := Random(sleepy_time-sleepy_time_fluctuation, sleepy_time+sleepy_time_fluctuation)
    x := Random(x1, x2)
    y := Random(y1, y2)
    
    MouseMove(x, y, Random(10, 100))
    Click()
    Sleep(delay)
}

; ==================================================
; Login into the Game
; ==================================================

; Run gamePath
; WinWait("PGR")
; WinActivate("PGR")

; Sleep(60000)          ; Waiting a loading

; ; 30 clicks for login and banners skip
; Loop 30 {
;     mouseClick(5, 10, 0, 10)
; }


WinActivate("PGR")
Sleep(sleepy_time)
; ==================================================
; Dorm
; ==================================================

mouseClick(1243, 532, 1243, 532) ; Open Dorm/Guild panel


mouseClick(864, 384, 977, 431)   ; Enter Dorm
mouseClick(887, 628, 959, 700)   ; Pat all
mouseClick(887, 628, 959, 700)   ; Confirm

; Commission Tab
mouseClick(1152, 631, 1227, 702) ; Enter tab
mouseClick(25, 601, 125, 694)    ; CLaim All
mouseClick(25, 601, 125, 694)    ; Confirm
mouseClick(25, 601, 125, 694)    ; Dispatch All
Sleep(5000) ; Wait in case of "already dispatch" pop-up
Send('{Esc}')
Sleep(1000)

Chores := 0
; Chores Tab
if (Chores == 1){
    mouseClick(1021, 632, 1099, 698) ; Enter Chores Tab
    mouseClick(181, 227, 434, 303)   ; Start Chores
    ; Row 1
    mouseClick(245, 180, 465,  270)
    mouseClick(515, 180, 745,  270)
    mouseClick(795, 180, 1015, 270)
    ; Row 2
    mouseClick(245, 315, 465,  400)
    mouseClick(515, 315, 745,  400)
    mouseClick(795, 315, 1015, 400)
    ; Row 3
    mouseClick(245, 452, 471, 533)
    mouseClick(515, 447, 743, 533)

    mouseClick(867, 619, 1014, 652) ; Begin Chores
    Send('{Esc}')
    Sleep(1000)
}
; Shop
dormShop := 0
; Build
mouseClick(41, 647, 171, 684)   ; Open Build Tab
mouseClick(919, 262, 1074, 414) ; Select type
mouseClick(285, 198, 428, 233)  ; Select Floor
mouseClick(896, 611, 1054, 646) ; Confirm
mouseClick(568, 625, 600, 655)  ; +1
mouseClick(568, 625, 600, 655)  ; +1
mouseClick(960, 618, 1180, 655) ; Craft
mouseClick(782, 496, 939, 535)  ; Confirm
Sleep(5000) ; Wait to complite
mouseClick(782, 496, 939, 535)  ; Confirm if new pop-up

mouseClick(953, 151, 1058, 180) ; Recycle
mouseClick(983, 157, 1006, 175) ; C-Rank
mouseClick(888, 159, 908, 176)  ; B-Rank
mouseClick(787, 158, 808, 174)  ; A-Rank
mouseClick(901, 602, 1051, 634) ; Recycle
mouseClick(901, 602, 1051, 634) ; Confirm
Send('{Esc}')
Sleep(1000)

; Missions
mouseClick(997, 86, 1231, 131)   ; Open Missions Tab
mouseClick(1072, 123, 1229, 173) ; Claim All
mouseClick(1072, 123, 1229, 173) ; Confirm



; ==================================================
; Char shards
; ==================================================

WinActivate("PGR")