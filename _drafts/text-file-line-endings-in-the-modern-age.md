---
layout: post
title: Text File Line Endings in the Modern Age
tags: Coder
---

I've been contributing what time and cognitive effort I can to the [Rubocop][rubocop] project and, consequently, also the [Ruby Style Guide][style]. [An interesting discussion][discussion] came up around the admonition in the style guide to [use Unix-style line endings in all Ruby source code files][endings]. I wanted to expand my thoughts and record my findings because I did spend probably too much time on this today ...

Let's define the problem. As we all know, we store data in things we call "files". Files are just a big long series of data broken up into chunks we call, punnily enough, bytes. We like this because it keeps things simple. In order to store meaningful information in a file, we need to create a system of encoding that information into bytes. There are lots of different encoding systems for different types of data. One of the most common types of data humans store is text.

There have been a few different ways of encoding text. Some of the most popular forms are [EBCDIC][ebcdic], [ASCII][ascii] and the various methods described by the [Unicode standard][unicode]. These encoding systems convert characters into bytes. What they also do is describe a system of "control characters" which are things like "backspace" or "tab" that don't describe characters that one would find in a human language, but help devices reading the text present the text properly visually or describe the structure of the text. There are a couple characters that were specifically used with [Teletype machines][teletype] for sending the carriage (the thing that puts a letter on the paper) back to the start of the line and advancing, or feeding, the paper up one line. These two control characters are called "carriage return" or CR and "line feed" or LF, respectively. So when we advanced from Teletypes and started storing text files, we simply took the series of bytes that we would have sent to the Teletype and put them into a file. We like this because it keeps things simple.

It is important to note that as far as the file is concerned, there is no structure, just a series of bytes. It is only our encoding that ascribes meaning to those bytes. Along the way we noticed that there are common operations that we perform on text files and because we work with text files so often it is helpful for the operating system to know at some level how to handle text. *This is the beginning of the problem.* The most common operation that one does on text files is look at it as a series of lines that each have a beginning and end. But because a beginning always immediately follows an end, we really only need to know where a line ends and does another line come after it. So because we want the operating system to handle these operations

[ascii]: http://en.wikipedia.org/wiki/Ascii
[discussion]: https://github.com/bbatsov/rubocop/issues/250
[ebcdic]: http://en.wikipedia.org/wiki/Ebcdic
[endings]: https://github.com/bbatsov/ruby-style-guide#source-code-layout
[rubocop]: https://github.com/bbatsov/rubocop
[style]: https://github.com/bbatsov/ruby-style-guide
[teletype]: http://en.wikipedia.org/wiki/Teletype_Model_33
[unicode]: http://en.wikipedia.org/wiki/Unicode
