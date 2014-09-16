---
layout: post
title: Everything Old Is New Again
tags: Coder
---

I've been around the block a few times. I've been writing code professionally for very nearly twenty years. And recently I've come to realize that I'm *that* guy. I'm the guy that not only has seen things come and go, but been around long enough to see things come and go and then come back around again.

I work in an industry that is currently driven by young people. And that isn't changing any time soon. There are a number of reasons why software development is dominated by the young. Partially, it is because computing itself is young. While the concepts were originally laid down starting in the early 1800s[^babbage], it wasn't until the 1940s that they were actually put into practice and computing didn't become widespread even until the 1970s[^microprocessor], 80s[^personal-computer] and 90s[^internet]. But mostly it is only now that the workforce is getting a critical mass of people that have grown up with computers in their lives.

And because the software industry has been so explosive in the last couple decades, there is *huge* demand for more people that can write software. This drives salaries up. This also creates opportunities for those who can teach programming to teach it, flooding the market with people that have just learned to write code. I hear people asking regularly if they can get a programming job after they take a couple semesters, they read a couple books or they attend a single boot camp session.

The thing that these young people[^not-so-young] don't get in these crash courses is *perspective*. Though the history of computers isn't long, it does exist. And there are tons of concepts that have been around for *decades* that these young people just haven't been exposed to.

For example, I ran into someone who had two collections of objects and was trying to figure out the exact difference between them. They needed to know what had been added and what had been deleted from the original sequence to create the second sequence. This programmer had spent a bunch of time implementing a rather buggy solution and was working on refining it. It turns out that this general problem had been [solved in 1974][diff] and [a paper published in 1976][hunt-mcilroy]. As a matter of fact, this algorithm is so common that programmers use it virtually every day.

[^babbage]: With Charles Babbage's designs for his [Analytical Engine][analytical-engine].
[^internet]: The Internet became a household word in 1994.
[^microprocessor]: Intel released the world's first microprocessor, the 4004, in January 1971.
[^not-so-young]: Or not so young, but new to the industry and programming in general.
[^personal-computer]: The 1980s is when the "personal computer" exploded and more and more people brought computers into their homes.

[analytical-engine]: http://en.wikipedia.org/wiki/Analytical_Engine
[diff]: http://en.wikipedia.org/wiki/Diff
[hunt-mcilroy]: http://en.wikipedia.org/wiki/Hunt%E2%80%93McIlroy_algorithm
