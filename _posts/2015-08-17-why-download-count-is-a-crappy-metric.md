---
layout: post
title: Why Download Count is a Crappy Metric
date: 2015-08-17 13:22:12.041364000 -07:00
redirect_from: /2015/08/17/why-download-count-is-a-crappy-metric.html
---

I see people trying to make all kinds of false inferences based on download counts[^1] of things. Which of the following statements are true?

* Something that has been downloaded more means it is more popular
* Something that has been downloaded more means it has more current active users
* Something that has been downloaded more means it is of higher quality
* Something that has been downloaded more means it is of lower quality

If you guessed that none of them are true, you would be correct. Here are just a few of the many possible counter-examples:

* X has been available twice as long as Y, even though they are equally popular
* X has a much higher abandon rate than Y, meaning people try X and stop using it but people who use Y stay
* X has had many updates for bug fixes whereas Y was written right the first time and hasn't needed many fixes
* X has added features in every update whereas Y has been fixing bugs

In the above examples, X is the thing that is downloaded more.

So what can we infer from one thing having a higher download count than another? We can only state for certain that *it has been downloaded more.*[^2] The reason for this is that all a download count tells you is that the item was downloaded, it can't tell you *why* it was downloaded. All of the above fallacies make assumptions as to why people are downloading something without considering all of the *other* reasons it could be downloaded. This makes it completely meaningless as a metric of comparison between two things because the reasons for downloading X and Y could be vastly different. And it is nearly useless even when comparing the same thing between two points in time when the time window is large because reasons for downloading can shift over time.

If download count is such a crappy metric, then why does pretty much every package/plugin/add-on manager provide a download count for things? In my opinion:

1. Because it is easy to track
1. Because it gives the person who built the package/plugin/add-on a warm fuzzy to see their download count go up over time
1. Because people insist on ascribing meaning to it, so they demand it even though it isn't useful

For these reasons, download counts aren't going away. Let's just not have any illusions about what they really mean.

[^1]: By the way, the same goes for install/upgrade counts as well, even if you keep track of them separately.
[^2]: Perhaps some of you will remember back when virtually every web page had a [hit counter][hit-counter]. The reason why you don't see them anymore is because hit counters, like download counters, are virtually meaningless as a metric of comparison except to that hit counter on that exact page. This is why we now have metrics like number of sessions, average session length, users and pages per session.<br/><br/>We also have the metric of "impressions" which most people think is the same as "hits" but it isn't. An impression is a single load of a specific page by a single user. Hits were never very well defined and could include things like loading stylesheets or images as well as loading pages.<br/><br/>More rigorous, well-defined data is better :grinning:

[hit-counter]: https://en.wikipedia.org/wiki/Web_counter
