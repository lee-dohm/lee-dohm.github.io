---
layout: post
title: Shells and Scripting
tags: Coder
date: 2013-08-25 20:00:59.750978000 -07:00
---

I've spent a significant chunk of my weekend playing around with a new command-line shell, [fish][fish], the **F**riendly **I**nteractive **SH**ell. I'd seen people using it on a couple of screencasts and thought about checking it out for quite a while. I finally got around to it ...

It was a little frustrating to work with at first because it is designed to be simpler to use and therefore friendlier than other shells, so I had to convert some of the ways I was doing things in my older shell, [zsh][zsh], to the new way of doing things. But after I got done replicating all of my environment customizations in fish, it turns out that my fish configuration is *tons* simpler than the one in zsh. I was pretty impressed, so I've switched over my main computer and will probably switch over my work computers this week. But as I worked with it, something bothered me.

It is interesting that with all the progress in computers over the last few decades, we still use command-line environments that have remained largely unchanged since about the 1980s. In the 80s many people were still writing significant amounts of code in BASIC, COBOL, Fortran and other primitive languages. We have rightly done away with those archaic systems and replaced them with much more modern ones. But what languages that should have gone the way of Latin and Sanskrit do I still see people writing whole programs in? Shell scripts.[^1]

It's true that the scripting language in fish is *much* simpler and more consistent than zsh or [bash][bash], but I have never seen a shell scripting language that can hold a candle to even the worst modern scripting language,[^2] let alone one of the better ones. There is one and only one capability that shell scripting languages have that other languages can't easily replicate: setting environment variables. But environment variables are the **globalest** of global variables ... not only can they be read or written anywhere in your program like normal global variables but environment variables can be read, and if you're writing shell scripts written, by *other* programs too! There are other ways to communicate state between programs now people! :rage:

Other than raw capabilities programming-wise, there is one other argument for these languages of yesteryear. That is their ubiquity. Every Unix machine comes with bash already installed. Every single Windows machine and every DOS machine before that can run batch files. But it is also their ubiquity that ties them down, that ossifies them, to the point where they go for decades without changing, without keeping up with the times. And in this day and age of always-on Internet connections and easy-to-use [package][brew] [managers][apt-get], installing something better is only a few keystrokes away.

Let's take a look at an example. I wrote some code to reorder the `PATH` environment variable in fish. It does the following:

1. Locates `/usr/bin` and `/usr/local/bin` in the `PATH`
1. If `/usr/local/bin` is *after* `/usr/bin` it:
    1. Removes `/usr/local/bin`
    1. Inserts `/usr/local/bin` just before `/usr/bin`

This is the implementation in fish:

```bash
set --local bin_index (contains --index /usr/bin $PATH)
set --local local_bin_index (contains --index /usr/local/bin $PATH)

if test $local_bin_index -gt $bin_index
    set --erase $PATH[$local_bin_index]

    set --local local_path ''
    if test (math $bin_index - 1) -gt 0
        set local_path $PATH[1..(math $bin_index - 1)]
    end

    set local_path $local_path /usr/local/bin
    set local_path $local_path $PATH[$bin_index..-1]

    set --global --export PATH $local_path
end
```

And here is the equivalent Ruby code:

```ruby
path = ENV['PATH'].split(/:/)

bin_index = path.find_index('/usr/bin')
local_bin_index = path.find_index('/usr/local/bin')

if local_bin_index > bin_index
  path.delete_at(local_bin_index)
  path.insert(bin_index, '/usr/local/bin')

  ENV['PATH'] = path
end
```

Ruby has a reputation for being concise, so let's not look at line counts and such.[^3] But the *clarity* of the code is clearly worse in fish ... maybe not a lot worse, but worse all the same. I don't count this as a fault of fish shell. It isn't meant to be a general-purpose programming language and the code here is *much* more concise, readable, understandable and maintainable than the same thing would be in bash! The fish language is way ahead of other shell scripting languages,[^4] but that's not a high bar. I mean, it's on their homepage, "Finally, a command line shell for the 90s". And they're joking, but only just.

What this all boils down to is that I'm all for shell scripts that allow you to customize your working environment. Or shell scripts that make a simple task even simpler.[^5] But if a shell script grows to over 20 lines of code, or you're confronted with error handling, or you start namespacing your environment variables so they don't clash :sob:, or you start constructing a series of libraries to manage all the shell code you have :confounded:, it is time to rewrite it in a real programming language. The command line is a great place to execute *ad hoc* commands to deal with one-off tasks[^6] but shell scripts are not a replacement for real code.

[^1]: This includes [batch files][batch] on Windows as well.
[^2]: I nominate Perl. :laughing:
[^3]: Ok, I can't resist. I'll just put it down here in a footnote. The fish implementation is 60% larger by line count and 88% larger by character count! :scream:
[^4]: With the possible exception of [Windows PowerShell][powershell].
[^5]: If you want to see what sorts of things I automate at the command line, check out my [environment project][environment] on GitHub.
[^6]: Though both Python and Ruby come with [REPL][repl] environments that serve a very similar purpose.

[apt-get]: http://en.wikipedia.org/wiki/Advanced_Packaging_Tool
[bash]: http://www.gnu.org/software/bash/
[batch]: http://en.wikipedia.org/wiki/Batch_files
[brew]: http://brew.sh
[environment]: https://github.com/lee-dohm/environment
[fish]: http://www.fishshell.com
[powershell]: http://technet.microsoft.com/en-us/scriptcenter/powershell.aspx
[repl]: http://en.wikipedia.org/wiki/REPL
[zsh]: http://www.zsh.org/
