SCREEN 12
' flower 1
x = 200
y = 200
hold = "none"
FOR i = 1 TO 10
    a = 10 * i
    'da flower petals
    'one side
    LINE (x - a, y + 100)-(x, y + a), 3
    LINE (x + a, y - 100)-(x, y - a), 3
    LINE (x + 100, y - a)-(x + a, y), 3
    LINE (x - 100, y + a)-(x - a, y), 3
    'second side
    LINE (x - a, y - 100)-(x, y - a), 3
    LINE (x + a, y + 100)-(x, y + a), 3
    LINE (x - 100, y - a)-(x - a, y), 3
    LINE (x + 100, y + a)-(x + a, y), 3
NEXT i
PAINT (x, y), 5, 3 ' paint the flor
FOR i = 1 TO 10 ' erase the flor
    a = 10 * i
    'da flower petals
    'one side
    LINE (x - a, y + 100)-(x, y + a), 16
    LINE (x + a, y - 100)-(x, y - a), 16
    LINE (x + 100, y - a)-(x + a, y), 16
    LINE (x - 100, y + a)-(x - a, y), 16
    'second side
    LINE (x - a, y - 100)-(x, y - a), 16
    LINE (x + a, y + 100)-(x, y + a), 16
    LINE (x - 100, y - a)-(x - a, y), 16
    LINE (x + 100, y + a)-(x + a, y), 16
NEXT i
PRINT "made by Blake and Artin"
PRINT "press any key to continue"
SLEEP

' All of that condensation
SCREEN _NEWIMAGE(640, 580, 32) ' screen size: 640 by 580
load = _LOADIMAGE("load1.png")
_PUTIMAGE (0, 0), load
' Maps
plains = _LOADIMAGE("plains.png"): desert = _LOADIMAGE("desert.png"): marsh = _LOADIMAGE("marsh.png"): river = _LOADIMAGE("river.png"): village = _LOADIMAGE("city.png"): Rimap = _LOADIMAGE("RiverMap.png"): Plmap = _LOADIMAGE("PlainsMap.png"): Demap = _LOADIMAGE("DesertMap.png"): Mamap = _LOADIMAGE("MarshMap.png"): Vimap = _LOADIMAGE("VillageMap.png"): station = _LOADIMAGE("trainStation.png"): menu = _LOADIMAGE("menuTest.png"): button = _LOADIMAGE("Button.png"): ViEnemy = _LOADIMAGE("VillageEnemy.png")
' Characters
RickPat = _LOADIMAGE("rickpat.png"): rodog = _LOADIMAGE("rodog.png"): donald = _LOADIMAGE("donald.png"): fiero = _LOADIMAGE("fiero.png"): porple = _LOADIMAGE("porple.png"): RickPatL = _LOADIMAGE("rickpatL.png"): rodogL = _LOADIMAGE("rodogL.png"): donaldL = _LOADIMAGE("donaldL.png"): fieroL = _LOADIMAGE("FieroTest.png"): porpleL = _LOADIMAGE("porpleL.png"): RickPatR = _LOADIMAGE("rickpatR.png"): rodogR = _LOADIMAGE("rodogR.png"): donaldR = _LOADIMAGE("donaldR.png"): fieroR = _LOADIMAGE("FieroTest.png"): porpleR = _LOADIMAGE("porpleR.png")
' Messages
msg(0) = _LOADIMAGE("msg0.png"): msg(1) = _LOADIMAGE("msg1.png"): msg(2) = _LOADIMAGE("msg2.png"): msg(3) = _LOADIMAGE("msg3.png"): msg(4) = _LOADIMAGE("msg4.png"): msg(5) = _LOADIMAGE("msg5.png"): msg(6) = _LOADIMAGE("msg6.png"): bush = _LOADIMAGE("bush.png"): wander = _LOADIMAGE("Wanderer.png")
charL(4) = RickPatL: charL(0) = porpleL: charL(1) = rodogL: charL(2) = donaldL: charL(3) = fieroL: charR(4) = RickPatR: charR(0) = porpleR: charR(1) = rodogR: charR(2) = donaldR: charR(3) = fieroR: speed(4) = 2: speed(0) = 10: speed(1) = 15: speed(2) = 7: speed(3) = 5
att(4) = 41: att(0) = 11: att(1) = 16: att(2) = 21: att(3) = 31
CLS , _RGB(0, 0, 0)
x = 200: y = 200: clicked = 0: PHEALTH = 100: selected2 = 0: Ex = 200: Ey = 200
_PUTIMAGE (0, 0), menu 'places image at upper left corner of window w/o stretching it
SLEEP
FOR i = 1 TO 5
    wanderX(i) = INT(RND * 630) + 1: wanderY(i) = INT(RND * 470) + 1
NEXT i
FOR i = 1 TO 5
    bushX(i) = INT(RND * (640 - 50)) + 1: bushY(i) = INT(RND * (480 - 50)) + 1
NEXT i
FOR i = 1 TO 5
    buttonX(i) = INT(RND * (640 - 50)) + 1: buttonY(i) = INT(RND * (480 - 50)) + 1
NEXT i
unlock1 = 0: stage = 1: msgNum = 5: count = 0: facing$ = "right": E1Health = 100
WHILE KEY$ <> ""
    KEY$ = INKEY$
    'cls , RGB(0, 0, 0)
    IF count = 0 THEN
        _PUTIMAGE (0, 0), station
    END IF
    IF count = 0 AND y > 480 THEN
        _PUTIMAGE (0, 0), Plmap
        y = 0: count = 1
    END IF
    IF count = 1 THEN _PUTIMAGE (0, 0), Plmap
    IF count = 1 AND y < 0 THEN _PUTIMAGE (0, 0), station: y = 480: count = 0
    IF count = 0 AND y < 0 THEN _PUTIMAGE (0, 0), Vimap: y = 480: count = 2
    IF count = 2 THEN _PUTIMAGE (0, 0), Vimap
    IF count = 2 AND y > 480 THEN _PUTIMAGE (0, 0), station: y = 0: count = 0
    IF count = 0 AND x > 640 THEN _PUTIMAGE (0, 0), Rimap: x = 0: count = 3
    IF count = 3 AND x < 0 THEN _PUTIMAGE (0, 0), station: x = 640: count = 0
    IF count = 3 THEN _PUTIMAGE (0, 0), Rimap
    IF count = 0 AND x < 0 THEN _PUTIMAGE (0, 0), Mamap: x = 640: count = 4
    IF count = 4 THEN _PUTIMAGE (0, 0), Mamap
    IF count = 4 AND x > 640 THEN _PUTIMAGE (0, 0), station: x = 0: count = 0
    FOR i = 1 TO 5
        _PUTIMAGE (wanderX(i), wanderY(i)), wander
        IF x > wanderX(i) - 30 AND x < wanderX(i) + 30 AND y > wanderY(i) - 30 AND y < wanderY(i) + 30 THEN msgNum = i - 1
    NEXT i
    IF count = 1 AND stage <= 5 THEN
        _PUTIMAGE (buttonX(stage), buttonY(stage)), button
        IF x > buttonX(stage) - 10 AND x < buttonX(stage) + 10 AND y > buttonY(stage) - 10 AND y < buttonY(stage) + 10 THEN stage = stage + 1
    END IF

    pressed = _KEYHIT
    IF pressed = 18432 THEN y = y - speed(selected2)
    IF pressed = 20480 THEN y = y + speed(selected2)
    IF pressed = 19200 THEN x = x - speed(selected2): facing$ = "left"
    IF pressed = 19712 THEN x = x + speed(selected2): facing$ = "right"
    IF facing$ = "left" THEN _PUTIMAGE (x, y), charL(selected2)
    IF facing$ = "right" THEN _PUTIMAGE (x, y), charR(selected2)
    _PUTIMAGE (0, 480), msg(msgNum)
    IF count = 3 OR count = 1 THEN
        FOR i = 1 TO 10
            _PUTIMAGE (bushX(i), bushY(i)), bush
        NEXT i
    END IF
    IF count = 1 AND stage > 5 THEN unlock1 = 1
    IF unlock1 = 1 THEN msgNum = 6: charswap = 1: unlock1 = 0
    IF charswap >= 1 THEN
        IF pressed = 97 THEN selected2 = selected2 - 1
        IF pressed = 100 THEN selected2 = selected2 + 1
        IF selected2 < 0 THEN selected2 = charswap
        IF selected2 > charswap THEN selected2 = 0
    END IF
    IF count = 2 AND E1Health > 0 THEN
        _PUTIMAGE (Ex, Ey), ViEnemy
        IF x > Ex THEN Ex = Ex + 10
        IF x < Ex THEN Ex = Ex - 10
        IF y > Ey THEN Ey = Ey + 10
        IF y < Ey THEN Ey = Ey - 10
        IF Ex < 0 THEN Ex = 640
        IF Ex > 640 THEN Ex = 0
        IF x > Ex - 10 AND x < Ex + 10 AND y > Ey - 10 AND y < Ey + 10 THEN PRINT "hit": E1Health = E1Health - att(selected2)

    END IF
                                                                                                        'IN PROGRESS BELOW
                                                                                                        IF count = 4 THEN
        IF hold$ = "none" THEN
            _PUTIMAGE (200, 400), bowu
            IF x = 200 AND y = 400 THEN hold$ = "bow"
        END IF
        IF hold$ = "bow" THEN
            IF facing$ = "up" THEN _PUTIMAGE (x + 5, y - 5), bowu
            IF facing$ = "down" THEN _PUTIMAGE (x - 5, y + 5), bowd
            IF facing$ = "left" THEN _PUTIMAGE (x - 5, y - 5), bowl
            IF facing$ = "right" THEN _PUTIMAGE (x + 5, y + 5), bowr                                                                                                                        
            IF pressed = 32 THEN
                IF facing$ = "up" THEN
                    FOR i = 1 TO 30
                        arrowx = x
                        arrowy = y - (i * 20)
                        _PUTIMAGE (0, 0), k
                        _PUTIMAGE (x, y), charU
                        _PUTIMAGE (x + 5, y - 5), bowu
                        _PUTIMAGE (arrowx, arrowy), arrowu
                        _DELAY 0.1
                    NEXT i
                END IF
                IF facing$ = "down" THEN
                    FOR i = 1 TO 30
                        arrowx = x
                        arrowy = y + (i * 20)
                        _PUTIMAGE (0, 0), k
                        _PUTIMAGE (x, y), charD
                        _PUTIMAGE (x - 5, y + 5), bowd
                        _PUTIMAGE (arrowx, arrowy), arrowd
                        _DELAY 0.1
                    NEXT i
                END IF
                IF facing$ = "left" THEN
                    FOR i = 1 TO 30
                        arrowx = x - (i * 20)
                        arrowy = y
                        _PUTIMAGE (0, 0), k
                        _PUTIMAGE (x, y), charL
                        _PUTIMAGE (x - 5, y - 5), bowl
                        _PUTIMAGE (arrowx, arrowy), arrowl
                        _DELAY 0.1
                    NEXT i
                END IF
                IF facing$ = "right" THEN
                    FOR i = 1 TO 30
                        arrowx = x + (i * 20)
                        arrowy = y
                        _PUTIMAGE (0, 0), k
                        _PUTIMAGE (x, y), charR
                        _PUTIMAGE (x + 5, y + 5), bowr
                        _PUTIMAGE (arrowx, arrowy), arrowr
                        _DELAY 0.1
                    NEXT i
                END IF
            END IF
        END IF
    END IF
                                                                                               ' IN PROGRESS ABOVE                                                                                    
    IF E1Health < 0 THEN unlock2 = 1: E1Health = 0
    IF unlock2 = 1 THEN msgNum = 6: charswap = 2: unlock2 = 0
    _DELAY 0.1
WEND




