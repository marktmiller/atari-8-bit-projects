# Parr VM

This project was inspired by Terence Parr's InfoQ video [How To Build a Virtual Machine](https://youtu.be/OjaAToVkoTw?si=ffeAoOJ1LxWpiyPC).

He implemented a stack machine in Java. The logic looked simple enough that I thought I'd try to see if Basic could
handle it, really as a way of proving to myself, and possibly others, how non-threatening it is. Turns out Basic
handles it just fine (kind of slow, though).

Each file is implemented in Turbo Basic XL. You can find Turbo Basic [here](https://atariwiki-org.translate.goog/wiki/Wiki.jsp?page=Turbo-BASIC+XL&_x_tr_sl=pl&_x_tr_tl=en&_x_tr_hl=en&_x_tr_pto=wapp).

The files in this folder follow Parr's code presentation (you should watch the video). He goes through it in phases,
starting with a set of 16 operators, and a program that's only 4 bytes long. At the end, his operator set goes up to 18,
and a program that's 29 bytes long.

This is not a professional-grade VM. He designed it to be simple enough to show in his 2-hour demo, but it gets the
point across.

It has operators for manipulating the stack, using a global memory, doing some integer arithmetic operations, and
printing out values. In the last part of his demo, he uses his stack machine to compute factorials.

His VM has three areas of memory: program memory, where the bytecode is stored, a stack, and a global memory area. Each
VM program has code to execute hardcoded into it, in DATA statements. It feels like a return to the days when programs
were loaded from paper tape. To see the result, all you have to do is run each VM program.

Of course, the code to run can be changed, if you like.

The instruction set allows some sophisticated manipulation of the stack, because it doesn't just allow you to push and
pop values to/from it. It can also grab values already on the stack, and push them, or place them anywhere on the stack
you want.

The structure of the VM stores information in three areas of memory: a program area, where code exists, a stack, for
temporary values, and a global memory area, for longer-term storage, during a program run.

If you're unfamiliar with what a stack is, it's (for the most part) a last-in-first-out structure. In the case of these
VM programs, it consists of an array called STACK, and a "stack pointer", SP (index variable), that's used to reference
cells in it. When a value is "pushed" onto the stack, it means a value is assigned to the stack at the current stack
pointer location, and then the stack pointer is set to the next higher cell in the stack (for the next value to be
"pushed"). When a value is "popped" from the stack, it means the stack pointer is set to the next lower location in
the stack, "leaving behind" the value at the higher location.

Regardless, as you will see, there are operators that allow you to reference, and set values at any location in the
stack, at whim. So, you're not left to just "pushing" and "popping." These are just the operations that are typically
used.

This VM does not hold your hand while using these stack-addressing functions. Stack values you're trying to keep
can be overwritten, if you're not careful.

The stack is used a lot as a program executes, hence the name "stack machine."

To facilitate function calls, there's another index into the STACK array called the frame pointer, FP, which is changed
and restored, as functions are called.

As with a native code processor, you need a program counter, that shows the next program instruction to execute. This
also exists in Parr's stack machine, as the instruction pointer, a numeric variable called IP, which references cells
in an array called CODE, where the code in DATA statements is loaded when the VM is started up.

Since SP, FP, and IP are just indices into arrays, there's nothing complex about them. When I refer to "addresses"
below, I'm just talking about array index values.

Parr's VM, when all is said and done, uses the following instruction set. Some of the instructions need parameters. Any
parameters will be numeric. Their purpose will either be to give a quantity, or to give an address. Assume any parameters
are quantities, unless otherwise specified:

| Mnemonic | Bytecode value | Number of parameters | Short description | Long description |
| -------- | -------------- | -------------------- | ----------------- | ---------------- |
| IADD | 1 | 2 | Integer ADD | Pops two values from stack, adds the values, and pushes the result onto the stack. |
| ISUB | 2 | 2 | Integer SUBtract | Pops two values from stack, subtracts the upper from the lower (in stack position) value, and pushes the result onto the stack. |
| IMUL | 3 | 2 | Integer MULtiply | Pops two values from stack, multiplies them, and pushes result onto stack. |
| ILT |  4 | 2 | If Less Than | Pops two values from stack. If upper value is less than the lower (in stack position) value, it pushes 1 onto the stack. Otherwise, it pushes 0. |
| IEQ | 5 | 2 | If EQual | Pops two values from stack. If they're equal, it pushes 1 onto the stack. Otherwise, it pushes 0. |
| BR | 6 | 1 (address) | BRanch always | Unconditionally branches to given address in program memory |
| BRT | 7 | 1 (truth value), 1 (address) | BRanch if True | Pops truth value from the top of the stack, and branches to the given address in program memory, if the truth value is 1. |
| BRF |  8 | 1 (truth value), 1 (address) | BRanch if False | Pops truth value from stack, and branches to given address in program memory, if the truth value is 0. |
| ICONST | 9 | 1 | Integer CONSTant | Pushes given integer value onto stack. |
| LOAD | 10 | 1 | LOAD from stack | Copies value at given offset from the location specified by FP (referring to the stack), and pushes the retrieved value onto the stack. Another way of putting this is it's a copy operation that happens inside the stack, which uses an address relative to the location specified in FP. |
| GLOAD | 11 | 1 (address) | Global LOAD | Copies value at given address in global memory, and pushes it onto the stack. |
| STORE | 12 | 1 (value), 1 (offset) | STORE in stack | Pops value from stack, and stores it at the given offset from the location specified by FP (referring to the stack). Another way of putting it is it does the opposite of LOAD, taking a value from the top of the stack and storing it at a location inside the stack relative to the location specified in FP. |
| GSTORE | 13 | 1 (value), 1 (address) | Global STORE | Pops value from stack, and stores it at the given address in global memory. |
| PRINT | 14 | 1 | PRINT | Pops value from stack, and prints it to the screen. |
| POP | 15 | 0 | POP value from stack | Simply pops whatever value is at the top of the stack |
| HALT | 16 | 0 | HALT | Stops execution |
| CALL | 17 | 1 (address), 1 (parameter count) | CALL function at given address, and return value | This instruction pops one value off of the stack: a branch address. It leaves the parameter count where it is. It then pushes two items onto the stack: The existing value of FP (for the routine that's making the call), and the address of the next instruction in program memory to execute upon return from the call. It then changes the value of IP to the specified program memory address. The called function uses any parameter values pushed onto the stack, prior to the use of CALL. Hence, the parameter count is pushed. |
| RET | 18 | 0 | Return from function | Pops the next execution address, the frame pointer value, and the parameter count (all pushed by CALL) off the stack. It sets IP to the next execution address, and sets FP to the frame pointer value popped from the stack (which is the frame pointer for the routine that used CALL). |

The LOAD and STORE operators exist to access function parameters, and store "local variables," on the stack, respectively.

To show the action on the stack, Parr eventually added a trace function, which displays the contents of the stack after
each instruction is executed. This function also displays disassembled instructions, along with their program memory
addresses, as the program executes, so you can see what's being executed. There's a variable in the VM's Basic code called
TR for "trace." This is set to 1 in the code, but the program trace can easily be turned off by setting this variable to
0, which will just execute the program, and only display output when the PRINT operator is used.

## Organization

I documented which sections of Basic code are for which operators by putting REM statements at the end of each
conditional statement in the "grand" execution loop (starting at line 110)

A section of DATA statements called #PRG contains the bytecodes for the program to execute.

A section of DATA called #OPCODES contains the mnemonics of each operator, and the number of arguments each take. These
are loaded into the buffer INST$, and the array OPANDCNT, respectively. Incidentally, the bytecodes line up as index
values into both INST$ and OPANDCNT.

The IP instruction pointer is hardcoded at the start of each VM program, since the way Parr organized his code was that
the first instruction of each program to execute did not start at address 0 in program memory (he stored his functions
in lower memory, with the "main" starting point in higher memory).

## "Interactive" VM

After trying to play around with the VM for a while, I got really frustrated just looking at bytecode. So, I created what
I call an "interactive" VM (INTVM.TBS). It's a nicer environment for looking at bytecode, since you can disassemble
code, and run it, but there's no assembler, nor much of a debugger.

This VM contains all the operators from VM5.TBS, and I've added a few more:

| Mnemonic | Bytecode value | Number of parameters | Name | Description |
| -------- | -------------- | -------------------- | ---- | ----------- |
| IMOD | 19 | 2 | A modulo operator that pops two values off the stack, and does: (lower) MOD (upper) (in stack position). |
| IDIV | 20 | 2 | An integer division operator that pops two values off the stack, and does: (lower) div (upper) (in stack position). |
| TIME | 21 | 0 | This instruction pushes clock readings in "jiffies" (1/60th of a second) onto the stack. |

Instead of the code being hardcoded into the VM, it only loads bytecode from files.

I should mention that I also added three small programs that serialize some bytecode to files, named SAVFACT.TBS,
SAVFIB1.TBS, and SAVFIB2.TBS. These programs serialize bytecodes into binary files.

SAVFACT.TBS generates FACT.BCD, which is Parr's factorial program. The other two are a couple Fibonacci search
programs I wrote. FIB1.BCD is a traditional Fibonacci search algorithm. It's recursive, and not very efficient.
It's programmed to look for the 8th Fibonacci number. FIB2.BCD was really interesting for me, because I translated
it from an exercise (where I wrote a bit of the code) in a computer science text called "Structure and
Interpretation of Computer Programs," which optimizes the Fibonacci search. It was originally written in the Scheme
programming language, a Lisp dialect. I made it run in the Parr VM, and it wasn't that hard to make that work! It's also
programmed to look for the 8th Fibonacci number, to get an apples-to-apples comparison. It's more code, but it's
faster!

If you run FACT.BCD, it outputs the factorial of 5, which is 120.

If you run FIB1.BCD or FIB2.BCD, each outputs two numbers. The first is the 8th Fibonacci number (21), followed by
a time value in "jiffies" showing how long it took to run. To get the number of seconds, divide by 60.

The disassembled source code, with comments, for Parr's factorial program, and my Fibonacci programs, is in the file
srcwithcomments.txt.

When you run INTVM.TBS, it takes you into an interactive environment, with a "READY" prompt.

### Displaying/Running Programs

To load a program, use the command:

`BYTELD <filespec>`

Note you do not need quotations around the filespec. It consists of a drive spec., and the filename.

Example: `BYTELD D:FACT.BCD`

To display the disassembly of the code, type `LIST`.

A listing consists of three columns: The first column is the address within program memory of each instruction,
followed by the instruction, and then any arguments to that instruction.

All addresses are in decimal, as are all parameters to function calls.

To start the program executing, type `RUN`.

I didn't implement any trap for the Break key. If you press Break, it will take you back to Turbo Basic.

To leave the VM "gracefully," type at the READY prompt `EXIT`.

This will return you to Turbo Basic (you will see Turbo Basic's "Turbo" prompt).

### A little debugging

This VM allows you to look at, and alter its registers: IP, and SP, from within this interactive environment.

When each program was serialized, the preset for the start of the program (for the instruction pointer) was saved,
and is loaded into the VM. If you want to see this value, just type the register name, and hit Return:
```
IP
IP=21
```

If you want to change the IP value, type:

`IP=<address>`

(Put the new zero-based decimal address where you see \<address\>)

Same goes for the stack pointer, type "SP" by itself, hit Return:
```
SP
SP=3
```

and you will see its current address in the zero-based stack.

Note that program memory (the array called CODE) and stack memory (the array called STACK) are two separate address spaces.
While IP will only refer to an address (index value) within the CODE array, SP and FP refer to the same memory area in
STACK.

Before a program is run, SP defaults to -1.

You can change the stack pointer by typing:

`SP=<address>`

(Put the new zero-based decimal address where you see \<address\>)

The default is for program tracing to be turned off. To turn tracing on, type `DEBUG`.

If you want tracing turned off, type `NODEBUG`.

The tracing output is in three sections, when the program runs: The current instruction pointer address in program
memory, followed by ":", then a disassembly of the currently executing instruction, and its arguments (if any), and
a horizontal readout of the stack's contents (in []'s), from the first element, to the stack pointer's current location.

### A FastBasic version

Edit 11/30/23: As an exercise in learning FastBasic, I ported VM5.TBS to DMSC's FastBasic. I thought I'd include it
here, saved as VM5.FBS, if people want to take a look at that.

Some changes had to be made to the way that the operator strings are addressed in this version, due to the fact that even
though FastBasic supports string arrays, it doesn't have a READ command for DATA statements. Instead, arrays
are initialized off DATA automatically. No READ loops necessary. However, arrays of strings can only be initialized off
DATA as Byte arrays. Addressing such an array is effectively like using a packed character array, which means you sort
of have to address them like string buffers in Atari Basic or Turbo Basic. In FastBasic, individual strings in Byte
arrays have a length attribute that you have to skip over when indexing through them.

I also had to segregate out the operand count DATA into its own set (it's unified with the operator strings in the
Turbo Basic version).

What's nice about this version is FastBasic can use integer math (Turbo Basic only works in floating-point), which
suits the way Parr's VM operates. The CPU works faster with integers, and indeed, this version of VM5 runs 81% faster
than the one for Turbo Basic.

You can find FastBasic [here](https://github.com/dmsc/fastbasic).
