DECLARE FUNCTION exist! (file$)
DECLARE FUNCTION VOB$ (dtlf$)
DECLARE SUB setsettings ()
DECLARE SUB cole (pressed, toprint$, cole1$)
DECLARE SUB endscreen ()
DECLARE SUB printer (da, towrite$, doingit)
DECLARE SUB writer (towrite$)
DIM map(1920)
DIM map2(1920)
DIM opt(2000)
DIM SHARED settings$(5000)
COMMON SHARED save1name$, save2name$, save3name$, save4name$, save5name$, doposx, doposy, gamename$, revision$, version1$, version2$, COMP1$, COMP2$, h, s, w, defs, i, z, gdi, cgd, bg, rp
COMMON SHARED armour1name$, armour2name$, armour3name$, armour4name$, weapon1name$, weapon2name$, weapon3name$, weapon4name$, EXPER, k, x, y, monsters$
RANDOMIZE TIMER
cl$ = COMMAND$
IF UCASE$(cl$) = "-DEBUGMODE" THEN
cc = 2
END IF
tt = 0
dd = 0
EXPER = 0
helpmecode = 1
superhuman$ = "NO"
monsters$ = "NO"
doposx = 1


IF exist("NOSCR.DAT") = 0 THEN GOTO noscrdat
IF exist("VARIABLE.DAT") = 0 THEN GOTO novardat

OPEN "VARIABLE.DAT" FOR INPUT AS #60
INPUT #60, COMP1$
INPUT #60, COMP2$
INPUT #60, gamename$

IF UCASE$(gamename$) = "FINAL QUEST 2" THEN COMP2$ = "Akori Software"
IF UCASE$(gamename$) = "FINAL QUEST" THEN COMP2$ = "Akori Software"
IF UCASE$(gamename$) = "FINAL QUEST 2" THEN COMP1$ = "AkoriSoft"
IF UCASE$(gamename$) = "FINAL QUEST" THEN COMP1$ = "AkoriSoft"


INPUT #60, version1$
INPUT #60, version2$
INPUT #60, revision$
INPUT #60, superhuman$
INPUT #60, superminus
INPUT #60, h
INPUT #60, hitmax
INPUT #60, s
INPUT #60, x
INPUT #60, y
dkdk = y - 1
record = dkdk * 79 + x
INPUT #60, w
INPUT #60, defs
INPUT #60, i
INPUT #60, z
INPUT #60, rp
INPUT #60, thescreen
INPUT #60, weapon1name$
INPUT #60, weapon2name$
INPUT #60, weapon3name$
INPUT #60, weapon4name$
INPUT #60, armour1name$
INPUT #60, armour2name$
INPUT #60, armour3name$
INPUT #60, armour4name$
INPUT #60, weapon1power
INPUT #60, weapon2power
INPUT #60, weapon3power
INPUT #60, weapon4power
INPUT #60, armour1power
INPUT #60, armour2power
INPUT #60, armour3power
INPUT #60, armour4power
nus = 1
gh:
IF EOF(60) THEN GOTO gh1
INPUT #60, data$
settings$(nus) = data$
nus = nus + 1
GOTO gh:
gh1:
settings$(nus) = "--END--"
CLOSE #60


Null$ = CHR$(0)
CLS
COLOR , 1
LOCATE 1, 1
PRINT STRING$(80, " "); SPC(0);
LOCATE 1, 24
beginline$ = "`C`b1`$" + gamename$ + " " + version1$ + " " + revision$ + " Startup..."
printer 1, beginline$, 1

COLOR 7, 0
IF cc = 2 THEN PRINT "Debug Mode on..."
IF cc = 2 THEN SLEEP 1


PRINT "Looking for Level Map File..."; SPC(0);
IF exist("FQMAPS.DAT") = 0 THEN
PRINT "Not Found."
GOTO errorer
END IF
PRINT "Found."
IF cc = 2 THEN SLEEP 1


PRINT "Building Map Dimension, Please wait..."; SPC(0);
OPEN "fqmaps.dat" FOR BINARY AS #98
im = 1
csg:
IF im >= LOF(98) THEN GOTO nx
a$ = SPACE$(5)
GET #98, im, a$
type$ = LEFT$(a$, 1)
number = VAL(RIGHT$(a$, 4))
IF type$ = "1" THEN map(number) = 1
IF type$ = "2" THEN map(number) = 2
IF type$ = "3" THEN map(number) = 3
map2(number) = im
im = im + 5219
GOTO csg

nx:
PRINT "Done."

IF cc = 2 THEN SLEEP 1



PRINT "Looking for Level Ref File..."; SPC(0);
IF exist("FQREFS.DAT") = 0 THEN
PRINT "Not Found."
GOTO errorer1
END IF
PRINT "Found."
IF cc = 2 THEN SLEEP 1


PRINT "Looking for saved games..."; SPC(0);


FOR xv = 1 TO 5
LOCATE , 27
PRINT "Saved Game"; xv; SPC(0);
IF cc = 2 THEN SLEEP 1
xv$ = LTRIM$(RTRIM$(STR$(xv - 1)))
file$(xv) = "1"
IF exist("FQSAVE" + xv$ + ".DAT") = 0 THEN
file$(xv) = "0"
END IF
NEXT xv


save1name$ = "Empty"
save2name$ = "Empty"
save3name$ = "Empty"
save4name$ = "Empty"
save5name$ = "Empty"


FOR bx = 1 TO 5
IF file$(bx) = "1" THEN
bx$ = LTRIM$(RTRIM$(STR$(bx - 1)))
OPEN "FQSAVE" + bx$ + ".DAT" FOR BINARY AS #2
save1name$ = SPACE$(15)
GET #2, 1, save1name$
save1name$ = LTRIM$(RTRIM$(save1name$))
CLOSE #2
END IF
NEXT bx


LOCATE , 27
PRINT "Done.           "

IF cc = 2 THEN SLEEP 1
PRINT COMP2$ + " Development " + version2$ + " " + revision$ + "..."
PRINT "Loading main title screen..."


IF cc = 2 THEN PRINT
IF cc = 2 THEN PRINT "Press any key to continue..."
IF cc = 2 THEN i$ = INPUT$(1)


OPEN "FQMAPS.DAT" FOR BINARY AS #1
COLOR 7, 0
CLS
COLOR 15, 0
o = 1
load:
IF cc = 2 THEN dd = 4
COLOR 7, 0
CLS
CLOSE #36
OPEN "FQREFS.DAT" FOR INPUT AS #36
findit1:
IF EOF(36) THEN GOTO NOINTRO
LINE INPUT #36, data$
IF LEFT$(data$, 7) = "@#INTRO" THEN
k = 1
GOTO invscr3
END IF
GOTO findit1
invscr3:

INPUT #36, data$
color11 = VAL(LEFT$(data$, INSTR(data$, ";") - 1))
color12 = VAL(RIGHT$(data$, LEN(data$) - INSTR(data$, ";")))
INPUT #36, data$
color21 = VAL(LEFT$(data$, INSTR(data$, ";") - 1))
color22 = VAL(RIGHT$(data$, LEN(data$) - INSTR(data$, ";")))


FOR isdf = 1 TO 6
INPUT #36, data$
opy = VAL(LEFT$(data$, INSTR(data$, ";") - 1))
opx = VAL(RIGHT$(data$, LEN(data$) - INSTR(data$, ";")))
opname$ = LEFT$(RIGHT$(data$, LEN(data$) - INSTR(INSTR(data$, ";") + 1, data$, ";")), LEN(data$) - INSTR(INSTR(data$, ";") + 1, data$, ";"))
IF isdf = 1 THEN
op1y = opy
op1x = opx
op1name$ = opname$
END IF
IF isdf = 2 THEN
op2y = opy
op2x = opx
op2name$ = opname$
END IF
IF isdf = 3 THEN
op3y = opy
op3x = opx
op3name$ = opname$
END IF
IF isdf = 4 THEN
op4y = opy
op4x = opx
op4name$ = opname$
END IF
IF isdf = 5 THEN
op5y = opy
op5x = opx
op5name$ = opname$
END IF
IF isdf = 6 THEN
op6y = opy
op6x = opx
op6name$ = opname$
END IF
NEXT



invscr1:
LINE INPUT #36, iner$
IF iner$ = "@END" THEN GOTO waiter4
printer 0, iner$, k
k = k + 1
GOTO invscr1
waiter4:
load1:
LOCATE 1, 1, 0
N = 0
COLOR color21, color22
LOCATE op1y, op1x: PRINT op1name$
LOCATE op2y, op2x: PRINT op2name$
LOCATE op3y, op3x: PRINT op3name$
LOCATE op4y, op4x: PRINT op4name$
LOCATE op5y, op5x: PRINT op5name$
LOCATE op6y, op6x: PRINT op6name$
                             
COLOR color11, color12
LOCATE op1y, op1x: IF o = 1 THEN PRINT op1name$
LOCATE op2y, op2x: IF o = 2 THEN PRINT op2name$
LOCATE op3y, op3x: IF o = 3 THEN PRINT op3name$
LOCATE op4y, op4x: IF o = 4 THEN PRINT op4name$
LOCATE op5y, op5x: IF o = 5 THEN PRINT op5name$
LOCATE op6y, op6x: IF o = 6 THEN PRINT op6name$

IF cc = 2 THEN LOCATE 25, 1
IF cc = 2 THEN COLOR 7, 0
IF cc = 2 THEN PRINT "S - Set game settings"; SPC(0);
DO
check$ = INKEY$
LOOP WHILE check$ = ""
SELECT CASE check$
CASE "S"
IF cc = 2 THEN
pk = 2
GOTO setsettings
END IF
GOTO load1
CASE "s"
IF cc = 2 THEN
pk = 2
GOTO setsettings
END IF
GOTO load1
CASE CHR$(27)
GOTO no1
CASE CHR$(13)
COLOR 7, 0
IF o = 1 GOTO noload
IF o = 2 GOTO savegame11
IF o = 3 GOTO yesload
IF o = 4 GOTO help
IF o = 5 THEN
towait1 = FIX(TIMER)
GOTO loadmap
END IF
IF o = 6 GOTO no1
help:

COLOR 7, 0
CLS
CLOSE #36
OPEN "FQREFS.DAT" FOR INPUT AS #36
findit13:
IF EOF(36) THEN GOTO NOHELP
LINE INPUT #36, data$
IF LEFT$(data$, 6) = "@#HELP" THEN
k = 1
GOTO invscr4
END IF
GOTO findit13
invscr4:
LINE INPUT #36, iner1$
IF iner1$ = "@END" THEN GOTO waiter6
IF iner1$ = "@NEXT" THEN GOTO nexter52
printer 0, iner1$, k
k = k + 1
GOTO invscr4
waiter6:
LOCATE 1, 1, 0
i$ = INPUT$(1)
GOTO load
nexter52:
LOCATE 1, 1, 0
i$ = INPUT$(1)
GOTO invscr4
CASE Null$ + CHR$(75)
GOTO righter
CASE Null$ + CHR$(77)
GOTO lefter

CASE Null$ + CHR$(72)
righter:
IF o = 1 THEN o = 7
o = o - 1
GOTO load1

CASE Null$ + CHR$(80)
lefter:
IF o = 6 THEN o = 0
o = o + 1
GOTO load1

CASE ELSE
GOTO load1
END SELECT
savegame11:
CLS
ooo = 1
COLOR 10, 0
LOCATE 9, 30: PRINT "Save a Game..."
COLOR 4, 0
LOCATE 17, 30: PRINT "Enter a Choice."
savegame1:
COLOR 15, 0
LOCATE 11, 30: PRINT save1name$ + "..."
LOCATE 12, 30: PRINT save2name$ + "..."
LOCATE 13, 30: PRINT save3name$ + "..."
LOCATE 14, 30: PRINT save4name$ + "..."
LOCATE 15, 30: PRINT save5name$ + "..."


COLOR 12, 0
LOCATE 11, 30: IF ooo = 1 THEN PRINT save1name$ + "..."
LOCATE 12, 30: IF ooo = 2 THEN PRINT save2name$ + "..."
LOCATE 13, 30: IF ooo = 3 THEN PRINT save3name$ + "..."
LOCATE 14, 30: IF ooo = 4 THEN PRINT save4name$ + "..."
LOCATE 15, 30: IF ooo = 5 THEN PRINT save5name$ + "..."


DO
check$ = INKEY$
LOOP WHILE check$ = ""
SELECT CASE check$
CASE CHR$(27)
CLS
GOTO load
CASE CHR$(13)
IF ooo >= 1 AND ooo <= 5 THEN GOTO overwrite1
GOTO load
overwrite1:
IF file$(ooo) = "1" THEN GOTO zz

GOTO saveover1
zz:
LOCATE 1, 1
COLOR 2, 0
PRINT "Overwrite Existing Saved Game? Y/N"
i$ = INPUT$(1)
i$ = UCASE$(i$)
IF i$ = "Y" THEN pkd = 6
IF i$ = "Y" THEN GOTO saveover1
GOTO savegame11

CASE Null$ + CHR$(72)
IF ooo = 1 THEN ooo = 6
ooo = ooo - 1
GOTO savegame1


CASE Null$ + CHR$(80)
IF ooo = 5 THEN ooo = 0
ooo = ooo + 1
GOTO savegame1

CASE ELSE
GOTO savegame1
END SELECT
saveover1:
IF file$(ooo) <> "1" THEN GOTO saveover1notexist
GOTO saveover1go
saveover1notexist:
saveover1go:
CLS
COLOR 10, 0
LOCATE 9, 30: PRINT "Save a Game..."
COLOR 4, 0
LOCATE 17, 30: PRINT "Enter a Choice."
COLOR 15, 0

LOCATE 11, 30: IF ooo <> 1 THEN PRINT save1name$ + "..."
LOCATE 12, 30: IF ooo <> 2 THEN PRINT save2name$ + "..."
LOCATE 13, 30: IF ooo <> 3 THEN PRINT save3name$ + "..."
LOCATE 14, 30: IF ooo <> 4 THEN PRINT save4name$ + "..."
LOCATE 15, 30: IF ooo <> 5 THEN PRINT save5name$ + "..."

LOCATE ooo + 10, 30

savename$ = ""
wordenter:

DO
COLOR 15, 0
LOCATE , , 1, 6, 7
id$ = INKEY$
LOOP WHILE id$ = ""


IF id$ = CHR$(8) THEN
IF POS(0) = 30 THEN GOTO wordenter
LOCATE , POS(0) - 1, 1, 6, 7
PRINT " "; SPC(0);
LOCATE , POS(0) - 1, 1, 6, 7
asdf = LEN(savename$)
savename$ = LEFT$(savename$, asdf - 1)
GOTO wordenter
END IF


IF id$ = CHR$(13) THEN GOTO pressenter

IF LEN(savename$) >= 15 THEN GOTO wordenter

savename$ = savename$ + id$
LOCATE , , 1, 6, 7
PRINT id$; SPC(0);
GOTO wordenter

pressenter:
IF savename$ = "" THEN savename$ = "NoName"
IF savename$ = "Empty" THEN savename$ = "NoName"
IF ooo = 1 THEN save1name$ = savename$
IF ooo = 2 THEN save2name$ = savename$
IF ooo = 3 THEN save3name$ = savename$
IF ooo = 4 THEN save4name$ = savename$
IF ooo = 5 THEN save5name$ = savename$
IF ooo = 1 THEN SHELL "IF EXIST FQSAVE0.DAT DEL FQSAVE0.DAT"
IF ooo = 2 THEN SHELL "IF EXIST FQSAVE1.DAT DEL FQSAVE1.DAT"
IF ooo = 3 THEN SHELL "IF EXIST FQSAVE2.DAT DEL FQSAVE2.DAT"
IF ooo = 4 THEN SHELL "IF EXIST FQSAVE3.DAT DEL FQSAVE3.DAT"
IF ooo = 5 THEN SHELL "IF EXIST FQSAVE4.DAT DEL FQSAVE4.DAT"
ooo$ = LTRIM$(RTRIM$(STR$(ooo - 1)))
OPEN "FQSAVE" + ooo$ + ".DAT" FOR BINARY AS #2
IF monsters$ = "YES" THEN monsters5$ = "1"
IF monsters$ = "NO" THEN monsters5$ = "0"

'easy
EXPER$ = MKD$(EXPER)
i$ = MKD$(i)
s$ = MKD$(s)
h$ = MKD$(h)
x$ = MKD$(x)
y$ = MKD$(y)
w$ = MKD$(w)
z$ = MKD$(z)
record$ = MKD$(record)
rp$ = MKD$(rp)
defs$ = MKD$(defs)


toput$ = savename$ + STRING$(15 - LEN(savename$), " ")
PUT #2, 1, toput$
PUT #2, 16, EXPER$
PUT #2, 24, i$
PUT #2, 32, s$
PUT #2, 40, h$
PUT #2, 48, x$
PUT #2, 56, y$
PUT #2, 64, w$
PUT #2, 72, z$
PUT #2, 80, record$
PUT #2, 88, rp$
PUT #2, 96, defs$
PUT #2, 104, monsters5$


records = 0
nus = 1
nexter4:
IF settings$(nus) = "--END--" THEN GOTO nexter5
nus = nus + 1
records = records + 1
GOTO nexter4

nexter5:


nus = 1
records$ = CHR$(records)


PUT #2, 105, records$

filespace = 106

nnx = 0
continue:
IF nnx = records THEN GOTO done
data$ = settings$(nus): nus = nus + 1
data1$ = settings$(nus): nus = nus + 1
data$ = RTRIM$(LTRIM$(data$))
data1 = VAL(data1$)
dat$ = MKD$(data1)
xb = LEN(data$)
xb$ = LTRIM$(CHR$(xb))
PUT #2, filespace, xb$
filespace = filespace + 1
PUT #2, filespace, data$
filespace = filespace + xb
PUT #2, filespace, dat$
filespace = filespace + 8
nnx = nnx + 1
GOTO continue

done:



CLOSE #2

file$(ooo) = "1"
GOTO load

yesload:
loadgame11:
CLS
op = 1
COLOR 10, 0
LOCATE 9, 30: PRINT "Load a Game..."
COLOR 4, 0
LOCATE 17, 30: PRINT "Enter a Choice."
loadgame1:
COLOR 15, 0
LOCATE 11, 30: PRINT save1name$ + "..."
LOCATE 12, 30: PRINT save2name$ + "..."
LOCATE 13, 30: PRINT save3name$ + "..."
LOCATE 14, 30: PRINT save4name$ + "..."
LOCATE 15, 30: PRINT save5name$ + "..."


COLOR 12, 0
LOCATE 11, 30: IF op = 1 THEN PRINT save1name$ + "..."
LOCATE 12, 30: IF op = 2 THEN PRINT save2name$ + "..."
LOCATE 13, 30: IF op = 3 THEN PRINT save3name$ + "..."
LOCATE 14, 30: IF op = 4 THEN PRINT save4name$ + "..."
LOCATE 15, 30: IF op = 5 THEN PRINT save5name$ + "..."


DO
docheck$ = INKEY$
LOOP WHILE docheck$ = ""
SELECT CASE docheck$
CASE CHR$(27)
GOTO load
CASE CHR$(13)
IF op >= 1 AND op <= 5 THEN GOTO gameload1
GOTO load
CASE Null$ + CHR$(72)
IF op = 1 THEN op = 6
op = op - 1
GOTO loadgame1

CASE Null$ + CHR$(80)

IF op = 5 THEN op = 0
op = op + 1
GOTO loadgame1


CASE ELSE
GOTO loadgame1
END SELECT
gameload1:

IF file$(op) <> "1" THEN GOTO loadgame1
op$ = LTRIM$(RTRIM$(STR$(op - 1)))
OPEN "FQSAVE" + op$ + ".DAT" FOR BINARY AS #2

savename$ = SPACE$(15)
monsters5$ = SPACE$(1)
EXPER$ = SPACE$(8)
i$ = SPACE$(8)
s$ = SPACE$(8)
h$ = SPACE$(8)
x$ = SPACE$(8)
y$ = SPACE$(8)
w$ = SPACE$(8)
z$ = SPACE$(8)
record$ = SPACE$(8)
rp$ = SPACE$(8)
defs$ = SPACE$(8)

GET #2, 1, savename$
GET #2, 16, EXPER$
GET #2, 24, i$
GET #2, 32, s$
GET #2, 40, h$
GET #2, 48, x$
GET #2, 56, y$
GET #2, 64, w$
GET #2, 72, z$
GET #2, 80, record$
GET #2, 88, rp$
GET #2, 96, defs$
GET #2, 104, monsters5$



filespace = 106
numrecords$ = SPACE$(1)
GET #2, 105, numrecords$
numrecords = ASC(numrecords$)



xb = 0
nus = 1
conte5:
IF xb = numrecords THEN GOTO done1
chra$ = SPACE$(1)
GET #2, filespace, chra$
abx = ASC(chra$)
filespace = filespace + 1
cbx$ = SPACE$(abx)
GET #2, filespace, cbx$
settings$(nus) = cbx$: nus = nus + 1
filespace = filespace + abx
data$ = SPACE$(8)
GET #2, filespace, data$
filespace = filespace + 8
xbx = CVD(data$)
xbx$ = LTRIM$(STR$(xbx))
settings$(nus) = xbx$: nus = nus + 1
xb = xb + 1
GOTO conte5:

done1:
settings$(nus) = "--END--": nus = nus + 1
EXPER = CVD(EXPER$)
i = CVD(i$)
s = CVD(s$)
h = CVD(h$)
x = CVD(x$)
y = CVD(y$)
w = CVD(w$)
z = CVD(z$)
record = CVD(record$)
rp = CVD(rp$)
defs = CVD(defs$)
IF monsters5$ = "1" THEN monsters$ = "YES"
IF monsters5$ = "0" THEN monsters$ = "NO"

CLOSE #2
towait1 = FIX(TIMER)
GOTO loadmap
noload:
COLOR 7, 0
CLS
nus = 1
OPEN "VARIABLE.DAT" FOR INPUT AS #60
INPUT #60, COMP1$
INPUT #60, COMP2$
INPUT #60, gamename$

IF UCASE$(gamename$) = "FINAL QUEST 2" THEN COMP2$ = "Akori Software"
IF UCASE$(gamename$) = "FINAL QUEST" THEN COMP2$ = "Akori Software"
IF UCASE$(gamename$) = "FINAL QUEST 2" THEN COMP1$ = "AkoriSoft"
IF UCASE$(gamename$) = "FINAL QUEST" THEN COMP1$ = "AkoriSoft"

INPUT #60, version1$
INPUT #60, version2$
INPUT #60, revision$
INPUT #60, superhuman$
INPUT #60, superminus
INPUT #60, h
INPUT #60, hitmax
INPUT #60, s
INPUT #60, x
INPUT #60, y
dkdk = y - 1
record = dkdk * 79 + x
INPUT #60, w
INPUT #60, defs
INPUT #60, i
INPUT #60, z
INPUT #60, rp
INPUT #60, thescreen
INPUT #60, weapon1name$
INPUT #60, weapon2name$
INPUT #60, weapon3name$
INPUT #60, weapon4name$
INPUT #60, armour1name$
INPUT #60, armour2name$
INPUT #60, armour3name$
INPUT #60, armour4name$
INPUT #60, weapon1power
INPUT #60, weapon2power
INPUT #60, weapon3power
INPUT #60, weapon4power
INPUT #60, armour1power
INPUT #60, armour2power
INPUT #60, armour3power
INPUT #60, armour4power

EXPER = 0
gh3:
IF EOF(60) THEN GOTO gh2
INPUT #60, data$
settings$(nus) = data$: nus = nus + 1
GOTO gh3:
gh2:
settings$(nus) = "--END--": nus = nus + 1
CLOSE #60
tt = 0
towait1 = FIX(TIMER)
dd1 = 0
d = 2
qy = 1
qx = 1
mm = 1
COLOR 14, 2
loadmap:
printline$ = "YES"
gbbn = 0
qy = 1
qx = 1
COLOR 7, 0


IF rp < 1 THEN rp = 1
IF rp > 1920 THEN rp = 1920

dd = map2(rp)

IF dd = 0 THEN
        dd = 1
        rp = 1
        END IF

yes:
LOCATE 1, 1
        bk = dd + 5
        kb = dd + 5219
FOR l = bk TO kb STEP 3
a$ = SPACE$(3)
GET #1, l, a$
IF POS(0) = 80 THEN
LOCATE CSRLIN + 1, 1
END IF
d$ = LEFT$(a$, 1)
d = ASC(d$)
bg = FIX(d / 16)
fg = d - (bg * 16)
COLOR fg, bg
IF fg = 0 AND bg = 0 THEN COLOR 15

IF RIGHT$(a$, 1) = CHR$(32) THEN
COLOR 15
PRINT " "; SPC(0);
GOTO redo
END IF


IF RIGHT$(a$, 1) = CHR$(0) THEN
COLOR 15
PRINT " "; SPC(0);
GOTO redo
END IF

PRINT RIGHT$(a$, 1); SPC(0);

redo:
NEXT l
towait1 = FIX(TIMER)


ghs = 5

dl1:

IF printline$ = "NO" THEN GOTO doneloading

LOCATE 23, 2: COLOR 15, 1
PRINT STRING$(77, 32); SPC(0);
COLOR 1, 0
LOCATE 23, 1
PRINT CHR$(176) + CHR$(177); SPC(0);
LOCATE 23, 78
PRINT CHR$(177) + CHR$(176); SPC(0);
COLOR 15, 1
LOCATE 23, 2
bottomline$ = gamename$ + " -- By " + COMP1$ + " -- HP (" + LTRIM$(STR$(h)) + "/" + LTRIM$(STR$(hitmax)) + ") -- Gold:" + STR$(s) + "!"
stg = LEN(bottomline$)
stxy = stg \ 2
stxy = FIX(stxy)
startx = 40 - stxy
LOCATE , startx

PRINT bottomline$; SPC(0);

doneloading:

begin:
CLOSE #36, #53
OPEN "FQREFS.DAT" FOR INPUT AS #36
DO
IF EOF(36) THEN EXIT DO
gotothenext:
INPUT #36, iner$
IF alwaysdo = 5 AND iner$ = "@END" THEN GOTO dones3
IF iner$ = "@#ALWAYSDO" THEN
IF alwaysdo = 0 THEN INPUT #36, iner$
IF iner$ = "@END" THEN GOTO dones3
alwaysdo = 5
GOTO togo2
END IF
LOOP
dones3:
alwaysdo = 0
CLOSE #36






IF ghs = 5 THEN
ghs = 0
CLOSE #36, #53
OPEN "FQREFS.DAT" FOR INPUT AS #36
rp$ = STR$(rp)
DO
IF EOF(36) THEN EXIT DO
INPUT #36, aggggf$
IF aggggf$ = "@#SCR" + rp$ THEN
what = 5
waypoint = 0
GOTO doiter
END IF
LOOP
CLOSE #36
END IF
bg1:

what = 0
IF helpmecode = 7 THEN
s = 0
h = h + 25
helpmecode = 1
GOTO cc66
END IF


IF tt = 1 THEN
tt = 0
ccp = 2
GOTO setsettings
END IF
COLOR 7, 0
IF cc = 2 THEN LOCATE 1, 1
IF cc = 2 THEN PRINT "Y:"; y; "X:"; x; "SCR:"; rp; "Rec:"; record;
IF cc = 2 THEN LOCATE 1, 75
IF cc = 2 THEN PRINT "S=SET"
IF dd1 = 1 THEN LOCATE 1, 1
IF dd1 = 1 THEN PRINT "Y:"; y; "X:"; x; "SCR:"; rp; "Rec:"; record;
color$ = SPACE$(1)



dd = map2(rp)
dk = dd + 5
mk = record * 3 - 3
m = mk + dk

GET #1, m, color$
d$ = LEFT$(color$, 1)
dg = ASC(d$)
color1 = FIX(dg / 16)

nomap1:
COLOR 14, color1
LOCATE y, x
PRINT CHR$(1)

'don't do these screens with monsters
OPEN "NOSCR.DAT" FOR INPUT AS #62
INPUT #62, firstanswer$
IF monsters$ = "YES" THEN GOTO ghb
IF LTRIM$(UCASE$(firstanswer$)) = "NO" THEN
monsters$ = "NO"
CLOSE #62
GOTO doer1
END IF
ghb:
INPUT #62, newrp
IF newrp = 1921 THEN GOTO mon5
IF newrp = rp THEN
CLOSE #62
GOTO doer1
END IF
GOTO ghb

mon5:
IF monsters$ = "NO" THEN
CLOSE #62
GOTO doer1
END IF
theg = 50
INPUT #62, nummonsters
INPUT #62, numifscores
INPUT #62, chance
RANDOMIZE TIMER
r = INT(RND * chance) + 1
IF r = 5 THEN GOTO enemy
CLOSE #62
GOTO doer1
enemy:
FOR gdc = 1 TO numifscores
RANDOMIZE TIMER
INPUT #62, ifscore
INPUT #62, monrand

IF EXPER < ifscore THEN
ra = INT(RND * monrand) + 1
GOTO m1
END IF

NEXT gdc
ra = INT(RND * nummonsters) + 1
GOTO jun
m1:
FOR gs = gdc + 1 TO numifscores
INPUT #62, junk$
INPUT #62, junk$
NEXT gs

jun:
LOCATE 23, 1
COLOR 15, 1
FOR ghs = 1 TO ra
INPUT #62, data$
NEXT ghs



FOR ghs = 1 TO nummonsters - ra
INPUT #62, junk$
NEXT ghs


b = VAL(LEFT$(data$, INSTR(data$, ";") - 1))
mn = VAL(RIGHT$(data$, LEN(data$) - INSTR(data$, ";")))
togetscore = VAL(RIGHT$(data$, LEN(data$) - INSTR(INSTR(data$, ";") + 1, data$, ";")))
expertoget = VAL(RIGHT$(data$, LEN(data$) - INSTR(INSTR(INSTR(data$, ";") + 1, data$, ";") + 1, data$, ";")))
m$ = RIGHT$(data$, LEN(data$) - INSTR(INSTR(INSTR(INSTR(data$, ";") + 1, data$, ";") + 1, data$, ";") + 1, data$, ";"))


FOR ghs = 1 TO ra
INPUT #62, tosay$
NEXT ghs



CLOSE #62
monster:
monstermax = b



LOCATE 24, 1
COLOR 14, 0
PRINT "                                                                               "; SPC(0);
printer 0, tosay$, 24

COLOR 14, 0

G = INT(RND * 2) + 1
IF G = 1 THEN GOTO m1hitf

m1fight:
COLOR 14, 1
o = 1
hitpointer:
LOCATE 23, 1
COLOR 14, 1
PRINT "                                                                               "; SPC(0);
LOCATE 23, 1
PRINT "Your Hitpoints - ("; LTRIM$(STR$(h)); "/"; LTRIM$(STR$(hitmax)); ") "; m$; "'s hitpoints - ("; LTRIM$(STR$(b)); "/"; LTRIM$(STR$(monstermax)); ")"; SPC(0);
IF o = 1 THEN
LOCATE 25, 1
COLOR 15, 1
PRINT "Attack"; SPC(0);
COLOR 15, 0
PRINT "  Run for it "; SPC(0);
END IF
IF o = 2 THEN
LOCATE 25, 1
COLOR 15, 0
PRINT "Attack  "; SPC(0);
COLOR 15, 1
PRINT "Run for it"; SPC(0);
COLOR 15, 0
PRINT " "; SPC(0);
END IF
DO
ccc$ = INKEY$
LOOP WHILE ccc$ = ""
SELECT CASE ccc$
CASE Null$ + CHR$(77)
IF o = 2 THEN
o = 1
GOTO hitpointer
END IF
o = 2
GOTO hitpointer
CASE Null$ + CHR$(75)
IF o = 1 THEN
o = 2
GOTO hitpointer
END IF
o = 1
GOTO hitpointer
CASE CHR$(13)
LOCATE 25, 1
COLOR 7, 0
PRINT "                                                                               "; SPC(0);
LOCATE 24, 1
PRINT "                                                                               "; SPC(0);
IF o = 1 THEN GOTO attackm1
IF o = 2 THEN GOTO m1ifhit
GOTO hitpointer
CASE ELSE
GOTO hitpointer
END SELECT
m1ifhit:
c = INT(RND * 10)
IF c = 5 THEN GOTO m1hitsyou
IF c = 10 THEN GOTO m1hitsyou
LOCATE 25, 1
COLOR 7, 0
PRINT "                                                                               "; SPC(0);
LOCATE 24, 1
PRINT "                                                                               "; SPC(0);
IF deg = 5 THEN
toset$ = "LASTMONSTER"
tosetto$ = "0"
cb562 = 0


nus = 1
eofer13:
IF settings$(nus) = "--END--" THEN GOTO endnext13
junk$ = settings$(nus): nus = nus + 1
IF junk$ = toset$ THEN
settings$(nus) = tosetto$: nus = nus + 1

cb562 = 5
END IF
GOTO eofer13
endnext13:
IF cb562 = 5 THEN GOTO nex61
settings$(nus) = toset$: nus = nus + 1
settings$(nus) = tosetto$: nus = nus + 1
settings$(nus) = "--END--"
nex61:
CLOSE #5, #68, #66, #67, #69, #222, #234
GOTO monster1
END IF



GOTO dl1
m1hitsyou:
LOCATE 24, 1
COLOR 15, 0
PRINT "                                                                               "; SPC(0);
LOCATE 24, 1
PRINT "As you attempt to leave, "; m$; " sees you and attacks!"; SPC(0);
GOTO m1hitf
attackm1:
IF i = 1 THEN a = INT(RND * 10) + 1
IF i = 2 THEN a = INT(RND * 20) + 1
IF i = 3 THEN a = INT(RND * 35) + 1
IF i = 4 THEN a = INT(RND * 50) + 1
a = a + w
IF i = 1 THEN a = a + weapon1power
IF i = 2 THEN a = a + weapon2power
IF i = 3 THEN a = a + weapon3power
IF i = 4 THEN a = a + weapon4power
b = b - a

IF superhuman$ = "YES" THEN
b = b - (a * superminus)
END IF

LOCATE 24, 1
COLOR 7, 0
PRINT "                                                                               "; SPC(0);
LOCATE 24, 1
IF superhuman$ = "YES" THEN
IF b > 0 THEN PRINT "You hit "; m$; " for"; a * superminus; "points damage."; SPC(0);
IF b < 1 THEN PRINT "You hit "; m$; " for"; a * superminus; "points damage.  Press any key..."; SPC(0);
GOTO consL
END IF
IF b > 0 THEN PRINT "You hit "; m$; " for"; a; "points damage."; SPC(0);
IF b < 1 THEN PRINT "You hit "; m$; " for"; a; "points damage.  Press any key..."; SPC(0);
consL:
LOCATE 23, 1
COLOR 14, 1
PRINT "                                                                               "; SPC(0);
LOCATE 23, 1
PRINT "Your Hitpoints - ("; LTRIM$(STR$(h)); "/"; LTRIM$(STR$(hitmax)); ") "; m$; "'s hitpoints - ("; LTRIM$(STR$(b)); "/"; LTRIM$(STR$(monstermax)); ")"; SPC(0);
IF b < 1 THEN
LOCATE 23, 1
COLOR 14, 1
PRINT "                                                                               "; SPC(0);
LOCATE 23, 1
PRINT "Your Hitpoints - ("; LTRIM$(STR$(h)); "/"; LTRIM$(STR$(hitmax)); ") "; m$; "'s hitpoints - "; SPC(0);
COLOR 4, 1
PRINT "Dead"; SPC(0);
END IF
IF b < 1 THEN s = s + togetscore
IF b < 1 THEN EXPER = EXPER + expertoget
IF b < 1 THEN i$ = INPUT$(1)
IF b < 1 THEN
LOCATE 24, 1
COLOR 7, 0
PRINT "                                                                               "; SPC(0);
LOCATE 25, 1
COLOR 7, 0
PRINT "                                                                               "; SPC(0);
togetscore3$ = LTRIM$(STR$(togetscore))
expertoget$ = LTRIM$(STR$(expertoget))
togetscore4$ = "`2You killed `@" + m$ + "`2!  You find `$$" + togetscore3$ + " `2Gold and get `%" + expertoget$ + "`2 Experience.."
printer 0, togetscore4$, 24
i$ = INPUT$(1)
END IF
IF b < 1 THEN
LOCATE 25, 1
COLOR 7, 0
PRINT "                                                                               "; SPC(0);
LOCATE 24, 1
PRINT "                                                                               "; SPC(0);
END IF
IF b < 1 AND deg = 5 THEN
toset$ = "LASTMONSTER"
tosetto$ = "1"
cb562 = 0


nus = 1
eofer131:
IF settings$(nus) = "--END--" THEN GOTO endnext131
junk$ = settings$(nus): nus = nus + 1
IF junk$ = toset$ THEN
settings$(nus) = tosetto$: nus = nus + 1
cb562 = 5
END IF
GOTO eofer131
endnext131:
IF cb562 = 5 THEN GOTO nex611
settings$(nus) = toset$: nus = nus + 1
settings$(nus) = tosetto$: nus = nus + 1
settings$(nus) = "--END--"
nex611:
CLOSE #5, #68, #66, #67, #69, #222, #234
GOTO monster1
END IF
     

IF b < 1 GOTO dl1
GOTO m1hitf
m1hitf:
COLOR 14, 0
a = INT(RND * 5) + 1
IF z = 1 THEN t = mn - armour1power
IF z = 2 THEN t = mn - armour2power
IF z = 3 THEN t = mn - armour3power
IF z = 4 THEN t = mn - armour4power
t = t - defs
IF t < 0 THEN t = 0
IF t = 0 THEN a = 0
ccvb:
t = t + a
IF t < 0 THEN t = 0
h = h - t
IF superhuman$ = "YES" THEN
h = h + t
t = FIX(t / 3)
h = h - t
END IF
bbcc:
LOCATE 25, 1
COLOR 7, 0
PRINT "                                                                               "; SPC(0);
LOCATE 25, 1
PRINT ; m$; " hits you for"; t; "points damage. Hit Enter..."; SPC(0);
LOCATE 23, 1, 0
COLOR 14, 1
PRINT "                                                                               "; SPC(0);
LOCATE 23, 1, 0
PRINT "Your Hitpoints - ("; LTRIM$(STR$(h)); "/"; LTRIM$(STR$(hitmax)); ") "; m$; "'s hitpoints - ("; LTRIM$(STR$(b)); "/"; LTRIM$(STR$(monstermax)); ")"; SPC(0);
wedlsdjkf$ = INPUT$(1)
IF wedlsdjkf$ <> CHR$(13) THEN GOTO bbcc
LOCATE 25, 1, 1
COLOR 7, 0
PRINT "                                                                               "; SPC(0);
LOCATE 24, 1
PRINT "                                                                               "; SPC(0);
LOCATE 24, 1
IF h <= 0 THEN GOTO fordead
GOTO m1fight
fordead:
LOCATE 23, 1
COLOR 14, 1
PRINT "                                                                               "; SPC(0);
LOCATE 23, 1
PRINT "You are deafeated... You Gold and Experience have been lowered unfortunatly.."; SPC(0);
exper1 = FIX(EXPER / 10)
EXPER = EXPER - exper1
IF EXPER < 0 THEN EXPER = 0
s = 0
h = 10
i$ = INPUT$(1)
LOCATE 25, 1
COLOR 7, 0
PRINT "                                                                               "; SPC(0);
LOCATE 24, 1
PRINT "                                                                               "; SPC(0);
IF deg = 5 THEN
toset$ = "LASTMONSTER"
tosetto$ = "0"
cb562 = 0


nus = 1
eofer1311:
IF settings$(nus) = "--END--" THEN GOTO endnext1311
junk$ = settings$(nus): nus = nus + 1
IF junk$ = toset$ THEN
settings$(nus) = tosetto$: nus = nus + 1
cb562 = 5
END IF
GOTO eofer1311
endnext1311:
IF cb562 = 5 THEN GOTO nex6111
settings$(nus) = toset$: nus = nus + 1
settings$(nus) = tosetto$: nus = nus + 1
settings$(nus) = "--END--"
nex6111:
CLOSE #5, #68, #66, #67, #69, #222, #234
GOTO monster1
END IF



IF theg = 50 THEN
theg = 0
GOTO loadmap
END IF
GOTO dl1
ssave:
RANDOMIZE TIMER
COLOR 7, 0
LOCATE , , 0
CLS
a$ = "Screen Protection System, Press any key to continue..."
COLOR 14
begin5:
ydf = INT(RND * 25) + 1
xdf = 79

FOR ixv = 1 TO 79
        idler = 0
        DO
        idler = idler + 1
        LOOP WHILE idler <= 15000
        IF INKEY$ <> "" THEN GOTO NOT2
                b$ = LEFT$(a$, ixv)
                LOCATE ydf, xdf
                PRINT b$ + " "; SPC(0);
                xdf = xdf - 1
NEXT ixv
        vdf = LEN(a$) - 1
FOR ixv = 1 TO LEN(a$)
                idler = 0
                DO
                idler = idler + 1
                LOOP WHILE idler <= 15000
                IF INKEY$ <> "" THEN GOTO NOT2
        b$ = RIGHT$(a$, vdf)
        vdf = vdf - 1
        LOCATE ydf, 1
        PRINT b$ + " "; SPC(0);
NEXT ixv
GOTO begin5
NOT2:
GOTO loadmap
doer1:

                  IF printcheater = 1 THEN
                  printcheater = 0
                  writer "`CCheater!!! You got 25 more hitpoints for a total of `h."
                  ggb = 5
                  towait1 = FIX(TIMER) + 4
                  END IF


ssave = FIX(TIMER) + 180
DO
IF FIX(TIMER) >= ssave THEN
GOTO ssave
END IF
check$ = INKEY$

IF FIX(TIMER) >= 86396 AND ggb = 5 THEN
ggb = 3
GOTO cc66
END IF

IF FIX(TIMER) >= towait1 AND ggb = 5 THEN
ggb = 3
GOTO cc66
END IF

IF FIX(TIMER) < towait1 THEN LOCATE 23, doposx, 1, 6, 7
IF FIX(TIMER) >= towait1 THEN LOCATE y, x, 1, 6, 7

LOOP WHILE check$ = ""
check$ = UCASE$(check$)

IF FIX(TIMER) <= towait1 THEN GOTO cc56
cc66:
IF gbbn = 5 THEN
LOCATE 23, 1
COLOR 7, 0
PRINT STRING$(80, " "); SPC(0);
END IF

IF printline$ = "NO" THEN GOTO noline

LOCATE 23, 2: COLOR 15, 1
PRINT STRING$(77, 32); SPC(0);
LOCATE 23, 1
COLOR 1, 0
PRINT CHR$(176) + CHR$(177); SPC(0);
LOCATE 23, 78
PRINT CHR$(177) + CHR$(176); SPC(0);
COLOR 15, 1
LOCATE 23, 2
bottomline$ = gamename$ + " -- By " + COMP1$ + " -- HP (" + LTRIM$(STR$(h)) + "/" + LTRIM$(STR$(hitmax)) + ") -- Gold:" + STR$(s) + "!"
stg = LEN(bottomline$)
stxy = stg \ 2
stxy = FIX(stxy)
startx = 40 - stxy
LOCATE , startx
PRINT bottomline$; SPC(0);

noline:
IF ggb = 3 THEN
ggb = 0
GOTO doer1
END IF
cc56:
SELECT CASE check$



CASE "Q"
 LOCATE y, x
 next$ = UCASE$(INPUT$(1))
  IF next$ = "U" THEN
   next$ = UCASE$(INPUT$(1))
    IF next$ = "A" THEN
     next$ = UCASE$(INPUT$(1))
      IF next$ = "K" THEN
       next$ = UCASE$(INPUT$(1))
        IF next$ = "E" THEN ccp = 2: GOTO setsettings
      END IF
    END IF
  END IF
check$ = next$
GOTO cc56

CASE "T"
 LOCATE y, x
 next$ = UCASE$(INPUT$(1))
  IF next$ = "I" THEN
   next$ = UCASE$(INPUT$(1))
    IF next$ = "T" THEN
     next$ = UCASE$(INPUT$(1))
      IF next$ = "A" THEN
       next$ = UCASE$(INPUT$(1))
        IF next$ = "N" THEN
         next$ = UCASE$(INPUT$(1))
          IF next$ = "I" THEN
           next$ = UCASE$(INPUT$(1))
            IF next$ = "C" THEN
             IF hh = 1 THEN hh = -1
             hh = hh + 1
               IF hh = 1 THEN
                 writer "`C`%No Cliping Mode on..."
                 ggb = 5
                 towait1 = FIX(TIMER) + 4
               END IF
               IF hh = 0 THEN
                 writer "`C`%No Cliping Mode off..."
                 ggb = 5
                 towait1 = FIX(TIMER) + 4
               GOTO begin
               END IF
            END IF
          END IF
        END IF
      END IF
    END IF
  END IF
check$ = next$
GOTO cc56


CASE "I"
GOTO inventory


CASE "M"
GOTO map

CASE "H"
 LOCATE y, x
 next$ = UCASE$(INPUT$(1))
  IF next$ = "E" THEN
   next$ = UCASE$(INPUT$(1))
    IF next$ = "L" THEN
     next$ = UCASE$(INPUT$(1))
      IF next$ = "P" THEN
       next$ = UCASE$(INPUT$(1))
        IF next$ = "M" THEN
         next$ = UCASE$(INPUT$(1))
          IF next$ = "E" THEN
             ggb = 3
             printcheater = 1
             s = 0
             h = h + 25
             hitmax = hitmax + 25
             GOTO cc66
          END IF
        END IF
      END IF
    END IF
  END IF
check$ = next$
GOTO cc56

CASE "S"

IF cc = 2 THEN
ccc = 1: GOTO setsettings
END IF

LOCATE y, x
 next$ = UCASE$(INPUT$(1))
  IF next$ = "D" THEN
   next$ = UCASE$(INPUT$(1))
    IF next$ = "E" THEN
     next$ = UCASE$(INPUT$(1))
      IF next$ = "B" THEN
        IF dd1 = 1 THEN dd1 = -1
        dd1 = dd1 + 1
                IF dd1 = 1 THEN
                  writer "`C`%Debug Details On..."
                  ggb = 5
                  towait1 = FIX(TIMER) + 4: GOTO begin
                END IF
                IF dd1 = 0 THEN
                  writer "`C`%Debug Details Off..."
                  ggb = 5
                  towait1 = FIX(TIMER) + 4: GOTO begin
                END IF
     
      END IF
    END IF
  END IF
check$ = next$
GOTO cc56



CASE "4"
        direction$ = "L"
GOTO hardhs

CASE "6"
        direction$ = "R"
GOTO hardhs

CASE "8"
        direction$ = "U"
GOTO hardhs

CASE "2"
        direction$ = "D"
GOTO hardhs

CASE "Q"
GOTO Quit
CASE CHR$(27)
GOTO Quit
CASE Null$ + CHR$(75)
        direction$ = "L"
GOTO hardhs
CASE Null$ + CHR$(72)
        direction$ = "U"
GOTO hardhs
CASE Null$ + CHR$(80)
        direction$ = "D"
GOTO hardhs
CASE Null$ + CHR$(77)
        direction$ = "R"
GOTO hardhs

CASE ELSE
GOTO begin

END SELECT
GOTO begin
map:
VIEW PRINT 1 TO 25
COLOR 7, 0
CLS
LOCATE 25, 1, 0
COLOR 7, 0
PRINT STRING$(80, " "); SPC(0);
LOCATE 1, 1
'printer 0, "`2" + gamename$ + " - Map`7`X25`FDB `%- `Y10represents a village or town`X65Press any key...", 25
dd = 1
ig = 1

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
COLOR 15, 1: PRINT " "; SPC(0);
END IF
IF map(xcc) = 3 THEN
COLOR 15, 7: PRINT " "; SPC(0);
END IF


IF xcc = thescreen THEN
LOCATE xc, POS(0) - 1

bs = SCREEN(CSRLIN, POS(0), 1)
b = FIX(bs / 16)
COLOR 20, b
PRINT CHR$(1); SPC(0);
END IF

NEXT xcc


LOCATE 1, 1

CLOSE #36
OPEN "FQREFS.DAT" FOR INPUT AS #36

gs:
IF EOF(36) THEN GOTO NOMAPERROR
INPUT #36, da$
IF da$ = "@#MAP" THEN GOTO mapsx
GOTO gs:

mapsx:
k = 1
invscr63:
LINE INPUT #36, iner$
IF LTRIM$(RTRIM$(iner$)) = "@END" THEN GOTO waiter62
printer 0, iner$, k
k = k + 1
GOTO invscr63


waiter62:

CLOSE #36
LOCATE 1, 1
i$ = INPUT$(1)
towait1 = FIX(TIMER)
COLOR 7, 0
CLS
GOTO loadmap

setsettings:
COLOR 15, 0
CLS
COLOR 15, 0
PRINT "Current Settings:"
PRINT
PRINT "Screen #: ", rp
PRINT "X: ", x
PRINT "Y: ", y
PRINT "Experience: ", EXPER
PRINT "Hitpoints: ", h
PRINT "Strength: ", w
PRINT "Defense: ", defs
PRINT "Gold: ", s
PRINT "Weapon: ", i
PRINT "Armour: ", z
PRINT "Monsters: ", monsters$
PRINT
COLOR 7
PRINT "New Settings:"
PRINT
COLOR 2, 0

setsettings
COLOR 7, 0
CLS

IF ccp = 1 THEN
ccp = 0
GOTO loadmap
END IF
IF ccc = 1 THEN
ccc = 0: GOTO loadmap
END IF
IF cc = 2 THEN GOTO load
tt = 0
IF pk = 2 THEN
pk = 0
GOTO load
END IF
GOTO loadmap


hardhs:
IF x = 1 AND direction$ = "L" THEN
thescreen = thescreen - 1: rp = rp - 1: x = 79: kkkk = y - 1: kkk = kkkk * 79: record = kkk + x: GOTO loadmap
END IF
IF x = 79 AND direction$ = "R" THEN
thescreen = thescreen + 1: rp = rp + 1: x = 1: kkkk = y - 1: kkk = kkkk * 79: record = kkk + x: GOTO loadmap
END IF
IF y = 1 AND direction$ = "U" THEN
rp = rp - 80: thescreen = thescreen - 80: y = 22: record = 21 * 79 + x: GOTO loadmap
END IF
IF y = 22 AND direction$ = "D" THEN
thescreen = thescreen + 80: rp = rp + 80: y = 1: record = x: GOTO loadmap
END IF

OPEN "FQREFS.DAT" FOR INPUT AS #36
rp$ = STR$(rp)
DO
IF EOF(36) THEN EXIT DO
INPUT #36, aggggf$
IF aggggf$ = "@#SCR" + rp$ THEN
        IF direction$ = "L" THEN
        way = 1: what = 1
        END IF
        IF direction$ = "R" THEN
        way = 2: what = 2
        END IF
        IF direction$ = "U" THEN
        way = 3: what = 3
        END IF
        IF direction$ = "D" THEN
        way = 4: what = 4
        END IF
GOTO dofunction
END IF
LOOP
CLOSE #36
GOTO hard



'LRUD  1234, what and way




hard:
dd = map2(rp)

IF hh = 1 THEN GOTO l56
IF direction$ = "L" THEN record = record - 1
IF direction$ = "R" THEN record = record + 1
IF direction$ = "U" THEN record = record - 79
IF direction$ = "D" THEN record = record + 79

bk$ = SPACE$(3): lk = dd + 5:
dfdf = record * 3 - 3: m = lk + dfdf
GET #1, m, bk$
kb$ = RIGHT$(bk$, 2): bk1$ = LEFT$(kb$, 1)


IF bk1$ = CHR$(1) THEN
        IF direction$ = "L" THEN record = record + 1
        IF direction$ = "R" THEN record = record - 1
        IF direction$ = "U" THEN record = record + 79
        IF direction$ = "D" THEN record = record - 79
       GOTO doer1
END IF

IF bk1$ = CHR$(0) THEN
        IF direction$ = "L" THEN record = record + 1
        IF direction$ = "R" THEN record = record - 1
        IF direction$ = "U" THEN record = record + 79
        IF direction$ = "D" THEN record = record - 79
        GOTO l56
END IF

GOTO begin


inventory:
COLOR 7, 0
CLS
CLOSE #36
OPEN "FQREFS.DAT" FOR INPUT AS #36
findit:
IF EOF(36) THEN GOTO SUCKIT
LINE INPUT #36, data$
IF LEFT$(data$, 8) = "@#INVSCR" THEN
k = 1
GOTO invscr
END IF
GOTO findit
invscr:
LINE INPUT #36, iner$
IF iner$ = "@END" THEN GOTO waiter
printer 1, iner$, k
k = k + 1
GOTO invscr
waiter:
LOCATE , , 0, 6, 7
i$ = INPUT$(1)
towait1 = FIX(TIMER)
CLOSE #36
GOTO loadmap


l56:
IF direction$ = "L" THEN kk = 1
IF direction$ = "R" THEN kk = 2
IF direction$ = "U" THEN kk = 3
IF direction$ = "D" THEN kk = 4
GOTO doer
l56b:
IF kk = 1 THEN
x = x - 1: record = record - 1
END IF
IF kk = 2 THEN
x = x + 1: record = record + 1
END IF
IF kk = 3 THEN
y = y - 1: record = record - 79
END IF
IF kk = 4 THEN
y = y + 1: record = record + 79
END IF

GOTO begin



doer:
dd = map2(rp)
yes2:


IF doer = 5 THEN
dkdk = cury - 1
record1 = dkdk * 79 + curx
lk = dd + 5
dfdf = record1 * 3 - 3
m = lk + dfdf
GOTO getstuff
END IF




lk = dd + 5
dfdf = record * 3 - 3
m = lk + dfdf


getstuff:
LOCATE y, x
a$ = SPACE$(3)
GET #1, m, a$
d$ = LEFT$(a$, 1)
dhg = ASC(d$)
bg1 = FIX(dhg / 16)
fg1 = dhg - (bg1 * 16)
COLOR fg1, bg1
IF doer = 5 THEN GOTO gotcolor
e$ = RIGHT$(a$, 1)
IF e$ = CHR$(0) THEN
PRINT " "; SPC(0);
GOTO doner
END IF
PRINT e$; SPC(0);

doner:
IF kk = 1 THEN GOTO l56b  'eft1
IF kk = 2 THEN GOTO l56b  'right1
IF kk = 3 THEN GOTO l56b  'up1
IF kk = 4 THEN GOTO l56b  'down1
GOTO begin
Quit:
GOTO load
SUCKIT:
PRINT
PRINT "The following error was detected... Cannot find @#INVSCR in REF file."
PRINT
GOTO ender5
NOMAPERROR:
PRINT
PRINT "The following error was detected... Cannot find @#MAP in REF file."
PRINT
GOTO ender5
NOHELP:
PRINT
PRINT "The following error was detected... Cannot find @#HELP in REF file."
PRINT
GOTO ender5
NOINTRO:
PRINT
PRINT "The following error was detected... Cannot find @#INTRO in REF file."
PRINT
GOTO ender5
novardat:
PRINT
PRINT "The following error was detected... Cannot find VARIABLE.DAT file."
PRINT
GOTO ender5
noscrdat:
PRINT
PRINT "The following error was detected... Cannot find NOSCR.DAT file."
PRINT
GOTO ender5
errorer:
PRINT
PRINT "The following error was detected... Cannot find FQMAPS.DAT file."
PRINT
GOTO ender5
errorer1:
PRINT
PRINT "The following error was detected... Cannot find FQREFS.DAT file."
PRINT
GOTO ender5
leaver1:
dofunction:
IF way = 1 THEN
x = x - 1: waypoint = 1
END IF
IF way = 2 THEN
x = x + 1: waypoint = 2
END IF
IF way = 3 THEN
y = y - 1: waypoint = 3
END IF
IF way = 4 THEN
y = y + 1: waypoint = 4
END IF

doiter:
DO
INPUT #36, adsg$
adsg$ = LTRIM$(adsg$)
IF adsg$ = "@DO" THEN GOTO dothe
IF LEFT$(adsg$, 3) = "@IF" THEN
iner$ = adsg$
GOTO ifer
END IF
IF LEFT$(adsg$, 4) = "@IPS" THEN GOTO ifposition
IF adsg$ = "@END" THEN GOTO leaver

IF runref$ <> "YES" THEN
IF EOF(36) THEN GOTO leaver
END IF
IF runref$ = "YES" THEN
IF EOF(53) THEN GOTO ins
END IF
LOOP
dothe:
INPUT #36, iner$
iner$ = LTRIM$(iner$)
iner$ = UCASE$(iner$)
IF iner$ = "@END" THEN GOTO donewith
dothe = 5
GOTO togo2
donewith:
dothe = 0
GOTO doiter

ifposition:
dfdf$ = RTRIM$(LTRIM$(RIGHT$(adsg$, LEN(adsg$) - 4)))
COLOR 15, 1

xpos1 = VAL(LEFT$(dfdf$, INSTR(dfdf$, " ")))
ypos1 = VAL(RIGHT$(dfdf$, LEN(dfdf$) - INSTR(dfdf$, " ")))


IF x = xpos1 AND y = ypos1 THEN GOTO itisonit
GOTO doiter

itisonit:
DO
IF runref$ <> "YES" THEN INPUT #36, iner$
IF runref$ = "YES" THEN INPUT #53, iner$
iner$ = LTRIM$(iner$)


togo2:
iner$ = UCASE$(iner$)
IF iner$ = "#DONE" THEN
doit3 = 0
cb = 0
doit = 0
runref$ = "NO"
GOTO doiter
END IF


IF LEFT$(iner$, 5) = "#WAIT" THEN
if$ = LTRIM$(RTRIM$(RIGHT$(iner$, LEN(iner$) - 5)))
IF if$ = "1" THEN LOCATE , , 1
IF if$ = "0" THEN LOCATE , , 0
i$ = INPUT$(1)
END IF

IF LEFT$(iner$, 6) = "#SLEEP" THEN
rp6 = VAL(LTRIM$(RIGHT$(iner$, LEN(iner$) - 6)))
ts = TIMER
DO
LOOP WHILE TIMER < ts + rp6
END IF

IF LEFT$(iner$, 6) = "#SUPER" THEN
superhuman$ = "YES"
END IF

IF LEFT$(iner$, 8) = "#NOSUPER" THEN
superhuman$ = "NO"
END IF

IF LEFT$(iner$, 10) = "#MAPSCREEN" THEN
thescreen = VAL(LTRIM$(RIGHT$(iner$, LEN(iner$) - 10)))
END IF


IF LEFT$(iner$, 5) = "#GOTO" THEN
rp = VAL(LTRIM$(RIGHT$(iner$, LEN(iner$) - 5)))
reloadscreen = 2
END IF

IF LEFT$(iner$, 7) = "#NEWPOS" THEN
dfdf$ = LTRIM$(RIGHT$(iner$, LEN(iner$) - 7))
IF waypoint = 1 THEN x = x + 1
IF waypoint = 2 THEN x = x - 1
IF waypoint = 3 THEN y = y + 1
IF waypoint = 4 THEN y = y - 1
LOCATE y, x
COLOR , color1
PRINT " "; SPC(0);

x = VAL(LEFT$(dfdf$, INSTR(dfdf$, " ")))
y = VAL(RIGHT$(dfdf$, INSTR(dfdf$, " ") - 1))
record = (y - 1) * 79 + x

color$ = SPACE$(1)
dd = map2(rp): dk = dd + 5: mk = record * 3 - 3: m = mk + dk
GET #1, m, color$: d$ = LEFT$(color$, 1): dg = ASC(d$): color1 = FIX(dg / 16)
COLOR 14, color1: LOCATE y, x: PRINT CHR$(1); SPC(0);

direction$ = ""
waypoint = 0

END IF


IF iner$ = "#MOVEOBJ" THEN
IF runref$ <> "YES" THEN INPUT #36, kind$
IF runref$ = "YES" THEN INPUT #53, kind$
ret = 0
ghs = 5
returnhere:
        ts = TIMER
        DO
        LOOP WHILE TIMER < ts + VAL(kind$)

IF runref$ <> "YES" THEN INPUT #36, dfdf$
IF runref$ = "YES" THEN INPUT #53, dfdf$
dfdf$ = UCASE$(dfdf$)
IF dfdf$ = "#DONEMOVE" THEN GOTO donemove

curx = VAL(LEFT$(dfdf$, INSTR(dfdf$, " ")))
cury = VAL(RIGHT$(dfdf$, INSTR(dfdf$, " ") - 1))


xb = SCREEN(cury, curx)
toprint$ = CHR$(xb)
xb1 = SCREEN(cury, curx, 1)
d = xb1

IF xb1 >= 16 THEN
d = FIX(xb1 / 16)
xb1 = xb1 - (d * 16)

END IF


doer = 5
GOTO doer
gotcolor:
LOCATE cury, curx
PRINT " "
doer = 0

IF runref$ <> "YES" THEN INPUT #36, dfdf$
IF runref$ = "YES" THEN INPUT #53, dfdf$
dfdf$ = UCASE$(dfdf$)

IF dfdf$ = "#DONEMOVE" THEN GOTO donemove


curx = VAL(LEFT$(dfdf$, INSTR(dfdf$, " ")))
cury = VAL(RIGHT$(dfdf$, INSTR(dfdf$, " ") - 1))

LOCATE cury, curx
COLOR xb1, d
PRINT toprint$; SPC(0);
GOTO returnhere:

donemove:
END IF


IF iner$ = "#ANIMATE" THEN
IF RUNRUF$ = "YES" THEN GOTO donet
INPUT #36, ani$
ret1 = 0
IF ani$ = "1" THEN ret1 = 3
todo:
cb = 0
INPUT #36, newthing$
IF newthing$ = "#DONEANIMATE" THEN GOTO doneanimate
iner$ = newthing$
iner$ = UCASE$(iner$)
cb = 56
IF ret1 = 3 THEN SLEEP 1
GOTO togo2:
doneanimate:
CLOSE #36
IF waypoint = 1 THEN x = x + 1
IF waypoint = 2 THEN x = x - 1
IF waypoint = 3 THEN y = y + 1
IF waypoint = 4 THEN y = y - 1
GOTO dl1
END IF
donet:

IF LEFT$(iner$, 7) = "#CHOICE" THEN
LOCATE , , 0
howmany = VAL(RIGHT$(iner$, LEN(iner$) - 7))
FOR hg = 1 TO howmany
IF runref$ <> "YES" THEN INPUT #36, data$
IF runref$ = "YES" THEN INPUT #53, data$
opt$(hg) = data$
NEXT hg

op4 = 1
PRINT
cury = CSRLIN
beg6:
LOCATE cury, 1
LOCATE , 1
COLOR 15, 0
FOR hg = 1 TO (op4 - 1)
data$ = opt$(hg)

printer 1, data$, cury + hg - 1
NEXT hg


option$ = opt$(op4)




COLOR 15, 1

printer 3, option$, cury + hg - 1
doposx1 = doposx
COLOR 15, 0

sssg = 1
fds = 1
curg:
IF op4 + fds > howmany THEN GOTO curg1
sssg = sssg - 1
junk$ = opt$(op4 + fds)
fds = fds + 1
printer 1, junk$, cury + hg - sssg
GOTO curg
curg1:

DO
LOCATE cury + (op4 - 1), doposx1, 1, 6, 7
newcheck$ = INKEY$
LOOP WHILE newcheck$ = ""
SELECT CASE newcheck$
CASE CHR$(27)
GOTO donefunc
CASE CHR$(13)
GOTO enterpress
CASE Null$ + CHR$(77)
GOTO downer
CASE Null$ + CHR$(75)
GOTO uper
CASE Null$ + CHR$(72)
uper:
IF op4 = 1 THEN
op4 = howmany
GOTO beg6
END IF
op4 = op4 - 1
GOTO beg6
CASE Null$ + CHR$(80)
downer:
IF op4 = howmany THEN
op4 = 1
GOTO beg6
END IF
op4 = op4 + 1
GOTO beg6
CASE ELSE
GOTO beg6
END SELECT
GOTO beg6

enterpress:
op4$ = STR$(op4)
toGET$ = "#IF" + op4$

gg:
IF runref$ <> "YES" THEN
IF EOF(36) THEN GOTO nothing
END IF
IF runref$ = "YES" THEN
IF EOF(53) THEN GOTO nothing
END IF
IF runref$ <> "YES" THEN INPUT #36, data$
IF runref$ = "YES" THEN INPUT #53, data$
IF data$ = toGET$ THEN GOTO dofunc
GOTO gg
dofunc:
in:
IF runref$ <> "YES" THEN INPUT #36, iner$
IF runref$ = "YES" THEN INPUT #53, iner$
iner$ = LTRIM$(iner$)

iner$ = UCASE$(iner$)
IF iner$ = "@DONE" THEN GOTO donefunc
doits = 5
GOTO togo2
donefunc:
IF runref$ <> "YES" THEN INPUT #36, data$
IF runref$ = "YES" THEN INPUT #53, data$
data$ = UCASE$(data$)
IF data$ = "@DONECHOICE" THEN GOTO nothing
GOTO donefunc
nothing:
doits = 0
END IF

IF LEFT$(iner$, 6) = "#CLEAR" THEN
clear$ = RIGHT$(iner$, LEN(iner$) - 6)
ab = VAL(clear$)
IF ab = 0 THEN ab = 25
LOCATE ab, 1
COLOR 7, 0
PRINT STRING$(80, " "); SPC(0);
END IF


IF LEFT$(iner$, 5) = "@GOTO" THEN
togoto$ = LTRIM$(RTRIM$(RIGHT$(iner$, LEN(iner$) - 5)))
IF LEFT$(togoto$, 2) <> "@#" THEN togoto$ = "@#" + togoto$


IF runref$ <> "YES" THEN
CLOSE #36
OPEN "FQREFS.DAT" FOR INPUT AS #36
gos:
IF EOF(36) THEN GOTO getout6
INPUT #36, dat$
IF dat$ = togoto$ THEN GOTO itisonit
GOTO gos
END IF


IF runref$ = "YES" THEN
CLOSE #53
OPEN reffile$ FOR INPUT AS #53
gos1:
IF EOF(53) THEN GOTO getout6
INPUT #53, dat$
IF dat$ = togoto$ THEN GOTO itisonit
GOTO gos1:
END IF

getout6:
CLOSE #36, #53
IF waypoint = 1 THEN x = x + 1
IF waypoint = 2 THEN x = x - 1
IF waypoint = 3 THEN y = y + 1
IF waypoint = 4 THEN y = y - 1
kkkk = y - 1
kkk = kkkk * 79
record = kkk + x
GOTO getout
END IF


IF iner$ = "#NOLINE" THEN
COLOR 7, 0
IF gbbn = 5 THEN GOTO nothing3
gbbn = 5
LOCATE 23, 1
PRINT STRING$(80, " "); SPC(0);
nothing3:
printline$ = "NO"
END IF

IF LEFT$(iner$, 7) = "#RUNREF" THEN
data$ = LTRIM$(RIGHT$(iner$, LEN(iner$) - 7))
label$ = LEFT$(data$, INSTR(data$, "|") - 1)
reffile$ = RIGHT$(data$, LEN(data$) - INSTR(data$, "|"))


newgfh1:
label$ = LTRIM$(label$)
reffile$ = LTRIM$(reffile$)

OPEN reffile$ FOR BINARY AS #53
IF LOF(53) < 2 THEN
CLOSE #53
KILL reffile$
GOTO returnit
END IF
returnref:
CLOSE #53
OPEN reffile$ FOR INPUT AS #53
junky:

IF EOF(53) THEN GOTO endrefit
INPUT #53, iner$
IF iner$ = "@#" + label$ THEN
bg = 0
GOTO ins
END IF

GOTO junky


ins:
IF EOF(53) THEN GOTO endrefit
INPUT #53, iner$
iner$ = UCASE$(iner$)
IF iner$ = "#DONE" THEN GOTO ins
IF iner$ = "@END" THEN GOTO endrefit
runref$ = "YES"
GOTO togo2
endrefit:
startplay = 0
CLOSE #53
runref$ = "NO"
IF doit3 = 5 THEN GOTO INR
GOTO itisonit
returnit:
END IF


IF iner$ = "#CLS" THEN
reloadscreen = 3
doposy = 1
COLOR 7, 0
CLS
END IF


IF LEFT$(iner$, 5) = "#SHOW" THEN
data$ = LTRIM$(RIGHT$(iner$, LEN(iner$) - 5))
leftof$ = LEFT$(data$, INSTR(data$, "|") - 1)
rightof$ = RIGHT$(data$, LEN(data$) - INSTR(data$, "|"))
OPEN leftof$ FOR INPUT AS #252
dg:
IF EOF(252) THEN GOTO done2
INPUT #252, data$
IF data$ = "@#" + LTRIM$(rightof$) THEN GOTO showit1
GOTO dg
showit1:
IF EOF(252) THEN GOTO done2
INPUT #252, toprint$
IF toprint$ = "@END" THEN GOTO done2
printer 1, toprint$, doposy
doposy = doposy + 1
GOTO showit1
done2:
CLOSE #252
END IF



IF LEFT$(iner$, 6) = "#PRINT" THEN

IF LTRIM$(RTRIM$(RIGHT$(iner$, LEN(iner$) - 6))) = "P" THEN
IF runref$ <> "YES" THEN LINE INPUT #36, toprint$
IF runref$ = "YES" THEN LINE INPUT #53, toprint$
printer 1, toprint$, doposy
GOTO g55
END IF

howmany = VAL(RIGHT$(iner$, LEN(iner$) - 6))
FOR doingit = 1 TO howmany
IF runref$ <> "YES" THEN LINE INPUT #36, toprint$
IF runref$ = "YES" THEN LINE INPUT #53, toprint$
printer 2, toprint$, doposy
doposy = doposy + 1
NEXT
g55:
IF LTRIM$(RTRIM$(RIGHT$(iner$, LEN(iner$) - 6))) <> "P" THEN reloadscreen = 3
towait1 = FIX(TIMER)
END IF

IF iner$ = "#MONSTER" THEN

IF runref$ = "YES" THEN INPUT #53, tosay$
IF runref$ = "YES" THEN INPUT #53, m$
IF runref$ = "YES" THEN INPUT #53, b$
IF runref$ = "YES" THEN INPUT #53, togetscore
IF runref$ = "YES" THEN INPUT #53, expertoget

IF runref$ <> "YES" THEN INPUT #36, tosay$
IF runref$ <> "YES" THEN INPUT #36, m$
IF runref$ <> "YES" THEN INPUT #36, b$
IF runref$ <> "YES" THEN INPUT #36, togetscore
IF runref$ <> "YES" THEN INPUT #36, expertoget

IF i = 1 THEN weapon = weapon1power
IF i = 2 THEN weapon = weapon2power
IF i = 3 THEN weapon = weapon3power
IF i = 4 THEN weapon = weapon4power

IF z = 1 THEN armour = armour1power
IF z = 2 THEN armour = armour2power
IF z = 3 THEN armour = armour3power
IF z = 4 THEN armour = armour4power

IF b$ = "MAXENERGY" THEN
b = hitmax
mn = w * 2 + weapon + armour
GOTO deg1
END IF
b = VAL(b$)
mn = VAL(b$)
deg1:
deg = 5
GOTO monster
monster1:
deg = 0
END IF


IF LEFT$(iner$, 6) = "#GOLD+" THEN
newscore$ = LTRIM$(RIGHT$(iner$, LEN(iner$) - 6))
newscore = VAL(newscore$)
s = s + newscore
END IF



IF LEFT$(iner$, 6) = "#SHELL" THEN
newscore$ = LTRIM$(RIGHT$(iner$, LEN(iner$) - 6))
SHELL newscore$
END IF


IF LEFT$(iner$, 6) = "#GOLD-" THEN
newscore$ = LTRIM$(RIGHT$(iner$, LEN(iner$) - 6))
newscore = VAL(newscore$)
IF s < newscore THEN GOTO cantdo
s = s - newscore
GOTO coner13
cantdo:
CLS
printer 1, "`2Your funds aren't exactly what they used to be...", 1
printer 1, "`2You decide to pass up this glorious opportunity to spend money...", 2
printer 1, "`4Press a key...", 4
iss$ = INPUT$(1)
GOTO getout
coner13:
END IF


IF iner$ = "#INPUT" THEN
IF runref$ <> "YES" THEN INPUT #36, random1$
IF runref$ = "YES" THEN INPUT #53, random1$
IF runref$ <> "YES" THEN INPUT #36, x$
IF runref$ = "YES" THEN INPUT #53, x$
IF runref$ <> "YES" THEN INPUT #36, y$
IF runref$ = "YES" THEN INPUT #53, y$
thex = VAL(x$)
they = VAL(y$)
length = VAL(random1$)
LOCATE they, thex
COLOR 15, 1
PRINT STRING$(length, " "); SPC(0);
LOCATE they, thex
theprint$ = ""
ig$ = ""
gd64:
ig$ = INPUT$(1)
IF ig$ = CHR$(13) THEN GOTO enter
IF ig$ = CHR$(27) THEN GOTO enter
IF ig$ = CHR$(8) THEN
IF LEN(theprint$) <= 0 THEN GOTO gd64
theprint$ = LEFT$(theprint$, LEN(theprint$) - 1)
LOCATE they, thex
COLOR 15, 1
PRINT STRING$(length, " "); SPC(0);
LOCATE they, thex
PRINT theprint$; SPC(0);
GOTO gd64
END IF
IF LEN(theprint$) >= length - 1 THEN GOTO gd64
theprint$ = theprint$ + ig$
LOCATE they, thex
PRINT theprint$; SPC(0);
GOTO gd64
enter:
IF theprint$ = "" THEN theprint$ = "0"
what$ = "="
toset$ = "LASTRESPONSE"
tosetto$ = theprint$
GOTO setnow
END IF


IF LEFT$(iner$, 9) = "#RANDOMIF" THEN
rand1 = VAL(RIGHT$(iner$, LEN(iner$) - 9))
RANDOMIZE TIMER
rag = INT(RND * rand1) + 1
IF rag = 1 THEN GOTO ifit1

idg:
IF runref$ <> "YES" THEN
IF EOF(36) THEN GOTO donerandom
END IF
IF runref$ = "YES" THEN
IF EOF(53) THEN GOTO donerandom
END IF
IF runref$ <> "YES" THEN INPUT #36, junk$
IF runref$ = "YES" THEN INPUT #53, junk$
IF UCASE$(junk$) = "#ENDRANDOM" THEN GOTO donerandom
GOTO idg

ifit1:
IF runref$ <> "YES" THEN INPUT #36, iner$
IF runref$ = "YES" THEN INPUT #53, iner$
iner$ = LTRIM$(iner$)
iner$ = UCASE$(iner$)
IF iner$ = "#ENDRANDOM" THEN GOTO donerandom
doit2 = 5
GOTO togo2
donerandom:
doit2 = 0
GOTO itisonit
END IF


IF LEFT$(iner$, 4) = "#SET" THEN
cb562 = 0

junk$ = ""
junk6$ = ""

what$ = ""
toset$ = ""
tosetto$ = ""
gsb = 6

data$ = RIGHT$(iner$, LEN(iner$) - 5)

toset$ = LEFT$(data$, INSTR(data$, " ") - 1)
what$ = LTRIM$(RTRIM$(LEFT$(RIGHT$(data$, LEN(data$) - INSTR(data$, " ")), 2)))
tosetto$ = LEFT$(RIGHT$(data$, LEN(data$) - INSTR(INSTR(data$, " ") + 1, data$, " ")), LEN(data$) - INSTR(INSTR(data$, " ") + 1, data$, " ") - 1)

hyes = 5
GOTO getready

setnow:

nus = 1
IF what$ = "+1" THEN GOTO pluser
IF what$ = "-1" THEN GOTO pluser
IF what$ = "=1" THEN
pluser:
IF settings$(nus) = "--END--" THEN
        datatouse$ = ""
        GOTO setnow2
END IF


data$ = settings$(nus): nus = nus + 1
data1$ = settings$(nus): nus = nus + 1

IF data$ = tosetto$ THEN
datatouse$ = data1$
GOTO setnow2
END IF

GOTO pluser
END IF                                          'pluser


setnow2:

nus = 1
DO
IF settings$(nus) = "--END--" THEN GOTO makeit
data$ = settings$(nus): nus = nus + 1
IF data$ = toset$ THEN GOTO processit
LOOP

processit:
datanow = VAL(settings$(nus))
datanow$ = settings$(nus)


IF what$ = "+1" THEN GOTO pluser2
IF what$ = "-1" THEN GOTO pluser2
IF what$ = "=1" THEN
pluser2:


IF what$ = "+1" THEN jf$ = LTRIM$(RTRIM$(STR$(datanow + VAL(datatouse$))))
IF what$ = "-1" THEN jf$ = LTRIM$(RTRIM$(STR$(datanow - VAL(datatouse$))))
IF what$ = "=1" THEN jf$ = datatouse$
settings$(nus) = jf$

GOTO donewithit
END IF                                          'pluser 2



IF what$ = "+" THEN jf = datanow + VAL(tosetto$)
IF what$ = "-" THEN jf = datanow - VAL(tosetto$)
IF what$ = "=" THEN jf = VAL(tosetto$)
settings$(nus) = LTRIM$(RTRIM$(STR$(jf)))

GOTO donewithit
makeit:

settings$(nus) = toset$: nus = nus + 1
settings$(nus) = tosetto$: nus = nus + 1
settings$(nus) = "--END--": nus = nus + 1


donewithit:


IF hyes = 5 THEN
hyes = 0
nus = 1
eofer62:
IF settings$(nus) = "--END--" THEN GOTO doneit2
thes$ = settings$(nus): nus = nus + 1



IF thes$ = "MAXENERGY" THEN
thes1$ = settings$(nus): nus = nus + 1
hitmax = VAL(thes1$)
END IF

IF thes$ = "HITPOINT" THEN
thes1$ = settings$(nus): nus = nus + 1
h = VAL(thes1$)
IF h > hitmax THEN h = hitmax
END IF



IF thes$ = "STRENGTH" THEN
thes1$ = settings$(nus): nus = nus + 1
w = VAL(thes1$)
END IF

IF thes$ = "DEFENSE" THEN
thes1$ = settings$(nus): nus = nus + 1
defs = VAL(thes1$)
END IF

IF thes$ = "GOLD" THEN
thes1$ = settings$(nus): nus = nus + 1
s = VAL(thes1$)
END IF

IF thes$ = "EXPERIENCE" THEN
thes1$ = settings$(nus): nus = nus + 1
EXPER = VAL(thes1$)
END IF

GOTO eofer62
doneit2:
END IF
END IF





IF iner$ = "#MAXENERGY" THEN
h = hitmax
END IF


IF LEFT$(iner$, 3) = "#IF" THEN

ifer:
iner$ = UCASE$(iner$)
whatif$ = ""
how$ = ""
whatequal$ = ""
gsb = 5

data$ = RIGHT$(iner$, LEN(iner$) - 4)


whatif$ = LEFT$(data$, INSTR(data$, " ") - 1)
how$ = LTRIM$(RTRIM$(LEFT$(RIGHT$(data$, LEN(data$) - INSTR(data$, " ")), 2)))
whatequal$ = LEFT$(RIGHT$(data$, LEN(data$) - INSTR(INSTR(data$, " ") + 1, data$, " ")), LEN(data$) - INSTR(INSTR(data$, " ") + 1, data$, " ") - 5)



GOTO getready
getre2:

nus = 1
EOF1:
IF settings$(nus) = "--END--" THEN GOTO donenext
whatif1$ = settings$(nus): nus = nus + 1


IF whatif1$ = "STARTVARIABLE" THEN GOTO EOF1


IF whatif$ = whatif1$ THEN
whatequal1$ = settings$(nus): nus = nus + 1
INR:


IF whatequal$ = whatequal1$ AND how$ = "=" THEN GOTO runit
IF VAL(whatequal$) >= VAL(whatequal1$) AND how$ = "<=" THEN GOTO runit
IF VAL(whatequal$) <= VAL(whatequal1$) AND how$ = ">=" THEN GOTO runit
IF VAL(whatequal$) > VAL(whatequal1$) AND how$ = "<" THEN GOTO runit
IF VAL(whatequal$) < VAL(whatequal1$) AND how$ = ">" THEN GOTO runit


IF how$ = "=1" THEN
whatequal3$ = VOB$(whatequal$)
IF whatequal1$ = whatequal3$ THEN GOTO runit
END IF


IF how$ = "<2" THEN GOTO l553
IF how$ = "<1" THEN
l553:
whatequal3$ = VOB$(whatequal$)
IF VAL(whatequal1$) <= VAL(whatequal3$) AND how$ = "<1" THEN GOTO runit
IF VAL(whatequal1$) < VAL(whatequal3$) AND how$ = "<2" THEN GOTO runit
END IF


IF how$ = ">2" THEN GOTO l5533
IF how$ = ">1" THEN
l5533:
whatequal3$ = VOB$(whatequal$)
IF VAL(whatequal1$) >= VAL(whatequal3$) AND how$ = ">1" THEN GOTO runit
IF VAL(whatequal1$) > VAL(whatequal3$) AND how$ = ">2" THEN GOTO runit
END IF



GOTO donenext
END IF

junk$ = settings$(nus): nus = nus + 1

GOTO EOF1:

runit:
IF runref$ <> "YES" THEN INPUT #36, iner$
IF runref$ = "YES" THEN INPUT #53, iner$
iner$ = LTRIM$(iner$)
IF iner$ = "#ENDIF" THEN GOTO donenext1
IF iner$ = "#ENDIF1" THEN
doit3 = 0
CLOSE #69
IF runref$ = "YES" THEN GOTO ins
GOTO itisonit
END IF
doit3 = 5
GOTO togo2

donenext:
gog:
IF runref$ <> "YES" THEN INPUT #36, junk$
IF runref$ = "YES" THEN INPUT #53, junk$
IF junk$ = "#ENDIF" THEN GOTO donenext1
IF junk$ = "#ENDIF1" THEN
doit3 = 0
IF runref$ = "YES" THEN GOTO ins
GOTO itisonit
END IF
GOTO gog
dn1:
IF waypoint = 1 THEN x = x + 1
IF waypoint = 2 THEN x = x - 1
IF waypoint = 3 THEN y = y + 1
IF waypoint = 4 THEN y = y - 1
donenext1:
doit3 = 0
IF runref$ = "YES" THEN GOTO ins
GOTO itisonit
END IF





IF LEFT$(iner$, 7) = "#WEAPON" THEN i = VAL(RIGHT$(iner$, LEN(iner$) - 7))

IF LEFT$(iner$, 8) = "#WEAPON+" THEN
i = i + VAL(RIGHT$(iner$, LEN(iner$) - 8))
IF i > 4 THEN i = 4
END IF


IF LEFT$(iner$, 8) = "#WEAPON-" THEN
i = i - VAL(RIGHT$(iner$, LEN(iner$) - 8))
IF i < 1 THEN i = 1
END IF

IF LEFT$(iner$, 6) = "#ARMOR" THEN z = VAL(RIGHT$(iner$, LEN(iner$) - 6))

IF LEFT$(iner$, 7) = "#ARMOR+" THEN
z = z + VAL(RIGHT$(iner$, LEN(iner$) - 7))
IF z > 4 THEN z = 4
END IF

IF LEFT$(iner$, 7) = "#ARMOR-" THEN
z = z - VAL(RIGHT$(iner$, LEN(iner$) - 7))
IF z < 1 THEN z = 1
END IF

IF LEFT$(iner$, 12) = "#RANDOMWRITE" THEN
hmr = VAL(RIGHT$(iner$, LEN(iner$) - 12))
RANDOMIZE TIMER
rand1 = INT(RND * hmr)
FOR i12 = 1 TO rand1
IF runref$ <> "YES" THEN INPUT #36, D5342$
IF runref$ = "YES" THEN INPUT #53, D5342$

NEXT i12
IF runref$ <> "YES" THEN INPUT #36, towrite$
IF runref$ = "YES" THEN INPUT #53, towrite$
writer towrite$
towait1 = FIX(TIMER) + 4
ggb = 5
END IF


IF LEFT$(iner$, 6) = "#WRITE" THEN
IF runref$ <> "YES" THEN INPUT #36, towrite$
IF runref$ = "YES" THEN INPUT #53, towrite$
writer towrite$
towait1 = FIX(TIMER) + 4
ggb = 5
END IF

IF iner$ = "#RETURN" THEN
GOTO getout
END IF

IF EXPER < 0 THEN EXPER = 0
IF w < 0 THEN w = 0
IF defs < 0 THEN defs = 0
IF h < 0 THEN h = 0

IF alwaysdo = 5 THEN GOTO gotothenext
IF dothe = 5 THEN GOTO dothe
IF jg = 5 THEN GOTO invscr
IF doit2 = 5 THEN GOTO ifit1
IF cb = 56 THEN GOTO todo
IF doits = 5 THEN GOTO in
IF runref$ = "YES" THEN GOTO ins
IF doit3 = 5 THEN GOTO INR
LOOP
GOTO leaver

leaver:
doposy = 5
CLOSE #36

IF reloadscreen = 3 THEN
IF waypoint = 1 THEN x = x + 1
IF waypoint = 2 THEN x = x - 1
IF waypoint = 3 THEN y = y + 1
IF waypoint = 4 THEN y = y - 1
kkkk = y - 1
kkk = kkkk * 79
record = kkk + x
reloadscreen = 0
GOTO loadmap
END IF

IF reloadscreen = 2 THEN
kkkk = y - 1
kkk = kkkk * 79
record = kkk + x
reloadscreen = 0
GOTO loadmap
END IF

IF waypoint = 1 THEN x = x + 1
IF waypoint = 2 THEN x = x - 1
IF waypoint = 3 THEN y = y + 1
IF waypoint = 4 THEN y = y - 1

kkkk = y - 1
kkk = kkkk * 79
record = kkk + x

IF what = 1 THEN GOTO hard   'left
IF what = 2 THEN GOTO hard   'right
IF what = 3 THEN GOTO hard   'up
IF what = 4 THEN GOTO hard   'down
IF what = 5 THEN GOTO bg1
unable:
PRINT "ERROR, Unable to Do Function!!!"
GOTO nottt
eeeeerrrrr:
PRINT
PRINT "Error, User tried to Cheat!"
GOTO nottt
no1:
COLOR 7, 0
CLS
endscreen
ender5:
CLOSE #8
COLOR 7, 0
END

getready:
nus = 1
ghsg:
IF settings$(nus) = "--END--" THEN GOTO startvariable
data$ = settings$(nus): nus = nus + 1
data1$ = settings$(nus): nus = nus + 1

IF data$ = "MAXENERGY" THEN
max1 = 1
settings$(nus - 1) = STR$(hitmax)

GOTO ghsg
END IF

IF data$ = "HITPOINT" THEN
max2 = 1
settings$(nus - 1) = STR$(h)
GOTO ghsg
END IF

IF data$ = "GOLD" THEN
max3 = 1
settings$(nus - 1) = STR$(s)
GOTO ghsg
END IF

IF data$ = "STRENGTH" THEN
max4 = 1
settings$(nus - 1) = STR$(w)
GOTO ghsg
END IF

IF data$ = "DEFENSE" THEN
max5 = 1
settings$(nus - 1) = STR$(defs)
GOTO ghsg
END IF

IF data$ = "WEAPON" THEN
max6 = 1
settings$(nus - 1) = STR$(i)
GOTO ghsg
END IF

IF data$ = "ARMOUR" THEN
max7 = 1
settings$(nus - 1) = STR$(z)
GOTO ghsg
END IF

IF data$ = "EXPERIENCE" THEN
max8 = 1
settings$(nus - 1) = STR$(EXPER)
GOTO ghsg
END IF


GOTO ghsg

startvariable:
IF max1 <> 1 THEN settings$(nus) = "MAXENERGY": nus = nus + 1
IF max1 <> 1 THEN settings$(nus) = STR$(hitmax): nus = nus + 1
IF max2 <> 1 THEN settings$(nus) = "HITPOINT": nus = nus + 1
IF max2 <> 1 THEN settings$(nus) = STR$(h): nus = nus + 1
IF max3 <> 1 THEN settings$(nus) = "GOLD": nus = nus + 1
IF max3 <> 1 THEN settings$(nus) = STR$(s): nus = nus + 1
IF max4 <> 1 THEN settings$(nus) = "STRENGTH": nus = nus + 1
IF max4 <> 1 THEN settings$(nus) = STR$(w): nus = nus + 1
IF max5 <> 1 THEN settings$(nus) = "DEFENSE": nus = nus + 1
IF max5 <> 1 THEN settings$(nus) = STR$(defs): nus = nus + 1
IF max6 <> 1 THEN settings$(nus) = "WEAPON": nus = nus + 1
IF max6 <> 1 THEN settings$(nus) = STR$(i): nus = nus + 1
IF max7 <> 1 THEN settings$(nus) = "ARMOUR": nus = nus + 1
IF max7 <> 1 THEN settings$(nus) = STR$(z): nus = nus + 1
IF max8 <> 1 THEN settings$(nus) = "EXPERIENCE": nus = nus + 1
IF max8 <> 1 THEN settings$(nus) = STR$(EXPER): nus = nus + 1
max1 = 1
max2 = 1
max3 = 1
max4 = 1
max5 = 1
max6 = 1
max7 = 1
max8 = 1
CLOSE #5, #66, #67, #69, #222, #234
settings$(nus) = "--END--": nus = nus + 1

IF hyes = 5 THEN GOTO setnow

GOTO getre2

getout:
IF runref$ = "YES" THEN GOTO returnref
CLOSE #36
OPEN "FQREFS.DAT" FOR INPUT AS #36
rp$ = STR$(rp)
scr$ = "@#SCR" + rp$
DO
IF EOF(36) THEN EXIT DO
INPUT #36, agggg$
IF agggg$ = scr$ THEN EXIT DO
LOOP
GOTO doiter
nottt:
COLOR 7, 0
END

SUB cole (pressed, toprint$, cole1$)

IF pressed = 1 THEN
gg = gdi
END IF
IF pressed = 0 THEN
gg = cgd
END IF

cole1$ = UCASE$(cole1$)

IF cole1$ = "L" THEN
gg = gg + 2
aaa$ = LEFT$(toprint$, gg)
aa$ = RIGHT$(aaa$, 2)
aa = VAL(aa$)
PRINT STRING$(aa, " "); SPC(0);
doposx = doposx + aa
END IF

IF cole1$ = "X" THEN
gg = gg + 1
aaa$ = LEFT$(toprint$, gg)
aa$ = RIGHT$(aaa$, 1)


IF aa$ = ":" THEN
tocollect$ = ""
getnext:
gg = gg + 1
axx$ = LEFT$(toprint$, gg)
ax$ = RIGHT$(axx$, 1)
IF ax$ = ";" THEN GOTO donecollecting
tocollect$ = tocollect$ + ax$
GOTO getnext
donecollecting:
nus = 1
getter:
IF settings$(nus) = "--END--" THEN
data1$ = "1"
GOTO dattify
END IF

data$ = settings$(nus): nus = nus + 1
data1$ = settings$(nus): nus = nus + 1
IF data$ = tocollect$ THEN GOTO dattify
GOTO getter
dattify:
vals = VAL(data1$)
doposx = vals
LOCATE , vals
GOTO xxb
END IF

gg = gg + 1
aaa$ = LEFT$(toprint$, gg)
aa$ = RIGHT$(aaa$, 2)
aa = VAL(aa$)
doposx = aa
LOCATE , doposx
xxb:
END IF


IF cole1$ = "Y" THEN
gg = gg + 1
aaa$ = LEFT$(toprint$, gg)
aa$ = RIGHT$(aaa$, 1)


IF aa$ = ":" THEN
tocollect$ = ""
getnext1:
gg = gg + 1
axx$ = LEFT$(toprint$, gg)
ax$ = RIGHT$(axx$, 1)
IF ax$ = ";" THEN GOTO donecollecting1
tocollect$ = tocollect$ + ax$
GOTO getnext1
donecollecting1:
nus = 1
getter1:
IF settings$(nus) = "--END--" THEN
data1$ = "1"
GOTO dattify1
END IF

data$ = settings$(nus): nus = nus + 1
data1$ = settings$(nus): nus = nus + 1
IF data$ = tocollect$ THEN GOTO dattify1
GOTO getter1
dattify1:
vals = VAL(data1$)
doposy = vals
LOCATE vals
GOTO xxb1
END IF

gg = gg + 1
aaa$ = LEFT$(toprint$, gg)
aa$ = RIGHT$(aaa$, 2)

aa = VAL(aa$)
doposy = aa
k = doposy
LOCATE doposy
xxb1:
END IF

IF cole1$ = "C" THEN
FOR gh = 1 TO LEN(toprint$)
gh1$ = LEFT$(toprint$, gh)
IF gh <> 1 THEN gh2$ = RIGHT$(gh1$, 1)
IF gh = 1 THEN gh2$ = gh1$

IF gh2$ = "`" THEN
gh = gh + 1
gh1$ = LEFT$(toprint$, gh)
gh2$ = RIGHT$(gh1$, 1)
gh2$ = UCASE$(gh2$)
h$ = ""


IF gh2$ = "F" THEN gh = gh + 2
IF gh2$ = "H" THEN h$ = LTRIM$(STR$(h))

IF gh2$ = "E" THEN h$ = LTRIM$(STR$(EXPER))
IF gh2$ = "G" THEN h$ = LTRIM$(STR$(G))
IF gh2$ = "A" THEN h$ = LTRIM$(STR$(w))
IF gh2$ = "D" THEN h$ = LTRIM$(STR$(defs))
IF gh2$ = "I" THEN
IF i = 1 THEN h$ = weapon1name$
IF i = 2 THEN h$ = weapon2name$
IF i = 3 THEN h$ = weapon3name$
IF i = 4 THEN h$ = weapon4name$
END IF
IF gh2$ = "Z" THEN
IF z = 1 THEN h$ = armour1name$
IF z = 2 THEN h$ = armour2name$
IF z = 3 THEN h$ = armour3name$
IF z = 4 THEN h$ = armour4name$
END IF
IF gh2$ = "V" THEN
hh:
gh1$ = LEFT$(toprint$, gh)
gh2$ = RIGHT$(gh1$, 1)
IF gh2$ = "`" THEN GOTO ghhh
gh = gh + 1
GOTO hh
ghhh:
END IF
IF gh2$ = "B" THEN gh = gh + 1


thething$ = thething$ + h$

GOTO con3
END IF

thething$ = thething$ + gh2$

con3:
NEXT gh

stg = LEN(thething$)

stxy = stg \ 2
stxy = FIX(stxy)
doposx = (40 - stxy) + 1
LOCATE , doposx
END IF


IF cole1$ = "F" THEN
gg = gg + 2
aaa$ = LEFT$(toprint$, gg)
aa$ = RIGHT$(aaa$, 2)
d$ = UCASE$(LEFT$(aa$, 1))
IF d$ = "A" THEN d$ = "10"
IF d$ = "B" THEN d$ = "11"
IF d$ = "C" THEN d$ = "12"
IF d$ = "D" THEN d$ = "13"
IF d$ = "E" THEN d$ = "14"
IF d$ = "F" THEN d$ = "15"
e$ = UCASE$(RIGHT$(aa$, 1))
IF e$ = "A" THEN e$ = "10"
IF e$ = "B" THEN e$ = "11"
IF e$ = "C" THEN e$ = "12"
IF e$ = "D" THEN e$ = "13"
IF e$ = "E" THEN e$ = "14"
IF e$ = "F" THEN e$ = "15"
first = VAL(d$)
last = VAL(e$)
g1 = first * 16
b1 = g1 + last
h$ = CHR$(b1)
PRINT h$; SPC(0);
doposx = doposx + 1
END IF


IF cole1$ = "B" THEN
gg = gg + 1
d1$ = LEFT$(toprint$, gg)
c1$ = RIGHT$(d1$, 1)
bg = VAL(c1$)
END IF


IF cole1$ = "K" THEN
COLOR 7, 0
CLS
doposy = 1
doposx = 1
END IF

IF cole1$ = "H" THEN
h$ = STR$(h)
h$ = LTRIM$(RTRIM$(h$))
PRINT h$; SPC(0);
 doposx = doposx + LEN(h$)
END IF

IF cole1$ = "G" THEN
G$ = STR$(s)
G$ = LTRIM$(RTRIM$(G$))
PRINT G$; SPC(0);
 doposx = doposx + LEN(G$)
END IF

IF cole1$ = "E" THEN
G$ = STR$(EXPER)
G$ = LTRIM$(RTRIM$(G$))
PRINT G$; SPC(0);
doposx = doposx + LEN(G$)
END IF

IF cole1$ = "A" THEN
a$ = STR$(w)
a$ = LTRIM$(RTRIM$(a$))
PRINT a$; SPC(0);
doposx = doposx + LEN(a$)
END IF

IF cole1$ = "D" THEN
h$ = STR$(defs)
h$ = LTRIM$(RTRIM$(h$))
PRINT h$; SPC(0);
 doposx = doposx + LEN(h$)
END IF

IF cole1$ = "I" THEN
IF i = 1 THEN G$ = weapon1name$
IF i = 2 THEN G$ = weapon2name$
IF i = 3 THEN G$ = weapon3name$
IF i = 4 THEN G$ = weapon4name$
G$ = LTRIM$(RTRIM$(G$))
PRINT G$; SPC(0);
doposx = doposx + LEN(G$)
END IF

IF cole1$ = "Z" THEN
IF z = 1 THEN G$ = armour1name$
IF z = 2 THEN G$ = armour2name$
IF z = 3 THEN G$ = armour3name$
IF z = 4 THEN G$ = armour4name$
G$ = LTRIM$(RTRIM$(G$))
PRINT G$; SPC(0);
doposx = doposx + LEN(G$)
END IF

IF cole1$ = "V" THEN
variable$ = ""
gd:
gg = gg + 1
d1$ = LEFT$(toprint$, gg)
thething$ = RIGHT$(d1$, 1)
IF thething$ = "`" THEN GOTO doitnow
variable$ = variable$ + thething$
GOTO gd
doitnow:
variable$ = LTRIM$(RTRIM$(variable$))
nus = 1
opende:
IF settings$(nus) = "--END--" THEN GOTO dont
data$ = settings$(nus): nus = nus + 1
IF data$ = "STARTVARIABLE" THEN GOTO opende
IF data$ = variable$ THEN GOTO showit
junk$ = settings$(nus): nus = nus + 1
GOTO opende
showit:
thedata$ = settings$(nus): nus = nus + 1
thedata$ = RTRIM$(LTRIM$(thedata$))
PRINT thedata$; SPC(0);
doposx = doposx + LEN(thedata$)
GOTO dont
dont:
CLOSE #42
END IF


IF pressed = 1 THEN
gdi = gg
END IF
IF pressed = 0 THEN
cgd = gg
END IF

END SUB

SUB endscreen
RANDOMIZE TIMER
color$ = LTRIM$(RTRIM$(STR$(INT(RND * 7) + 1)))
color$ = "`" + color$
printer 1, color$ + "°°°°±±±²²²²`@`b" + RIGHT$(color$, 1) + "                                                          `b0" + color$ + "²²²²±±±°°°°", 1
printer 1, color$ + "°°°°±±`8`b7ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»`b0" + color$ + "±±°°°°", 2
printer 1, color$ + "°°°°±±`8`b7º                                                                  º`b0" + color$ + "±±°°°°", 3
printer 1, color$ + "°°°°±±`8`b7ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´`$Credits`8ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶`b0" + color$ + "±±°°°°", 4
printer 1, color$ + "°°°°±±`8`b7º`^         This game engine was orignally brought to you by     `8    º`b0" + color$ + "±±°°°°", 5
printer 1, color$ + "°°°°±±`8`b7º`^          Author....... at Akori Software, a division of      `8    º`b0" + color$ + "±±°°°°", 6
printer 1, color$ + "°°°°±±`8`b7º`^                      Hollow-Head Software.                   `8    º`b0" + color$ + "±±°°°°", 7
printer 1, color$ + "°°°°±±`8`b7º                                                                  º`b0" + color$ + "±±°°°°", 8
printer 1, color$ + "°°°°±±`8`b7º`^    The game you just played used the Final Quest 2 (tm) engine`8   º`b0" + color$ + "±±°°°°", 9
printer 1, color$ + "°°°°±±`8`b7º`^                               to run.                         `8   º`b0" + color$ + "±±°°°°", 10
printer 1, color$ + "°°°°±±`8`b7º                                                                  º`b0" + color$ + "±±°°°°", 11
printer 1, color$ + "°°°°±±`8`b7º                                                                  º`b0" + color$ + "±±°°°°", 12
printer 1, color$ + "°°°°±±`8`b7ÈÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¼`b0" + color$ + "±±°°°°", 13
printer 1, color$ + "°°°°±±±²²²²`b" + RIGHT$(color$, 1) + "                                                          `b0" + color$ + "²²²²±±±°°°°", 14
printer 1, "`C`^`b7Thank you for playing " + gamename$, 3
printer 1, "`C`^`b7This gameplay brought to you by " + COMP2$ + "...", 12
printer 1, "`C`%`b" + RIGHT$(color$, 1) + version2$ + " " + revision$, 14
END SUB

FUNCTION exist (file$)

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

SUB printer (da, toprint$, doposy)
bg = 0
screenmode = 0
collor = 15
IF da = 3 THEN bg = 1
doposx = 1
FOR gdi = 1 TO LEN(toprint$)
d$ = LEFT$(toprint$, gdi)
letter$ = RIGHT$(d$, 1)

IF letter$ = "`" THEN
gdi = gdi + 1
d1$ = LEFT$(toprint$, gdi)
cole2$ = RIGHT$(d1$, 1)
IF cole2$ = "1" THEN collor = 1
IF cole2$ = "2" THEN collor = 2
IF cole2$ = "3" THEN collor = 3
IF cole2$ = "4" THEN collor = 4
IF cole2$ = "5" THEN collor = 5
IF cole2$ = "6" THEN collor = 6
IF cole2$ = "7" THEN collor = 7
IF cole2$ = "8" THEN collor = 8
IF cole2$ = "9" THEN collor = 9
IF cole2$ = "0" THEN collor = 10
IF cole2$ = "!" THEN collor = 11
IF cole2$ = "@" THEN collor = 12
IF cole2$ = "#" THEN collor = 13
IF cole2$ = "$" THEN collor = 14
IF cole2$ = "%" THEN collor = 15
IF cole2$ = "^" THEN collor = 0

cole2$ = UCASE$(cole2$)

IF cole2$ = "N" THEN
gdi = gdi + 1
aaa$ = LEFT$(toprint$, gdi)
aa$ = RIGHT$(aaa$, 1)
IF aa$ = "!" THEN aa$ = "11"
IF aa$ = "@" THEN aa$ = "12"
IF aa$ = "#" THEN aa$ = "13"
IF aa$ = "$" THEN aa$ = "14"
IF aa$ = "%" THEN aa$ = "15"
IF aa$ = "^" THEN aa$ = "0"
bb = VAL(aa$) + 16
COLOR bb
collor = bb
END IF

COLOR collor, bg

cole 1, toprint$, cole2$
GOTO cone3
END IF


IF doposx >= 81 THEN
doposy = doposy + 1
doposx = 1
END IF

LOCATE doposy, doposx
COLOR collor, bg
PRINT letter$; SPC(0);
IF letter$ = CHR$(10) THEN GOTO cone3
doposx = doposx + 1
cone3:
NEXT gdi
IF da = 1 THEN PRINT
IF da = 3 THEN PRINT
END SUB

SUB setsettings
reenterrg:
INPUT "SCREEN #: ", rg$
IF rg$ = "" THEN GOTO chx
IF FIX(VAL(rg$)) <= 1920 AND FIX(VAL(rg$)) >= 1 THEN GOTO nexter
GOTO reenterrg
nexter:
rp = FIX(VAL(rg$))
chx:
INPUT "INPUT X-CRT:", xg$
IF xg$ = "" THEN GOTO chy1
xg = VAL(xg$)
FOR bbbk = 1 TO 79
IF xg = bbbk THEN GOTO chy:
NEXT bbbk
GOTO chx
chy:
x = xg
chy1:
INPUT "INPUT Y-CRT:", yg$
yg = VAL(yg$)
IF yg$ = "" THEN GOTO chy12
FOR bbbk = 1 TO 22
IF yg = bbbk THEN GOTO ccccc
NEXT bbbk
GOTO chy
ccccc:
y = yg
chy12:
dkdk = y - 1
record = dkdk * 79 + x
INPUT "INPUT Experience:", exi$
IF exi$ = "" THEN GOTO ste1
hi = VAL(exi$)
EXPER = hi
ste1:
INPUT "INPUT Hitpoints:", hi$
IF hi$ = "" THEN GOTO ste
hi = VAL(hi$)
h = hi
ste:
INPUT "INPUT Strength:", wi$
IF wi$ = "" THEN GOTO defsg
wi = VAL(wi$)
w = wi
defsg:
INPUT "INPUT Defense:", defsi$
IF defsi$ = "" THEN GOTO sgg
defsi = VAL(defsi$)
defs = defsi
sgg:
INPUT "INPUT Gold:", si$
IF si$ = "" THEN GOTO cha
si = VAL(si$)
s = si
cha:
INPUT "INPUT Armour(1-4):", zi$
IF zi$ = "" THEN GOTO chw
zi = VAL(zi$)
z = zi
IF zi > 4 THEN GOTO cha
IF zi < 1 THEN GOTO cha
chw:
INPUT "INPUT Weapon(1-4):", iz$
IF iz$ = "" THEN GOTO monst
iz = VAL(iz$)
i = iz
IF iz > 4 THEN GOTO chw
IF iz < 1 THEN GOTO chw
monst:
PRINT "INPUT Monsters(Y/N):"
monster$ = INPUT$(1)
monster$ = UCASE$(monster$)
IF monster$ = "Y" THEN monsters$ = "YES"
IF monster$ = "N" THEN monsters$ = "NO"

END SUB

FUNCTION VOB$ (dtlf$)
VOB = ""
nus = 1
eof4:
IF settings$(nus) = "--END--" THEN GOTO donewithfunc
whatif3$ = settings$(nus): nus = nus + 1
IF whatif3$ = "STARTVARIABLE" THEN GOTO eof4
IF dtlf$ = whatif3$ THEN
whatequal1$ = settings$(nus): nus = nus + 1
VOB$ = whatequal1$
GOTO donewithfunc
END IF
GOTO eof4
donewithfunc:
END FUNCTION

SUB writer (towrite$)
collor = 15
doposx = 1
bg = 1

COLOR 15, 1
LOCATE 23, 3
PRINT STRING$(77, 32); SPC(0);
COLOR 1, 0
LOCATE 23, 1
PRINT CHR$(176) + CHR$(177); SPC(0);
LOCATE 23, 78
PRINT CHR$(177) + CHR$(176); SPC(0);

FOR cgd = 1 TO LEN(towrite$)
d$ = LEFT$(towrite$, cgd)
letter$ = RIGHT$(d$, 1)

IF letter$ = "`" THEN
cgd = cgd + 1
d1$ = LEFT$(towrite$, cgd)
cole4$ = RIGHT$(d1$, 1)
IF cole4$ = "1" THEN collor = 1
IF cole4$ = "2" THEN collor = 2
IF cole4$ = "3" THEN collor = 3
IF cole4$ = "4" THEN collor = 4
IF cole4$ = "5" THEN collor = 5
IF cole4$ = "6" THEN collor = 6
IF cole4$ = "7" THEN collor = 7
IF cole4$ = "8" THEN collor = 8
IF cole4$ = "9" THEN collor = 9
IF cole4$ = "0" THEN collor = 10
IF cole4$ = "!" THEN collor = 11
IF cole4$ = "@" THEN collor = 12
IF cole4$ = "#" THEN collor = 13
IF cole4$ = "$" THEN collor = 14
IF cole4$ = "%" THEN collor = 15
IF cole4$ = "^" THEN collor = 0

IF cole4$ = "N" THEN
cgd = cgd + 1
aaa$ = LEFT$(toprint$, cgd)
aa$ = RIGHT$(aaa$, 1)
IF aa$ = "!" THEN aa$ = "11"
IF aa$ = "@" THEN aa$ = "12"
IF aa$ = "#" THEN aa$ = "13"
IF aa$ = "$" THEN aa$ = "14"
IF aa$ = "%" THEN aa$ = "15"
IF aa$ = "^" THEN aa$ = "0"
bb = VAL(aa$) + 16
COLOR bb
collor = bb
END IF


cole 0, towrite$, cole4$
GOTO cone2
END IF


COLOR collor, bg
LOCATE 23, doposx
PRINT letter$; SPC(0);
doposx = doposx + 1
cone2:
NEXT cgd
bg = 0
END SUB

