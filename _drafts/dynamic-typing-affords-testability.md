---
layout: post
title: Dynamic Typing Affords Testability
tags: Coder
---

I read [this article on language design "deal breakers"][article]. It is a thought-provoking read despite the fact that the author and I do not agree on a couple key points. Where we do agree is with regards to memory safety, both in allocation and with respect to null references, and efficient storage reclamation. I'm much less concerned than the author about Windows support though I can understand why someone would include it in their "deal breaker" list. Where I definitely don't agree is on the benefits of static typing and this reminded me that I had been meaning to write about dynamic typing and how it affords testability.

The author states in their article:

> Examples of code you probably don't want to write unit tests for includes gameplay logic which gets written and rewritten twenty times before ship as the result of iteration. Having to write test harnesses and tests for all this throwaway code is madness. Then of course there's code that's just plain hard to unit test, such as graphics. The point is that pervasive unit testing is a fantasy - it may be feasible in some domains, but it's certainly not the case everywhere.

Obviously, the author doesn't agree that completely automated testing is possible. And it seems to me that the author doesn't value completely automated testing. Part of that reason appears to be that the author rightly states that completely automated testing, even at the unit test level, is hard ... at least in statically typed languages.

Let's step back a moment and define our terms. A language can be considered "statically typed" if type correctness is checked at compile-time and "dynamically typed" if type correctness is not checked at compile-time.^1 What it means to be "type correct" varies from language to language, so we won't examine a more formal definition of that here. Languages like Java and Go are statically typed while languages like Ruby and Python are dynamically typed.

I'm going to take a look at the problem from the point of view of [dependency injection][injection]. Dependency injection is a very important capability in testing software in an automated fashion. This is a simple example in Java:

{% gist 5653431 class-a.java %}

The class `A` depends on some `B` to store information in the database, whether `B` is a concrete class or simply an interface doesn't really matter from the point of view of `A`. `A` is well-factored and, for a statically typed language, easily testable. If `B` is a class, we could test it this way:

{% gist 5653431 class-b.java %}

We simply create a descendant of `B` that stubs out the method we want to test and supply that to the constructor of `A`. If `B` is an interface, the code is almost identical:

{% gist 5653431 interface-b.java %}



-----

1. These ideas are separate from the concepts of a "strongly typed" or "weakly typed" language, which do not have strict definitions.

[article]: http://sebastiansylvan.wordpress.com/2013/05/25/language-design-deal-breakers/
[injection]: http://en.wikipedia.org/wiki/Dependency_injection
