DECLARE FUNCTION exist! (file$)
DECLARE SUB Mouse (which!)
DIM SHARED mouser$, mouseleftbutton, mouserightbutton, mousexpos, mouseypos, ax%, bx%, cx%, dx%, xpos, ypos
DIM Map(5000)
mousecontrol = 0

gg$ = " "
Mouse 0
Mouse 4

C$ = UCASE$(COMMAND$)
IF C$ = "" THEN filename$ = "Globe.dat"
IF C$ <> "" THEN filename$ = C$


IF C$ <> "" THEN
        filename$ = C$
        GOTO continue3
        END IF

IF exist("globe.dat") = 0 THEN
        INPUT "Please enter map template to edit eg. GLOBE.DAT:"; filename$


IF filename$ = "" THEN filename$ = "GLOBE.DAT"

continue3:

IF INSTR(filename$, ".") = 0 THEN filename$ = filename$ + "."
IF INSTR(RIGHT$(filename$, LEN(filename$) - INSTR(filename$, ".")), ".") THEN END
IF INSTR(filename$, ".") - 1 > 8 THEN END

END IF


x = 1: y = 1
x23 = 1: y23 = 1
rp = 1: Null$ = CHR$(0)
dddd$ = filename$




OPEN filename$ FOR BINARY AS #98

IF LOF(98) < 2 THEN
        FOR gss = 1 TO 1920
                sd$ = CHR$(0)
                PUT #98, gss, sd$
        NEXT gss
END IF

FOR number = 1 TO 1920
a$ = SPACE$(1)
GET #98, number, a$
Map(number) = ASC(a$)
NEXT number
CLOSE #98



loader1:
        CLOSE
        OPEN filename$ FOR BINARY AS #1
                COLOR 15, 1: CLS
                LOCATE 1, 1
                        FOR xcc = 1 TO 1920
                        xc = CSRLIN
                                IF Map(xcc) = 0 THEN
                                        COLOR 15, 1: PRINT " "; SPC(0);
                                END IF
                                IF Map(xcc) = 11 THEN
                                        COLOR 15, 2: PRINT " "; SPC(0);
                                END IF
                                IF Map(xcc) > 0 AND Map(xcc) < 11 THEN
                                        IF Map(xcc) < 10 THEN COLOR 10, 2: PRINT LTRIM$(RTRIM$(STR$(Map(xcc)))); SPC(0);
                                        IF Map(xcc) = 10 THEN COLOR 10, 2: PRINT LTRIM$(RTRIM$(STR$(0))); SPC(0);
                                END IF
                        NEXT xcc



COLOR 7, 0

beginer:
LOCATE 25, 1: PRINT STRING$(80, " "); SPC(0); : LOCATE 25, 1

PRINT "ESC-end, Enter-Create, D-el, W-rite, T-ype, C-opy, S-tamp. Screen "; LTRIM$(STR$(rp)); SPC(0);

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
IF rp <> oldrp THEN LOCATE 25, 66, 0: PRINT rp; SPC(0); STRING$(5 - LEN(LTRIM$(STR$(rp))), " "); SPC(0);

        IF mouseleftbutton = -1 THEN
                DO: Mouse 3: LOOP WHILE mouseleftbutton = -1
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
                CASE "D"
                        GOTO DEL
                CASE "W"
                        GOTO writer
                CASE CHR$(13)
                        Map(rp) = 21
                        GOTO loader1
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
                CASE ELSE
                        GOTO beginer
        END SELECT
GOTO quit5

copier:
        buffer = Map(rp)
        GOTO beginer

stamp:
        Map(rp) = buffer
GOTO loader1

DEL:
     Map(rp) = 0
GOTO loader1


typer:
IF Map(rp) = 11 THEN Map(rp) = -1
Map(rp) = Map(rp) + 1
GOTO loader1


writer:
FOR ixx = 1 TO 1920
d$ = CHR$(Map(ixx))
PUT #1, ixx, d$
NEXT ixx
LOCATE 25, 1: PRINT STRING$(80, " "); SPC(0); : LOCATE 25, 1: PRINT "Done.. Press any key..."
i$ = INPUT$(1)

GOTO loader1


quit5:
IF filessize <= 2 THEN KILL filename$
COLOR 7, 0
CLS
COLOR 15, 0
PRINT
PRINT "Global Template Editor 2001, v1.0, (C) Copyright 2001 Akori Software"
PRINT "All rights reserved..."
PRINT
CLOSE
END

DATA 55,89,E5,8B,5E,0C,8B,07,50,8B,5E,0A,8B,07,50,8B
DATA 5E,08,8B,0F,8B,5E,06,8B,17,5B,58,1E,07,CD,33,53
DATA 8B,5E,0C,89,07,58,8B,5E,0A,89,07,8B,5E,08,89,0F
DATA 8B,5E,06,89,17,5D,CA,08,00

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

SUB Mouse (which)
'0 = Mouse Init
'1 = Mouse Driver
'2 = Mouse Put
'3 = Mouse Status
'4 = Mouse Hide
'5 = Mouse Show
IF which = 0 THEN
  mouser$ = SPACE$(57)
  FOR i% = 1 TO 57
    READ a$
    h$ = CHR$(VAL("&H" + a$))
    MID$(mouser$, i%, 1) = h$
  NEXT i%
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

