---
layout: post
title: What Does ZBB Actually Mean?
tags: Coder Tester
date: 2013-08-14 13:33:25.516382000 -07:00
---

I had a discussion around the deeper meaning of the commonly used but just as commonly misunderstood software development term "ZBB". ZBB is a TLA[^1] that describes a milestone in the development of a software project. Most often, ZBB is a term used in development houses that have both a dev team and a test team. The reason why will become apparent in a bit. The process generally follows the progression: Development, Code/Feature Complete, ZBB, Deployment/Ship. So now we know that ZBB is a necessary step on the way to shipping something, but how do we know we've gotten there?

If you're reading this blog and you've heard the term ZBB before, you were probably told that it was something like "Zero Bug Build" or "Zero Bug Barrier". What it stood for originally is "Zero Bug Bounce". Yes, bounce. The reason why is a bit complicated ... and memorable.

![Bug Burndown Chart](/images/BugBurndown.png)

This is a chart of the number of bugs being tracked in a product over time. See the part where the bug count starts bouncing on the zero line at about the 25^(th)? This is where the development team has caught up with the test team and is fixing bugs as fast as the test team is finding them. This doesn't mean that all the bugs have been found or fixed because *all* the bugs will never be found in any significant software project, let alone fixed. It just means that there are few enough bugs that the test team has caught all the easy ones and isn't filing bugs faster than the dev team can fix them anymore.

It is important to note that ZBB does *not* equal "ready to ship". That is a separate decision that has to be made based on the severity of the new bugs being found. If the test team is still finding ship-blocker level bugs during the ZBB phase, then the product is most definitely not ready to ship. But if the trickle of new bugs are little things, then perhaps it is.

You might think that the first time the bug count hits zero is the ZBB, in the example here on the 16^(th). But ZBB is a maintainable state when one isn't adding more features. Often in organizations with a separate test team that is very date driven, you'll see the development team "push for ZBB" in an effort to make the actual ZBB date match up with the planned one. Sometimes coming in on the weekend and such. But ZBB is something that one can only declare in retrospect because it is the bounce that key, not reaching zero bugs.

Ideally, you know you've hit ZBB when the test team agrees that they aren't finding a lot of bugs anymore and the dev team agrees that they can keep up easily with what the test team is still finding.

[^1]: Three Letter Acronym

[moving-average]: http://en.wikipedia.org/wiki/Moving_average
