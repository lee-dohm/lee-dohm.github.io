---
layout: post
title: Adventures in Language Design
tags: Coder
---

A friend of mine at work convinced me to take a look at [Scala][scala]. It is a "multi-paradigm language" based on Java. "Multi-paradigm" is just a fancy way of describing a language that has both object-oriented and functional programming features.^(1) [Microsoft's F#][f-sharp] is another such language. The thing that impressed me about Scala is that it has a number of the same features that Ruby has but because it is statically typed, with [type inference][type-inference], it is significantly more performant in many applications than even [JRuby][jruby].

I've [written before][why-ruby-is-awesome] on the features of Ruby that I think are going to be necessary for me to be happy about switching to any new language. Here they are again:

1. Support for in-language DSLs
1. Simple package and dependency management
1. Great documentation and documentation tools
1. Great test support

In addition to the above language and ecosystem features, I wanted to get down some of the specific language and standard library features that I think are more and more necessary as computer science progresses.

## Object-Orientation

* [In the land of the nouns][yegge-java]

## Garbage Collection

## Exception Handling

## First-Class and Higher-Order Functions

## Blocks and Closures

## Pattern Matching

## Standard Data Structures *and* Standard Algorithms

Pretty much every language since the beginning of time has had some sort of support for standard collections: array/vector, dictionary/hash, trees, graphs, etc. But what most standard libraries have been lacking in is implementations of standard algorithms, everything you write a `for` loop for. This is one thing that I believe the C++ Standard Template Library got right and so does Ruby. Most languages have some sort of generic sort method that implements [quicksort][quicksort] given a comparison function. What I'm talking about is all the other common operations:

* **find** - Return the first item in a collection that matches a predicate^2
* **include** - Return true if any item in a collection matches a predicate
* **map** - Execute a function on each item in the collection and return a new collection containing the results
* **reduce** - Execute a function on each item in the collection and return a single summary value
* **select** - Return a new collection containing only the items that match a predicate

When you have first-class functions or, even better, blocks and closures; these things become very simple to write. And things that are simple to write create less bugs. Compare these chunks of code. Each does exactly the same thing. They look through an array and return a new array containing every value that is evenly divisible by two. The first is in C and shows the way that we've been doing it since the invention of the `for` loop.

{% gist 6131692 divisibleByTwo.c %}

And here it is in Ruby ...

{% gist 6131692 divisible_by_two.rb %}

And just to prove that other languages can do it too, here it is in C++ ...

{% gist 6131692 divisibleByTwo.cpp %}

The point is that there is no reason why these standard boilerplate things we do *all the time* have to be so verbose. The C version, not counting variable declarations, memory allocations or return statements is four lines. The Ruby and C++ versions are each one line. And this is an instance where the predicate is described very simply. In cases where the predicate is more complex, often they diverge even more because of the manual accounting overhead when you are writing everything in a `for` loop.

-----

1. Given that definition, Ruby and many others are also multi-paradigm languages. Honestly, more and more mainstream languages are incorporating functional programming features. I think that purely functional programming languages will soon be obsolete because the mainstream languages will have incorporated enough functional programming features that truly FP code can be written in them but will still be better at the things that FP is *not* good at, like user interface code and other imperative tasks.
1. A "predicate" or "predicate function" is a function that returns true or false given its input.

[f-sharp]: http://research.microsoft.com/en-us/projects/fsharp/
[jruby]: http://www.jruby.org
[quicksort]: http://en.wikipedia.org/wiki/Quicksort
[scala]: http://www.scala-lang.org
[type-inference]: https://en.wikipedia.org/wiki/Type_inference
[why-ruby-is-awesome]: /2013/05/05/thoughts-on-why-ruby-is-awesome.html
[yegge-java]: http://steve-yegge.blogspot.com/2006/03/execution-in-kingdom-of-nouns.html
