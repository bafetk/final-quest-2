DECLARE FUNCTION processcolor! (mousex!)
DECLARE SUB foreground1 ()
DECLARE SUB background1 ()
DECLARE FUNCTION exist! (file$)
DECLARE SUB background ()
DECLARE SUB foreground ()
DECLARE SUB level ()
DECLARE SUB Mouse (which!)
DIM SHARED bbbb, dddd$, rp, f, b, h$, gg$, ii$, x, y, filename$, reload
DIM SHARED mouser$, mouseleftbutton, mouserightbutton, mousexpos, mouseypos, ax%, bx%, cx%, dx%, xpos, ypos
DIM map(5000)
mousecontrol = 0

gg$ = " "
Mouse 0
Mouse 4

C$ = UCASE$(COMMAND$)
IF C$ = "" THEN filename$ = "fqmaps.dat"
IF C$ <> "" THEN filename$ = C$


IF C$ <> "" THEN
        filename$ = C$
        GOTO continue3
        END IF

IF exist("fqmaps.dat") = 0 THEN
        INPUT "Please enter map name to edit eg. MAPS.DAT:"; filename$


IF filename$ = "" THEN END

continue3:

IF INSTR(filename$, ".") = 0 THEN filename$ = filename$ + "."
IF INSTR(RIGHT$(filename$, LEN(filename$) - INSTR(filename$, ".")), ".") THEN END
IF INSTR(filename$, ".") - 1 > 8 THEN END

'FOR gd = 1 TO 100
'IF filename$ = STRING$(gd, ".") THEN END
'NEXT gd


END IF


x = 1: y = 1
x23 = 1: y23 = 1
rp = 1: Null$ = CHR$(0)
dddd$ = filename$

loader2:
        PRINT "Building Map Dimension, Please wait..."; SPC(0);
                jack = CSRLIN + 1
                jack8 = CSRLIN
                position = POS(0)
                        LOCATE jack, 1
                        PRINT "["; STRING$(50, "."); "]"; SPC(0);
                LOCATE jack8, position
        CLOSE
                LOCATE , 39
        OPEN filename$ FOR BINARY AS #98
                dick = LOF(98)
                d1 = dick / 3481
                d2 = d1 / 100
                im = 1
                hold = d2
                dicks = 0
                percent = 0
csg:

        IF dicks >= hold THEN
                LOCATE jack, FIX(percent / 2) + 2: PRINT CHR$(176); SPC(0);
                hold = hold + d2
                percent = percent + 1
                LOCATE jack8, position
        END IF



IF im >= LOF(98) THEN GOTO nx
        a$ = SPACE$(5)
                GET #98, im, a$
        type$ = LEFT$(a$, 1)
        number = VAL(RIGHT$(a$, 4))
        IF type$ = "1" THEN map(number) = 1
        IF type$ = "2" THEN map(number) = 2
        IF type$ = "3" THEN map(number) = 3
        IF type$ = "4" THEN map(number) = 4
        im = im + 3481
                LOCATE , 39: PRINT number; SPC(0);
        dicks = dicks + 1
GOTO csg

nx:
PRINT "Done."
CLOSE #98


loader1:
        CLOSE
        OPEN filename$ FOR BINARY AS #1
                COLOR 15, 1: CLS
                LOCATE 1, 1
                        FOR xcc = 1 TO 1920
                        xc = CSRLIN
                                IF map(xcc) = 0 THEN
                                        COLOR 15, 1: PRINT " "; SPC(0);
                                END IF
                                IF map(xcc) = 1 THEN
                                        COLOR 15, 2: PRINT " "; SPC(0);
                                END IF
                                IF map(xcc) = 2 THEN
                                        COLOR 15, 3: PRINT " "; SPC(0);
                                END IF
                                IF map(xcc) = 3 THEN
                                        COLOR 15, 7: PRINT " "; SPC(0);
                                END IF
                                IF map(xcc) = 4 THEN
                                        COLOR 7, 2: PRINT CHR$(254); SPC(0);
                                END IF
                        NEXT xcc



bk = dd * 3481 - 3476
kb = dd * 3481

COLOR 7, 0

beginer:
LOCATE 25, 1: PRINT STRING$(80, " "); SPC(0); : LOCATE 25, 1

PRINT "Leveler. ESC-end, Enter-select, D-el, M-ove, T-ype, C-opy, S-tamp. Screen "; LTRIM$(STR$(rp)); SPC(0);

oldx = x23: oldy = y23
Mouse 3: Mouse 4
oldmousex = mousexpos: oldmousey = mouseypos
'MARK3
DO
Mouse 3: Mouse 4
IF mousexpos <> oldmousex AND mousecontrol = 0 THEN
        xpos = (x23 * 8) - 1
        ypos = (y23 * 8) - 1: Mouse 2: Mouse 4
        mousecontrol = 1
        END IF
IF mouseypos <> oldmousey AND mousecontrol = 0 THEN
        xpos = (x23 * 8) - 1
        ypos = (y23 * 8) - 1: Mouse 2: Mouse 4
        mousecontrol = 1
        END IF


IF (mouseypos / 8) + 1 > 24 THEN
        ypos = (24 * 8) - 1
        xpos = mousexpos: Mouse 2
        END IF

IF mousecontrol = 1 THEN
        IF restarting = 0 THEN
                x23 = (mousexpos / 8) + 1
                y23 = (mouseypos / 8) + 1
                END IF
        IF restarting = 1 THEN
                xpos = (x23 * 8) - 1
                ypos = (y23 * 8) - 1: Mouse 2: Mouse 4
                restarting = 0
                END IF
        IF y23 > 24 THEN y23 = 24
        IF x23 > 80 THEN x23 = 80
        IF y23 < 1 THEN y23 = 1
        IF x23 < 1 THEN x23 = 1
        rp = ((y23 - 1) * 80) + x23
IF rp <> oldrp THEN LOCATE 25, 74, 0: PRINT rp; SPC(0); STRING$(5 - LEN(LTRIM$(STR$(rp))), " "); SPC(0);

        IF mouseleftbutton = -1 THEN
                DO: Mouse 3: LOOP WHILE mouseleftbutton = -1
                GOTO loader
                END IF

END IF
oldrp = rp

        LOCATE y23, x23, 1, 0, 7
        checker$ = INKEY$
LOOP WHILE checker$ = ""

checker$ = UCASE$(checker$)

        SELECT CASE checker$
                CASE "S"
                        GOTO stamp
                CASE "C"
                        GOTO copier
                CASE "T"
                        GOTO typer
                CASE "M"
                        GOTO mover
                CASE "D"
                        GOTO DEL
                CASE CHR$(27)
                        filessize = LOF(1)
                        CLOSE #1
                        GOTO quit5
                CASE Null$ + CHR$(72)
                        mousecontrol = 0: Mouse 4
                        IF y23 = 1 THEN
                                y23 = 24
                                dkdk = y23 - 1
                                rp = dkdk * 80 + x23
                                GOTO beginer
                        END IF
                        y23 = y23 - 1
                        rp = rp - 80
                        GOTO beginer
                CASE Null$ + CHR$(80)
                        mousecontrol = 0: Mouse 4
                        IF y23 = 24 THEN
                                y23 = 1
                                dkdk = y23 - 1
                                rp = dkdk * 80 + x23
                                GOTO beginer
                        END IF
                        y23 = y23 + 1
                        rp = rp + 80
                        GOTO beginer
                CASE Null$ + CHR$(77)
                        mousecontrol = 0: Mouse 4
                        IF x23 = 80 THEN
                                x23 = 1
                                dkdk = y23 - 1
                                rp = dkdk * 80 + x23
                                GOTO beginer
                        END IF
                        x23 = x23 + 1
                        rp = rp + 1
                        GOTO beginer
                CASE Null$ + CHR$(75)
                        mousecontrol = 0: Mouse 4
                        IF x23 = 1 THEN
                                x23 = 80
                                dkdk = y23 - 1
                                rp = dkdk * 80 + x23
                                GOTO beginer
                        END IF
                        x23 = x23 - 1
                        rp = rp - 1
                        GOTO beginer
                CASE CHR$(13)
                        GOTO loader
                CASE ELSE
                        GOTO beginer
        END SELECT
GOTO quit5

copier:
        dd = 1
        rp$ = LTRIM$(RTRIM$(STR$(rp)))
                DO
                                lk = dd * 3481 - 3479
                                dg$ = SPACE$(4)
                                IF lk > LOF(1) THEN GOTO nostamp
                                rp1$ = SPACE$(4)
                        GET #1, lk, rp1$
                                rp1$ = RTRIM$(LTRIM$(rp1$))
                                IF rp$ = rp1$ THEN
                                        lk = lk + 4
                                        buffer$ = SPACE$(3476) '5214)
                                        buffer1$ = " "
                                        GET #1, lk - 5, buffer1$
                                        GET #1, lk, buffer$
                                        GOTO nostamp
                                END IF
                                dd = dd + 1
                LOOP
nostamp:
        GOTO beginer

stamp:
        IF LEN(buffer$) < 3476 THEN GOTO loader1
        CLOSE #1
                OPEN dddd$ FOR BINARY AS #1
                        dd = 1
                        rp$ = STR$(rp)
                        rp$ = LTRIM$(rp$)
                DO
                        lk = dd * 3481 - 3479
                        dg$ = SPACE$(4)

map(rp) = VAL(LEFT$(buffer1$, 1))

IF lk > LOF(1) THEN
lb = LOF(1) + 1
rp$ = STR$(rp)
COLOR 7, 0
rp$ = RTRIM$(LTRIM$(rp$))
IF LEN(rp$) = 1 THEN
rp1$ = "1   " + rp$
END IF
IF LEN(rp$) = 2 THEN
rp1$ = "1  " + rp$
END IF
IF LEN(rp$) = 3 THEN
rp1$ = "1 " + rp$
END IF
IF LEN(rp$) = 4 THEN
rp1$ = "1" + rp$
END IF

PUT #1, lb, rp1$
lb = lb + 5
PUT #1, lb - 5, buffer1$


PUT #1, lb, buffer$
GOTO loader1
END IF

GET #1, lk, dg$
dg$ = LTRIM$(dg$)

IF dg$ = rp$ THEN GOTO yes347
dd = dd + 1
LOOP
yes347:
lk = lk - 1
PUT #1, lk, buffer1$
PUT #1, lk + 5, buffer$
GOTO loader1
loader:
COLOR 7, 0
CLS
CLOSE #1
OPEN dddd$ FOR BINARY AS #1
dd = 1
rp$ = STR$(rp)
rp$ = LTRIM$(rp$)
DO
lk = dd * 3481 - 3479
dg$ = SPACE$(4)
IF lk > LOF(1) THEN
lb = LOF(1) + 1
rp$ = STR$(rp)
COLOR 7, 0
rp$ = RTRIM$(LTRIM$(rp$))
IF LEN(rp$) = 1 THEN
rp1$ = "1   " + rp$
END IF
IF LEN(rp$) = 2 THEN
rp1$ = "1  " + rp$
END IF
IF LEN(rp$) = 3 THEN
rp1$ = "1 " + rp$
END IF
IF LEN(rp$) = 4 THEN
rp1$ = "1" + rp$
END IF

PUT #1, lb, rp1$
lb = lb + 5
an$ = CHR$(0) + CHR$(0)
rp = VAL(rp$)
map(rp) = 1
FOR bx = 1 TO 1738
PUT #1, lb, an$
lb = lb + 2
NEXT bx
GOTO loader
END IF
GET #1, lk, dg$
dg$ = LTRIM$(dg$)

IF dg$ = rp$ THEN GOTO yes7
dd = dd + 1
LOOP
yes7:

bbeeggiinn:
COLOR 7, 0
CLS
bbbb = 1
LOCATE 1, 1
bk = dd * 3481 - 3475
kb = dd * 3481
FOR l = bk TO kb STEP 2
a$ = SPACE$(2)
GET #1, l, a$

IF POS(0) = 80 THEN
LOCATE CSRLIN + 1, 1
END IF



D$ = LEFT$(a$, 1)
D = ASC(D$)
fg = FIX(D / 16)
bg = D - (fg * 16)
IF bg > 7 THEN bg = bg - 8

COLOR fg, bg
IF fg = 0 AND bg = 0 THEN COLOR 15

IF e$ = CHR$(32) THEN
COLOR 15
PRINT " "; SPC(0);
GOTO redo
END IF


IF e$ = CHR$(0) THEN
COLOR 15
PRINT " "; SPC(0);
GOTO redo
END IF

PRINT RIGHT$(a$, 1); SPC(0);


redo:
NEXT l
doneloading:
CLOSE #1
LOCATE 1, 1, 0
level

IF reload = 1 THEN
reload = 0
CLOSE #1
OPEN dddd$ FOR BINARY AS #1
GOTO bbeeggiinn
END IF

'y23 = FIX(rp / 80) + 1
'x23 = rp - ((y23 - 1) * 80)
'PRINT y23, x23: END
'IF x23 = 0 THEN x23 = 80
LOCATE y23, x23: 'mousecontrol = 0
restarting = 1

GOTO loader1
DEL:
LOCATE 25, 1
COLOR 7, 0
PRINT STRING$(80, " "); SPC(0);
LOCATE 25, 1
PRINT "Are you sure you want to delete map"; rp; "?  [N]"; SPC(0);
n$ = INPUT$(1)
IF UCASE$(n$) = "Y" THEN GOTO yer
GOTO loader1
yer:
LOCATE 25, 1, 0
map(rp) = 0
PRINT STRING$(80, " "); SPC(0); : LOCATE 25, 1
PRINT "Please Wait..."; SPC(0);
LOCATE 1, 1
SHELL "IF EXIST TEMP.DAT DEL TEMP.DAT"
OPEN "TEMP.DAT" FOR BINARY AS #2

rp$ = STR$(rp)
rp$ = RTRIM$(LTRIM$(rp$))
C = 1
FOR I = 1 TO LOF(1) STEP 3481
ab$ = SPACE$(3481)
abc$ = SPACE$(4)
GET #1, I, ab$
GET #1, I + 1, abc$
abc$ = LTRIM$(RTRIM$(abc$))
IF abc$ = rp$ THEN
GOTO nope
END IF
PUT #2, C, ab$
C = C + 3481
nope:
NEXT I
CLOSE #1, #2
SHELL "IF EXIST " + filename$ + " DEL " + filename$
SHELL "RENAME TEMP.DAT " + filename$

GOTO loader1
mover:
       
        IF ok = 1 AND CSRLIN = 25 AND sc2$ <> "" THEN
                FOR sdi = 1 TO LEN(sc2$)
                LOCATE , POS(0) - 1: PRINT " "; SPC(0); : LOCATE , POS(0) - 1
                NEXT sdi
        END IF
ok = 1
LOCATE 25, 1
COLOR 7, 0
PRINT STRING$(80, " "); SPC(0);
rp1$ = STR$(rp)
rp1$ = RTRIM$(LTRIM$(rp1$))
LOCATE 25, 1
PRINT "SCREEN TO COPY " + rp1$ + " TO, 0 CANCELS:"; SPC(0);
xxx = POS(0) + 1
LOCATE , xxx
sc2$ = ""
id:
id$ = INPUT$(1)
IF id$ = CHR$(13) THEN GOTO doneit
IF id$ = CHR$(8) THEN

IF sc2$ <> "" THEN sc2$ = LEFT$(sc2$, LEN(sc2$) - 1)
LOCATE , POS(0)
PRINT " "; SPC(0);
GOTO dd
END IF
sc2$ = sc2$ + id$
dd:
LOCATE 25, xxx
PRINT sc2$; SPC(0);
GOTO id
doneit:
IF sc2$ = "0" THEN GOTO loader1
IF sc2$ = "" THEN GOTO loader1
IF VAL(sc2$) = 0 THEN GOTO mover
ok = 0
IF VAL(sc2$) > 1920 THEN GOTO id
CLOSE #1
OPEN filename$ FOR BINARY AS #1

dd = 1
rp1$ = STR$(rp)
rp1$ = RTRIM$(LTRIM$(rp1$))
sc2$ = RTRIM$(LTRIM$(sc2$))
map(VAL(sc2$)) = map(rp)
map(rp) = 0
DO
lk = dd * 3481 - 3480
IF lk > LOF(1) THEN GOTO loadmap4
dg$ = SPACE$(4)
GET #1, lk + 1, dg$
dg$ = RTRIM$(LTRIM$(dg$))
IF dg$ = rp1$ THEN GOTO yes345
dd = dd + 1
LOOP
yes345:
IF LEN(sc2$) = 1 THEN
sc21$ = "1   " + sc2$
END IF
IF LEN(sc2$) = 2 THEN
sc21$ = "1  " + sc2$
END IF
IF LEN(sc2$) = 3 THEN
sc21$ = "1 " + sc2$
END IF
IF LEN(sc2$) = 4 THEN
sc21$ = "1" + sc2$
END IF
PUT #1, lk, sc21$
loadmap4:
CLOSE #1
GOTO loader1

typer:
dd = 1
rp$ = STR$(rp)
rp$ = LTRIM$(rp$)
DO
lk = dd * 3481 - 3479
IF lk > LOF(1) THEN
GOTO loader1
END IF
dg$ = SPACE$(4)
GET #1, lk, dg$
dg$ = LTRIM$(dg$)

IF dg$ = rp$ THEN GOTO yes46
dd = dd + 1
LOOP
yes46:

lk = lk - 1

type$ = SPACE$(1)
GET #1, lk, type$

IF type$ = "1" THEN
map(rp) = 2
type$ = "2"
PUT #1, lk, type$
GOTO loader1
END IF

IF type$ = "2" THEN
map(rp) = 3
type$ = "3"
PUT #1, lk, type$
GOTO loader1
END IF

IF type$ = "3" THEN
type$ = "4"
map(rp) = 4
PUT #1, lk, type$
GOTO loader1
END IF

IF type$ = "4" THEN
type$ = "1"
map(rp) = 1
PUT #1, lk, type$
GOTO loader1
END IF

GOTO loader1
quit5:
IF filessize <= 1000 THEN KILL filename$
COLOR 7, 0
CLS
COLOR 15, 0
PRINT
PRINT "The Leveler 2001, v3.31, (C) Copyright 2001 Akori Software"
PRINT "All rights reserved..."
PRINT
CLOSE
END

DATA 55,89,E5,8B,5E,0C,8B,07,50,8B,5E,0A,8B,07,50,8B
DATA 5E,08,8B,0F,8B,5E,06,8B,17,5B,58,1E,07,CD,33,53
DATA 8B,5E,0C,89,07,58,8B,5E,0A,89,07,8B,5E,08,89,0F
DATA 8B,5E,06,89,17,5D,CA,08,00

SUB background
PRINT "BACKGROUND: "; SPC(0);
'0,1,2,3,4,5,6,7: "; SPC(0);
COLOR 15, 0: PRINT "0"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 15, 1: PRINT "1"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 15, 2: PRINT "2"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 15, 3: PRINT "3"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 15, 4: PRINT "4"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 15, 5: PRINT "5"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 15, 6: PRINT "6"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 15, 7: PRINT "7"; SPC(0);
COLOR 7, 0: PRINT ": "; SPC(0);

END SUB

SUB background1
COLOR 15, 0: PRINT "0"; SPC(0);
COLOR 15, 1: PRINT "1"; SPC(0);
COLOR 15, 2: PRINT "2"; SPC(0);
COLOR 15, 3: PRINT "3"; SPC(0);
COLOR 15, 4: PRINT "4"; SPC(0);
COLOR 15, 5: PRINT "5"; SPC(0);
COLOR 15, 6: PRINT "6"; SPC(0);
COLOR 15, 7: PRINT "7"; SPC(0);
END SUB

FUNCTION exist! (file$)
OPEN file$ FOR BINARY AS #244
IF LOF(244) < 2 THEN
CLOSE #244
KILL file$
exist = 0
GOTO getouts
END IF

IF LOF(244) > 2 THEN
CLOSE #244
exist = 1
END IF

getouts:

END FUNCTION

SUB foreground
PRINT "FORGROUND: 0,"; SPC(0); : COLOR 1, 0:
PRINT "1"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 2, 0: PRINT "2"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 3, 0: PRINT "3"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 4, 0: PRINT "4"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 5, 0: PRINT "5"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 6, 0: PRINT "6"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 7, 0: PRINT "7"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 8, 0: PRINT "8"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 9, 0: PRINT "9"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 10, 0: PRINT "A"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 11, 0: PRINT "B"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 12, 0: PRINT "C"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 13, 0: PRINT "D"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 14, 0: PRINT "E"; SPC(0);
COLOR 7, 0: PRINT ","; SPC(0); : COLOR 15, 0: PRINT "F"; SPC(0);
COLOR 7, 0: PRINT ": "; SPC(0);

',1,2,3,4,5,6,7,8,9,A,B,C,D,E,F: "; SPC(0);
END SUB

SUB foreground1
COLOR 8, 0: PRINT "0"; SPC(0);
COLOR 1: PRINT "1"; SPC(0);
COLOR 2: PRINT "2"; SPC(0);
COLOR 3: PRINT "3"; SPC(0);
COLOR 4: PRINT "4"; SPC(0);
COLOR 5: PRINT "5"; SPC(0);
COLOR 6: PRINT "6"; SPC(0);
COLOR 7: PRINT "7"; SPC(0);
COLOR 8: PRINT "8"; SPC(0);
COLOR 9: PRINT "9"; SPC(0);
COLOR 10: PRINT "A"; SPC(0);
COLOR 11: PRINT "B"; SPC(0);
COLOR 12: PRINT "C"; SPC(0);
COLOR 13: PRINT "D"; SPC(0);
COLOR 14: PRINT "E"; SPC(0);
COLOR 15: PRINT "F"; SPC(0);
END SUB

SUB level
OPEN filename$ FOR BINARY AS #7
dd = 1
rp$ = STR$(rp)
rp$ = LTRIM$(rp$)
DO
lk = dd * 3481 - 3479
dg$ = SPACE$(4)
GET #7, lk, dg$
dg$ = LTRIM$(dg$)

IF dg$ = rp$ THEN GOTO yes6
dd = dd + 1
LOOP
yes6:
CLOSE #7
sf = rp
rp = dd

Null$ = CHR$(0)
OPEN dddd$ FOR BINARY AS #1
IF b <> 0 THEN GOTO skiper
b = 0
skiper:
IF f <> 0 THEN GOTO skiper1
f = 0
skiper1:
IF x <> 1 THEN GOTO skiper6
x = 1
skiper6:
IF y <> 1 THEN GOTO skiper7
y = 1
skiper7:
dkdk = y - 1
r = dkdk * 79 + x
IF r <> 1 THEN GOTO skiper8
r = 1
skiper8:
COLOR 7, 0
IF h$ <> "0" THEN GOTO skiper2
h$ = CHR$(0)
skiper2:
IF ii$ <> "1" THEN GOTO skiper3
ii$ = "1"
skiper3:
IF gg$ <> "/" THEN GOTO skiper4
gg$ = "/"
skiper4:
begin:


lk = rp * 3481 - 3475
dfdf = r * 2 - 2
'kb = rp * 5214

M = lk + dfdf
aaa$ = SPACE$(2)
GET #1, M, aaa$
D$ = LEFT$(aaa$, 1)
dg = ASC(D$)
D = FIX(dg / 16)
k = dg - (D * 16)
IF k > 7 THEN k = k - 8

LOCATE y, x
IF D = 0 AND k = 0 THEN D = 15
IF D = k THEN D = 15
COLOR D, k

IF mouserightbutton <> -1 THEN
IF mouseleftbutton <> -1 THEN
LOCATE 23, 1
COLOR 7, 0
PRINT STRING$(55, " "); SPC(0);
LOCATE 23, 1
PRINT "Press "; CHR$(34); "o"; CHR$(34); " for options. ESC quits, C-COPY, S-STAMP."
PRINT "Press B to input HEX CHR. Press T for ASCII Chart. Press A to input ASCII CHR."; SPC(0);

a$ = "  OFF R: " + LTRIM$(STR$(r)) + " X: " + LTRIM$(STR$(x)) + " Y: " + LTRIM$(STR$(y))
a$ = a$ + STRING$(25 - LEN(a$), " ")

LOCATE 23, 55: COLOR 7, 0
PRINT a$; SPC(0);

END IF
END IF
oldr = r: oldx = x: oldy = y
Mouse 3: Mouse 4
oldmousex = mousexpos: oldmousey = mouseypos
'MARK2
DO
Mouse 3: Mouse 4
IF mousexpos <> oldmousex AND mousecontrol = 0 THEN
        xpos = (x * 8) - 1
        ypos = (y * 8) - 1: Mouse 2: Mouse 4
        mousecontrol = 1
        END IF
IF mouseypos <> oldmousey AND mousecontrol = 0 THEN
        xpos = (x * 8) - 1
        ypos = (y * 8) - 1: Mouse 2: Mouse 4
        mousecontrol = 1
        END IF

IF mousecontrol = 1 THEN
        x = (mousexpos / 8) + 1
        y = (mouseypos / 8) + 1
        r = (((y - 1) * 79) + x)
IF r <> oldr THEN GOTO updater
IF x <> oldx THEN GOTO updater
IF y <> oldy THEN
updater:

a$ = "  OFF R: " + LTRIM$(STR$(r)) + " X: " + LTRIM$(STR$(x)) + " Y: " + LTRIM$(STR$(y))
a$ = a$ + STRING$(25 - LEN(a$), " ")

LOCATE 23, 55: COLOR 7, 0
PRINT a$; SPC(0);

oldr = r: oldx = x: oldy = y
END IF


LOCATE y, x, 1
xpos = mousexpos
ypos = mouseypos

IF (mousexpos / 8) + 1 > 79 THEN
        xpos = (79 * 8) - 1: Mouse 2
        END IF

IF (mouseypos / 8) + 1 > 22 THEN
        ypos = (25 * 8) - 1: Mouse 2
LOCATE 25, 1: foreground1
LOCATE 25, POS(0) + 1: background1
COLOR 7, 0
LOCATE 25, 30: PRINT "HARD"; SPC(0);
LOCATE 25, 35: PRINT "SOFT"; SPC(0);
COLOR 15, 1
IF h$ = CHR$(1) THEN LOCATE 25, 30: PRINT "HARD"; SPC(0);
IF h$ = CHR$(0) THEN LOCATE 25, 35: PRINT "SOFT"; SPC(0);
harder = ASC(h$)
COLOR f, b
LOCATE 25, 43: PRINT gg$; SPC(0);
oldf = f: oldb = b
COLOR 7, 0

        DO
        Mouse 3
a$ = INKEY$
IF a$ = CHR$(27) THEN EXIT DO

        IF mouseleftbutton = -1 AND (mousexpos / 8) + 1 < 17 THEN f = processcolor((mousexpos / 8) + 1)
        IF mouseleftbutton = -1 AND (mousexpos / 8) + 1 > 17 AND (mousexpos / 8) + 1 < 26 THEN b = processcolor((mousexpos / 8) + 1)
        IF mouseleftbutton = -1 AND (mousexpos / 8) + 1 > 29 AND (mousexpos / 8) + 1 < 34 THEN h$ = CHR$(1)
        IF mouseleftbutton = -1 AND (mousexpos / 8) + 1 > 34 AND (mousexpos / 8) + 1 < 39 THEN h$ = CHR$(0)
      

IF f <> oldf THEN
        COLOR f, b
        LOCATE 25, 43: PRINT gg$; SPC(0);
        oldf = f
END IF

IF b <> oldb THEN
        COLOR f, b: LOCATE 25, 43: PRINT gg$; SPC(0);
        oldb = b
END IF

IF ASC(h$) <> harder THEN
        COLOR 7, 0
        LOCATE 25, 30: PRINT "HARD"; SPC(0);
        LOCATE 25, 35: PRINT "SOFT"; SPC(0);
        COLOR 15, 1
        IF h$ = CHR$(1) THEN LOCATE 25, 30: PRINT "HARD"; SPC(0);
        IF h$ = CHR$(0) THEN LOCATE 25, 35: PRINT "SOFT"; SPC(0);
        harder = ASC(h$)
END IF
       
        LOCATE (mouseypos / 8) + 1, (mousexpos / 8) + 1, 1

        LOOP WHILE (mouseypos / 8) + 1 = 25
        LOCATE 25, 1: COLOR 7, 0: PRINT STRING$(55, " "); SPC(0);
        ypos = (22 * 8) - 1
        xpos = mousexpos: Mouse 2
        END IF


'LOCATE 1, 1: PRINT mouseleftbutton
IF mouseleftbutton = -1 THEN
        IF leftalready = 1 THEN
                omx = ((mousexpos / 8) + 1): omy = ((mouseypos / 8) + 1)
                DO
                        Mouse 3
                        IF mouseleftbutton <> -1 THEN GOTO cases
                        IF ((mousexpos / 8) + 1) <> omx THEN EXIT DO
                        IF ((mouseypos / 8) + 1) <> omy THEN EXIT DO
                LOOP
                x = ((mousexpos / 8) + 1)
                y = ((mouseypos / 8) + 1)
                IF y > 22 THEN y = 22: IF x > 79 THEN x = 79
                r = (((y - 1) * 79) + x)
                END IF

        leftalready = 1
        GOTO cases
        END IF

IF mouserightbutton = -1 THEN
        IF rightalready = 1 THEN
                omx = ((mousexpos / 8) + 1): omy = ((mouseypos / 8) + 1)
                DO
                        Mouse 3
                        IF mouserightbutton <> -1 THEN GOTO cc
                        IF ((mousexpos / 8) + 1) <> omx THEN EXIT DO
                        IF ((mouseypos / 8) + 1) <> omy THEN EXIT DO
                LOOP
                x = ((mousexpos / 8) + 1)
                y = ((mouseypos / 8) + 1)
                IF y > 22 THEN y = 22: IF x > 79 THEN x = 79
                r = (((y - 1) * 79) + x)
                END IF

        rightalready = 1
        GOTO cc
        END IF

END IF

leftalready = 0: rightalready = 0

COLOR 15
LOCATE y, x, 1, 0, 7
check$ = INKEY$
LOOP WHILE check$ = ""
LOCATE 24, 1
PRINT "                                                                              "; SPC(0);
SELECT CASE check$

CASE "A"
GOTO casea
CASE "a"
casea:
thecode$ = ""
LOCATE 23, 1
COLOR 7, 0
PRINT STRING$(50, " ")
LOCATE 23, 1
PRINT "INPUT ASCII CHR #:"; SPC(0);

cints:
gs$ = INPUT$(1)

IF gs$ = CHR$(8) THEN
IF LEN(thecode$) >= 0 THEN
thecode$ = LEFT$(thecode$, LEN(thecode$) - 1)
LOCATE , POS(0) - 1: PRINT " "; SPC(0); : LOCATE , POS(0) - 1
END IF
GOTO cints
END IF

IF gs$ = CHR$(13) THEN GOTO dos
IF gs$ = CHR$(27) THEN GOTO begin
IF LEN(thecode$) = 3 THEN GOTO cints
IF VAL(gs$) >= 0 THEN
PRINT gs$; SPC(0);
thecode$ = thecode$ + gs$
END IF


GOTO cints
dos:

gs = VAL(thecode$)
doagain:
IF gs > 255 THEN
gs = gs - 255
IF gs > 255 THEN GOTO doagain
END IF


gg$ = CHR$(gs)

GOTO begin


CASE "T"
GOTO caset
CASE "t"
caset:
COLOR 7, 0: CLS
PRINT "                       Basic ASCII Chart"
PRINT "000   (nul)  016  (dle)  032 sp  048 0  064 @  080 P  096 `  112 p"
PRINT "001 " + CHR$(1) + " (soh)  017  (dc1)  033 !   049 1  065 A  081 Q  097 a  113 q"
PRINT "002 " + CHR$(2) + " (stx)  018  (dc2)  034 "; CHR$(34); "   050 2  066 B  082 R  098 b  114 r"
PRINT "003  (etx)  019  (dc3)  035 #   051 3  067 C  083 S  099 c  115 s"
PRINT "004  (eot)  020  (dc4)  036 $   052 4  068 D  084 T  100 d  116 t"
PRINT "005  (enq)  021  (nak)  037 %   053 5  069 E  085 U  101 e  117 u"
PRINT "006  (ack)  022  (syn)  038 &   054 6  070 F  086 V  102 f  118 v"
PRINT "007   (bel)  023  (etb)  039 '   055 7  071 G  087 W  103 g  119 w"
PRINT "008  (bs)   024  (can)  040 (   056 8  072 H  088 X  104 h  120 x"
PRINT "009   (tab)  025  (em)   041 )   057 9  073 I  089 Y  105 i  121 y"
PRINT "010   (lf)   026   (eof)  042 *   058 :  074 J  090 Z  106 j  122 z"
PRINT "011   (vt)   027  (esc)  043 +   059 ;  075 K  091 [  107 k  123 {"
PRINT "012   (np)   028  (fs)   044 ,   060 <  076 L  092    108 l  124 |"
PRINT "013   (cr)   029   (gs)   045 -   061 =  077 M  093 ]  109 m  125 }"
PRINT "014  (so)   030   (rs)   046 .   062 >  078 N  094 ^  110 n  126 ~"
PRINT "015  (si)   031   (us)   047 /   063 ?  079 O  095 _  111 o  127 "
PRINT
PRINT "Press any key for extended chart..."
gfi$ = INPUT$(1)
COLOR 7, 0: CLS
PRINT "            Extended ASCII Chart (character codes 128 - 255)"
PRINT "128 €      144       160      176 °    192 À    208 Ð    224 à   240 ð"
PRINT "129       145 ‘      161 ¡    177 ±    193 Á    209 Ñ    225 á   241 ñ"
PRINT "130 ‚      146 ’      162 ¢    178 ²    194 Â    210 Ò    226 â   242 ò"
PRINT "131 ƒ      147 “      163 £    179 ³    195 Ã    211 Ó    227 ã   243 ó"
PRINT "132 „      148 ”      164 ¤    180 ´    196 Ä    212 Ô    228 ä   244 ô"
PRINT "133 …      149 •      165 ¥    181 µ    197 Å    213 Õ    229 å   245 õ"
PRINT "134 †      150 –      166 ¦    182 ¶    198 Æ    214 Ö    230 æ   246 ö"
PRINT "135 ‡      151 —      167 §    183 ·    199 Ç    215 ×    231 ç   247 ÷"
PRINT "136 ˆ      152 ˜      168 ¨    184 ¸    200 È    216 Ø    232 è   248 ø"
PRINT "137 ‰      153 ™      169 ©    185 ¹    201 É    217 Ù    233 é   249 ù"
PRINT "138 Š      154 š      170 ª    186 º    202 Ê    218 Ú    234 ê   250 ú"
PRINT "139 ‹      155 ›      171 «    187 »    203 Ë    219 Û    235 ë   251 û"
PRINT "140 Œ      156 œ      172 ¬    188 ¼    204 Ì    220 Ü    236 ì   252 ü"
PRINT "141       157       173 ­    189 ½    205 Í    221 Ý    237 í   253 ý"
PRINT "142 Ž      158 ž      174 ®    190 ¾    206 Î    222 Þ    238 î   254 þ"
PRINT "143       159 Ÿ      175 ¯    191 ¿    207 Ï    223 ß    239 ï   255"
PRINT ""
PRINT "Press any key..."
gfi$ = INPUT$(1)

GOTO geet
CASE "B"
GOTO caseb
CASE "b"
caseb:
LOCATE 23, 1
COLOR 7, 0
PRINT STRING$(50, " ")
LOCATE 23, 1
PRINT "INPUT HEX CHR:"; SPC(0);
newchr:
LOCATE 23, 15
PRINT " "
LOCATE 23, 15

I$ = INPUT$(1)
IF I$ = CHR$(8) THEN GOTO newchr


PRINT I$; SPC(0);
newchr1:
LOCATE 23, 16
PRINT " "
LOCATE 23, 16
gv$ = INPUT$(1)

IF gv$ = CHR$(8) THEN
I$ = ""
gv$ = ""
GOTO newchr
END IF

PRINT gv$; SPC(0);

LOCATE 23, 17
PRINT " "
LOCATE 23, 17

iv$ = INPUT$(1)

IF iv$ = CHR$(8) THEN
gv$ = ""
iv$ = ""
GOTO newchr1
END IF
I$ = UCASE$(LEFT$(I$, 1))
IF I$ = "A" THEN I$ = "10"
IF I$ = "B" THEN I$ = "11"
IF I$ = "C" THEN I$ = "12"
IF I$ = "D" THEN I$ = "13"
IF I$ = "E" THEN I$ = "14"
IF I$ = "F" THEN I$ = "15"
gv$ = UCASE$(RIGHT$(gv$, 1))
IF gv$ = "A" THEN gv$ = "10"
IF gv$ = "B" THEN gv$ = "11"
IF gv$ = "C" THEN gv$ = "12"
IF gv$ = "D" THEN gv$ = "13"
IF gv$ = "E" THEN gv$ = "14"
IF gv$ = "F" THEN gv$ = "15"
first = VAL(I$)
last = VAL(gv$)
g1 = first * 16
b1 = g1 + last
gg$ = CHR$(b1)
GOTO begin
CASE "S"
GOTO cases
CASE "s"
cases:
buffernow$ = "YES"
GOTO enter
CASE "C"
GOTO cc
CASE "c"
cc:
cc = 50
GOTO doer
cc1:
cc = 0
D$ = LEFT$(a$, 1)
dhg = ASC(D$)
f = FIX(dhg / 16)
b = dhg - (f * 16)
h$ = CHR$(0)
IF b > 7 THEN
        h$ = CHR$(1)
        b = b - 8
        END IF

gg$ = RIGHT$(a$, 1)
'h$ = LEFT$(RIGHT$(A$, 2), 1)
GOTO begin

CASE CHR$(13)
enter:

IF y > 22 THEN y = 22: IF x > 79 THEN x = 79
r = (((y - 1) * 79) + x)
IF r > 1738 THEN r = 1738



lk = rp * 3481 - 3475
dfdf = r * 2 - 2
M = lk + dfdf


a$ = SPACE$(2)
GET #1, M, a$
D$ = LEFT$(a$, 1)
dhg = ASC(D$)
k = FIX(dhg / 16)
D = dhg - (k * 16)
IF D > 7 THEN D = D - 8

IF gg$ = CHR$(0) THEN f = 15
IF gg$ = CHR$(32) THEN f = 15


IF b = f THEN f = 15
IF b = 0 AND f = 0 THEN f = 15

bg1 = b
fg1 = f
IF h$ = CHR$(1) THEN bg1 = bg1 + 8
character1 = (fg1 * 16) + bg1
b$ = CHR$(character1)

's = b * 16
'xg = F + s
'b$ = CHR$(xg)
'MARK1

PUT #1, M, b$
M = M + 1
PUT #1, M, gg$

IF buffernow$ = "YES" THEN
cc = 0
buffernow$ = "NO"
GOTO doer
END IF

LOCATE 23, 1
COLOR 7, 0
PRINT STRING$(55, " "); SPC(0);
LOCATE 23, 1
PRINT "Editing Mode...  Esc or Enter ends."

LOCATE 23, 56: COLOR 7, 0: PRINT " ON R:"; r; "X:"; x; "Y:"; y
cc = 20
GOTO doer
doe:
cc = 0

'IF mousecontrol = 0 THEN
        oldr = r: oldx = x: oldy = y
        Mouse 3: Mouse 4
        oldmousex = mousexpos: oldmousey = mouseypos
'END IF

'MARK1
DO

Mouse 3: Mouse 4
IF mousexpos <> oldmousex AND mousecontrol = 0 THEN
        xpos = (x * 8) - 1
        ypos = (y * 8) - 1: Mouse 2: Mouse 4
        mousecontrol = 1
        END IF
IF mouseypos <> oldmousey AND mousecontrol = 0 THEN
        xpos = (x * 8) - 1
        ypos = (y * 8) - 1: Mouse 2: Mouse 4
        mousecontrol = 1
        END IF

IF mousecontrol = 1 THEN
       
       
xpos = mousexpos
ypos = mouseypos
IF (mousexpos / 8) + 1 > 79 THEN
        xpos = (79 * 8) - 1: Mouse 2
        END IF
IF (mouseypos / 8) + 1 > 22 THEN
        ypos = (22 * 8) - 1: Mouse 2
        END IF
Mouse 3
        x = (mousexpos / 8) + 1
        y = (mouseypos / 8) + 1
        r = (((y - 1) * 79) + x)
IF r <> oldr THEN GOTO updater1
IF x <> oldx THEN GOTO updater1
IF y <> oldy THEN
updater1:

a$ = "   ON R: " + LTRIM$(STR$(r)) + " X: " + LTRIM$(STR$(x)) + " Y: " + LTRIM$(STR$(y))
a$ = a$ + STRING$(25 - LEN(a$), " ")

LOCATE 23, 55: COLOR 7, 0
PRINT a$; SPC(0);

oldr = r: oldx = x: oldy = y
GOTO enter
END IF


LOCATE y, x, 1
END IF


LOCATE y, x, 1, 0, 7
Ddddd$ = INKEY$
LOOP WHILE Ddddd$ = ""
SELECT CASE Ddddd$
CASE CHR$(13)
GOTO begin
CASE CHR$(27)
GOTO begin
CASE Null$ + CHR$(72)
mousecontrol = 0: Mouse 4
IF y = 1 THEN
y = 22
dkdk = y - 1
r = dkdk * 79 + x
GOTO enter
END IF
cc = 6
GOTO doer
up1:
y = y - 1
r = r - 79
GOTO enter
CASE Null$ + CHR$(80)
mousecontrol = 0: Mouse 4
IF y = 22 THEN
y = 1
dkdk = y - 1
r = dkdk * 79 + x
GOTO enter
END IF

cc = 7
GOTO doer
down1:
y = y + 1
r = r + 79
GOTO enter
CASE Null$ + CHR$(77)
mousecontrol = 0: Mouse 4
IF x = 79 THEN
x = 1
dkdk = y - 1
r = dkdk * 79 + x
GOTO enter
END IF
cc = 8
GOTO doer
right1:
x = x + 1
r = r + 1
GOTO enter
CASE Null$ + CHR$(75)
mousecontrol = 0: Mouse 4
IF x = 1 THEN
x = 79
dkdk = y - 1
r = dkdk * 79 + x
GOTO enter
END IF
cc = 9
GOTO doer
left1:
x = x - 1
r = r - 1
GOTO enter
CASE ELSE
GOTO enter
END SELECT
CASE CHR$(27)
GOTO quit
CASE Null$ + CHR$(72)
mousecontrol = 0: Mouse 4
IF y = 1 THEN
y = 22
dkdk = y - 1
r = dkdk * 79 + x
GOTO begin
END IF
y = y - 1
r = r - 79
GOTO begin
CASE Null$ + CHR$(80)
mousecontrol = 0: Mouse 4
IF y = 22 THEN
y = 1
dkdk = y - 1
r = dkdk * 79 + x
GOTO begin
END IF
'cc = 2
'GOTO doer
'down:
y = y + 1
r = r + 79
GOTO begin
CASE Null$ + CHR$(77)
mousecontrol = 0: Mouse 4
IF x = 79 THEN
x = 1
dkdk = y - 1
r = dkdk * 79 + x
GOTO begin
END IF
'cc = 3
'GOTO doer
'right:
x = x + 1
r = r + 1
GOTO begin
CASE Null$ + CHR$(75)
mousecontrol = 0: Mouse 4
IF x = 1 THEN
x = 79
dkdk = y - 1
r = dkdk * 79 + x
GOTO begin
END IF
'cc = 4
'GOTO doer
'left:
x = x - 1
r = r - 1
GOTO begin
CASE "o"
GOTO caseo
CASE "O"
GOTO caseo
CASE "R"
GOTO refedit
CASE "r"
GOTO refedit
CASE ELSE
GOTO begin
END SELECT
doer:
LOCATE y, x, 0
lk = rp * 3481 - 3475
dfdf = r * 2 - 2
M = lk + dfdf
a$ = SPACE$(2)
GET #1, M, a$

IF cc = 50 THEN GOTO cc1

D$ = LEFT$(a$, 1)
dhg = ASC(D$)
fg = FIX(dhg / 16)
bg = dhg - (fg * 16)
IF bg > 7 THEN bg = bg - 8
COLOR fg, bg
IF fg = 0 AND bg = 0 THEN COLOR 15
e$ = RIGHT$(a$, 1)
IF e$ = CHR$(32) THEN
COLOR 15
PRINT " "; SPC(0);
GOTO doner
END IF

IF e$ = CHR$(0) THEN
COLOR 15
PRINT " "; SPC(0);
GOTO doner
END IF

IF POS(0) = 80 THEN LOCATE , 79
PRINT e$; SPC(0);

doner:
IF cc = 20 THEN GOTO doe
'IF cc = 1 THEN GOTO up
'IF cc = 2 THEN GOTO down
'IF cc = 3 THEN GOTO right
'IF cc = 4 THEN GOTO left
IF cc = 5 THEN GOTO begin
IF cc = 6 THEN GOTO up1
IF cc = 7 THEN GOTO down1
IF cc = 8 THEN GOTO right1
IF cc = 9 THEN GOTO left1
GOTO begin

refedit:
SHELL "EDIT FQREFS.DAT"
GOTO begin

caseo:
LOCATE 23, 1
COLOR 7, 0
PRINT STRING$(55, " "); SPC(0);
LOCATE 23, 1
PRINT "1,"; CHR$(34); " "; CHR$(34); " 2,"; CHR$(34); CHR$(6); CHR$(34); " 3,"; CHR$(34); CHR$(5); CHR$(34); SPC(0);
PRINT "  4,PAINT  5,TEXT: "; SPC(0);
s$ = INPUT$(1)
IF VAL(s$) > 0 AND VAL(s$) < 6 THEN GOTO dooit
GOTO begin
dooit:
LOCATE 23, 1
COLOR 7, 0
PRINT STRING$(55, " "); SPC(0);
LOCATE 23, 1
PRINT "Edit current colors Y/N? "; SPC(0);
edit$ = INPUT$(1)
IF UCASE$(edit$) = "Y" THEN GOTO chl
GOTO his
chl:
LOCATE 23, 1
COLOR 7, 0
PRINT STRING$(55, " "); SPC(0);
LOCATE 23, 1
background
I$ = INPUT$(1)
id = VAL(I$)

IF id >= 0 AND id <= 7 THEN
b = id
GOTO next111
END IF
GOTO chl

next111:
LOCATE 23, 1
COLOR 7, 0
PRINT STRING$(55, " "); SPC(0);
LOCATE 23, 1
foreground
I$ = UCASE$(INPUT$(1))
f = -1

IF I$ = "0" THEN f = 0
IF I$ = "1" THEN f = 1
IF I$ = "2" THEN f = 2
IF I$ = "3" THEN f = 3
IF I$ = "4" THEN f = 4
IF I$ = "5" THEN f = 5
IF I$ = "6" THEN f = 6
IF I$ = "7" THEN f = 7
IF I$ = "8" THEN f = 8
IF I$ = "9" THEN f = 9
IF I$ = "A" THEN f = 10
IF I$ = "B" THEN f = 11
IF I$ = "C" THEN f = 12
IF I$ = "D" THEN f = 13
IF I$ = "E" THEN f = 14
IF I$ = "F" THEN f = 15
IF f <> -1 THEN GOTO next1111

GOTO next111

next1111:
LOCATE 23, 1
COLOR 7, 0
PRINT STRING$(55, " "); SPC(0);
LOCATE 23, 1
PRINT "HARD Y/N? "; SPC(0);
hard$ = UCASE$(INPUT$(1))
IF hard$ = "Y" THEN
h$ = CHR$(1)
GOTO his
END IF
IF hard$ = "N" THEN
h$ = CHR$(0)
GOTO his
END IF
GOTO next1111
his:
gg$ = CHR$(0)
IF s$ = "1" THEN GOTO letterot
IF s$ = "4" THEN GOTO paintit
IF s$ = "5" THEN GOTO text

IF s$ = "2" THEN
gg$ = CHR$(6)
END IF
IF s$ = "3" THEN
gg$ = CHR$(5)
END IF

GOTO begin

letterot:
LOCATE 23, 1
COLOR 7, 0
PRINT STRING$(55, " "); SPC(0);
LOCATE 23, 1
PRINT "LETTER TO BE HERE: "; SPC(0);
gg$ = INPUT$(1)
IF gg$ = CHR$(13) THEN gg$ = CHR$(0)
IF gg$ = " " THEN gg$ = CHR$(0)
IF gg$ = "" THEN gg$ = CHR$(0)
GOTO begin

paintit:
bk1 = rp * 3481 - 3475
kb1 = rp * 3481


newf = f

IF b = 0 AND f = 0 THEN newf = 15

IF gg$ = CHR$(0) THEN
newf = 15
END IF

IF gg$ = CHR$(32) THEN
newf = 15
END IF

'MARK2

bg1 = b
fg1 = newf

IF h$ = CHR$(1) THEN bg1 = bg1 + 8
character1 = (fg1 * 16) + bg1
df1$ = CHR$(character1)

'df = b * 16
'df1 = df + F
'df1$ = CHR$(df1)

flyer$ = df1$ + gg$
FOR l = bk1 TO kb1 STEP 2
PUT #1, l, flyer$
NEXT l
mn = 1
nm = 1
IF gg$ = CHR$(0) THEN gg$ = " "
belto:
IF mn = 23 THEN GOTO ender
LOCATE mn, nm
COLOR f, b
IF gg$ = " " THEN COLOR 15
PRINT gg$
IF nm >= 79 THEN mn = mn + 1
IF nm >= 79 THEN nm = 0
nm = nm + 1
GOTO belto
ender:

GOTO begin

text:
kj = 13
LOCATE 23, 1
COLOR 7, 0
PRINT STRING$(55, " "); SPC(0);
LOCATE 23, 1
PRINT "ENTER TEXT: "; SPC(0);
textentry1:
bk1 = rp * 3481 - 3475
r1 = r * 2 - 2
pkl = bk1 + r1
inputer$ = INPUT$(1)
IF inputer$ = CHR$(13) THEN GOTO begin
LOCATE 23, kj
COLOR f, b
PRINT inputer$
COLOR f, b
IF inputer$ = " " THEN COLOR 15
LOCATE y, x
PRINT inputer$

bg1 = b
fg1 = f

IF h$ = CHR$(1) THEN bg1 = bg1 + 8
character1 = (fg1 * 16) + bg1
df1$ = CHR$(character1)

'df = b * 16
'df1 = df + f
'df1$ = CHR$(df1)

fileeer$ = df1$ + inputer$
PUT #1, pkl, fileeer$
IF r >= 1738 THEN
r = 0
x = 0
y = 1
END IF
r = r + 1
IF x = 79 THEN y = y + 1
IF x = 79 THEN x = 0
x = x + 1
IF kj = 79 THEN
LOCATE 23, 13
PRINT "                                                                   "
kj = 0
END IF

kj = kj + 1
LOCATE y, x
GOTO textentry1
geet:
reload = 1
quit:
rp = sf
CLOSE #1
END SUB

SUB Mouse (which)
'0 = Mouse Init
'1 = Mouse Driver
'2 = Mouse Put
'3 = Mouse Status
'4 = Mouse Hide
'5 = Mouse Show
IF which = 0 THEN
  mouser$ = SPACE$(57)
  FOR I% = 1 TO 57
    READ a$
    h$ = CHR$(VAL("&H" + a$))
    MID$(mouser$, I%, 1) = h$
  NEXT I%
  ax% = 0
  bx% = 0
  cx% = 0
  dx% = 0
  Mouse 1
  MouseInit% = ax%
  Mouse 5
END IF
IF which = 1 THEN
  DEF SEG = VARSEG(mouser$)
  mouser% = SADD(mouser$)
  CALL ABSOLUTE(ax%, bx%, cx%, dx%, mouser%)
END IF
IF which = 2 THEN
  ax% = 4
  cx% = xpos
  dx% = ypos
  bx% = 0
  Mouse 1
END IF
IF which = 3 THEN
  ax% = 3
  Mouse 1
  mouseleftbutton = ((bx% AND 1) <> 0)
  mouserightbutton = ((bx% AND 2) <> 0)
  mousexpos = cx%
  mouseypos = dx%
END IF
IF which = 4 THEN
 ax% = 2
 bx% = 0
 cx% = 0
 dx% = 0
 Mouse 1
END IF
IF which = 5 THEN
  ax% = 1
  bx% = 0
  cx% = 0
  dx% = 0
  Mouse 1
END IF

END SUB

FUNCTION processcolor (mx)

IF mx = 1 THEN processcolor = 0
IF mx = 2 THEN processcolor = 1
IF mx = 3 THEN processcolor = 2
IF mx = 4 THEN processcolor = 3
IF mx = 5 THEN processcolor = 4
IF mx = 6 THEN processcolor = 5
IF mx = 7 THEN processcolor = 6
IF mx = 8 THEN processcolor = 7
IF mx = 9 THEN processcolor = 8
IF mx = 10 THEN processcolor = 9
IF mx = 11 THEN processcolor = 10
IF mx = 12 THEN processcolor = 11
IF mx = 13 THEN processcolor = 12
IF mx = 14 THEN processcolor = 13
IF mx = 15 THEN processcolor = 14
IF mx = 16 THEN processcolor = 15

IF mx = 18 THEN processcolor = 0
IF mx = 19 THEN processcolor = 1
IF mx = 20 THEN processcolor = 2
IF mx = 21 THEN processcolor = 3
IF mx = 22 THEN processcolor = 4
IF mx = 23 THEN processcolor = 5
IF mx = 24 THEN processcolor = 6
IF mx = 25 THEN processcolor = 7

END FUNCTION

