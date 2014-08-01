---
layout: post
title: Interview Question Pitfalls
tags: Coder
---

I've spent a lot of time over the last ten years or so interviewing programming candidates for large corporations. One of the things that it seems people like to try is to come up with ["great programming interview questions"][great-questions]. The thing is, unless you've done a lot of interviewing and hiring of programmers, you're probably coming up with really bad ones. I'll try to break down some of the common pitfalls that I see first time interview question designers falling into.

## The "How Much Do You *Really* Know About the Language" Question

Let's face it, whether we are the "language lawyer" on the team or not, most of us for one reason or another respect the guy that can quote chapter and verse of the C++ Language Specification. Or the gal that can rattle off the exact differences between a block, proc or lambda in Ruby without looking it up first. And a lot of times, the ones that can do this are really valued members of the team. So why not ask questions like these in interviews when trying to find great programmers? Two reasons:

1. Correlation does not equal causation
1. Their arcane knowledge of the language is almost never why that person is super valuable to the team

## The "One-Way Hash Function" Question

This is the question that sounds hard. But if you know the trick (or have been given the question in interviews before), it is trivial.[^one-way-hash] An example is:

> Count the number of set bits in a 32-bit integer.

One of the simplest to remember solutions[^solution] for this, that is also one of the more efficient is:

```c
long count_bits(long number) {
  unsigned int count;               // count accumulates the total bits set in v
  for (count = 0; number; count++)
    number &= number - 1;           // clear the least significant bit set
  return count;
}
```

## The "Puzzle" Question

These questions are really fun for some people, but once again, they aren't testing whether or not you can actually write code. They only test a very simple-to-learn formula for reasoning out a solution to a problem. And they are used by the wrong kind of interviewer in rather disappointing ways.

## Why FizzBuzz is Actually a Great Interview Question

Jeff Attwood, also known as [Coding Horror][coding-horror], popularized the use of the [FizzBuzz][fizzbuzz] class of questions in programming interviews.

[^one-way-hash]: Just like a [one-way hash function][one-way-hash] is trivial to compute in one direction but hard or impossible to go the reverse direction from the output back to the original input.
[^solution]: Paraphrased from [this Stack Overflow answer][answer]

[answer]: http://stackoverflow.com/a/109036
[coding-horror]: http://blog.codinghorror.com
[fizzbuzz]: http://blog.codinghorror.com/why-cant-programmers-program/
[great-questions]: http://www.toptal.com/ruby/interview-questions
[one-way-hash]: http://en.wikipedia.org/wiki/One-way_hash_function
