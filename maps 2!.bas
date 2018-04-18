' CLEAR:Memory; reinitializes all variables and closes all files
' ERASE: Reinitializes specific arrays (eg. ERASE ARRAY_NAME)
' TIME$: Time of day in hh/mm/ss
' TIMERON: Activates internal clock
' TIMER: Time in seconds since midnight
' MOD: Interger remainder
' CHAIN:
' VIEW PRINT:
SCREEN _NEWIMAGE(640, 480, 32)
CLS , _RGB(0, 255, 0)
i = _LOADIMAGE("testmap.png") 'see note below examples to get the image
menu = _LOADIMAGE("menuTest.png")

button = _LOADIMAGE("Button.png")
charU = _LOADIMAGE("charUP.png")
charD = _LOADIMAGE("charDOWN.png")
charL = _LOADIMAGE("charLEFT.png")
charR = _LOADIMAGE("charRIGHT.png")
_FULLSCREEN
LET X = 20
LET Y = 10
clicked = 0
_PUTIMAGE (0, 0), menu 'places image at upper left corner of window w/o stretching it
SLEEP
' TESTING------------------------------------------------------------
WHILE KEY$ <> ""
    KEY$ = INKEY$
    _PUTIMAGE (0, 0), i
    pressed = _KEYHIT
    IF pressed = 18432 THEN
        Y = Y - 5
        facing$ = "up"
    END IF
    IF pressed = 20480 THEN
        Y = Y + 5
        facing$ = "down"
    END IF
    IF pressed = 19200 THEN
        X = X - 5
        facing$ = "left"
    END IF
    IF pressed = 19712 THEN
        X = X + 5
        facing$ = "right"
    END IF
    _PUTIMAGE (320 - 10, 240 - 10), button

    IF facing$ = "up" THEN
        LINE (X, Y)-(X, Y - 20), 16
        _PUTIMAGE (X - 10, Y - 10), charU
    END IF
    IF facing$ = "down" THEN
        LINE (X, Y)-(X, Y + 20), 16
        _PUTIMAGE (X - 10, Y - 10), charD
    END IF
    IF facing$ = "left" THEN
        LINE (X, Y)-(X - 20, Y), 16
        _PUTIMAGE (X - 10, Y - 10), charL
    END IF
    IF facing$ = "right" THEN
        LINE (X, Y)-(X + 20, Y), 16
        _PUTIMAGE (X - 10, Y - 10), charR
    END IF
    _DELAY 0.1

WEND
