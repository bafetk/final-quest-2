DECLARE SUB clump (CLUMP1$, posx, posy, size, collor)
DECLARE SUB letters (which$, px, py, sz, col)
DECLARE SUB inv ()
DECLARE SUB query ()
DIM SHARED save1name$, save2name$, save3name$, save4name$, save5name$
RANDOMIZE TIMER
cl$ = COMMAND$
IF cl$ = "-DEBUGMODE" THEN
INPUT "Enter Password: ", password$
IF password$ = "CoMpUtEr!" THEN cc = 1
IF NOT password$ = "CoMpUtEr!" THEN GOTO eeeeerrrrr
END IF
file$ = "fqmaps.dat"
dddd$ = "fqmaps.dat"
tt = 0
dd = 0
monsters$ = "ON"
i = 1
s = 0
h = 250
defs = 10
z = 1
w = 10
rp = 12
record = 1354
y = 18
x = 11
Null$ = CHR$(0)
CLS
COLOR 14, 1
LOCATE 1, 1
PRINT "                          Final Quest 2 V0.9B Startup                           "
COLOR 7, 0
IF cc = 1 THEN PRINT "Debug Mode on..."
PRINT "Looking for Level Map File..."; SPC(0);
SHELL "if exist null. del null."
SHELL "if exist n1 del n1."
SHELL "if exist n2. del n2."
OPEN "n1" FOR OUTPUT AS #1
OPEN "n2" FOR OUTPUT AS #2
bb = 2
oo = 1
PRINT #1, oo
PRINT #2, bb
CLOSE #1
CLOSE #2
SHELL "IF EXIST fqmaps.dat Rename n1. null."
SHELL "IF NOT EXIST FQmaps.dat RENAME n2. null."
OPEN "null" FOR INPUT AS #1
INPUT #1, ifexist$
CLOSE #1
IF ifexist$ = "2" THEN GOTO errorer
SHELL "if exist null. del null."
SHELL "if exist n1 del n1."
SHELL "if exist n2. del n2."
SHELL "if exist more. del more."
PRINT "Found."
PRINT "Querying Moble System..."
query
IF NOT cc = 1 THEN LOCATE 4, 1
IF cc = 1 THEN LOCATE 5, 1
PRINT "Moble System Queryed."
PRINT "Looking for saved games, please hold..."; SPC(0);
IF cc = 1 THEN PRINT
IF cc = 1 THEN PRINT "Debug Mode: Deleting Old Data Files..."
SHELL "if exist null. del null."
SHELL "if exist null1. del null1."
SHELL "if exist null2. del null2."
SHELL "if exist null3. del null3."
SHELL "if exist null4. del null4."
SHELL "if exist n1 del n1."
SHELL "if exist n2. del n2."
SHELL "if exist n3. del n3."
SHELL "if exist n4. del n4."
SHELL "if exist n5. del n5."
IF cc = 1 THEN PRINT "Debug Mode: Makeing New Data Files..."
OPEN "n1" FOR OUTPUT AS #1
OPEN "n2" FOR OUTPUT AS #2
OPEN "n3" FOR OUTPUT AS #3
OPEN "n4" FOR OUTPUT AS #4
OPEN "n5" FOR OUTPUT AS #5
oo = 1
PRINT #1, oo
PRINT #2, oo
PRINT #3, oo
PRINT #4, oo
PRINT #5, oo
IF cc = 1 THEN PRINT "Debug Mode: New Data Files Closing..."
CLOSE #1
CLOSE #2
CLOSE #3
CLOSE #4
CLOSE #5
OPEN "n0" FOR OUTPUT AS #1
pp = 0
PRINT #1, pp
CLOSE #1
IF cc = 1 THEN PRINT "Debug Mode: Renaming Files for Conformation..."
SHELL "IF EXIST FQSAVE0.DAT rename n1. null."
SHELL "IF NOT EXIST FQSAVE0.DAT copy n0. null.>more"
SHELL "IF EXIST FQSAVE1.DAT rename n2. null1."
SHELL "IF NOT EXIST FQSAVE1.DAT copy n0. null1>MORE"
SHELL "IF EXIST FQSAVE2.DAT rename n3. null2."
SHELL "IF NOT EXIST FQSAVE2.DAT copy n0. null2>MORE"
SHELL "IF EXIST FQSAVE3.DAT rename n4. null3."
SHELL "IF NOT EXIST FQSAVE3.DAT copy n0. null3>MORE"
SHELL "IF EXIST FQSAVE4.DAT rename n5. null4."
SHELL "IF NOT EXIST FQSAVE4.DAT copy n0. null4>MORE"
IF cc = 1 THEN PRINT "Debug Mode: Reciving Data from Files..."
OPEN "null" FOR INPUT AS #1
INPUT #1, zz$
OPEN "null1" FOR INPUT AS #2
INPUT #2, yy$
OPEN "null2" FOR INPUT AS #3
INPUT #3, xx$
OPEN "null3" FOR INPUT AS #4
INPUT #4, ww$
OPEN "null4" FOR INPUT AS #5
INPUT #5, vv$
IF cc = 1 THEN PRINT "Debug Mode: Closeing Files..."
CLOSE #1
CLOSE #2
CLOSE #3
CLOSE #4
CLOSE #5
IF cc = 1 THEN PRINT "Debug Mode: Deleting Files..."
SHELL "if exist null. del null."
SHELL "if exist null1. del null1."
SHELL "if exist null2. del null2."
SHELL "if exist null3. del null3."
SHELL "if exist null4. del null4."
SHELL "if exist n1. del n1."
SHELL "if exist n2. del n2."
SHELL "if exist n3. del n3."
SHELL "if exist n4. del n4."
SHELL "if exist n5. del n5."
SHELL "if exist more. del more."
SHELL "if exist n0. del n0."
IF cc = 1 THEN PRINT "Debug Mode: Looking for Saved game Names..."

save1name$ = "Empty..."
save2name$ = "Empty..."
save3name$ = "Empty..."
save4name$ = "Empty..."
save5name$ = "Empty..."

IF zz$ = "1" THEN
OPEN "FQSAVE0.DAT" FOR INPUT AS #2
INPUT #2, save1name$
CLOSE #2
END IF
IF yy$ = "1" THEN
OPEN "FQSAVE1.DAT" FOR INPUT AS #2
INPUT #2, save2name$
CLOSE #2
END IF
IF xx$ = "1" THEN
OPEN "FQSAVE2.DAT" FOR INPUT AS #2
INPUT #2, save3name$
CLOSE #2
END IF
IF ww$ = "1" THEN
OPEN "FQSAVE3.DAT" FOR INPUT AS #2
INPUT #2, save4name$
CLOSE #2
END IF
IF vv$ = "1" THEN
OPEN "FQSAVE4.DAT" FOR INPUT AS #2
INPUT #2, save5name$
CLOSE #2
END IF

PRINT "Done."
PRINT "Beta Version..."
PRINT "Beginning Game..."
SLEEP 1
OPEN file$ FOR BINARY AS #1
COLOR 7, 0
CLS
COLOR 15, 0
o = 1
load:
CLS
SCREEN 12


'F
LINE (0, 50)-(0, 430), 5
LINE (0, 430)-(50, 430), 5
LINE (50, 430)-(50, 220), 5
LINE (50, 220)-(170, 220), 5
LINE (170, 220)-(170, 170), 5
LINE (170, 170)-(50, 170), 5
LINE (50, 170)-(50, 100), 5
LINE (50, 100)-(200, 100), 5
LINE (200, 100)-(200, 50), 5
LINE (200, 50)-(0, 50), 5
'F 3d
LINE (90, 390)-(90, 220), 5
LINE (210, 180)-(210, 130), 5
LINE (210, 130)-(90, 130), 5
LINE (90, 130)-(90, 100), 5
LINE (240, 60)-(240, 10), 5
LINE (240, 10)-(40, 10), 5
LINE (50, 430)-(90, 390), 5
LINE (170, 220)-(210, 180), 5
LINE (170, 170)-(210, 130), 5
LINE (50, 170)-(90, 130), 5
LINE (200, 100)-(240, 60), 5
LINE (200, 50)-(240, 10), 5
LINE (0, 50)-(40, 10), 5
'Q
LINE (419, 50)-(419, 430), 5
LINE (419, 430)-(499, 430), 5
LINE (569, 400)-(569, 80), 5
LINE (569, 80)-(449, 80), 5
LINE (449, 400)-(449, 80), 5
LINE (449, 400)-(499, 400), 5
LINE (419, 50)-(599, 50), 5
LINE (599, 430)-(599, 50), 5
LINE (544, 400)-(569, 400), 5
LINE (544, 430)-(599, 430), 5
LINE (544, 380)-(544, 400), 5
LINE (499, 380)-(499, 400), 5
LINE (544, 450)-(544, 430), 5
LINE (499, 450)-(499, 430), 5
LINE (544, 450)-(499, 450), 5
LINE (544, 380)-(499, 380), 5
LINE (544, 450)-(564, 430), 5
'Q 3d
LINE (544, 400)-(569, 375), 5
LINE (489, 360)-(489, 80), 5
LINE (489, 360)-(519, 360), 5
LINE (459, 10)-(639, 10), 5
LINE (639, 390)-(639, 10), 5
LINE (569, 340)-(539, 340), 5
LINE (539, 340)-(499, 380), 5
LINE (569, 355)-(544, 380), 5
LINE (419, 50)-(459, 10), 5
LINE (599, 50)-(639, 10), 5
LINE (599, 430)-(639, 390), 5
LINE (449, 400)-(489, 360), 5
'2
LINE (260, 30)-(260, 50), 5
LINE (260, 50)-(350, 50), 5
LINE (260, 30)-(370, 30), 5
LINE (350, 50)-(350, 100), 5
LINE (370, 30)-(370, 120), 5
LINE (370, 120)-(280, 120), 5
LINE (350, 100)-(260, 100), 5
LINE (260, 100)-(260, 190), 5
LINE (260, 190)-(370, 190), 5
LINE (370, 190)-(370, 170), 5
LINE (370, 170)-(280, 170), 5
LINE (280, 170)-(280, 120), 5
'2 3d
LINE (280, 10)-(260, 30), 5
LINE (390, 10)-(370, 30), 5
LINE (390, 100)-(370, 120), 5
LINE (280, 10)-(390, 10), 5
LINE (390, 10)-(390, 100), 5
LINE (350, 80)-(280, 80), 5
LINE (260, 100)-(280, 80), 5
LINE (390, 170)-(390, 150), 5
LINE (390, 150)-(300, 150), 5
LINE (300, 150)-(300, 120), 5
LINE (390, 170)-(370, 190), 5
LINE (370, 170)-(390, 150), 5
LINE (300, 150)-(280, 170), 5
'"Main Menu" box
LINE (110, 297)-(210, 297), 5
LINE (210, 297)-(210, 337), 5
LINE (210, 337)-(110, 337), 5
LINE (110, 337)-(110, 297), 5
'3d "Main Menu" box
LINE (120, 287)-(220, 287), 5
LINE (220, 287)-(220, 327), 5
LINE (220, 327)-(210, 337), 5
LINE (210, 297)-(220, 287), 5
LINE (110, 297)-(120, 287), 5
'Main Menu Box
LINE (250, 240)-(250, 430), 5
LINE (250, 430)-(370, 430), 5
LINE (370, 430)-(370, 240), 5
LINE (370, 240)-(250, 240), 5
'Main Menu Box 3d
LINE (390, 410)-(390, 220), 5
LINE (390, 220)-(270, 220), 5
LINE (250, 240)-(270, 220), 5
LINE (370, 240)-(390, 220), 5
LINE (370, 430)-(390, 410), 5
'Paints for F
PAINT (1, 1), 1, 5
PAINT (550, 200), 1, 5
PAINT (20, 40), 2, 5
PAINT (20, 80), 4, 5
PAINT (202, 49), 6, 5
PAINT (150, 150), 2, 5
PAINT (60, 150), 6, 5
PAINT (190, 175), 6, 5
PAINT (89, 250), 6, 5
'Paints for menu box
PAINT (260, 235), 2, 5
PAINT (380, 235), 6, 5
'Paints for "Menu BOX"
PAINT (120, 290), 2, 5
PAINT (219, 290), 6, 5
'Paints for 2
PAINT (265, 35), 11, 5
PAINT (265, 26), 2, 5
PAINT (375, 31), 6, 5
PAINT (375, 155), 2, 5
PAINT (375, 166), 6, 5
PAINT (281, 155), 6, 5
PAINT (281, 90), 2, 5
'Paints for Q
' LINE (419, 50)-(599, 50), 5
PAINT (425, 55), 14, 5
PAINT (425, 45), 2, 5
PAINT (630, 45), 6, 5
PAINT (455, 150), 6, 5
PAINT (460, 399), 2, 5
PAINT (510, 370), 2, 5
PAINT (545, 390), 6, 5
PAINT (555, 390), 2, 5
PAINT (555, 431), 6, 5

clump "V0.9B", 580, 460, 30, 15

GOTO load1
load1:
n = 0
COLOR 10
LOCATE 27, 1
COLOR 15
IF cc = 1 THEN PRINT "Debug Mode On..."
LOCATE 28, 1
IF cc = 1 THEN PRINT "(S)et Settings..."
IF cc = 1 THEN dd = 4
PALETTE 0, 65536 * 63 + 256
COLOR 15
clump "Main Menu", 117, 312, 30, 15

clump "Begin Game", 257, 255, 30, 12
clump "Save Game", 257, 285, 30, 12
clump "Load Game", 257, 315, 30, 12
clump "Help", 257, 345, 30, 12
clump "Resume Game", 257, 375, 30, 12
clump "Quit", 257, 405, 30, 12

IF o = 1 THEN clump "Begin Game", 257, 255, 30, 15
IF o = 2 THEN clump "Save Game", 257, 285, 30, 15
IF o = 3 THEN clump "Load Game", 257, 315, 30, 15
IF o = 4 THEN clump "Help", 257, 345, 30, 15
IF o = 5 THEN clump "Resume Game", 257, 375, 30, 15
IF o = 6 THEN clump "Quit", 257, 405, 30, 15
DO
check$ = INKEY$
LOOP WHILE check$ = ""
SELECT CASE check$
CASE "S"
IF cc = 1 THEN
SCREEN 0
pk = 2
GOTO setsettings
END IF
GOTO begin
CASE "s"
IF cc = 1 THEN
SCREEN 0
pk = 2
GOTO setsettings
END IF
GOTO begin
CASE CHR$(27)
SCREEN 0
GOTO no1
CASE CHR$(13)
SCREEN 0
IF o = 1 GOTO noload
IF o = 2 GOTO savegame11
IF o = 3 GOTO yesload
IF o = 4 GOTO help
IF o = 5 THEN GOTO loadmap
IF o = 6 GOTO no1
help:
SCREEN 12
clump "       Welcome to Final Quest 2 V0.9B by Akori Software.", 10, 10, 30, 2
clump "                            KEYS:", 10, 50, 30, 10
clump "                     " + CHR$(27) + " = Moves you Left", 10, 70, 30, 14
clump "                     " + CHR$(26) + " = Moves you Right", 10, 90, 30, 14
clump "                     " + CHR$(25) + " = Moves you Down", 10, 110, 30, 14
clump "                     " + CHR$(24) + " = Moves you Up", 10, 130, 30, 14
clump "                        I = Inventory", 10, 150, 30, 14
clump "                      ESC = Quit to menu", 10, 170, 30, 14
clump "                       Q = Quit to Menu", 10, 190, 30, 14
clump "A Centery ago, a witch, the most lethal, attacked an old city. ", 10, 230, 30, 12
clump "There, she built herself a castle and appointed herself ruler. ", 10, 250, 30, 12
clump "Along came a hero. This hero worked hard and long on perserving", 10, 270, 30, 12
clump "his country.  He eventually be came strong enough to confront", 10, 290, 30, 12
clump "the witch.  From there, he defeated the witch and was declared", 10, 310, 30, 12
clump "a hero.  This game tells the story of that witches daughter.", 10, 330, 30, 12
clump "The secret and spoiled descendent of that witch.  She has", 10, 350, 30, 12
clump "taken over the entire country now instead, and there are more", 10, 370, 30, 12
clump "areas to explore and conquer.", 10, 390, 30, 12
clump "Good Luck Adventurer.", 10, 430, 30, 14
clump "Press any key...", 10, 450, 30, 15
i$ = INPUT$(1)
SCREEN 0
GOTO load
CASE Null$ + CHR$(72)
IF o = 1 GOTO o6
IF o = 2 GOTO o1
IF o = 3 GOTO o2
IF o = 4 GOTO o3
IF o = 5 GOTO o4
IF o = 6 GOTO o5
o6:
o = 6
GOTO load1
o5:
o = 5
GOTO load1
o1:
o = 1
GOTO load1
o2:
o = 2
GOTO load1
o3:
o = 3
GOTO load1
o4:
o = 4
GOTO load1
CASE Null$ + CHR$(80)
IF o = 1 GOTO o25
IF o = 2 GOTO o35
IF o = 3 GOTO o45
IF o = 4 GOTO o55
IF o = 5 GOTO o65
IF o = 6 GOTO o15
o65:
o = 6
GOTO load1
o55:
o = 5
GOTO load1
o15:
o = 1
GOTO load1
o25:
o = 2
GOTO load1
o35:
o = 3
GOTO load1
o45:
o = 4
GOTO load1
CASE ELSE
GOTO load1
END SELECT
savegame11:
SCREEN 12
ooo = 1
savegame1:
clump "Save a Game...", 250, 130, 30, 10
clump "Enter a Choice.", 250, 290, 30, 4
clump save1name$, 250, 170, 30, 15
clump save2name$, 250, 190, 30, 15
clump save3name$, 250, 210, 30, 15
clump save4name$, 250, 230, 30, 15
clump save5name$, 250, 250, 30, 15

IF ooo = 1 THEN
clump save1name$, 250, 170, 30, 12
END IF
IF ooo = 2 THEN
clump save2name$, 250, 190, 30, 12
END IF
IF ooo = 3 THEN
clump save3name$, 250, 210, 30, 12
END IF
IF ooo = 4 THEN
clump save4name$, 250, 230, 30, 12
END IF
IF ooo = 5 THEN
clump save5name$, 250, 250, 30, 12
END IF


DO
check$ = INKEY$
LOOP WHILE check$ = ""
SELECT CASE check$
CASE CHR$(27)
CLS
GOTO load
CASE CHR$(13)
IF ooo = 1 THEN GOTO overwrite1
IF ooo = 2 THEN GOTO overwrite2
IF ooo = 3 THEN GOTO overwrite3
IF ooo = 4 THEN GOTO overwrite4
IF ooo = 5 THEN GOTO overwrite5
GOTO load
overwrite1:
IF zz$ = "1" THEN clump "Overwrite Existing Saved Game? Y/N", 10, 10, 30, 2
IF zz$ = "1" THEN i$ = INPUT$(1)
i$ = UCASE$(i$)
IF zz$ = "1" AND i$ = "Y" THEN pkd = 6
IF zz$ = "1" THEN IF i$ = "Y" THEN GOTO saveover1
IF zz$ = "1" THEN IF i$ = "N" THEN GOTO load
IF zz$ = "1" THEN GOTO load
GOTO saveover1
overwrite2:
IF yy$ = "1" THEN clump "Overwrite Existing Saved Game? Y/N", 10, 10, 30, 2
IF yy$ = "1" THEN i$ = INPUT$(1)
i$ = UCASE$(i$)
IF yy$ = "1" AND i$ = "Y" THEN pkd = 6
IF yy$ = "1" THEN IF i$ = "y" THEN GOTO saveover1
IF yy$ = "1" THEN IF i$ = "Y" THEN GOTO saveover1
IF yy$ = "1" THEN IF i$ = "n" THEN GOTO load
IF yy$ = "1" THEN IF i$ = "N" THEN GOTO load
IF yy$ = "1" THEN GOTO load
GOTO saveover1
overwrite3:
IF xx$ = "1" THEN clump "Overwrite Existing Saved Game? Y/N", 10, 10, 30, 2
IF xx$ = "1" THEN i$ = INPUT$(1)
i$ = UCASE$(i$)
IF xx$ = "1" AND i$ = "Y" THEN pkd = 6
IF xx$ = "1" THEN IF i$ = "y" THEN GOTO saveover1
IF xx$ = "1" THEN IF i$ = "Y" THEN GOTO saveover1
IF xx$ = "1" THEN IF i$ = "n" THEN GOTO load
IF xx$ = "1" THEN IF i$ = "N" THEN GOTO load
IF xx$ = "1" THEN GOTO load
GOTO saveover1
overwrite4:
IF ww$ = "1" THEN clump "Overwrite Existing Saved Game? Y/N", 10, 10, 30, 2
IF ww$ = "1" THEN i$ = INPUT$(1)
i$ = UCASE$(i$)
IF ww$ = "1" AND i$ = "Y" THEN pkd = 6
IF ww$ = "1" THEN IF i$ = "y" THEN GOTO saveover1
IF ww$ = "1" THEN IF i$ = "Y" THEN GOTO saveover1
IF ww$ = "1" THEN IF i$ = "n" THEN GOTO load
IF ww$ = "1" THEN IF i$ = "N" THEN GOTO load
IF ww$ = "1" THEN GOTO load
GOTO saveover1
overwrite5:
IF vv$ = "1" THEN clump "Overwrite Existing Saved Game? Y/N", 10, 10, 30, 2
IF vv$ = "1" THEN i$ = INPUT$(1)
i$ = UCASE$(i$)
IF vv$ = "1" AND i$ = "Y" THEN pkd = 6
IF vv$ = "1" THEN IF i$ = "y" THEN GOTO saveover1
IF vv$ = "1" THEN IF i$ = "Y" THEN GOTO saveover1
IF vv$ = "1" THEN IF i$ = "n" THEN GOTO load
IF vv$ = "1" THEN IF i$ = "N" THEN GOTO load
IF vv$ = "1" THEN GOTO load
GOTO saveover1
CASE Null$ + CHR$(72)
IF ooo = 1 GOTO oo5
IF ooo = 2 GOTO oo1
IF ooo = 3 GOTO oo2
IF ooo = 4 GOTO oo3
IF ooo = 5 GOTO oo4
oo5:
ooo = 5
GOTO savegame1
oo1:
ooo = 1
GOTO savegame1
oo2:
ooo = 2
GOTO savegame1
oo3:
ooo = 3
GOTO savegame1
oo4:
ooo = 4
GOTO savegame1
CASE Null$ + CHR$(80)
IF ooo = 1 GOTO oo25
IF ooo = 2 GOTO oo35
IF ooo = 3 GOTO oo45
IF ooo = 4 GOTO oo55
IF ooo = 5 GOTO oo15
oo55:
ooo = 5
GOTO savegame1
oo15:
ooo = 1
GOTO savegame1
oo25:
ooo = 2
GOTO savegame1
oo35:
ooo = 3
GOTO savegame1
oo45:
ooo = 4
GOTO savegame1
CASE ELSE
GOTO savegame1
END SELECT
saveover1:
IF ooo = 2 THEN GOTO next2
IF ooo = 3 THEN GOTO next3
IF ooo = 4 THEN GOTO next4
IF ooo = 5 THEN GOTO next5
IF NOT zz$ = "1" THEN GOTO saveover1notexist
GOTO saveover1go
next2:
IF NOT yy$ = "1" THEN GOTO saveover1notexist
GOTO saveover1go
next3:
IF NOT xx$ = "1" THEN GOTO saveover1notexist
GOTO saveover1go
next4:
IF NOT ww$ = "1" THEN GOTO saveover1notexist
GOTO saveover1go
next5:
IF NOT vv$ = "1" THEN GOTO saveover1notexist
GOTO saveover1go
saveover1notexist:
saveover1go:
clump "Save a Game...", 250, 130, 30, 10
clump "Enter a Choice.", 250, 290, 30, 4
clump save1name$, 250, 170, 30, 15
clump save2name$, 250, 190, 30, 15
clump save3name$, 250, 210, 30, 15
clump save4name$, 250, 230, 30, 15
clump save5name$, 250, 250, 30, 15
IF ooo = 1 THEN LINE (250, 170)-STEP(200, 14), 0, BF
IF ooo = 2 THEN LINE (250, 190)-STEP(200, 14), 0, BF
IF ooo = 3 THEN LINE (250, 210)-STEP(200, 14), 0, BF
IF ooo = 4 THEN LINE (250, 230)-STEP(200, 14), 0, BF
IF ooo = 5 THEN LINE (250, 250)-STEP(200, 14), 0, BF

IF ooo = 1 THEN linestart = 170
IF ooo = 2 THEN linestart = 190
IF ooo = 3 THEN linestart = 210
IF ooo = 4 THEN linestart = 230
IF ooo = 5 THEN linestart = 250
xstart = 250
savename$ = ""
wordenter:
LINE (xstart, linestart + 14)-STEP(10, 2), 15, BF
DO
id$ = INKEY$
LOOP WHILE id$ = ""

LINE (xstart, linestart + 14)-STEP(10, 2), 0, BF

IF id$ = CHR$(8) THEN
IF xstart = 250 THEN GOTO wordenter
xstart = xstart - 10
LINE (xstart, linestart - 1)-STEP(9, 14), 0, BF
asdf = LEN(savename$)
savename$ = LEFT$(savename$, asdf - 1)
GOTO wordenter
END IF

IF id$ = CHR$(13) THEN GOTO pressenter

savename$ = savename$ + id$

letters id$, xstart, linestart, 30, 15
xstart = xstart + 10
GOTO wordenter

pressenter:

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
IF ooo = 1 THEN OPEN "FQSAVE0.DAT" FOR OUTPUT AS #2
IF ooo = 2 THEN OPEN "FQSAVE1.DAT" FOR OUTPUT AS #2
IF ooo = 3 THEN OPEN "FQSAVE2.DAT" FOR OUTPUT AS #2
IF ooo = 4 THEN OPEN "FQSAVE3.DAT" FOR OUTPUT AS #2
IF ooo = 5 THEN OPEN "FQSAVE4.DAT" FOR OUTPUT AS #2
IF i = 1 THEN i = 2783234
IF i = 2 THEN i = 6766233
IF i = 4 THEN i = 9607033
IF i = 3 THEN i = 7223546
s = s + 578345
h = h + 368833
w = w + 670022
x = x + 562026
y = y + 390847
defs = defs + 602332
record = record + 623495
rp = rp + 259072
IF z = 1 THEN z = 537683
IF z = 2 THEN z = 691152
IF z = 3 THEN z = 767911
IF z = 4 THEN z = 296922
IF monsters$ = "ON" THEN monsters$ = "gJlgggGGGQ#%%"
IF monsters$ = "OFF" THEN monsters$ = "jgMflsoT&"
PRINT #2, savename$
PRINT #2, monsters$
PRINT #2, i
PRINT #2, s
PRINT #2, h
PRINT #2, x
PRINT #2, y
PRINT #2, w
PRINT #2, z
PRINT #2, record
PRINT #2, rp
PRINT #2, defs
CLOSE #2
IF i = 9607033 THEN i = 4
IF i = 6766233 THEN i = 2
IF i = 2783234 THEN i = 1
IF i = 7223546 THEN i = 3
defs = defs - 602332
IF monsters$ = "gJlgggGGGQ#%%" THEN monsters$ = "ON"
IF monsters$ = "jgMflsoT&" THEN monsters$ = "OFF"
s = s - 578345
h = h - 368833
w = w - 670022
x = x - 562026
y = y - 390847
record = record - 623495
rp = rp - 259072
IF z = 537683 THEN z = 1
IF z = 691152 THEN z = 2
IF z = 767911 THEN z = 3
IF z = 296922 THEN z = 4
IF ooo = 1 THEN zz$ = "1"
IF ooo = 2 THEN yy$ = "1"
IF ooo = 3 THEN xx$ = "1"
IF ooo = 4 THEN ww$ = "1"
IF ooo = 5 THEN vv$ = "1"
SCREEN 0
GOTO load

yesload:
loadgame11:
SCREEN 12
op = 1
loadgame1:
clump "Load a Game...", 250, 130, 30, 10
clump "Enter a Choice.", 250, 290, 30, 4
clump save1name$, 250, 170, 30, 15
clump save2name$, 250, 190, 30, 15
clump save3name$, 250, 210, 30, 15
clump save4name$, 250, 230, 30, 15
clump save5name$, 250, 250, 30, 15

IF op = 1 THEN
clump save1name$, 250, 170, 30, 12
END IF
IF op = 2 THEN
clump save2name$, 250, 190, 30, 12
END IF
IF op = 3 THEN
clump save3name$, 250, 210, 30, 12
END IF
IF op = 4 THEN
clump save4name$, 250, 230, 30, 12
END IF
IF op = 5 THEN
clump save5name$, 250, 250, 30, 12
END IF

DO
docheck$ = INKEY$
LOOP WHILE docheck$ = ""
SELECT CASE docheck$
CASE CHR$(27)
GOTO load
CASE CHR$(13)
IF op = 1 THEN GOTO gameload1
IF op = 2 THEN GOTO gameload1
IF op = 3 THEN GOTO gameload1
IF op = 4 THEN GOTO gameload1
IF op = 5 THEN GOTO gameload1
GOTO load
CASE Null$ + CHR$(72)
IF op = 1 THEN GOTO op5
IF op = 2 THEN GOTO op1
IF op = 3 THEN GOTO op2
IF op = 4 THEN GOTO op3
IF op = 5 THEN GOTO op4
GOTO load
op5:
op = 5
GOTO loadgame1
op1:
op = 1
GOTO loadgame1
op2:
op = 2
GOTO loadgame1
op3:
op = 3
GOTO loadgame1
op4:
op = 4
GOTO loadgame1
CASE Null$ + CHR$(80)
IF op = 1 THEN GOTO op21
IF op = 2 THEN GOTO op31
IF op = 3 THEN GOTO op41
IF op = 4 THEN GOTO op51
IF op = 5 THEN GOTO op11
GOTO load
op51:
op = 5
GOTO loadgame1
op11:
op = 1
GOTO loadgame1
op21:
op = 2
GOTO loadgame1
op31:
op = 3
GOTO loadgame1
op41:
op = 4
GOTO loadgame1
CASE ELSE
GOTO loadgame1
END SELECT
gameload1:
IF op = 1 THEN IF NOT zz$ = "1" THEN GOTO loadgame1
IF op = 2 THEN IF NOT yy$ = "1" THEN GOTO loadgame1
IF op = 3 THEN IF NOT xx$ = "1" THEN GOTO loadgame1
IF op = 4 THEN IF NOT ww$ = "1" THEN GOTO loadgame1
IF op = 5 THEN IF NOT vv$ = "1" THEN GOTO loadgame1
IF op = 1 THEN OPEN "FQSAVE0.DAT" FOR INPUT AS #2
IF op = 2 THEN OPEN "FQSAVE1.DAT" FOR INPUT AS #2
IF op = 3 THEN OPEN "FQSAVE2.DAT" FOR INPUT AS #2
IF op = 4 THEN OPEN "FQSAVE3.DAT" FOR INPUT AS #2
IF op = 5 THEN OPEN "FQSAVE4.DAT" FOR INPUT AS #2
INPUT #2, savename$
INPUT #2, monsters$
INPUT #2, i
INPUT #2, s
INPUT #2, h
INPUT #2, x
INPUT #2, y
INPUT #2, w
INPUT #2, z
INPUT #2, record
INPUT #2, rp
INPUT #2, defs
CLOSE #2
IF i = 9607033 THEN i = 4
IF i = 6766233 THEN i = 2
IF i = 2783234 THEN i = 1
IF i = 7223546 THEN i = 3
defs = defs - 602332
s = s - 578345
h = h - 368833
w = w - 670022
x = x - 562026
y = y - 390847
IF monsters$ = "gJlgggGGGQ#%%" THEN monsters$ = "ON"
IF monsters$ = "jgMflsoT&" THEN monsters$ = "OFF"
record = record - 623495
rp = rp - 259072
IF z = 537683 THEN z = 1
IF z = 691152 THEN z = 2
IF z = 767911 THEN z = 3
IF z = 296922 THEN z = 4
SCREEN 0
GOTO loadmap
noload:
COLOR 7, 0
CLS
rp = 12
tt = 0
dd = 0
d = 2
i = 1
s = 0
h = 250
defs = 10
z = 1
w = 10
y = 18
x = 11
qy = 1
qx = 1
record = 1354
mm = 1
COLOR 14, 2
loadmap:
qy = 1
qx = 1
COLOR 7, 0
CLS
a$ = SPACE$(5)
bk = rp * 8690 - 8689
kb = rp * 8690
FOR l = bk TO kb STEP 5
GET #1, l, a$
LOCATE qy, qx
d$ = LEFT$(a$, 1)
IF d$ = "1" THEN
l$ = LEFT$(a$, 3)
g$ = RIGHT$(l$, 1)
IF g$ = "0" THEN g = 0
IF g$ = "1" THEN g = 1
IF g$ = "2" THEN g = 2
IF g$ = "3" THEN g = 3
IF g$ = "4" THEN g = 4
IF g$ = "5" THEN g = 5
IF g$ = "6" THEN g = 6
IF g$ = "7" THEN g = 7
IF g$ = "8" THEN g = 8
IF g$ = "9" THEN g = 9
IF g$ = "A" THEN g = 10
IF g$ = "B" THEN g = 11
IF g$ = "C" THEN g = 12
IF g$ = "D" THEN g = 13
IF g$ = "E" THEN g = 14
IF g$ = "F" THEN g = 15
k$ = LEFT$(a$, 2)
e$ = RIGHT$(k$, 1)
IF e$ = "0" THEN e = 0
IF e$ = "1" THEN e = 1
IF e$ = "2" THEN e = 2
IF e$ = "3" THEN e = 3
IF e$ = "4" THEN e = 4
IF e$ = "5" THEN e = 5
IF e$ = "6" THEN e = 6
IF e$ = "7" THEN e = 7
IF e$ = "8" THEN e = 8
IF e$ = "9" THEN e = 9
IF e$ = "A" THEN e = 10
IF e$ = "B" THEN e = 11
IF e$ = "C" THEN e = 12
IF e$ = "D" THEN e = 13
IF e$ = "E" THEN e = 14
IF e$ = "F" THEN e = 15
COLOR g, e
j$ = RIGHT$(a$, 1)
IF j$ = "/" THEN GOTO continue111111
PRINT j$
GOTO continue111112
continue111111:
PRINT " "
continue111112:
COLOR 7, 0
g = 7
END IF
IF d$ = "2" THEN
l$ = LEFT$(a$, 3)
g$ = RIGHT$(l$, 1)
IF g$ = "0" THEN g = 0
IF g$ = "1" THEN g = 1
IF g$ = "2" THEN g = 2
IF g$ = "3" THEN g = 3
IF g$ = "4" THEN g = 4
IF g$ = "5" THEN g = 5
IF g$ = "6" THEN g = 6
IF g$ = "7" THEN g = 7
IF g$ = "8" THEN g = 8
IF g$ = "9" THEN g = 9
IF g$ = "A" THEN g = 10
IF g$ = "B" THEN g = 11
IF g$ = "C" THEN g = 12
IF g$ = "D" THEN g = 13
IF g$ = "E" THEN g = 14
IF g$ = "F" THEN g = 15
k$ = LEFT$(a$, 2)
e$ = RIGHT$(k$, 1)
IF e$ = "0" THEN e = 0
IF e$ = "1" THEN e = 1
IF e$ = "2" THEN e = 2
IF e$ = "3" THEN e = 3
IF e$ = "4" THEN e = 4
IF e$ = "5" THEN e = 5
IF e$ = "6" THEN e = 6
IF e$ = "7" THEN e = 7
IF e$ = "8" THEN e = 8
IF e$ = "9" THEN e = 9
IF e$ = "A" THEN e = 10
IF e$ = "B" THEN e = 11
IF e$ = "C" THEN e = 12
IF e$ = "D" THEN e = 13
IF e$ = "E" THEN e = 14
IF e$ = "F" THEN e = 15
COLOR g, e
PRINT CHR$(6)
COLOR 7, 0
END IF
IF d$ = "3" THEN
l$ = LEFT$(a$, 3)
g$ = RIGHT$(l$, 1)
IF g$ = "0" THEN g = 0
IF g$ = "1" THEN g = 1
IF g$ = "2" THEN g = 2
IF g$ = "3" THEN g = 3
IF g$ = "4" THEN g = 4
IF g$ = "5" THEN g = 5
IF g$ = "6" THEN g = 6
IF g$ = "7" THEN g = 7
IF g$ = "8" THEN g = 8
IF g$ = "9" THEN g = 9
IF g$ = "A" THEN g = 10
IF g$ = "B" THEN g = 11
IF g$ = "C" THEN g = 12
IF g$ = "D" THEN g = 13
IF g$ = "E" THEN g = 14
IF g$ = "F" THEN g = 15
k$ = LEFT$(a$, 2)
e$ = RIGHT$(k$, 1)
IF e$ = "0" THEN e = 0
IF e$ = "1" THEN e = 1
IF e$ = "2" THEN e = 2
IF e$ = "3" THEN e = 3
IF e$ = "4" THEN e = 4
IF e$ = "5" THEN e = 5
IF e$ = "6" THEN e = 6
IF e$ = "7" THEN e = 7
IF e$ = "8" THEN e = 8
IF e$ = "9" THEN e = 9
IF e$ = "A" THEN e = 10
IF e$ = "B" THEN e = 11
IF e$ = "C" THEN e = 12
IF e$ = "D" THEN e = 13
IF e$ = "E" THEN e = 14
IF e$ = "F" THEN e = 15
COLOR g, e
PRINT CHR$(5)
COLOR 7, 0
END IF
IF d$ = "4" THEN
COLOR 0, 0
PRINT " "
COLOR 7, 0
END IF
IF d$ = "5" THEN
l$ = LEFT$(a$, 3)
g$ = RIGHT$(l$, 1)
IF g$ = "0" THEN g = 0
IF g$ = "1" THEN g = 1
IF g$ = "2" THEN g = 2
IF g$ = "3" THEN g = 3
IF g$ = "4" THEN g = 4
IF g$ = "5" THEN g = 5
IF g$ = "6" THEN g = 6
IF g$ = "7" THEN g = 7
IF g$ = "8" THEN g = 8
IF g$ = "9" THEN g = 9
IF g$ = "A" THEN g = 10
IF g$ = "B" THEN g = 11
IF g$ = "C" THEN g = 12
IF g$ = "D" THEN g = 13
IF g$ = "E" THEN g = 14
IF g$ = "F" THEN g = 15
k$ = LEFT$(a$, 2)
e$ = RIGHT$(k$, 1)
IF e$ = "0" THEN e = 0
IF e$ = "1" THEN e = 1
IF e$ = "2" THEN e = 2
IF e$ = "3" THEN e = 3
IF e$ = "4" THEN e = 4
IF e$ = "5" THEN e = 5
IF e$ = "6" THEN e = 6
IF e$ = "7" THEN e = 7
IF e$ = "8" THEN e = 8
IF e$ = "9" THEN e = 9
IF e$ = "A" THEN e = 10
IF e$ = "B" THEN e = 11
IF e$ = "C" THEN e = 12
IF e$ = "D" THEN e = 13
IF e$ = "E" THEN e = 14
IF e$ = "F" THEN e = 15
COLOR g, e
PRINT "/"
COLOR 7, 0
END IF
IF d$ = "6" THEN
l$ = LEFT$(a$, 3)
g$ = RIGHT$(l$, 1)
IF g$ = "0" THEN g = 0
IF g$ = "1" THEN g = 1
IF g$ = "2" THEN g = 2
IF g$ = "3" THEN g = 3
IF g$ = "4" THEN g = 4
IF g$ = "5" THEN g = 5
IF g$ = "6" THEN g = 6
IF g$ = "7" THEN g = 7
IF g$ = "8" THEN g = 8
IF g$ = "9" THEN g = 9
IF g$ = "A" THEN g = 10
IF g$ = "B" THEN g = 11
IF g$ = "C" THEN g = 12
IF g$ = "D" THEN g = 13
IF g$ = "E" THEN g = 14
IF g$ = "F" THEN g = 15
k$ = LEFT$(a$, 2)
e$ = RIGHT$(k$, 1)
IF e$ = "0" THEN e = 0
IF e$ = "1" THEN e = 1
IF e$ = "2" THEN e = 2
IF e$ = "3" THEN e = 3
IF e$ = "4" THEN e = 4
IF e$ = "5" THEN e = 5
IF e$ = "6" THEN e = 6
IF e$ = "7" THEN e = 7
IF e$ = "8" THEN e = 8
IF e$ = "9" THEN e = 9
IF e$ = "A" THEN e = 10
IF e$ = "B" THEN e = 11
IF e$ = "C" THEN e = 12
IF e$ = "D" THEN e = 13
IF e$ = "E" THEN e = 14
IF e$ = "F" THEN e = 15
COLOR g, e
PRINT "\"
COLOR 7, 0
END IF
IF d$ = "7" THEN
l$ = LEFT$(a$, 3)
g$ = RIGHT$(l$, 1)
IF g$ = "0" THEN g = 0
IF g$ = "1" THEN g = 1
IF g$ = "2" THEN g = 2
IF g$ = "3" THEN g = 3
IF g$ = "4" THEN g = 4
IF g$ = "5" THEN g = 5
IF g$ = "6" THEN g = 6
IF g$ = "7" THEN g = 7
IF g$ = "8" THEN g = 8
IF g$ = "9" THEN g = 9
IF g$ = "A" THEN g = 10
IF g$ = "B" THEN g = 11
IF g$ = "C" THEN g = 12
IF g$ = "D" THEN g = 13
IF g$ = "E" THEN g = 14
IF g$ = "F" THEN g = 15
k$ = LEFT$(a$, 2)
e$ = RIGHT$(k$, 1)
IF e$ = "0" THEN e = 0
IF e$ = "1" THEN e = 1
IF e$ = "2" THEN e = 2
IF e$ = "3" THEN e = 3
IF e$ = "4" THEN e = 4
IF e$ = "5" THEN e = 5
IF e$ = "6" THEN e = 6
IF e$ = "7" THEN e = 7
IF e$ = "8" THEN e = 8
IF e$ = "9" THEN e = 9
IF e$ = "A" THEN e = 10
IF e$ = "B" THEN e = 11
IF e$ = "C" THEN e = 12
IF e$ = "D" THEN e = 13
IF e$ = "E" THEN e = 14
IF e$ = "F" THEN e = 15
COLOR g, e
PRINT "-"
COLOR 7, 0
END IF
IF d$ = "8" THEN
l$ = LEFT$(a$, 3)
g$ = RIGHT$(l$, 1)
IF g$ = "0" THEN g = 0
IF g$ = "1" THEN g = 1
IF g$ = "2" THEN g = 2
IF g$ = "3" THEN g = 3
IF g$ = "4" THEN g = 4
IF g$ = "5" THEN g = 5
IF g$ = "6" THEN g = 6
IF g$ = "7" THEN g = 7
IF g$ = "8" THEN g = 8
IF g$ = "9" THEN g = 9
IF g$ = "A" THEN g = 10
IF g$ = "B" THEN g = 11
IF g$ = "C" THEN g = 12
IF g$ = "D" THEN g = 13
IF g$ = "E" THEN g = 14
IF g$ = "F" THEN g = 15
k$ = LEFT$(a$, 2)
e$ = RIGHT$(k$, 1)
IF e$ = "0" THEN e = 0
IF e$ = "1" THEN e = 1
IF e$ = "2" THEN e = 2
IF e$ = "3" THEN e = 3
IF e$ = "4" THEN e = 4
IF e$ = "5" THEN e = 5
IF e$ = "6" THEN e = 6
IF e$ = "7" THEN e = 7
IF e$ = "8" THEN e = 8
IF e$ = "9" THEN e = 9
IF e$ = "A" THEN e = 10
IF e$ = "B" THEN e = 11
IF e$ = "C" THEN e = 12
IF e$ = "D" THEN e = 13
IF e$ = "E" THEN e = 14
IF e$ = "F" THEN e = 15
COLOR g, e
PRINT "|"
COLOR 7, 0
END IF
IF qx = 80 THEN qy = qy + 1
IF qx = 80 THEN qx = 1
qx = qx + 1
IF qx = 80 THEN qy = qy + 1
IF qx = 80 THEN qx = 1
NEXT l
doneloading:
begin:
IF tt = 5 THEN
tt = 1
ccp = 2
GOTO setsettings
END IF
COLOR 7, 0
IF cc = 1 THEN LOCATE 1, 1
IF cc = 1 THEN PRINT "Y:"; y; "X:"; x; "SCR:"; rp; "Rec:"; record;
IF cc = 1 THEN LOCATE 1, 13
IF cc = 1 THEN PRINT "S=SET"
IF dd = 4 THEN LOCATE 1, 1
IF dd = 4 THEN PRINT "Y:"; y; "X:"; x; "SCR:"; rp; "Rec:"; record;
LOCATE 23, 1
COLOR 15, 1
PRINT "                                                                               "
LOCATE 23, 1
COLOR 15, 1: PRINT "Final Quest 2 -- By Akori Software"; : LOCATE 22: LOCATE , 1
COLOR , 1: PRINT "" + CHR$(10) + ""; : LOCATE , 34:
PRINT " -- You have:"; h; SPC(0); : PRINT "hitpoints--Score:"; s; SPC(0); : PRINT "!";
COLOR$ = SPACE$(1)
dk = rp * 8690 - 8689
mk = record * 5 - 4
m = mk + dk
GET #1, m, COLOR$
IF COLOR$ = "0" THEN color1 = 0
IF COLOR$ = "1" THEN color1 = 1
IF COLOR$ = "2" THEN color1 = 2
IF COLOR$ = "3" THEN color1 = 3
IF COLOR$ = "4" THEN color1 = 4
IF COLOR$ = "5" THEN color1 = 5
IF COLOR$ = "6" THEN color1 = 6
IF COLOR$ = "7" THEN color1 = 7
IF COLOR$ = "8" THEN color1 = 8
IF COLOR$ = "9" THEN color1 = 9
IF COLOR$ = "A" THEN color1 = 10
IF COLOR$ = "B" THEN color1 = 11
IF COLOR$ = "C" THEN color1 = 12
IF COLOR$ = "D" THEN color1 = 13
IF COLOR$ = "E" THEN color1 = 14
IF COLOR$ = "F" THEN color1 = 15
COLOR 14, color1
LOCATE y, x
PRINT CHR$(1)

'don't do these screens with monsters
IF rp = 12 THEN GOTO doer1
IF rp = 92 THEN GOTO doer1
IF rp = 23 THEN GOTO doer1
IF rp = 91 THEN GOTO doer1


RANDOMIZE TIMER
IF monsters$ = "OFF" THEN GOTO doer1
R = INT(RND * 50) + 1
IF R = 5 THEN GOTO enemy
GOTO doer1
enemy:
LOCATE 23, 1
COLOR 15, 1
IF s < 100 THEN
RANDOMIZE TIMER
ra = INT(RND * 3) + 1
GOTO m1
END IF
IF s < 1000 THEN
RANDOMIZE TIMER
ra = INT(RND * 6) + 1
GOTO m1
END IF

RANDOMIZE TIMER
ra = INT(RND * 10) + 1
m1:
IF ra = 1 THEN b = 10
IF ra = 2 THEN b = 25
IF ra = 3 THEN b = 35
IF ra = 4 THEN b = 60
IF ra = 5 THEN b = 75
IF ra = 6 THEN b = 110
IF ra = 7 THEN b = 120
IF ra = 8 THEN b = 130
IF ra = 9 THEN b = 140
IF ra = 10 THEN b = 150

IF ra = 1 THEN mn = 10
IF ra = 2 THEN mn = 25
IF ra = 3 THEN mn = 32
IF ra = 4 THEN mn = 100
IF ra = 5 THEN mn = 125
IF ra = 6 THEN mn = 200
IF ra = 7 THEN mn = 300
IF ra = 8 THEN mn = 400
IF ra = 9 THEN mn = 500
IF ra = 10 THEN mn = 600

COLOR 10, 0
IF ra = 1 THEN m$ = "Baby Monster"
IF ra = 2 THEN m$ = "Pig Cop"
IF ra = 3 THEN m$ = "Lizard Face"
IF ra = 4 THEN m$ = "Your Mother"
IF ra = 5 THEN m$ = "T-REX"
IF ra = 6 THEN m$ = "GODZILLA"
IF ra = 7 THEN m$ = "Redneck"
IF ra = 8 THEN m$ = "The Living Dead"
IF ra = 9 THEN m$ = "Cactus Face"
IF ra = 10 THEN m$ = "Death Ray"
COLOR 15, 0
g = INT(RND * 2) + 1
IF g = 1 THEN GOTO m1hitf
m1fight:
COLOR 15, 1
o = 1
hitpointer:
LOCATE 23, 1
PRINT "                                                                               "
COLOR 15, 1
LOCATE 23, 1
PRINT "Your hitpoints - "; h; "  "; m$; "'s Hitpoints - "; b; SPC(1);
IF o = 1 THEN
COLOR 15, 1
PRINT "Attack"; SPC(1);
COLOR 2, 1
PRINT "Run"
END IF
IF o = 2 THEN
COLOR 2, 1
PRINT "Attack"; SPC(1);
COLOR 15, 1
PRINT "Run"
END IF
DO
ccc$ = INKEY$
LOOP WHILE ccc$ = ""
SELECT CASE ccc$
CASE Null$ + CHR$(77)
o = 2
GOTO hitpointer
CASE Null$ + CHR$(75)
o = 1
GOTO hitpointer
CASE CHR$(13)
IF o = 1 THEN GOTO attackm1
IF o = 2 THEN GOTO m1ifhit
GOTO hitpointer
CASE ELSE
GOTO hitpointer
END SELECT
m1ifhit:
c = INT(RND * 10) + 1
IF c = 5 THEN GOTO m1hitsyou
IF c = 9 THEN GOTO m1hitsyou
GOTO begin
m1hitsyou:
LOCATE 23, 1
COLOR 15, 1
PRINT "                                                                               "
LOCATE 23, 1
PRINT "As you attempt to leave, "; m$; " sees you and attacks! Any key..."
kjbhn$ = INPUT$(1)
GOTO m1hitf
attackm1:
IF z = 1 THEN a = INT(RND * 10) + 1
IF z = 2 THEN a = INT(RND * 20) + 1
IF z = 3 THEN a = INT(RND * 35) + 1
IF z = 4 THEN a = INT(RND * 50) + 1
a = a + w
b = b - a
LOCATE 23, 1
COLOR 15, 1
PRINT "                                                                               "
LOCATE 23, 1
PRINT "You hit "; m$; " for"; a; "points damage. Any Key..."
sdafds$ = INPUT$(1)
LOCATE 23, 1
COLOR 15, 1
PRINT "                                                                               "
LOCATE 23, 1
IF b < 1 THEN PRINT "You killed "; m$; "!!! Press any key..."
IF ra = 1 AND b < 1 THEN s = s + 10
IF ra = 2 AND b < 1 THEN s = s + 35
IF ra = 3 AND b < 1 THEN s = s + 20
IF ra = 4 AND b < 1 THEN s = s + 25
IF ra = 5 AND b < 1 THEN s = s + 35
IF ra = 6 AND b < 1 THEN s = s + 100
IF ra = 7 AND b < 1 THEN s = s + 20
IF ra = 8 AND b < 1 THEN s = s + 40
IF ra = 9 AND b < 1 THEN s = s + 30
IF ra = 10 AND b < 1 THEN s = s + 75
IF b < 1 THEN i$ = INPUT$(1)
IF b < 1 GOTO begin
GOTO m1hitf
m1hitf:
COLOR 14, 0
a = INT(RND * 3) + 1
IF i = 1 THEN t = mn - 1
IF i = 2 THEN t = mn - 20
IF i = 3 THEN t = mn - 30
t = t - defs
IF t < 0 THEN t = 0
IF t = 0 THEN a = 0
ccvb:
LOCATE 23, 1
COLOR 15, 1
PRINT "                                                                               "
LOCATE 23, 1
IF i = 4 THEN PRINT ; m$; " is scared to death!! It doesn't attack. Hit Enter.."
IF i = 4 THEN sdklj$ = INPUT$(1)
IF i = 4 AND sdklj$ <> CHR$(13) THEN GOTO ccvb
IF i = 4 THEN GOTO m1fight
t = t + a
IF t < 0 THEN t = 0
bbcc:
LOCATE 23, 1
COLOR 15, 1
PRINT "                                                                               "
LOCATE 23, 1
PRINT ; m$; " hits you for"; t; "points damage. Hit Enter..."
wedlsdjkf$ = INPUT$(1)
IF wedlsdjkf$ <> CHR$(13) THEN GOTO bbcc
h = h - t
LOCATE 24, 1
IF h < 0 THEN GOTO fordead
GOTO m1fight
fordead:
LOCATE 23, 1
COLOR 15, 1
PRINT "                                                                               "
LOCATE 23, 1
PRINT "You have been killed... You score is divided in half. Press any key.."
s = s / 2
IF s < 0 THEN s = 0
h = 10
i$ = INPUT$(1)
GOTO begin

doer1:
DO
check$ = INKEY$
LOOP WHILE check$ = ""
check$ = UCASE$(check$)
SELECT CASE check$
CASE "I"
IF hh = 6 THEN
hh = 7
GOTO begin
END IF
IF hh = 2 THEN
hh = 3
GOTO begin
END IF
GOTO inventory
CASE "K"
tt = 2
GOTO begin
CASE "A"
aer:
IF hh = 4 THEN
hh = 5
GOTO begin
END IF
GOTO begin
CASE "C"
cer:
IF jjddkk = 2 THEN
hh = 1
jjddkk = 1
GOTO begin
END IF
IF hh = 7 THEN
hh = 8
jjddkk = 2
GOTO begin
END IF
GOTO begin
CASE "N"
ner:
IF hh = 5 THEN
hh = 6
GOTO begin
END IF
GOTO begin
CASE "T"
IF tt = 4 THEN tt = 5
IF hh = 3 THEN
hh = 4
GOTO begin
END IF
hh = 2
GOTO begin
CASE "S"
IF cc = 1 THEN
ccc = 1
GOTO setsettings
conte:
ccc = 0
GOTO loadmap
END IF
dd = 1
GOTO begin
CASE "D"
tt = 0
IF dd = 1 THEN dd = 2
GOTO begin
CASE "E"
IF tt = 3 THEN tt = 4
IF dd = 2 THEN dd = 3
GOTO begin
CASE "B"
IF dd = 3 THEN dd = 4
GOTO begin
CASE "L"
IF tt = 2 THEN tt = 3
GOTO begin
CASE "4"
GOTO hardleft
CASE "6"
GOTO hardright
CASE "8"
GOTO hardup
CASE "2"
GOTO harddown
CASE "Q"
GOTO Quit
CASE CHR$(27)
GOTO Quit
CASE Null$ + CHR$(75)
GOTO hardleft
CASE Null$ + CHR$(72)
GOTO hardup
CASE Null$ + CHR$(80)
GOTO harddown
CASE Null$ + CHR$(77)
GOTO hardright
CASE ELSE
GOTO begin
END SELECT
GOTO begin
setsettings:
COLOR 15, 0
CLS
COLOR 15, 0
PRINT "Current Settings:"
PRINT
PRINT "Screen #: ", rp
PRINT "X: ", x
PRINT "Y: ", y
PRINT "Hitpoints: ", h
PRINT "Strength: ", w
PRINT "Defense: ", defs
PRINT "Score: ", s
PRINT "Weapon: ", z
PRINT "Armour: ", i
PRINT "Monsters: ", monsters$
PRINT
COLOR 7
PRINT "New Settings:"
PRINT
COLOR 2, 0
reenterrg:
INPUT "SCREEN #: ", rg
FOR bk = 1 TO 20
IF rg = bk THEN GOTO nexter
NEXT bk
GOTO reenterrg
nexter:
rp = rg
chx:
INPUT "INPUT X-CRT:", x
FOR bbbk = 1 TO 79
IF x = bbbk THEN GOTO chy:
NEXT bbbk
GOTO chx
chy:
INPUT "INPUT Y-CRT:", y
FOR bbbk = 1 TO 22
IF y = bbbk THEN GOTO ccccc
NEXT bbbk
GOTO chy
ccccc:
dkdk = y - 1
record = dkdk * 79 + x
INPUT "INPUT Hitpoints:", h
INPUT "INPUT Strength:", w
INPUT "INPUT Defense:", defs
INPUT "INPUT Score:", s
cha:
INPUT "INPUT Armour(1-4):", i
IF i > 4 THEN GOTO cha
IF i < 0 THEN GOTO cha
chw:
INPUT "INPUT Weapon(1-4):", z
IF z > 4 THEN GOTO chw
IF z < 0 THEN GOTO chw
monst:
PRINT "INPUT Monsters(Y/N):"
monsters$ = INPUT$(1)
monsters$ = UCASE$(monsters$)
IF monsters$ = "Y" THEN GOTO contttt
IF monsters$ = "N" THEN GOTO contttt
GOTO monst
contttt:
IF monsters$ = "Y" THEN monsters$ = "ON"
IF monsters$ = "N" THEN monsters$ = "OFF"
IF ccp = 1 THEN
ccp = 0
GOTO loadmap
END IF
IF ccc = 1 THEN GOTO conte
IF cc = 1 THEN GOTO load
tt = 0
IF pk = 2 THEN
pk = 0
GOTO load
END IF
GOTO loadmap


hardleft:

'Set up Hotspots
IF x = 1 THEN
rp = rp - 1
x = 79
kkkk = y - 1
kkk = kkkk * 79
record = kkk + x
GOTO loadmap
END IF

'End setup

IF hh = 8 THEN GOTO left
record = record - 1
bk$ = SPACE$(5)
LK = rp * 8690 - 8689
dfdf = record * 5 - 5
m = LK + dfdf
GET #1, m, bk$
kb$ = RIGHT$(bk$, 2)
bk1$ = LEFT$(kb$, 1)
IF bk1$ = "1" THEN
record = record + 1
GOTO begin
END IF
IF bk1$ = "0" THEN
record = record + 1
GOTO left
END IF
GOTO begin

hardright:

'Set up hotspots

IF x = 79 THEN
rp = rp + 1
x = 1
kkkk = y - 1
kkk = kkkk * 79
record = kkk + x
GOTO loadmap
END IF

'End setup

IF hh = 8 THEN GOTO right
record = record + 1
bk$ = SPACE$(5)
LK = rp * 8690 - 8689
dfdf = record * 5 - 5
m = LK + dfdf
GET #1, m, bk$
kb$ = RIGHT$(bk$, 2)
bk1$ = LEFT$(kb$, 1)
IF bk1$ = "1" THEN
record = record - 1
GOTO begin
END IF
IF bk1$ = "0" THEN
record = record - 1
GOTO right
END IF
GOTO begin

hardup:

'Setup Hotspots

IF rp = 12 AND x = 58 AND y = 10 THEN
rp = 92
record = 1145
x = 39
y = 15
GOTO loadmap
END IF

IF rp = 12 AND x = 11 AND y = 18 THEN
rp = 91
record = 1305
x = 41
y = 17
GOTO loadmap
END IF

IF y = 1 THEN
rp = rp - 10
y = 22
record = 21 * 79 + x
GOTO loadmap
END IF

'End setup

IF hh = 8 THEN GOTO up
record = record - 79
bk$ = SPACE$(5)
LK = rp * 8690 - 8689
dfdf = record * 5 - 5
m = LK + dfdf
GET #1, m, bk$
kb$ = RIGHT$(bk$, 2)
bk1$ = LEFT$(kb$, 1)
IF bk1$ = "1" THEN
record = record + 79
GOTO begin
END IF
IF bk1$ = "0" THEN
record = record + 79
GOTO up
END IF
GOTO begin

harddown:

'Set up Hotspots

IF rp = 92 AND x = 39 AND y = 15 THEN
rp = 12
record = 769
x = 58
y = 10
GOTO loadmap
END IF

IF rp = 91 AND x = 41 AND y = 17 THEN
rp = 12
record = 1354
x = 11
y = 18
GOTO loadmap
END IF

IF y = 22 THEN
rp = rp + 10
y = 1
record = x
GOTO loadmap
END IF

'End setup

IF hh = 8 THEN GOTO down
record = record + 79
bk$ = SPACE$(5)
LK = rp * 8690 - 8689
dfdf = record * 5 - 5
m = LK + dfdf
GET #1, m, bk$
kb$ = RIGHT$(bk$, 2)
bk1$ = LEFT$(kb$, 1)
IF bk1$ = "1" THEN
record = record - 79
GOTO begin
END IF
IF bk1$ = "0" THEN
record = record - 79
GOTO down
END IF
GOTO begin
inventory:
CLS
inv
LOCATE 2, 21
COLOR 15, 0
PRINT "Your Hitpoints: "; h
LOCATE 3, 21
PRINT "Your Score: "; s
LOCATE 4, 21
IF i = 1 THEN PRINT "Your Armour: Vest"
IF i = 2 THEN PRINT "Your Armour: Heavy Coat"
IF i = 3 THEN PRINT "Your Armour: Chain Mail"
IF i = 4 THEN PRINT "Your Armour: Death Armour"
LOCATE 5, 21
IF z = 1 THEN PRINT "Your Weapon: Stick"
IF z = 2 THEN PRINT "Your Weapon: Shotgun"
IF z = 3 THEN PRINT "Your Weapon: Chaingun"
IF z = 4 THEN PRINT "Your Weapon: RPG"
LOCATE 6, 21
PRINT "Your Strength: "; w
LOCATE 7, 21
PRINT "Your Defense: "; defs
i$ = INPUT$(1)
GOTO loadmap
GOTO begin
left:
kk = 1
GOTO doer
left1:
x = x - 1
record = record - 1
GOTO begin
right:
kk = 2
GOTO doer
right1:
x = x + 1
record = record + 1
GOTO begin
up:
kk = 3
GOTO doer
up1:
y = y - 1
record = record - 79
GOTO begin
down:
kk = 4
GOTO doer
down1:
y = y + 1
record = record + 79
GOTO begin
doer:
LK = rp * 8690 - 8689
dfdf = record * 5 - 5
m = LK + dfdf
aaa$ = SPACE$(5)
GET #1, m, aaa$
aaaa$ = LEFT$(aaa$, 1)
IF aaaa$ = "1" THEN
bgg$ = LEFT$(aaa$, 2)
bg$ = RIGHT$(bgg$, 1)
IF bg$ = "0" THEN d = 0
IF bg$ = "1" THEN d = 1
IF bg$ = "2" THEN d = 2
IF bg$ = "3" THEN d = 3
IF bg$ = "4" THEN d = 4
IF bg$ = "5" THEN d = 5
IF bg$ = "6" THEN d = 6
IF bg$ = "7" THEN d = 7
IF bg$ = "8" THEN d = 8
IF bg$ = "9" THEN d = 9
IF bg$ = "A" THEN d = 10
IF bg$ = "B" THEN d = 11
IF bg$ = "C" THEN d = 12
IF bg$ = "D" THEN d = 13
IF bg$ = "E" THEN d = 14
IF bg$ = "F" THEN d = 15
fgg$ = LEFT$(aaa$, 3)
fg$ = RIGHT$(fgg$, 1)
IF fg$ = "0" THEN k = 0
IF fg$ = "1" THEN k = 1
IF fg$ = "2" THEN k = 2
IF fg$ = "3" THEN k = 3
IF fg$ = "4" THEN k = 4
IF fg$ = "5" THEN k = 5
IF fg$ = "6" THEN k = 6
IF fg$ = "7" THEN k = 7
IF fg$ = "8" THEN k = 8
IF fg$ = "9" THEN k = 9
IF fg$ = "A" THEN k = 10
IF fg$ = "B" THEN k = 11
IF fg$ = "C" THEN k = 12
IF fg$ = "D" THEN k = 13
IF fg$ = "E" THEN k = 14
IF fg$ = "F" THEN k = 15
COLOR k, d
ab$ = RIGHT$(aaa$, 1)
IF ab$ = "/" THEN GOTO cont11111
LOCATE y, x
PRINT ab$
GOTO cont12111
cont11111:
LOCATE y, x
PRINT " "
cont12111:
END IF
IF aaaa$ = "2" THEN
bgg$ = LEFT$(aaa$, 2)
bg$ = RIGHT$(bgg$, 1)
IF bg$ = "0" THEN d = 0
IF bg$ = "1" THEN d = 1
IF bg$ = "2" THEN d = 2
IF bg$ = "3" THEN d = 3
IF bg$ = "4" THEN d = 4
IF bg$ = "5" THEN d = 5
IF bg$ = "6" THEN d = 6
IF bg$ = "7" THEN d = 7
IF bg$ = "8" THEN d = 8
IF bg$ = "9" THEN d = 9
IF bg$ = "A" THEN d = 10
IF bg$ = "B" THEN d = 11
IF bg$ = "C" THEN d = 12
IF bg$ = "D" THEN d = 13
IF bg$ = "E" THEN d = 14
IF bg$ = "F" THEN d = 15
fgg$ = LEFT$(aaa$, 3)
fg$ = RIGHT$(fgg$, 1)
IF fg$ = "0" THEN k = 0
IF fg$ = "1" THEN k = 1
IF fg$ = "2" THEN k = 2
IF fg$ = "3" THEN k = 3
IF fg$ = "4" THEN k = 4
IF fg$ = "5" THEN k = 5
IF fg$ = "6" THEN k = 6
IF fg$ = "7" THEN k = 7
IF fg$ = "8" THEN k = 8
IF fg$ = "9" THEN k = 9
IF fg$ = "A" THEN k = 10
IF fg$ = "B" THEN k = 11
IF fg$ = "C" THEN k = 12
IF fg$ = "D" THEN k = 13
IF fg$ = "E" THEN k = 14
IF fg$ = "F" THEN k = 15
COLOR k, d
LOCATE y, x
PRINT CHR$(6)
END IF
IF aaaa$ = "3" THEN
bgg$ = LEFT$(aaa$, 2)
bg$ = RIGHT$(bgg$, 1)
IF bg$ = "0" THEN d = 0
IF bg$ = "1" THEN d = 1
IF bg$ = "2" THEN d = 2
IF bg$ = "3" THEN d = 3
IF bg$ = "4" THEN d = 4
IF bg$ = "5" THEN d = 5
IF bg$ = "6" THEN d = 6
IF bg$ = "7" THEN d = 7
IF bg$ = "8" THEN d = 8
IF bg$ = "9" THEN d = 9
IF bg$ = "A" THEN d = 10
IF bg$ = "B" THEN d = 11
IF bg$ = "C" THEN d = 12
IF bg$ = "D" THEN d = 13
IF bg$ = "E" THEN d = 14
IF bg$ = "F" THEN d = 15
fgg$ = LEFT$(aaa$, 3)
fg$ = RIGHT$(fgg$, 1)
IF fg$ = "0" THEN k = 0
IF fg$ = "1" THEN k = 1
IF fg$ = "2" THEN k = 2
IF fg$ = "3" THEN k = 3
IF fg$ = "4" THEN k = 4
IF fg$ = "5" THEN k = 5
IF fg$ = "6" THEN k = 6
IF fg$ = "7" THEN k = 7
IF fg$ = "8" THEN k = 8
IF fg$ = "9" THEN k = 9
IF fg$ = "A" THEN k = 10
IF fg$ = "B" THEN k = 11
IF fg$ = "C" THEN k = 12
IF fg$ = "D" THEN k = 13
IF fg$ = "E" THEN k = 14
IF fg$ = "F" THEN k = 15
COLOR k, d
LOCATE y, x
PRINT CHR$(5)
END IF
IF aaaa$ = "4" THEN
bgg$ = LEFT$(aaa$, 2)
bg$ = RIGHT$(bgg$, 1)
IF bg$ = "0" THEN d = 0
IF bg$ = "1" THEN d = 1
IF bg$ = "2" THEN d = 2
IF bg$ = "3" THEN d = 3
IF bg$ = "4" THEN d = 4
IF bg$ = "5" THEN d = 5
IF bg$ = "6" THEN d = 6
IF bg$ = "7" THEN d = 7
IF bg$ = "8" THEN d = 8
IF bg$ = "9" THEN d = 9
IF bg$ = "A" THEN d = 10
IF bg$ = "B" THEN d = 11
IF bg$ = "C" THEN d = 12
IF bg$ = "D" THEN d = 13
IF bg$ = "E" THEN d = 14
IF bg$ = "F" THEN d = 15
fgg$ = LEFT$(aaa$, 3)
fg$ = RIGHT$(fgg$, 1)
IF fg$ = "0" THEN k = 0
IF fg$ = "1" THEN k = 1
IF fg$ = "2" THEN k = 2
IF fg$ = "3" THEN k = 3
IF fg$ = "4" THEN k = 4
IF fg$ = "5" THEN k = 5
IF fg$ = "6" THEN k = 6
IF fg$ = "7" THEN k = 7
IF fg$ = "8" THEN k = 8
IF fg$ = "9" THEN k = 9
IF fg$ = "A" THEN k = 10
IF fg$ = "B" THEN k = 11
IF fg$ = "C" THEN k = 12
IF fg$ = "D" THEN k = 13
IF fg$ = "E" THEN k = 14
IF fg$ = "F" THEN k = 15
COLOR k, d
LOCATE y, x
PRINT " "
END IF
IF aaaa$ = "5" THEN
bgg$ = LEFT$(aaa$, 2)
bg$ = RIGHT$(bgg$, 1)
IF bg$ = "0" THEN d = 0
IF bg$ = "1" THEN d = 1
IF bg$ = "2" THEN d = 2
IF bg$ = "3" THEN d = 3
IF bg$ = "4" THEN d = 4
IF bg$ = "5" THEN d = 5
IF bg$ = "6" THEN d = 6
IF bg$ = "7" THEN d = 7
IF bg$ = "8" THEN d = 8
IF bg$ = "9" THEN d = 9
IF bg$ = "A" THEN d = 10
IF bg$ = "B" THEN d = 11
IF bg$ = "C" THEN d = 12
IF bg$ = "D" THEN d = 13
IF bg$ = "E" THEN d = 14
IF bg$ = "F" THEN d = 15
fgg$ = LEFT$(aaa$, 3)
fg$ = RIGHT$(fgg$, 1)
IF fg$ = "0" THEN k = 0
IF fg$ = "1" THEN k = 1
IF fg$ = "2" THEN k = 2
IF fg$ = "3" THEN k = 3
IF fg$ = "4" THEN k = 4
IF fg$ = "5" THEN k = 5
IF fg$ = "6" THEN k = 6
IF fg$ = "7" THEN k = 7
IF fg$ = "8" THEN k = 8
IF fg$ = "9" THEN k = 9
IF fg$ = "A" THEN k = 10
IF fg$ = "B" THEN k = 11
IF fg$ = "C" THEN k = 12
IF fg$ = "D" THEN k = 13
IF fg$ = "E" THEN k = 14
IF fg$ = "F" THEN k = 15
COLOR k, d
LOCATE y, x
PRINT "/"
END IF
IF aaaa$ = "6" THEN
bgg$ = LEFT$(aaa$, 2)
bg$ = RIGHT$(bgg$, 1)
IF bg$ = "0" THEN d = 0
IF bg$ = "1" THEN d = 1
IF bg$ = "2" THEN d = 2
IF bg$ = "3" THEN d = 3
IF bg$ = "4" THEN d = 4
IF bg$ = "5" THEN d = 5
IF bg$ = "6" THEN d = 6
IF bg$ = "7" THEN d = 7
IF bg$ = "8" THEN d = 8
IF bg$ = "9" THEN d = 9
IF bg$ = "A" THEN d = 10
IF bg$ = "B" THEN d = 11
IF bg$ = "C" THEN d = 12
IF bg$ = "D" THEN d = 13
IF bg$ = "E" THEN d = 14
IF bg$ = "F" THEN d = 15
fgg$ = LEFT$(aaa$, 3)
fg$ = RIGHT$(fgg$, 1)
IF fg$ = "0" THEN k = 0
IF fg$ = "1" THEN k = 1
IF fg$ = "2" THEN k = 2
IF fg$ = "3" THEN k = 3
IF fg$ = "4" THEN k = 4
IF fg$ = "5" THEN k = 5
IF fg$ = "6" THEN k = 6
IF fg$ = "7" THEN k = 7
IF fg$ = "8" THEN k = 8
IF fg$ = "9" THEN k = 9
IF fg$ = "A" THEN k = 10
IF fg$ = "B" THEN k = 11
IF fg$ = "C" THEN k = 12
IF fg$ = "D" THEN k = 13
IF fg$ = "E" THEN k = 14
IF fg$ = "F" THEN k = 15
COLOR k, d
LOCATE y, x
PRINT "\"
END IF
IF aaaa$ = "7" THEN
bgg$ = LEFT$(aaa$, 2)
bg$ = RIGHT$(bgg$, 1)
IF bg$ = "0" THEN d = 0
IF bg$ = "1" THEN d = 1
IF bg$ = "2" THEN d = 2
IF bg$ = "3" THEN d = 3
IF bg$ = "4" THEN d = 4
IF bg$ = "5" THEN d = 5
IF bg$ = "6" THEN d = 6
IF bg$ = "7" THEN d = 7
IF bg$ = "8" THEN d = 8
IF bg$ = "9" THEN d = 9
IF bg$ = "A" THEN d = 10
IF bg$ = "B" THEN d = 11
IF bg$ = "C" THEN d = 12
IF bg$ = "D" THEN d = 13
IF bg$ = "E" THEN d = 14
IF bg$ = "F" THEN d = 15
fgg$ = LEFT$(aaa$, 3)
fg$ = RIGHT$(fgg$, 1)
IF fg$ = "0" THEN k = 0
IF fg$ = "1" THEN k = 1
IF fg$ = "2" THEN k = 2
IF fg$ = "3" THEN k = 3
IF fg$ = "4" THEN k = 4
IF fg$ = "5" THEN k = 5
IF fg$ = "6" THEN k = 6
IF fg$ = "7" THEN k = 7
IF fg$ = "8" THEN k = 8
IF fg$ = "9" THEN k = 9
IF fg$ = "A" THEN k = 10
IF fg$ = "B" THEN k = 11
IF fg$ = "C" THEN k = 12
IF fg$ = "D" THEN k = 13
IF fg$ = "E" THEN k = 14
IF fg$ = "F" THEN k = 15
COLOR k, d
LOCATE y, x
PRINT "-"
END IF
IF aaaa$ = "8" THEN
bgg$ = LEFT$(aaa$, 2)
bg$ = RIGHT$(bgg$, 1)
IF bg$ = "0" THEN d = 0
IF bg$ = "1" THEN d = 1
IF bg$ = "2" THEN d = 2
IF bg$ = "3" THEN d = 3
IF bg$ = "4" THEN d = 4
IF bg$ = "5" THEN d = 5
IF bg$ = "6" THEN d = 6
IF bg$ = "7" THEN d = 7
IF bg$ = "8" THEN d = 8
IF bg$ = "9" THEN d = 9
IF bg$ = "A" THEN d = 10
IF bg$ = "B" THEN d = 11
IF bg$ = "C" THEN d = 12
IF bg$ = "D" THEN d = 13
IF bg$ = "E" THEN d = 14
IF bg$ = "F" THEN d = 15
fgg$ = LEFT$(aaa$, 3)
fg$ = RIGHT$(fgg$, 1)
IF fg$ = "0" THEN k = 0
IF fg$ = "1" THEN k = 1
IF fg$ = "2" THEN k = 2
IF fg$ = "3" THEN k = 3
IF fg$ = "4" THEN k = 4
IF fg$ = "5" THEN k = 5
IF fg$ = "6" THEN k = 6
IF fg$ = "7" THEN k = 7
IF fg$ = "8" THEN k = 8
IF fg$ = "9" THEN k = 9
IF fg$ = "A" THEN k = 10
IF fg$ = "B" THEN k = 11
IF fg$ = "C" THEN k = 12
IF fg$ = "D" THEN k = 13
IF fg$ = "E" THEN k = 14
IF fg$ = "F" THEN k = 15
COLOR k, d
LOCATE y, x
PRINT "|"
END IF
doner:
IF kk = 1 THEN GOTO left1
IF kk = 2 THEN GOTO right1
IF kk = 3 THEN GOTO up1
IF kk = 4 THEN GOTO down1
GOTO begin
Quit:
GOTO load
errorer:
CLS
PRINT
COLOR 4, 0
PRINT "ERROR!!!!!! FQMAPS.DAT NOT FOUND!!!"
PRINT "PLEASE REINSTALL!!!!"
PRINT
GOTO ender5
eeeeerrrrr:
PRINT
PRINT "Error, User tried to Cheat!"
GOTO nottt
no1:
SHELL "del Null"
COLOR 15, 0
CLS
COLOR 15, 0
PRINT
PRINT "Final Quest 2 V0.9B (C) 1998 HHSOFT"
PRINT "All Rights Reserved..."
PRINT
ender5:
CLOSE #8
COLOR 7, 0
END
nottt:
COLOR 7, 0
END

SUB clump (CLUMP1$, posx, posy, size, collor)
FOR i = 1 TO LEN(CLUMP1$)
d$ = LEFT$(CLUMP1$, i)
letter$ = RIGHT$(d$, 1)
letters letter$, posx, posy, size, collor
IF posx >= 620 THEN
y = y + 20
x = 10
END IF
posx = posx + 10
NEXT i
END SUB

SUB inv
COLOR 7, 0: CLS
COLOR 7: CLS : LOCATE , 20: COLOR 0, 5: PRINT "               "; : COLOR 15
PRINT "Inventory!               "; : LOCATE 2, 1: LOCATE , 20: PRINT " "; : LOCATE , 59
PRINT " "; : LOCATE 3, 1: LOCATE , 20: PRINT " "; : LOCATE , 59: PRINT " "; : LOCATE 4, 1
LOCATE , 20: PRINT " "; : LOCATE , 59: PRINT " "; : LOCATE 5, 1: LOCATE , 20: PRINT " ";
LOCATE , 59: PRINT " "; : LOCATE 6, 1: LOCATE , 20: PRINT " "; : LOCATE , 59: PRINT " ";
LOCATE 7, 1
LOCATE , 20
COLOR 0, 5
PRINT " "
LOCATE 7, 59
PRINT " "
LOCATE 8, 20: PRINT "                                        ";
LOCATE 9, 1: LOCATE , 20: PRINT " "; : LOCATE , 32: COLOR 15, 0: PRINT "Press any key..";
LOCATE , 59: LOCATE 8: LOCATE , 1: PRINT "" + CHR$(10) + ""; : LOCATE , 59: COLOR , 5
PRINT " "; : LOCATE 10, 1: LOCATE , 20
PRINT "                                        ";
END SUB

SUB letters (which$, px, py, sz, col)
which$ = UCASE$(which$)
IF px < 1 THEN GOTO noletter
IF px > 639 THEN GOTO noletter
IF py > 479 THEN GOTO noletter
IF py < 1 THEN GOTO noletter
IF sz < 1 THEN GOTO noletter
IF col < 1 THEN GOTO noletter
IF col > 15 THEN GOTO noletter
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

lettera:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
pl = sz / 3
pl$ = STR$(pl)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brgefddduulluddd"
GOTO noletter

letterb:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "ddddrehehl"
GOTO noletter


letterc:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brbrbdhgddfe "


GOTO noletter
letterd:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "ddddreuuhl"
GOTO noletter

lettere:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "ddddrrlluurrlluurr"
GOTO noletter

letterf:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "rrllddrrlldd"
GOTO noletter
letterg:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brbrbdhgddfeul"
GOTO noletter


letterh:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "dddduurruudddd"
GOTO noletter


letteri:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "rrlddddlrr"
GOTO noletter


letterj:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "rrlddddh"
GOTO noletter


letterk:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "DDDDUUeeggffhh"
GOTO noletter

letterl:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "ddddrr"
GOTO noletter

letterm:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
pl = sz / 3
pl$ = STR$(pl)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "dddduuuu"
DRAW "C" + color1$ + "S" + pl$ + "fe"
DRAW "C" + color1$ + "S" + tik$ + "dddd"
GOTO noletter

lettern:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "dddduuuufddfuuuu"
GOTO noletter

lettero:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brbrbdhgddfeuu"
GOTO noletter

letterp:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "dddduurehl"
GOTO noletter


letterq:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brbrbdhgddfeblfhbruu"
GOTO noletter

letterr:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "dddduuffhhrehl"
GOTO noletter

letters:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brrlgdrrdgl"
GOTO noletter

lettert:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "rrldddd"
GOTO noletter

letteru:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "ddddrruuuu"
GOTO noletter

letterv:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "dddfeuuu"
GOTO noletter

letterw:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
pl = sz / 3
pl$ = STR$(pl)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "dddd"
DRAW "C" + color1$ + "S" + pl$ + "EF"
DRAW "C" + color1$ + "S" + tik$ + "uuuu"

GOTO noletter

letterx:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "fddfhgeuue"
GOTO noletter

lettery:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "fegddd"
GOTO noletter

letterz:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
pl = sz / 3
pl$ = STR$(pl)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + pl$ + "rrrdgdgdgrrr"
GOTO noletter

lettercomma:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "bdbdbdbdbrrdg"
GOTO noletter

letterperiod:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "bdbdbdbdbru"
GOTO noletter

letterques:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
pl = sz / 3
pl$ = STR$(pl)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "bdbdbdbdbr"
DRAW "C" + color1$ + "S" + pl$ + "ubu"
DRAW "C" + color1$ + "S" + tik$ + "uehg"
GOTO noletter

letterexlam:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
pl = sz / 3
pl$ = STR$(pl)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "bdbdbdbdbr"
DRAW "C" + color1$ + "S" + pl$ + "ubu"
DRAW "C" + color1$ + "S" + tik$ + "uuu"
GOTO noletter

number0:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "ddddrruuuulldddEE"
GOTO noletter

number1:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brgeddddlrr"
GOTO noletter

number2:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "rrddllddrr"
GOTO noletter

number3:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "rrddllrrddll"
GOTO noletter

number4:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "ddrruudddd"
GOTO noletter

number5:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "rrllddrrddll"
GOTO noletter

number6:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "rrllddddrruull"
GOTO noletter

number7:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "rrdddd"
GOTO noletter

number8:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "ddddrruullrruull"
GOTO noletter

number9:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "ddrrlluurrddddll"
GOTO noletter

at:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "ddddrrlluuuurrdddlurd"
GOTO noletter

number:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
plk = sz / 4
pl = FIX(plk)
pl$ = STR$(pl)
tik = FIX(tik)
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "ddddbrbruuuubdllbdbdrr"
DRAW "C" + color1$ + "s" + pl$ + "rrllllllllllrruuuuuullrrrrrrrrrr"
GOTO noletter

dollar:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brbrbdlldrrdll"
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brdbdbdd"
GOTO noletter

percent:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "dbdbdbdeuuebdbdbdd"
GOTO noletter

up12:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "bdef"
GOTO noletter

amp:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "bdefghfgdrreblblbuff"
GOTO noletter

star:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brbdddurllreggefhh"
GOTO noletter

lp:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brgddf"
GOTO noletter

rp:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brfddg"
GOTO noletter

minus:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "bdbdrr"
GOTO noletter

under:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "bdbdbdbdrr"
GOTO noletter

equal:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "bdrrbdll"
GOTO noletter

plus:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brbdddurll"
GOTO noletter

forslash:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "bdbdbdbdeuue"
GOTO noletter

rarrow:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "ffgg"
GOTO noletter

larrow:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brbrggff"
GOTO noletter

quote:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "ddbrbruu"
GOTO noletter

apost:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brrdg"
GOTO noletter

semicolon:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brdbddg"
GOTO noletter

colon:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brdbdbdd"
GOTO noletter

rbrac:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "rrddddll"
GOTO noletter

lbrac:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "rrllddddrr"
GOTO noletter

lbrackets:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brbrgdlrdf"
GOTO noletter

rbrackets:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "fdrldg"
GOTO noletter

backslash:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "fddf"
GOTO noletter

up14:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "bdedddduuuuf"
GOTO noletter

down14:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "brddddegh"
GOTO noletter

right14:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "bdbdrrhfg"
GOTO noletter

left14:
posx$ = STR$(px)
posy$ = STR$(py)
color1$ = STR$(col)
tik = sz / 2
tik$ = STR$(tik)
DRAW "BM" + posx$ + "," + posy$ + "C" + color1$ + "S" + tik$ + "bdbrgfhrr"
GOTO noletter


noletter:
END SUB

SUB query
COLOR 4, 0
l = 15
startagain:
IF l = 0 THEN GOTO next11
PRINT CHR$(1); SPC(0);
i = 0
DO
i = i + 1
LOOP UNTIL i = 4000
l = l - 1
GOTO startagain
next11:
l = 15
next1:
IF l = 0 THEN GOTO next21
COLOR 2, 0
LOCATE , l:
PRINT CHR$(1); SPC(0);
i = 0
DO
i = i + 1
LOOP UNTIL i = 4000
l = l - 1
GOTO next1


next21:
q = 15
next222:
IF q = 0 THEN GOTO ended
LOCATE , q:
PRINT " "; SPC(0);
i = 0
DO
i = i + 1
LOOP UNTIL i = 4000
q = q - 1
GOTO next222
ended:
COLOR 7, 0
END SUB

