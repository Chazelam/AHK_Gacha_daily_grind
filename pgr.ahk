#Requires AutoHotkey v2.0

F12::ExitApp  ; Exit point. F12 stop script
CoordMode "Mouse", "Client"
CoordMode "Pixel", "Client"

; ==================================================
; Constants
; ==================================================

sleepy_time := 1500
sleepy_time_fluctuation := 500
colorTolerance := 15

gamePath := "D:\Games\Punishing Gray Raven\Punishing Gray Raven Game\PGR.exe"
; gamePath := "C:\Punishing Gray Raven\Punishing Gray Raven Game\PGR.exe"

; ==================================================
; Functions
; ==================================================

UserClick(x1, y1, x2, y2){
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

IsSimilarColor(targetColor, color) {
    ; Determines if two colors are similar based on their RGB values.
    ; Parameters:
    ;   targetColor - The target color in HEX format (e.g., "0xAARRGGBB").
    ;   color       - The color to compare against the target color.
    ; Returns:
    ;   true if the colors are similar, false otherwise.

    ; Extract the red, green, and blue components from the target color
    tr := Format("{:d}", "0x" . substr(targetColor, 3, 2))  ; Red component of targetColor
    tg := Format("{:d}", "0x" . substr(targetColor, 5, 2))  ; Green component of targetColor
    tb := Format("{:d}", "0x" . substr(targetColor, 7, 2))  ; Blue component of targetColor

    ; Extract the red, green, and blue components from the comparison color
    pr := Format("{:d}", "0x" . substr(color, 3, 2))        ; Red component of color
    pg := Format("{:d}", "0x" . substr(color, 5, 2))        ; Green component of color
    pb := Format("{:d}", "0x" . substr(color, 7, 2))        ; Blue component of color

    ; Calculate the Euclidean distance between the two colors in RGB space
    ; Formula: distance = sqrt((R1 - R2)^2 + (G1 - G2)^2 + (B1 - B2)^2)
    distance := sqrt((tr - pr) ** 2 + (tg - pg) ** 2 + (tb - pb) ** 2)

    ; Compare the calculated distance with the predefined tolerance
    if (distance < colorTolerance) {  ; If the distance is less than the tolerance
        return true                   ; The colors are considered similar
    }
    return false                      ; Otherwise, they are not similar
}


; ==================================================
; Login into the Game
; ==================================================
Login(gamePath){
    Run gamePath
    WinWait("PGR")
    WinActivate("PGR")

    Sleep(60000)          ; Waiting a loading

    ; 30 clicks for login and banners skip
    Loop 30 {
        UserClick(5, 10, 0, 10)
    }
}

; ==================================================
; Dorm
; ==================================================
Dorm(){
    UserClick(1243, 532, 1243, 532) ; Open Dorm/Guild panel

    UserClick(864, 384, 977, 431)   ; Enter Dorm
    UserClick(887, 628, 959, 700)   ; Pat all
    UserClick(887, 628, 959, 700)   ; Confirm

    ; Commission Tab
    UserClick(1152, 631, 1227, 702) ; Enter tab
    UserClick(25, 601, 125, 694)    ; CLaim All
    UserClick(25, 601, 125, 694)    ; Confirm
    UserClick(25, 601, 125, 694)    ; Dispatch All
    Sleep(5000) ; Wait in case of "already dispatch" pop-up
    Send('{Esc}')
    Sleep(1000)

    Chores := 0
    ; Chores Tab
    if (Chores == 1){
        UserClick(1021, 632, 1099, 698) ; Enter Chores Tab
        UserClick(181, 227, 434, 303)   ; Start Chores
        ; Row 1
        UserClick(245, 180, 465,  270)
        UserClick(515, 180, 745,  270)
        UserClick(795, 180, 1015, 270)
        ; Row 2
        UserClick(245, 315, 465,  400)
        UserClick(515, 315, 745,  400)
        UserClick(795, 315, 1015, 400)
        ; Row 3
        UserClick(245, 452, 471, 533)
        UserClick(515, 447, 743, 533)

        UserClick(867, 619, 1014, 652) ; Begin Chores
        Send('{Esc}')
        Sleep(1000)
    }

    ; Shop
    dormShop := 0

    ; Build
    UserClick(41, 647, 171, 684)   ; Open Build Tab
    UserClick(919, 262, 1074, 414) ; Select type
    UserClick(285, 198, 428, 233)  ; Select Floor
    UserClick(896, 611, 1054, 646) ; Confirm
    UserClick(568, 625, 600, 655)  ; +1
    UserClick(568, 625, 600, 655)  ; +1
    UserClick(960, 618, 1180, 655) ; Craft
    UserClick(782, 496, 939, 535)  ; Confirm
    Sleep(5000) ; Wait to complite
    UserClick(782, 496, 939, 535)  ; Confirm if new pop-up

    UserClick(953, 151, 1058, 180) ; Recycle
    UserClick(983, 157, 1006, 175) ; C-Rank
    UserClick(888, 159, 908, 176)  ; B-Rank
    UserClick(787, 158, 808, 174)  ; A-Rank
    UserClick(901, 602, 1051, 634) ; Recycle
    UserClick(901, 602, 1051, 634) ; Confirm
    Send('{Esc}')
    Sleep(1000)

    ; Missions
    UserClick(997, 86, 1231, 131)   ; Open Missions Tab
    UserClick(1072, 123, 1229, 173) ; Claim All
    UserClick(1072, 123, 1229, 173) ; Confirm

}

; ==================================================
; Char shards
; ==================================================

WinActivate("PGR")
