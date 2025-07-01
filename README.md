# atari-8-bit-projects

These are various projects I've been inspired to write. Most are grouped into folders.

# Soundlab

I wrote this simple program in Atari Basic as a way to experiment with the Atari's sound registers. This program will also
work unaltered in Turbo Basic. The program listing is stored here as a PDF file, since it contains some characters that don't
translate to ASCII.

Simply run the program, and it will display all of the sound registers. You'll notice an arrow on the left side of register 0,
and inverse letters, P, D, V above the register list. These letters stand for Pitch, Distortion, and Volume.

To start experimenting with sound, pick a register by pressing the 0-3 keys on the keyboard. As you change registers, you will
see the arrow move up and down next to the register list, pointing to the register you will manipulate. You can move to a
different register at any time by pressing the 0-3 keys.

To change a parameter on a register, press the first letter of the parameter's name on the keyboard: "P" for Pitch, "D"
for Distortion, or "V" for volume, and then press the down-arrow on the keyboard to increase its value, or up-arrow to decrease
it. I suggest increasing the volume first for a register, or else you won't hear anything from it.

The point of this program is it allows you to easily alter multiple register values, and hear them together.

When you're done, press the "Q" key for Quit. This will turn all the sound registers off, so you don't have to hear your last
setting blaring through the speaker, but the last values that you altered in the registers will continue to be displayed on
screen, so that you can note them down, and use those values in your program.

I used this program to create some of the sound effects for other Basic programs I've posted to this repository.

# Binary-to-Data statements

CBINDAT.TBS is a utility I wrote in Turbo Basic to convert a DOS-formatted binary file (produced by a compiler or
assembler) to DATA statements in Basic.

It will prompt you for the binary file to convert, and then the text file where you want the converted output to go (you will
ENTER the generated file into your Basic program). It will also ask you what you want the starting line number for the DATA
statements to be.

After giving these three inputs, it will start converting the binary file.

It will display on the screen the binary segment addresses it's processing. These are the start and end addresses for the
bytes it's converting. These addresses are displayed in hex. After this, it will display the DATA statements it's created
for that segment (in decimal). If there are more segments to convert, it will repeat the display of start and end addresses,
followed by their DATA statements.

You may wish to note the start and end addresses, as they are not recorded in the converted file, and represent a memory map
of your machine code. You can press Ctrl-1 to pause the display. These addresses may be useful for your machine code loader.

Once it's done, it will give a count of the bytes that have been processed.

Next, load the program you want to use with the machine code you've converted, and then ENTER the generated file, to merge
the DATA statements with your program.

This program does not generate code for a machine language loader. That is left up to you.
