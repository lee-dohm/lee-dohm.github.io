---
layout: post
title: Adventures in Scala
tags: Coder
---

A friend of mine at work convinced me to take a look at [Scala][scala]. It is a "multi-paradigm language" based on Java. "Multi-paradigm" is just a fancy way of describing a language that has both object-oriented and functional programming features.^(1) [Microsoft's F#][f-sharp] is another such language. The thing that impressed me about Scala is that it has a number of the same features that Ruby has but because it is statically typed, with [type inference][type-inference], it is significantly more performant in many applications than even [JRuby][jruby].

-----

1. Given that definition, Ruby is also a multi-paradigm language. Honestly, more and more mainstream languages are incorporating functional programming features. I think that purely functional programming languages will soon be obsolete because the mainstream languages will have incorporated enough functional programming features that truly FP code can be written in them but will still be better at the things that FP is *not* good at, like user interface code and other imperative tasks.

[f-sharp]: http://research.microsoft.com/en-us/projects/fsharp/
[jruby]: http://www.jruby.org
[scala]: http://www.scala-lang.org
[type-inference]: https://en.wikipedia.org/wiki/Type_inference
