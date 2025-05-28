# Split-screen

![Split-screen](https://github.com/user-attachments/assets/5e114a2b-a370-4984-a9eb-1425910caa60)


I got a request in 2021 to create a demo where I had a Graphics 8 screen on the top half of the screen, and Basic code I was
working on in the lower half, that drew graphics on the upper half. The person requesting this thought there was a graphics
mode that could do this. There isn't. Though, documentation on the graphics modes have used the term "split screen" to
describe a mode you can put graphics modes into, where you use most of the screen as a bitmap display, with 4 lines of
Graphics 0 text at the bottom.

There is a way to program the Atari to do what was requested, but it takes some effort to pull off. I was interested in
trying to do this, but didn't know how at the time. I set about trying to figure it out for a while, and then got
interested in other things. I just recently got back to it, and finished it.

What's needed is a custom display list that sets up half of the screen as Graphics 8, half as Graphics 0, and some additional
memory used as screen RAM.

What I set up is kind of an optical illusion. I boot into Turbo Basic XL, and run a Basic program that sets up the
display list, and runs some machine language routines, to set up the split-screen.

I treat Graphics 0 like a "window," and "pull a shade" over the upper half of it, where I display 97 lines of Graphics mode
8. As far as Basic and the OS are concerned, they're still dealing with a full-size Graphics 0 screen, 24 lines of text
(but the Antic chip "knows different"). I didn't want the Basic cursor hiding behind my Graphics 8 pane, so I came up with a
vertical blank interrupt that brackets the cursor to the lower half on the Graphics 0 screen, so I could always see it.

Another problem I had to overcome was that whenever a Basic program ends, Basic closes the S: device on channel #6. This
prevents one from drawing bitmap graphics. When I'd try to run graphics code, I'd get a "device not open" error. So,
I had to reopen S: with what's essentially a "Graphics 0" command, but that clears the entire screen, taking away the
split-screen. To get it back, I reinitialize the system display list pointer to my custom display list. I also clear the
screen memory for the Graphics 8 pane, because it's using a separate area of memory that isn't cleared by the OS. I have
a "fill" routine to do that. Basically, once that's done, I can start drawing on the Graphics 8 pane.

However, while code is running, the lower pane is completely blanked out. This is due to the OS wiping the screen memory
when I reopen S:. I tried doing some things to get the code display back, so I could see it while the code was running,
but this created some weird effects I didn't like. So, I just keep the lower pane blank while the code runs, and I get the
cursor back in the lower pane when the code stops running. The Basic code is still in memory. It just isn't on the display.
It can be restored to the screen by just typing `LIST`.

As I progressed on this project, I could see I was using the Atari and Basic in ways contrary to their design. So, there
are some compromises. The main one being that some machine language routines need to be run to set things up for a program
to run, and then some "clean up" at the end.

Each program needs to be initialized, and closed down as follows:
```
10 X=USR($6150,$A400,$A600)
20 X=USR($6080,$A600,0,3880)
.
<do graphics>
.
100 X=USR($6175):POSITION 2,12
```
The first USR() call opens S:, and sets up registers to tell the OS we're now drawing in Graphics mode 8 on the upper pane.
The next call clears the Graphics 8 pane. The last call, when your code is finished, tells the OS we're now in Graphics mode
0. The POSITION command is there to reset the cursor to the lower half of the Graphics 0 screen, so you can see it, and the
cursor-bracketing code can keep it there. I tried putting this inside the last, "clean up" USR() call, but something
interferred with the cursor positioning (I suspect it's Basic), and I wasn't happy with the result. So, I just put that part
in Basic code, and it works.

Once you've executed the first two calls, you can proceed as if you've just executed a "Graphics 8" command. Though, the
upper pane's dimensions are different, of course, 320x97 (X range: 0-319, Y range: 0-96).

Once your code is finished, you should make the last USR() call, to bring the focus back to the lower (Graphics 0) pane.

I've included a sample Basic program that draws a design, so you can see what needs to happen.

Feel free to write your own graphics code in this setup.

## Using the split-screen

All you need to do is run SPLIT.TBS. It's written in Turbo Basic XL. You'll see some lines of text printed on the screen
while it initializes the split-screen, and then the split-screen will appear, with the Basic prompt in the lower pane.
From there, you can start writing code. You can also use the NEW command without worrying about disturbing the split-screen
display.

As I worked with this setup, I found some things to keep in mind. Sometimes I'd type something wrong, and get a runtime
error. This clears the screen, taking away the split-screen, and displays an error message. Getting back to the split
screen is pretty simple. Just execute `DPOKE 560,$A400:POSITION 2,12` in direct mode. This will restore the split-screen
display.

## The memory map

The custom display list is stored at $A400. The Graphics 8-pane memory starts at $A600. The machine language routines are
stored from $6000 to $6184.

It should be fairly easy to port this project to Atari Basic. The main thing would be reworking the IF-THEN logic. The
machine language routines should work with Atari Basic as-is, but I have not tested this.

I have included the assembly source code for reading. It's not necessary to assemble it. All of the machine code is
included in SPLIT.TBS as DATA statements, and is POKE'd into memory when the program runs.
