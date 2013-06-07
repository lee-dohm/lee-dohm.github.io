---
layout: post
title: The Importance of Documenting Code
tags: Coder
---

One of the ideas I notice gaining traction lately in software development is the notion that comments mean you failed to make your code understandable enough. And, to some extent, I agree with that. We should all be striving to make our code more readable, more understandable, not just to ourselves, but for our coworkers, the person that will be maintaining the code three years from now, and even ourselves six months from now. There are lots and lots of ways to make our code more readable that do *not* involve writing a single comment. But there are comments and then there is *documentation*.

Pop quiz, hotshot! What does the following code do?

{% gist 5722529 undocumented.rb %}

Take a really good look. Really try to figure it out, including all of the edge cases. Now, take a look at the [documented version][documented]. Were you right?

I'm sure that you were able to figure out that it checks to see that `color` is a valid color. If you know enough about Ruby or other languages that it is based upon, you were probably able to determine what the code actually does. Maybe if you're familiar with CSS you would know that it could be used to validate some types of CSS-style color specifications, but because it doesn't cover *all* of those cases you couldn't be sure that was the intent. And most likely you wouldn't know that it is specifically designed for SVG color specifications, which are mostly like CSS color specifications but offer an expanded list of color keywords.

My point is that, arguably, this is well-written code. How the code functions is very clear. It could probably be rewritten a couple different ways to maybe make it more clear to different types of people. The code works well enough for what it is being used. But what is missing is the context. What is missing is the higher-level intent of the code. The why is missing from the what and the how. What you get from reading the documentation is a quick understanding of the contract the code offers. And you get an understanding of where the code might be improved.

This is what documentation of code offers. There are some things that just don't belong in the code itself but are still very useful for those that need to understand it, need to maintain it. Recording and communicating these things is not a waste of time. On the contrary, it can save you and everyone else that has to work with the code a lot of time and effort, especially when you amortize that over the lifetime of the system.

[documented]: https://gist.github.com/lee-dohm/5722529#file-documented-rb
