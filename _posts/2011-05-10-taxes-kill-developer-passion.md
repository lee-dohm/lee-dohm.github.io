---
layout: post
title: Taxes Kill Developer Passion
tags: Coder
date: 2011-05-10 23:22:00 -0700
---

I read [Process Kills Developer Passion](http://radar.oreilly.com/2011/05/process-kills-developer-passion.html) earlier today and could not wait to get home and write up my thoughts.  The essay posits that "Over the past few years, the software industry has become increasingly focused on process and metrics as a way to ensure 'quality' code."  I think the software industry as a whole has been tilting at that particular windmill for almost as long as there has been code.  I think the shift in focus is that now it is developers themselves that are trying to build systems to ensure quality code, not just managers.

It lists a bunch of ways that one would be spending time on process rather than not-process, presumably getting real work done.  He also lists a few horror stories like "... the test cases took two- or three-times as much time to code as the actual code ...".  My only question there was, "Were they good test cases?"

I agree that spending more time than is necessary on process can be seen as a tax, resources that are spent on things that do not benefit the end result of the project.  But in the cases of things that are objected to, they are not necessarily a tax.  Perhaps they were on the projects he has worked on.  But I have also seen counterexamples of the things that are listed:

* Doing full TDD, enabling the developers to write less actual code because the tests proved that it wasn't necessary.
* Requiring a high percentage of code coverage, ensuring that the tests that were written don't just test the same code over and over again.
* Having full code-reviews on all checkins, giving newer developers a chance to learn from their more experienced colleagues ... and even their more experienced colleagues being exposed to new techniques.
* Using tools to measure code complexity, so that there isn't a bunch of time wasted in code reviews saying, "I think this is too complex" and "I don't think it is".

So the processes that the article decries can be useful (or at least some of them).  It is only when there is a bunch of wasted effort through mindless devotion to "the process" that something quickly becomes a tax.  And taxes kill developer passion because a developer gets their pleasure out of creating something.  The more taxes that are heaped on top of creating something, the less pleasure they feel.  The less pleasure, the less passion.

But let us not forget the biggest tax of all, bad code.  Bad code forces one to do battle with it in order to make changes.  Bad code drags on a project so that it is moving slower and slower and slower until any change is moving the project backward because fixing one bug leads to the introduction of at least one new bug.  Bad code is a tax because the time spent fixing bad code could be spent moving the project forward.

As a wise man once said, "The only things certain in life are death and taxes."  You are going to pay taxes on your project, whether it is in the form of process to prevent bad code from entering your code base or in the form of fixing the bad code once it was in there.  Does that mean we should just suck it up and accept the drudgery of process?  Hell no!  But there's no reason process should be drudgery.  For example:

* There are many code review tools out there that significantly speed up the code review process as well as make it a searchable system that can be mined for information and learnings.  (Malevich and Mondrian are two that spring to mind.)
* Keeping track of time doesn't have to be a chore.  The Evidence-Based Scheduling in FogBugz uses a very simple system.  When you start working on a work item, you click a little dropdown and say which one you're working on.  When you stop, you set it to Nothing.  It even auto-stops for you at lunch and quitting time if you configure it so.
* Planning Poker and other practices have been developed to make planning easy, accurate and fast.

The article points out that there is a spread of skill levels amongst developers and that it isn't fair to force the best developers submit to process that is designed to prevent the worst developers from making mistakes.  [Checklists and following process](http://getbetterhealth.com/why-doctors-should-be-less-like-chuck-yeager-and-more-like-captain-sullenberger/2010.11.24) have shown time and again that they reduce defects even amongst the most talented.  Because all developers make mistakes.

So just as we shouldn't perceive mindless process as a magic bullet, neither should we perceive all process as evil.  Let's just strive for more and more ways to keep the taxes down.
