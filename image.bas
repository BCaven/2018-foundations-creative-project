SCREEN _NEWIMAGE(640, 480, 32)
CLS , _RGB(0, 255, 0)
i = _LOADIMAGE("path.png") 'see note below examples to get the image
_PUTIMAGE (0, 0), i 'places image at upper left corner of window w/o stretching it

LET X = 20
LET Y = 10
REM TESTING------------------------------------------------------------
WHILE KEY$ <> "Q"
    _PUTIMAGE (0, 0), i
    LOCATE Y, X
    PRINT ""
    LOCATE Y + 1, X
    PRINT "|"
    LOCATE Y + 1, X - 1
    PRINT "/"
    LOCATE Y + 1, X + 1
    PRINT "\"
    LOCATE Y + 2, X
    PRINT "^"
    20 KEY$ = INKEY$
    IF KEY$ = "" THEN 20
    LOCATE Y, X
    PRINT " "
    SELECT CASE KEY$
        REM LEFT
        CASE CHR$(0) + "K"
            LET X = X - 1
            REM RIGHT
        CASE CHR$(0) + "M"
            LET X = X + 1
            REM UP
        CASE CHR$(0) + "H"
            LET Y = Y - 1
            REM DOWN
        CASE CHR$(0) + "P"
            LET Y = Y + 1
    END SELECT
    LOCATE Y, X
    PRINT ""
WEND

