Version Changes (03/03/01) 093 Rev E

Ok, heres the deal..  I changed some mega things...  First, I completely
implemented mouse support into The leveler. Its now like 3.31 or something
now.  In Fq2, I changed it so when you use the print command and you do not
specify a background color, it automaticly prints it onto the background
color that is on the screen.  Also, if monsters are off, I added an array
called ReferenceArray$() that stores every command for a specific screen
and instead of FQ2 searching the Ref file every time you move the guy
around the screen, it searches the array.  This COMPLETELY makes it so
FQ2 doesn't have to search the hard drive while playing.  This is of
course only if you have monsters off. ANYWAY...  I guess I'll have to
keep programming.... I also added an array to make storing Saved names
easier. It is Realsavename$().  All five saved names are stored in it.
Also, when you save over a previous game, you can now just hit enter and
it will save it with the original name of that game.

Version Changes (02/28/01) 093 Rev D

HEY!!!  I completely cut 1/3 of the size of the map file by combining
the Frontground, background, and HARD status into ONE BYTE!! This is
possible because the backgrounds can be only 0-7, the forgrounds 0-15,
and the hard 0 or 1.  I also COMPLETELY changed the Install Program that
I used originally for Final Quest 2 and 1.  You can use reference files
to create a custom setup and you can ENCRYPT it so noone can know what
is in it but you.  It has mouse routines as well.  Man I'm ON A ROLL!!!
Uh, yea, I forgot that now that I have a new MAP system, I have to
COMPLETELY revamp the LEVEL.EXE file.  That's going to suck.. Anyway,
bye!!!

Version Changes (02/25/01) 093 Rev C

I tried to get the code to be more organized.  Also, I added the FIX,
DECLARE, and GETCHAR functions.

Version Changes (02/19/01) 093 Rev B

I changed the input routine for the primary Reference file.  It increases
speed a little, but not as much as I expected.  I am still reluctant to
use an array for different parts of the reference file, but it might come
to that.  The input routine, or inputer$ function, uses binary to do an
"Input" style routine.

Version Changes (02/17/01) 093 Rev A

Not much externally, but a bunch of internal routines were revamped to
make them move efficient.  Also, the SETTINGS.DAT and OPTION.DAT and
SET2.DAT files no longer exist.  I made a routine to store their values
into an array.  Also, added VOB function.

Version Changes (02/17/01) 092 Rev C

Brought the damn thing up to speed with Quest for Power. It is now at
the surpassing stage.  I have taken The leveler 3.0 for QFP and altered
it for FQ2.  It is now v3.1 2000.

Version Changes (10/17/99) 091 Rev A
Version Changes (07/30/99) 090 Rev H
Version Changes (12/10/98) 090 Rev D
Version Changes (11/26/98) 090 Rev B
Version Changes (10/16/98) 090 Rev B

Version Changes (08/06/98) 090 Rev A/B

Initial.  I am writing this on 2/17/01, but I just had to write something
here..  This was the very first time that I thought of Final Quest 2. I
took the FQ version 1.6 file and just started adding innovations, like the
different screen loader.  I started with only like 10 to 25 screens
originally, and now I am at 1920.  It sure has come a long way.  I started
Final Quest 1 on 6-21-98.

END FILE
