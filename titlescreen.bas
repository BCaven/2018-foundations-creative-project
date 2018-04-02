'Title screen
SCREEN 12
PAINT (10, 10), 15

FOR j = 2 TO 0 STEP -1
    FOR i = 1 TO 680 STEP 0.002
        CIRCLE (i, 240 + (10 * j)), 10, 4 + (2 - j)
        CIRCLE (320 + (10 * j), i), 10, 4 + (2 - j)
        CIRCLE (i, 240 - (10 * j)), 10, 4 + (2 - j)
        CIRCLE (320 - (10 * j), i), 10, 4 + (2 - j)
    NEXT i
NEXT j
PRINT "Adventure!"
PRINT "PRESS ANY KEY TO START"
SLEEP
CLS
SCREEN 1
WIDTH 60, 60
PRINT "Welcome to adventure. This is a top-down RPG made in BASIC."
PRINT "We will first need some information."
INPUT "What is your favorite color"; color1$
INPUT "What is your second favorite color"; color2$
INPUT "What is your third favorite color"; color3$
INPUT "What is your first name"; fname$
INPUT "What is your middle name"; middle$
INPUT "What is your father's name"; dad$
last$ = dad$ + "son"
INPUT "What is your mother's name"; mom$
nick$ = LEFT$(fname$, 2) + LCASE$(RIGHT$(dad$, 1)) +" " + last$
PRINT "Will you go by"; nick$

