---
layout: post
title: ! 'In Search Of: The Perfect Editor'
tags: Coder
date: 2013-11-17 11:41:16.213497000 -08:00
---

I've been using [Sublime Text][st3] as my all-around text editor for a couple of years now. It has been really great and probably the best editor I've ever used up to this point. Despite this, I started checking out other editors. I started with [TextMate][textmate] because I got an email urging me to check it out. TextMate was one of the most popular editors on the Mac platform until it was [mostly abandoned and then finally open-sourced][textmate-history]. I liked some things about it, but I still had a vague feeling of unease. So I sat down and thought about what I was really looking for in an editor:

* **Cross-Platform** - I liked that I was able to use Sublime Text on any OS I decided to land on and I didn't want to lose that ability.
* **Extensible** - Sublime Text (and TextMate as well) has a lot of flexibility offered by extensions with a huge ecosystem of people writing extensions of all kinds. I knew that I wouldn't be satisfied with any editor that wasn't at least that flexible.
* **Mature** - The main issue I was starting to have with Sublime Text and did have with TextMate was that they both felt like they had, for me, serious shortcomings. A complete lack of responsiveness from the author of Sublime Text on the one hand and just general rough edges in the case of TextMate.

It was in this period of general dissatisfaction that I started listening to the [Ruby Rogues podcast][rogues]. A few of the members of that podcast are avowed [Emacs][emacs] users. I also remembered that [Bozhidar Batsov][batsov], the maintainer of [RuboCop][rubocop] and the unofficial [Ruby Style Guide][style], is an Emacs user. So, on a lark, I decided to check it out starting with an article on [how to get Emacs installed and configured on OS X][emacs-on-osx]. To my surprise, I found that Emacs meets all of my above criteria and some others I didn't really know I had ... with some caveats.

## The Ugly ##

Let's start with what is ugly about Emacs. Emacs is ugly. Even in GUI mode, Emacs is essentially a character-mode application wrapped in a crappy X-window with hideous icons.[^1] Emacs hasn't made any progress UI-wise at least since the last time I looked at it about ten years ago and possibly very much progress since it was created about thirty years ago[^2] :scream: If you expected *any* sort of modern GUI niceties, you are looking in the wrong place.

## The Bad ##

Having been in constant use and development for essentially the entire history of the personal computer[^3], Emacs has a *lot* of anachronisms. The interface is essentially completely keyboard driven.[^4] Even common operations require what most today would consider complicated keystroke combinations by default.[^5] The defaults are like going back in time to a bygone era of programming editors, but not the dreamy nostalgic kind, more like when people talk about the hardships of the Oregon Trail or the Donner Party, back to a time when an editor really was just a place for you to type characters and somehow slap them into the right configuration to make a program out of them. Line wrapping splits words in the middle by default. The default color scheme is approaching the hideousness of [Hot Dog Stand][hot-dog-stand]. It's like the idea is to make it so just in case a caveman programmer from the 1970s fell into a wormhole and ends up in modern times, they would at least be able to find their way around the editor and write code.

## The Good ##

You may have noticed that I kept saying "by default" in the last section. This is the thing, nobody uses the defaults. Just a [simple look through GitHub][emacs-configs] proves that.[^6] And the thing that has people thinking that Sublime Text is so revolutionary, that its configuration is just a bunch of JSON files, is really kind of old hat. Emacs configuration isn't just a bunch of data files. Emacs configuration is done in *code*, a dialect of Lisp called Emacs Lisp to be specific. Back in 2010 in my article [The Perfect IDE][perfect-ide] I said:

> IDEs need to realize their main job is window and plugin management. The IDE is simply there to mediate the interactions between various plugins that do the heavy lifting and provide windows that let the developer see what the plugins are doing for them.

Little did I know that there was an editor that exemplified this very ideal and had been around since just a few short years after I was born!

Emacs isn't really an editor. It is a programming language that you use to write your dream editor with. The awesome bit is that there are *huge* libraries of code out there to help you. Whether you want to do it all custom to make it work just how you want or if you want to piece it together using building blocks that others have provided, my personal choice, or you simply want to start with [some defaults that make sense to the modern programmer][prelude] and move on from there, Emacs has you covered. And *everything* is configurable.

Over the years, I've gotten frustrated with this IDE or that editor for being configurable only up to a point. Visual Studio notoriously offers the ability for one to add support for non-Microsoft languages, but the method for doing so is so arcane nobody can ever figure out how. Sublime Text and TextMate have the ability to configure their syntax highlighting ... but only as long as you can describe how with regular expressions.[^7] With Emacs, all configuration is just code. Want to add support for another language? Write some code. Want to syntax highlight some stuff? Write the rules how using some code. Want to set the keybinding for your completely custom function to `Fn+Ctrl+Shift+\`? Emacs will let you do it, with code. Want to write your own snippet management system? [You can do that!][yasnippet] Want to display Google Maps inside Emacs? [There is code for that too.][emacs-maps] If there are limits on how you can extend Emacs, it will probably be a while before I find them.

Now, it is true that the first several things you configure in Emacs (with code!) are probably going to be things that drive you absolutely bonkers and make you wonder why any sane person in recent history would think *that* would be a good idea for a default. But, honestly, I've found that to be true to one extent or another with any editor. After that will come the obligatory installing of packages and color themes. And then another round of tweaking. But, at least in my case, I've ended up with an editor that is at least as capable as Sublime Text ... and is already more powerful in some ways. So much so that I am willing to overlook the minor warts that my tweaking has not yet been able to stamp out and really give Emacs a proper chance.

I may be posting more on this topic in the future. So if you're interested, keep an eye out!

[^1]: Fortunately, that is one of the first things I learned how to turn off.
[^2]: Actually, [according to Wikipedia][emacs-wikipedia], Emacs is at least 36 years old having been released initially in 1976. The [source code repository][emacs-git] has revisions dating back to 1984!!! :dizzy_face:
[^3]: The [MITS Altair 8800][altair] was released in 1975 and is generally acknowledged as the beginning of the era of the "Personal Computer", i.e. one that an individual could own as opposed to a corporation or a research lab.
[^4]: Some consider that one of its strengths. There are some minor concessions to mouse use, but they are poorly tacked on and look as out-of-place as a Klansman at a NAACP meeting.
[^5]: Saving the current file is `Ctrl+X Ctrl+S` (or `C-x C-s` in Emacs notation). Exiting the application is `Ctrl+X Ctrl+C`. Many other functions are keystroke combinations of three, four or even five keystrokes in length! :open_mouth:
[^6]: You can find my slowly growing [Emacs configuration][my-emacs-config] on GitHub too.
[^7]: If you think regular expressions are enough, syntax highlight a Git commit message in the following way: The first line is the default coloring for the first 50 characters. After the first 50 characters on the first line it is the error coloring. The second line is all error coloring. The third line and beyond is an alternate coloring, no matter how long. And any line where the first character is a hash mark, `#`, uses the comment coloring.

[altair]: https://en.wikipedia.org/wiki/MITS_Altair
[batsov]: http://batsov.com
[emacs-configs]: https://github.com/search?l=Emacs+Lisp&q=emacs&source=c&type=Repositories
[emacs-git]: http://git.savannah.gnu.org/cgit/emacs.git
[emacs-maps]: http://julien.danjou.info/projects/emacs-packages#google-maps
[emacs-on-osx]: http://crypt.codemancers.com/posts/2013-09-26-setting-up-emacs-as-development-environment-on-osx/
[emacs-wikipedia]: https://en.wikipedia.org/wiki/Emacs
[emacs]: https://www.gnu.org/software/emacs/
[hot-dog-stand]: http://www.codinghorror.com/blog/2005/07/a-tribute-to-the-windows-31-hot-dog-stand-color-scheme.html
[my-emacs-config]: https://github.com/lee-dohm/emacs
[perfect-ide]: /2010/07/10/the-perfect-ide.html
[prelude]: https://github.com/bbatsov/prelude
[rogues]: http://rubyrogues.com/
[rubocop]: https://github.com/bbatsov/rubocop
[st3]: http://www.sublimetext.com
[style]: https://github.com/bbatsov/ruby-style-guide
[textmate-history]: https://www.google.com/search?q=site%3Amarco.org+textmate
[textmate]: http://macromates.com/
[yasnippet]: http://capitaomorte.github.io/yasnippet/
