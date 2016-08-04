---
layout: post
title: Interview Question Pitfalls
tags: Coder Interviewer
excerpt: I've spent a lot of time over the last ten years or so interviewing programming
  candidates for large corporations. One of the things that it seems people like to
  try as an exercise is to come up with "great programming interview questions". The
  thing is, unless you've done a lot of interviewing and hiring of programmers, you're
  probably coming up with really bad ones. I'll try to break down some of the common
  pitfalls that I see first time interview question designers falling into.
date: 2014-08-01 19:45:52.774146000 -07:00
redirect_from: /2014/08/01/interview-question-pitfalls.html
---

I've spent a lot of time over the last ten years or so interviewing programming candidates for large corporations. One of the things that it seems people like to try as an exercise is to come up with ["great programming interview questions"][great-questions]. The thing is, unless you've done a lot of interviewing and hiring of programmers, you're probably coming up with really bad ones. I'll try to break down some of the common pitfalls that I see first time interview question designers[^jerks] falling into.

## The "How Much Do You *Really* Know About the Language" Question

These are the questions where one is asked to recall some obscure edge-case of whatever is the interviewer's pet language. An example of this kind of question is, "Can you declare a `virtual static` function in C++? Why or why not?"[^virtual-static]

Let's face it, whether we are the "language lawyer" on the team or not, most of us for one reason or another respect the guy that can quote chapter and verse of the C++ Language Specification. Or the gal that can rattle off the exact differences between a block, proc or lambda in Ruby without looking it up first. And a lot of times, the ones that can do this are really valued members of the team. So why not ask questions like these in interviews when trying to find great programmers? Two reasons:

1. Correlation does not equal causation
1. Their arcane knowledge of the language is almost never why that person is super valuable to the team

Yes, many of the folks that have this kind of amazing recall are assets to the team. But remember the old joke:

> **First Guy:** It says here that people who read the Wall Street Journal make more money on average!
>
> **Second Guy:** Where do I get a subscription?

Getting a subscription to the Wall Street Journal doesn't magically grant you a higher salary. Memorizing the dictionary doesn't make you a better writer. And learning the language specification doesn't make you a better programmer. But becoming a better programmer may help you learn the language specification :grinning: And spending all this time becoming a better programmer is what makes one a better team member. The encyclopedia-brain is just a fringe benefit :wink:

## The "One-Way Hash Function" Question

This is the question that sounds hard. But if you know the trick (or have been given the question in interviews before), it is trivial.[^one-way-hash] An example is:

> Count the number of set bits in a 32-bit integer.

One of the simplest to remember solutions[^solution] for this question that is also one of the more efficient is:

```c
long count_bits(long number) {
    // Accumulates the total bits set in `number`
    unsigned int count;

    // This loop initializes the count, loops only until all bits have been cleared and
    // increments the count each time through the loop.
    for (count = 0; number; count++) {
        // Clear the least significant bit set
        number &= number - 1;
    }

    return count;
}
```

If you can just remember the magic trick of how to clear only the least significant bit, then the rest is just writing a loop and returning a value. Easy peasy. All this proves is that the candidate knows a cool bit of magic or that they prepared for the interview by looking up minutia, not that they know how to write real code.

## The "Puzzle" Question

The canonical puzzle question is of course, ["How would you move Mount Fuji?"][mount-fuji] These questions were a really big deal during Microsoft's heyday, when everyone was trying to emulate them to figure out the secret of their success. Basically, these questions are supposed to get the candidate to display to the interviewer how they think, how they attack a problem and how they handle ambiguous requirements.

These questions are really fun for some people, but once again, they aren't testing whether or not you can actually write code, design a system or even puzzle out an algorithm. They only test a very simple-to-learn formula for reasoning out a vague solution to a problem. Whether you call it "napkin estimating" or ["back of the envelope calculation"][envelope] or just "swag", it is not a quality that good programmers necessarily have or that bad programmers won't have.

## So What Makes a Great Interview Question?

What is it you want to measure when you interview a programmer? Well, among other things, you want to measure their ability to write code. So how do you test that? You have them *write code*! And even though we would like to think that most of what we do is awesome stuff like figuring out cool and innovative new uses for [Dijkstra's Algorithm for calculating a minimum spanning tree][dijkstra], but really the majority of the code we write is just simple, straight-line code with a lot of loops and conditions.[^loops-and-conditions] So we really should be testing if people can do that first!

Jeff Attwood, also known as [Coding Horror][coding-horror], one of the main folks behind [Stack Exchange][exchange] and [Discourse][discourse], popularized the use of the [FizzBuzz][fizzbuzz] class of questions in programming interviews in a couple blog posts where he relayed a tale that the vast majority of programming candidates just can't write *a single line of code*. Ever since I read that blog article, I've used FizzBuzz and other questions like it as a basic "Do I need to bother giving you a real programming question?" test.

How do I come up with these questions? Well, the programming interview questions I use generally have the following qualities:

1. They require the candidate to write code in whatever language they feel most comfortable.
1. They are very simple-to-describe problems with *no* ambiguity. One or two sentences tops.
1. They have multiple special cases. These are not "write a `for` loop and you're done" questions.
1. They do not require any special domain knowledge or if they do, I have a cheat sheet prepared and it is simple enough that it can be learned completely in less than five minutes.
1. There are multiple good solutions to the problem, depending on the requirements. In other words, do I have unlimited memory but speed is precious or vice versa?

As an example, one of the programming questions that I use that fits these criteria is:

> Write a function that accepts an integer as input and returns a string containing the Roman Numeral representation of that integer.

I have a cheat sheet that explains how Roman Numerals work. I also scope it to just the integers between 1 and 3,999 if the candidate asks.[^entry-level] They don't even necessarily have to finish it in the time available. I can generally see how it is going to go after they spend a little bit of time on it. In my experience, this has been a very good indicator on the candidate's programming ability. The ones that have done well have generally been capable programmers.[^hired-anyway]

And that's what we're looking for, right?

[^entry-level]: If it is an entry-level candidate, I'll volunteer that the range of numbers is scoped and why.
[^hired-anyway]: And the ones that have flopped and been hired anyway generally have been poor performers in the programming arena.
[^jerks]: Now, keep in mind that all of these types of questions can (and sometimes are) used by jerk interviewers as basically a way to reassure themselves of their intellectual superiority. But I feel like more often the person employing one of these just doesn't know better questions to ask. This is why I'm writing this article.
[^loops-and-conditions]: `for` loops, `while` loops, `if-then-else` and `switch` statements
[^one-way-hash]: Just like a [one-way hash function][one-way-hash] is trivial to compute in one direction but hard or impossible to go the reverse direction from the output back to the original input.
[^solution]: Paraphrased from [this Stack Overflow answer][answer]
[^virtual-static]: The answer to the first part of the question is "no" and the answer to the second part is that they're mutually exclusive. `virtual` requires an object instance and `static` precludes the use of an object instance. :laughing:
[^web-interview]: It also wasn't a web programming position.

[answer]: http://stackoverflow.com/a/109036
[coding-horror]: http://blog.codinghorror.com
[cookie-maker]: http://stackoverflow.com/questions/3342140/cross-domain-cookies
[dijkstra]: https://www.cs.sunysb.edu/~skiena/combinatorica/animations/dijkstra.html
[discourse]: http://www.discourse.org
[envelope]: http://en.wikipedia.org/wiki/Back-of-the-envelope_calculation
[exchange]: http://www.stackexchange.com
[fizzbuzz]: http://blog.codinghorror.com/why-cant-programmers-program/
[great-questions]: http://www.toptal.com/ruby/interview-questions
[mount-fuji]: http://www.amazon.com/How-Would-Move-Mount-Fuji-ebook/dp/B000Q67H6I/
[one-way-hash]: http://en.wikipedia.org/wiki/One-way_hash_function
