SCREEN 12
x = 10
y = 10
WHILE 1 = 1
    pressed = _KEYHIT
    IF pressed = 18432 THEN y = y - 20
    IF pressed = 20480 THEN y = y + 20
    IF pressed = 19200 THEN x = x - 20
    IF pressed = 19712 THEN x = x + 20
    CIRCLE (x, y), 10, 10
WEND
