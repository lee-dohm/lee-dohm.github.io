---
layout: post
title: Lessons in Open Source
tags: Coder
date: 2014-11-26 14:28:40.505816000 -08:00
---

As the day shortens, especially here in the Pacific Northwest, and the year draws to a close, it is natural to start thinking about the lessons learned, the highlights and the lowlights of the past twelve months. One of the things that I've devoted a major chunk of my time to in 2014 is [Atom][atom], the new programmer's editor from [GitHub][github]. I got involved in late February and have been a moderator on [Discuss][discuss], the official forum, since early March. I've learned a lot about participating in Open Source over the past nine months and I wanted to share those lessons, in case it would help others.

## Better to Ask Forgiveness

The main thing I've noticed, first in myself and then in others, is that people who are used to working in corporate or business environments often feel the need to ask permission before they start work on something. They're often concerned about "wasting time" or "will it be helpful". This is a behavior anti-pattern even in some business settings ... but especially so in Open Source efforts.

Most small- to mid-sized ideas just don't need any discussion before work starts. If there is a bug, just fix it. Once you have a fix coded, then the discussion can happen on how to refine the fix or tweak it, if necessary.[^1] If there is a feature to be added, just add it. Most often it will be accepted as-is and then added upon over time.

For really big ideas, features or bug fixes, there may be some discussion that has to happen. But it is almost always *after* a significant chunk of coding has happened. As has been said before, developers communicate best with code. So write some code and *then* seek out feedback, tweak tweak tweak and keep the ball moving forward.

In Open Source projects **progress** is the name of the game. You're either a contributor or you're just someone who is talking. And if you're just talking, the best you can hope for is that you'll give an idea to someone who *is* a contributor. Don't be a talker, become a contributor.[^2]

And speaking of contributing ...

## Give Back

When I first got started with doing stuff with Atom, I just wrote things for myself. I didn't bother to build them into packages or themes or other such things because I didn't think anyone else would find what I built useful. It was never "good enough" to share. It was never "comprehensive enough" to be merged into `master`. And sure, maybe the very first version wasn't "good enough" for absolutely everyone or didn't cover enough edge cases to be "full featured" or whatever you want to call it. But I learned that the first version doesn't have to be!

Since I started with Atom, I've published [14 packages and 2 themes][my-packages]. Most of them are just tiny little things that don't do much. They add a command or two, add an indicator to the status bar for this or that, change the icons in the tree view to give more visual indication of the file type, etc. Each of them started as something that I wanted for myself[^4] and they grew little by little over time.

What will help your code become "good enough" fastest is *other people using it!* Other people filing bugs because they found an edge case that you wouldn't have. Other people asking for a feature that you hadn't thought of that makes you think of other features you could add. Other people giving feedback on your code, suggesting ways it could be faster, better, more maintainable. This is one of the benefits of Open Source and, honestly, [peer-review systems][peer-review] in general.

Creating add-ons is one way to give back but also sometimes it makes sense for your idea to be part of the original project. Don't keep ideas to yourself just because you're afraid that your ideas don't stack up. Help your ideas get better by subjecting them to the [fiery crucible][great-redeemer] of code reviews. Help your skills get better by getting feedback, listening and incorporating it into the next even better version of your code!

## Show Your Work

It is an oft-quoted fact that the sooner bugs are found, the cheaper they are to fix. So don't just build an idea and then share it. Share it as soon as possible using a [Pull Request][pull-request]! Get just a little bit of code out there and put it up as a pull request so that you can get feedback early and often. This is often the *best* method of preventing one from "wasting time" because you are both making forward progress **and** ensuring that you are not firing wide of the mark.[^3]

## Conclusion

What all of the above really boils down to is: if you want to participate in Open Source, the only thing stopping you from participating is you. So jump in with both feet, be humble, take criticism well and learn, learn, learn!

[^1]: Hint: It is almost never necessary to have a discussion over a bug fix. It is better to simply fix the bug and then have a discussion over whether there are edge cases.
[^2]: People can contribute in many ways other than just writing code. They can triage bugs. They can reproduce bugs. They can write documentation. They can clean up code to make it more maintainable. Heck, they can even moderate discussion boards! :grinning:
[^3]: You'll see this pattern in a lot of agile process literature referred to as the [OODA Loop][ooda-loop].
[^4]: Well, except for my [tabs-to-spaces package][tabs-to-spaces] which was created because I got frustrated with people asking for the feature on the message board ... so in a fit of pique and inspiration, I just coded it up and released it one night :laughing:

[atom]: https://atom.io
[discuss]: https://discuss.atom.io
[github]: https://github.com
[great-redeemer]: https://www.youtube.com/watch?v=3uhf4uPruro#t=13
[my-packages]: https://atom.io/users/lee-dohm/packages
[ooda-loop]: http://www.cutimes.com/2012/11/20/the-ooda-loop-of-agile-decision-making
[peer-review]: http://en.wikipedia.org/wiki/Peer_review
[pull-request]: https://help.github.com/articles/using-pull-requests/
[tabs-to-spaces]: https://atom.io/packages/tabs-to-spaces
