---
layout: post
title: The Importance of Documenting Code
tags: Coder
---

One of the ideas I notice gaining traction lately in software development is the notion that comments mean you failed to make your code understandable enough. And, to some extent, I agree with that. We should all be striving to make our code more readable, more understandable, not just to ourselves, but for our coworkers, the person that will be maintaining the code three years from now, and even ourselves six months from now. There are lots and lots of ways to make our code more readable that do *not* involve writing a single comment. But there are comments and then there is *documentation*.

Pop quiz, hotshot! What does the following code do?

{% gist 5722529 undocumented.rb %}

Take a really good look. Really try to figure it out, including all of the edge cases.

Now, take a look at the [documented version][documented]. Were you right?

[documented]: https://gist.github.com/lee-dohm/5722529#file-documented-rb
