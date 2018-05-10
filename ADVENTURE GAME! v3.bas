' WORLD SELECTOR
SCREEN _NEWIMAGE(640, 580, 32) ' screen size: 640 by 580
load = _LOADIMAGE("load1.png")
_PUTIMAGE (0, 0), load
' all of da images... 0.0
plains = _LOADIMAGE("plains.png")
desert = _LOADIMAGE("desert.png")
marsh = _LOADIMAGE("marsh.png")
river = _LOADIMAGE("river.png")
village = _LOADIMAGE("city.png")
Rimap = _LOADIMAGE("RiverMap.png") 'see note below examples to get the image
Plmap = _LOADIMAGE("PlainsMap.png")
Demap = _LOADIMAGE("DesertMap.png")
Mamap = _LOADIMAGE("MarshMap.png")
Vimap = _LOADIMAGE("VillageMap.png")
station = _LOADIMAGE("trainStation.png")
menu = _LOADIMAGE("menuTest.png")
button = _LOADIMAGE("Button.png")
RickPat = _LOADIMAGE("rickpat.png")
rodog = _LOADIMAGE("rodog.png")
donald = _LOADIMAGE("donald.png")
fiero = _LOADIMAGE("fiero.png")
porple = _LOADIMAGE("porple.png")
RickPatL = _LOADIMAGE("rickpatL.png")
rodogL = _LOADIMAGE("rodogL.png")
donaldL = _LOADIMAGE("donaldL.png")
fieroL = _LOADIMAGE("FieroTest.png")
porpleL = _LOADIMAGE("porpleL.png")
RickPatR = _LOADIMAGE("rickpatR.png")
rodogR = _LOADIMAGE("rodogR.png")
donaldR = _LOADIMAGE("donaldR.png")
fieroR = _LOADIMAGE("FieroTest.png")
porpleR = _LOADIMAGE("porpleR.png")
msg0 = _LOADIMAGE("msg0.png")
msg1 = _LOADIMAGE("msg1.png")
msg2 = _LOADIMAGE("msg2.png")
msg3 = _LOADIMAGE("msg3.png")
msg4 = _LOADIMAGE("msg4.png")
msg5 = _LOADIMAGE("msg5.png")
msg6 = _LOADIMAGE("msg6.png")
bush = _LOADIMAGE("bush.png")
wander = _LOADIMAGE("Wanderer.png")
'_FULLSCREEN
selected2 = 0
char$(0) = "rickpat"
char$(1) = "porple"
char$(2) = "rodog"
char$(3) = "donald"
char$(4) = "fiero"
speed(0) = 2 'rickpat speed
speed(1) = 10 'porple speed
speed(2) = 15 'rodog speed
speed(3) = 7 'donald speed
speed(4) = 5 ' fiero speed
CLS , _RGB(0, 0, 0)
VIEW PRINT 20 TO 25
X = 200
Y = 200
clicked = 0
PHEALTH = 100
PSTRENGTH = 100
_PUTIMAGE (0, 0), menu 'places image at upper left corner of window w/o stretching it
SLEEP
CLS 0, RGB(0, 0, 0)
selected2 = 1
FOR i = 1 TO 5
    wanderX(i) = INT(RND * 630) + 1
    wanderY(i) = INT(RND * 470) + 1
NEXT i
FOR i = 1 TO 5
    bushX(i) = INT(RND * (640 - 50)) + 1
    bushY(i) = INT(RND * (480 - 50)) + 1
NEXT i
FOR i = 1 TO 5
    buttonX(i) = INT(RND * (640 - 50)) + 1
    buttonY(i) = INT(RND * (480 - 50)) + 1
NEXT i
unlock1 = 0
stage = 1
msg = 5
count = 0
facing$ = "right"
WHILE KEY$ <> ""
    KEY$ = INKEY$
    'cls , RGB(0, 0, 0)
    IF count = 0 THEN
        _PUTIMAGE (0, 0), station
    END IF
    IF count = 0 AND Y > 480 THEN
        Y = 0
        _PUTIMAGE (0, 0), Plmap
        count = 1
    END IF
    IF count = 1 THEN
        _PUTIMAGE (0, 0), Plmap
    END IF
    IF count = 1 AND Y < 0 THEN
        Y = 480
        _PUTIMAGE (0, 0), station
        count = 0
    END IF
    IF count = 0 AND Y < 0 THEN
        Y = 480
        _PUTIMAGE (0, 0), Vimap
        count = 2
    END IF
    IF count = 2 THEN
        _PUTIMAGE (0, 0), Vimap
    END IF
    IF count = 2 AND Y > 480 THEN
        Y = 0
        _PUTIMAGE (0, 0), station
        count = 0
    END IF
    IF count = 0 AND X > 640 THEN
        X = 0
        _PUTIMAGE (0, 0), Rimap
        count = 3
    END IF
    IF count = 3 AND X < 0 THEN
        X = 640
        _PUTIMAGE (0, 0), station
        count = 0
    END IF
    IF count = 3 THEN _PUTIMAGE (0, 0), Rimap
    IF count = 0 AND X < 0 THEN
        X = 640
        _PUTIMAGE (0, 0), Mamap
        count = 4
    END IF
    IF count = 4 THEN _PUTIMAGE (0, 0), Mamap
    IF count = 4 AND X > 640 THEN
        X = 0
        _PUTIMAGE (0, 0), station
        count = 0
    END IF
    FOR i = 1 TO 5
        _PUTIMAGE (wanderX(i), wanderY(i)), wander
        IF X > wanderX(i) - 30 AND X < wanderX(i) + 30 AND Y > wanderY(i) - 30 AND Y < wanderY(i) + 30 THEN
            msg = i - 1
        END IF
    NEXT i
    pressed = _KEYHIT
    IF pressed = 18432 THEN
        Y = Y - speed(selected2)
        'facing$ = "up"
    END IF
    IF pressed = 20480 THEN
        Y = Y + speed(selected2)
        'facing$ = "down"
    END IF
    IF pressed = 19200 THEN
        X = X - speed(selected2)
        facing$ = "left"
    END IF
    IF pressed = 19712 THEN
        X = X + speed(selected2)
        facing$ = "right"
    END IF
    IF facing$ = "left" THEN
        IF char$(selected2) = "rickpat" THEN _PUTIMAGE (X, Y), RickPatL
        IF char$(selected2) = "porple" THEN _PUTIMAGE (X, Y), porpleL
        IF char$(selected2) = "rodog" THEN _PUTIMAGE (X, Y), rodogL
        IF char$(selected2) = "donald" THEN _PUTIMAGE (X, Y), donaldL
        IF char$(selected2) = "fiero" THEN _PUTIMAGE (X, Y), fieroL
    END IF
    IF facing$ = "right" THEN
        IF char$(selected2) = "rickpat" THEN _PUTIMAGE (X, Y), RickPatR
        IF char$(selected2) = "porple" THEN _PUTIMAGE (X, Y), porpleR
        IF char$(selected2) = "rodog" THEN _PUTIMAGE (X, Y), rodogR
        IF char$(selected2) = "donald" THEN _PUTIMAGE (X, Y), donaldR
        IF char$(selected2) = "fiero" THEN _PUTIMAGE (X, Y), fieroR
    END IF
    IF msg = 0 THEN _PUTIMAGE (0, 480), msg0
    IF msg = 1 THEN _PUTIMAGE (0, 480), msg1
    IF msg = 2 THEN _PUTIMAGE (0, 480), msg2
    IF msg = 3 THEN _PUTIMAGE (0, 480), msg3
    IF msg = 4 THEN _PUTIMAGE (0, 480), msg4
    IF msg = 5 THEN _PUTIMAGE (0, 480), msg5
    IF msg = 6 THEN _PUTIMAGE (0, 480), msg6
    IF count = 3 OR count = 1 THEN
        FOR i = 1 TO 10
            _PUTIMAGE (bushX(i), bushY(i)), bush
        NEXT i
    END IF
    IF count = 1 AND stage <= 5 THEN
        _PUTIMAGE (buttonX(stage), buttonY(stage)), button
        IF X > buttonX(stage) - 10 AND X < buttonX(stage) + 10 AND Y > buttonY(stage) - 10 AND Y < buttonY(stage) + 10 THEN
            stage = stage + 1
        END IF
    END IF
    IF count = 1 AND stage > 5 THEN
        unlock1 = 1
    END IF
    IF unlock1 = 1 THEN
        msg = 6
        charswap = 1
        unlock1 = 0
    END IF
    IF charswap >= 1 THEN
        IF pressed = 97 THEN
            selected2 = selected2 - 1
        END IF
        IF pressed = 100 THEN
            selected2 = selected2 + 1
        END IF
        IF selected2 < 1 THEN selected2 = charswap + 1
        IF selected2 > charswap + 1 THEN selected2 = 1

    END IF
    _DELAY 0.1
WEND




