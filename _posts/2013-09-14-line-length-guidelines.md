---
layout: post
title: Line Length Guidelines
tags: Coder Geeky
date: 2013-09-14 16:10:09.236039000 -07:00
alias: 2013/09/14/line-length-guidelines.html
---

I contribute as I can to the [Ruby Style Guide][guide] maintained by [Bozhidar Batsov][batsov]. One of the most hotly debated topics is the guideline of keeping lines of code to eighty characters or fewer. Bozhidar even discussed maximum line length in [his first blog post][reasoning] explaining the reasoning behind some of the guidelines. He, and the commenters on that post, bring up some points in support of the eighty-character limit but I wanted to take a look at "representative" code and see what line length people naturally kept themselves within. I believe most good coders naturally keep themselves to shorter lines except when they need to have a longer line to properly express an idea.

The first problem was how to find representative code. I naturally turned to [GitHub][github] to use their new API for search to get the list of the ten most popular Ruby projects. Most popular is defined as having the most "stars", a mechanism on GitHub whereby people mark a project as a favorite of theirs. The more favorites, the more popular.

Now that I had a corpus of code to look at, I wanted to ensure reasonably easily that I was looking at *code*. So I excluded all lines that:

* Consist solely of whitespace
* Consist solely of comments
* Contain only the keyword `end`
* Exceed 200 characters in length[^1]

After some messing around I built a program to query GitHub, download the latest version of the code and parse all the files. You can find my project on GitHub: [Line Length Miner][miner]. When I ran the script, these are the results I found:

* Count: 257,344 lines examined
* Mean: 44.73162 characters
* Standard Deviation: 42.37547
* 95<sup>th</sup> percentile: ~90 characters
* 99<sup>th</sup> percentile: ~123 characters
* 99.9<sup>th</sup> percentile: ~176 characters
* Percentile of 80 characters: 91.82262
* Percentile of 100 characters: 96.88238
* Percentile of 120 characters: 98.81598
* Percentile of 132 characters: 99.31609

And here is the histogram of the data:

![Histogram of the lengths of lines of code from the top 10 Ruby projects on GitHub](/images/line-length.svg)

It would appear that the length of lines of code do not follow specifically a [normal distribution][normal], though we could still use a normal distribution to approximate it. Because I wanted to have things be as accurate as possible, for all my percentile calculations I worked directly from the dataset and did not approximate based on the mean and standard deviation.

The most interesting thing to note is that representative Ruby code has a hard time staying under eighty characters. If we were to force all ten projects to stay within eighty characters, no exceptions, over eight percent of their code would need to be touched ... over twenty thousand lines! :fearful:

So if the line length limit shouldn't be eighty characters, what should it be? The vast majority of code can stay within 132 characters, so I don't think it should be any higher than that. And only the tiniest fraction less code can stay within 120 characters. So it is really a choice between 100 and 120 characters for Ruby code. 100 to allow those with small monitors to be able to work more easily or 120 to err on the side of permissiveness. I've reconfigured my editor for 100 characters.

[^1]: The assumption here is that lines that are beyond 200 characters in length aren't actually lines of code, but strings or other encoded data.

[batsov]: http://batsov.com
[github]: https://github.com
[guide]: https://github.com/bbatsov/ruby-style-guide
[miner]: https://github.com/lee-dohm/line-length-miner
[normal]: http://en.wikipedia.org/wiki/Normal_distribution
[reasoning]: http://batsov.com/articles/2013/06/26/the-elements-of-style-in-ruby-number-1-maximum-line-length/
