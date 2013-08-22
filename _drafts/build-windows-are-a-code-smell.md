---
layout: post
title: Build Windows Are a Code Smell
tags: Coder
---

I've worked in a lot of places that handle code over the years. I've seen all sorts of ways of managing the complexity of projects, the good, the bad and the ugly. By far, the one that annoys me to absolutely no end is a concept I'll call "build windows" because that's the term that was given to it at the first place that I saw the pattern. And not only was it being enshrined as a practice, but a **best** practice. In this place where I worked, a build window was an icon that launched a command prompt configured with all the settings needed to build the project in question. If you checked out the code, you couldn't build it successfully unless you executed the build command in the approved build window. If you wanted to build the debug version, you double-clicked the debug build window. If you wanted the release version, you double-clicked the release build window. Once the build window was open, you would then execute the proper build command ... or, sadly, series of commands. Seems like an okay system to you? Well ... let me tell you why it's not ...

## Definition

But build windows aren't always icons with configuration information embedded in them. Sometimes build windows come in the form of a script that you have to run that sets up the build environment before you can run the build. Sometimes build windows come in the form of a series of commands one has to execute faithfully in series as a magic incantation to get the build to work correctly. Sometimes there is "the build machine" that is the only machine that is configured to properly execute the build and everyone has to wait in line to see if their changes will break the build. All of these are examples of the same code smell that I am calling Build Windows.

With that said, there are things that might seem like Build Windows but aren't. That document that talks about how to install the IDE, the SDK, the 50 tools that are used in the build and do one-time configuration? That isn't an example of the Build Windows smell. Build Windows are processes that you have to execute every time or nearly every time you run the build.

## Gather Together Those Things That Change for the Same Reason

The [Single Responsibility Principle][srp] states:

> Gather together those things that change for the same reason, and separate those things that change for different reasons.

Given this principle when you need to make a change, it is best if there is only one place where those changes have to be made. In the simplest possible build window system, there is the build script and the build window definition[^1]. In the best case scenario, there are two places where one might need to make a change. That *might* not be so bad, but where this code smell gets really stinky is when everyone has their own separate copy of the build window definition whether because everyone's icon has to be hand generated, or there is a magic five-step incantation to run the build.

## Separate Those Things That Change for Different Reasons

What might change for different reasons but still affect your build process? The situation I ran into today was one I never thought I would see on Unix, the build window required a specific shell. Despite decades of history of people using different shells on Unix: sh, bash, csh, ksh, zsh and many, many others; the environment setup script was hard-coded in such a way that it would not work unless *your default shell* was bash[^2]. I, like many a Unix user before me, have fairly extensively customized my shell to work in the way I want it to. It is true that I do not need those customizations to get my job done, but I'll get my job done a lot faster if they are there.

An analogy would be taking an accountant that is used to using an adding machine and telling them that from now on they have to use an abacus for these ten clients but it's up to the accountant if they use the adding machine or abacus for the other hundred clients. Why does the accountant have to use an abacus? Because the sales rep for those ten clients prefers an abacus for their own use.[^3]

## OK, Build Windows Are a Smell. How Do I Fix It?



[^1]: Assuming that there is only *one* build window definition.
[^2]: Not only that, but they went on to make many more choices for me like what information should be in my prompt, what colors things should be, all the way down to whether or not certain features were enabled or not in the bash session.
[^3]: Yes, I'm stretching the analogy a bit thin to make my point. The original title of this post was going to be *The Arrogance of Build Windows* because yeah ... it pisses me off that much.

[srp]: http://programmer.97things.oreilly.com/wiki/index.php/The_Single_Responsibility_Principle
