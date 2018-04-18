SCREEN _NEWIMAGE(640, 480, 32)
CLS , _RGB(0, 255, 0)
i = _LOADIMAGE("testmap.png") 'see note below examples to get the image
j = _LOADIMAGE("testmap2.png")
menu = _LOADIMAGE("barack.png")

button = _LOADIMAGE("Button.png")
charU = _LOADIMAGE("ladyup.png")
charD = _LOADIMAGE("ladydown.png")
charL = _LOADIMAGE("ladyleft.png")
charR = _LOADIMAGE("ladyright.png")
LET x = 20
LET y = 10
clicked = 0
count = 0
_PUTIMAGE (0, 0), menu 'places image at upper left corner of window w/o stretching it
SLEEP
' TESTING------------------------------------------------------------
WHILE KEY$ <> ""
    KEY$ = INKEY$
    IF y > 480 OR count = 1 THEN
        _PUTIMAGE (0, 0), j
        count = 1
    ELSEIF count = 0 THEN
        _PUTIMAGE (0, 0), i
    END IF
    IF count = 1 AND y < 0 THEN
        _PUTIMAGE (0, 0), i
        count = 0
        y = 480
    END IF
    IF y > 480 AND count = 1 THEN
        y = 0
    END IF
    IF y < 0 AND count = 0 THEN
        y = 480
    END IF
    pressed = _KEYHIT
    IF pressed = 18432 THEN
        y = y - 5
        facing$ = "up"
    END IF
    IF pressed = 20480 THEN
        y = y + 5
        facing$ = "down"
    END IF
    IF pressed = 19200 THEN
        x = x - 5
        facing$ = "left"
    END IF
    IF pressed = 19712 THEN
        x = x + 5
        facing$ = "right"
    END IF
    _PUTIMAGE (320 - 10, 240 - 10), button

    IF facing$ = "up" THEN
        LINE (x, y)-(x, y - 20), 16
        _PUTIMAGE (x - 10, y - 10), charU
    END IF
    IF facing$ = "down" THEN
        LINE (x, y)-(x, y + 20), 16
        _PUTIMAGE (x - 10, y - 10), charD
    END IF
    IF facing$ = "left" THEN
        LINE (x, y)-(x - 20, y), 16
        _PUTIMAGE (x - 10, y - 10), charL
    END IF
    IF facing$ = "right" THEN
        LINE (x, y)-(x + 20, y), 16
        _PUTIMAGE (x - 10, y - 10), charR
    END IF
    _DELAY 0.1
WEND
