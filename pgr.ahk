; ==================================================
; Functions
; ==================================================

Sleep(10000)
mouseClick(x, y, delay){
    time := Random(10, 100)
    MouseMove(x, y, time)
    Click()
    Sleep(delay)
}


; ==================================================
; Login into the Game
; ==================================================

programPath := "D:\Games\Punishing Gray Raven\Punishing Gray Raven Game\PGR.exe"
Run programPath
WinWait("PGR")
WinActivate("PGR")

MouseMove(5, 5, 100)  ; Save click spot
Sleep(60000)          ; Waiting a loading

; 30 clicks for login and banners skip
Loop 30 {
    Sleep(1000)
    Click()
}

; ==================================================
; Dorm
; ==================================================

mouseClick(1230, 530, 1000) ; Open Dorm/Guild panel 
mouseClick(920,  400, 1000) ; Enter Dorm
Sleep(10000)
mouseClick(940, 660, 1000)  ; Pat all
mouseClick(940, 660, 1000)  ; Remove window

; Commissions
mouseClick(1200, 660, 1000) ; Open Tab
mouseClick(65, 660, 1000) ; claim all
mouseClick(65, 660, 1000) ; Skip results
mouseClick(65, 660, 3000) ; Dispatch all
Send('{Esc}')
Sleep(1000)

; Chores
mouseClick(1050, 660, 1000) ; Open Tab
mouseClick(300, 300, 1000)  ; Complite
mouseClick(300, 300, 1000)  ; Remove window
mouseClick(300, 300, 1000)  ; Start new

mouseClick(350, 222, 1000)  ; Select 1, 1
mouseClick(630, 222, 1000)  ; Select 1, 2
mouseClick(910, 222, 1000)  ; Select 1, 3
mouseClick(350, 340, 1000)  ; Select 2, 1
mouseClick(630, 340, 1000)  ; Select 2, 2
mouseClick(910, 340, 1000)  ; Select 2, 3
mouseClick(350, 500, 1000)  ; Select 3, 1
mouseClick(630, 500, 1000)  ; Select 3, 2

mouseClick(930, 650, 1000)  ; Begin Chores

Send('{Esc}')
Sleep(1000)

; ; Shop
; mouseClick(250, 660, 1000) ; Open Tab
; mouseClick(400, 450, 1000) ; Select bluerints
; mouseClick(600, 650, 1000) ; Max
; mouseClick(800, 650, 1000) ; Buy
; Send('{Esc}')
; Sleep(1000)

; Build
mouseClick(100, 660, 1000) ; Open Tab
; Select type
mouseClick(1000, 340, 1000)
mouseClick(400, 210, 1000) 
mouseClick(975, 630, 1000)
mouseClick(590, 630, 1000)  ; +1
mouseClick(590, 630, 1000)  ; +1
mouseClick(1000, 630, 1000) ; Craft
mouseClick(900, 500, 10000) ; Confirm
mouseClick(1000, 160, 1000) ; Recycle button
mouseClick(1000, 160, 1000) ; C-Rank
mouseClick(900, 160, 1000)  ; B-Rank
mouseClick(800, 160, 1000)  ; A-Rank
mouseClick(960, 620, 1000)  ; Confirm
mouseClick(960, 620, 1000)  ; Confirm
Send('{Esc}')
Sleep(1000)

; Missions
mouseClick(1200, 100, 1000)  ; Open Tab
mouseClick(1150, 150, 1000)  ; Claim All
mouseClick(1150, 150, 1000)  ; Confirm
Send('{Esc}')
Sleep(1000)
Send('{Esc}')
Sleep(1000)

; ==================================================
; Shop
; ==================================================

