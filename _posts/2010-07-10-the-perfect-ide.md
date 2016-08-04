---
layout: post
title: The Perfect IDE
tags: Coder
date: 2010-07-10 13:35:00.000000000 -07:00
redirect_from: /2010/07/10/the-perfect-ide.html
---

I've been writing a bunch of code lately for an [Android](http://www.android.com) project I'm working on.  What this means is that I've been writing Java code in [Eclipse](http://www.eclipse.org).  The Java part isn't bad, though coming from C# and .NET there are a lot of things that I miss.  But that isn't what this is about ... this about IDEs, Integrated Development Environments.  I don't know if [Borland](http://en.wikipedia.org/wiki/Borland)'s Turbo products, [Turbo Pascal](http://en.wikipedia.org/wiki/Turbo_Pascal) being my introduction to the company, were the first ever IDEs, but they were probably pretty close.  Back in those days, one needed an IDE because computers could only run one program at a time ... so running an editor, then leaving it to compile, then running a debugger, etc was all a big pain.  Now, computers are never running just one program ... and even programs are doing multiple things at once.  My phone, right now, has a couple programs running on it with at least seven threads each.  But I digress ...

So we don't need IDEs anymore.  Why do we still have them?  Because opening one program that keeps track of all the minutia of writing code is a good thing.  It knows which files belong to the project so when one needs to build the project, it just takes one click (sometimes not even that) and it's done.  When there is an error in the build, one can simply click the error message and the offending place in the offending file is displayed for easy fixing.  There are all these little things that the IDE helps with that one simply can't get from a set of command-line SDK-style tools and an editor.

My problem with most IDEs is that you can't have just one.  I currently have five installed.  I have Visual Studio 2008 for working with older .NET projects.  I have [Visual Studio 2010](http://www.microsoft.com/visualstudio/) for working on newer .NET projects.  I have the built-in PowerShell Integrated Shell Environment for PowerShell scripting.  I have Eclipse for working on Android projects and I have [IntelliJ IDEA](http://www.jetbrains.com/idea/) because a friend recommended I check it out also for Android projects.  Why do I have to have all these different IDEs installed?  Because Visual Studio is best for .NET projects, Eclipse has the tools I need for Android, the PowerShell ISE is the only thing that has syntax highlighting for PowerShell.  Don't get me started on why I need two copies of Visual Studio ... that's just extra stupid.  Could I use Eclipse for .NET projects?  Maybe, but the amount of work it would take to make that happen is just scary.  I'm not even sure that coercing Visual Studio into doing Android development is even possible.  IntelliJ seems to only be an IDE for Java, so using it for anything else is out.

So, essentially, the Perfect IDE means I only have to have one.  With it, I can write code for any language and platform and have all the tools I expect to have at my disposal.  Let's go over those, shall we?

* Editor
    * Font selection
    * Color syntax highlighting
    * Flexible formatting support (brace style, etc) where the editor automatically formats my code as I type
    * Intelligent completion (like IntelliSense in Visual Studio)
    * Search and replace including regular expressions
    * Refactoring tools
* Project support
    * Some way of knowing what files, objects, etc are in the project
    * Easy navigation to any project item
* Build
    * One-click build (or background building if it works reliably)
    * Error integration
* Debug
    * Breakpoints
    * Watch variables
    * Expression evaluation
* Window manager
    * Support multiple top-level windows
    * Allows me to move any view group to any window
    * Allows me to dock any view group to one particular area of a window
    * Views can include a file in the editor, project explorer, etc.

This is just the **bare minimum** of what I expect from an IDE because this is what most IDEs get mostly right. Some additional features that most IDEs do not get right or don't offer:

* Source control integration
    * Most IDEs have support for one or two source control packages, but they rarely are the one I'm using at the time.
* Build integration
    * Most IDEs have their own built-in build tool, but they rarely make it easy to support advanced build tools such as Ant or MSBuild.  IDEs should get out of the build business and use these advanced build tools by generating the required files and letting the build tool do the work.
        * Visual Studio gets this kind of right, but there's a bunch of stuff that's done behind the scenes that makes it worthless if you try to use their generated stuff outside the IDE.
        * Eclipse supposedly gets this right in that it uses Ant internally, but I didn't see any Ant build files until I generated them myself.
* Support for multiple languages and platforms
    * How hard is this?!?  The process of editing, compiling and debugging has been set in stone for decades.  Heck, even the syntax of most languages is becoming more and more similar ... there's C-derived syntax and everything else.
    * Make adding new languages drop-dead easy.  I've tried to add just color-syntax highlighting for PowerShell to a couple IDEs and it is a huge pain, if possible at all.
* XML support
    * First-class support just like any other language with syntax highlighting, formatting support and intelligent completion.
    * Data visualization for well-known formats.
* UI generation tools
    * This is something I can understand most IDEs not having support for a bunch of platforms because developing UI is very different even within a platform such as Windows, let alone across platforms.  Though with the advent of [XAML](http://en.wikipedia.org/wiki/Extensible_Application_Markup_Language) and similar technologies, I see convergence happening here too in the coming years.

So that's my laundry list.  How is this achieved?  That's a great question.  I'm glad you asked.

IDEs need to realize their main job is window and plugin management.  The IDE is simply there to mediate the interactions between various plugins that do the heavy lifting and provide windows that let the developer see what the plugins are doing for them.  I think what keeps IDE makers from seeing this is that every IDE includes, by definition, an editor.  So they write an editor first and then start tacking on all this other functionality and then they have an IDE.  Yes, even the editor should just be a plugin.  And I shouldn't have to be stuck with just one editor plugin.  Maybe I want one for XML and a different one for Java and yet another for C#.  I'm a developer, I'm choosy like that!  Multiple installed plugins for all services should be the norm, not the exception.

Maybe I'm asking for too much.  Maybe what we'd end up with if someone actually made what I'm asking for is something similar to Eclipse with [eleven different versions](http://www.eclipse.org/downloads/) to choose from and no help for someone just wanting to get some work done.  Maybe we'd end up with crazy, incomprehensible configuration dialogs (though pretty much every IDE has at least one of those already).  I think it is possible though.  I really believe it can be done right given the right vision.

Someone want to prove me right?
