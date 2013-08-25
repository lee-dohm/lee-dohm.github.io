---
layout: post
title: Shells and Scripting
tags: Coder
---

I've spent a significant chunk of my weekend playing around with a new command-line shell, [fish][fish], the **F**riendly **I**nteractive **SH**ell. I'd seen people using it on a couple of screencasts and thought about checking it out. I finally got around to it. It was a little frustrating to work with at first because it is designed to be simpler to use and therefore friendlier than other shells, so I had to convert some of the ways I was doing things in my older shell, [zsh][zsh], to the new way of doing things. But after I got done replicating all of my environment customizations in fish, it turns out that my fish configuration is *tons* simpler than the one in zsh. I was pretty impressed, so I've switched over my main computer and will probably switch over my work computers this week. Along the way though, I noticed something ...

It is interesting that with all the progress in computers over the last few decades, we still use command-line environments that have remained largely unchanged since about the 1980s. In the 1980s many people were still writing significant amounts of code in BASIC, COBOL, Fortran and other primitive languages. We have rightly done away with those archaic systems and replaced them with much more modern ones. But what language do I still see people writing significant chunks of code in? Shell scripts.[^1]

[^1]: This includes batch files on Windows as well.

[fish]: http://www.fishshell.com
[zsh]: http://www.zsh.org/
