From [Reddit](http://www.reddit.com/r/programming/comments/9x15g/programming_thought_experiment_stuck_in_a_room/c0ewj2c)<br/>
Question from [/u/vanjos72](http://www.reddit.com/user/vanjos72)<br/>
Answer from [/u/kragensitaker](http://www.reddit.com/user/kragensitaker)

# The Challenge

Imagine you are imprisoned within a room for what will likely be a very long time. Within this room there is a bed, toilet, sink and a desk with a PC on it that is fully functioning electronically but is devoid of an Operating System. Your basic needs are being provided for but without any source of entertainment you are bored out of your skull. You would love to be able to play Tetris or Freecell on this PC and devise a plan to do so. Your only resource however is your own ingenuity as you are a very talented programmer that possesses a perfect knowledge of PC hardware and protocols. If MacGyver was a geek he would be you. This is a standard IBM Compatible PC (with a monitor, speakers, mouse and keyboard) but is quite old and does not have any USB ports, optical drives or any means to connect to an external network. It does however have a floppy drive and on the desk there is floppy disk. I want to know what is the absolute bare minimum that would need to be on that floppy disk that would allow you to communicate with the hardware to create increasingly more complex programs that would eventually take you from a low-level programming language to a fully functioning graphical operating system. What would the different stages of this progression be?

# The Answer

## The Monitor

You'd need a minimal "monitor" to start with — something that would let you enter in some binary code on an input device and jump to it. Here's a C version that lets you enter code in octal:

{% highlight c %}
typedef void (*function)();
char program[32];
int main() {
  char *t = program;
  unsigned i, n;
  for (;;) {
    for (i = 3; i; i--) {
      n = getch() - '0';
      if (n > 7) (*(function)program)();
      *t = *t * 8 + n;
    }
    t++;
  }
}
{% endhighlight %}

Translate that into 8086 machine code with a BIOS call for `getch()`, put it on the boot sector of the floppy, and you're golden. GCC compiles it into 12 instructions, plus the function prologue for `main()`. I think that would be 32 bytes in 16-bit mode. (Maybe the BIOS call would push it a couple of bytes over.) (I don't actually remember if the alt-keypad thing that lets you type arbitrary bytes is in the BIOS. If so, you could probably simplify the minimal monitor program above by removing the loop.)

Traditionally a monitor like this was first built into the hardware, and a little later as software in ROM. If you want to use it for more than a very short period of time, it needs at least a few more features:

* the ability to correct keyboard errors;
* the ability to see what you're typing (or does the BIOS have a call for `getche`?);
* the ability to display the contents of memory;
* the ability to change the address at which new bytes will be put into memory;
* the ability to install themselves at some interrupt vector so that you can return to them when your program hits an infinite loop;

So your first task would be to write a more full-featured monitor program, on paper if possible &mdash; otherwise carve it into the desk surface with some removed part of the computer &mdash; and then *very carefully* type it in. Your second version, with a backspace, might be 40 bytes or so; you now need to type in 120 octal digits without making a single error, followed by some character that isn't an octal digit. If you do this correctly, you are rewarded by seeing your new program come to life!

Your next task is to enhance your monitor program to be truly usable, by adding the rest of the features listed above. And then you want to find a way to write it to the floppy drive.

At this point you are hoping that this is a 5&frac14;" floppy drive so you can cut a couple of holes to make the disk into a "flippy": there's a substantial chance you're going to make a mistake and screw up writing your first boot sector, and if you do that, you're out of luck for the rest of your prison term.

So you write a call to the BIOS disk I/O routine, use it to write your new monitor program to the disk (hopefully on the back side of the disk), hold your breath, and test it.

Now you write another disk I/O routine that checks its argument to make sure it's not writing to the boot sector (or the original boot sector, which is at a different apparent location with the disk backwards) and start your system in earnest.

Edit: fixed two bugs in initial monitor code. Man, I would be so fucked if I were really in this situation.

## The Assembler

Your next task is to write an assembler, in memory, using your monitor. It doesn't have to be a fancy assembler with luxuries like multi-character mnemonics, the full instruction set, and stuff like that; it just needs to be an improvement over typing in x86 code in octal. Single-letter case-sensitive mnemonics for 25 or 30 opcodes, plus the ability to calculate jump offsets, are probably plenty to get to the next step. Save your assembler to the floppy in an unused sector. (You should be keeping a map of what's in what sectors, carved into the desk if necessary.)

This is also about the time you want to enhance your monitor program to show you the contents of registers and to be able to single-step.

At this point you have achieved your original goal of being able to implement Tetris or Freecell. The next step after here is roughly as hard as implementing one of these games in this impoverished assembler, so it isn't practical merely as a step toward that goal. But if you want to get to an operating system with a graphical user interface, read on.

## A Low-Level Language: Forth

Your next task is to bring up some kind of Forth, using your assembler. You can implement the basic primitives for a fairly reasonable Forth in about 200 instructions and 400 bytes of machine code, but that doesn't give you a text interpreter; that's another few hundred instructions. You can test each routine from your monitor program as you write it. (I have an [incomplete token-threaded Forth](http://github.com/kragen/tokthr) in 399 bytes of machine code, and a [complete self-compiling Forth compiler](http://github.com/kragen/stoneknifeforth) in 66 lines of code.)

Now you want to enhance your monitor program once more: you'll only be using it at boot time from now on, so you add a command to load and run a sector from elsewhere on the disk, so you can reboot more easily. You're going to be rebooting a lot, because every time you write a program that overwrites the wrong parts of memory, the machine is going to crash.

So at this point you've written somewhere around a thousand lines of code, which sounds like you ought to be able to do it in a day or two, but if you're like me, it's probably really more like two weeks because of the amount of effort involved in figuring out what went wrong each time you have a bug. And you're on the verge of having a usable programming environment: Forth has replaced your primitive assembler and monitor as your user interface of choice, you it can pretty easily be extended to loading programs from parts of the floppy disk, and now you probably want to implement some kind of minimal filesystem so that you don't accidentally overwrite your Forth operating system. It doesn't have to support fancy features like files that aren't contiguous on disk, files whose length isn't an exact number of sectors, nonsequential access, altering existing files, or multiple directories. It just has to keep you from accidentally overwriting data you meant to keep.

Now you probably want to write some utility programs: something to delete a file, something to defrag the disk, something to make a copy of a file, something to list the files on the disk, something to make a new version of a file. Also, you're probably becoming frustrated with waiting for the floppy disk to read and write data, so you probably want to implement LZW and huffman coding so that you can compress your files for speed. Also, you're going to have a hard time fitting the source code for an OS with a full-featured GUI on a single floppy disk without compressing it.

You can also very easily write a much more full-featured assembler now as a Forth vocabulary. Implementing your assembler as a Forth vocabulary magically gives your assembler macros and compile-time evaluation. You probably also want to write a disassembler now for debugging purposes.

You probably want a text editor now, with features like insert and delete, instead of poking strings of bytes into memory locations that contain your source code.

## Protected Mode and a Memory-Safe Language

By this time, you probably want to be in 32-bit protected mode, unless the machine is so old that it doesn't support it or doesn't have more than a few hundred K of memory. Programming the x86 in 16-bit real mode is a pain; you have these constant tradeoffs between performance and imposing arbitrary limitations on data structure size.

The downside of this is that all the machine code you've written up to now won't work any more. Hopefully you can alter your Forth assembler to generate 32-bit code, and generate a 32-bit version of your Forth from a Forth version of its source code.

Your next problem is probably to implement a memory-safe language, so you can stop spending so much time tracking down pointer errors. This is probably easier to do by implementing a dynamically-typed language like Lua than by implementing a statically-typed language that's advanced enough to be pleasant to use like OCaml. You might be able to do this by implementing a memory-safe vocabulary in Forth, but I've never heard of anyone doing this.

Alternatively, you could implement fancier syntax for an unsafe low-level language first, in the manner of C. You probably want to use [PEGS](http://github.com/kragen/peg-bootstrap), because you can implement a parser generator for those in under a hundred lines of code, and they're roughly as powerful for commonly-used languages as LALR parsers.

Given the constraint of a single floppy disk, you probably want to compile all of this stuff into memory from a minimal bootstrapping interpreter at boot time, rather than compiling source code and storing the compiled results. (I'm assuming you have several times as much memory as floppy-disk space.)

## Graphics

At this point you want to do graphics. Set the graphics mode to 640×480×16 via the BIOS, implement some graphics primitives by writing to the frame buffer, interface to the mouse so you can point at stuff on the screen easily, copy the font out of the VGA ROM, and implement a simple windowing system, a graphical text editor, and your games.

How does that sound? Remember the Macintosh guys did this stuff, without having seen it done before, on a 128kiB machine, mostly in assembly, in 1977–1983.

## Postscript three years later

Apparently this comment ended up at the top of [/r/bestof](http://www.reddit.com/r/bestof) today, so I guess I should link to the other stuff since then that's relevant: In 2011, I wrote a post about [bootstrapping from COPY CON](http://lists.canonical.org/pipermail/kragen-hacks/2011-April/000519.html), with some of these stages actually written in assembly and tested in DOSbox; Dave Long thoroughly one-upped that with [bootstrapping from ECHO](http://lists.canonical.org/pipermail/kragen-discuss/2011-April/001156.html), and found Greg Alt's [scheme-from-scratch](http://code.google.com/p/scheme-from-scratch/); later I tried [bootstrapping an interactive text editor starting from a noninteractive Lua interpreter](http://lists.canonical.org/pipermail/kragen-discuss/2011-June/001168.html), and then this year, Dave wrote a ["tweetable" "symbolic" hex COM loader](http://lists.canonical.org/pipermail/kragen-discuss/2012-May/001234.html), which is sort of like an assembler without mnemonics, in 140 bytes of machine code.

If you're interested in participating in the blog-like mailing lists where I post that kind of stuff, check out the [subscription page](http://lists.canonical.org/mailman/listinfo/).

Happy hacking!
