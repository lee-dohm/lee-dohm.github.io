---
layout: post
title: Numeric Breakdown of Why Wholesale Surveillance Doesn't Work
date: 2015-07-10 18:20:39.674462000 -07:00
redirect_from: /2015/07/10/numeric-breakdown-of-why-wholesale-surveillance-doesnt-work.html
---

Reddit user [/u/0v3rk1ll](https://www.reddit.com/user/0v3rk1ll) gave [a detailed explanation](https://www.reddit.com/r/india/comments/3csl2y/wikileaks_releases_over_a_million_emails_from/csyjuw6) of exactly why invading the privacy of an entire country simply does not yield useful results. It boils down to the fact that for every system that is used to examine an item and then make a determination whether that item falls into Group A (in this case Terrorists) or Group B (not Terrorists) has two important qualities:

* A success rate &mdash; the percentage of actual members of Group A will be identified as Group A
* A false positive rate &mdash; the percentage of actual members of Group B that will be identified incorrectly as Group A

Even when the success rate is unrealistically high and the false positive rate is unrealistically low, if the numbers of members of Group A are significantly smaller than Group B, you will get *far* more false positives than successes. The numbers that 0v3rk1ll gave for a simple example were:

* Population of 300 million
* 1 million of the population are Group A
* Success Rate = 99%
* False Positive Rate = 1%

This means that \\(1million \times 99\% \simeq ~1million\\). But \\(300million \times 1\% = 3million\\)! This means that even in this unrealistic example the system will be returning *three times as many bad results as good ones*. And it only gets worse the more realistic you make the numbers:

* Population of 300 million
* 1 million of the population are Group A[^number-of-terrorists]
* Success Rate = 50% \\(\Rightarrow 1million \times 50\% = 0.5million\\)
* False Positive Rate = 20% \\(\Rightarrow 300million \times 20\% = 60million\\)

Which means **bad results outnumber good by nearly 120 times** and that now you have to investigate 60.5 million people. And 60 million of them are completely innocent.

How is this *not* a horrific invasion of privacy for **zero** real benefit again?

[^number-of-terrorists]: There are only 400,000 entries on the FBI's [Terrorist Watch List](https://en.wikipedia.org/wiki/Terrorist_Screening_Database), so even 1 million is unrealistically high. The futility of wholesale surveillance is only more apparent the more realistic the scenarios.
