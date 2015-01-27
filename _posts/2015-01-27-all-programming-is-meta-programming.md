---
layout: post
title: All Programming is Meta-Programming
date: 2015-01-27 00:02:26.958502000 -08:00
---

At my day job, I'm currently working on a project that I'm building in Ruby. I'm building it in Ruby because I feel that it is the best tool for the job. Unfortunately, my coworkers don't have the same wealth of experience with Ruby that I do, so a few of them are showing signs of trepidation. They're worried about Ruby's syntax quirks (essentially, that it isn't a C-style language). They've got concerns about all of the "unnecessary syntactic sugar" or "crazy magic" that Ruby has. But when we write code, we're always working with abstractions and layering them one on top of the other until we can do our job with a single statement.

Don't believe me? Well let's take a look at some very simple code:

```ruby
File.open('test-file.txt', 'w') do |file|
  file.write('Some test text')
end
```

What does this code do? Well, at the most basic level it:

1. Opens the file `test-file.txt` for writing
1. Writes the text `Some test text` into it
1. Closes the file

But even that is an abstraction. Opening the file abstracts away the OS-level file descriptor that is the handle to the file. Writing the text elides the fact that there is a buffer behind it that gets flushed to disk when you close the file. And sure, you might have known about all of that. But do you know the intimate details of all of the other layers of abstraction like:

1. The OS-level system calls
1. The hardware driver for the bus type (IDE whether PATA or SATA, SCSI, USB)
1. The hardware driver for the specific drive type (HD, SSD, flash drive)
1. The caching on the drive controller
1. The caching on the drive
1. The laying down of the bits on the drive
1. And *et cetera*

And that's just the writing of the text into the file. That leaves out all the stuff about managing file descriptors, the file system, the memory management and garbage collection of the `File` object and so, so many other things that we just take for granted when we write code.

This is the way the human brain works, by building abstractions that allow us to understand more complex ideas by building up from simpler ones. Some of the most well-known research that shows this is in analyzing [how the thought process of chess masters differs from novices][chess-memory]:

> Years later, Chase and Simon replicated de Groot’s finding with another expert (a master-level player) as well as an amateur and a novice.  They also added a critical control: The players viewed both real chess positions and scrambled chess positions (that included pieces in implausible and even impossible locations). The expert excelled with the real positions, but performed no better than the amateur and novice for the scrambled positions ... The expert advantage apparently comes from familiarity with real chess positions, something that allows more efficient encoding or retrieval of the positions.

And the research shows that programmers use the same memory patterns to recognize common code constructs from uncommon ones.

So everything in programming is an abstraction. And not only that, but an abstraction on top of an abstraction on top of an abstraction. [It's turtles all the way down ...][turtles] but what does this have to do with Ruby?

Ruby has some syntactic features that allow you to create new abstractions that *look* like language constructs. Take, for example, the three lines of Ruby code near the beginning of this article. If we rewrote it in Java it might look like this:

```java
try {
    BufferedWriter file = new BufferedWriter(new FileWriter("test-file.txt"));
    file.write("Some test text");
} finally {
    file.close();
}
```

This code does exactly the same thing as the Ruby code. But it does it at a lower level of abstraction. This Java code makes it clear that whether or not an error occurs, we're going to close the file. But this is a really, really, really common code pattern. So common that C# created an official language construct just for ensuring that things get cleaned up called the [Dispose Pattern][dispose]. It looks like this:

```csharp
using (StreamWriter file = new StreamWriter("test-file.txt")) {
    file.WriteLine("Some test text");
}
```

Funny, that looks a lot like the Ruby code.[^java-too] The difference is that `using` is a special keyword in C# that is baked into the language. Could you duplicate the Dispose Pattern without needing a special keyword? Sure, but it wouldn't be as simple to write syntactically as `using`, which is itself slightly more complicated than Ruby's syntax above.

The best part about the Ruby `File.open` syntax is that the part between the `do` and the `end` keywords is called a "block".[^javascript] Every function in Ruby can accept one and only one block. So you'll find this kind of pattern everywhere in Ruby:

* `File.open` passes the `File` object to the block and closes the file when the block exits
* `Dir.chdir` passes the path of the directory changed to into the block and changes back to the original directory when the block exits
* `Array.sort` allows you to create a comparator function in place by passing a block describing the comparator
* `String.gsub` allows you to customize exactly how matched text is replaced by specifying a replacement function as a block

And this is just one of the ways that Ruby's meta-programming features makes writing *and* reading code simpler. There's nothing magic here. There's just a new syntax for writing the same code.[^syntactic-sugar] Could you do the same stuff in other languages? Absolutely! Here's how to sort a list of strings using a custom comparator in [pretty much every language ever][custom-comparator].

Let me be perfectly clear. What makes Ruby special is *not* what it makes possible, because it is possible to do anything Ruby can do in *any* Turing-complete language. What is special about Ruby is **how much** it makes things simpler. And any tool that can make writing the next several layers of abstraction faster, simpler, more testable and readable? That's the tool that I'm going to use.


[^java-too]: Yes, I am aware that Java now has the `try` syntax that is almost identical to C#'s Dispose Pattern. I'm not picking on Java, it was just an easy code pattern for me to remember.
[^javascript]: There are obvious parallels between Ruby blocks and JavaScript callback functions or Objective-C blocks, but neither of them are as simple to write or read as the Ruby version.
[^syntactic-sugar]: It is most definitely syntactic sugar. And if you object to syntactic sugar, then I have to ask you why you aren't writing in Assembler? And none of that mamby-pamby Macro Assembler either ... but down and dirty, nothing but the actual opcodes for your processor, have to declare your own `DATA` and `CODE` segments Assembler. And then I'll ask you if your name is [Mel Kaye][mel-kaye].

[chess-memory]: http://theinvisiblegorilla.com/blog/2012/02/15/how-experts-recall-chess-positions/
[custom-comparator]: http://rosettacode.org/wiki/Sort_using_a_custom_comparator
[dispose]: https://msdn.microsoft.com/en-us/library/fs2xkftw(VS.80).aspx
[mel-kaye]: http://www.catb.org/jargon/html/story-of-mel.html
[turtles]: https://en.wikipedia.org/wiki/Turtles_all_the_way_down#History
