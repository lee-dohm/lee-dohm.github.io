---
layout: post
title: Dynamic Typing Affords Testability
tags: Coder Tester
date: 2013-05-26 19:48:38.397978000 -07:00
---

I read [this article on language design "deal breakers"][article]. It is a thought-provoking read despite the fact that the author and I do not agree on a couple key points. Where we do agree is with regards to memory safety, both in allocation and with respect to null references, and efficient storage reclamation. I'm much less concerned than the author about Windows support though I can understand why someone would include it in their "deal breaker" list. Where I definitely don't agree is on the benefits of static typing and this reminded me that I had been meaning to write about dynamic typing and how it affords testability.

The author states in their article:

> Examples of code you probably don't want to write unit tests for includes gameplay logic which gets written and rewritten twenty times before ship as the result of iteration. Having to write test harnesses and tests for all this throwaway code is madness. Then of course there's code that's just plain hard to unit test, such as graphics. The point is that pervasive unit testing is a fantasy - it may be feasible in some domains, but it's certainly not the case everywhere.

The author states that automated testing isn't valuable in all cases. Part of that reason appears to be that the author rightly states that automated testing, even at the unit test level, is hard ... at least in statically typed languages.

Let's step back a moment and define our terms. A language can be considered "statically typed" if type correctness is checked at compile-time and "dynamically typed" if type correctness is not checked at compile-time.[^1] What it means to be "type correct" varies from language to language, so we won't examine a more formal definition of that here. Languages like Java and Go are statically typed while languages like Ruby and Python are dynamically typed.

I'm going to take a look at the problem from the point of view of [dependency injection][injection]. Dependency injection is a very important capability in testing software in an automated fashion. This is a simple example in Java:

{% gist 5653431 class-a.java %}

The class `A` depends on some `B` to store information in the database, whether `B` is a concrete class or simply an interface doesn't really matter from the point of view of `A`. `A` is well-factored and, for a statically typed language, easily testable. If `B` is a class, we could test it this way:

{% gist 5653431 class-b.java %}

We simply create a descendant of `B` that stubs out the method we want to test and supply that to the constructor of `A`. If `B` is an interface, the code is almost identical:

{% gist 5653431 interface-b.java %}

At least in this very simplified example. If `B` had not one method, but ten or twenty then the `MockB` for that version would be much more complicated even if `store()` is all we wanted to override. At the very least, we would have to implement all of those methods to throw an exception of some sort.[^2]

But, as is sometimes the case in these situations, perhaps `B` is declared in a library that we don't have the source to recompile from. And perhaps it is declared like this:

{% gist 5653431 final-b.java %}

That `final` keyword means that subclasses of `B` cannot override the `store` method.[^3] What does one do in this case? Well, this is where things get weird. Because `B` doesn't implement an interface nor descend from any parent class that we can use in its stead,[^4] we have to do some gymnastics to essentially work around the type system:

{% gist 5653431 gymnastics.java %}

Yes, this gets the job done. But this version of `MockB` is now part of our *production* code because `A` has to be rewritten to accept a `MockB` instead of a `B`. It is going to ship with our product and could be a source of bugs. It also will be a performance hit, albeit perhaps an infinitesimally small one. Every time `A` would have called a method on `B`, a check is made to see if we are testing or not ... a check that shouldn't need to be performed in production code. This is also a violation of the [Single Responsibility Principle][srp], in that this new class is responsible both for being a stand-in for `B` as well as being responsible for affording testing.

In a dynamically typed language though, such as Ruby, all of these concerns and code changes go away. Let's take a look at the Ruby version of `A`:

{% gist 5653431 class-a.rb %}

Because the type of the `b` parameter doesn't matter, we can create a class that does exactly what we want, similar to the first version of `MockB` in Java above. And better yet, it doesn't matter if `B` is a class or an interface, open or closed, the code for the test is the same, so all the different versions of `MockB` that we had to worry about for Java are not necessary in Ruby.

This is just one example of how dynamic typing makes completely automated testing significantly easier. Static typing may catch one small class of bugs sooner, but automated testing has the potential of catching *all* classes of bugs sooner.

-----

[^1]: These ideas are separate from the concepts of a "strongly typed" or "weakly typed" language, which do not have strict definitions.
[^2]: In Java though, this might run afoul of checked exceptions depending on how we decided to do it.
[^3]: There are similar challenges in other statically typed languages like C++ and C# where the author of a class can completely prevent subclassing as a means of providing dependency injection.
[^4]: In the case of Java, of course, it descends from `Object`, but that isn't helpful here.

[article]: http://sebastiansylvan.wordpress.com/2013/05/25/language-design-deal-breakers/
[injection]: http://en.wikipedia.org/wiki/Dependency_injection
[srp]: http://en.wikipedia.org/wiki/Single_responsibility_principle
