# Selections from the Best of Creative Computing, Vol. 1, 1978

These are my Atari versions of some Basic games that were published in the first volume of the Best of Creative Computing,
by various authors. All of the games run in text mode.

https://archive.org/details/Best_of_Creative_Computing_Vol_1_1978_Creative_Computing_Press/mode/2up

I'm differentiating between versions of Basic for this collection. The first game, "Depth Charge," is written in Atari Basic,
and has the extension ".BAS". All the other games in this collection are written in Turbo Basic XL, and have the extension
".TBS".

You can find Turbo Basic at:

https://atariwiki-org.translate.goog/wiki/Wiki.jsp?page=Turbo-BASIC+XL&_x_tr_sl=pl&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp

# Depth Charge

Many years ago, I got a request to create an Atari Basic version of a game published in Creative Computing, called "Depth
Charge," to create a video of me playing it, and to send the source code to the person who requested it. I decided I'd grant
the request, as I have a fondness for the magazine, and I thought the game might be fun.

You can see my video of the game at https://youtu.be/xf1bEEx80aM

Since I was making the game for the Atari, I thought I'd put in some sound and visual effects, which were not in the original
version.

As part of this collection, I'm including the original source listings I wrote for this request, plus an "enhanced" version
I created recently.

I wrote two versions of the game, originally, since in the magazine, it talks about making a change that allows the submarine
to move around between shots.

In the first version, listed as DEPCHG1.BAS, the sub is randomly placed somewhere in a "cube" of water, but it does not move
during the game. You as the player also only get four shots before the sub blows up your boat with a torpedo. When the game
starts, you get to specify how large the cube is. For example, "10" for a 10x10x10 cube.

The second version, listed as DEPCHG2.BAS, is the same game, but the sub can also move one "space" in a random direction
between your shots, in any of the three dimensions (East-West, North-South, or up-down). So, in order to hit it, you probably
need to guess where it's moved *to*, not just where it was last reported by sonar. You are also asked how many shots/chances
you want before the sub blows you up. So, you can make this game as easy or hard as you want.

The way the coordinates are laid out is imagine your boat is floating on a "cube" of water where the origin is at the southwest
corner. The X-axis goes from West (lower number) to East (higher number), the Y-axis goes from South (lower number) to North
(higher number), and the Z-axis goes from the surface (0) down to the deepest part of the "cube" (higher number).

All coordinates are from 0 to the extent of the cube - 1, whatever you chose that extent to be. So, for a 10x10x10 cube, all
coordinates are from 0 to 9.

When making shots, the X-axis comes first. It specifies the West-East orientation of the shot. The next coordinate is
the Y-axis, which is the South-North orientation. The next coordinate after that is the Z-axis, which specifies how deep you
want the charge to go before it blows up.

You separate your X, Y, Z coordinates with commas when giving them to the game.

After each shot, if you miss, the sonar operator on your boat will tell you how you missed, for example, whether the shot was
too high, and if it was West of the sub, or North of it, or Northwest, etc. It's useful to pay attention to where your last
shot was, and adjust your next shot according to it.

That's really it.

The "enhanced" version is the same two versions of the game, except I've changed the sound effects. I also added a little
extra something if you get blown up by the sub. I added some delay logic, so that if your shot is shallow, you hear the
explosion quickly, but if you send the shot deeper, there is a longer pause before you hear it. I also tried to make the
deeper shots sound quieter (since they're deeper underwater), but in my tests, I didn't really hear a difference.

These "enhanced" versions are also written in Atari Basic, listed as DEPCHGE1.BAS and DEPCHGE2.BAS.

# Magic Cube

This game is a tad like tic-tac-toe, but the goal is a bit more complicated. It's not about X's and O's, but how numbers add
up in a 3x3 square. What you want to do is make sure the horizontals, verticals, and/or diagonals you complete add up to 15,
but to win, you want to prevent the computer from doing the same. The computer is going to try to do the same with you.

I didn't make much in the way of enhancements to this game. It's written in Turbo Basic, listed as MAGIC.TBS.

# Reverse

The goal of this game is to descramble a series of randomly arranged digits. The challenge is the only thing you can do is
reverse the order of a portion of them from the left side. You get to decide how many to reverse for each move. You can enter
0 to quit. There's no limit to the number of moves you can make. It counts the number of steps it took you to descramble the
sequence.

To finish the game, the sequence of digits must read:

123456789

I didn't make any enhancements to this game. It's written in Turbo Basic, listed as REVERSE.TBS.

# Splat

You are a parachutist. You drop from an altitude, and the goal is to open your chute before you hit the ground, and go splat!
However, the game rates you based on how low you get before opening your chute. The lower the better.

At the start of the game, you are given the option to choose your altitude, and/or to choose the acceleration due to gravity.
You have the option to skip these, and let the game choose them for you. The options it chooses, I find, are pretty
outlandish. It not only sets these parameters for you, but it tells you where you will be jumping:

It'll choose between Earth (fine), Mercury (Uhh...there's no atmosphere...), Venus (okay, the atmospheric pressure crushes
you before you land...), the Moon (again, no atmosphere...), Mars (okay), Jupiter (uh, nothing to "land" on...just a big ball
of gas...), Saturn (same...), Uranus (same...), Neptune (same...), or the Sun (Aaaaahh!!).

This game really doesn't go for realism, but if you can ignore this shortcoming, it can be interesting. Just assume you'll
survive if you open your chute before your altitude gets to zero. It's that simple. You don't have to worry about landing.
The point with these different planets, the Moon, or the Sun is the acceleration due to gravity is different.

The game uses some physics to do your drop, but it still makes things a bit unpredictable. It says it varies acceleration due
to gravity by +/-5%, and terminal velocity by +/-5%, but I've found it varies these parameters by more than that.

The thing you have to figure out is how long you want to wait before you open your parachute. This is timed in seconds, and
you have to do this before you drop. The goal is to open it as late as possible, without hitting the ground. You have to take
your altitude and acceleration due to gravity into account. To make things more complicated, it announces what your terminal
velocity may be (when your acceleration will stop, and you'll drop at a constant speed). What it doesn't tell you is when you
will reach it, if at all. You have to estimate that.

Whatever time you pick, the game will divide it up into eight drop reports, showing the elapsed time, and your altitude.

Another place where this game, I've found, lacks realism is that it can "miss" when you intended to open your parachute, due
to how it divides up the time of the drop, and make you crash, when if it hadn't divided up the time that way, it would have
"seen" this sooner, and opened your chute before you hit the ground. It's not perfect. This is a potential area where the game
could be improved...

I added a couple sound effects to the game. I also added a delay to the drop reporting sequence, so that there's a little
suspense. I based the delay on the actual time between reports of your drop progress. I also fixed a small bug. If you reach
terminal velocity, the original game would keep reporting that you've reached terminal velocity at each report interval. I
made it report that only once.

The game includes an interesting feature in that it keeps track of when you've opened your parachute in each drop, and saves
that record to a file on disk, called PARACH.UTE. The original game allocated a "very large" array of 4000 slots to record
this data, which made a pretty large file on disk. I just figured a record of 100 drops was more than enough. So, I shrunk
the array to that size.

When you start up the game, it tries to find this file on disk. If it's not there, it just continues with the game. If you
quit the game, it takes the drops you've done successfully, and saves them to this file. When you start up the game again,
it will load this record, add to it as you play, and will give you a rough idea of how you've done compared to past drops.

John Yegge, who wrote this game, is a character. You'll see that if you try to quit the game, or if you open your chute too
early. I've kept the character he put into the game.
