---
layout: post
title: Code Smells as a Code Review Language
tags: Coder
date: 2013-08-11 22:02:52.819699000 -07:00
---

I've been thinking a lot about code reviews lately. I've been thinking about how to make code reviews less tedious by automating as much as possible. By automating code style checks and performing simple [lint][lint]-like static analysis, for example. But once that job is done, what then? Once the code reviewers are freed from checking for the simple mistakes and non-conformance to standards, what is left to check for? Well, this is where code reviews can become really valuable but only when we have a quick, compact method for expressing *how* or *why* the code needs to be changed.

"Code Smells" is a term that was coined by Kent Beck and Martin Fowler and introduced in Martin Fowler's book [Refactoring][refactoring]. It is used to describe code that works, but may have a design flaw that will make maintaining the code in the future problematic. The reason why these are described as smells is just because one of these patterns is present doesn't mean that something is wrong. But as the code smell becomes stronger, fixing the code becomes more important.

Where code smells can assist with code reviews is that it can be used as a sort of shorthand for describing common mistakes or poor design decisions, just like design patterns can be used to describe common useful patterns in code. Just like most developers will know what I mean when I say that a class is a Singleton, so should most developers know what I mean when I say that something smells of Duplicate Code.

So what I have decided to do is to create a list of code smells along with descriptions and examples. I hope to, over time, turn this into the canonical list of code smells.

<div style="text-align: center" markdown="1">*[The Code Smells Project][code-smells-project]*

[code-smells-project]: https://github.com/lee-dohm/code-smells
[lint]: http://en.wikipedia.org/wiki/Lint_(software)
[refactoring]: http://www.amazon.com/Refactoring-Improving-Design-Existing-Code/dp/0201485672/
