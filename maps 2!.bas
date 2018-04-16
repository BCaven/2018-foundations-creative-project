
SCREEN _NEWIMAGE(640, 480, 32)
CLS , _RGB(0, 255, 0)
i = _LOADIMAGE("testmap.png") 'see note below examples to get the image
menu = _LOADIMAGE("menuTest.png")
char = _LOADIMAGE("char.png")
button = _LOADIMAGE("Button.png")
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
    _PUTIMAGE (X - 5, Y - 5), char
    IF clicked = 1 THEN _PUTIMAGE (10, 10), button
    IF facing$ = "up" THEN LINE (X, Y)-(X, Y - 20), 16
    IF facing$ = "down" THEN LINE (X, Y)-(X, Y + 20), 16
    IF facing$ = "left" THEN LINE (X, Y)-(X - 20, Y), 16
    IF facing$ = "right" THEN LINE (X, Y)-(X + 20, Y), 16
    IF X - 5 = 315 AND Y - 5 = 235 THEN clicked = 1
    _DELAY 0.1

WEND

