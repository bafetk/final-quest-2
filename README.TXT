Version Changes (07/22/01) 094 Rev D UPDATE 3:

Hey!! Sup, I decided not to change the revision all that often. Instead,
I will do "Updates".  This is update 3.  I made a small revision.  The
Inventory Position in the Ref file is now REF programmable.  That's pretty
much it.  Still working on Port City... All I have done Ref wise is the
Bank... Later!

Version Changes (07/13/01) 094 Rev D UPDATE 2:

(FQ2094D2.ZIP) Now, time is: 00:11:26 AM
Ok, here it is... I think that I'm done with the map generator. I think that
it's good enought for what it is supposed to do, and I can always edit the
maps after it generates them, right?  Anyway... I made a little utility
called SHOWALL.BAS... anyway... It reads maps.dat and shows like the first
40 or so maps, in screen 12!  It puts them all together so that you can see
all of the maps at once.  It's really cool.... You should look at it.
(reader)... Anyway... Just having a little fun... I don't think that that
scroller idea that I had is going to work, so I scrapped it.

Version Changes (07/12/01) 094 Rev D UPDATE 1:

Well, I had some more trouble with my computer, but I got it squared away.
I created a Map Generator a couple days ago and a Globe Generator.. They
take the long time of making maps away... They still need a little work
though.

Version Changes (07/05/01) 094 Rev D

Ok, now that I can update more often now, I have started to.  I first did
something with the monster routine.  I added four new types to the TYPES.
The purpose was to eliminate the need to go through the NOSCR file in order
to determine which screens there should be monsters on and which screens
there should not.  The bottom four types are for no monsters, the upper four
are for monsters.  I also changed the Leveler for this addition, it is now
3.32.  In addition to those changes, I also changed the way that the program
determines which color that is in the space that the user is occupying.
Instead of having to search the file over and over again, I used a function
in QB called SCREEN which allows me to determine the background color.  This
saves time and is more efficient.  I organized the code a little more. I
didn't turn on my computer at all yesterday, that is very scary.  What am I
turning into?  Ha :-) I guess I'm just used to not having a computer.  I know
this is Verbose.  Another revision that I am planning consists of this:
There will be different monsters for different screens.  I haven't figured
out how this is going to work yet, but I can't wait to figure it out.  That
is my next project.

Version Changes (05/19/01) 094 Rev C

(Writing on 7/01/01)
Ok... I had some trouble with my motherboard, and this is the second time 
since the 04/26/01 that I have been able to get on my computer.  So, I have
finally gotten my mb back, now I can update FQ2!!!  On 5/19/01, I updated
the statusbar line so it wouldn't update so much, and I put a block in the
Refs.dat file where you can customize the bar.  I don't remember what else
I fixed, but my mb broke again a day later, so I couldn't update this.
Anyway... I bought a new mb and a new processor.  Same speed, but at least
this one works.  Back to normal I guess.  Oh yea, Final Quest celebrated its
third birthday on the 21st of last month... Too bad I couldn't see it. :-(

Version Changes (04/01/01) 094 Rev B

Hey!! I put all the Save Game and Load Game routines in a function in
the second module so that they wouldn't clutter up the main module. I also
renamed all the FQMAPS.DAT etc to MAPS.DAT etc like in QFP.  I updated
LEVEL.EXE for this as well.  I went through and tried to organize the
code.  I don't know... I don't think I'll ever be able to completely
organize it. :-).. Anyway.......

Version Changes (03/25/01) 094 Rev B

Ok, I haven't been updating in a while, but here goes.  I revamped the
Monster Routines, so they are more sound.  Also, I completely changed the
weapon and armour routines.  You can now have as many armours and weapons
as you like.  I am planning to fix the #MONSTER routine now.. so... bye!

Version Changes (03/07/01) Rev 094

Well.  I did something that I never thought possible in a million and
one years.  I broke the FQ2.BAS Module up to FQ2MOD1.BAS and FQ2MOD2.BAS,
soon to be renamed FQ2.BAS AND FQ2MOD2.BAS.  I can't believe it.  I can
once again compile the program using the original QB45 compiler.  I no
longer have to use the program that I made to do it.  It is SO COOL!  Any
way,  this allows for unlimited expansion, as long as I limit my additions
to the main module.  I guess this is a good thing... So for that reason, I
upped the version.  It is now Rev 094.  We are coming closer and closer
to completion, but on the other hand, I have been programming this thing
for like 4 years so I don't think it will ever end.  But that is ok
because it gives me something to do.

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
DECLARE, and GETCHAR reference functions.

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

Version Changes (08/06/98) 090 Rev A/B     /* it is 1.0B in the BAS */

Initial.  I am writing this on 2/17/01, but I just had to write something
here..  This was the very first time that I thought of Final Quest 2. I
took the FQ version 1.6 file and just started adding innovations, like the
different screen loader.  I started with only like 10 to 25 screens
originally, and now I am at 1920.  It sure has come a long way.  I started
Final Quest 1 on 6-21-98.

Version Changes (08/06/98) Final Quest V1.7 Revision B

Okay, today is 7/15/01, and I have an update to the above message.  The files
in FQ17B directory are actually the beginnings of FQ2.. It appears that it
was originally going to be Final Quest 1.7, but then I decided to change
it to Final Quest 2, on the same day... well, here are the beginning files.
Also, in Zip.Zip there is evidence that I knew the name Final Quest as
early as 2/12/98 and I have a working(sort-of) copy of the game.  It is
incredibly primative, but hey, it proves that the first time that I thought
of final quest was on or before 2/12/98.


END FILE
