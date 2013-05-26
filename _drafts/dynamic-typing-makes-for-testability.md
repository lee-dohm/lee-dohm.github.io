---
layout: post
title: Dynamic Typing Makes for Testability
tags: Coder
---

I read [this article on language design "deal breakers"][article]. It is a thought-provoking read despite the fact that the author and I do not agree on a couple key points. Where we do agree is with regards to memory safety, both in allocation and with respect to null references, and efficient storage reclamation. I'm much less concerned than the author about Windows support though I can understand why someone would include it in their "deal breaker" list. Where I definitely don't agree is on the benefits of static typing and this reminded me to write about a benefit of dynamic typing that I discovered recently.

First of all, let us define our terms. A language can be considered "statically typed" if the usage of types can be checked at compile-time. A language can be considered "dynamically typed" if the usage of types must be checked at run-time. Languages like Java and Go are statically typed and languages like Ruby and Python are dynamically typed.

I am also going to take it as a given that any reasonably-sized software system requires automated tests. And by "reasonably-sized" I really mean anything that is going to be used by more than just the author and a couple of friends.

So given that we have two reasonably-sized software systems, one written in a statically typed language (such as Java) and the other written in a dynamically typed language (such as Ruby), let's take a look at some of the challenges and benefits to testability each affords.

[Dependency injection][injection] is a very important capability in testing software in an automated fashion. This is a simple example:

{% gist 5653431 simple-injection.java %}

[article]: http://sebastiansylvan.wordpress.com/2013/05/25/language-design-deal-breakers/
[injection]: http://en.wikipedia.org/wiki/Dependency_injection
