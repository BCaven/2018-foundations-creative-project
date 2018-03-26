'Title screen
SCREEN 12
PAINT (10, 10), 15

FOR i = 1 TO 680 STEP 0.0001
    CIRCLE (i, 240), 10, 4
    CIRCLE (320, i), 10, 4
NEXT i
PAINT (320, 240), 5,4
