DECLARE SUB background ()
DECLARE SUB foreground ()
DECLARE SUB clump (CLUMP1$, posx!, posy!, size!, collor!)
DECLARE SUB button (pressed!, boxx!, boxy!, boxl!, boxh!)
DECLARE SUB letters (which$, px!, py!, sz!, col!)
DECLARE SUB level ()
DIM SHARED bbbb, dddd$, rp, F, b, h$, gg$, ii$, x, y, filename$, reload
DIM map(5000)
C$ = UCASE$(COMMAND$)
IF C$ = "" THEN filename$ = "fqmaps.dat"
IF C$ <> "" THEN filename$ = C$


IF C$ <> "" THEN GOTO continue3

OPEN "fqmaps.dat" FOR BINARY AS #1
IF LOF(1) < 2 THEN
INPUT "Please enter map name to edit eg. MAPS.DAT:"; filename$
CLOSE #1
KILL "fqmaps.dat"

IF filename$ = "" THEN END


IF INSTR(filename$, ".") = 0 THEN filename$ = filename$ + "."
FOR gd = 1 TO 100
IF filename$ = STRING$(gd, ".") THEN END
NEXT gd
IF INSTR(filename$, ".") - 1 > 8 THEN END

END IF
CLOSE #1

continue3:


x = 1
y = 1

x23 = 1
y23 = 1
rp = 1
Null$ = CHR$(0)
dddd$ = filename$
GOTO loader2
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
d1 = dick / 5219
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
A$ = SPACE$(5)
GET #98, im, A$
type$ = LEFT$(A$, 1)
number = VAL(RIGHT$(A$, 4))
IF type$ = "1" THEN map(number) = 1
IF type$ = "2" THEN map(number) = 2
IF type$ = "3" THEN map(number) = 3
im = im + 5219
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
NEXT xcc


bk = dd * 5219 - 5214
kb = dd * 5219

COLOR 7, 0

beginer:
LOCATE 25, 1
PRINT STRING$(80, " "); SPC(0);
LOCATE 25, 1
PRINT "Leveler. ESC-end, Enter-select, D-el, M-ove, T-ype, C-opy, S-tamp. Screen "; rp; SPC(0);
DO
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
lk = dd * 5219 - 5217
dg$ = SPACE$(4)
IF lk > LOF(1) THEN
GOTO nostamp
END IF
rp1$ = SPACE$(4)
GET #1, lk, rp1$
rp1$ = RTRIM$(LTRIM$(rp1$))
IF rp$ = rp1$ THEN
lk = lk + 4
buffer$ = SPACE$(5214)
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
IF LEN(buffer$) < 5214 THEN GOTO loader1
CLOSE #1
OPEN dddd$ FOR BINARY AS #1
dd = 1
rp$ = STR$(rp)
rp$ = LTRIM$(rp$)
DO
lk = dd * 5219 - 5217
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
lk = dd * 5219 - 5217
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
an$ = CHR$(15) + CHR$(0) + CHR$(0)
rp = VAL(rp$)
map(rp) = 1
FOR bx = 1 TO 1738
PUT #1, lb, an$
lb = lb + 3
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
bk = dd * 5219 - 5213
kb = dd * 5219
FOR l = bk TO kb STEP 3
A$ = SPACE$(3)
GET #1, l, A$

IF POS(0) = 80 THEN
LOCATE CSRLIN + 1, 1
END IF



D$ = LEFT$(A$, 1)
D = ASC(D$)
bg = FIX(D / 16)
fg = D - (bg * 16)
COLOR fg, bg
IF fg = 0 AND bg = 0 THEN COLOR 15

IF E$ = CHR$(32) THEN
COLOR 15
PRINT " "; SPC(0);
GOTO redo
END IF


IF E$ = CHR$(0) THEN
COLOR 15
PRINT " "; SPC(0);
GOTO redo
END IF

PRINT RIGHT$(A$, 1); SPC(0);


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
FOR i = 1 TO LOF(1) STEP 5219
ab$ = SPACE$(5219)
abc$ = SPACE$(4)
GET #1, i, ab$
GET #1, i + 1, abc$
abc$ = LTRIM$(RTRIM$(abc$))
IF abc$ = rp$ THEN
GOTO nope
END IF
PUT #2, C, ab$
C = C + 5219
nope:
NEXT i
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
lk = dd * 5219 - 5218
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
lk = dd * 5219 - 5217
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
PRINT "The Leveler 2000, v3.11, (C) Copyright 2001 Akori Software"
PRINT "All rights reserved..."
PRINT
CLOSE

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

SUB button (pressed, boxx, boxy, boxl, boxh)
IF pressed = 0 THEN GOTO unpressed
IF pressed = 1 THEN GOTO pressed
IF pressed = 2 THEN
cbn = 2
GOTO unpressed
END IF

IF pressed = 3 THEN
cbn = 3
GOTO pressed
END IF
GOTO quit1
unpressed:
LINE (boxx, boxy)-(boxx + boxl, boxy), 15
LINE (boxx, boxy)-(boxx, boxy + boxh), 15
LINE (boxx, boxy + boxh)-(boxx + boxl, boxy + boxh), 8
LINE (boxx + boxl, boxy)-(boxx + boxl, boxy + boxh), 8
LINE (boxx + 1, boxy + 1)-(boxx + boxl - 1, boxy + boxh - 1), 7, BF
GOTO quit7

pressed:
LINE (boxx, boxy)-(boxx + boxl, boxy), 8
LINE (boxx, boxy)-(boxx, boxy + boxh), 8
LINE (boxx, boxy + boxh)-(boxx + boxl, boxy + boxh), 15
LINE (boxx + boxl, boxy)-(boxx + boxl, boxy + boxh), 15
quit7:
IF cbn = 2 THEN
LINE (boxx - 1, boxy - 1)-(boxx + boxl + 1, boxy - 1), 15
LINE (boxx - 1, boxy - 1)-(boxx - 1, boxy + boxh + 1), 15
LINE (boxx - 1, boxy + boxh + 1)-(boxx + boxl + 1, boxy + boxh + 1), 8
LINE (boxx + boxl + 1, boxy - 1)-(boxx + boxl + 1, boxy + boxh + 1), 8

cbn = 0
END IF
IF cbn = 3 THEN
LINE (boxx - 1, boxy - 1)-(boxx + boxl + 1, boxy - 1), 8
LINE (boxx - 1, boxy - 1)-(boxx - 1, boxy + boxh + 1), 8
LINE (boxx - 1, boxy + boxh + 1)-(boxx + boxl + 1, boxy + boxh + 1), 15
LINE (boxx + boxl + 1, boxy - 1)-(boxx + boxl + 1, boxy + boxh + 1), 15
cbn = 0
END IF
quit1:
END SUB

SUB clump (CLUMP1$, posx, posy, size, collor)
FOR i = 1 TO LEN(CLUMP1$)
D$ = LEFT$(CLUMP1$, i)
letter$ = RIGHT$(D$, 1)
letters letter$, posx, posy, size, collor
IF posx >= 620 THEN
y = y + szy
x = 15
END IF
posx = posx + size / 3
posx = FIX(posx)
NEXT i
END SUB

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

SUB letters (which$, px, py, sz, col)
IF px < 1 THEN GOTO noletter
IF px > 639 THEN GOTO noletter
IF py > 479 THEN GOTO noletter
IF py < 1 THEN GOTO noletter
IF sz < 1 THEN GOTO noletter
IF col < 1 THEN GOTO noletter
IF col > 15 THEN GOTO noletter
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
TIK = sz / 2
TIK = FIX(TIK)
TIK$ = STR$(TIK)
pl = sz / 3
pl = FIX(pl)
pl$ = STR$(pl)
plk = sz / 4
plk = FIX(plk)
plk$ = STR$(plk)
IF which$ = "" THEN GOTO noletter
IF which$ = "A" THEN GOTO lettera
IF which$ = "B" THEN GOTO letterb
IF which$ = "C" THEN GOTO letterc
IF which$ = "D" THEN GOTO letterd
IF which$ = "E" THEN GOTO lettere
IF which$ = "F" THEN GOTO letterf
IF which$ = "G" THEN GOTO letterg
IF which$ = "H" THEN GOTO letterh
IF which$ = "I" THEN GOTO letteri
IF which$ = "J" THEN GOTO letterj
IF which$ = "K" THEN GOTO letterk
IF which$ = "L" THEN GOTO letterl
IF which$ = "M" THEN GOTO letterm
IF which$ = "N" THEN GOTO lettern
IF which$ = "O" THEN GOTO lettero
IF which$ = "P" THEN GOTO letterp
IF which$ = "Q" THEN GOTO letterq
IF which$ = "R" THEN GOTO letterr
IF which$ = "S" THEN GOTO letters
IF which$ = "T" THEN GOTO lettert
IF which$ = "U" THEN GOTO letteru
IF which$ = "V" THEN GOTO letterv
IF which$ = "W" THEN GOTO letterw
IF which$ = "X" THEN GOTO letterx
IF which$ = "Y" THEN GOTO lettery
IF which$ = "Z" THEN GOTO letterz
IF which$ = "a" THEN GOTO lettera1
IF which$ = "b" THEN GOTO letterb1
IF which$ = "c" THEN GOTO letterc1
IF which$ = "d" THEN GOTO letterd1
IF which$ = "e" THEN GOTO lettere1
IF which$ = "f" THEN GOTO letterf1
IF which$ = "g" THEN GOTO letterg1
IF which$ = "h" THEN GOTO letterh1
IF which$ = "i" THEN GOTO letteri1
IF which$ = "j" THEN GOTO letterj1
IF which$ = "k" THEN GOTO letterk1
IF which$ = "l" THEN GOTO letterl1
IF which$ = "m" THEN GOTO letterm1
IF which$ = "n" THEN GOTO lettern1
IF which$ = "o" THEN GOTO lettero1
IF which$ = "p" THEN GOTO letterp1
IF which$ = "q" THEN GOTO letterq1
IF which$ = "r" THEN GOTO letterr1
IF which$ = "s" THEN GOTO letters1
IF which$ = "t" THEN GOTO lettert1
IF which$ = "u" THEN GOTO letteru1
IF which$ = "v" THEN GOTO letterv1
IF which$ = "w" THEN GOTO letterw1
IF which$ = "x" THEN GOTO letterx1
IF which$ = "y" THEN GOTO lettery1
IF which$ = "z" THEN GOTO letterz1
IF which$ = "." THEN GOTO letterperiod
IF which$ = "," THEN GOTO lettercomma
IF which$ = "?" THEN GOTO letterques
IF which$ = "!" THEN GOTO letterexlam
IF which$ = "@" THEN GOTO at
IF which$ = "#" THEN GOTO number
IF which$ = "$" THEN GOTO dollar
IF which$ = "%" THEN GOTO percent
IF which$ = "^" THEN GOTO up12
IF which$ = "&" THEN GOTO amp
IF which$ = "*" THEN GOTO star
IF which$ = "(" THEN GOTO lp
IF which$ = ")" THEN GOTO rp
IF which$ = "-" THEN GOTO minus
IF which$ = "_" THEN GOTO under
IF which$ = "=" THEN GOTO equal
IF which$ = "+" THEN GOTO plus
IF which$ = "/" THEN GOTO forslash
IF which$ = ">" THEN GOTO rarrow
IF which$ = "<" THEN GOTO larrow
IF which$ = CHR$(34) THEN GOTO quote
IF which$ = CHR$(24) THEN GOTO up14
IF which$ = CHR$(25) THEN GOTO down14
IF which$ = CHR$(26) THEN GOTO right14
IF which$ = CHR$(27) THEN GOTO left14
IF which$ = "'" THEN GOTO apost
IF which$ = ";" THEN GOTO semicolon
IF which$ = ":" THEN GOTO colon
IF which$ = "]" THEN GOTO rbrac
IF which$ = "[" THEN GOTO lbrac
IF which$ = "}" THEN GOTO rbrackets
IF which$ = "{" THEN GOTO lbrackets
IF which$ = "\" THEN GOTO backslash
IF which$ = "~" THEN GOTO tilde
IF which$ = "`" THEN GOTO backapos
IF which$ = "0" THEN GOTO number0
IF which$ = "1" THEN GOTO number1
IF which$ = "2" THEN GOTO number2
IF which$ = "3" THEN GOTO number3
IF which$ = "4" THEN GOTO number4
IF which$ = "5" THEN GOTO number5
IF which$ = "6" THEN GOTO number6
IF which$ = "7" THEN GOTO number7
IF which$ = "8" THEN GOTO number8
IF which$ = "9" THEN GOTO number9
GOTO noletter


lettera1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdrrddllurr"
GOTO noletter
letterb1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddddrruull"
GOTO noletter
letterc1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdrrllddrr"
GOTO noletter
letterd1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brbrddddlluurr"
GOTO noletter
lettere1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdrrdlluddrr"
GOTO noletter
letterf1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brfhddrllrdd"
GOTO noletter
letterg1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdrrddlluuddrrdll"
GOTO noletter
letterh1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "dddduurrdd"
GOTO noletter
letteri1:

DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "br" + "S" + pl$ + "d"
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brbdbdlrddlrr"

GOTO noletter
letterj1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brdbddddlu"
GOTO noletter
letterk1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddddurfheg"
GOTO noletter
letterl1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brdddd"
GOTO noletter
letterm1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbddduurdurdd"
GOTO noletter
lettern1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdrrdduulldd"
GOTO noletter
lettero1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdddrruull"
GOTO noletter
letterp1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdrrddlluuddd"
GOTO noletter
letterq1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdddrruullddrrd"
GOTO noletter
letterr1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbddduef"
GOTO noletter
letters1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdrrlldrrdll"
GOTO noletter
lettert1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brbddlrrldd"
GOTO noletter
letteru1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdddrruu"
GOTO noletter
letterv1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbddfeu"
GOTO noletter
letterw1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdddrudruu"
GOTO noletter
letterx1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdffhgee"
GOTO noletter
lettery1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdddrruudddll"
GOTO noletter
letterz1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdrrggrr"
GOTO noletter



lettera:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brgefddduulluddd"
GOTO noletter

letterb:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddddrehehl"
GOTO noletter


letterc:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brbrlgddfr"


GOTO noletter
letterd:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddddreuuhl"
GOTO noletter

lettere:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddddrrlluurrlluurr"
GOTO noletter

letterf:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "rrllddrrlldd"
GOTO noletter

letterg:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brbrllddddrruul"
GOTO noletter


letterh:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "dddduurruudddd"
GOTO noletter


letteri:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "rrlddddlrr"
GOTO noletter


letterj:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "rrlddddh"
GOTO noletter


letterk:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "DDDDUUeeggffhh"
GOTO noletter

letterl:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddddrr"
GOTO noletter

letterm:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "dddduuuufedddd"
GOTO noletter

lettern:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "dddduuuuffdduuuu"
GOTO noletter

lettero:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brbrbdhgddfeuu"
GOTO noletter

letterp:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "dddduurehl"
GOTO noletter

letterq:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brbrbdhgddfeblfhbruu"
GOTO noletter

letterr:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "dddduuffhhrehl"
GOTO noletter

letters:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brrlgdrrdgl"
GOTO noletter

lettert:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "rrldddd"
GOTO noletter

letteru:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddddrruuuu"
GOTO noletter

letterv:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "dddfeuuu"
GOTO noletter

letterw:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddddefuuuu"
GOTO noletter

letterx:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "fddfhgeuue"
GOTO noletter

lettery:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "fegddd"
GOTO noletter

letterz:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + pl$ + "rrrdgdgdgrrr"
GOTO noletter

lettercomma:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdbdbrrdg"
GOTO noletter

letterperiod:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdbdbdbru"
GOTO noletter

letterques:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdbdbdbr"
DRAW "C" + color1$ + "S" + pl$ + "ubu"
DRAW "C" + color1$ + "S" + TIK$ + "uehg"
GOTO noletter

letterexlam:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdbdbdbr"
DRAW "C" + color1$ + "S" + pl$ + "ubu"
DRAW "C" + color1$ + "S" + TIK$ + "uuu"
GOTO noletter

number0:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddddrruuuulldddEE"
GOTO noletter

number1:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brgeddddlrr"
GOTO noletter

number2:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "rrddllddrr"
GOTO noletter

number3:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "rrddllrrddll"
GOTO noletter

number4:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddrruudddd"
GOTO noletter

number5:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "rrllddrrddll"
GOTO noletter

number6:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "rrllddddrruull"
GOTO noletter

number7:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "rrdddd"
GOTO noletter

number8:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddddrruullrruull"
GOTO noletter

number9:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddrrlluurrddddll"
GOTO noletter

at:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddddrrlluuuurrdddlurd"
GOTO noletter

number:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddddbrbruuuubdllbdbdrr"
DRAW "C" + color1$ + "s" + plk$ + "rrllllllllllrruuuuuullrrrrrrrrrr"
GOTO noletter

dollar:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brbrbdlldrrdll"
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brdbdbdd"
GOTO noletter

percent:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "dbdbdbdeuuebdbdbdd"
GOTO noletter

up12:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdef"
GOTO noletter

amp:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdefghfgdrreblblbuff"
GOTO noletter

star:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brbdddurllreggefhh"
GOTO noletter

lp:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brgddf"
GOTO noletter

rp:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brfddg"
GOTO noletter

minus:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdrr"
GOTO noletter

under:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdbdbdrr"
GOTO noletter

equal:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdrrbdll"
GOTO noletter

plus:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brbdddurll"
GOTO noletter

forslash:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdbdbdeuue"
GOTO noletter

rarrow:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ffgg"
GOTO noletter

larrow:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brbrggff"
GOTO noletter

quote:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "ddbrbruu"
GOTO noletter

apost:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brrdg"
GOTO noletter

semicolon:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brdbddg"
GOTO noletter

colon:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brdbdbdd"
GOTO noletter

rbrac:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "rrddddll"
GOTO noletter

lbrac:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "rrllddddrr"
GOTO noletter

lbrackets:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brbrgdlrdf"
GOTO noletter

rbrackets:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "fdrldg"
GOTO noletter

backslash:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "fddf"
GOTO noletter

up14:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdedddduuuuf"
GOTO noletter

down14:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brddddegh"
GOTO noletter

right14:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbdrrhfg"
GOTO noletter

left14:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "bdbrgfhrr"
GOTO noletter

tilde:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + pl$ + "bdbdefe"
GOTO noletter

backapos:
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + TIK$ + "brrldf"
GOTO noletter

noletter:

END SUB

SUB level
OPEN filename$ FOR BINARY AS #7
dd = 1
rp$ = STR$(rp)
rp$ = LTRIM$(rp$)
DO
lk = dd * 5219 - 5217
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
IF F <> 0 THEN GOTO skiper1
F = 0
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
lk = rp * 5219 - 5213
dfdf = r * 3 - 3
'kb = rp * 5214

M = lk + dfdf
aaa$ = SPACE$(3)
GET #1, M, aaa$
D$ = LEFT$(aaa$, 1)
dg = ASC(D$)
D = FIX(dg / 16)
k = dg - (D * 16)
LOCATE y, x
IF k = 0 AND D = 0 THEN k = 15
IF k = D THEN k = 15
COLOR k, D

LOCATE 23, 1
COLOR 7, 0
PRINT STRING$(55, " "); SPC(0);
LOCATE 23, 1
PRINT "Press "; CHR$(34); "o"; CHR$(34); " for options. ESC quits, C-COPY, S-STAMP."
PRINT "Press B to input HEX CHR. Press T for ASCII Chart. Press A to input ASCII CHR."; SPC(0);
LOCATE 23, 56
PRINT "OFF R:"; r; "X:"; x; "Y:"; y
DO
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
IF LEN(thecode$) > 0 THEN
thecode$ = LEFT$(thecode$, LEN(thecode$) - 1)
LOCATE , POS(0) - 1: PRINT " "; SPC(0); : LOCATE , POS(0) - 1
END IF
GOTO cints
END IF

IF gs$ = CHR$(13) THEN GOTO dos
IF gs$ = CHR$(27) THEN GOTO begin
IF LEN(thecode$) = 3 THEN GOTO cints
IF VAL(gs$) <> 0 THEN
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
PRINT "001  (soh)  017  (dc1)  033 !   049 1  065 A  081 Q  097 a  113 q"
PRINT "002  (stx)  018  (dc2)  034 "; CHR$(34); "   050 2  066 B  082 R  098 b  114 r"
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

i$ = INPUT$(1)
IF i$ = CHR$(8) THEN GOTO newchr


PRINT i$; SPC(0);
newchr1:
LOCATE 23, 16
PRINT " "
LOCATE 23, 16
gv$ = INPUT$(1)

IF gv$ = CHR$(8) THEN
i$ = ""
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
i$ = UCASE$(LEFT$(i$, 1))
IF i$ = "A" THEN i$ = "10"
IF i$ = "B" THEN i$ = "11"
IF i$ = "C" THEN i$ = "12"
IF i$ = "D" THEN i$ = "13"
IF i$ = "E" THEN i$ = "14"
IF i$ = "F" THEN i$ = "15"
gv$ = UCASE$(RIGHT$(gv$, 1))
IF gv$ = "A" THEN gv$ = "10"
IF gv$ = "B" THEN gv$ = "11"
IF gv$ = "C" THEN gv$ = "12"
IF gv$ = "D" THEN gv$ = "13"
IF gv$ = "E" THEN gv$ = "14"
IF gv$ = "F" THEN gv$ = "15"
first = VAL(i$)
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
D$ = LEFT$(A$, 1)
dhg = ASC(D$)
b = FIX(dhg / 16)
F = dhg - (b * 16)
gg$ = RIGHT$(A$, 1)
h$ = LEFT$(RIGHT$(A$, 2), 1)
GOTO begin

CASE CHR$(13)
enter:
lk = rp * 5219 - 5213
dfdf = r * 3 - 3
M = lk + dfdf


A$ = SPACE$(3)
GET #1, M, A$
D$ = LEFT$(A$, 1)
dhg = ASC(D$)
D = FIX(dhg / 16)
k = dhg - (D * 16)

IF gg$ = CHR$(0) THEN F = 15
IF gg$ = CHR$(32) THEN F = 15


IF b = F THEN F = 15
IF b = 0 AND F = 0 THEN F = 15

s = b * 16
xg = F + s
b$ = CHR$(xg)


PUT #1, M, b$
M = M + 1
PUT #1, M, h$
M = M + 1
PUT #1, M, gg$

IF buffernow$ = "YES" THEN
cc = 0
buffernow$ = "NO"
GOTO doer
END IF

LOCATE 23, 56
COLOR 7, 0


PRINT " ON R:"; r; "X:"; x; "Y:"; y
cc = 20
GOTO doer
doe:
cc = 0
DO
LOCATE y, x, 1, 0, 7
Ddddd$ = INKEY$
LOOP WHILE Ddddd$ = ""
SELECT CASE Ddddd$
CASE CHR$(13)
GOTO begin
CASE CHR$(27)
GOTO begin
CASE Null$ + CHR$(72)
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
LOCATE y, x
lk = rp * 5219 - 5213
dfdf = r * 3 - 3
M = lk + dfdf
A$ = SPACE$(3)
GET #1, M, A$

IF cc = 50 THEN GOTO cc1

D$ = LEFT$(A$, 1)
dhg = ASC(D$)
bg = FIX(dhg / 16)
fg = dhg - (bg * 16)
COLOR fg, bg
IF fg = 0 AND bg = 0 THEN COLOR 15
E$ = RIGHT$(A$, 1)
IF E$ = CHR$(32) THEN
COLOR 15
PRINT " "; SPC(0);
GOTO doner
END IF

IF E$ = CHR$(0) THEN
COLOR 15
PRINT " "; SPC(0);
GOTO doner
END IF
PRINT E$; SPC(0);

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
i$ = INPUT$(1)
id = VAL(i$)

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
i$ = UCASE$(INPUT$(1))
F = -1

IF i$ = "0" THEN F = 0
IF i$ = "1" THEN F = 1
IF i$ = "2" THEN F = 2
IF i$ = "3" THEN F = 3
IF i$ = "4" THEN F = 4
IF i$ = "5" THEN F = 5
IF i$ = "6" THEN F = 6
IF i$ = "7" THEN F = 7
IF i$ = "8" THEN F = 8
IF i$ = "9" THEN F = 9
IF i$ = "A" THEN F = 10
IF i$ = "B" THEN F = 11
IF i$ = "C" THEN F = 12
IF i$ = "D" THEN F = 13
IF i$ = "E" THEN F = 14
IF i$ = "F" THEN F = 15
IF F <> -1 THEN GOTO next1111

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
bk1 = rp * 5219 - 5213
kb1 = rp * 5219



IF b = 0 AND F = 0 THEN F = 15

IF gg$ = CHR$(0) THEN
F = 15
END IF

IF gg$ = CHR$(32) THEN
F = 15
END IF

df = b * 16
df1 = df + F
df1$ = CHR$(df1)

flyer$ = df1$ + h$ + gg$
FOR l = bk1 TO kb1 STEP 3
PUT #1, l, flyer$
NEXT l
mn = 1
nm = 1
IF gg$ = CHR$(0) THEN gg$ = " "
belto:
IF mn = 23 THEN GOTO ender
LOCATE mn, nm
COLOR F, b
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
bk1 = rp * 5219 - 5213
r1 = r * 3 - 3
pkl = bk1 + r1
inputer$ = INPUT$(1)
IF inputer$ = CHR$(13) THEN GOTO begin
LOCATE 23, kj
COLOR F, b
PRINT inputer$
COLOR F, b
IF inputer$ = " " THEN COLOR 15
LOCATE y, x
PRINT inputer$

df = b * 16
df1 = df + F
df1$ = CHR$(df1)

fileeer$ = df1$ + h$ + inputer$
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

