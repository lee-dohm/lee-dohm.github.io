---
layout: post
title: Chesterton's Fence and Open Source
date: 2020-11-14 12:00:00 -07:00
---

Through the help of @robrix, I recently learned there's a term for a concept that I'd run up against time and time again in maintaining open source projects: [Chesterton's Fence][chestertons-fence]. The short definition is that you should always completely understand why something is the way it is before you make a change. This is because, too often, when we don't understand the reasons why something exists, we assume that the reasons were worthless, unreasonable, nonexistent, or are now outdated.

[chestertons-fence]: https://fs.blog/2020/03/chestertons-fence/

We see this in open source over and over and over again. Someone comes along and proposes a change because a particular feature doesn't work the way they expect it to. On small open source projects, the maintainers may have plenty of time to explain the reasoning behind the current implementation of the feature, the tradeoffs that were considered, and other requirements that factored into the decision. On medium or large sized open source projects, having that available time is less and less often the case, leading to conflicts where now not only does the person advocating for change assume that the feature was implemented poorly but that additionally the maintainer is giving them the runaround because they are incompetent morons that simply can't grasp the flawless wisdom of the proposed change.

I've seen various open source projects attempt to combat this tendency through the use of pull request templates with sections that ask the change author to explain things like the tradeoffs or pros and cons between the current and the proposed implementation. Unfortunately, these often go unfilled or insufficiently filled in because the change author still hasn't taken the time to understand the reasoning behind the original design. So of course every change is 100% benefit and 0% drawback, how could it be otherwise?

I'm going to start introducing the concept of Chesterton's Fence into the open source projects that I work with, even going so far as to reference it in pull request templates or responses to insufficiently researched pull requests to see how it might improve understanding and cooperation between maintainers and potential contributors. If I'm able to gather data on how it works, I'll report back!
