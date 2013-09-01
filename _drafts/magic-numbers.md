---
layout: post
title: Magic Numbers
tags: Coder
---

I've said that [Duplicate Code][duplicate] is the most common [code smell][smells]. In most projects that is true, but I think one of the most insidious of code smells is [Magic Numbers][magic-numbers]. Magic Numbers are all those integer literals scattered throughout the code base. They are the hard-coded `Thread.sleep` delays. They are the fixed number of pixels for a drop shadow. They are the specified size for a memory buffer. Magic Numbers are the simplest unreadable code you can write.

When most people think of unreadable code, they think of some crazy inscrutable algorithm that takes a Ph.D. to understand. But that's why these literals that we casually toss around are so insidious. Because *we* know why the value is set exactly there and not some amount of units up or down. *We* wrote the code. Of course we know! And it's painfully obvious why the delay for the login screen should be five-hundred milliseconds. Of course the next person who picks up the code will understand immediately, right? Of course they'll intuit why we chose 4KB, no more, no less, for the size of the buffer. Because the performance falls off at anything higher and we can only allocate it in 1KB increments because of the library we're using ... so don't change that `4096` you see in the code! That's obvious, right?

[duplicate]: https://github.com/lee-dohm/code-smells#duplicate-code
[magic-numbers]: https://github.com/lee-dohm/code-smells#magic-numbers
[smells]: /2013-08-11-code-smells-as-a-code-review-language.html
