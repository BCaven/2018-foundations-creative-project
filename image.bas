SCREEN 12
CLS , _RGB(0, 255, 0)
i = _LOADIMAGE("testmap.png") 'see note below examples to get the image
_PUTIMAGE (0, 0), i 'places image at upper left corner of window w/o stretching it
_FULLSCREEN
LET X = 20
LET Y = 10
' TESTING------------------------------------------------------------
WHILE KEY$ <> ""
    KEY$ = INKEY$
    _PUTIMAGE (0, 0), i
    pressed = _KEYHIT
    IF pressed = 18432 THEN
        Y = Y - 20
        facing$ = "up"
    END IF
    IF pressed = 20480 THEN
        Y = Y + 20
        facing$ = "down"
    END IF
    IF pressed = 19200 THEN
        X = X - 20
        facing$ = "left"
    END IF
    IF pressed = 19712 THEN
        X = X + 20
        facing$ = "right"
    END IF
    CIRCLE (X, Y), 10, 1
    PAINT (X, Y), 1
    IF facing$ = "up" THEN LINE (X, Y)-(X, Y - 20), 16
    IF facing$ = "down" THEN LINE (X, Y)-(X, Y + 20), 16
    IF facing$ = "left" THEN LINE (X, Y)-(X - 20, Y), 16
    IF facing$ = "right" THEN LINE (X, Y)-(X + 20, Y), 16
    _DELAY 0.1

WEND
