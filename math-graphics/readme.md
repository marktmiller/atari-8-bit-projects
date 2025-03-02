# Math graphics
Palling around with other Basic programmers, I've been inspired by some math-based graphics they've done, all on other
platforms. I've ported some of these projects to Turbo Basic on the Atari.

Listed below are the projects I ported, showing what they originally looked like.

## Cornu spiral
From BBC Basic, by Richard Russell
![BBC Basic Cornu spiral](https://github.com/user-attachments/assets/745841ad-5c4d-4913-b9ba-fa7695662ed2)

The Turbo Basic version is called CORNU.TBS

It takes a long time to run on the Atari. I've thought it could be modified to run faster, by increasing the "stepper" value.

It was originally written to run in a much higher resolution. I pared down the resolution for the Atari version, but not the
number of calculations the program does.

## Modified Guilloche pattern
From Microsoft Small Basic, from a book called "Kid Programmer"
![Microsoft Small Basic - Modified Guilloche pattern](https://github.com/user-attachments/assets/093167e9-6124-4e12-b3f8-706b5e5420d6)

The Turbo Basic version is called GUILLOCH.TBS

## Schotter
Originally written by Georg Nees for a Zuse Graphomat Z64 flatbed plotter in 1968, using a programming language for the
plotter. I got it from an article [Schotter - Georg Nees - Part 1](https://zellyn.com/2024/06/schotter-1/) by Zellyn Hunter.
![Schotter from Z64 plotter - Zellyn Hunter](https://github.com/user-attachments/assets/f8f18b14-ad36-409f-a874-41b11baafe9a)

Hunter had ported it to Python. I ported it to Turbo Basic, largely from the original source code in the plotter language,
using the Python code as a "sanity check."

The Turbo Basic version is called SCHOTTER.TBS

## Fractals in Focus
From TRS-80 Hi-Res Basic, in the May 1985 issue of 80-Microcomputing Maggazine, article written by Steve Justice
[Fractals in Focus in the May 1985 issue of 80-Microcomputer Magazine](https://archive.org/details/80-microcomputing-magazine-1985-05/page/n59/mode/2up?view=theater)
![80-micro Magazine - Fractals in Focus](https://github.com/user-attachments/assets/39dc02d7-bdc1-4bfe-9166-29e1a9cf6426)

Tektronix Basic version by Monty Jaggers McGraw
![Tektronix Basic - Fractals in Focus](https://github.com/user-attachments/assets/2ac15deb-cee8-4d19-8208-c8ff0fec299d)

I used the original TRS-80 Hi-Res Basic version to adapt it to the Atari, but was inspired by a change McGgraw made in his
Tektronix version, where he displayed the input parameters, and the generated directional "moves" that the program uses to
generate the fractal, alongside the graphic. You'll see I did the same thing in the Atari version (as much as could be
displayed).

The Turbo Basic version is called TRSFRACT.TBS

Reading the article by Justice is helpful, as he explains some parameters you'll need to enter to generate patterns.
