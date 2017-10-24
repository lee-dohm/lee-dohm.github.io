---
layout: post
title: Writing Good Bug Reports
tags: Coder
date: 2015-01-04 14:37:46.601612000 -08:00
redirect_from: /2015/01/04/writing-good-bug-reports.html
---

If there is only one thing that is true about all computer science, it is that every program beyond "Hello World" has bugs. And when a bug happens, you want it to get fixed. You know what the best way to get a bug fixed is, whether it is someone else's or your own? Writing a good bug report.

## The Problem

Most people think that writing a good bug report is just writing a couple of sentences describing the problem and that's it. The issue is that they'll write something like this:

> I'm not sure what I did to break it, but "Open in dev mode" is now opening files in the same window.

This doesn't actually describe the issue though. There are multiple ways to execute that command and it turned out in this case that [one of the ways worked and another was broken][open-in-dev-mode].[^broken]

The goal of reporting a bug is *to get the bug fixed*, otherwise why report the bug at all? So your goal in writing a bug report should be to make it as easy as possible for the developer to fix the bug. You can point fingers and argue over whether it should be the developer that is responsible for doing the legwork, not the user. But when it comes right down to it ... if you're the first person reporting this bug, it may well be that there is something peculiar about your setup, how you perform the task, your machine or something really crazy that the developer *cannot* replicate without help.

In development circles one of the jokes about the lazy programmer is, "It works fine on my machine!" It's also true that a bug report consisting only of "X is broken on my machine" is, unfortunately, just as lazy and unhelpful. We'll get back to it when all the other bugs are fixed, thankyouverymuch ...

## The Solution

So now that we know a little about why to write a good bug report, let's talk about how. The absolute bare minimum things to include are:

1. Include steps to reproduce the problem as reliably as possible
1. Include what you expected to happen
1. Include what actually happened

There are plenty of other helpful things to include like:

* What OS and version of the OS you're running (especially if the program is cross-platform or you're using an unreleased version of the OS)
* What versions of other related software you have installed
* Your software environment (like your `PATH` environment variable, how much RAM you have, is your system low on disk space)

Generally, almost any information you provide *could* help. So if you have time, provide more. It can only help your chances of getting your bug fixed before someone else's. But let's go back to the minimums ...

## Repro Steps

Hopefully, everyone reading this has heard of the [peanut-butter and jelly sandwich exercise][pbj-exercise]. The one where you get a bunch of people to write a list of instructions on how to make a peanut-butter and jelly sandwich. Then you read the instructions and interpret them more or less literally[^jerk-or-comedy] to show them how badly things can go wrong, especially as misinterpretations are compounded. The same is true of repro steps in a bug report. You have to be really clear about what you're doing because if there is more than one way to do something ... if you're writing the bug report, you're probably doing it differently than other people. Let's take a relatively simple task, opening a file. Most people would write it like this:

1. Open a file

Here's a better example:

1. Create a file in the `HOME` directory using `touch test.txt`[^file-alternates]
1. Launch the application by double-clicking on its icon[^launch-alternates]
1. Wait for the application to finish loading and the cursor to start blinking in the open editor[^blinking-cursor]
1. Open the Open File dialog by pressing <kbd>⌘O</kbd>[^open-file-alternates]
1. Navigate to the `HOME` directory by clicking the appropriate folder in the sidebar
1. Double-click the `test.txt` file in the dialog[^file-selection-alternates]

As you can see, there are a lot of assumptions that go into how one opens a file, something that most people consider to be the most basic of operations. And each of these assumptions can be the key to helping the developer track down the bug and fix it for you.

Don't be discouraged by the excruciating detail in the repro steps though. A lot of bug reports for [Atom][atom] include an animated GIF as their repro steps[^licecap] and it serves just as well, sometimes better! So even if you're dealing with language issues, you can still be specific and clear.

## Expected and Actual

Being specific about what you **expected** to happen and what **actually** happened is also very important when writing a good bug report. Almost always, people will describe only one or the other. They will describe what actually happened, thinking that what they expect to happen is obvious. Or they will describe what they expected to happen, assuming that of course you can reproduce the actual issue exactly as they have.

Now, sometimes it *is* clear what is expected to happen ... like when the application crashes or some crazy exception dialog appears.[^blue-menu] You expect the application to not crash and not show dialogs with bunches of text and just an `Ok` button at the bottom. But these are (hopefully) pretty rare and most of the time good applications have crash-reporting systems built into them that give far more information about what was going on in the application at the time than you could.

But let's take a look at [an example][soft-wrapping]:

> When soft wrapping, the cursor gets behind by one character.

Well, that's kind of weak even for an actual. What do you mean by "soft-wrapping"? Do you mean when you toggle soft-wrap mode on? Do you mean when it is already on and a line becomes soft-wrapped by typing more characters into it? What does it mean for the cursor to "get behind by one character"? Here's a much better explanation (based on the one in the actual bug report):

> The place where the cursor is displayed and the place the cursor actually is becomes different after toggling soft-wrap.

This allows the developer to know exactly what to look for and a much better idea of how to reproduce the issue. And it really wouldn't have taken that much more effort to write twice as many words.

## Conclusion

We all would rather be using software that has fewer bugs. Yes, it can be frustrating to pay for software (though that is becoming less and less common, really) and then have it not work. And whether you think of it as catching more flies with honey than vinegar or just from a utilitarian point of view, taking the extra effort to write a *good* bug report, if you're going to make the effort at all, just makes sense.

[^blinking-cursor]: Sometimes there can be timing issues with people trying to click on something "too fast" or even the fact that an editor view is open (so that a cursor is shown and blinking) could be the difference.
[^blue-menu]: Or you expect [the menu to not turn blue][blue-menu].
[^broken]: But it may have only been broken on the reporter's machine. After they built from the latest `master` version, everything worked fine.
[^file-alternates]: The contents or location of the file being opened might be important. Or even the fact that the file exists *before* the application is launched, rather than the file being created after the application is launched.
[^file-selection-alternates]: Double-clicking the file might behave differently than single-clicking the file and then clicking the `Open` button.
[^jerk-or-comedy]: I've seen it done both in hilariously comic interpretations or just plain asinine interpretations ... the point comes across either way, I guess.
[^launch-alternates]: Because maybe you can open the program from either the icon or the command line and [it behaves differently depending on how you launch it][os-x-path-difference].
[^licecap]: A lot of the Atom contributors use [LICEcap][licecap] as the tool of choice for capturing animated GIFs of repro steps. It's available for both Windows and OS X.
[^open-file-alternates]: Maybe there is a difference between opening a file using the key combination and opening a file using the `File > Open` menu.

[atom]: https://atom.io
[blue-menu]: https://github.com/atom/atom/issues/4688
[licecap]: http://www.cockos.com/licecap/
[open-in-dev-mode]: https://discuss.atom.io/t/open-in-dev-mode-opens-in-same-window-on-os-x/14026/4?u=leedohm
[os-x-path-difference]: http://apple.stackexchange.com/questions/87282/in-mountain-lion-how-do-i-set-in-one-place-the-path-environment-variable-for-a/87283#87283
[pbj-exercise]: http://www.nrpa.org/blog/how-to-make-a-peanut-butter-and-jelly-sandwich-a-speed-session-preview/
[soft-wrapping]: https://github.com/atom/atom/issues/1626
