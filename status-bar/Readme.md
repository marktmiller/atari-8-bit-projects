# Status bar

CURSTRAK.M65
============
This routine tracks your cursor, as you move it around the screen. I wrote it as a vertical blank interrupt routine in Mac/65.

You can get Mac/65 from:

https://www.atariwiki.org/wiki/Wiki.jsp?page=Mac65

I didn't locate it so that you could assemble it to memory, since it loads into Page 6, which Mac/65 uses. To assemble it, use
the following command to assemble it to disk in Mac/65:

ASM ,,#D:CURSTRAK.EXE

if you've already loaded the source code into Mac/65

or,

ASM #D:CURSTRACK.M65,,#D:CURSTRAK.EXE

if you just want to assemble it from/to disk.

You can then load the EXE file from DOS, using the L (Binary Load) option, and specifying: D:CURSTRAK.EXE as the binary file to
load.

The vertical blank routine activates the moment it's loaded. It does not clear the screen. If you look in the upper-right corner
of the screen, you will see the X and Y coordinates of the cursor. If you move the cursor around, you will see the coordinates
change.

It locates the screen address through memory locations 88 and 89 ($58, $59), and writes the coordinates directly to the screen.

The division routine I used to extract the individual digits from the cursor coordinates is a modified version of the division
routine described in "The Atari Assembler," by Don and Kurt Inman.

What this vertical blank routine illustrates is you can update status information on the screen without needing to do it in your
main code. The routine does all the work.

If you'd like to relocate the routine in memory, change lines 20 and 640 to use new addresses. I located the short
initialization routine 96 bytes ($60 bytes hex.) past the start of the vertical blank routine.

CTUSR.M65
=========
This is the same vertical blank routine as CURSTRAK.M65, but I changed the initialization code so it can run from a USR() call,
such as from Basic.

You can assemble it in Mac/65 using either:

ASM ,,#D:CTUSR.OBJ

if you've loaded the code into Mac/65,

or

ASM #D:CTUSR.M65,,#D:CTUSR.OBJ

to assemble it from/to disk.

You'll need to use one of these two commands, since due to where I located the binary code (in Page 6), it will not assemble to
memory.

I was inspired to create this version because of a status bar demo Thomas Cherryhomes made in Atari Basic, using a custom display
list. (See: https://youtu.be/pY8kH-qsr8k)

I've included a PDF of a Turbo Basic XL listing that runs Thomas's demo with my cursor tracking routine. The reason I've made it
a PDF is a plain text listing will not give you all the characters you need. Though, if you just want to load the Turbo Basic
demo, without typing in that portion of the code, I've included the tokenized Basic program, STATBAR.BAS. If you want to use
that, you can just type in Basic:

LOAD "D:STATBAR.BAS"

You can get Turbo Basic XL from:
https://atariwiki-org.translate.goog/wiki/Wiki.jsp?page=Turbo-BASIC+XL&_x_tr_sl=pl&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp

With this version of the routine, instead of writing directly to the screen, the vertical blank routine writes to STAT$ in
Thomas's code, since his code has his custom display list use STAT$ as screen memory.

If you want to use Atari Basic, instead, it's still possible to run this demo with my cursor tracking routine. You will not be
able to load STATBAR.BAS, however.

Most of the code in the PDF listing will work in Atari Basic. The only changes you'll need are to skip line 270, and line 280
should read:

V=USR(1648,ADR(STAT$))

Once you're done typing in the Basic code, you should save it. Then type "DOS", use the "L" (Binary Load) option in the DOS menu,
and give it the filename:

D:CTUSR.OBJ

Then use the "B" option to get back to Basic.

You should then be able to type "RUN" to run the demo (If not, reload the Basic program you saved, and run it).

If you want to relocate the vertical blank routine in memory, change the addresses at lines 20 and 670. I located the
initialization code 112 bytes ($70 bytes in hex) from the start of the vertical blank routine.
