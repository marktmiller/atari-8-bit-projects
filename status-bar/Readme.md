# Status bar

CURSTRAK.M65
============
This routine tracks your cursor, as you move it around the screen. I wrote it as a vertical blank interrupt routine in Mac/65. I
didn't locate it so that you could assemble it to memory, since it loads into Page 6, which Mac/65 uses. To assemble it, use the
following command to assemble it to disk in Mac/65:

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

What this illustrates is you can update status information on the screen without needing to do it in your main code. The vertical
blank routine does all the work.

If you'd like to relocate the routine in memory, change lines 20 and 640 to use new addresses. I located the short initialization
routine 60 bytes past the start of the vertical blank routine.

I want to note that the division routine I used to extract the individual digits from the cursor coordinates is a modified version
of the division routine described in "The Atari Assembler," by Don and Kurt Inman.
