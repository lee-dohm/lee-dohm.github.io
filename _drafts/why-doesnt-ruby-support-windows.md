---
layout: post
title: Why Doesn't Ruby Support Windows?
tags: Coder Geeky
---

I've seen this question pop up a few times lately in a couple different venues. It is asked in all seriousness and in a couple different variations, but it all boils down to the same thing: "I'm a Windows user and I want in on all the amazing things I see Ruby doing, but it isn't as easy to do these things on Windows as it is on a Unix-derived OS ... and I want it to be." Some of these people say the Ruby community is specifically antagonistic towards Windows or Windows developers. Some say that developers in the Ruby community need to understand that in order for Ruby to become mainstream, it needs to embrace Windows. But let's leave aside the traditional antagonism between Windows and Unix and examine what people mean when they say Ruby "doesn't support" Windows, why that is and what, if anything, should be done about it.

Let's get one thing out of the way right off the bat. Ruby *does* support Windows. There is the [Ruby Installer][installer] that will help you get it installed properly. MRI Ruby runs just fine on Windows[^1] and there is even a [win32ole][win32ole] module in the standard library. Ruby even handles Windows line endings when run on a Windows machine. So, Ruby itself supports Windows. What are they really saying then?

Mostly, I feel like they are saying that the Ruby *community* doesn't support Windows. And this is more or less true. I don't know of any serious Ruby developers[^2] that use Windows. And the only Gem that I know off the top of my head that explicitly states it supports Windows is [Nokogiri][nokogiri].

[^1]: I haven't tried other Rubies like JRuby or Rubinius.
[^2]: Though I don't know any serious Ruby developers personally, the ones I *know of* all use some Unix variant.

[installer]: http://rubyinstaller.org/
[nokogiri]: http://nokogiri.org/
[win32ole]: http://rubydoc.info/stdlib/win32ole/index
