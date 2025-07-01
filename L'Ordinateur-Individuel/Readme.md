I was shown a repository for an old French computer magazine, called L'Ordinateur-Individuel (Individual Computer), and got
interested in porting a couple of their program listings to the Atari.

I converted all comments and Print statements to English.

# quand l'Atom a rendez-vous avec la Lune (When the Atom goes to the moon), December 1983
Author: Francis Reignat

Original implementation in Atom Basic

[Original listing](https://download.abandonware.org/magazines/L%20Ordinateur%20Individuel/ordinateurindividuel_numerohs54/L%27ordinateur%20individuel%20HS%20N%C2%B054%20-%20page082%20et%20%20page083.jpg)

![Atom Lunar Lander screenshot](https://github.com/user-attachments/assets/7926a6d7-c9e5-4a95-9031-7076b3e37952)


This is Lunar Lander for the Acorn Atom computer. I ported it to Turbo Basic XL, listed as MOONLAND.TBS.

Control your lunar module using a joystick plugged into Port 1. Use Left and Right on the stick to steer your module left
and right. Press the Fire button to fire the main rocket, to increase or maintain altitude.

As with the classic Lunar Lander game, your goal is to land your module on the base, which is a flat area of the landscape,
highlighted with a black line. Don't come down too hard, or you'll crash. Once you get close to the base, the game zooms in
on it, to allow you to fine-tune your landing.

Once the game has zoomed in on the base, it stays in the "zoom mode" until you land, or crash.

You can also land your module anywhere on the moon's surface. The game will just notify you that "you have to walk" some
distance to the base.

While the game restricts the module's movement, so it doesn't go off the left or right side of the screen, you can fly the
module "above the screen." Just turn off the main engine, and the module will come back into view.

Each time you land (or crash), you'll get a message from the game, and then it'll restart. There is no score. Just do it as
long as it's fun. :)

# Pseudo-Assembleur (Pseudo-Assembler), December 1985
Author: Luc Pineau

Original implementation in TRS-80 Basic

[Original Listing 1](https://download.abandonware.org/magazines/L%20Ordinateur%20Individuel/ordinateurindividuel_numerohs77/L%27Ordinateur%20Individuel%2077%20HS%20%28d%C3%A9c-1985%29%20-%20Page%20074.jpg)

[Original Listing 2](https://download.abandonware.org/magazines/L%20Ordinateur%20Individuel/ordinateurindividuel_numerohs77/L%27Ordinateur%20Individuel%2077%20HS%20%28d%C3%A9c-1985%29%20-%20Page%20075.jpg)

I'd seen examples of this in some Commodore 64 Basic code, where programmers put machine code in hex, perhaps along with
mnemonics, inside REM statements, which some routine would read through, and poke the machine code into memory. The author of
"Pseudo-Assembler" did this on the TRS-80. I ported his code to Turbo Basic XL. It's called PSEUDASM.LST. It's LISTed code
that's designed to be ENTER'ed into your Basic code. It's designed as a more readable substitute for using DATA statements to
enter machine code into memory.

Pseudo-Assembler is not really an assembler, hence the name. It's a hex code converter, but what's nice is it allows you to
list assembly mnemonics alongside your code.

The way Pseudo-Assembler works is it finds the top of your Basic program, and expects your program to begin with your
machine code in REM statements. To emphasize, your entire machine code listing, in REM statements, _must_ be at the very
start of your program.

Pseudo-assembler code is formatted thusly. (This is a "dummy" routine I wrote that just increments the X register from 0 to
10, stored in Page 6 ($600)):

```
10 REM 0600 A2 00   .LDX #0         .
20 REM 0602 E8      .LOOP INX       .
30 REM 0603 C9 0A   .CMP #10        .
40 REM 0605 D0 FB   .BNE LOOP       .
50 REM 0607 00      .BRK            .
60 REM 0608 XX      .end program    .
```

The Pseudo-Assembler routine expects fixed-width formatting in the REM statements. All addresses where code will be placed
(the first number after "REM") must be four hex digits wide (pad with zero, if necessary). The machine code field that comes
after must always be 8 characters wide (pad with spaces, if necessary). The "comment field," where the mnemonics are listed,
must be 17 characters wide, including a non-space character at the end. (This listing uses periods to mark the comment field.)
This is important, since if a line is not ended with a non-space character, Basic automatically truncates it, making it a
different length from the other lines. This will throw Pseudo-Assembler off, and cause bad data to be poked into memory.

Another important thing to note is the special "XX" code at the bottom of the listing. This tells the Pseudo-Assembler to
stop.

When you're ready to load your machine code, GOSUB to line 30290 from within your program. It will automatically enter your
machine code, and return control to your program.

## Hex dump

Pineau included a hex dump routine, which you can run if you need to inspect memory. You run it by typing in immediate mode:

`GOTO 30070`

The dump routine will ask you for a start address. Once you've entered that, it prints out memory in hex, starting from
the address you entered. It also prints out any printable characters. It keeps doing this until you press the 'E' key on
the keyboard.

You may want to press Ctrl-1 to pause/continue the dump.

If you press "E", the dump routine will stop, and ask "Different start address (Y/N)?".

If you press "Y", it will ask you again for a start address. Once entered, it will repeat the dump process, starting at the
new address.

If you press "N", it will clear the screen, and stop.

(You can also press the Break key at any time to stop the dump.)

If you do not want the dump routine as part of your program, feel free to delete lines 30070 through 30280. It's just there
as a helpful tool. The Pseudo-Assembler routine does not use any of it.

I've tested Pseudo-Assembler on an assembly listing of more than 100 lines of code that I converted to this "pseudo-assembler"
format. In a speed comparison, I found it 10x slower than using DATA statements, but the point of using it is its
readability. A likely reason for the slow speed is it's Basic code converting the hex to binary. I'm sure it would go a lot
faster if the conversion routine was in machine code.

## A conversion tool for assembly listings

I wrote a tool in Turbo Basic that converts a listing produced by an assembler into "pseudo-assembler" REM statements. It's
listed here as PACNV.TBS.

When you run this conversion tool, it asks you for the name of your assembly listing file, and the name of the text file you
want the Basic code it generates sent to. (You will ENTER the file it produces into your Basic program.) It prints out its
generated REM statements while it writes them to the output file.

I have only tested this tool with Mac/65-generated assembly listings. I assume it will work with Atari Assembler listings,
as well.

Since Pseudo-Assembler listings need to be at the top of one's program, and no other lines of code should be allowed to be
inserted in that code, I decided to start converted listings at Line #1, and each line number is incremented by 1.

## A Pseudo-Assembler example

SPLIT2.TBS is a test I did of Pseudo-Assembler. I took the assembler output for PRESLIB.M65 from my [split-screen](https://github.com/marktmiller/atari-8-bit-projects/tree/main/split-screen)
project and ran it through my conversion tool, PACNV.TBS. I modified the comments section of the pseudo-assembler code
a little, to bring in some of the assembly labels the converter excluded. I then ENTER'ed the converted file into
SPLIT.TBS from the split-screen project, and adjusted the rest of its code to use the Pseudo-Assembler to put the machine
code into memory. If you'd like to use this version of split-screen, read my directions for that project.
