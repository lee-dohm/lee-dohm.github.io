---
layout: post
title: Offline Documentation
tags: Coder
date: 2013-11-29 20:35:04.458873000 -08:00
alias: 2013/11/29/offline-documentation.html
---

There's a new tool that I've heard about from a couple programming podcasts I listen to. It is called [Dash][dash] and it already has [an open-source competitor][zeal] for Linux and Windows. I think it is pretty cool and I was happy to give the developer some cash to support further development of it. I've been happily using it for a while now, but something was always nagging at me in the back of my brain ... especially when I started looking into creating my own docsets for it.

If you look at the documentation for [how to create your own docsets from HTML documentation][docset], you'll notice that it is essentially taking some HTML and CSS, creating an index of certain terms and then zipping it all up into a package. This is a pretty familiar pattern if you've done any research into the formats of eBooks, such as [KF8][kf8], the latest [Kindle][kindle] book format, or [ePub][epub], the standards organization format. I started thinking about this right at the same time as I stumbled upon the [planned feature list][features] and saw that while annotation was one of the planned features, it wasn't going to happen any time soon. Annotation is one of the features that is most valuable in development documentation because you can extend the documentation, you can document those little bugs or edge cases, or even just remind yourself of that cool trick you found the last time you used this particular API. But annotation is one feature that every eBook reader I've *ever* used has. So why not use something like Kindle, [iBooks][ibooks] or any generic ePub reader to read, search and annotate our development documentation offline?

That's actually an easy question to answer. While generating a Dash docset isn't drop-dead simple, it doesn't take much technical savvy to accomplish. On the other hand, the current eBook standards are horrifically complex and do not have much tool support for them. So I wouldn't expect someone who hasn't done it before, even someone quite technical, to be able to take a collection of HTML and CSS and turn out an ePub in half an hour.[^1]

The thing is that there are *so many* advantages to using standard eBook readers for our documentation:

* Already cross-platform &mdash; there are eBook readers for desktops, tablets and phones of all kinds
* Already have needed features &mdash; annotation, bookmarks, full-text search, highlighting, etc
* Synchronization, transfer and backup &mdash; eBook readers have mechanisms for easily storing or transferring your eBooks and backing up annotations and other marks

and there are really only a couple drawbacks: the book packages are hard to create and maintain and they have restrictions that might mean it would be hard, if not impossible, to simply package up some types of developer documentation. But these are drawbacks that can be ameliorated, if not eliminated, with the creation of some new tools.

My proposal is that we should start taking a look at the various documentation generation systems that we have, things like [YARD][yard], [JavaDoc][javadoc], and [SandCastle][sandcastle]. We should add the ability to these tools to generate ePub packages. And then we can leverage the efforts of an entire industry to help us read our documentation wherever we like.

[^1]: Or at least one that I would expect to work in any standard ePub reader.

[dash]: http://kapeli.com/dash
[docset]: http://kapeli.com/docsets
[epub]: http://www.idpf.org/epub3/latest/overview
[features]: http://blog.kapeli.com/a-sneak-peek-at-dashs-future
[ibooks]: https://www.apple.com/apps/ibooks/
[javadoc]: http://www.oracle.com/technetwork/java/javase/documentation/index-jsp-135444.html
[kf8]: http://www.amazon.com/gp/feature.html?docId=1000729511
[kindle]: https://kindle.amazon.com/
[sandcastle]: https://shfb.codeplex.com/
[yard]: http://yardoc.org/
[zeal]: http://zealdocs.org/
