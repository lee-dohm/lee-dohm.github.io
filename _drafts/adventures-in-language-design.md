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

In addition to the above language and ecosystem features, I wanted to get down some of the specific language and standard library features that I think are necessary or are quickly becoming so. Just as many people state that [Design Patterns are missing language features][patterns], these are the language features that I don't believe we should have to craft by hand, they are common enough and standardized enough that they belong in our languages by now.

## Object-Orientation

... or whatever core concepts that we take away from decades of writing object-oriented code. "X isn't object oriented!" is the rallying cry of the younger programming generation. As if object-oriented programming is some blight on the face of computer science.^(2) People who like [Google's Go][golang] are quick to say this about Go. But let's take a look at what the requirements are for writing object-oriented code:

1. Encapsulation
1. Inheritance
1. Polymorphism

Go implements encapsulation by allowing one to control whether names are visible outside the package in which they are declared. Believe it or not, [Go directly supports inheritance][inheritance-in-go] by allowing one to embed an anonymous instance of a struct in another struct. And polymorphism is supported in Go through interfaces. Go *is* an object-oriented language. What Go isn't is a language that wraps all three of these features together into the standard model of classes and objects. Go splits them all out into their own language constructs so you can take or leave each capability as needed.^(3)

Now, this isn't to say that all implementations of object-orientation are above reproach. Steve Yegge has an article about [how OOP was taken too far in Java][yegge-java].

## Garbage Collection

## Exception Handling

## Deterministic Release of Resources

## First-Class and Higher-Order Functions

## Blocks and Closures

## Pattern Matching

## Standard Algorithms As Well As Standard Data Structures

Pretty much every language since the beginning of time has had some sort of support for standard collections: array/vector, dictionary/hash, trees, graphs, etc. But what most standard libraries have been lacking in is implementations of standard algorithms, everything you write a `for` loop for. This is one thing that I believe the C++ Standard Template Library got right and so does Ruby. Most languages have some sort of generic sort method that implements [quicksort][quicksort] given a comparison function. What I'm talking about is all the other common operations:

* **find** - Return the first item in a collection that matches a predicate^4
* **include** - Return true if any item in a collection matches a predicate
* **map** - Execute a function on each item in the collection and return a new collection containing the results
* **reduce** - Execute a function on each item in the collection and return a single summary value
* **select** - Return a new collection containing only the items that match a predicate
* *and many more...*

When you have first-class functions or, even better, blocks and closures; these things become very simple to write. And things that are simple to write create less bugs. Compare these chunks of code. Each does exactly the same thing. They look through an array and return a new array containing every value that is evenly divisible by two. The first is in C and shows the way that we've been doing it since the invention of the `for` loop.

{% gist 6131692 divisibleByTwo.c %}

And here it is in Ruby ...

{% gist 6131692 divisible_by_two.rb %}

And just to prove that other languages do it too, here it is in C++ ...

{% gist 6131692 divisibleByTwo.cpp %}

The point is that there is no reason why these standard boilerplate things we do *all the time* have to be so verbose. The C version, not counting variable declarations, memory allocations or return statements is four lines. The Ruby and C++ versions are each one line. And this is an instance where the predicate is described very simply. In cases where the predicate is more complex, often they diverge even more because of the manual accounting overhead when you are simply iterating in a loop.

## Process Queues?

*A la* [channels][channels] in Go and the [Actor pattern][actor-pattern] in Scala?

-----

1. Given that definition, Ruby and many others are also multi-paradigm languages. Honestly, more and more mainstream languages are incorporating functional programming features. I think that purely functional programming languages will soon be obsolete because the mainstream languages will have incorporated enough functional programming features that truly FP code can be written in them but will still be better at the things that FP is *not* good at, like user interface code and other imperative tasks.
1. If you think object-oriented programming is a bad thing ... you should see what we had before.
1. An example I found to be mind-bending is something that a professor challenged me with in one of the many times I attended a college. He stated that C is an object-oriented language. When I asked him to back it up he pointed out `FILE *` in the C standard library. What structure is represented by `FILE` is never really explained unless you go hunting through the source and you have a whole slew of <strike>methods</strike>functions that operate specifically on `FILE *`. This displays obvious encapsulation. And you *can* implement both inheritance and polymorphism using pointers to `void`, casting and hand-implemented v-tables using function pointers. Now, C really *isn't* an object-oriented language because support for these features should be directly built into the language ... but it was an eye-opening discussion nonetheless.
1. A "predicate" or "predicate function" is a function that returns true or false given its input.

[actor-pattern]: http://www.scala-lang.org/old/node/242
[channels]: http://golang.org/doc/effective_go.html#channels
[f-sharp]: http://research.microsoft.com/en-us/projects/fsharp/
[golang]: http://www.golang.org
[inheritance-in-go]: http://code.rkevin.com/2010/10/how-to-use-inheritance-in-google-go/
[jruby]: http://www.jruby.org
[patterns]: http://www.codinghorror.com/blog/2007/07/rethinking-design-patterns.html
[quicksort]: http://en.wikipedia.org/wiki/Quicksort
[scala]: http://www.scala-lang.org
[type-inference]: https://en.wikipedia.org/wiki/Type_inference
[why-ruby-is-awesome]: /2013/05/05/thoughts-on-why-ruby-is-awesome.html
[yegge-java]: http://steve-yegge.blogspot.com/2006/03/execution-in-kingdom-of-nouns.html
