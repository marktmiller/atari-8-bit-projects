# Isometric ball bouncing simulation

I was inspired seeing this project written in Basic Anywhere Machine (BAM) to write a port for the Atari 8-bit. The BAM version
may have been written by Chuck Veniot.

[Isometric ball bouncing simulation](https://basicanywheremachine-news.blogspot.com/2025/03/isometric-bouncing-ball-sim.html)

![Isometric ball bouncing screenshot](https://github.com/user-attachments/assets/87d19767-3673-4e80-aa1e-4cf4a0aaa3fe)

My version is written in Turbo Basic. I have two versions: One written to run in the interpreter (IBBSINT.TBS), and one that
I modified so it could be compiled (IBBSCOMP.TBS). It doesn't read as nicely, but the compiled version runs quite a bit
faster, more like what I saw in the BAM version.

The interpreter version is easy. After you've ENTER'ed the code in Turbo Basic, just SAVE it, and run it.

To compile IBBSCOMP.TBS, ENTER it into the Turbo Basic interpreter. SAVE it, go into DOS, and run COMPILER.EXE, select the
SAVEd file, to create a .CTB file (name it whatever you like). Return to DOS.

There are two approaches you can now take:

You can either load RUNTIME.EXE, and from it, (L)oad your .CTB file.

You can also make a copy of RUNTIME.EXE, name it whatever you like, and name your .CTB file AUTORUN.CTB. You can then
load your .EXE file, and it will automatically run this program.

Enjoy.
