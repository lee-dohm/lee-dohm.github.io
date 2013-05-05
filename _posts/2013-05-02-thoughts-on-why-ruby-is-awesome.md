---
layout: post
title: "Thoughts on Why Ruby is Awesome"
published: false
tags: Coder
date: 2013-05-02 11:45:52 -0700

excerpt: I've been thinking a lot about various programming languages because where I work now is a fairly [polyglot](http://memeagora.blogspot.com/2006/12/polyglot-programming.html) kind of place. We have significant code bases in Java, Ruby and Python, and you can probably find at least some project or another in probably any modern programming language. I've been getting the itch to learn a new language and that has made me start looking at things like [Haskell](http://www.haskell.org), [Erlang](http://www.erlang.org) and [Google's Go](http://www.golang.org). But each time I start learning a new language, when I just want to implement something, I always come back to Ruby. So I'm going to explain some of the reasons why I've been choosing Ruby as the language I'm using to implement things instead of these arguably more powerful and definitely more exotic languages.
---

I've been thinking a lot about various programming languages because where I work now is a fairly [polyglot][polyglot] kind of place. We have significant code bases in Java, Ruby and Python, and you can probably find at least some project or another in probably any modern programming language. I've been getting the itch to learn a new language and that has made me start looking at things like [Haskell][haskell], [Erlang][erlang] and [Google's Go][golang]. But each time I start learning a new language, when I just want to implement something, I always come back to Ruby. So I'm going to explain some of the reasons why I've been choosing Ruby as the language I'm using to implement things instead of these arguably more powerful and definitely more exotic languages.

## One Language to Rule Them All

As most know, Ruby has some great metaprogramming capabilities and this facilitates creating [DSLs][dsl]. What is less known, outside of the Ruby community, is that there are Ruby DSLs for nearly everything under the sun now. For example, I'm currently using the following in just *one* of my projects:

* [Gemfile][gemfile] &ndash; Specify the project's dependencies
* [Gemspec][gemspec] &ndash; Describe the Gem's metadata
* [Guardfile][guardfile] &ndash; Rules for automatically running tasks to facilitate rapid development
* [Rakefile][rake] &ndash; Tasks for automating building and testing the project
* [Treetop][treetop] &ndash; Language grammar from which a parser is built

*Each are linked to an example file from my project.*

As you can see by looking at the files themselves, they all look somewhat similar in structure despite the fact that each is designed to perform very different functions. And this is what tripped me up when I first started learning Ruby. "Why," said I of a couple years ago, "does Ruby need to replace everything that has been working well for so long? They replaced [make][make] fer cryin' out loud! What's so awesome about Rake that makes it better than make?" And when I dug into it, I couldn't really see anything that made it better. It did all the same things make did. It had a system for specifying how certain types of files got built, specifying generic tasks and declaring which tasks were dependent on others. So why did everything in Ruby use Rake?

It was right there, staring me in the face. The reason why Rake is better than make for Ruby projects is *because* the Rakefile is actual Ruby code. If you look at the section of the code starting at line 66, you'll see a task that I wrote for updating the `.yardopts` file. What that file does isn't important, but the task description is. The code inside that task block is fairly idiomatic Ruby code to write a list of things out to a file. And *that* is the secret. Rake leverages my understanding of Ruby to make working with Rake easier. Additionally, Rake leverages the entire Ruby standard library and, potentially, the entire library of Ruby Gems to make itself more powerful. These are the advantages that every Ruby DSL has right out of the box.

So not only does a Ruby DSL not have to worry about writing a grammar, a lexer, a parser, it doesn't have to worry about whether or not comments are needed in this language and how they are written ("Do I use C-style `//` comments or Shell-style `#` comments?"), but most importantly it doesn't have to worry about all the weird things people might try to do with it. All the edge cases that are so hard to plan for in DSLs are covered because the DSL *is* Ruby code. I don't need to encode a way for my DSL to write to a file because Ruby has that capability. I don't need to build in a way for my DSL to retrieve a file from a URL because Ruby has that already. Someone could use my DSL to send email and I'll never know because I didn't have to think of it first! This is probably why DSLs are so common in Ruby, simply because they are so darned simple to create.

## A Diamond in the Rough No Longer

What [CPAN][cpan] did for [Perl][perl], [RubyGems][rubygems] has perfected. Both tools allow one to access a gigantic library of downloadable modules of code. What RubyGems did though was add dependency management to the mix. Not only can I specify that my project is dependent on the Foo gem, but I can state that my project requires specifically the 1.1.2 version of the Foo gem. And if the 1.1.2 version of the Foo gem depends on the 3.5.4 version of the Bar gem, then the RubyGems system installs that too. [And so on, and so on ...][and so on]



[and so on]: http://www.youtube.com/watch?v=mcskckuosxQ
[cpan]: http://en.wikipedia.org/wiki/CPAN
[dsl]: http://en.wikipedia.org/wiki/Domain_specific_language
[erlang]: http://www.erlang.org
[gemfile]: https://github.com/lee-dohm/kangaruby/blob/master/Gemfile
[gemspec]: https://github.com/lee-dohm/kangaruby/blob/master/kangaruby.gemspec
[golang]: http://www.golang.org
[guardfile]: https://github.com/lee-dohm/kangaruby/blob/master/Guardfile
[haskell]: http://www.haskell.org
[make]: http://en.wikipedia.org/wiki/Make_(software)
[perl]: http://en.wikipedia.org/wiki/Perl
[polyglot]: http://memeagora.blogspot.com/2006/12/polyglot-programming.html
[rake]: https://github.com/lee-dohm/kangaruby/blob/44c639518a236cd58878f0a80b9bab338960bdba/Rakefile
[rubygems]: http://en.wikipedia.org/wiki/RubyGems
[treetop]: https://github.com/lee-dohm/kangaruby/blob/master/grammar/sequence.treetop

