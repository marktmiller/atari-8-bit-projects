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

I used this program to create some of the sound effects in the Atari versions of Creative Computing games I've put under
the-best-of-creative-computing1 folder.
