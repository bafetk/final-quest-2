DECLARE FUNCTION LoadGame$ ()
DECLARE FUNCTION SaveGame$ ()
DECLARE FUNCTION SecretCode$ (code$)
DECLARE FUNCTION MonsterFunction! (monsb$, monsmn$, tosay$, m$, togetscore$, expertoget$)
DECLARE FUNCTION crypt$ (tocrypt$)
DECLARE FUNCTION inputer$ (screener)
DECLARE FUNCTION exist! (file$)
DECLARE FUNCTION VOB$ (dtlf$)
DECLARE SUB setsettings ()
DECLARE SUB cole (pressed, toprint$, cole1$, fground, bground)
DECLARE SUB endscreen ()
DECLARE SUB printer (da, towrite$, jack)
DECLARE SUB writer (towrite$)


DIM ReferenceArray$(1200)
DIM realsavename$(75)
DIM map(1920)
DIM map2(1920)
DIM opt(100)
DIM SHARED settings$(500), reffile(1920), file$(5)
COMMON SHARED opt(), map2(), realsavename$(), ReferenceArray$(), map(), settings$(), reffile(), file$()
COMMON SHARED doposx, doposy, gamename$, Revision$, Version1$, Version2$, COMP1$, COMP2$, h, S, w, defs, I, z, gdi
COMMON SHARED exper, k, x, y, monsters$, hitmax, Ber, jdcolor, cb562, cgd, bg, rp, refpos, fileopened, thescreen1, theg

SUB cole (pressed, toprint$, cole1$, fground, bground)


IF pressed = 1 THEN
gg = gdi
END IF
IF pressed = 0 THEN
gg = cgd
END IF

cole1$ = UCASE$(cole1$)

IF cole1$ = "?" THEN
PRINT Version2$ + " " + Revision$
doposx = doposx + LEN(Version2$) + 1 + LEN(Revision$)
END IF

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


IF gh2$ = "?" THEN h$ = Version2$ + " " + Revision$
IF gh2$ = "F" THEN gh = gh + 2
IF gh2$ = "Y" THEN gh = gh + 2
IF gh2$ = "X" THEN gh = gh + 2
IF gh2$ = "H" THEN h$ = LTRIM$(STR$(h))

IF gh2$ = "E" THEN h$ = LTRIM$(STR$(exper))
IF gh2$ = "G" THEN h$ = LTRIM$(STR$(g))
IF gh2$ = "A" THEN h$ = LTRIM$(STR$(w))
IF gh2$ = "D" THEN h$ = LTRIM$(STR$(defs))
'IF gh2$ = "I" THEN
'IF I = 1 THEN h$ = weapon1name$
'IF I = 2 THEN h$ = weapon2name$
'IF I = 3 THEN h$ = weapon3name$
'IF I = 4 THEN h$ = weapon4name$
'END IF
'IF gh2$ = "Z" THEN
'IF z = 1 THEN h$ = armour1name$
'IF z = 2 THEN h$ = armour2name$
'IF z = 3 THEN h$ = armour3name$
'IF z = 4 THEN h$ = armour4name$
'END IF
IF gh2$ = "V" THEN
crapdata$ = ""
hh:
gh1$ = LEFT$(toprint$, gh)
ghb$ = RIGHT$(gh1$, 1)
IF ghb$ = "`" THEN
        GOTO ghhh
        END IF
crapdata$ = crapdata$ + ghb$
gh = gh + 1
GOTO hh
ghhh:
crapdata$ = RIGHT$(crapdata$, LEN(crapdata$) - 1)
nus = 1
DO
vs$ = settings$(nus): nus = nus + 1
vsdata$ = settings$(nus): nus = nus + 1
IF vs$ = "--END--" THEN
        h$ = ""
        EXIT DO
        END IF

IF UCASE$(vs$) = UCASE$(crapdata$) THEN
        h$ = LTRIM$(vsdata$)
        EXIT DO
        END IF
LOOP

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
E$ = UCASE$(RIGHT$(aa$, 1))
IF E$ = "A" THEN E$ = "10"
IF E$ = "B" THEN E$ = "11"
IF E$ = "C" THEN E$ = "12"
IF E$ = "D" THEN E$ = "13"
IF E$ = "E" THEN E$ = "14"
IF E$ = "F" THEN E$ = "15"
first = VAL(d$)
last = VAL(E$)
g1 = first * 16
b1 = g1 + last
h$ = CHR$(b1)
COLOR fground, bground
PRINT h$; SPC(0);
doposx = doposx + 1
END IF


IF cole1$ = "B" THEN
gg = gg + 1
d1$ = LEFT$(toprint$, gg)
c1$ = RIGHT$(d1$, 1)
bg = VAL(c1$)
Ber = 1
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
g$ = STR$(S)
g$ = LTRIM$(RTRIM$(g$))
PRINT g$; SPC(0);
 doposx = doposx + LEN(g$)
END IF

IF cole1$ = "E" THEN
g$ = STR$(exper)
g$ = LTRIM$(RTRIM$(g$))
PRINT g$; SPC(0);
doposx = doposx + LEN(g$)
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
nus = 1
        DO
        a$ = settings$(nus): nus = nus + 1
        IF a$ = "--END--" THEN
                PRINT "Nothing"; SPC(0);
                doposx = doposx + 7
                EXIT DO
                END IF
        IF a$ = "WEAPONNAME" THEN
                b$ = settings$(nus)
                PRINT b$
                'END
                doposx = doposx + LEN(b$)
                EXIT DO
                END IF
        nus = nus + 1
        LOOP
END IF

IF cole1$ = "Z" THEN
nus = 1
        DO
        a$ = settings$(nus): nus = nus + 1
        IF a$ = "--END--" THEN
                PRINT "Nothing"; SPC(0);
                doposx = doposx + 7
                EXIT DO
                END IF
        IF a$ = "ARMOURNAME" THEN
                b$ = settings$(nus)
                PRINT b$
                doposx = doposx + LEN(b$)
                EXIT DO
                END IF
        nus = nus + 1
        LOOP
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

FUNCTION crypt$ (tocrypt$)

gs$ = ""
FOR ggs = 1 TO LEN(tocrypt$)
gsb$ = RIGHT$(LEFT$(tocrypt$, ggs), 1)


asd = ASC(gsb$)
asv = -(asd - 255)
gs$ = gs$ + CHR$(asv)

NEXT ggs

crypt$ = gs$

END FUNCTION

SUB endscreen
RANDOMIZE TIMER
color$ = "`" + LTRIM$(RTRIM$(STR$(INT(RND * 7) + 1)))
printer 1, color$ + "°°°°±±±²²²²`@`b" + RIGHT$(color$, 1) + "                                                          `b0" + color$ + "²²²²±±±°°°°", 1
printer 1, color$ + "°°°°±±`8`b7ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ»`b0" + color$ + "±±°°°°", 2
printer 1, color$ + "°°°°±±`8`b7º                                                                  º`b0" + color$ + "±±°°°°", 3
printer 1, color$ + "°°°°±±`8`b7ÇÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ´`$Credits`8ÃÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¶`b0" + color$ + "±±°°°°", 4
printer 1, color$ + "°°°°±±`8`b7º`^        This game engine was originally brought to you by     `8    º`b0" + color$ + "±±°°°°", 5
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
printer 1, "`C`%`b" + RIGHT$(color$, 1) + Version2$ + " " + Revision$, 14
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

SUB Help
COLOR 7, 0: CLS
refpos = 1
findit13:
data$ = inputer(0)
        IF data$ = "--EOF--" THEN
                        PRINT
                        PRINT "The following error was detected... Cannot find @#HELP in REF file."
                        PRINT
                        CLOSE #8: COLOR 7, 0: END
                        END IF
        IF LEFT$(data$, 6) = "@#HELP" THEN
                k = 1
                GOTO invscr4
        END IF
GOTO findit13
invscr4:
iner1$ = inputer$(0)
        IF iner1$ = "@END" THEN GOTO waiter6
        IF iner1$ = "@NEXT" THEN GOTO nexter52
                printer 0, iner1$, k
                k = k + 1
        GOTO invscr4
waiter6:
        LOCATE 1, 1, 0
        I$ = INPUT$(1)
        GOTO done65
nexter52:
        LOCATE 1, 1, 0
        I$ = INPUT$(1)
GOTO invscr4
done65:
END SUB

FUNCTION inputer$ (screener)

IF fileopened = 0 THEN OPEN "refs.dat" FOR BINARY AS #13
fileopened = 1

'IF monsters$ = "YES" THEN END
jk = 0
data$ = ""
IF screener <> 0 THEN refpos = reffile(screener)
'IF screener <> 0 THEN PRINT refpos: END
IF refpos = 0 THEN GOTO nothing323
DO
IF refpos + jk > LOF(13) THEN GOTO nothing323
ag$ = SPACE$(80)
IF refpos + jk + 80 > LOF(13) THEN
ag$ = SPACE$(LOF(13) - (refpos + jk))
END IF

GET #13, refpos + jk, ag$

IF INSTR(ag$, CHR$(13)) THEN
        ag1$ = LEFT$(ag$, INSTR(ag$, CHR$(13)) - 1)
        data$ = data$ + ag1$
        jk = jk + (INSTR(ag$, CHR$(13)) - 1)
        GOTO nothing32
        END IF

jk = jk + 80
data$ = data$ + ag$
LOOP
GOTO nothing32
nothing323:
data$ = "--EOF--"
refpos = 1: jk = -2
nothing32:
'CLOSE #13
refpos = refpos + jk + 2
inputer$ = LTRIM$(RTRIM$(data$))
END FUNCTION

FUNCTION LoadGame$
Null$ = CHR$(0)
CLS : op = 1
COLOR 10, 0: LOCATE 9, 30: PRINT "Load a Game..."
COLOR 4, 0: LOCATE 17, 30: PRINT "Enter a Choice."
loadgame1:
COLOR 2, 0

FOR gsx = 11 TO 15
        LOCATE gsx, 30: PRINT realsavename$(gsx - 10) + "..."
NEXT gsx

COLOR 15, 0

LOCATE op + 10, 30: PRINT realsavename$(op) + "..."

DO
        docheck$ = INKEY$
LOOP WHILE docheck$ = ""

SELECT CASE docheck$

        CASE CHR$(27)
                LoadGame$ = "2"
                EXIT FUNCTION
               'GOTO load
 
        CASE CHR$(13)
                IF op >= 1 AND op <= 5 THEN GOTO gameload1
                LoadGame$ = "2"
                EXIT FUNCTION
                'GOTO load

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
OPEN "SAVE" + op$ + ".DAT" FOR BINARY AS #2

savename$ = SPACE$(15)
monsters5$ = SPACE$(1)
exper$ = SPACE$(8)
S$ = SPACE$(8)
h$ = SPACE$(8)
x$ = SPACE$(8)
y$ = SPACE$(8)
w$ = SPACE$(8)
record$ = SPACE$(8)
rp$ = SPACE$(8)
defs$ = SPACE$(8)
hitmax$ = SPACE$(8)

GET #2, 1, savename$
GET #2, 16, exper$
GET #2, 24, S$
GET #2, 32, h$
GET #2, 40, x$
GET #2, 48, y$
GET #2, 56, w$
GET #2, 64, record$
GET #2, 72, rp$
GET #2, 80, defs$
GET #2, 88, monsters5$
GET #2, 89, hitmax$

filespace = 98
numrecords$ = SPACE$(1)
GET #2, 97, numrecords$
numrecords = ASC(crypt$(numrecords$))



xb = 0
nus = 1
conte5:
        IF xb = numrecords THEN GOTO done1
        chra$ = SPACE$(1)
                GET #2, filespace, chra$
                        abx = ASC(crypt$(chra$))
                        filespace = filespace + 1
        cbx$ = SPACE$(abx)
                GET #2, filespace, cbx$
                        settings$(nus) = crypt$(cbx$): nus = nus + 1
                        filespace = filespace + abx
        data$ = SPACE$(1)
                GET #2, filespace, data$
                        filespace = filespace + 1
        data3$ = SPACE$(ASC(crypt$(data$)))
                GET #2, filespace, data3$
                filespace = filespace + LEN(data3$)
                settings$(nus) = crypt$(data3$): nus = nus + 1
        xb = xb + 1
GOTO conte5

done1:
settings$(nus) = "--END--": nus = nus + 1
exper = CVD(crypt$(exper$))
S = CVD(crypt$(S$))
h = CVD(crypt$(h$))
x = CVD(crypt$(x$))
y = CVD(crypt$(y$))
w = CVD(crypt$(w$))
record = CVD(crypt$(record$))
rp = CVD(crypt$(rp$))
defs = CVD(crypt$(defs$))
monsters5$ = crypt$(monsters5$)
hitmax = CVD(crypt$(hitmax$))


IF monsters5$ = "1" THEN monsters$ = "YES"
IF monsters5$ = "0" THEN monsters$ = "NO"

CLOSE #2
LoadGame$ = "1"

END FUNCTION

FUNCTION MonsterFunction (monsb$, monsmn$, tosay1$, m1$, togetscore$, expertoget$)
Null$ = CHR$(0)
MonsterFunction = 0
monster76 = 0
IF monsb$ <> "" THEN
        b = VAL(monsb$)
        monster76 = 1
        END IF
IF monsmn$ <> "" THEN
mn = VAL(monsmn$)
monster76 = 1
        END IF
IF tosay1$ <> "" THEN
tosay$ = tosay1$
monster76 = 1
        END IF
IF m1$ <> "" THEN
m$ = m1$
monster76 = 1
        END IF
IF togetscore$ <> "" THEN
togetscore = VAL(togetscore$)
monster76 = 1
        END IF
IF expertoget$ <> "" THEN
expertoget = VAL(expertoget$)
monster76 = 1
        END IF
IF monster76 = 1 THEN GOTO monster



OPEN "NOSCR.DAT" FOR INPUT AS #62
INPUT #62, firstanswer$
        IF monsters$ = "YES" THEN GOTO ghb
        IF LTRIM$(UCASE$(firstanswer$)) = "NO" THEN
                monsters$ = "NO"
                CLOSE #62
                MonsterFunction = 1
                GOTO Exitmonster
        END IF
ghb:
IF othervalues <> 0 THEN GOTO othervalues
INPUT #62, newrp$
IF newrp$ = "// END VALUES //" THEN GOTO mon5
IF INSTR(newrp$, ";") <> 0 THEN
othervalues = 1
othervalues:
        IF INSTR(newrp$, ";") = 0 THEN
                othervalues = 0
                GOTO ghb
                END IF
        newrp = VAL(LEFT$(newrp$, INSTR(newrp$, ";") - 1)): newrp$ = RIGHT$(newrp$, LEN(newrp$) - INSTR(newrp$, ";"))
        'PRINT newrp: I$ = INPUT$(1)
        GOTO gx2
        END IF
newrp = VAL(newrp$)

gx2:
        IF newrp = rp THEN
                CLOSE #62
                MonsterFunction = 1
                GOTO Exitmonster
        END IF
GOTO ghb

mon5:
IF monsters$ = "NO" THEN
                CLOSE #62
                MonsterFunction = 1
                GOTO Exitmonster
        END IF
theg = 50
INPUT #62, nummonsters
INPUT #62, numifscores
INPUT #62, chance
        RANDOMIZE TIMER
                r = INT(RND * chance) + 1
                IF r = 5 THEN GOTO enemy
CLOSE #62
MonsterFunction = 1
GOTO Exitmonster
enemy:
FOR gdc = 1 TO numifscores
        RANDOMIZE TIMER
        INPUT #62, ifscore
        INPUT #62, monrand

        IF exper < ifscore THEN
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



LOCATE 24, 1: COLOR 14, 0
PRINT STRING$(80, " "); SPC(0);
printer 0, tosay$, 24

COLOR 14, 0

g = INT(RND * 2) + 1
        IF g = 1 THEN GOTO m1hitf

m1fight:
COLOR 14, 1: o = 1
hitpointer:
LOCATE 23, 1: COLOR 14, 1
PRINT STRING$(79, " "); SPC(0);
LOCATE 23, 1
PRINT "Your Hitpoints - ("; LTRIM$(STR$(h)); "/"; LTRIM$(STR$(hitmax)); ") "; m$; "'s hitpoints - ("; LTRIM$(STR$(b)); "/"; LTRIM$(STR$(monstermax)); ")"; SPC(0);

IF o = 1 THEN
        LOCATE 25, 1
        COLOR 15, 1: PRINT "Attack"; SPC(0);
        COLOR 15, 0: PRINT "  Run for it "; SPC(0);
END IF
IF o = 2 THEN
        LOCATE 25, 1
        COLOR 15, 0: PRINT "Attack  "; SPC(0);
        COLOR 15, 1: PRINT "Run for it"; SPC(0);
        COLOR 15, 0: PRINT " "; SPC(0);
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
                        COLOR 7, 0
                        LOCATE 25, 1: PRINT STRING$(80, " "); SPC(0);
                        LOCATE 24, 1: PRINT STRING$(80, " "); SPC(0);
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
COLOR 7, 0
LOCATE 25, 1: PRINT STRING$(80, " "); SPC(0);
LOCATE 24, 1: PRINT STRING$(80, " "); SPC(0);

IF monster76 = 1 THEN
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
MonsterFunction = 2
GOTO Exitmonster
END IF

MonsterFunction = 3
GOTO Exitmonster

m1hitsyou:
COLOR 15, 0
LOCATE 24, 1: PRINT STRING$(80, " "); SPC(0);
LOCATE 24, 1
PRINT "As you attempt to leave, "; m$; " sees you and attacks!"; SPC(0);
GOTO m1hitf

attackm1:
nus = 1
DO
I$ = settings$(nus): nus = nus + 1
IF I$ = "--END--" THEN
        weapon = 0
        EXIT DO
        END IF
IF I$ = "WEAPONPOWER" THEN
        I$ = settings$(nus): nus = nus + 1
        weaponpower = VAL(I$)
        weapon = 1
        EXIT DO
        END IF
I$ = settings$(nus): nus = nus + 1
LOOP

RANDOMIZE TIMER
IF weapon = 0 THEN a = INT(RND * 10) + 1
IF weapon <> 0 AND weaponpower > 36 THEN a = INT(RND * FIX((weaponpower / 6))) + 1
IF weapon <> 0 AND weaponpower < 37 THEN a = INT(RND * FIX((weaponpower / 2)))
IF weapon <> 0 THEN gx = INT(RND * 2) + 1
IF gx = 1 AND weapon <> 0 THEN xc = a + weaponpower
IF weapon <> 0 AND gx <> 1 THEN xc = weaponpower - a
IF weapon <> 0 THEN a = xc

'IF Weapon = 1 THEN a = a + weaponpower

'PRINT weaponpower; weapon, a: END

'IF I = 1 THEN a = INT(RND * 10) + 1
'IF I = 2 THEN a = INT(RND * 20) + 1
'IF I = 3 THEN a = INT(RND * 35) + 1
'IF I = 4 THEN a = INT(RND * 50) + 1
'a = a + w
'IF I = 1 THEN a = a + weapon1power
'IF I = 2 THEN a = a + weapon2power
'IF I = 3 THEN a = a + weapon3power
'IF I = 4 THEN a = a + weapon4power
b = b - a

IF superhuman$ = "YES" THEN
        b = b - (a * superminus)
END IF

COLOR 7, 0
LOCATE 24, 1: PRINT STRING$(80, " "); SPC(0);
LOCATE 24, 1
IF superhuman$ = "YES" THEN
        IF b > 0 THEN PRINT "You hit "; m$; " for"; a * superminus; "points damage."; SPC(0);
        IF b < 1 THEN PRINT "You hit "; m$; " for"; a * superminus; "points damage.  Press any key..."; SPC(0);
        GOTO consL
END IF
IF b > 0 THEN PRINT "You hit "; m$; " for"; a; "points damage."; SPC(0);
IF b < 1 THEN PRINT "You hit "; m$; " for"; a; "points damage.  Press any key..."; SPC(0);
consL:
        COLOR 14, 1
        LOCATE 23, 1: PRINT STRING$(79, " "); SPC(0);
        LOCATE 23, 1
        PRINT "Your Hitpoints - ("; LTRIM$(STR$(h)); "/"; LTRIM$(STR$(hitmax)); ") "; m$; "'s hitpoints - ("; LTRIM$(STR$(b)); "/"; LTRIM$(STR$(monstermax)); ")"; SPC(0);
        IF b < 1 THEN
                COLOR 14, 1
                LOCATE 23, 1: PRINT STRING$(79, " "); SPC(0);
                LOCATE 23, 1
                PRINT "Your Hitpoints - ("; LTRIM$(STR$(h)); "/"; LTRIM$(STR$(hitmax)); ") "; m$; "'s hitpoints - "; SPC(0);
                COLOR 4, 1
                PRINT "Dead"; SPC(0);
        END IF
        IF b < 1 THEN S = S + togetscore
        IF b < 1 THEN exper = exper + expertoget
        IF b < 1 THEN I$ = INPUT$(1)
        IF b < 1 THEN
        COLOR 7, 0
        LOCATE 24, 1: PRINT STRING$(80, " "); SPC(0);
        LOCATE 25, 1: PRINT STRING$(80, " "); SPC(0);
        togetscore3$ = LTRIM$(STR$(togetscore))
        expertoget$ = LTRIM$(STR$(expertoget))
        togetscore4$ = "`2You killed `@" + m$ + "`2!  You find `$$" + togetscore3$ + " `2Gold and get `%" + expertoget$ + "`2 Experience.."
        printer 0, togetscore4$, 24
        I$ = INPUT$(1)
END IF
IF b < 1 THEN
        COLOR 7, 0
        LOCATE 24, 1: PRINT STRING$(80, " "); SPC(0);
        LOCATE 25, 1: PRINT STRING$(80, " "); SPC(0);
END IF

IF b < 1 AND monster76 = 1 THEN
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
                GOTO endnext131
       
        END IF
        GOTO eofer131
endnext131:
        IF cb562 = 5 THEN GOTO nex611
                settings$(nus) = toset$: nus = nus + 1
                settings$(nus) = tosetto$: nus = nus + 1
                settings$(nus) = "--END--"
nex611:
CLOSE #5, #68, #66, #67, #69, #222, #234
MonsterFunction = 2
GOTO Exitmonster
END IF
    

IF b < 1 THEN
        MonsterFunction = 3
        GOTO Exitmonster
        END IF
GOTO m1hitf

m1hitf:
COLOR 14, 0

nus = 1
DO
I$ = settings$(nus): nus = nus + 1
IF I$ = "--END--" THEN
        armour = 0
        EXIT DO
        END IF
IF I$ = "ARMOURPOWER" THEN
        I$ = settings$(nus): nus = nus + 1
        armourpower = VAL(I$)
        armour = 1
        EXIT DO
        END IF
I$ = settings$(nus): nus = nus + 1
LOOP

'IF armour = 1 THEN a = INT(RND * FIX(armourpower / 10)) + 1
'IF armour = 0 THEN
a = INT(RND * 5) + 1

t = mn

IF armour = 1 THEN
        gx = INT(RND * FIX(armourpower / 6)) + 1
        bx = INT(RND * 2) + 1
        IF bx = 1 THEN t = t + gx
        IF bx <> 1 THEN t = t - gx
        t = t - armourpower
        END IF


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

        COLOR 7, 0
        LOCATE 25, 1: PRINT STRING$(80, " "); SPC(0);
        LOCATE 25, 1
PRINT ; m$; " hits you for"; t; "points damage. Hit Enter..."; SPC(0);
        LOCATE 23, 1, 0
        COLOR 14, 1
        PRINT STRING$(79, " "); SPC(0);
        LOCATE 23, 1, 0
PRINT "Your Hitpoints - ("; LTRIM$(STR$(h)); "/"; LTRIM$(STR$(hitmax)); ") "; m$; "'s hitpoints - ("; LTRIM$(STR$(b)); "/"; LTRIM$(STR$(monstermax)); ")"; SPC(0);

wedlsdjkf$ = INPUT$(1)
IF wedlsdjkf$ <> CHR$(13) THEN GOTO bbcc
COLOR 7, 0
        LOCATE 25, 1, 1: PRINT STRING$(80, " "); SPC(0);
        LOCATE 24, 1: PRINT STRING$(80, " "); SPC(0);
        LOCATE 24, 1
IF h <= 0 THEN GOTO fordead
GOTO m1fight
fordead:
COLOR 14, 1
        LOCATE 23, 1: PRINT STRING$(79, " "); SPC(0);
        LOCATE 23, 1
PRINT "You are deafeated... You Gold and Experience have been lowered unfortunatly.."; SPC(0);
exper1 = FIX(exper / 10)
exper = exper - exper1
IF exper < 0 THEN exper = 0
S = 0
h = 10
I$ = INPUT$(1)

        COLOR 7, 0
        LOCATE 25, 1: PRINT STRING$(80, " "); SPC(0);
        LOCATE 24, 1: PRINT STRING$(80, " "); SPC(0);

IF monster76 = 1 THEN
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
MonsterFunction = 2
GOTO Exitmonster
END IF


Exitmonster:
END FUNCTION

SUB printer (da, toprint$, jack)
IF jack <> 1000 THEN doposy = jack
bg = 0
screenmode = 0
collor = 15
IF da = 3 THEN bg = 1
IF doposy > 25 THEN doposy = 1
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
IF doposy > 25 THEN doposy = 1

bg1 = bg

IF Ber = 0 AND jdcolor <> 1 THEN
        xx = SCREEN(doposy, doposx, 1)
        bg1 = FIX(xx / 16)
        END IF

cole 1, toprint$, cole2$, collor, bg1
GOTO cone3
END IF


IF doposx >= 81 THEN
doposy = doposy + 1
doposx = 1
END IF

LOCATE doposy, doposx
IF Ber = 0 AND jdcolor <> 1 THEN
        xx = SCREEN(doposy, doposx, 1)
        bg = FIX(xx / 16)
        END IF
COLOR collor, bg
PRINT letter$; SPC(0);
IF letter$ = CHR$(10) THEN GOTO cone3
doposx = doposx + 1
cone3:
NEXT gdi
IF da = 1 THEN PRINT
IF da = 3 THEN PRINT
'PRINT
Ber = 0
END SUB

FUNCTION SaveGame$
Null$ = CHR$(0)
CLS
ooo = 1
COLOR 10, 0: LOCATE 9, 30: PRINT "Save a Game..."
COLOR 4, 0: LOCATE 17, 30: PRINT "Enter a Choice."
savegame1:
COLOR 2, 0

FOR gsx = 11 TO 15
        LOCATE gsx, 30: PRINT realsavename$(gsx - 10) + "..."
NEXT gsx
COLOR 15, 0
LOCATE ooo + 10, 30: PRINT realsavename$(ooo) + "..."

DO
        check$ = INKEY$
LOOP WHILE check$ = ""

        SELECT CASE check$
      
        CASE CHR$(27)
                CLS
                SaveGame$ = "2"
                EXIT FUNCTION
                'GOTO load
      
        CASE CHR$(13)
                IF ooo >= 1 AND ooo <= 5 THEN GOTO overwrite1
                SaveGame$ = "2"
                EXIT FUNCTION
                'GOTO load
      
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
saveover = 1
GOTO saveover1go

overwrite1:
IF file$(ooo) = "1" THEN GOTO zz

GOTO saveover1
zz:
LOCATE 1, 1: COLOR 2, 0

PRINT "Overwrite Existing Saved Game? Y/N"
        I$ = INPUT$(1)
        I$ = UCASE$(I$)
                IF I$ = "Y" THEN pkd = 6
                IF I$ = "Y" THEN GOTO saveover1
SaveGame$ = "3"
EXIT FUNCTION
'GOTO savegame11

saveover1notexist:
saveover1go:
CLS : COLOR 10, 0: LOCATE 9, 30: PRINT "Save a Game..."
COLOR 4, 0: LOCATE 17, 30: PRINT "Enter a Choice."
COLOR 2, 0

FOR gsx = 11 TO 15
IF ooo <> gsx - 10 THEN
        LOCATE gsx, 30: PRINT realsavename$(gsx - 10) + "..."
        END IF
NEXT gsx

LOCATE ooo + 10, 30

savename$ = ""
IF saveover = 1 THEN
        saveover = 0
        savename$ = realsavename$(ooo)
        END IF

COLOR 15, 0: LOCATE ooo + 10, 30: PRINT savename$; SPC(0);

wordenter:

DO
        COLOR 15, 0: LOCATE , , 1, 6, 7
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
realsavename$(ooo) = savename$

SHELL "IF EXIST SAVE" + LTRIM$(STR$(ooo)) + ".DAT DEL SAVE" + LTRIM$(STR$(ooo)) + ".DAT"

ooo$ = LTRIM$(RTRIM$(STR$(ooo - 1)))
OPEN "SAVE" + ooo$ + ".DAT" FOR BINARY AS #2
IF monsters$ = "YES" THEN monsters5$ = "1"
IF monsters$ = "NO" THEN monsters5$ = "0"

exper$ = crypt$(MKD$(exper))
S$ = crypt$(MKD$(S))
h$ = crypt$(MKD$(h))
x$ = crypt$(MKD$(x))
y$ = crypt$(MKD$(y))
w$ = crypt$(MKD$(w))
record$ = crypt$(MKD$(record))
rp$ = crypt$(MKD$(rp))
defs$ = crypt$(MKD$(defs))
monsters5$ = crypt$(monsters5$)
hitmax$ = crypt$(MKD$(hitmax))

toput$ = crypt$(savename$ + STRING$(15 - LEN(savename$), " "))
PUT #2, 1, toput$
PUT #2, 16, exper$
PUT #2, 24, S$
PUT #2, 32, h$
PUT #2, 40, x$
PUT #2, 48, y$
PUT #2, 56, w$
PUT #2, 64, record$
PUT #2, 72, rp$
PUT #2, 80, defs$
PUT #2, 88, monsters5$
PUT #2, 89, hitmax$

records = 0
nus = 1
nexter4:
IF settings$(nus) = "--END--" THEN GOTO nexter5
nus = nus + 1
records = records + 1
GOTO nexter4

nexter5:


nus = 1
records$ = crypt$(CHR$(records))


PUT #2, 97, records$

filespace = 98

nnx = 0
continue:
IF nnx = records THEN GOTO done
data$ = crypt$(RTRIM$(LTRIM$(settings$(nus)))): nus = nus + 1
data1$ = crypt$(settings$(nus)): nus = nus + 1
xb$ = crypt$(LTRIM$(CHR$(LEN(data$))))
xb1$ = crypt$(LTRIM$(CHR$(LEN(data1$))))
PUT #2, filespace, xb$
filespace = filespace + 1
PUT #2, filespace, data$
filespace = filespace + ASC(crypt$(xb$))
PUT #2, filespace, xb1$
filespace = filespace + 1
PUT #2, filespace, data1$
filespace = filespace + ASC(crypt$(xb1$))
nnx = nnx + 1
GOTO continue

done:

CLOSE #2

file$(ooo) = "1"

SaveGame$ = "1"

END FUNCTION

FUNCTION SecretCode$ (code$)
thecodenow$ = ""
LOCATE y, x
code$ = UCASE$(code$)
FOR code = 1 TO LEN(code$)
        letternow$ = MID$(code$, code, 1)
                userinput$ = UCASE$(INPUT$(1))
                        IF userinput$ <> letternow$ THEN
                                SecretCode$ = userinput$
                                EXIT FUNCTION
                        END IF
                        IF code = LEN(code$) AND userinput$ = letternow$ THEN
                                SecretCode$ = "!!"
                                EXIT FUNCTION
                        END IF
NEXT code
END FUNCTION

SUB setsettings
reenterrg:
INPUT "SCREEN #: ", rg$
IF rg$ = "" THEN GOTO chx
IF FIX(VAL(rg$)) <= 1920 AND FIX(VAL(rg$)) >= 1 THEN GOTO nexter
GOTO reenterrg
nexter:
thescreen = FIX(VAL(rg$))
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
exper = hi
ste1:
INPUT "INPUT Hitpoints:", hi$
IF hi$ = "" THEN GOTO ste
hi = VAL(hi$)
h = hi
ste:
INPUT "INPUT Max Hitpoints:", gs$
IF gs$ = "" THEN GOTO svs
hitmax = VAL(gs$)
svs:
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
S = si
cha:
'INPUT "INPUT Armour(1-4):", zi$
'IF zi$ = "" THEN GOTO chw
'zi = VAL(zi$)
'z = zi
'IF zi > 4 THEN GOTO cha
'IF zi < 1 THEN GOTO cha
'chw:
'INPUT "INPUT Weapon(1-4):", iz$
'IF iz$ = "" THEN GOTO monst
'iz = VAL(iz$)
'I = iz
'IF iz > 4 THEN GOTO chw
'IF iz < 1 THEN GOTO chw
'monst:
PRINT "INPUT Monsters(Y/N):"; SPC(0);
monster$ = INPUT$(1)
monster$ = UCASE$(monster$)
IF monster$ = "Y" THEN monsters$ = "YES"
IF monster$ = "N" THEN monsters$ = "NO"
thescreen1 = rp
PRINT
nus = 1
DO
bx$ = settings$(nus): nus = nus + 1
IF bx$ = "--END--" THEN EXIT DO

IF bx$ = "MAXENERGY" THEN settings$(nus) = STR$(hitmax)
IF bx$ = "EXPERIENCE" THEN settings$(nus) = STR$(exper)
IF bx$ = "STRENGTH" THEN settings$(nus) = STR$(w)
IF bx$ = "DEFENSE" THEN settings$(nus) = STR$(defs)
IF bx$ = "HITPOINT" THEN settings$(nus) = STR$(h)
IF bx$ = "GOLD" THEN settings$(nus) = STR$(S)
IF bx$ = "WEAPON" THEN settings$(nus) = STR$(I)
IF bx$ = "ARMOUR" THEN settings$(nus) = STR$(z)

nus = nus + 1
LOOP



PRINT "Edit dynamic SETTINGS$ array? Y/(N)"; SPC(0);
array$ = INPUT$(1)
PRINT

IF UCASE$(array$) = "Y" THEN
PRINT
gust = 1
DO
gs$ = settings$(gust): gust = gust + 1
IF gs$ = "--END--" THEN GOTO dones
gs1$ = settings$(gust):
PRINT "Variable :  "; gs$
PRINT "Value    :  "; gs1$
INPUT "New Value:  ", newvalue$
        IF newvalue$ <> "" THEN
        settings$(gust) = newvalue$
        END IF
PRINT
gust = gust + 1
LOOP
dones:
END IF


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


fground = collor
bground = bg
cole 0, towrite$, cole4$, fground, bground
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

