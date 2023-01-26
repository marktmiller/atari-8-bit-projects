# Atari version of "Graphics without input"
Original version by Francesco Petroni

I became inspired by looking at "Graphs of functions in Visual Basic for DOS" in Retro Magazine World (July/August 2021 issue),
by Francesco Fiorentini (https://www.retromagazine.net/retromagazine-world-09-eng-july-august-2021/). He based his code off of
code from an original article by Francesco Petroni, called "Graphics...without input," from MCMicrocomputer Magazine,
published in January 1985 (https://www.digitanto.it/mc-online/PDF/Articoli/037_083_088_0.pdf).

When I was an Atari owner in my youth, I'd sometimes see programs written for other computers (Commodore PET, IBM PC, Apple II,
etc.) that would do stuff like this, but I saw none for the Atari. I thought they looked really neat. So, I thought I'd try
my hand at recreating the same thing on the Atari, because surely it can do it!

I went through Petroni's original article, and adapted each of his Basic programs. I wrote the new versions in Turbo Basic XL
(You can get Turbo Basic XL from:
https://atariwiki-org.translate.goog/wiki/Wiki.jsp?page=Turbo-BASIC+XL&_x_tr_sl=pl&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp)

With each one, I tried to keep Petroni's code as intact as possible (only changing it where I had to), but I adapted his
output to the way the Atari operates.

I also used Google Translate to translate the article from Italian to English (see "English translation of "Graphics without
input" by Francesco Petroni - MCMicrocomputer, January 1985"), trying my best to clean up the translation a little, so it reads
easier. I couldn't reproduce the formatting of the original article (the translation is an RTF file), but tried to reproduce
the flow of the article and figures.

The first program (GRWOIN1.BAS) demonstrates building a pre-calculated table of trigonometric values for Sine and Cosine, and
then using this table to estimate the sines and cosines for angles the user inputs.

The second program (GRWOIN2.BAS) is the "main event." This is the one Fiorentini translated to Visual Basic. It's called
"Sample of surfaces in space." It runs 10 different functions in sequence, in 3D. You press a key after each one is done
to proceed onto the next one. I tried to keep the appearance of the display as close as possible to what Petroni had on the PC.
The largest part of the code is a partial implementation of Sutherland-Cohen clipping I wrote, since the 5th design goes
outside of the screen dimensions.

GW-Basic made it possible to set up the coordinate system you wanted to use, setting the X and Y axis proportions, and ranges.
It also did clipping automatically, so that if you drew outside of screen range, it would only draw the parts of lines that
came into range on the screen. The Atari doesn't operate this way. So, I wrote some emulation code that's "good enough" to get
the job done for this demo.

The third program (GRWOIN3.BAS) demonstrates just a couple designs, called "Curves on the Epicycloid and Hypocycloid Plane".
Petroni's description of how these curves are generated is reminiscent of the kinds of designs you can generate with
Spirograph. I included a bit of extra code that preserves the proportions you would see on the PC on the Atari.

The fourth program (GRWOIN4.BAS) is an adaptation of a program Petroni wrote in Applesoft Basic for the Apple II computer.
Petroni made this program do double-duty. It was supposed to be switchable between outputting to the Apple's high-resolution
display, or outputting to a plotter connected to the Apple II. In my adaptation, I only converted the part that outputs to
the screen. I ommitted the rest of the code (lines 340, 370, and 400-470 (see the translated article)). I also left out
line 240, because that seemed to be a bug (it Gosubs to a Return statement. Pointless).

I had some trouble converting this program, because I didn't realize until I read Petroni's section on this code carefully
that he set up the variables in the program for plotter output, and they needed to be changed for screen output, if that's
what you wanted. If you look at the values I set for the variables A and B in the Turbo Basic code, and compare them to his
code, you'll see I had to adjust these values significantly to get it to work for the screen. This has a lot to do with how
variable D is calculated.
