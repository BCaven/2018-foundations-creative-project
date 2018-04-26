' WORLD SELECTOR
SCREEN _NEWIMAGE(640, 480, 32) ' screen size: 640 by 480
plains = _LOADIMAGE("plains.png")
desert = _LOADIMAGE("desert.png")
marsh = _LOADIMAGE("marsh.png")
river = _LOADIMAGE("river.png")
village = _LOADIMAGE("city.png")
PRINT "loading..."
Rimap = _LOADIMAGE("RiverMap.png") 'see note below examples to get the image
Plmap = _LOADIMAGE("PlainsMap.png")
Demap = _LOADIMAGE("DesertMap.png")
Mamap = _LOADIMAGE("MarshMap.png")
Vimap = _LOADIMAGE("VillageMap.png")
PRINT "loading"
surround = _LOADIMAGE("Desert Surroundings.png")
PRINT "loading"
menu = _LOADIMAGE("menuTest.png")
PRINT "loading..."
button = _LOADIMAGE("Button.png")
PRINT "loading..."
charU = _LOADIMAGE("charUP.png")
PRINT "loading..."
charD = _LOADIMAGE("charDOWN.png")
PRINT "loading..."
charL = _LOADIMAGE("charLEFT.png")
PRINT "loading..."
charR = _LOADIMAGE("charRIGHT.png")
PRINT "loading..."
bush = _LOADIMAGE("bush.png")
PRINT "loading..."
wander = _LOADIMAGE("Wanderer.png")
HUDB = _LOADIMAGE("HUD BACKGROUND.png")
_FULLSCREEN
CLS
selected = 0
world$(0) = "plains"
world$(1) = "desert"
world$(2) = "marsh"
world$(3) = "river"
world$(4) = "village"
PRINT "SELECT A WORLD"
PRINT "To select a world, use the [RIGHT] and [LEFT] arrow keys"
PRINT "When you have chosen your world press [SPACE] to continue"
PRINT "press any key to continue"
SLEEP
CLS
WHILE INKEY$ <> " "
    theymessedup:
    pressed = _KEYHIT
    IF pressed = 19200 THEN
        selected = selected - 1
        IF selected = -1 THEN selected = 4
    END IF
    IF pressed = 19712 THEN
        selected = selected + 1
        IF selected = 5 THEN selected = 0
    END IF
    PRINT "Current world: " + world$(selected)
    IF world$(selected) = "plains" THEN _PUTIMAGE (120, 40), plains
    IF world$(selected) = "desert" THEN _PUTIMAGE (120, 40), desert
    IF world$(selected) = "marsh" THEN _PUTIMAGE (120, 40), marsh
    IF world$(selected) = "river" THEN _PUTIMAGE (120, 40), river
    IF world$(selected) = "village" THEN _PUTIMAGE (120, 40), village
    _DELAY 0.1
    CLS
WEND

PRINT "you have chosen: " + world$(selected)
INPUT "do you want to change? (y/n) ", answr$
IF answr$ = "y" THEN GOTO theymessedup
CLS
selected2 = 0
char$(0) = "Billy"
char$(1) = "Bob"
char$(2) = "Joe"
char$(3) = "Dez"
char$(4) = "Kong"
PRINT "SELECT A CHARACTER"
PRINT "To select a world, use the [RIGHT] and [LEFT] arrow keys"
PRINT "When you have chosen your character press [SPACE] to continue"
PRINT "press any key to continue"
SLEEP
CLS
WHILE INKEY$ <> " "
    theymessedup2:
    pressed = _KEYHIT
    IF pressed = 19200 THEN
        selected2 = selected2 - 1
        IF selected2 = -1 THEN selected2 = 4
    END IF
    IF pressed = 19712 THEN
        selected2 = selected2 + 1
        IF selected2 = 5 THEN selected2 = 0
    END IF
    PRINT "Current character: " + char$(selected2)
    _DELAY 0.1
    CLS
WEND
PRINT "you have chosen: " + char$(selected2)
INPUT "do you want to change? (y/n) ", answr$
IF answr$ = "y" THEN GOTO theymessedup2

CLS , _RGB(0, 0, 0)
VIEW PRINT 20 TO 25
X = 200
Y = 200
clicked = 0
PHEALTH = 100
PSTRENGTH = 100
_PUTIMAGE (0, 0), menu 'places image at upper left corner of window w/o stretching it
SLEEP
FOR i = 1 TO 5
    wanderX(i) = INT(RND * 640) + 1
    wanderY(i) = INT(RND * 480) + 1
NEXT i
WHILE KEY$ <> ""
    KEY$ = INKEY$
    'cls , RGB(0, 0, 0)

    IF world$(selected) = "plains" THEN _PUTIMAGE (0, 0), Plmap
    IF world$(selected) = "marsh" THEN _PUTIMAGE (0, 0), Mamap
    IF world$(selected) = "village" THEN _PUTIMAGE (0, 0), Vimap
    IF world$(selected) = "desert" THEN _PUTIMAGE (0, 0), Demap
    IF world$(selected) = "river" THEN _PUTIMAGE (0, 0), Rimap
    FOR i = 1 TO 10
        _PUTIMAGE (wanderX(i), wanderY(i)), wander
    NEXT i
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
    _PUTIMAGE (320, 240), button

    IF facing$ = "up" THEN

        _PUTIMAGE (X, Y), charU
    END IF
    IF facing$ = "down" THEN

        _PUTIMAGE (X, Y), charD
    END IF
    IF facing$ = "left" THEN

        _PUTIMAGE (X, Y), charL
    END IF
    IF facing$ = "right" THEN

        _PUTIMAGE (X, Y), charR
    END IF
    _PUTIMAGE (200, 200), bush
    _DELAY 0.1
WEND




