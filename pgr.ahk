; Launch PGR
programPath := "C:\Punishing Gray Raven\Punishing Gray Raven Game\PGR.exe"
Run programPath
WinWait("PGR")
; Login
Sleep(60000)          ; Waiting a loading
MouseMove(5, 5, 100)  ; Save click spot

; 30 clicks for login and banners skip
Loop 30 {
    Sleep(1000)
    Click()
}

Sleep(10000)
mouseClick(x, y, delay){
    time := Random(10, 100)
    MouseMove(x, y, time)
    Click()
    Sleep(delay)
}

; Dorm
mouseClick(1230, 530, 1000) ; Open Dorm/Guild panel 
mouseClick(920,  400, 1000) ; Enter Dorm
Sleep(10000)
mouseClick(940, 660, 1000)  ; Pat all
; Commissions
mouseClick(1200, 660, 1000) ; Open Tab
mouseClick(65, 660, 1000) ; claim all
mouseClick(65, 660, 1000) ; Skip results
mouseClick(65, 660, 1000) ; Dispatch all
Send('{Esc}')
Sleep(1000)

; Chores
mouseClick(1050, 660, 1000) ; Open Tab
; 
; Something
; 
Send('{Esc}')
Sleep(1000)


; Shop
mouseClick(250, 660, 1000) ; Open Tab
; 
; Something
; 
Send('{Esc}')
Sleep(1000)

; Build
mouseClick(100, 660, 1000) ; Open Tab
; Select type
mouseClick(1000, 340, 1000)
mouseClick(400, 210, 1000) 
mouseClick(975, 630, 1000)
; +2
mouseClick(590, 630, 1000)
mouseClick(590, 630, 1000)
; Craft
mouseClick(1000, 630, 1000)
mouseClick(900, 500, 10000)  ; Confirm
; Recycle
mouseClick(1000, 160, 1000) ; Recycle button
mouseClick(1000, 160, 1000) ; C-Rank
mouseClick(900, 160, 1000)  ; B-Rank
mouseClick(800, 160, 1000)  ; A-Rank
mouseClick(960, 620, 1000)  ; Confirm
mouseClick(960, 620, 1000)  ; Confirm
Send('{Esc}')
Sleep(1000)
; missions
mouseClick(1200, 100, 1000)  ; Open Tab
; Claim all
Send('{Esc}')
Sleep(1000)

