---
layout: post
title: The Perfect Editor, Redux
tags: Coder
date: 2014-05-29 11:53:05.951559000 -07:00
alias: 2014/05/29/the-perfect-editor-redux.html
---

About six months ago I wrote [In Search Of: The Perfect Editor][perfect-editor] talking about Emacs and how it was my latest favorite editor and why. Well, for the last month or so, I've been working with and on a new editor, [Atom][atom].

Let's take a look at what I said were my requirements for an editor:

* **Cross-Platform**
* **Extensible**
* **Mature**

Since I started using Emacs though, I've added a couple more:

* **Open Source** &mdash; One of the things I really enjoyed about Emacs is that there was no part of the editor that I couldn't change if I had a mind. It also would have solved a couple of problems I had with Sublime Text.
* **Programmable** &mdash; This is subtly different from "extensible". An application that is extensible has specific points that are designed to be extended, but intentionally not all of the application. In Sublime Text, for example, you can customize the themes, but you can't change when windows are opened or closed or display something other than text for a given file type. A programmable editor would allow you to change core functionality or add new types of functionality that the original author didn't expect or intend.

While there are a ton of things to like about Emacs, the part that just kept niggling at me was the character-mode window. This means that you can't have a decent tree view of your project. This means that the richer formatting we're used to in this modern age just doesn't exist for the most part. It wasn't anything big or anything that made Emacs unusable ... it was just a lot of little annoyances.

So when I heard that Atom had been announced by [GitHub][github], I immediately took a look. It is billed as "A hackable text editor for the 21st Century". It is built on top of [Chromium][chromium], the underpinnings of the [Google Chrome browser][chrome]. It is programmed in and programmable by CoffeeScript or JavaScript. And it is styled using LESS or CSS. It uses all the web technologies that so many developers these days are familiar with to create a full-featured programmer's text editor.

It was definitely rough around the edges at first, but it has made great strides in the past couple months. And the package community has simply *exploded* with new functionality and features for it. I've even written [a few of my own][my-packages]. I've found it really easy to write my own packages for it ... and the fact that there is an official and thoroughly supported [package manager][apm] helps quite a bit too.[^apm-api]

Does it satisfy all my criteria for the perfect editor? Not completely, but it is pretty close. It isn't completely cross-platform as you still have to build it yourself for Windows or Linux. And as far as mature goes, well ... it's got a long way to go to match Emacs' 35+ years! But I've heard Atom described aspirationally as "Emacs for the 21<sup>st</sup> Century" ... and I think it really does have that potential.

I really think I've finally found the perfect editor for me.

[^apm-api]: The Atom team has even stated that they will make it so that people can put up their own `apm` package repositories

[apm]: https://github.com/atom/apm
[atom]: https://atom.io
[chrome]: http://www.google.com/chrome
[chromium]: http://www.chromium.org/Home
[github]: https://github.com
[my-packages]: https://atom.io/users/lee-dohm
[perfect-editor]: /2013/11/17/in-search-of-the-perfect-editor.html
