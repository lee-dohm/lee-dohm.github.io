---
layout: post
title: "Thoughts on Why Ruby is Awesome"
tags: Coder Ruby
date: 2013-05-05 12:41:52 -0700

excerpt: I've been thinking a lot about various programming languages because where I work now is a fairly [polyglot](http://memeagora.blogspot.com/2006/12/polyglot-programming.html) kind of place. We have significant code bases in Java, Ruby and Python, and you can probably find at least some project or another in probably any modern programming language. I've been getting the itch to learn a new language and that has made me start looking at things like [Haskell](http://www.haskell.org), [Erlang](http://www.erlang.org) and [Google's Go](http://www.golang.org). But each time I start learning a new language, when I just want to implement something, I always come back to Ruby. So I'm going to explain some of the reasons why I've been choosing Ruby as the language I'm using to implement things instead of these arguably more powerful and definitely more exotic languages.
---

I've been thinking a lot about various programming languages because where I work now is a fairly [polyglot][polyglot] kind of place. We have significant code bases in Java, Ruby and Python, and you can probably find at least some project or another in probably any modern programming language. I've been getting the itch to learn a new language and that has made me start looking at things like [Haskell][haskell], [Erlang][erlang] and [Google's Go][golang]. But each time I start learning a new language, when I just want to implement something, I always come back to Ruby. So I'm going to explain some of the reasons why I've been choosing Ruby as the language I'm using to implement things instead of these arguably more powerful and definitely more exotic languages.

> **Please note:** This post is intended for people who are new to Ruby or want to understand more about why people seem to like it so much. If you're already a die-hard Rubyist, you probably know all this stuff already and will be bored. Or maybe I'll surprise you, who knows?

## One Language to Rule Them All

As most know, Ruby has some great metaprogramming capabilities and this facilitates creating [DSLs][dsl]. What is less known, outside of the Ruby community, is that there are Ruby DSLs for nearly everything under the sun now. For example, I'm currently using the following in just *one* of my projects:

* [Gemfile][gemfile] &ndash; Specify the project's dependencies
* [Gemspec][gemspec] &ndash; Describe the Gem's metadata
* [Guardfile][guardfile] &ndash; Rules for automatically running tasks to facilitate rapid development
* [Rakefile][rake] &ndash; Tasks for automating building and testing the project
* [Treetop][treetop file] &ndash; Language grammar from which a parser is built

*Each are linked to an example file from my project.*

As you can see by looking at the files themselves, they all look somewhat similar in structure despite the fact that each is designed to perform very different functions. And this is what tripped me up when I first started learning Ruby. "Why," said I of a couple years ago, "does Ruby need to replace everything that has been working well for so long? They replaced [make][make] fer cryin' out loud! What's so awesome about Rake that makes it better than make?" And when I dug into it, I couldn't really see anything that made it better. It did all the same things make did. It had a system for specifying how certain types of files got built, specifying generic tasks and declaring which tasks were dependent on others. So why did everything in Ruby use Rake?

It was right there, staring me in the face. The reason why Rake is better than make for Ruby projects is *because* the Rakefile is actual Ruby code. If you look at the section of the code starting at line 66, you'll see a task that I wrote for updating the `.yardopts` file. What that file does isn't important, but the task description is. The code inside that task block is fairly idiomatic Ruby code to write a list of things out to a file. And *that* is the secret. Rake leverages my understanding of Ruby to make working with Rake easier. Additionally, Rake leverages the entire Ruby standard library and, potentially, the entire library of Ruby Gems to make itself more powerful (more on Gems in a bit). These are the advantages that every Ruby DSL has right out of the box.

So not only does a Ruby DSL not have to worry about writing a grammar, a lexer, a parser, it doesn't have to worry about whether or not comments are needed in this language and how they are written[^1], but most importantly it doesn't have to worry about all the weird things people might try to do with it. All the edge cases that are so hard to plan for in DSLs are covered because the DSL *is* Ruby code. I don't need to encode a way for my DSL to write to a file because Ruby has that capability. I don't need to build in a way for my DSL to retrieve a file from a URL because Ruby has that already. Someone could use my DSL to send email and I'll never know because I didn't have to think of it first! This is probably why DSLs are so common in Ruby, simply because they are so darned simple to create.

## A Diamond in the Rough No Longer

What [CPAN][cpan] did for [Perl][perl], [RubyGems][rubygems] has perfected. Both tools allow one to access a gigantic library of downloadable packages of code. Both tools allowed a simple command to install a package. To install a gem named "foo" I simply type `gem install foo` and the RubyGems tool goes to the standard repository, retrieves foo and installs it for me in seconds. What RubyGems did though was add dependency management to the mix. Not only can I specify that my project is dependent on the foo gem, but I can state that my project requires specifically the 1.1.2 version of the foo gem. And if the 1.1.2 version of the foo gem depends on the 3.5.4 version of the bar gem, then the RubyGems system installs that too. [And so on, and so on ...][and so on]

As of this writing there are 3,535 gems available. A gem could be a library of code to use in your own project[^2], or it could be a tool (like Rake) to make building your project easier, or it could be a stand-alone application[^3]. This is a simple idea, but a very complicated system to build, and even harder is building the community around the system that is necessary to make it successful.

Back in what I tend to think of as "the good old days" of programming, the 1970s, when people thought of a programming language, they thought of the language itself. They thought of the keywords, the language constructs, syntax and semantics. Everything else was an adjunct. Pascal was Pascal and Basic was Basic. On the other hand, you might have Turbo Pascal or Microsoft Basic, that generally came with a set of tools and maybe even frameworks or libraries to make working with Pascal or Basic easier and more productive, but nobody mistook that these were actual parts of the language itself.

Then came the 80s and C became popular. Not only was C a new programming language but it also had, inseparably, a "standard library". This allowed people to do more with C right out of the box and certainly had something to do with the language's popularity. Nowadays all new programming languages come with a standard library, and what kinds of things show up in the standard library of a language is becoming more and more expansive. For example, compare the [C standard library][c standard library] and its meager offerings of [math functions][c math functions] and [I/O routines][c io routines] with even [Java's Class Library][jcl] that has things like [2D graphics][java 2d graphics] and [SQL database access][java sql], not to mention even more modern languages like Ruby and its [standardized command-line option parsing][ruby optparse].

The next thing that all new programming languages must offer if they wish to be competitive with the most successful languages is RubyGems-like package and dependency management. Go does have a package system with some basic dependency management, but it is nowhere near as mature as RubyGems is nor does it have the infrastructure that RubyGems does, i.e. one place to go to find the canonical list of packages that are available. Still, Go will definitely be a language to watch in the coming years.

## Documentation is a Programmer's Best Friend

But in order to be able to truly employ these gigantic and ever-expanding libraries of code, one needs quality documentation. This is possibly why most early languages were championed by corporations, because only corporations had the resources to really offer readable, complete, and consistently-updated documentation. But thanks to the creators of [YARD][yard] and the [RubyDoc.info][rubydoc] site, Ruby itself and virtually every Gem ever created has decent, if not good or great, documentation.

YARD builds on the convention of GNU [README][readme] files and the ideas in [JavaDoc][javadoc], to make writing documentation for one's code simple and easy. YARD takes the README files that one is probably writing anyway along with quick-and-dirty code annotations and generates very readable, navigable and understandable HTML documentation that one can use locally, offer to users on one's own website or if your code is offered as a Gem or on [GitHub][github], simply let RubyDoc.info serve your documentation. Even better, if you don't like YARD's default JavaDoc-inspired annotation system, YARD allows plugins to define your own[^4].

## Did I Say Documentation? I Meant Tests

Tests and testing is something that is near and dear to me, having spent the last several years as a professional developer building automated test systems and frameworks for commercial applications. Software systems are getting complicated enough that automated testing is the only truly scalable way to reduce the costs of bugs and allow programmers to concentrate on what they do best and [what they are most passionate about][programming motherfucker], writing code.

Ruby has a large number of well-developed, mature and well-maintained automated test frameworks[^5]. Not only that, but Ruby has test tools to make writing good tests easier such as [FactoryGirl][factorygirl][^6] for quickly and easily defining test data as well as a [plethora of libraries][mocking] for creating [Mocks, Stubs and Fakes][mocks-stubs-fakes].

Of course, these frameworks and tools wouldn't be springing up like weeds if the Ruby community and the general Ruby culture didn't *value* automated testing. And this is one of the things that intrigued me initially about the Ruby community itself. You see, coming from a .NET background where [NUnit][nunit] and related tools were well known but sadly not often used, to come over to a community where it seems every single chunk of code that is destined for public consumption has at the very least a modicum of tests packaged with it was like finding [El Dorado][el dorado].

## Sweet Dreams Are Made of These

People have been asking me a lot lately why I like Ruby so much. And mostly the things I've been telling them are the superficial things that excite me about the language itself, things like blocks, closures, the compact but not terse[^7] syntax, the features and ideas it takes from [functional programming][functional programming] and the metaprogramming that makes writing code in Ruby both simpler and more complicated at the same time. But excitement wears off and familiarity breeds, if not contempt, then at least indifference. The things I've listed above are the things that are going to keep me coming back to Ruby, keep me writing Ruby code and keep me engaged in the Ruby community long after my ADD mentality has chased off after some new "ooo shiny!" These are also the things I will expect the next "big" language to provide before I'll be happy about switching.

[^1]: "Do I use C-style `//` comments or Shell-style `#` comments?"
[^2]: Like [Treetop][treetop gem].
[^3]: Like [Jekyll][jekyll] that I use to build this site currently.
[^4]: [TomDoc][tomdoc] has gathered a decent-sized following lately and, of course, there is a [YARD plugin for TomDoc][yard-tomdoc].
[^5]: [RSpec][rspec] and [Minitest][minitest] being two of the most popular. Also both examples of Ruby DSLs.
[^6]: Another Ruby DSL.
[^7]: Terse in the sense of Perl's line-noise-like syntax. From the book "Learning Perl", one of the most popular books on the language:

    > Yes, sometimes Perl looks like line noise to the uninitiated, but to the seasoned Perl programmer, it looks like checksummed line noise with a mission in life.

[and so on]: http://www.youtube.com/watch?v=mcskckuosxQ
[cpan]: http://en.wikipedia.org/wiki/CPAN
[c io routines]: http://en.wikipedia.org/wiki/Stdio.h
[c math functions]: http://en.wikipedia.org/wiki/Math.h#Overview_of_functions
[c standard library]: http://en.wikipedia.org/wiki/C_standard_library
[dsl]: http://en.wikipedia.org/wiki/Domain_specific_language
[el dorado]: http://en.wikipedia.org/wiki/El_Dorado
[erlang]: http://www.erlang.org
[factorygirl]: https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
[functional programming]: http://en.wikipedia.org/wiki/Functional_programming
[gemfile]: https://github.com/lee-dohm/kangaruby/blob/master/Gemfile
[gemspec]: https://github.com/lee-dohm/kangaruby/blob/master/kangaruby.gemspec
[github]: https://github.com
[golang]: http://www.golang.org
[guardfile]: https://github.com/lee-dohm/kangaruby/blob/master/Guardfile
[haskell]: http://www.haskell.org
[javadoc]: http://en.wikipedia.org/wiki/Javadoc
[java 2d graphics]: http://en.wikipedia.org/wiki/Abstract_Window_Toolkit
[java sql]: http://docs.oracle.com/javase/7/docs/api/java/sql/package-summary.html
[jcl]: http://en.wikipedia.org/wiki/Java_Class_Library
[jekyll]: http://www.jekyllrb.com
[make]: http://en.wikipedia.org/wiki/Make_(software)
[minitest]: http://docs.seattlerb.org/minitest/
[mocking]: https://www.ruby-toolbox.com/categories/mocking
[mocks-stubs-fakes]: http://stackoverflow.com/questions/346372/whats-the-difference-between-faking-mocking-and-stubbing
[nunit]: http://www.nunit.org/
[perl]: http://en.wikipedia.org/wiki/Perl
[polyglot]: http://memeagora.blogspot.com/2006/12/polyglot-programming.html
[programming motherfucker]: http://anndar.net/post/4136866534/programming-motherfucker
[rake]: https://github.com/lee-dohm/kangaruby/blob/44c639518a236cd58878f0a80b9bab338960bdba/Rakefile
[readme]: http://en.wikipedia.org/wiki/README
[rspec]: http://rspec.info/
[rubydoc]: http://rubydoc.info
[rubygems]: http://en.wikipedia.org/wiki/RubyGems
[ruby optparse]: http://rubydoc.info/stdlib/optparse/frames
[tomdoc]: http://tomdoc.org/
[treetop file]: https://github.com/lee-dohm/kangaruby/blob/master/grammar/sequence.treetop
[treetop gem]: http://treetop.rubyforge.org/
[yard]: http://yardoc.org/
[yard-tomdoc]: http://rubyworks.github.io/yard-tomdoc/

