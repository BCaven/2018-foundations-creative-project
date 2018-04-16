
SCREEN 12
x = 10
y = 10
facing$ = "right"
WHILE 1 = 1
    CLS 1, 2
    pressed = _KEYHIT
    IF pressed = 18432 THEN
        y = y - 20
        facing$ = "up"
    END IF
    IF pressed = 20480 THEN
        y = y + 20
        facing$ = "down"
    END IF
    IF pressed = 19200 THEN
        x = x - 20
        facing$ = "left"
    END IF
    IF pressed = 19712 THEN
        x = x + 20
        facing$ = "right"
    END IF

    CIRCLE (x, y), 10, 1
    PAINT (x, y), 1
    IF facing$ = "up" THEN LINE (x, y)-(x, y - 20), 16
    IF facing$ = "down" THEN LINE (x, y)-(x, y + 20), 16
    IF facing$ = "left" THEN LINE (x, y)-(x - 20, y), 16
    IF facing$ = "right" THEN LINE (x, y)-(x + 20, y), 16
    _DELAY 0.1
WEND
