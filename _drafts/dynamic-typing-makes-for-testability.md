---
layout: post
title: Dynamic Typing Makes for Testability
tags: Coder
---

I read [this article on language design "deal breakers"][article]. It is a thought-provoking read despite the fact that the author and I do not agree on a couple key points. Where we do agree is with regards to memory safety, both in allocation and with respect to null references, and efficient storage reclamation. I'm much less concerned than the author about Windows support though I can understand why someone would include it in their "deal breaker" list. Where I definitely don't agree is on the benefits of static typing and this reminded me that I had been meaning to write about dynamic typing and how it affords testability.

First of all, let us define our terms. A language can be considered "statically typed" if type correctness is checked at compile-time and "dynamically typed" if type correctness is not checked at compile-time.^1 What it means to be "type correct" varies from language to language, so we won't examine a more formal definition of that here. Languages like Java and Go are statically typed while languages like Ruby and Python are dynamically typed.

I'm going to take a look at the problem from the point of view of [dependency injection][injection]. Dependency injection is a very important capability in testing software in an automated fashion. This is a simple example:

{% gist 5653431 simple-injection.java %}

Here, in order to test `A` which depends on `B` to talk to the database, we create a new subclass of `B` called `MockB` that allows us to determine if the appropriate method was called. If `B.foo()` took parameters, we could do parameter checking in `MockB.foo()` to ensure that `A` was calling it in the proper manner.

{% gist 5653431 simple-injection.rb %}

This is essentially the same code but in Ruby. The two differences are:

1. Do not have to declare the type of the parameter given to the constructor for `A`.
1. Do not have to make `MockB` a subclass of `B`.

Does it make a difference if `B` is an interface rather than a class?

{% gist 5653431 interface-injection.java %}

The code looks pretty much the same in Java. All we have to do is change the declaration of `MockB` to use `implements` instead of `extends`. How about in Ruby?

{% gist 5653431 interface-injection.rb %}

It gets a lot simpler in Ruby because Ruby is a "duck typed" language. The name comes from the saying, "If it looks like a duck, walks like a duck and quacks like a duck, then it's a duck." This is a specific kind of dynamic typing where if an object responds to the correct methods, then it can be used in place of another object that responds to the same methods. In our example above, the only method that is of importance is `#foo`.^2 Duck typing means that interfaces, for the most part, do not have to be explicitly declared, so we can take out the entire declaration of `B`.

-----

1. These ideas are separate from the concepts of a "strongly typed" or "weakly typed" language, which do not have strict definitions.
1. When referring to methods, Rubyists precede the name of the method with a hash `#` to indicate it is a method as opposed to a variable.

[article]: http://sebastiansylvan.wordpress.com/2013/05/25/language-design-deal-breakers/
[injection]: http://en.wikipedia.org/wiki/Dependency_injection
